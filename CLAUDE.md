# Claude Code — NWV-D365FO-Core

This file is what Claude Code auto-loads at the start of every session in this
repo. Keep it thin: the actual rules live in [AGENTS.md](AGENTS.md) and are
shared across Codex, Copilot, and Claude — read `AGENTS.md` now, in full,
before doing anything else. Everything below is Claude-specific wiring on top
of it.

## Skills

Claude Code auto-discovers skills under `.claude/skills/<name>/SKILL.md`, and
**that directory is the single source of truth** for all three clients. Edit a
skill there and nowhere else, then run `tools/sync-agent-skills.ps1` to
regenerate the Codex (`.agents/skills/`) and Copilot (`.github/skills/`)
mirrors. Every generated file is stamped `GENERATED … DO NOT EDIT THIS COPY`.

Two guards, with deliberately separate concerns — run both after any skill edit:

- `tools/sync-agent-skills.ps1 -Check` — mirror integrity.
- `tools/check-skill-sync.ps1` — banned fallback policy, and skills missing a
  `SKILL.md` or frontmatter.

See `AGENTS.md` → "Instruction Routing" for the reader-location table and why
`.vscode/skills/` does not exist.

Load the skill matching the task before writing any AOT XML, X++, or
scaffolding — `data-entity-scaffolding`, `table-scaffolding`,
`coc-extension-authoring`, etc. If no skill matches, say so and fall back to
`AGENTS.md`'s general rules rather than guessing.

Three skills are not optional and are not task-specific:

- `d365fo-xpp-core` — every D365FO or X++ task.
- `xpp-best-practice-rules` — every X++ edit.
- `xpp-performance-rules` — every X++ edit that queries, loops, or writes. Name
  each loop's complexity, keep round-trips out of loop bodies, prefer set-based
  and check the silent-downgrade conditions. Performance is a correctness
  property here, not a follow-up task.

## Mandatory first steps in any session touching D365FO metadata or X++

1. Before any work: run `d365fo doctor --output json`; if `bridge` reports
   missing/not-found, build it with
   `dotnet publish src\D365FO.Bridge -c Release -r win-x64 --self-contained -o "$(Split-Path (Get-Command d365fo).Source)"`
   (places `D365FO.Bridge.exe` next to `d365fo.exe`), then re-run `doctor` to
   confirm both CLI and Bridge report healthy — never proceed with a partial
   setup. `doctor` only reports the gap, it does not self-heal
   (`OpsCommands.cs:119`), and the official `install.ps1` never builds or
   deploys `D365FO.Bridge.exe` — it only publishes `D365FO.Cli`. Skipping the
   rebuild step because `doctor` merely warned means every later `get`/
   `generate --install-to`/`validate metadata` call silently falls back to the
   stale SQLite index instead of live metadata, and nobody notices until
   something is subtly wrong.
2. If `d365fo` is not found on PATH at all, run `tools/bootstrap-d365fo-cli.ps1`
   first (see below) — it clones, builds, and runs the Bridge step above for
   you. Do not fall back to hand-writing AOT XML just because the tool is
   momentarily missing.
3. Resolve facts in this order — see `AGENTS.md` → "Required Workflow" step 2
   for the full version — and stop grepping `PackagesLocalDirectory` by hand
   as soon as one of the earlier, cheaper steps answers the question:
   `d365fo knowledge search "<question>"` / `knowledge get <topic>` (43 curated
   topics — check this first for "how does X work" questions) → `d365fo
   search`/`get`/`find` (live index/Bridge, for specific objects) → the
   `mslearn` MCP tool → a general `WebSearch`/`WebFetch` (forums, community
   write-ups, LinkedIn technical posts, MS Q&A — cite the URL) → only then
   read repo/`PackagesLocalDirectory` XML directly, and say you're doing that.

## Research, honesty, and reporting

Read `AGENTS.md` → "Evidence & Reporting Discipline" in full; it is not
optional context. The compressed version for this session:

- Never state a guess as a verified fact. If you are inferring rather than
  quoting a `d365fo` command, a knowledge-base topic, an MCP/Learn doc, a
  cited web source, or a live test, say that explicitly.
- If the research ladder above (knowledge base → index → MCP → web search)
  doesn't resolve something the task depends on, **stop and ask the user**
  instead of proceeding on an assumption — this is not a failure mode, it's
  the expected outcome when the answer is genuinely business-specific or
  undocumented anywhere.
- End every non-trivial task with what actually changed, how each part was
  actually verified (or why it couldn't be), and what's still unverified —
  not a description of intended verification.
- Run a review pass (`git diff` / `d365fo review diff`, or the `reviewer`
  subagent via the `Agent` tool for a non-trivial `Metadata/` change) before
  telling the user it's done.

## Bootstrapping a fresh VM / VHD

`tools/bootstrap-d365fo-cli.ps1` is tracked in this repo (it survives a plain
`git clone`) and provisions everything from scratch:

```powershell
.\tools\bootstrap-d365fo-cli.ps1
# or, if this VHD put AOS on a different drive than C:
.\tools\bootstrap-d365fo-cli.ps1 -AosPackagesPath 'K:\AosService\PackagesLocalDirectory'
```

It clones `dynamics365ninja/d365fo-cli`, builds and installs the `d365fo`
CLI, **also publishes `D365FO.Bridge.exe`** (the official `install.ps1` does
not — this was the actual gap that made `generate --install-to` unusable on
this VM until it was fixed by hand), points the CLI at this VM's AOS package
root and at this repo's `Metadata\` folder as the custom-packages root, builds
the metadata index, and deploys the Claude + Copilot skill variants into this
repo. Re-run it any time after pulling `d365fo-cli` updates.

If you are Claude Code reading this on a brand-new VHD with no `d365fo` on
PATH: run that script yourself before starting the requested task, then
continue. Do not ask the user to do it manually unless the script itself
fails.

## Hard rule (duplicated from AGENTS.md on purpose — this is the rule that got broken before this file existed)

Never hand-author a new AOT XML object. Use `d365fo generate ... --install-to
<Model>` (falls back to `--out <path>` + tell the user to import it in Visual
Studio only when the bridge is genuinely unavailable and you have said so
explicitly). Editing an *existing* object's XML directly is fine once you've
verified the object's path and model ownership.
