<#
.SYNOPSIS
    Replace the dangerous "DO NOT STOP OR ABORT / fall back to hand-written AOT XML"
    toolchain banner with a policy that matches AGENTS.md -> "Metadata And AOT Safety".

.DESCRIPTION
    Background: a single blockquote line was copied into every generated skill mirror
    telling the agent that, when the `d365fo` CLI is unavailable, it should NOT stop but
    instead hand-author AOT XML directly. That is the exact policy that produced the
    ~2-day OData 404 incident recorded in PROVENANCE.md (a hand-authored AxDataEntityView
    compiled cleanly but never routed).

    A previous remediation attempt removed the banner by replacing whole rich skills with
    ~15-line stubs, destroying 1,986 lines of content including the
    `d365fo prepare change --grounding-token` workflow. This script does the surgical
    version instead: it swaps ONE line and touches nothing else.

    Two shapes are handled:
      1. The blockquote one-liner in skill files (64 files).
      2. The expanded "ABSOLUTE RULES" item 1 in .github/copilot-instructions.md.

.PARAMETER RepoRoot
    Root of the repo to fix. Default: parent of this script's directory.

.PARAMETER WhatIf
    Report what would change without writing anything.

.EXAMPLE
    .\tools\strip-fallback-banner.ps1 -WhatIf
    .\tools\strip-fallback-banner.ps1
#>

[CmdletBinding(SupportsShouldProcess)]
param(
    [string] $RepoRoot = $null
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not $RepoRoot) {
    $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

# The replacement keeps the useful half of the original banner (prefer `d365fo generate`)
# and reverses the dangerous half (stop instead of hand-authoring).
$SafeBanner = '> 💡 **TOOLCHAIN POLICY:** Create every new AOT object with `d365fo generate … --install-to <Model>` or the D365FO MCP scaffolding tools. If the CLI or Bridge is unavailable, **stop and report the missing prerequisite** — never hand-author a new AOT XML object. Editing an *existing* object''s XML is fine once you have verified its path and model ownership. The only sanctioned exception is the `aot-xml-direct-scaffolding` procedure, which requires explicit user authorization first.'

$DangerousPattern = 'DO NOT STOP OR ABORT|Fallback gracefully to directly'
$SearchDirs = @('.agents', '.claude', '.github', '.vscode', '.codex') |
    ForEach-Object { Join-Path $RepoRoot $_ } |
    Where-Object { Test-Path $_ }

$changed = 0
$skipped = 0
$problems = @()

$files = Get-ChildItem $SearchDirs -Recurse -File -Include '*.md' -ErrorAction SilentlyContinue |
    Select-String -Pattern $DangerousPattern -List |
    ForEach-Object { $_.Path } |
    Sort-Object -Unique

Write-Host "Found $($files.Count) file(s) carrying the dangerous fallback policy." -ForegroundColor Cyan

foreach ($path in $files) {
    $rel = $path.Substring($RepoRoot.Length).TrimStart('\')
    $lines = [System.IO.File]::ReadAllLines($path)
    $hits = @(0..($lines.Count - 1) | Where-Object { $lines[$_] -match $DangerousPattern })

    if ($hits.Count -ne 1) {
        $problems += "$rel : expected exactly 1 matching line, found $($hits.Count) - left untouched for manual review."
        $skipped++
        continue
    }

    $i = $hits[0]
    $original = $lines[$i]

    if ($original.TrimStart().StartsWith('>')) {
        # Shape 1: the blockquote one-liner used by every skill mirror.
        $lines[$i] = $SafeBanner
    }
    elseif ($original -match '^\s*-\s+\*\*Fallback') {
        # Shape 2: copilot-instructions.md "ABSOLUTE RULES" item 1, a nested bullet.
        # Preserve the bullet's indentation so the surrounding list stays valid.
        $indent = ($original -replace '^(\s*).*$', '$1')
        $lines[$i] = $indent + '- **If `d365fo` is missing / not on PATH:** **STOP and report the missing prerequisite.** Do NOT fall back to hand-authoring new AOT XML — that is what caused the OData routing incident described in `PROVENANCE.md`. Run `tools/bootstrap-d365fo-cli.ps1` to provision the CLI and Bridge, then retry. Editing an *existing* object''s XML remains allowed.'
    }
    else {
        $problems += "$rel : unrecognized banner shape - left untouched for manual review."
        $skipped++
        continue
    }

    if ($PSCmdlet.ShouldProcess($rel, 'Replace dangerous fallback policy')) {
        # Preserve the file's existing line ending style.
        $raw = [System.IO.File]::ReadAllText($path)
        $eol = if ($raw -match "`r`n") { "`r`n" } else { "`n" }
        $trailing = if ($raw.EndsWith("`n")) { $eol } else { '' }
        [System.IO.File]::WriteAllText($path, ($lines -join $eol) + $trailing)
    }
    $changed++
}

Write-Host ''
Write-Host "Rewrote : $changed file(s)" -ForegroundColor Green
if ($skipped -gt 0) { Write-Host "Skipped : $skipped file(s)" -ForegroundColor Yellow }

if ($problems.Count -gt 0) {
    Write-Host ''
    Write-Host 'NEEDS MANUAL REVIEW:' -ForegroundColor Yellow
    foreach ($p in $problems) { Write-Host "  - $p" -ForegroundColor Yellow }
    exit 1
}

exit 0
