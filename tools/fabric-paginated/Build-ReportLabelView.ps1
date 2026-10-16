[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ReportName,

    [Parameter(Mandatory = $true)]
    [string[]]$LabelIds,

    [Parameter(Mandatory = $false)]
    [string]$LabelRoot = "Metadata/NWVVAS/NWVVAS/AxLabelFile/LabelResources",

    [Parameter(Mandatory = $false)]
    [string]$LabelFileId = "NWV",

    [Parameter(Mandatory = $false)]
    [string]$OutputPath = "docs/fabric-paginated/NWVVASSalesTaxStatement_Labels.sql"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$languages = @("en-US", "en-ZA", "en-SG")
$rows = [System.Collections.Generic.List[string]]::new()

foreach ($language in $languages) {
    $labelPath = Join-Path $LabelRoot "$language/$LabelFileId.$language.label.txt"
    if (-not (Test-Path -LiteralPath $labelPath)) {
        throw "Label resource not found: $labelPath"
    }

    $labels = @{}
    foreach ($line in Get-Content -LiteralPath $labelPath) {
        if ($line -match '^(@[^=]+)=(.*)$') {
            $labels[$matches[1]] = $matches[2].TrimEnd()
        }
    }

    foreach ($labelId in $LabelIds | Sort-Object -Unique) {
        if (-not $labels.ContainsKey($labelId)) {
            throw "Label '$labelId' was not found in '$labelPath'."
        }

        $reportSql = $ReportName.Replace("'", "''")
        $labelIdSql = $labelId.Replace("'", "''")
        $languageSql = $language.Replace("'", "''")
        $labelTextSql = ([string]$labels[$labelId]).Replace("'", "''")
        $rows.Add("        ('$reportSql', '$labelIdSql', '$languageSql', '$labelTextSql')")
    }
}

$sql = @"
-- Generated from D365FO label resources by Build-ReportLabelView.ps1.
-- Regenerate this file when a referenced NWV label changes.

CREATE OR ALTER VIEW dbo.vw_nwvvas_report_label
AS
SELECT
    CAST(v.ReportName AS varchar(100)) AS ReportName,
    CAST(v.LabelId AS varchar(50)) AS LabelId,
    CAST(v.LanguageCode AS varchar(10)) AS LanguageCode,
    CAST(v.LabelText AS varchar(1000)) AS LabelText
FROM
(
    VALUES
$($rows -join ",`r`n")
) AS v(ReportName, LabelId, LanguageCode, LabelText);
GO
"@

$outputDirectory = Split-Path -Parent $OutputPath
if ($outputDirectory) {
    New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null
}

Set-Content -LiteralPath $OutputPath -Value $sql -Encoding utf8

[pscustomobject]@{
    ReportName = $ReportName
    LabelCount = ($LabelIds | Sort-Object -Unique).Count
    LanguageCount = $languages.Count
    RowCount = $rows.Count
    OutputPath = (Resolve-Path -LiteralPath $OutputPath).Path
}
