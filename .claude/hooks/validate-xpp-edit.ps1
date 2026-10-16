<#
.SYNOPSIS
    PostToolUse hook: run the cheap offline X++ checks after an AOT object is edited.

.DESCRIPTION
    AGENTS.md -> "Build And Validation" says not to run a full build, database sync, BP
    check or test suite automatically - they are expensive and environment-dependent - but
    to run the narrow static checks that ARE available locally.

    `d365fo validate xpp` and `d365fo lint` are those checks: they parse the X++ embedded
    in the AOT XML and flag syntax errors and best-practice violations without invoking
    xppc. Running them the moment a file is edited turns a defect that would surface in a
    ten-minute build into one the agent sees immediately.

    Advisory only. Always exits 0: findings go to stdout so the agent reads them, but a
    finding never blocks the edit, and a missing CLI never fails the session.
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Continue'

try {
    $raw = [Console]::In.ReadToEnd()
    if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }
    $payload = $raw | ConvertFrom-Json
}
catch { exit 0 }

$filePath = $null
if ($payload.PSObject.Properties.Name -contains 'tool_input' -and
    $payload.tool_input.PSObject.Properties.Name -contains 'file_path') {
    $filePath = [string]$payload.tool_input.file_path
}
if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }
if (-not (Test-Path -LiteralPath $filePath)) { exit 0 }

$normalized = $filePath -replace '/', '\'
if ($normalized -notmatch '\\Metadata\\') { exit 0 }
if ($normalized -notmatch '\.(xml|xpp)$') { exit 0 }

# Only bother when the file actually carries X++ source.
if ($normalized -match '\.xml$') {
    $head = Get-Content -LiteralPath $filePath -Raw -ErrorAction SilentlyContinue
    if ($null -eq $head -or $head -notmatch '<Source>|<SourceCode>|CDATA') { exit 0 }
}

if (-not (Get-Command d365fo -ErrorAction SilentlyContinue)) { exit 0 }

$out = & d365fo validate xpp --file "$filePath" --output json 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($out)) { exit 0 }

try { $res = $out | ConvertFrom-Json } catch { exit 0 }
if (-not $res.ok) { exit 0 }

$findings = @()
if ($res.data.PSObject.Properties.Name -contains 'diagnostics') { $findings = @($res.data.diagnostics) }
elseif ($res.data.PSObject.Properties.Name -contains 'findings') { $findings = @($res.data.findings) }

if ($findings.Count -eq 0) {
    Write-Output "[d365fo] validate xpp: clean - $(Split-Path $filePath -Leaf)"
    exit 0
}

$lines = @("[d365fo] validate xpp found $($findings.Count) issue(s) in $(Split-Path $filePath -Leaf):")
foreach ($f in $findings | Select-Object -First 15) {
    $sev = if ($f.PSObject.Properties.Name -contains 'severity') { $f.severity } else { 'info' }
    $line = if ($f.PSObject.Properties.Name -contains 'line') { ":$($f.line)" } else { '' }
    $msg = if ($f.PSObject.Properties.Name -contains 'message') { $f.message } else { ($f | Out-String).Trim() }
    $lines += "  [$sev]$line $msg"
}
if ($findings.Count -gt 15) { $lines += "  ... and $($findings.Count - 15) more" }

Write-Output ($lines -join "`n")
exit 0
