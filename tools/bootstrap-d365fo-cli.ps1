<#
.SYNOPSIS
    One-shot provisioning of the d365fo-cli toolchain (CLI + Bridge + agent
    skills for Claude/Codex/Copilot) for this repo, on a fresh VM/VHD.

.DESCRIPTION
    Run this once after cloning NWV-D365FO-Core onto a new D365FO VM. It:
      1. Clones (or updates) dynamics365ninja/d365fo-cli next to this repo's
         parent folder (default: sibling of this repo, see -CliDir).
      2. Runs the official install.ps1 non-interactively to publish the
         'd365fo' CLI and put it on PATH.
      3. Publishes D365FO.Bridge.exe next to d365fo.exe (install.ps1 does not
         do this - the Bridge is a separate .NET Framework 4.8 child process
         used by 'generate --install-to', 'modify', and the live-metadata
         'get'/'validate metadata' reads. Without it the CLI silently falls
         back to the slower/staler SQLite index for those).
      4. Runs 'd365fo init' pointed at THIS machine's AOS package root
         (default C:\AosService\PackagesLocalDirectory - override with
         -AosPackagesPath if a VHD ever uses a different drive letter) and
         registers this repo's Metadata\ folder as the custom packages root
         so 'generate --install-to <CustomModel>' can resolve NWV* models.
      5. Builds the SQLite metadata index ('index extract').
      6. Runs 'd365fo doctor' and prints the result.

    It no longer deploys d365fo-cli's generated skills by default. As of
    2026-09-18, .claude/skills/ is THIS repo's single source of truth: it has
    been repaired (an unsafe hand-author-the-XML fallback policy removed, five
    empty skills filled) and the Codex and Copilot mirrors are generated from
    it by tools/sync-agent-skills.ps1. d365fo-cli's installer overwrites
    .claude/skills/ wholesale and recreates .github/skills/d365fo-cli/, which
    would silently undo all of that. Use -DeployUpstreamSkills only when you
    intend to take a fresh upstream drop, and diff the result before
    committing it.

    Safe to re-run: an existing d365fo-cli checkout is updated (git pull) in
    place instead of re-cloned, and every step tolerates already-done state.

.PARAMETER AosPackagesPath
    AOS PackagesLocalDirectory root on this machine. D365FO onebox/dev VMs
    vary the drive letter (C:, K:, J: have all been seen) - always pass this
    explicitly instead of trusting the installer's auto-detect order.
    Default: C:\AosService\PackagesLocalDirectory (this VM's layout).

.PARAMETER CliDir
    Where to clone/update d365fo-cli. Default: sibling 'd365fo-cli' folder
    next to this repo (..\d365fo-cli relative to the repo root).

.EXAMPLE
    .\tools\bootstrap-d365fo-cli.ps1

.EXAMPLE
    # A future VHD where AOS ended up on a different drive
    .\tools\bootstrap-d365fo-cli.ps1 -AosPackagesPath 'K:\AosService\PackagesLocalDirectory'
#>

[CmdletBinding()]
param(
    [string] $AosPackagesPath = 'C:\AosService\PackagesLocalDirectory',
    [string] $CliDir = $null,

    # Overwrite .claude/skills/ with d365fo-cli's generated corpus and recreate
    # .github/skills/d365fo-cli/. OFF by default - .claude/skills/ is this repo's
    # source of truth and the upstream installer would clobber it. See the
    # .DESCRIPTION note above before turning this on.
    [switch] $DeployUpstreamSkills
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Step([string]$msg) { Write-Host "==> $msg" -ForegroundColor Cyan }
function Write-Ok([string]$msg)   { Write-Host "  + $msg" -ForegroundColor Green }
function Write-Note([string]$msg) { Write-Host "  * $msg" -ForegroundColor Yellow }

$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
if (-not $CliDir) {
    $CliDir = Join-Path (Split-Path $RepoRoot -Parent) 'd365fo-cli'
}
$RepoUrl = 'https://github.com/dynamics365ninja/d365fo-cli.git'

Write-Host ''
Write-Host 'NWV-D365FO-Core :: d365fo-cli bootstrap' -ForegroundColor Magenta
Write-Host "Repo root  : $RepoRoot"
Write-Host "CLI clone  : $CliDir"
Write-Host "AOS packages: $AosPackagesPath"
Write-Host ''

if (-not (Test-Path $AosPackagesPath)) {
    Write-Note "AOS packages path not found at $AosPackagesPath - re-run with -AosPackagesPath pointing at the real drive letter on this VHD."
}

# -- 1. Clone / update d365fo-cli ---------------------------------------------
Write-Step 'Cloning / updating d365fo-cli'
if (Test-Path (Join-Path $CliDir '.git')) {
    Push-Location $CliDir
    try { git pull --ff-only } finally { Pop-Location }
    Write-Ok "Updated existing checkout at $CliDir"
} else {
    git clone $RepoUrl $CliDir
    Write-Ok "Cloned to $CliDir"
}

# -- 2. Install the CLI (non-interactive) -------------------------------------
Write-Step 'Building + installing the d365fo CLI'
if (Get-Command d365fo -ErrorAction SilentlyContinue) {
    Write-Note 'd365fo already on PATH - re-publishing anyway to pick up any source changes.'
}
Push-Location $CliDir
try {
    $env:D365FO_CLI_DIR        = $CliDir
    $env:D365FO_CLI_YES        = '1'
    $env:D365FO_CLI_NO_WIZARD  = '1'
    & (Join-Path $CliDir 'install.ps1')
} finally {
    Pop-Location
}

$d365fo = Get-Command d365fo -ErrorAction SilentlyContinue
if (-not $d365fo) {
    throw "d365fo did not land on PATH after install.ps1 - open a new shell and re-run this script."
}
$cliBinDir = Split-Path $d365fo.Source -Parent
Write-Ok "d365fo resolved at $($d365fo.Source)"

# -- 3. Publish D365FO.Bridge.exe next to d365fo.exe --------------------------
Write-Step 'Publishing D365FO.Bridge.exe (install.ps1 does not do this)'
Push-Location $CliDir
try {
    dotnet publish src\D365FO.Bridge -c Release -o $cliBinDir
    if ($LASTEXITCODE -ne 0) { throw 'dotnet publish for D365FO.Bridge failed.' }
} finally {
    Pop-Location
}
Write-Ok "D365FO.Bridge.exe -> $cliBinDir"

# -- 4. Point the CLI at this VM's AOS + this repo's custom models -----------
Write-Step "Running 'd365fo init' (packages=$AosPackagesPath, extra-packages=$RepoRoot\Metadata)"
$env:D365FO_BRIDGE_ENABLED = '1'
d365fo init `
    --packages $AosPackagesPath `
    --extra-packages (Join-Path $RepoRoot 'Metadata') `
    --persist-profile `
    --run-extract `
    --no-wizard

# -- 5. Agent skills ----------------------------------------------------------
# .claude/skills/ is this repo's source of truth and is NOT managed by upstream.
# Running the installers would overwrite the repaired corpus and recreate the
# .github/skills/d365fo-cli/ mirror that was deliberately removed.
if ($DeployUpstreamSkills) {
    Write-Step 'Deploying UPSTREAM Claude skill variant into .claude\skills (overwrites the source of truth)'
    Write-Host '  Diff the result before committing - this replaces repaired skills with upstream copies.' -ForegroundColor Yellow
    & (Join-Path $CliDir 'scripts\Install-D365FoClaudeSkills.ps1') -CliRepo $CliDir -XppRepo $RepoRoot

    Write-Step 'Deploying upstream Copilot skill variant into .github\skills\d365fo-cli'
    & (Join-Path $CliDir 'scripts\Install-D365FoCopilotSkills.ps1') -CliRepo $CliDir -XppRepo $RepoRoot

    Write-Host ''
    Write-Host 'Now run these before committing:' -ForegroundColor Yellow
    Write-Host '  tools\check-skill-sync.ps1        # upstream may reintroduce the unsafe fallback policy'
    Write-Host '  tools\sync-agent-skills.ps1       # regenerate the Codex/Copilot mirrors'
}
else {
    Write-Step 'Skipping upstream skill deployment (.claude\skills is this repo''s source of truth)'
    Write-Host '  Regenerate mirrors with tools\sync-agent-skills.ps1' -ForegroundColor DarkGray
    Write-Host '  Pass -DeployUpstreamSkills only to take a fresh upstream drop.' -ForegroundColor DarkGray
}

# -- 6. Final health check ------------------------------------------------------
Write-Step "Running 'd365fo doctor'"
d365fo doctor

Write-Host ''
Write-Host 'Bootstrap complete.' -ForegroundColor Magenta
Write-Host 'Skills: .claude/skills/ is the source of truth. .agents/skills/ (Codex) and .github/skills/ (Copilot) are generated from it by tools/sync-agent-skills.ps1 - see AGENTS.md.'
Write-Host 'Subagents (.claude/agents/, .codex/agents/, .github/agents/) are hand-authored and not managed by this script.'
Write-Host ''
