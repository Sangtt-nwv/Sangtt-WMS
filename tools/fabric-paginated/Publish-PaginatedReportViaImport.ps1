[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$WorkspaceId,

    [Parameter(Mandatory = $false)]
    [string]$RdlPath = "docs/fabric-paginated/NWVVASSalesTaxStatement_FirstPass.rdl",

    [Parameter(Mandatory = $false)]
    [string]$DisplayName = "NWVVASSalesTaxStatement_FirstPass",

    [Parameter(Mandatory = $false)]
    [string]$SqlServer,

    [Parameter(Mandatory = $false)]
    [string]$SqlDatabase,

    [Parameter(Mandatory = $false)]
    [string]$DatasourceName = "FabricSqlEndpoint",

    [Parameter(Mandatory = $false)]
    [switch]$UpdateDatasourceAfterImport,

    [Parameter(Mandatory = $false)]
    [switch]$DryRun,

    [Parameter(Mandatory = $false)]
    [int]$PollSeconds = 5,

    [Parameter(Mandatory = $false)]
    [int]$MaxPollCount = 120
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Read-TextWithBomDetection {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $streamReader = New-Object System.IO.StreamReader($Path, $true)
    try {
        return $streamReader.ReadToEnd()
    }
    finally {
        $streamReader.Dispose()
    }
}

function Write-Utf8Text {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Content
    )

    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $Content, $utf8NoBom)
}

function Get-PowerBIToken {
    if (Get-Command Get-AzAccessToken -ErrorAction SilentlyContinue) {
        try {
            $token = Get-AzAccessToken -ResourceUrl "https://analysis.windows.net/powerbi/api"
            if ($token.Token) {
                return $token.Token
            }
        }
        catch {
            Write-Verbose "Get-AzAccessToken failed: $($_.Exception.Message)"
        }
    }

    if (Get-Command az -ErrorAction SilentlyContinue) {
        try {
            $token = az account get-access-token --resource https://analysis.windows.net/powerbi/api --query accessToken -o tsv 2>$null
            if ($LASTEXITCODE -eq 0 -and $token) {
                return $token.Trim()
            }
        }
        catch {
            Write-Verbose "az account get-access-token failed: $($_.Exception.Message)"
        }
    }

    throw "Unable to acquire a Power BI access token. Run Connect-AzAccount or az login first."
}

function Invoke-PowerBIJson {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet("GET", "POST")]
        [string]$Method,

        [Parameter(Mandatory = $true)]
        [string]$Url,

        [Parameter(Mandatory = $true)]
        [string]$BearerToken,

        [Parameter(Mandatory = $false)]
        [object]$Body
    )

    $headers = @{
        Authorization = "Bearer $BearerToken"
    }

    $params = @{
        Method          = $Method
        Uri             = $Url
        Headers         = $headers
        UseBasicParsing = $true
        ErrorAction     = "Stop"
    }

    if ($Body) {
        $params.ContentType = "application/json"
        $params.Body = ($Body | ConvertTo-Json -Depth 20)
    }

    try {
        $response = Invoke-WebRequest @params
    }
    catch {
        if ($_.Exception.Response) {
            $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
            $errorBody = $reader.ReadToEnd()
            throw "Power BI request failed [$Method $Url]: $errorBody"
        }
        throw
    }

    $content = $null
    if ($response.Content) {
        try {
            $content = $response.Content | ConvertFrom-Json
        }
        catch {
            $content = $response.Content
        }
    }

    [pscustomobject]@{
        StatusCode = [int]$response.StatusCode
        Headers    = $response.Headers
        Content    = $content
    }
}

function Get-ReportDatasource {
    param(
        [Parameter(Mandatory = $true)]
        [string]$WorkspaceId,

        [Parameter(Mandatory = $true)]
        [string]$ReportId,

        [Parameter(Mandatory = $true)]
        [string]$BearerToken,

        [Parameter(Mandatory = $true)]
        [string]$DatasourceName
    )

    $response = Invoke-PowerBIJson `
        -Method GET `
        -Url "https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/reports/$ReportId/datasources" `
        -BearerToken $BearerToken

    $datasource = @($response.Content.value | Where-Object { $_.name -eq $DatasourceName }) | Select-Object -First 1
    return $datasource
}

function Get-GatewayDatasourceStatus {
    param(
        [Parameter(Mandatory = $true)]
        [string]$GatewayId,

        [Parameter(Mandatory = $true)]
        [string]$DatasourceId,

        [Parameter(Mandatory = $true)]
        [string]$BearerToken
    )

    try {
        $response = Invoke-PowerBIJson `
            -Method GET `
            -Url "https://api.powerbi.com/v1.0/myorg/gateways/$GatewayId/datasources/$DatasourceId/status" `
            -BearerToken $BearerToken

        return [pscustomobject]@{
            Ok      = $true
            Response = $response.Content
            ErrorCode = $null
            ErrorBody = $null
        }
    }
    catch {
        $message = $_.Exception.Message
        $errorCode = $null

        if ($message -match '"code"\s*:\s*"([^"]+)"') {
            $errorCode = $Matches[1]
        }

        return [pscustomobject]@{
            Ok       = $false
            Response = $null
            ErrorCode = $errorCode
            ErrorBody = $message
        }
    }
}

function Get-HydratedRdlPath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SourceRdlPath
    )

    $repairScriptPath = Resolve-Path -LiteralPath "docs/fabric-paginated/Repair-RdlParameterLayout.ps1"

    if (-not $SqlServer -and -not $SqlDatabase) {
        $fixedRdlPath = Join-Path "docs/fabric-paginated/out" ("{0}.layout-fixed.rdl" -f $DisplayName)
        & $repairScriptPath `
            -RdlPath $SourceRdlPath `
            -OutputPath $fixedRdlPath `
            -Columns 2 | Out-Null

        return (Resolve-Path -LiteralPath $fixedRdlPath).Path
    }

    if (-not $SqlServer -or -not $SqlDatabase) {
        throw "Provide both -SqlServer and -SqlDatabase when overriding the RDL connection."
    }

    $buildScriptPath = Resolve-Path -LiteralPath "tools/fabric-paginated/Build-PaginatedReportDefinition.ps1"
    $buildResult = & $buildScriptPath `
        -RdlPath $SourceRdlPath `
        -DisplayName $DisplayName `
        -SqlServer $SqlServer `
        -SqlDatabase $SqlDatabase `
        -OutputDir "docs/fabric-paginated/out"

    $sourceXml = Read-TextWithBomDetection -Path $buildResult.RdlPath
    $sourceXml = $sourceXml.Replace("YOUR_FABRIC_SQL_ENDPOINT", $SqlServer)
    $sourceXml = $sourceXml.Replace("YOUR_SQL_DATABASE", $SqlDatabase)

    $hydratedPath = Join-Path "docs/fabric-paginated/out" ("{0}.hydrated.rdl" -f $DisplayName)
    Write-Utf8Text -Path $hydratedPath -Content $sourceXml

    $fixedHydratedPath = Join-Path "docs/fabric-paginated/out" ("{0}.hydrated.layout-fixed.rdl" -f $DisplayName)
    & $repairScriptPath `
        -RdlPath $hydratedPath `
        -OutputPath $fixedHydratedPath `
        -Columns 2 | Out-Null

    return (Resolve-Path -LiteralPath $fixedHydratedPath).Path
}

function Wait-ImportCompletion {
    param(
        [Parameter(Mandatory = $true)]
        [string]$WorkspaceId,

        [Parameter(Mandatory = $true)]
        [string]$ImportId,

        [Parameter(Mandatory = $true)]
        [string]$BearerToken
    )

    for ($poll = 1; $poll -le $MaxPollCount; $poll++) {
        $import = Invoke-PowerBIJson -Method GET -Url "https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/imports/$ImportId" -BearerToken $BearerToken
        $state = $import.Content.importState

        if ($state -eq "Succeeded") {
            return $import.Content
        }

        if ($state -eq "Failed") {
            $errorJson = if ($import.Content.error) { $import.Content.error | ConvertTo-Json -Depth 10 -Compress } else { "unknown" }
            throw "Power BI import failed. ImportId=$ImportId Error=$errorJson"
        }

        Start-Sleep -Seconds $PollSeconds
    }

    throw "Power BI import $ImportId did not complete within $MaxPollCount polls."
}

$resolvedRdlPath = Get-HydratedRdlPath -SourceRdlPath $RdlPath
$datasetDisplayName = "$DisplayName.rdl"

$dryRunMode = "create"
$nameConflict = "Abort"

if (-not $DryRun) {
    $bearerToken = Get-PowerBIToken
    $reportsResponse = Invoke-PowerBIJson -Method GET -Url "https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/reports" -BearerToken $bearerToken
    $existing = @($reportsResponse.Content.value | Where-Object { $_.name -eq $DisplayName -and $_.reportType -eq "PaginatedReport" })

    if ($existing.Count -gt 1) {
        throw "Multiple paginated reports named '$DisplayName' already exist in workspace '$WorkspaceId'."
    }

    if ($existing.Count -eq 1) {
        $dryRunMode = "overwrite"
        $nameConflict = "Overwrite"
    }
}

$importUrl = "https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/imports?datasetDisplayName=$([uri]::EscapeDataString($datasetDisplayName))&nameConflict=$nameConflict"

if ($DryRun) {
    [pscustomobject]@{
        WorkspaceId               = $WorkspaceId
        DisplayName               = $DisplayName
        DatasetDisplayName        = $datasetDisplayName
        Mode                      = $dryRunMode
        NameConflict              = $nameConflict
        RdlPath                   = $resolvedRdlPath
        SqlServer                 = $SqlServer
        SqlDatabase               = $SqlDatabase
        ImportEndpoint            = $importUrl
        UpdateDatasourceAfterImport = [bool]$UpdateDatasourceAfterImport
    }
    return
}

$multipart = New-Object System.Net.Http.MultipartFormDataContent
$fileBytes = [System.IO.File]::ReadAllBytes($resolvedRdlPath)
$fileContent = New-Object System.Net.Http.ByteArrayContent(, $fileBytes)
$fileContent.Headers.ContentType = [System.Net.Http.Headers.MediaTypeHeaderValue]::Parse("application/rdl")
$multipart.Add($fileContent, "file", $datasetDisplayName)

$httpClient = New-Object System.Net.Http.HttpClient
$httpClient.DefaultRequestHeaders.Authorization = New-Object System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", $bearerToken)

try {
    $response = $httpClient.PostAsync($importUrl, $multipart).GetAwaiter().GetResult()
    $responseBody = $response.Content.ReadAsStringAsync().GetAwaiter().GetResult()
}
finally {
    $httpClient.Dispose()
    $multipart.Dispose()
    $fileContent.Dispose()
}

if (-not $response.IsSuccessStatusCode) {
    throw "Power BI import request failed [$($response.StatusCode)]: $responseBody"
}

$importResult = $responseBody | ConvertFrom-Json
$completedImport = Wait-ImportCompletion -WorkspaceId $WorkspaceId -ImportId $importResult.id -BearerToken $bearerToken

$report = @($completedImport.reports | Where-Object { $_.reportType -eq "PaginatedReport" }) | Select-Object -First 1
if (-not $report) {
    throw "Import succeeded but no PaginatedReport report object was returned."
}

$datasourceUpdateResponse = $null
if ($UpdateDatasourceAfterImport -and $SqlServer -and $SqlDatabase) {
    $datasourceUpdateBody = @{
        updateDetails = @(
            @{
                datasourceName    = $DatasourceName
                connectionDetails = @{
                    server   = $SqlServer
                    database = $SqlDatabase
                }
            }
        )
    }

    $datasourceUpdateResponse = Invoke-PowerBIJson -Method POST -Url "https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/reports/$($report.id)/Default.UpdateDatasources" -BearerToken $bearerToken -Body $datasourceUpdateBody
}

$datasource = Get-ReportDatasource `
    -WorkspaceId $WorkspaceId `
    -ReportId $report.id `
    -BearerToken $bearerToken `
    -DatasourceName $DatasourceName

$datasourceStatus = $null
if ($datasource -and $datasource.gatewayId -and $datasource.datasourceId) {
    $datasourceStatus = Get-GatewayDatasourceStatus `
        -GatewayId $datasource.gatewayId `
        -DatasourceId $datasource.datasourceId `
        -BearerToken $bearerToken
}

[pscustomobject]@{
    Action                    = if ($nameConflict -eq "Overwrite") { "Overwritten" } else { "Created" }
    WorkspaceId               = $WorkspaceId
    ImportId                  = $completedImport.id
    ReportId                  = $report.id
    ReportName                = $report.name
    ReportType                = $report.reportType
    WebUrl                    = $report.webUrl
    DatasetDisplayName        = $datasetDisplayName
    SqlServer                 = $SqlServer
    SqlDatabase               = $SqlDatabase
    DatasourceUpdateStatus    = if ($datasourceUpdateResponse) { $datasourceUpdateResponse.StatusCode } else { $null }
    DatasourceId              = if ($datasource) { $datasource.datasourceId } else { $null }
    GatewayId                 = if ($datasource) { $datasource.gatewayId } else { $null }
    CredentialType            = if ($datasourceStatus -and $datasourceStatus.Ok) { "Configured" } elseif ($datasourceStatus) { $datasourceStatus.ErrorCode } else { $null }
    DatasourceStatusChecked   = [bool]$datasourceStatus
    DatasourceStatusOk        = if ($datasourceStatus) { [bool]$datasourceStatus.Ok } else { $null }
    DatasourceStatusErrorBody = if ($datasourceStatus -and -not $datasourceStatus.Ok) { $datasourceStatus.ErrorBody } else { $null }
}
