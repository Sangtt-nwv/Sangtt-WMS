<#
.SYNOPSIS
    Policy guard for the agent skill corpus: fail loudly if unsafe fallback language
    reappears, or if a skill is structurally broken.

.DESCRIPTION
    This script used to do two jobs: compare .agents against .claude byte-for-byte, and
    sweep for a banned phrase. The first job now belongs to tools/sync-agent-skills.ps1,
    which owns mirror integrity for all 56 skills and knows that a generated copy carries
    a provenance banner the source does not. Keeping a second, weaker copy of that check
    here made the two scripts contradict each other - the same duplication-of-ownership
    problem the source-of-truth refactor exists to remove.

    What remains here is the part nothing else does:

    1. THE BANNED POLICY SWEEP. A blockquote telling agents "when `d365fo` is NOT
       available, DO NOT STOP OR ABORT - fall back to directly generating AOT XML" was
       copied into every mirror. That policy produced a hand-authored AxDataEntityView
       which compiled cleanly, generated a correct SQL view, and still returned HTTP 404
       from OData; about two days went into finding out why. See PROVENANCE.md and the
       data-entity-odata-404-troubleshooting skill.

       It has regressed twice. The first guard swept only .agents and .claude - 9 of the
       65 infected files - so the other 56 in .github and .vscode survived a full
       remediation pass unnoticed. Every directory an agent can read is swept now.

    2. STRUCTURAL VALIDITY. A skill directory with no SKILL.md is invisible to every
       client. Five .claude skills were empty directories for weeks and nobody noticed,
       because nothing checked.

.PARAMETER RepoRoot
    Root of the repo to check. Default: parent of this script's directory.

.EXAMPLE
    .\tools\check-skill-sync.ps1
#>

[CmdletBinding()]
param(
    [string] $RepoRoot = $null
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not $RepoRoot) {
    $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

$failures = @()

# ---------------------------------------------------------------- 1. banned policy sweep
# Both halves of the original wording. Matching either is enough - a partial reintroduction
# is still a reintroduction.
$dangerousPattern = 'DO NOT STOP OR ABORT|Fallback gracefully to directly'

$mirrorDirs = @('.agents', '.claude', '.github', '.vscode', '.codex') |
    ForEach-Object { Join-Path $RepoRoot $_ } |
    Where-Object { Test-Path $_ }

$hits = Get-ChildItem $mirrorDirs -Recurse -File -Include '*.md', '*.toml', '*.json', '*.yaml', '*.yml' -ErrorAction SilentlyContinue |
    Select-String -Pattern $dangerousPattern -List

foreach ($h in $hits) {
    $rel = $h.Path.Substring($RepoRoot.Length).TrimStart('\')
    $failures += "UNSAFE FALLBACK POLICY in $rel (line $($h.LineNumber))"
}

Write-Host "Swept $($mirrorDirs.Count) mirror(s) for unsafe fallback policy." -ForegroundColor Cyan

# ---------------------------------------------------------------- 2. structural validity
$skillRoots = @('.claude\skills', '.agents\skills', '.github\skills') |
    ForEach-Object { Join-Path $RepoRoot $_ } |
    Where-Object { Test-Path $_ }

$checked = 0
foreach ($root in $skillRoots) {
    $rel = $root.Substring($RepoRoot.Length).TrimStart('\')
    foreach ($dir in Get-ChildItem $root -Directory) {
        $checked++
        $skillMd = Join-Path $dir.FullName 'SKILL.md'
        if (-not (Test-Path $skillMd)) {
            $failures += "EMPTY SKILL: $rel\$($dir.Name) has no SKILL.md - no agent will ever load it."
            continue
        }
        $first = Get-Content $skillMd -TotalCount 1
        if ($first -ne '---') {
            $failures += "NO FRONTMATTER: $rel\$($dir.Name)\SKILL.md does not start with a YAML block."
        }
    }
}

Write-Host "Checked $checked skill directory/directories across $($skillRoots.Count) mirror(s)." -ForegroundColor Cyan

# ---------------------------------------------------------------- report
if ($failures.Count -gt 0) {
    Write-Host ''
    Write-Host "SKILL POLICY CHECK FAILED ($($failures.Count) issue(s)):" -ForegroundColor Red
    foreach ($f in $failures) { Write-Host "  - $f" -ForegroundColor Red }
    Write-Host ''
    Write-Host 'Mirror equality is checked separately by tools/sync-agent-skills.ps1 -Check.' -ForegroundColor DarkGray
    exit 1
}

Write-Host 'Skill policy check passed - no unsafe fallback policy, no broken skills.' -ForegroundColor Green
exit 0
