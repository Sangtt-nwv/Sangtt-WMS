---
name: fabric-paginated-report-parity
description: Use this skill when the task is to read and understand an existing Finance and Operations or SSRS-style report, reproduce it as a Microsoft Fabric paginated report with 1:1 parity, run a safe connection-first setup trial in VS Code/Codex, connect to Fabric through MCP or Power BI/Fabric REST fallback, generate or repair the RDL, publish or overwrite the report in Fabric, and troubleshoot the recurring issues in this repo such as parameter-layout mismatches, Unicode corruption, datasource credential drift, or cascading parameter resets. This skill is specialized for the NWVVASSalesTaxStatement workflow and the report artifacts stored in this repository, but its operating pattern also applies to similar parity-style Fabric paginated report work in the same repo. For documentation and handoff work around the same workflow, use `docs/Fabric_Paginated_Report_Manual_Guide_Generic.md` as the current UI-first baseline.
---
<!-- GENERATED from .claude/skills/fabric-paginated-report-parity/SKILL.md by tools/sync-agent-skills.ps1 - DO NOT EDIT THIS COPY. Edit the source and re-run the script. -->

# Fabric Paginated Report Parity

Use this skill for end-to-end Fabric paginated report delivery in this repo: understand the source report, map data flow, reach 1:1 layout and behavior parity, generate or repair the `.rdl`, publish safely to Fabric, and verify runtime health.

## Quick start

Always start in this order:

1. Read `references/repo-map.md`.
2. If the task is a connection-first trial or you need a ready-to-paste prompt, also read `docs/fabric-paginated/Codex-Prompt-Fabric-Paginated-Report-Parity.md`.
3. If doing end-to-end delivery, read `references/workflow.md`.
4. If the task is specifically `NWVVASSalesTaxStatement`, also read `references/case-study-nwvvas.md`.
5. If there is an error or regression, read `references/known-issues.md`.
6. If the task needs prior rollout decisions from the NWVVAS report work, read `references/conversation-lessons.md`.
7. If you are updating documentation or prompt assets, read `docs/Fabric_Paginated_Report_Manual_Guide_Generic.md` first and keep its current UI-first step-table style, black keyword emphasis, and no-`Runbook` section naming convention.

## What this skill covers

- Reading the source report intent and parity requirements from repo docs and SQL artifacts.
- Understanding Fabric connectivity routes:
  - Fabric MCP if available in the current Codex/IDE session.
  - Power BI/Fabric REST plus local PowerShell fallback when MCP is missing or blocked.
- Running a safe connection-first Codex/VS Code trial before publish.
- Preparing SQL-side parity assets:
  - views
  - stored procedures
  - label datasets
  - diagnostics
- Authoring, repairing, and validating paginated `.rdl` files.
- Publishing or overwriting the report in Fabric.
- Verifying datasource binding, credentials, parameter behavior, and render health.

## Operating rules

- Treat the repo files as the source of truth before using memory or assumptions.
- Do not invent workspace IDs, item IDs, endpoint names, tokens, or permissions.
- Prefer the existing repo scripts and prompt assets under `tools/fabric-paginated/` and `docs/fabric-paginated/`.
- If Fabric MCP is not callable in the current session, say that the Fabric MCP skill/tool is missing and continue with the REST/script fallback.
- Treat `docs/fabric-paginated/workspace-context.json` as a hint only; re-verify live before any write operation.
- Use `PaginatedReport` as the target item type. Do not substitute a generic `Report` item when the goal is SSRS-like parity.
- When editing or repairing `.rdl`, preserve UTF-8 and validate `ReportParametersLayout`.
- For SSRS-like parity, set page size, margins, header/footer strategy, and hard page breaks early, then validate in Print Layout or PDF before publish.
- For repo documentation and prompt assets, keep keyword emphasis as bold black text, avoid backticks for emphasis, and keep step-by-step thao tác in `No. | Step | Screenshot` tables.
- Before publish, verify:
  - target workspace
  - SQL endpoint server
  - SQL catalog/database
  - datasource credentials status

## Workflow

### 1. Build context

Read the report-specific design and SQL files first. For this repo, the baseline set is indexed in `references/repo-map.md`.

Goal of this step:

- identify the original report intent
- identify required datasets and lookup datasets
- identify grouping, sorting, subtotal, grand total, and helper fields
- identify whether the parity route is SQL view based, stored procedure based, or mixed

### 2. Confirm the Fabric route

Use MCP if it is available and authenticated.

If MCP is unavailable or blocked:

- use the Power BI REST flow and repo PowerShell scripts
- require explicit workspace ID, report name, SQL server, and SQL catalog

### 3. Prepare parity data assets

Deploy the SQL objects before pushing the final `.rdl`.

For this repo, the normal pattern is:

- lookup/header/detail views
- stored procedure for the main detail dataset
- label view for multilingual captions
- diagnostics SQL for data mismatch investigation

### 4. Author or repair the RDL

Use the repo scaffold and repair helpers.

Minimum checks:

- all parameters exist and match the expected UX
- `ReportParametersLayout` cell count equals report parameter count
- prompts and SQL text remain valid UTF-8
- lookup datasets only depend on the parameters that should truly cascade
- layout remains SSRS-like and pixel-oriented

### 5. Publish and verify

Prefer the repo publish script.

After publish, verify:

- report exists in the expected workspace
- datasource points to the expected server and catalog
- datasource credentials are configured
- parameter prompts and labels render correctly
- runtime no longer returns parameter-layout or datasource errors

### 6. Diagnose regressions

When behavior is wrong, classify the problem first:

- layout/authoring issue
- Unicode/encoding issue
- datasource/credential issue
- data parity issue
- cascading parameter UX issue

Then read `references/known-issues.md` and apply the matching fix path.

## Repo tools to reuse

- `docs/fabric-paginated/Codex-Prompt-Fabric-Paginated-Report-Parity.md`
- `docs/fabric-paginated/Publish-PaginatedReport-Runbook.md`
- `docs/fabric-paginated/Publish-NWVVASSalesTaxStatement-In-Workspace.ps1`
- `docs/fabric-paginated/Repair-RdlParameterLayout.ps1`
- `tools/fabric-paginated/Build-PaginatedReportDefinition.ps1`
- `tools/fabric-paginated/Publish-PaginatedReportToFabric.ps1`
- `tools/fabric-paginated/Publish-PaginatedReportViaImport.ps1`
- `tools/fabric-paginated/Build-ReportLabelView.ps1`

## References

- `references/repo-map.md`
  Use first. This is the file map and “what to read when” index.
- `docs/fabric-paginated/Codex-Prompt-Fabric-Paginated-Report-Parity.md`
  Use when you need the ready-to-paste VS Code/Codex trial or delivery prompt.
- `references/workflow.md`
  Use for the end-to-end delivery sequence.
- `references/known-issues.md`
  Use when the task includes an error, broken publish, bad render, or unexpected filter behavior.
- `references/case-study-nwvvas.md`
  Use when the task is about `NWVVASSalesTaxStatement` or when you need the current known-good route and artifacts from this repo.
- `references/conversation-lessons.md`
  Use when you need the distilled knowledge from the earlier agent conversation and its proven fixes, without replaying the raw chat.
