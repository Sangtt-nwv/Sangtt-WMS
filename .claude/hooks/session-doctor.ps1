<#
.SYNOPSIS
    SessionStart hook: report d365fo toolchain health so the agent does not have to
    remember to check.

.DESCRIPTION
    AGENTS.md -> "Required Workflow" step 0 says to run `d365fo doctor` before any work,
    because `doctor` only reports gaps and never self-heals: a session that reads the
    warning and continues anyway silently works off a stale SQLite index for every
    get / generate --install-to / validate metadata call.

    Relying on the model to remember step 0 is exactly the kind of rule that gets skipped
    under time pressure. This hook runs it automatically and puts the result in context.

    Always exits 0 - this is an advisory, not a gate. A missing CLI is reported, not
    treated as a reason to fail the session.
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Continue'

$d365fo = Get-Command d365fo -ErrorAction SilentlyContinue
if (-not $d365fo) {
    Write-Output @'
[d365fo] CLI NOT FOUND on PATH.
Run tools/bootstrap-d365fo-cli.ps1 before starting any task that touches D365FO metadata
or X++. Do not fall back to hand-writing AOT XML.
'@
    exit 0
}

try {
    $json = & d365fo doctor --output json 2>$null | ConvertFrom-Json
}
catch {
    Write-Output '[d365fo] `doctor` could not be parsed; run it manually before metadata work.'
    exit 0
}

if (-not $json.ok) {
    Write-Output '[d365fo] `doctor` reported a failure; run `d365fo doctor` for detail.'
    exit 0
}

$failed = @($json.data.checks | Where-Object { -not $_.ok })

if ($failed.Count -eq 0) {
    Write-Output '[d365fo] doctor: all checks OK (CLI, Bridge, build tooling, index fresh).'
    exit 0
}

$lines = @('[d365fo] doctor reported ' + $failed.Count + ' failing check(s) - resolve before relying on metadata results:')
foreach ($c in $failed) {
    $detail = if ($c.PSObject.Properties.Name -contains 'detail') { " - $($c.detail)" } else { '' }
    $lines += "  FAIL: $($c.name)$detail"
}

if ($failed.name -match 'stale-index|index freshness') {
    $lines += '  -> Run `d365fo index refresh`. Until then every search/get answer may be out of date.'
}
if ($failed.name -match 'bridge') {
    $lines += '  -> The Bridge is required for `generate --install-to` and live metadata. Build it with:'
    $lines += '     dotnet publish src\D365FO.Bridge -c Release -r win-x64 --self-contained -o "$(Split-Path (Get-Command d365fo).Source)"'
    $lines += '     Without it, calls silently fall back to the stale SQLite index.'
}

Write-Output ($lines -join "`n")
exit 0
