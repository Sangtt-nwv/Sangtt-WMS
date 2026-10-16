# GitHub Copilot — D365 Finance & Operations X++ Instructions
# Effective: July 2026 | Platform: D365FO 10.0.x+ | Toolchain: d365fo CLI + Visual Studio 2022

> These instructions are **always-on** and govern every AI-assisted coding task in this repository.
> Individual `skills/<name>/SKILL.md` files are loaded **on-demand** by semantic match on their `description`.
> When there is a conflict, the more-specific skill file takes precedence.

---

## 🔴 ABSOLUTE RULES — NEVER violate these

1. **TOOLCHAIN & FALLBACK POLICY (AOT XML Generation).**
   - **Primary (`d365fo` available):** Always prioritize `d365fo generate …` CLI commands when available.
   - **If `d365fo` is missing / not on PATH:** **STOP and report the missing prerequisite.** Do NOT fall back to hand-authoring new AOT XML — that is what caused the OData routing incident described in `PROVENANCE.md`. Run `tools/bootstrap-d365fo-cli.ps1` to provision the CLI and Bridge, then retry. Editing an *existing* object's XML remains allowed.

2. **NO OVER-LAYERING.**
   Never modify standard (Microsoft-shipped) objects directly.
   Use the Extension pattern only: `TableExtension`, `FormExtension`, `EdtExtension`,
   `EnumExtension`, and Chain-of-Command (`_Extension` class suffix).

3. **NO `today()`.**
   Always use `DateTimeUtil::getToday(DateTimeUtil::getUserPreferredTimeZone())`.

4. **NO HARDCODED UI STRINGS.**
   Every `info()`, `warning()`, `error()`, `Box::*` argument must be a label token (`@File:Key`).
   Run `d365fo labels search` before creating new labels.

5. **NO NESTED `while select` LOOPS.**
   Use `join`, `exists join`, `notExists join`, or pre-load to `Map`/temp table.

6. **NO HALLUCINATED SYMBOLS.**
   Every class, method, field, or EDT referenced in generated X++ must be confirmed with
   `d365fo get …` or `d365fo search …` before writing.
   `d365fo validate references --file <f>` is the final gate (exit 2 = fail).

7. **NO AUTO-RUN OF SLOW COMMANDS.**
   Never auto-run `d365fo build`, `d365fo bp check`, `d365fo sync` without explicit user request.
   Always end with: *"Run `d365fo build` when ready."*

8. **NO CONSTRUCTOR WRAPPING VIA COC.**
   Constructors cannot be wrapped. Extension class constructors must be `public void new()`.

9. **NO `doInsert` / `doUpdate` / `doDelete` in business logic.**
   Reserved for data-fix/migration scripts only.

10. **NO `forceLiterals` in queries.** SQL injection risk. Use `forcePlaceholders` or omit.

---

## 📋 SKILL FILE MAP

Skills are loaded on-demand from `.github/skills/<name>/SKILL.md` based on semantic match.

| Domain | Skill Name | Trigger Words |
|--------|-----------|---------------|
| X++ Best Practices | `xpp-best-practice-rules` | any scaffold/edit |
| Class Authoring | `xpp-class-authoring` | "create class", "add method", SysOperation, RunBase |
| Class & Method Rules | `xpp-class-and-method-rules` | modifiers, constructors, extension methods |
| Chain of Command | `coc-extension-authoring` | "wrap method", "CoC", "modify standard method" |
| Object Extensions | `object-extension-authoring` | "extend table/form/EDT/enum", "add field" |
| Table Scaffolding | `table-scaffolding` | "create table", "scaffold table", "add field" |
| Form Scaffolding | `form-pattern-scaffolding` | "create form", "list page", "dialog", "workspace" |
| Database Queries | `xpp-database-queries` | "select", "while select", "join", "aggregate" |
| SysOperation / Batch | `sysoperation-batch-patterns` | "batch job", "SysOperation", "RunBase" |
| Data Entities | `data-entity-scaffolding` | "data entity", "OData", "DMF" |
| Integration Patterns | `integration-patterns` | "OData", "custom service", "DMF", "business event" |
| Business Events | `business-events-authoring` | "business event", "Service Bus", "outbound notification" |
| Security | `security-hierarchy-trace` | "security", "role", "privilege", "duty" |
| Labels | `label-translation` | "label", "translate", "UI string" |
| Statement & Type Rules | `xpp-statement-and-type-rules` | data types, null, casting, switch |
| Event Handlers | `event-handler-authoring` | "event handler", "subscribe", "pre/post", "delegate" |
| Custom Services | `custom-service-authoring` | "custom service", "SOAP", "JSON REST endpoint" |
| Model Dependency | `model-dependency-and-coupling` | "model", "dependency", "coupling", "cycle" |
| Review & Checkpoint | `review-and-checkpoint-workflow` | "review", "accept", "diff", "checkpoint" |
| Workflow | `workflow-authoring` | "workflow", "approval", "work item", "canSubmitToWorkflow" |
| SSRS Reports | `ssrs-report-authoring` | "report", "SSRS", "RDP", "data provider" |
| Unit Testing & quality gates | `testing-and-quality` | "unit test", "SysTest", "mock", "test coverage", "validate xpp" |
| AOT XML Scaffolding | `aot-xml-direct-scaffolding` | "create AxClass", "create AxTable", "AOT XML", "no d365fo CLI", "write XML fallback" |
| Financial Dimensions | `financial-dimensions-patterns` | "DefaultDimension", "DimensionAttributeValueSetStorage", "financial dimension", "dimension value" |
| Number Sequences | `number-sequence-patterns` | "number sequence", "NumberSeqDatatype", "NumberSeqFormHandler", "numRef", "voucher number" |
| Ledger Posting | `ledger-posting-patterns` | "post journal", "LedgerJournalEngine", "LedgerJournalCheckPost", "general ledger", "LedgerJournalTrans" |
| Error Handling | `error-handling-and-logging` | "throw error", "try catch", "retry", "exception", "ttsabort", "CLRError", "SysLog", "Infolog" |
| Data Upgrade | `data-upgrade-and-migration` | "data upgrade", "PreSync", "PostSync", "ReleaseUpdateDB", "migration script", "data fix" |

---

## 🏗️ STANDARD DEVELOPMENT WORKFLOW

```
1. PRE-FLIGHT  → d365fo prepare change/create … --output json
                 (grounding token + collision check + suggestions)

2. SCAFFOLD    → d365fo generate … --grounding-token <token> --install-to <Model>

3. VALIDATE    → d365fo validate references --file <f> --output json
                 d365fo validate xpp --file <f> --output json

4. LINT        → d365fo lint --category <cat> --output json   (fast, no VM)

5. INDEX       → d365fo index refresh --model <Model>

6. DIFF/REVIEW → d365fo review diff --base HEAD~1 --output json

7. BUILD/BP    → Only on user request:
                   d365fo build --output json
                   d365fo bp check --output json
```

---

## 🏛️ ARCHITECTURE PRINCIPLES

### Extension Model (Non-negotiable)
- **Table/Form/EDT/Enum changes** → Object Extensions
- **Class behavior changes** → Chain of Command (`_Extension` class)
- **New standalone code** → New classes/tables in your custom model
- **Over-layering** → **FORBIDDEN**

### Model Isolation
- All custom objects live in a **dedicated extension model**
- Never add custom objects to `Application Suite` or `Application Platform`
- Layer order: `AppPlatform → AppFoundation → AppSuite → [Custom]`

---

## 🔐 SECURITY RULES

- Scaffold order: **MenuItems → Privileges → Duties → Roles**
- Never recommend `System Administrator` role for troubleshooting
- `d365fo security coverage <Name> --type Role` before and after every security change

---

## ⚡ PERFORMANCE RULES

Apply the `xpp-performance-rules` skill to every X++ edit that queries, loops, or writes.
It is a gate, not a reference — performance is a correctness property here. Use
`performance-and-caching` only when fixing something already slow.

- **No database round-trip inside a loop body** — no `select`, no `::find()`, no label or
  number-sequence lookup. Join it, or preload once into a `Map`. This is the single most
  common real defect in custom code here, and a reviewer treats it as blocking.
- **Name each loop's complexity** in terms of the business quantity, not "should be fine".
- No nested `while select` — use `join` / `exists join` / `notExists join`.
- Set-based operations over row-by-row: `insert_recordset`, `update_recordset`,
  `delete_from`, `RecordInsertList` — **but** check the silent-downgrade conditions first
  (delete actions, database log, overridden `insert`/`update`/`delete`, alerts,
  `ValidTimeStateFieldType ≠ None`). When a statement downgrades, every `skip*` is ignored.
- Any `skipDataMethods` / `skipDeleteActions` / `skipDatabaseLog` / `skipEvents` bypasses
  validation and CoC wrappers — state it and justify it.
- `firstOnly` when one row is expected; narrow the field list; keep leading `where` fields
  aligned with an index you verified exists.
- No function calls in `where` clauses — assign to locals first.
- `forUpdate` required before `.update()` / `.delete()`; wrap in `ttsbegin` / `ttscommit`,
  and keep that scope narrow — never call a service or write a file inside it.
- Volume work goes in a chunked SysOperation batch with threads and a batch group, not a
  form event. Use DMF, not OData, for bulk data movement.
- Never claim a speed-up you have not measured (Trace Parser, Performance timer with
  `debug=develop`, Query Store, or a timed run).

---

## 📦 TOOLCHAIN REQUIREMENTS

| Tool | Purpose | Required |
|------|---------|----------|
| `d365fo` CLI | AOT generation, search, validation | **Mandatory** |
| Visual Studio 2022 | Build, deploy | Required for full build |
| `xppbp.exe` | Full BP check | Windows VM only |
| `git` | Checkpoint workflow | Strongly recommended |

If `d365fo` is not in PATH: **DO NOT STOP**. Fallback to generating/editing valid AOT XML (`.xml`) directly on the open workspace or `C:\AOSService\PackagesLocalDirectory\<ModelName>\<ModelName>\`.
