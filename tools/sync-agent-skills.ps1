<#
.SYNOPSIS
    Generate the Codex and GitHub Copilot skill mirrors from .claude/skills/,
    the single source of truth.

.DESCRIPTION
    Agent Skills is an open format (https://agentskills.io, originally from Anthropic):
    a folder containing SKILL.md with `name` + `description` frontmatter, plus optional
    references/, scripts/ and assets/ subfolders. Because the format is identical across
    clients, a mirror is a straight copy - no translation is needed, only a provenance
    header so nobody hand-edits a generated file.

    Verified reader locations (official docs, 2026-09):
      .claude/skills/   Claude Code; also read by Copilot and VS Code
      .agents/skills/   Codex (repo scope); also read by Copilot and VS Code
      .github/skills/   Copilot cloud agent, code review, and Copilot CLI
      .vscode/skills/   NOT a supported location - VS Code reads the three above

    Codex-specific per-skill metadata lives in <skill>/agents/openai.yaml (interface,
    policy, dependencies). That file has no counterpart in the source, so it is
    PRESERVED in the .agents mirror rather than deleted on regeneration.

.PARAMETER RepoRoot
    Root of the repo. Default: parent of this script's directory.

.PARAMETER Check
    Verify the mirrors match the source and exit non-zero if they do not.
    Writes nothing. Intended for CI.

.EXAMPLE
    .\tools\sync-agent-skills.ps1            # regenerate mirrors
    .\tools\sync-agent-skills.ps1 -Check     # CI drift gate
#>

[CmdletBinding()]
param(
    [string] $RepoRoot = $null,
    [switch] $Check
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not $RepoRoot) {
    $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

$SourceDir = Join-Path $RepoRoot '.claude\skills'
$Targets = @(
    @{ Name = 'Codex';   Path = Join-Path $RepoRoot '.agents\skills';  Preserve = @('agents') },
    @{ Name = 'Copilot'; Path = Join-Path $RepoRoot '.github\skills';  Preserve = @() }
)

if (-not (Test-Path $SourceDir)) {
    Write-Host "Source not found: $SourceDir" -ForegroundColor Red
    exit 1
}

function Get-Frontmatter {
    param([string] $Path)
    $lines = [System.IO.File]::ReadAllLines($Path)
    if ($lines.Count -lt 2 -or $lines[0].Trim() -ne '---') { return $null }
    $end = -1
    for ($i = 1; $i -lt $lines.Count; $i++) {
        if ($lines[$i].Trim() -eq '---') { $end = $i; break }
    }
    if ($end -lt 0) { return $null }
    $fm = @{}
    foreach ($l in $lines[1..($end - 1)]) {
        if ($l -match '^\s*([A-Za-z0-9_-]+)\s*:\s*(.*)$') {
            $fm[$Matches[1]] = $Matches[2].Trim().Trim('"', "'")
        }
    }
    return @{ Fields = $fm; EndIndex = $end; Lines = $lines }
}

# Build the generated form of a SKILL.md: identical content plus a provenance banner
# inserted immediately after the frontmatter block.
function Get-GeneratedSkillText {
    param([string] $SourcePath, [string] $SkillName)

    $parsed = Get-Frontmatter -Path $SourcePath
    $raw = [System.IO.File]::ReadAllText($SourcePath)
    $eol = if ($raw -match "`r`n") { "`r`n" } else { "`n" }
    $banner = "<!-- GENERATED from .claude/skills/$SkillName/SKILL.md by tools/sync-agent-skills.ps1 - DO NOT EDIT THIS COPY. Edit the source and re-run the script. -->"

    if ($null -eq $parsed) {
        # No frontmatter: prepend the banner rather than lose it.
        return $banner + $eol + $raw
    }

    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.AddRange([string[]]$parsed.Lines[0..$parsed.EndIndex])
    $lines.Add($banner)
    if ($parsed.EndIndex + 1 -lt $parsed.Lines.Count) {
        $lines.AddRange([string[]]$parsed.Lines[($parsed.EndIndex + 1)..($parsed.Lines.Count - 1)])
    }
    $trailing = if ($raw.EndsWith("`n")) { $eol } else { '' }
    return ($lines -join $eol) + $trailing
}

# ---------------------------------------------------------------- validate source
$skills = Get-ChildItem $SourceDir -Directory | Sort-Object Name
$problems = @()
$valid = @()

foreach ($s in $skills) {
    $skillMd = Join-Path $s.FullName 'SKILL.md'
    if (-not (Test-Path $skillMd)) {
        $problems += "$($s.Name): no SKILL.md - skill is invisible to every agent."
        continue
    }
    $parsed = Get-Frontmatter -Path $skillMd
    if ($null -eq $parsed) {
        $problems += "$($s.Name): SKILL.md has no YAML frontmatter block."
        continue
    }
    if (-not $parsed.Fields.ContainsKey('name')) {
        $problems += "$($s.Name): frontmatter is missing the required 'name' field."
        continue
    }
    if (-not $parsed.Fields.ContainsKey('description')) {
        $problems += "$($s.Name): frontmatter is missing the required 'description' field."
        continue
    }
    if ($parsed.Fields['name'] -ne $s.Name) {
        $problems += "$($s.Name): frontmatter name is '$($parsed.Fields['name'])' but the directory is '$($s.Name)' - they must match."
        continue
    }
    $valid += $s
}

if ($problems.Count -gt 0) {
    Write-Host "SOURCE VALIDATION FAILED ($($problems.Count) issue(s)):" -ForegroundColor Red
    foreach ($p in $problems) { Write-Host "  - $p" -ForegroundColor Red }
    Write-Host ''
    Write-Host 'Fix the source under .claude/skills/ before generating mirrors.' -ForegroundColor Red
    exit 1
}

Write-Host "Source: $($valid.Count) valid skill(s) under .claude/skills/" -ForegroundColor Cyan

# ---------------------------------------------------------------- generate / check
$drift = @()
$written = 0

foreach ($t in $Targets) {
    $targetRoot = $t.Path

    if (-not $Check) {
        # Remove mirror skills that no longer exist in the source, but never touch
        # preserved per-client metadata folders.
        if (Test-Path $targetRoot) {
            $stale = Get-ChildItem $targetRoot -Directory |
                Where-Object { $valid.Name -notcontains $_.Name }
            foreach ($d in $stale) {
                Remove-Item $d.FullName -Recurse -Force
                Write-Host "  - removed stale $($t.Name) skill: $($d.Name)" -ForegroundColor DarkYellow
            }
        }
        else {
            New-Item -ItemType Directory -Path $targetRoot -Force | Out-Null
        }
    }

    foreach ($s in $valid) {
        $destDir = Join-Path $targetRoot $s.Name

        # Every source file except SKILL.md copies verbatim; SKILL.md gets the banner.
        # Build artefacts are skipped: .gitignore excludes __pycache__ from the mirrors, so
        # copying a .pyc makes -Check fail on a fresh clone where the file cannot exist.
        $sourceFiles = Get-ChildItem $s.FullName -Recurse -File |
            Where-Object { $_.FullName -notmatch '\\__pycache__\\' -and $_.Extension -notin @('.pyc', '.pyo') }
        foreach ($f in $sourceFiles) {
            $rel = $f.FullName.Substring($s.FullName.Length).TrimStart('\')
            $destPath = Join-Path $destDir $rel

            $expected = if ($rel -eq 'SKILL.md') {
                Get-GeneratedSkillText -SourcePath $f.FullName -SkillName $s.Name
            }
            else {
                $null   # binary-safe verbatim copy below
            }

            if ($Check) {
                if (-not (Test-Path $destPath)) {
                    $drift += "$($t.Name): missing $($s.Name)/$rel"
                    continue
                }
                if ($null -ne $expected) {
                    if ([System.IO.File]::ReadAllText($destPath) -ne $expected) {
                        $drift += "$($t.Name): $($s.Name)/$rel differs from generated form"
                    }
                }
                elseif ((Get-FileHash $destPath).Hash -ne (Get-FileHash $f.FullName).Hash) {
                    $drift += "$($t.Name): $($s.Name)/$rel differs from source"
                }
                continue
            }

            $destParent = Split-Path $destPath -Parent
            if (-not (Test-Path $destParent)) { New-Item -ItemType Directory -Path $destParent -Force | Out-Null }

            if ($null -ne $expected) {
                [System.IO.File]::WriteAllText($destPath, $expected)
            }
            else {
                Copy-Item $f.FullName $destPath -Force
            }
            $written++
        }

        # Drop mirror files that the source no longer has, except preserved folders.
        if (-not $Check -and (Test-Path $destDir)) {
            $sourceRel = @($sourceFiles | ForEach-Object { $_.FullName.Substring($s.FullName.Length).TrimStart('\') })
            Get-ChildItem $destDir -Recurse -File | ForEach-Object {
                $rel = $_.FullName.Substring($destDir.Length).TrimStart('\')
                $top = ($rel -split '\\')[0]
                if ($sourceRel -notcontains $rel -and $t.Preserve -notcontains $top) {
                    Remove-Item $_.FullName -Force
                    Write-Host "  - removed orphan $($t.Name) file: $($s.Name)/$rel" -ForegroundColor DarkYellow
                }
            }
        }
    }
}

if ($Check) {
    if ($drift.Count -gt 0) {
        Write-Host ''
        Write-Host "MIRROR DRIFT DETECTED ($($drift.Count) issue(s)):" -ForegroundColor Red
        foreach ($d in $drift | Select-Object -First 40) { Write-Host "  - $d" -ForegroundColor Red }
        if ($drift.Count -gt 40) { Write-Host "  ... and $($drift.Count - 40) more" -ForegroundColor Red }
        Write-Host ''
        Write-Host 'Run tools/sync-agent-skills.ps1 to regenerate, and commit the result.' -ForegroundColor Red
        exit 1
    }
    Write-Host 'Mirrors are in sync with .claude/skills/.' -ForegroundColor Green
    exit 0
}

Write-Host ''
Write-Host "Wrote $written file(s) across $($Targets.Count) mirror(s)." -ForegroundColor Green
foreach ($t in $Targets) {
    $n = (Get-ChildItem $t.Path -Directory -ErrorAction SilentlyContinue).Count
    Write-Host "  $($t.Name.PadRight(8)) $($t.Path.Substring($RepoRoot.Length).TrimStart('\')) -> $n skill(s)"
}
exit 0
