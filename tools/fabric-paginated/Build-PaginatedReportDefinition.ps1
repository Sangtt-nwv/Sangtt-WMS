[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$RdlPath = "docs/fabric-paginated/NWVVASSalesTaxStatement_FirstPass.rdl",

    [Parameter(Mandatory = $false)]
    [string]$DisplayName = "NWVVASSalesTaxStatement_FirstPass",

    [Parameter(Mandatory = $false)]
    [string]$Description = "First-pass paginated scaffold for NWVVASSalesTaxStatement based on demo_TaxInOutHeader and demo_TaxInOutTmp.",

    [Parameter(Mandatory = $false)]
    [string]$OutputDir = "docs/fabric-paginated/out",

    [Parameter(Mandatory = $false)]
    [string]$SqlServer,

    [Parameter(Mandatory = $false)]
    [string]$SqlDatabase
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

function Get-RdlWithValidParameterLayout {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SourceRdlPath
    )

    $repairScriptPath = Resolve-Path -LiteralPath "docs/fabric-paginated/Repair-RdlParameterLayout.ps1"
    $fixedRdlPath = Join-Path $OutputDir ("{0}.layout-fixed.rdl" -f $DisplayName)

    & $repairScriptPath `
        -RdlPath $SourceRdlPath `
        -OutputPath $fixedRdlPath `
        -Columns 2 | Out-Null

    return (Resolve-Path -LiteralPath $fixedRdlPath).Path
}

$resolvedRdlPath = Resolve-Path -LiteralPath $RdlPath
$effectiveRdlPath = Get-RdlWithValidParameterLayout -SourceRdlPath $resolvedRdlPath.Path
$rdlContent = Read-TextWithBomDetection -Path $effectiveRdlPath

if ($SqlServer -or $SqlDatabase) {
    if (-not $SqlServer -or -not $SqlDatabase) {
        throw "When overriding the SQL connection, provide both -SqlServer and -SqlDatabase."
    }

    $rdlContent = $rdlContent.Replace("YOUR_FABRIC_SQL_ENDPOINT", $SqlServer)
    $rdlContent = $rdlContent.Replace("YOUR_SQL_DATABASE", $SqlDatabase)
}

# Fail fast on malformed XML before building payloads for Fabric.
[xml]$null = $rdlContent

$rdlBase64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($rdlContent))
$rdlPartPath = "{0}.rdl" -f $DisplayName

$definition = [ordered]@{
    format = "PaginatedReportDefinition"
    parts  = @(
        [ordered]@{
            path        = $rdlPartPath
            payload     = $rdlBase64
            payloadType = "InlineBase64"
        }
    )
}

$createRequest = [ordered]@{
    displayName = $DisplayName
    description = $Description
    type        = "PaginatedReport"
    definition  = $definition
}

$updateDefinitionRequest = [ordered]@{
    definition = $definition
}

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

$definitionPath = Join-Path $OutputDir ("{0}.definition.json" -f $DisplayName)
$createPath = Join-Path $OutputDir ("{0}.create-item.request.json" -f $DisplayName)
$updatePath = Join-Path $OutputDir ("{0}.update-definition.request.json" -f $DisplayName)

Write-Utf8Text -Path $definitionPath -Content ($definition | ConvertTo-Json -Depth 10)
Write-Utf8Text -Path $createPath -Content ($createRequest | ConvertTo-Json -Depth 10)
Write-Utf8Text -Path $updatePath -Content ($updateDefinitionRequest | ConvertTo-Json -Depth 10)

[pscustomobject]@{
    RdlPath                        = $effectiveRdlPath
    DisplayName                    = $DisplayName
    OutputDir                      = (Resolve-Path -LiteralPath $OutputDir).Path
    SqlServer                      = $SqlServer
    SqlDatabase                    = $SqlDatabase
    DefinitionPath                 = $definitionPath
    CreateItemRequestPath          = $createPath
    UpdateItemDefinitionRequestPath = $updatePath
}
