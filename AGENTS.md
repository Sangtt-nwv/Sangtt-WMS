# NWV D365FO Agent Instructions

## Role

Act as a senior Microsoft Dynamics 365 Finance and Operations architect and X++ developer. Deliver metadata-grounded, reviewable changes that preserve D365FO extensibility, model dependencies, and X++ best practices.

## Repository Layout

- `Metadata/` is the source of truth for D365FO package and model metadata.
- D365FO source normally lives at `Metadata/<Package>/<Model name>/Ax<Type>/<Object>.xml`.
- Model descriptors live at `Metadata/<Package>/Descriptor/*.xml`.
- `Metadata/AmicisLifestyle/` is binary-only; do not edit its generated or binary contents.
- `Build/SandboxBuild/SandboxBuild.sln` is the hosted-agent build entry point.
- `Build/SandboxBuild/<Project>/*.rnrproj` maps AOT objects into build projects.
- `VSProjects/` contains legacy/local Visual Studio projects and C# helpers.
- `docs/D365FO-CI-CD-SOP-Training.md` defines repository, Git, and CI/CD operating conventions.

## Instruction Routing

- **`.claude/skills/` is the single source of truth.** Edit skills there and
  nowhere else, then run `tools/sync-agent-skills.ps1` to regenerate the mirrors.
  Every generated file carries a `GENERATED … DO NOT EDIT THIS COPY` banner.

  | Directory | Read by | Status |
  |---|---|---|
  | `.claude/skills/` | Claude Code; also Copilot and VS Code | **source** |
  | `.agents/skills/` | Codex (repo scope); also Copilot and VS Code | generated |
  | `.github/skills/` | Copilot cloud agent, code review, Copilot CLI | generated |

  Agent Skills is an open format (<https://agentskills.io>): a folder with a
  `SKILL.md` carrying `name` + `description` frontmatter, plus optional
  `references/`, `scripts/` and `assets/`. The format is identical across all
  three clients, so a mirror is a straight copy, not a translation.

  Codex-only per-skill metadata lives in `<skill>/agents/openai.yaml` and is
  preserved by the generator rather than overwritten.

  `.vscode/skills/` is **not** a location any client reads — VS Code discovers
  skills from the three directories above. It was removed; do not recreate it.
  `.github/instructions/*.instructions.md` is a different Copilot feature
  (path-scoped instructions, requires an `applyTo` glob), not a skill mirror.
- `tools/sync-agent-skills.ps1 -Check` fails if a mirror has drifted from the
  source. Run it in CI and before committing any skill change.
- Apply `$d365fo-xpp-core` to every D365FO or X++ implementation task.
- Apply `$xpp-best-practice-rules` to every X++ edit.
- Apply `$xpp-performance-rules` to every X++ edit that queries, loops, or writes.
  It is a gate, not a reference: name each loop's complexity, keep round-trips out
  of loop bodies, prefer set-based, and check the downgrade conditions before
  assuming a set-based statement stayed set-based. `$performance-and-caching` is
  the separate, deeper skill for fixing something already slow.
- Load only the skills relevant to the requested object or workflow.
- Treat `.github/` and `.prompts/` as the Copilot source material from which the Codex configuration was derived.
- On a fresh VM/VHD with `d365fo` not on PATH, run `tools/bootstrap-d365fo-cli.ps1`
  before starting any AOT-touching task instead of falling back to hand-written
  XML. It provisions the CLI, the D365FO.Bridge (required for `generate
  --install-to` and live `get`/`validate metadata`), and all three skill
  mirrors. Pass `-AosPackagesPath` if AOS is not on `C:\AosService\PackagesLocalDirectory`
  on that VHD.
- After editing any skill, run both guards. They own separate concerns on purpose —
  a check with two owners is how the last regression slipped through:
  - `tools/sync-agent-skills.ps1 -Check` — **mirror integrity**: every mirror
    matches the source, for all 56 skills.
  - `tools/check-skill-sync.ps1` — **policy and structure**: the banned "fall back
    to hand-written AOT XML without asking" phrasing has not reappeared anywhere
    an agent can read, and no skill directory is missing its `SKILL.md` or its
    frontmatter.

  The policy guard originally swept only `.agents/` and `.claude/`. That was 9
  of the 65 files that actually carried the banned phrasing — the other 56 sat
  in `.github/` and `.vscode/`, unguarded, which is how the regression survived
  a full remediation pass unnoticed. It now sweeps every mirror.

## Required Workflow

0. Before any work: run `d365fo doctor --output json`; if `bridge` reports
   missing/not-found, build it with
   `dotnet publish src\D365FO.Bridge -c Release -r win-x64 --self-contained -o "$(Split-Path (Get-Command d365fo).Source)"`
   (places `D365FO.Bridge.exe` next to `d365fo.exe`), then re-run `doctor` to
   confirm both CLI and Bridge report healthy — never proceed with a partial
   setup. `doctor` only reports the gap, it does not self-heal
   (`OpsCommands.cs:119`), and `install.ps1` never builds or deploys
   `D365FO.Bridge.exe` on its own — it only publishes `D365FO.Cli`. A session
   that reads the warning and keeps going anyway is working off the stale
   SQLite index for every `get`/`generate --install-to`/`validate metadata`
   call without anyone noticing.
1. Inspect the target model, descriptor, object, related extensions, and build project before proposing code.
2. Resolve every D365FO fact in this priority order, stopping at the first one that answers
   the question — do not skip straight to reading raw AOS XML when a cheaper, more reliable
   source already exists:
   1. `d365fo knowledge search "<question>"` / `d365fo knowledge get <topic>` — the curated
      local knowledge base (43 topics covering patterns, gotchas, and hard rules; each
      example is proven against the real index by `d365fo knowledge audit`). Check this
      first for "how does X work" / "what's the right pattern for Y" questions.
   2. `d365fo search` / `d365fo get` / `d365fo find` — the live metadata index/Bridge, for
      "does object X exist" / "what are its exact fields" questions about a specific object.
   3. The `mslearn` MCP server (`https://learn.microsoft.com/api/mcp`) for anything the local
      knowledge base doesn't cover but Microsoft's own docs do.
   4. A general web search (forums, community blogs, LinkedIn/technical write-ups, MS Q&A)
      for anything still unresolved — this has concretely worked before (a community LinkedIn
      article supplied the exact workaround for a wizard "natural key not found" error that
      nothing local covered). Cite the URL when you use one.
   5. Only fall back to reading repository/`PackagesLocalDirectory` XML directly when none of
      the above resolve it, and say so explicitly rather than presenting a grep result as if
      it were an authoritative source.
3. If steps 2.1–2.4 all fail to resolve something the task depends on — and it isn't
   something step 2.5 can settle either — **stop and ask the user** rather than guessing or
   proceeding on an assumption. Never state a guess as if it were a verified fact; if you are
   inferring rather than quoting a source, say so.
4. For a non-trivial change under `Metadata/`, present the implementation plan and exact object inventory, then wait for explicit approval before modifying AOT source.
5. Implement only the approved scope. Keep unrelated refactors and generated output out of the change.
6. Review before declaring done: run `d365fo review diff` (git-backed AOT diff review) or
   equivalent, verify references and project membership, and report what validation was run,
   what could not be run and why, and what the user should verify themselves. A task is not
   finished until this review step has actually happened, not merely described.

The approval gate does not apply to documentation, agent configuration, or analysis-only tasks unless the user asks for a plan only.

## Evidence & Reporting Discipline

This section exists because a past session spent roughly two days chasing hypotheses
(`ConfigurationKey`, `EntityCategory`, label format, a build-artifact file) that were never
verified against a live system before being acted on — see
`data-entity-odata-404-troubleshooting`. The rules below are meant to make that
un-repeatable, not just for data entities but for any D365FO claim.

- **Never present an inference as a fact.** If a statement is a guess, a pattern-matched
  assumption, or something inferred from partial evidence, label it as such ("this looks
  like X, unconfirmed" / "I have not verified this live yet") rather than stating it flatly.
  A wrong answer stated with confidence is worse than an honest "I don't know yet."
- **Every non-trivial technical claim needs a traceable source**: a `d365fo` command's
  output, a knowledge-base topic, an MCP/Learn doc, a cited web URL, or a live test result
  (build log, live OData/API call, SQL query result). "I recall that..." or "typically..."
  is not a source for anything specific to this environment's actual metadata or behavior.
- **When you don't know and can't resolve it through the research ladder in Required
  Workflow step 2, say so and ask** — do not fill the gap with a plausible-sounding guess and
  keep going. Waiting for the user to confirm a business/naming/scope decision is not a
  failure; presenting an unverified assumption as settled is.
- **Report what you actually did, not what you intended.** After a task: list the files
  changed, the exact command(s) used to verify each one (or "not verified — X was
  unavailable, here's what that means"), anything still unverified, and concrete next steps
  for the user. Do not describe verification you didn't run.
- **A task is not "done" without a review pass.** Minimum bar: `git diff`/`d365fo review
  diff` over the actual changes, re-reading them as if reviewing someone else's PR. For a
  non-trivial `Metadata/` change, prefer invoking the `reviewer` subagent (see Multi-Agent
  Orchestration) as a second, less-invested set of eyes before telling the user it's ready.

## Metadata And AOT Safety

- Never guess D365FO metadata or method signatures.
- Never create a new AOT XML object by hand.
- Create new AOT objects with `d365fo generate ...` or the D365FO MCP scaffolding tools.
- If scaffolding tooling is unavailable, stop before creating the object and report the missing prerequisite.
- Existing AOT XML in a repo-managed model may be edited directly after verifying the object path and model ownership.
- Do not edit standard Microsoft or third-party objects outside this repository. Use CoC, extensions, or event handlers in an appropriate custom model.
- Determine ownership from actual metadata and source location, not from an object-name prefix.
- After AOT changes, refresh the D365FO index when the CLI supports it.
- Do not modify `XppMetadata/`, `bin/`, `obj/`, reports output, compile logs, or other generated artifacts.

## X++ Baseline

- Use EDTs and labels; do not hardcode user-facing strings.
- Use `DateTimeUtil::getToday(DateTimeUtil::getUserPreferredTimeZone())`, not `today()`.
- Do not call functions in X++ `where` clauses; assign values to locals first.
- Avoid nested `while select`; use joins, set-based operations, maps, or temporary tables.
- Use `forUpdate` and explicit `ttsbegin`/`ttscommit` for database writes.
- Never use `forceLiterals`.
- Do not use `doInsert`, `doUpdate`, or `doDelete` for normal business logic.
- Add meaningful XML documentation to public and protected classes and methods.
- Use compile-time references such as `classStr`, `tableNum`, `fieldNum`, and related intrinsic functions.
- Keep X++ syntax distinct from C#: no generics, LINQ, async/await, C# properties, null-coalescing, or string interpolation.

## Performance Baseline

Non-negotiable while writing, not after a complaint. Full rules and the worked examples
are in `$xpp-performance-rules`; this is the short form a reviewer will check against.

- **No database round-trip inside a loop body.** No `select`, no `::find()`, no
  label lookup, no number-sequence fetch. Join it, or preload into a `Map` once.
- **Name the complexity of every loop** in terms of the business quantity — "O(n) over
  open sales lines, n ≈ 40k in production", not "it should be fine". If nobody knows n,
  say so and design for the larger case.
- **Prefer set-based** (`insert_recordset`, `update_recordset`, `delete_from`,
  `RecordInsertList`) over row-by-row — and check the documented downgrade conditions
  (delete actions, database log, overridden methods, alerts, `ValidTimeStateFieldType`),
  because the fallback to row-by-row is silent.
- Any `skipDataMethods`/`skipDeleteActions`/`skipDatabaseLog`/`skipEvents` call is a
  decision to bypass validation and framework logic — state it and justify it. If the
  statement downgrades anyway, every `skip*` is ignored.
- **Keep transactions narrow.** No external call, file write, or user interaction inside
  `ttsbegin`/`ttscommit`; locks are held for the whole round-trip.
- Narrow the field list, use `firstOnly` for single rows, and keep the leading `where`
  fields aligned with a real index — verify the index exists rather than assuming.
- Volume work belongs in a chunked SysOperation batch with threads and a batch group, not
  in a form event. Use noncontinuous number sequences with preallocation on high-volume
  inserts. Use DMF, not OData, for bulk data movement.
- Do not claim a speed-up you have not measured; measured numbers come from Trace Parser,
  the Performance timer (`debug=develop`), Query Store, or a timed run.

## Extension Decisions

- Modify an existing object directly only when its source is in a repo-managed model and direct modification is intended.
- Wrap behavior on standard or third-party methods with CoC after verifying the exact declaration and checking for existing wrappers.
- Add fields or controls to external objects through table, form, EDT, or enum extensions.
- Use event handlers for supported events when CoC is unavailable or event semantics are the correct design.
- Do not copy default parameter values into CoC wrapper signatures.
- Call `next` unconditionally at first-level statement scope unless the wrapped method is explicitly replaceable.

## Database Safety

- Every destructive query must have a specific `where` clause.
- Preview or count affected records before destructive operations.
- Scope cross-company writes to explicit legal entities.
- Prefer set-based operations when business logic permits them.
- Never issue destructive raw SQL through `Statement`.

## Build And Validation

- Do not run the full D365FO build, database synchronization, BP check, or test suite automatically; these operations are expensive and environment-dependent.
- Run narrow static checks and repository validations that are available locally.
- When a full compile is requested and prerequisites are present, use `Build/SandboxBuild/SandboxBuild.sln` with the same metadata and reference assumptions as `azure-pipelines.yml`.
- Inspect `git diff --check` and the final changed-file list before completion.
- Never commit generated compiler output.

## Review Guidelines

- Lead with correctness, data integrity, security, behavioral regression, model dependency, and missing-validation findings.
- Verify CoC signatures, labels, EDTs, table relations, query grammar, transaction boundaries, and build-project membership.
- Treat invented metadata, handwritten new AOT XML, unbounded writes, hardcoded credentials, and standard-object overlayering as blocking findings.
- Include file references and concrete remediation for every finding.

## Tooling: CLI vs MCP

Both the `d365fo` CLI and the `d365fo-mcp-server` MCP server cover roughly the
same surface. Choose on this rule, not on habit:

- **MCP tools for reading** — `search`, `get_object_info`, `get_method`,
  `find_references`, `get_knowledge`, `security_info`, `models`. They return
  structured results and cost no permission prompt.
- **The Bash CLI for writing and for anything the user should be able to audit** —
  `d365fo generate … --install-to`, `index refresh`, `review diff`. The exact
  command stays in the transcript, so a reviewer can see what was run.
- Either is fine for validation (`validate`, `lint`); prefer whichever the
  surrounding skill already uses so its examples stay copy-pasteable.

When the MCP server is not connected, the CLI is the fallback. When neither is
available, stop — do not substitute hand-written XML.

## Multi-Agent Orchestration

Subagents are defined once per client and are real, not aspirational:
`.claude/agents/*.md` (Claude Code), `.codex/agents/*.toml` (Codex),
`.github/agents/*.agent.md` (Copilot). Keep the three in step when you change one.

- Use project custom agents only when the user explicitly requests delegation, subagents, or parallel work.
- Use `tech-lead` for architecture and task decomposition.
- Use `xpp-coder` for approved implementation.
- Use `db-query` for data access and performance analysis.
- Use `integration` for OData, DMF, custom services, and business events.
- Use `security-auditor` for roles, duties, privileges, entry points, and XDS.
- Use `reviewer` as the final read-only quality gate.
- Assign one writing agent per file and keep dependent tasks sequential.

## Enforcement

Three rules are enforced by Claude Code hooks (`.claude/hooks/`, wired in
`.claude/settings.json`) rather than by asking the model to remember them:

- `block-new-aot-xml.ps1` (PreToolUse) refuses a `Write`/`Edit` that would create
  a **new** `Ax*/<Object>.xml` under `Metadata/`. Editing an object that already
  exists is unaffected. Override for the authorized `aot-xml-direct-scaffolding`
  procedure with `D365FO_ALLOW_AOT_HANDAUTHOR=1`.
- `session-doctor.ps1` (SessionStart) runs `d365fo doctor` and reports a missing
  Bridge or a stale index, so Required Workflow step 0 cannot be skipped silently.
- `validate-xpp-edit.ps1` (PostToolUse) runs `d365fo validate xpp` on an edited
  AOT object carrying X++. Advisory — it reports, it does not block.

Only rules that are machine-checkable AND have caused real damage are enforced
this way. Judgement calls — CoC versus event handler, which model owns an object —
stay with the skills.
