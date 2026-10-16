<#
.SYNOPSIS
    Deploy this agent-setup toolkit into a D365FO project repository.

.DESCRIPTION
    Copies the agent configuration - skills for all three clients, subagents, hooks,
    slash commands, MCP config and the guard scripts - into a target repo, and makes sure
    the target's .gitignore actually tracks them.

    That last part matters more than it sounds. In the repo this toolkit was extracted
    from, `.claude/` was missing from a whitelist-style .gitignore, so the entire Claude
    configuration - including the richest and only clean copy of the skill corpus - was
    silently untracked. A fresh clone produced a repo with no agent setup at all and no
    bootstrap script to rebuild it. This script checks for that and tells you.

.PARAMETER TargetRepo
    Path to the D365FO project repo to install into. Required.

.PARAMETER IncludeProjectSkills
    Also install the NaviWorld project-specific skills (NWVEI e-invoice, Fabric paginated
    reports, the TDD generator). Omit for a generic D365FO repo that has no use for them.

.PARAMETER Force
    Overwrite existing files in the target. Without it, the script reports conflicts and
    changes nothing.

.PARAMETER WhatIf
    Show what would be installed without writing.

.EXAMPLE
    .\tools\install-agent-setup.ps1 -TargetRepo C:\src\MyD365FOProject -WhatIf
    .\tools\install-agent-setup.ps1 -TargetRepo C:\src\MyD365FOProject -Force
#>

[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [string] $TargetRepo,

    [switch] $IncludeProjectSkills,
    [switch] $Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$SourceRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

if (-not (Test-Path $TargetRepo)) {
    Write-Host "Target repo not found: $TargetRepo" -ForegroundColor Red
    exit 1
}
$TargetRepo = (Resolve-Path $TargetRepo).Path

if ($TargetRepo -eq $SourceRoot) {
    Write-Host 'Target is this repo. Nothing to do.' -ForegroundColor Yellow
    exit 1
}

# Skills tied to NaviWorld projects rather than to D365FO in general.
$ProjectSpecificSkills = @(
    'nwvei-einvoice-architecture',
    'fabric-paginated-report-parity',
    'technical-design-document',
    'electronic-reporting-configuration-authoring'
)

# What gets installed. Mirrors are generated, but they are shipped too so a clone works
# without running the generator first.
$Payload = @(
    @{ Path = '.claude\skills';   Kind = 'dir';  Note = 'source of truth' }
    @{ Path = '.claude\agents';   Kind = 'dir';  Note = '6 subagents' }
    @{ Path = '.claude\hooks';    Kind = 'dir';  Note = 'AOT-XML block, session doctor, X++ validate' }
    @{ Path = '.claude\commands'; Kind = 'dir';  Note = 'slash commands' }
    @{ Path = '.claude\settings.json'; Kind = 'file'; Note = 'permissions + hook wiring' }
    @{ Path = '.agents\skills';   Kind = 'dir';  Note = 'Codex mirror (generated)' }
    @{ Path = '.codex\agents';    Kind = 'dir';  Note = 'Codex subagents' }
    @{ Path = '.codex\config.toml'; Kind = 'file'; Note = 'Codex MCP config' }
    @{ Path = '.github\skills';   Kind = 'dir';  Note = 'Copilot mirror (generated)' }
    @{ Path = '.github\agents';   Kind = 'dir';  Note = 'Copilot subagents' }
    @{ Path = '.github\copilot-instructions.md'; Kind = 'file'; Note = 'Copilot repo instructions' }
    @{ Path = '.vscode\mcp.json'; Kind = 'file'; Note = 'VS Code MCP servers' }
    @{ Path = '.mcp.json';        Kind = 'file'; Note = 'MCP servers' }
    @{ Path = 'AGENTS.md';        Kind = 'file'; Note = 'shared rules - READ THIS FIRST' }
    @{ Path = 'CLAUDE.md';        Kind = 'file'; Note = 'Claude Code entry point' }
    @{ Path = 'tools\sync-agent-skills.ps1';    Kind = 'file'; Note = 'mirror generator + CI gate' }
    @{ Path = 'tools\check-skill-sync.ps1';     Kind = 'file'; Note = 'policy guard' }
    @{ Path = 'tools\strip-fallback-banner.ps1';Kind = 'file'; Note = 'one-off remediation' }
    @{ Path = 'tools\bootstrap-d365fo-cli.ps1'; Kind = 'file'; Note = 'provisions d365fo CLI + Bridge' }
    @{ Path = 'tools\ci\agent-guards.yml';      Kind = 'file'; Note = 'Azure DevOps steps template' }
)

Write-Host "Source : $SourceRoot"
Write-Host "Target : $TargetRepo"
Write-Host ''

# ---------------------------------------------------------------- conflict scan
$conflicts = @()
foreach ($item in $Payload) {
    $dest = Join-Path $TargetRepo $item.Path
    if (Test-Path $dest) { $conflicts += $item.Path }
}

if ($conflicts.Count -gt 0 -and -not $Force) {
    Write-Host "TARGET ALREADY HAS $($conflicts.Count) OF THESE PATHS:" -ForegroundColor Yellow
    foreach ($c in $conflicts) { Write-Host "  - $c" -ForegroundColor Yellow }
    Write-Host ''
    Write-Host 'Nothing was changed. Review the differences, then re-run with -Force.' -ForegroundColor Yellow
    Write-Host 'If the target has local skill edits, copy them into this toolkit first -' -ForegroundColor Yellow
    Write-Host 'installing over them loses them, and the mirrors are regenerated anyway.' -ForegroundColor Yellow
    exit 1
}

# ---------------------------------------------------------------- install
$installed = 0
foreach ($item in $Payload) {
    $src = Join-Path $SourceRoot $item.Path
    $dest = Join-Path $TargetRepo $item.Path

    if (-not (Test-Path $src)) {
        Write-Host "  skip (missing in toolkit): $($item.Path)" -ForegroundColor DarkYellow
        continue
    }

    if (-not $PSCmdlet.ShouldProcess($item.Path, 'Install')) { continue }

    $destParent = Split-Path $dest -Parent
    if (-not (Test-Path $destParent)) { New-Item -ItemType Directory -Path $destParent -Force | Out-Null }

    if ($item.Kind -eq 'dir') {
        Copy-Item $src $dest -Recurse -Force
        if (-not $IncludeProjectSkills -and $item.Path -like '*skills') {
            foreach ($p in $ProjectSpecificSkills) {
                $drop = Join-Path $dest $p
                if (Test-Path $drop) { Remove-Item $drop -Recurse -Force }
            }
        }
    }
    else {
        Copy-Item $src $dest -Force
    }

    Write-Host ("  + {0,-42} {1}" -f $item.Path, $item.Note) -ForegroundColor Green
    $installed++
}

if ($WhatIfPreference) {
    Write-Host ''
    Write-Host 'WhatIf: nothing was written.' -ForegroundColor Cyan
    exit 0
}

# ---------------------------------------------------------------- gitignore sanity
Write-Host ''
$gitignore = Join-Path $TargetRepo '.gitignore'
$warnings = @()

if (Test-Path $gitignore) {
    Push-Location $TargetRepo
    try {
        foreach ($probe in @('.claude/skills/table-scaffolding/SKILL.md', 'CLAUDE.md', '.mcp.json', 'AGENTS.md')) {
            if (Test-Path $probe) {
                & git check-ignore -q $probe 2>$null
                if ($LASTEXITCODE -eq 0) { $warnings += $probe }
            }
        }
    }
    catch { }
    finally { Pop-Location }
}

if ($warnings.Count -gt 0) {
    Write-Host 'WARNING - the target .gitignore excludes files that were just installed:' -ForegroundColor Red
    foreach ($w in $warnings) { Write-Host "  - $w" -ForegroundColor Red }
    Write-Host ''
    Write-Host 'They will not survive a clone. If .gitignore uses a /* block-and-whitelist' -ForegroundColor Red
    Write-Host 'strategy, add these entries:' -ForegroundColor Red
    Write-Host '    !.claude/' -ForegroundColor Red
    Write-Host '    !CLAUDE.md' -ForegroundColor Red
    Write-Host '    !.mcp.json' -ForegroundColor Red
    Write-Host '    .claude/settings.local.json     # keep per-developer state local' -ForegroundColor Red
}

Write-Host ''
Write-Host "Installed $installed path(s)." -ForegroundColor Green
Write-Host ''
Write-Host 'Next:' -ForegroundColor Cyan
Write-Host '  1. Review AGENTS.md - the repository-layout section is written for the source'
Write-Host '     project and almost certainly needs editing for this one.'
Write-Host '  2. Run tools/bootstrap-d365fo-cli.ps1 if `d365fo` is not on PATH.'
Write-Host '  3. Run tools/sync-agent-skills.ps1 -Check and tools/check-skill-sync.ps1.'
Write-Host '  4. Wire tools/ci/agent-guards.yml into your pipeline.'
Write-Host '  5. git add the installed paths and commit.'
exit 0
