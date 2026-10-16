# D365 Finance & Operations X++ — NWVEI / NaviWorld Vietnam

> **Workspace:** NWVEI (E-Invoice) + NaviWorld Vietnam Management.
> **Models:** `NWVEI`, `NaviWorld Vietnam Management`, `NWVVAS`.
> **Toolchain:** `d365fo` CLI + MCP tools for metadata-grounded X++ authoring.

---

## 1. Core principle — never guess D365FO metadata

Training data is **outdated and incomplete** for D365FO. Before generating any X++ code, **query the index** via `d365fo` CLI or MCP tools and ground the answer in real names / signatures.

- On `ok: false` with code `*_NOT_FOUND` → **stop and ask** — do not invent a name.
- Always pass `--output json` in CLI calls.

---

## 2. Workspace models and layout

```
NWVEI/NWVEI/                     ← E-Invoice integration engine (Viettel, VNPT, BKAV, FPT, MISA, Vacom, ThaiSon)
NaviWorldVietnamManagement/       ← Shared management module
NWVVAS/                           ← VAS module
VSProjects/                       ← C# helper projects (FileEncryptor, License Template)
```

File layout: `<Model>/<Model>/Ax<Type>/<Name>.xml` — canonical D365FO structure.

### Owner models — direct edit policy

> **All three models (`NWVEI`, `NaviWorld Vietnam Management`, `NWVVAS`) are ISV-owned models in this repo.** The repo folders are **symlinked** into the AOS `PackagesLocalDirectory`, so edits here take effect immediately after a build — no deploy step needed.

**Consequences for code authoring:**

- **Direct edits to X++ source and AOT XML in this repo are allowed and preferred** — there is no need to create a separate extension model.
- **CoC is NOT required** when modifying a class, table, or form that lives inside one of these three models. Edit the source directly.
- **CoC IS still required** when wrapping standard Microsoft objects or objects from other ISV models that are NOT in this repo.
- `replace_string_in_file` / `edit_file` on `.xml` AOT files in this repo is permitted — but always run `d365fo index refresh --model <Model>` afterwards so the index stays current.
- New objects (tables, classes, forms, …) must still be scaffolded via `d365fo generate …` to get correct XML structure — never hand-write a new AOT XML file from scratch.

---

## 3. AOT file safety rules

### Owner models (this repo) — allowed operations

| Operation | Rule |
|---|---|
| Edit existing `.xml` AOT files in `NWVEI/`, `NaviWorldVietnamManagement/`, `NWVVAS/` | **Allowed** — direct edit via `replace_string_in_file`. Run `d365fo index refresh --model <Model>` after. |
| Read `.xml` AOT files to understand object shape | **Prefer** `d365fo get class/table/form <Name> --output json` — faster and index-grounded. |
| Create a new AOT object | **Always** use `d365fo generate …` — never hand-write a new `.xml` from scratch. |
| Modify class behaviour in an owned model | Edit the class source directly — CoC is NOT needed. |

### Non-owner models (Microsoft / other ISVs) — NEVER write directly

| Forbidden | Use instead |
|---|---|
| `create_file` on `.xml` AOT files outside this repo | `d365fo generate … --install-to <OwnedModel>` |
| Edit raw AOT XML of standard Microsoft objects | `d365fo generate extension …` or `d365fo generate coc …` |
| PowerShell / Python scripts to write any AOT XML | `d365fo generate …` |

### When `d365fo` fails

1. Report the exact error to the user.
2. Suggest the correct `d365fo` command.
3. **Skip the step** — never attempt script workarounds.
4. If no command exists, tell the user to perform it in Visual Studio AOT.

---

## 4. Non-negotiable X++ rules

Every X++ snippet must comply — no exceptions:

1. **NEVER guess method signatures** — run `d365fo get class <Name>` first.
2. **NEVER use `today()`** — use `DateTimeUtil::getToday(DateTimeUtil::getUserPreferredTimeZone())`.
3. **NEVER call functions in `where` clauses** — assign to a local first.
4. **NEVER hardcode strings in `info()` / `warning()` / `error()`** — use `@File:Label`. Search labels first: `d365fo search label "<text>"`.
5. **NEVER nest `while select` loops** — use `join`, `exists join`, `notExists join`, or pre-load to `Map` / temp table.
6. **ALWAYS search labels** before creating new ones. Exception: field inherits label from EDT — don't override.
7. **ALWAYS write `/// <summary>`** on public/protected classes and methods.
8. **NEVER call `[SysObsolete]` methods** — read the attribute message for the replacement.
9. **NEVER make instance fields `public`** — expose via `parmFoo` accessors.
10. **NEVER use `doInsert` / `doUpdate` / `doDelete`** for normal business logic — reserved for data-fix/migration only.
11. Standard data events: `[DataEventHandler]`. Custom delegates: `[SubscribesTo + delegateStr]`. Never mix.
12. **`TableGroup` ≠ `TableType`**. `TableGroup` = business role (`Main`, `Transaction`, `Parameter`, …). `TableType` = storage (`RegularTable`, `TempDB`, `InMemory`).
13. Class member variables go **inside** `class { }` in `sourceCode`; methods stay at top level.
14. **No overlayering of non-owned models** — for standard Microsoft / third-party objects use Extensions and CoC. For objects inside `NWVEI`, `NaviWorld Vietnam Management`, `NWVVAS` — edit directly.
15. **Set-based operations** (`insert_recordset`, `update_recordset`, `delete_from`) over row-by-row loops.
16. **Explicit `ttsbegin` / `ttscommit`** for all write ops. Exception handling outside transaction boundaries.
17. **SysPackExtensions** for extending `pack()` / `unpack()` — never corrupt the base container.
18. **Compile-time references** — use `classStr()`, `tableNum()`, `fieldNum()` — never hardcoded strings.
19. **EntireTable cache** only on static config tables — never on volatile transaction tables.
20. **Args class** for loosely coupled parameter transfer between forms and classes.

---

## 5. X++ select / while select grammar

```
select [FindOption…] [FieldList from] tableBuffer [index…]
       [order by | group by] [where …] [join … [where …]]
```

- `FindOption` keywords sit between `select` and the buffer — never on joined buffers.
- `crossCompany` belongs on the OUTER buffer only.
- `where` / `order by` / `group by` after the LAST `join`.
- `in` operator takes a `container`, not `Set` / `List` / `Map`.
- Join criteria use `where`, not `on` — X++ has no `on` keyword.
- `forceLiterals` is forbidden (SQL injection). Use `forcePlaceholders` or omit.
- `exists join` / `notExists join` instead of nested loops.
- Set-based ops over row-by-row loops.

---

## 6. Chain of Command (CoC) rules

> Detail: `$coc-extension-authoring`

**Pre-flight (mandatory):**
```sh
d365fo find coc <TargetClass>::<method> --output json   # duplicate check
d365fo get class <TargetClass> --output json             # exact signature
```

**Critical rules:**
- **NEVER copy default parameter values** into wrapper signature.
- `next` must be called **unconditionally** at first-level statement scope (not inside `if`/`while`/`for`; PU21+: allowed in `try`/`catch`/`finally`).
- Signature matches base exactly — same return type, parameters, `static` modifier.
- Extension class: `[ExtensionOf(…)] final class <Target>_<Suffix>`.
- Cannot wrap constructors. Cannot add new methods on form data sources/controls.

---

## 7. Class & method authoring rules

> Detail: `$xpp-class-and-method-rules`

- Default class access = `public`. Use `internal` / `final` / `abstract` deliberately.
- Constructor: `protected new()` + `public static construct()` factory.
- Modifier order: `[edit|display] [access] [static|abstract|final]`.
- Override must be at least as accessible as base method.
- All parameters pass-by-value.
- Extension methods: `static` class (not `final`), `_Extension` suffix, `public static` methods, first param = target type.
- Constants over macros: `public const str FOO = 'bar';`.

---

## 8. Statement & type rules

> Detail: `$xpp-statement-and-type-rules`

- `switch`: always `break`. Comma-list for multi-value branches.
- Ternary: both branches same type.
- **No database null** — use sentinel values (`0`, `""`, `dateNull()`, `utcDateTimeNull()`).
- Casting: prefer `as` + `is` over hard down-casts.
- `using` blocks for `IDisposable`.

---

## 9. Best-practice (BP) rules

> Detail: `$xpp-best-practice-rules`

| Rule | Enforcement |
|---|---|
| `BPUpgradeCodeToday` | No `today()` |
| `BPErrorLabelIsText` | No hardcoded UI strings |
| `BPErrorEDTNotMigrated` | Modern EDT relations only |
| `BPCheckNestedLoopinCode` | No nested `while select` |
| `BPCheckAlternateKeyAbsent` | Every table needs alternate key |
| `BPErrorUnknownLabel` | All referenced labels must exist |
| `BPXmlDocNoDocumentationComments` | Meaningful doc comments required |
| `BPDuplicateMethod` | No duplicate methods on inheritance chain |

**Never auto-run** `d365fo build` / `bp check` — say *"Run `d365fo build` when ready."*

---

## 10. Scaffolding — task-specific workflows

Each task type has a dedicated instruction file. Read the relevant file before executing.

### Table scaffolding
> `$table-scaffolding`

```sh
d365fo search table <name> --output json          # collision check
d365fo generate table <Name> --pattern main --field <F>:<Edt>:mandatory --install-to NWVEI
```
Patterns: `main`, `transaction`, `parameter`, `group`, `worksheet-header`, `worksheet-line`, `reference`.

### Class authoring
> `$xpp-class-authoring`

```sh
d365fo search class <name> --output json
d365fo generate class <Name> [--extends Base] --install-to NWVEI
```

### Form scaffolding
> `$form-pattern-scaffolding`

```sh
d365fo search form <name> --output json
d365fo find form-patterns --table <T> --output json
d365fo generate form <Name> --pattern <P> --table <T> --field <F> --install-to NWVEI
```
Patterns: `SimpleList`, `SimpleListDetails`, `DetailsMaster`, `DetailsTransaction`, `Dialog`, `TableOfContents`, `Lookup`, `ListPage`, `Workspace`.

### Data entity
> `$data-entity-scaffolding`

```sh
d365fo generate entity <Name> --table <T> --all-fields --public-entity-name <Singular> --install-to NWVEI
```

### Object extensions (Table / Form / EDT / Enum)
> `$object-extension-authoring`

```sh
d365fo find extensions <Target> --output json     # duplicate check
d365fo generate extension <Kind> <Target> <Suffix> --install-to NWVEI
```

Also covers EDT and Enum creation:
```sh
d365fo generate edt <Name> --base-type String --size 20 --label "@NWVEI:Key" --out …
d365fo generate enum <Name> --value "None:0:@SYS000" --value "Active:1:@SYS001" --out …
```

### Event handlers
> `$event-handler-authoring`

```sh
d365fo find handlers <Target> --output json       # duplicate check
d365fo generate event-handler --source-kind Table --source <Table> --event Inserted --install-to NWVEI
```
- Standard data events: `[DataEventHandler]`. Custom delegates: `[SubscribesTo + delegateStr]`.
- Handler methods must be `public static`.

### SysOperation / batch jobs
> `$sysoperation-batch-patterns`

```sh
d365fo generate sysoperation <Name> --param "AccountNum:CustAccount" --execution-mode ScheduledBatch --install-to NWVEI
```
Structure: DataContract + Service + Controller. Prefer SysOperation over RunBase for new code.

### Business events
> `$business-events-authoring`

```sh
d365fo generate business-event <Name> --contract-name <Contract> --payload "field:EdtType" --category <Cat> --install-to NWVEI
```

### Custom services
> `$custom-service-authoring`

```sh
d365fo generate custom-service <Name> --class-name <Class> --group-name <Group> --operation "method:ReturnType" --install-to NWVEI
```

### Security (privilege / duty / role)
> `$security-hierarchy-trace`

```sh
d365fo get security <Role> --type Role --output json          # top-down trace
d365fo get security <Object> --type Menuitem --output json    # bottom-up trace
d365fo generate privilege <Name> --entry-point <MenuItem> --access Update --install-to NWVEI
d365fo generate duty <Name> --privilege <Priv> --install-to NWVEI
d365fo generate role <Name> --duty <Duty> --install-to NWVEI
```

### Labels
> `$label-translation`

```sh
d365fo search label "<text>" --lang en-us --output json       # reuse first
d365fo resolve label @NWVEI:Key --output json                 # verify existence
```
- Prefer `@SYS*` when both match. EDT label inheritance — don't override.

### Model dependencies
> `$model-dependency-and-coupling`

```sh
d365fo models list --output json
d365fo models deps NWVEI --output json
d365fo models coupling --output json
```

### Integration patterns
> `$integration-patterns`

Four mechanisms: **OData** (sync CRUD), **Custom Services** (sync operations), **DMF** (bulk async), **Business Events** (outbound notifications).

---

## 11. NWVEI E-Invoice architecture

> Full detail: `$nwvei-einvoice-architecture`

### High-level flow
```
User → NWVEIIssueInvoice.main() [RunBaseBatch]
  → NWVEIIssueInvoiceFactory::construct(Provider)
    → NWVEIIssueInvoice_Viettel.processInvoice()
      → NWVEIJsonBuilder_Viettel::buildJson()          [data-driven mapping]
        ← NWVEIMappingTable / NWVEIProviderCategory / NWVEIMappingDetail
      → NWVEIApiClientViettel.postRequest()             [HTTP POST]
      → NWVEIHeader / NWVEILog update
```

### Key design principle
JSON payload is **entirely data-driven** — all field mappings live in `NWVEIMappingDetail`, keyed by `(Provider, ApiType, SourceDocument)`. No D365FO fields are hardcoded into the builder.

### Source documents
| `NWVEISourceDocument` | Journal Table | Line Table |
|---|---|---|
| `AccountReceivable` | `CustInvoiceJour` | `CustInvoiceTrans` |
| `AccountPayable` | `VendInvoiceJour` | `VendInvoiceTrans` |
| `Project` | `ProjInvoiceJour` | `ProjInvoiceItem/Empl/Revenue/OnAcc/Cost` |
| `InventoryManagement` | `InventTransferJour` or `InventJournalTable` | `InventTransferJourLine` or `InventJournalTrans` |

### API operations (`NWVEIAPIType`)
`RequestAccessToken`, `CreateDraft`, `PrintEInvoice`, `SendEInvoice`, `DeleteDraft` (local only), `CancelInvoice`, `UpdateTaxInfo`.

### Status machine
```
NotSend → [CreateDraft] → Draft → [SendEInvoice] → Issued
NotSend → [SendEInvoice] → Issued
Issued → [CancelInvoice] → Issued (EInvoiceType=Cancelled)
Any → [Error] → SendError
Draft → [DeleteDraft] → NotSend
```
**Important:** Cancellation is tracked via `EInvoiceType = Cancelled`, NOT via `Status`.

### Known technical debt (respect when coding)
- **TD-1:** Enum typo `DecreaseDdjustment` — replicate the typo in new code until formally renamed.
- **TD-2:** `getOrFetchFromApi_Token()` hardcodes Vacom builder — Viettel calls its own builder directly.
- **TD-3:** Success detection uses `strScan` on raw response, not structured JSON parsing.
- **TD-6:** `updateInventorySourceStatus()` uses `doUpdate()` — bypasses event handlers.

---

## 12. Git-checkpoint review workflow

> Detail: `$review-and-checkpoint-workflow`

1. **Before:** propose a branch `d365fo/<task>` or `git commit -am "checkpoint"`.
2. **During:** review `git diff` after each scaffold.
3. **After:** `d365fo review diff --base <ref> --output json` for AOT-semantic summary.
4. **Accept** = commit + merge. **Reject** = `git restore` or `git branch -D`.

Do NOT create branches autonomously — propose and wait.

---

## 13. CLI quick reference

### Read / inspect

| Need | Command |
|---|---|
| Class details | `d365fo get class <Name> --output json` |
| Method body | `d365fo read class <Name> --method <M>` |
| Table details | `d365fo get table <Name> --output json` |
| Form details | `d365fo get form <Name> --output json` |
| EDT details | `d365fo get edt <Name> --output json` |
| Enum details | `d365fo get enum <Name> --output json` |
| CoC wrappers | `d365fo find coc <Class>::<method> --output json` |
| Event handlers | `d365fo find handlers <Target> --output json` |
| Table relations | `d365fo find relations <Table> --output json` |
| Extensions | `d365fo find extensions <Target> --output json` |
| Usages | `d365fo find usages <method> --output json` |
| Label search | `d365fo search label "<text>" --output json` |
| Label resolve | `d365fo resolve label @File:Key --output json` |
| Security trace | `d365fo get security <Object> --type <Kind> --output json` |
| Form patterns | `d365fo find form-patterns --table <T> --output json` |
| Batch search | `d365fo search batch <q1> <q2> --kind class --output json` |
| Business event | `d365fo get business-event <Name> --output json` |
| Service | `d365fo get service <Name> --output json` |
| Entity | `d365fo get entity <Name> --output json` |

### Generate / scaffold

| Need | Command |
|---|---|
| Table | `d365fo generate table <Name> --pattern <P> --field <F>:<Edt> --install-to <Model>` |
| Class | `d365fo generate class <Name> [--extends Base] --install-to <Model>` |
| CoC | `d365fo generate coc <Target> --method <m> --install-to <Model>` |
| Form | `d365fo generate form <Name> --pattern <P> --table <T> --field <F> --install-to <Model>` |
| Entity | `d365fo generate entity <Name> --table <T> --all-fields --install-to <Model>` |
| Extension | `d365fo generate extension <Kind> <Target> <Suffix> --install-to <Model>` |
| Event handler | `d365fo generate event-handler --source-kind <K> --source <Obj> --event <E> --install-to <Model>` |
| SysOperation | `d365fo generate sysoperation <Name> --param "n:Edt" --install-to <Model>` |
| RunBase | `d365fo generate runbase <Name> [--batch] --dialog-param "n:Edt" --install-to <Model>` |
| Business event | `d365fo generate business-event <Name> --contract-name <C> --payload "f:Edt" --install-to <Model>` |
| Custom service | `d365fo generate custom-service <Name> --class-name <C> --group-name <G> --install-to <Model>` |
| Migration | `d365fo generate migration-script <Name> --source-table <S> --target-table <T> --install-to <Model>` |
| EDT | `d365fo generate edt <Name> --base-type String --label "@File:Key" --install-to <Model>` |
| Enum | `d365fo generate enum <Name> --value "Val:0:@Label" --install-to <Model>` |
| Query | `d365fo generate query <Name> --ds <Root> --join "<T>:<JoinKind>:<Parent>" --install-to <Model>` |
| Menu item | `d365fo generate menu-item <Name> --kind Display --object <Form> --install-to <Model>` |
| Privilege | `d365fo generate privilege <Name> --entry-point <MI> --access Update --install-to <Model>` |
| Duty | `d365fo generate duty <Name> --privilege <P> --install-to <Model>` |
| Role | `d365fo generate role <Name> --duty <D> --install-to <Model>` |
| Security policy | `d365fo generate security-policy <Name> --constrained-table <T> --install-to <Model>` |

### Index & health

```sh
d365fo doctor --output json
d365fo index status --output json
d365fo index refresh --model NWVEI
d365fo lint --output sarif
```

---

## 14. Instruction file index

Specialized workflow instructions are auto-loaded by Copilot based on `applyTo` patterns. For reference:

| Task domain | Instruction file |
|---|---|
| X++ core rules | `agent-skill-xpp-d365fo.instruction.md` |
| CoC extensions | `coc-extension-authoring.instructions.md` |
| Table scaffolding | `table-scaffolding.instructions.md` |
| Form + menu items | `form-pattern-scaffolding.instructions.md` |
| Class authoring | `$xpp-class-authoring` |
| Class/method rules | `xpp-class-and-method-rules.instructions.md` |
| Database queries | `xpp-database-queries.instructions.md` |
| Statement/type rules | `xpp-statement-and-type-rules.instructions.md` |
| BP rules | `xpp-best-practice-rules.instructions.md` |
| Object extensions | `object-extension-authoring.instructions.md` |
| Event handlers | `event-handler-authoring.instructions.md` |
| Labels | `label-translation.instructions.md` |
| Data entities | `data-entity-scaffolding.instructions.md` |
| Business events | `business-events-authoring.instructions.md` |
| Custom services | `custom-service-authoring.instructions.md` |
| Integration patterns | `integration-patterns.instructions.md` |
| SysOperation / batch | `sysoperation-batch-patterns.instructions.md` |
| Security | `security-hierarchy-trace.instructions.md` |
| Model dependencies | `model-dependency-and-coupling.instructions.md` |
| Git review workflow | `review-and-checkpoint-workflow.instructions.md` |
| NWVEI architecture | `NWVEI_EInvoice_Architecture_Baseline.instructions.md` |

---

## 15. Authoritative references

- X++ language reference — <https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/dev-ref/xpp-language-reference>
- `select` statement — <https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/dev-ref/xpp-data/xpp-select-statement>
- Chain of Command — <https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/extensibility/method-wrapping-coc>
- Classes & methods — <https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/dev-ref/xpp-classes-methods>
- Integration overview — <https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/integration-overview>

Combine Learn (syntax authority) with `d365fo` (real metadata from THIS environment).
