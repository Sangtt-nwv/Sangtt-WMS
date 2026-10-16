param([int]$StartLine=663, [int]$EndLine=842, [string]$RdlPath="docs\fabric-paginated\NWVVASSalesTaxStatement_ParityScaffold.rdl")
$lines = [System.IO.File]::ReadAllLines($RdlPath)
$total = 0
for ($i = $StartLine-1; $i -le $EndLine-1; $i++) {
    $c = ([regex]::Matches($lines[$i], '<TablixCell[^s]')).Count
    if ($c -gt 0) { Write-Host "Line $($i+1): $c - $($lines[$i].Trim())" }
    $total += $c
}
Write-Host "Total: $total"
