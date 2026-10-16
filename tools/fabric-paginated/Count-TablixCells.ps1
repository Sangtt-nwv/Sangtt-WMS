$f = "docs\fabric-paginated\NWVVASSalesTaxStatement_ParityScaffold.rdl"
$content = [System.IO.File]::ReadAllText($f)
$rowMatches = [regex]::Matches($content, '(?s)<TablixRow>.*?</TablixRow>')
$idx = 1
foreach ($m in $rowMatches) {
    $cellCount = ([regex]::Matches($m.Value, '<TablixCell[^s]')).Count
    Write-Host "Row $idx : $cellCount cells"
    $idx++
}
