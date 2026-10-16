# End-to-end workflow

Use this file when the task is to deliver or re-deliver a Fabric paginated report with parity to an original report.

## 0. Choose the operating mode

If the user only wants a setup or connection trial:

1. Read `docs/fabric-paginated/Codex-Prompt-Fabric-Paginated-Report-Parity.md`.
2. Verify whether Fabric MCP is available in the current Codex/IDE session.
3. Verify workspace access and item visibility.
4. Stop after reporting status, config changes, active skills, and any blocker.

Do not publish the report in trial mode.

## 1. Read the original report intent

Read the report-specific model/design note and SQL baseline first.

Outcome of this step:

- report grain is known
- header dataset is known
- detail dataset is known
- grouping, sorting, totals, and helper fields are known
- parameter list is known

## 2. Decide the connectivity route

### Preferred route

- Fabric MCP in the current Codex/IDE session

### Fallback route

- Power BI/Fabric REST + repo PowerShell scripts

If MCP is missing or not authenticated, explicitly say that the Fabric MCP skill/tool is unavailable in this session and continue with the fallback route.

## 3. Verify runtime target

Before any write operation, confirm:

- workspace ID
- report display name
- SQL endpoint server
- SQL catalog/database
- whether datasource credentials exist or must be refreshed

Do not rely only on stale JSON context files for these values.

## 4. Prepare SQL-side parity objects

Run the SQL objects in this order unless the report explicitly requires another dependency order:

1. parity views
2. labels
3. stored procedures
4. diagnostics only when validation is needed

For this repo, those files are under `docs/fabric-paginated/`.

## 5. Prepare the RDL

Start from the scaffold that is closest to the target report.

Required checks:

- parameter prompts are correct
- lookup datasets are wired to the right parent parameters
- main dataset field list matches the SQL contract
- `ReportParametersLayout` is valid
- Unicode is preserved
- connection string placeholders can be hydrated safely at publish time
- page width, margins, footer strategy, and page-break behavior are already decided before the final preview

## 6. Publish

Preferred publish path in this repo:

- `tools/fabric-paginated/Publish-PaginatedReportViaImport.ps1`

This script should be the first choice because it already handles:

- hydrated RDL generation
- parameter layout repair
- payload import/overwrite
- datasource update
- datasource status verification

## 7. Verify after publish

Minimum checks:

- correct workspace/report ID returned
- datasource status is healthy
- report opens without datasource error
- report opens without parameter-layout error
- Vietnamese and multilingual captions still render correctly
- chosen filters behave as expected

## 8. Diagnose if parity is not exact

Use this split:

- SQL mismatch:
  compare source logic, views, procedure, and diagnostics SQL
- RDL mismatch:
  compare parameter definitions, datasets, tablix grouping, and expressions
- Fabric runtime mismatch:
  compare datasource binding, credentials, and service-side rendering

## 9. Expected output of a successful run

A successful run should leave:

- SQL parity objects available in Fabric
- `.rdl` source repaired and publishable
- generated payloads in `docs/fabric-paginated/out/`
- a live Fabric paginated report that renders and uses the intended datasource
