# NWV-D365FO-Core-Standalone

Standalone local working copy of NaviWorld Vietnam's Dynamics 365 Finance &
Operations X++ source (`Core_Packages`, Azure DevOps project
`NWV-D365FO-Core`), used for local development and AI-agent-assisted work
(Claude Code, Codex, GitHub Copilot) outside the full CI/CD pipeline.

- Remote: `https://nwvvn.visualstudio.com/NWV-D365FO-Core/_git/Core_Packages`
- Upstream/base branch: `Develop` (not `main` — see below)

## Repository layout

```
Metadata/         Source of truth for D365FO package/model metadata (XML).
                   Models: NWVEB, NWVEI, NWVVAS, NaviWorldVietnamManagement.
                   Path shape: Metadata/<Package>/<Model>/Ax<Type>/<Object>.xml
Build/SandboxBuild/  Hosted-agent build entry point (SandboxBuild.sln, one
                   .rnrproj per project mapping AOT objects into build units).
VSProjects/        Legacy/local Visual Studio projects and C# helpers.
docs/              Project docs: E-Banking, EI, Fabric, GitAzure (CI/CD SOP),
                   VAS (TDD/FDD specs), AI-Agent-Setup-Remediation-Plan.md.
```

## AI agent governance layer

This repo carries a shared instruction/skill set for Claude Code, Codex, and
GitHub Copilot, so the three don't drift into contradictory copies:

```
AGENTS.md                    Shared rule set - Codex reads this natively;
                              Claude/Copilot entry files point at it.
CLAUDE.md                    Claude Code's auto-loaded entry point.
.mcp.json / .vscode/mcp.json d365fo-mcp-server + mslearn + fabric MCP registration.
.claude/skills/<id>/         Claude Code skill set (55 skills) - single source
                              of truth; edit here, nowhere else.
.agents/skills/<id>/         Codex mirror, generated from .claude/skills/.
.github/skills/<id>/         Copilot mirror, generated from .claude/skills/.
.codex/agents/*.toml         Codex subagents (tech-lead, xpp-coder, db-query,
                              integration, security-auditor, reviewer).
.github/agents/*.agent.md    Same 6 subagents in Copilot's format.
tools/sync-agent-skills.ps1  Regenerates .agents/ and .github/ mirrors from
                              .claude/skills/ after any skill edit.
tools/check-skill-sync.ps1   Guards mirror sync + a banned "fall back to
                              hand-authored AOT XML" fallback policy.
tools/bootstrap-d365fo-cli.ps1  Clones/builds/installs the d365fo CLI + Bridge
                              on a fresh VM/VHD and points it at this repo.
```

Full rules live in [AGENTS.md](AGENTS.md) — read it before doing any D365FO
metadata or X++ work. `CLAUDE.md` is Claude-specific wiring on top of it.

## Getting started on a fresh VM/VHD

```powershell
.\tools\bootstrap-d365fo-cli.ps1
# or, if AOS packages live on a different drive:
.\tools\bootstrap-d365fo-cli.ps1 -AosPackagesPath 'K:\AosService\PackagesLocalDirectory'
```

Then verify tooling health:

```powershell
d365fo doctor --output json
```

`doctor` only reports gaps (e.g. a missing/stale `D365FO.Bridge.exe` or a
stale metadata index) — it does not self-heal. See `CLAUDE.md` → "Mandatory
first steps" for the exact remediation commands.

## Knowledge base

```powershell
d365fo knowledge search "why does a data entity 404 on OData"
d365fo knowledge get data-entity-scaffolding --section "OData naming conventions (D365FO)"
```

`AGENTS.md` → "Required Workflow" defines the full research order (`knowledge`
→ `search`/`get`/`find` → `mslearn` MCP → web search → only then raw XML) and
the "stop and ask the user" rule for anything none of that resolves.

## Branching

Base new work off `Develop`, not `main`. Check ancestry before opening a PR:

```powershell
git fetch origin
git merge-base <your-branch> origin/Develop   # should be a real point on Develop's history
git log origin/Develop --oneline ^<your-branch>  # commits you're missing from Develop
```
