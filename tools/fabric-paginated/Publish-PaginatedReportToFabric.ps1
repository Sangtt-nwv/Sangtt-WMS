[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$WorkspaceId,

    [Parameter(Mandatory = $false)]
    [string]$DisplayName = "NWVVASSalesTaxStatement_FirstPass",

    [Parameter(Mandatory = $false)]
    [string]$Description = "First-pass paginated scaffold for NWVVASSalesTaxStatement based on demo_TaxInOutHeader and demo_TaxInOutTmp.",

    [Parameter(Mandatory = $false)]
    [string]$RdlPath = "docs/fabric-paginated/NWVVASSalesTaxStatement_FirstPass.rdl",

    [Parameter(Mandatory = $false)]
    [string]$OutputDir = "docs/fabric-paginated/out",

    [Parameter(Mandatory = $false)]
    [string]$SqlServer,

    [Parameter(Mandatory = $false)]
    [string]$SqlDatabase,

    [Parameter(Mandatory = $false)]
    [string]$PaginatedReportId,

    [Parameter(Mandatory = $false)]
    [string]$ExistingReportName,

    [Parameter(Mandatory = $false)]
    [switch]$CreateOnly,

    [Parameter(Mandatory = $false)]
    [switch]$UpdateIfExists,

    [Parameter(Mandatory = $false)]
    [switch]$DryRun,

    [Parameter(Mandatory = $false)]
    [int]$PollSeconds = 5,

    [Parameter(Mandatory = $false)]
    [int]$MaxPollCount = 120
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$script:FabricResource = "https://api.fabric.microsoft.com"
$script:ApiBase = "https://api.fabric.microsoft.com/v1"

function Get-FabricAccessToken {
    if (Get-Command Get-AzAccessToken -ErrorAction SilentlyContinue) {
        try {
            $token = Get-AzAccessToken -ResourceUrl $script:FabricResource
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
            $token = az account get-access-token --resource $script:FabricResource --query accessToken -o tsv 2>$null
            if ($LASTEXITCODE -eq 0 -and $token) {
                return $token.Trim()
            }
        }
        catch {
            Write-Verbose "az account get-access-token failed: $($_.Exception.Message)"
        }
    }

    throw "Unable to acquire a Fabric access token. Run Connect-AzAccount or az login first."
}

function Invoke-FabricRequest {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet("GET", "POST", "PATCH")]
        [string]$Method,

        [Parameter(Mandatory = $true)]
        [string]$Url,

        [Parameter(Mandatory = $false)]
        [string]$BearerToken,

        [Parameter(Mandatory = $false)]
        [object]$Body
    )

    $headers = @{
        Authorization = "Bearer $BearerToken"
    }

    $invokeParams = @{
        Method          = $Method
        Uri             = $Url
        Headers         = $headers
        UseBasicParsing = $true
        ErrorAction     = "Stop"
    }

    if ($Body) {
        $invokeParams.ContentType = "application/json"
        $invokeParams.Body = ($Body | ConvertTo-Json -Depth 20)
    }

    try {
        $response = Invoke-WebRequest @invokeParams
    }
    catch {
        if ($_.Exception.Response) {
            $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
            $errorBody = $reader.ReadToEnd()
            throw "Fabric request failed [$Method $Url]: $errorBody"
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
        RawContent = $response.Content
    }
}

function Wait-FabricOperation {
    param(
        [Parameter(Mandatory = $true)]
        [string]$OperationId,

        [Parameter(Mandatory = $true)]
        [string]$BearerToken
    )

    for ($poll = 1; $poll -le $MaxPollCount; $poll++) {
        $state = Invoke-FabricRequest -Method GET -Url "$script:ApiBase/operations/$OperationId" -BearerToken $BearerToken
        $status = $state.Content.status

        if ($status -eq "Succeeded") {
            return Invoke-FabricRequest -Method GET -Url "$script:ApiBase/operations/$OperationId/result" -BearerToken $BearerToken
        }

        if ($status -eq "Failed" -or $status -eq "Cancelled") {
            throw "Fabric LRO $OperationId ended with status '$status'."
        }

        Start-Sleep -Seconds $PollSeconds
    }

    throw "Fabric LRO $OperationId did not complete within $MaxPollCount polls."
}

function Resolve-PaginatedReportByName {
    param(
        [Parameter(Mandatory = $true)]
        [string]$WorkspaceId,

        [Parameter(Mandatory = $true)]
        [string]$ReportName,

        [Parameter(Mandatory = $true)]
        [string]$BearerToken
    )

    $listResponse = Invoke-FabricRequest -Method GET -Url "$script:ApiBase/workspaces/$WorkspaceId/paginatedReports" -BearerToken $BearerToken
    $matches = @($listResponse.Content.value | Where-Object { $_.displayName -eq $ReportName })

    if ($matches.Count -gt 1) {
        throw "Multiple paginated reports named '$ReportName' were found in workspace '$WorkspaceId'. Provide -PaginatedReportId explicitly."
    }

    if ($matches.Count -eq 1) {
        return $matches[0]
    }

    return $null
}

$buildScriptPath = Resolve-Path -LiteralPath "tools/fabric-paginated/Build-PaginatedReportDefinition.ps1"
$buildResult = & $buildScriptPath `
    -RdlPath $RdlPath `
    -DisplayName $DisplayName `
    -Description $Description `
    -OutputDir $OutputDir `
    -SqlServer $SqlServer `
    -SqlDatabase $SqlDatabase

$createRequest = Get-Content -LiteralPath $buildResult.CreateItemRequestPath -Raw | ConvertFrom-Json
$updateRequest = Get-Content -LiteralPath $buildResult.UpdateItemDefinitionRequestPath -Raw | ConvertFrom-Json

if ($DryRun) {
    [pscustomobject]@{
        Mode                        = if ($PaginatedReportId -or $ExistingReportName -or $UpdateIfExists) { "resolve-or-update" } else { "create" }
        WorkspaceId                 = $WorkspaceId
        DisplayName                 = $DisplayName
        Description                 = $Description
        SqlServer                   = $SqlServer
        SqlDatabase                 = $SqlDatabase
        CreateEndpoint              = "$script:ApiBase/workspaces/$WorkspaceId/items"
        ListEndpoint                = "$script:ApiBase/workspaces/$WorkspaceId/paginatedReports"
        UpdateDefinitionEndpoint    = if ($PaginatedReportId) { "$script:ApiBase/workspaces/$WorkspaceId/items/$PaginatedReportId/updateDefinition" } else { "<resolved at runtime>" }
        UpdatePropertiesEndpoint    = if ($PaginatedReportId) { "$script:ApiBase/workspaces/$WorkspaceId/paginatedReports/$PaginatedReportId" } else { "<resolved at runtime>" }
        CreateItemRequestPath       = $buildResult.CreateItemRequestPath
        UpdateDefinitionRequestPath = $buildResult.UpdateItemDefinitionRequestPath
    }
    return
}

$bearerToken = Get-FabricAccessToken

$resolvedReport = $null
if ($PaginatedReportId) {
    $resolvedReport = [pscustomobject]@{
        id          = $PaginatedReportId
        displayName = $DisplayName
    }
}
elseif ($ExistingReportName) {
    $resolvedReport = Resolve-PaginatedReportByName -WorkspaceId $WorkspaceId -ReportName $ExistingReportName -BearerToken $bearerToken
}
elseif ($UpdateIfExists) {
    $resolvedReport = Resolve-PaginatedReportByName -WorkspaceId $WorkspaceId -ReportName $DisplayName -BearerToken $bearerToken
}

if ($resolvedReport -and $CreateOnly) {
    throw "A report already exists but -CreateOnly was specified."
}

if (-not $resolvedReport) {
    $createResponse = Invoke-FabricRequest -Method POST -Url "$script:ApiBase/workspaces/$WorkspaceId/items" -BearerToken $bearerToken -Body $createRequest

    if ($createResponse.StatusCode -eq 202) {
        $operationId = $createResponse.Headers["x-ms-operation-id"]
        if (-not $operationId) {
            throw "Create returned 202 Accepted but did not return x-ms-operation-id."
        }

        $createResponse = Wait-FabricOperation -OperationId $operationId -BearerToken $bearerToken
    }

    return [pscustomobject]@{
        Action          = "Created"
        WorkspaceId     = $WorkspaceId
        DisplayName     = $DisplayName
        ResponseStatus  = $createResponse.StatusCode
        Result          = $createResponse.Content
        DefinitionPath  = $buildResult.DefinitionPath
        RequestBodyPath = $buildResult.CreateItemRequestPath
    }
}

$itemId = $resolvedReport.id
$updateResponse = Invoke-FabricRequest -Method POST -Url "$script:ApiBase/workspaces/$WorkspaceId/items/$itemId/updateDefinition" -BearerToken $bearerToken -Body $updateRequest

if ($updateResponse.StatusCode -eq 202) {
    $operationId = $updateResponse.Headers["x-ms-operation-id"]
    if (-not $operationId) {
        throw "UpdateDefinition returned 202 Accepted but did not return x-ms-operation-id."
    }

    $updateResponse = Wait-FabricOperation -OperationId $operationId -BearerToken $bearerToken
}

$patchBody = @{
    displayName = $DisplayName
    description = $Description
}
$propertyResponse = Invoke-FabricRequest -Method PATCH -Url "$script:ApiBase/workspaces/$WorkspaceId/paginatedReports/$itemId" -BearerToken $bearerToken -Body $patchBody

[pscustomobject]@{
    Action                  = "Updated"
    WorkspaceId             = $WorkspaceId
    PaginatedReportId       = $itemId
    DisplayName             = $DisplayName
    UpdateDefinitionStatus  = $updateResponse.StatusCode
    UpdatePropertiesStatus  = $propertyResponse.StatusCode
    DefinitionPath          = $buildResult.DefinitionPath
    RequestBodyPath         = $buildResult.UpdateItemDefinitionRequestPath
    Result                  = $propertyResponse.Content
}
