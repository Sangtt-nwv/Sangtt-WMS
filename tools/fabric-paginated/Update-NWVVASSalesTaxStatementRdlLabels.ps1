[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$RdlPath = "docs/fabric-paginated/NWVVASSalesTaxStatement_ParityScaffold.rdl"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-LabelLookupExpression {
    param([Parameter(Mandatory = $true)][string]$LabelId)

    return "Lookup(`"$LabelId`", Fields!LabelId.Value, Fields!LabelText.Value, `"ReportLabels`")"
}

$simpleLabels = [ordered]@{
    TbTaxCodeLine       = "@NWV106002"
    TbCompanyNameLine   = "@NWV106001"
    TbFormCode          = "@NWV126001"
    TbFormDecree        = "@NWV126002"
    TbReportSubtitle    = "@NWV126004"
    TbHdrStt            = "@NWV106003"
    TbHdrHoaDon         = "@NWV126006"
    TbHdrTenNM          = "@NWV106015"
    TbHdrMstNM          = "@NWV106016"
    TbHdrDienGiai       = "@NWV1000062"
    TbHdrDoanhSo        = "@NWV106010"
    TbHdrThuesSuat      = "@NWV106011"
    TbHdrThueGTGT       = "@NWV106012"
    TbHdrGhiChu         = "@NWV106013"
    TbSubMauHD          = "@NWV127010"
    TbSubKyHieu         = "@NWV106004"
    TbSubSoHD           = "@NWV106005"
    TbSubNgay           = "@NWV106006"
    TbGrpSubLabel       = "@NWV126016"
    TbGrandTotalLabel   = "@NWV126016"
    TbSummaryBaseAmt    = "@NWV126013"
    TbSummaryTaxAmt     = "@NWV126014"
    TbSigNote           = "@NWV1000015"
}

[xml]$xml = Get-Content -LiteralPath $RdlPath -Raw

function Set-FirstTextRunValue {
    param(
        [Parameter(Mandatory = $true)][string]$TextboxName,
        [Parameter(Mandatory = $true)][string]$Expression
    )

    $textbox = $xml.SelectSingleNode("//*[local-name()='Textbox' and @Name='$TextboxName']")
    if (-not $textbox) {
        throw "Textbox '$TextboxName' was not found in '$RdlPath'."
    }

    $value = $textbox.SelectSingleNode(".//*[local-name()='TextRun']/*[local-name()='Value']")
    if (-not $value) {
        throw "Textbox '$TextboxName' has no TextRun Value."
    }

    $value.InnerText = $Expression
}

foreach ($entry in $simpleLabels.GetEnumerator()) {
    Set-FirstTextRunValue -TextboxName $entry.Key -Expression ("=" + (Get-LabelLookupExpression $entry.Value))
}

$unit = Get-LabelLookupExpression "@NWV106014"
Set-FirstTextRunValue -TextboxName "TbUnitLabel" -Expression "=$unit & `": `" & First(Fields!CurrencyCode.Value, `"TaxInOutHeader`")"

$title = Get-LabelLookupExpression "@NWV126003"
Set-FirstTextRunValue -TextboxName "TbReportTitle" -Expression "=UCase($title)"

$period = Get-LabelLookupExpression "@NWV126005"
$month = Get-LabelLookupExpression "@NWV1000012"
$year = Get-LabelLookupExpression "@NWV1000013"
Set-FirstTextRunValue -TextboxName "TbPeriod" -Expression "=$period & `": `" & UCase($month) & `" `" & CDate(Parameters!ToDate.Value).ToString(`"MM`") & `" `" & UCase($year) & `" `" & CDate(Parameters!ToDate.Value).ToString(`"yyyy`")"

$day = Get-LabelLookupExpression "@NWV1000011"
Set-FirstTextRunValue -TextboxName "TbSigDate" -Expression "=$day & `" `" & CDate(Today()).ToString(`"dd`") & `" `" & $month & `" `" & CDate(Today()).ToString(`"MM`") & `" `" & $year & `" `" & CDate(Today()).ToString(`"yyyy`")"

$signatureTitle = Get-LabelLookupExpression "@NWV126015"
Set-FirstTextRunValue -TextboxName "TbSigTitle" -Expression "=UCase(Replace($signatureTitle, `"<br>`", vbCrLf))"

$reportLanguage = $xml.SelectSingleNode("/*[local-name()='Report']/*[local-name()='Language']")
if (-not $reportLanguage) {
    throw "Report Language element was not found in '$RdlPath'."
}
$reportLanguage.InnerText = '=IIF(Parameters!LanguageCode.Value = "en-US", "en-US", "vi-VN")'

$settings = [System.Xml.XmlWriterSettings]::new()
$settings.Encoding = [System.Text.UTF8Encoding]::new($false)
$settings.Indent = $true
$settings.NewLineChars = "`r`n"
$settings.NewLineHandling = [System.Xml.NewLineHandling]::Replace

$writer = [System.Xml.XmlWriter]::Create((Resolve-Path -LiteralPath $RdlPath).Path, $settings)
try {
    $xml.Save($writer)
}
finally {
    $writer.Dispose()
}

[pscustomobject]@{
    RdlPath = (Resolve-Path -LiteralPath $RdlPath).Path
    UpdatedSimpleLabels = $simpleLabels.Count
    UpdatedCompositeLabels = 4
}
