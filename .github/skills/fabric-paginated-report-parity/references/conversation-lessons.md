# Conversation lessons

This file distills the useful knowledge from the prior NWVVAS Fabric paginated report work so a future agent does not need the original conversation log to recover the path.

## 1. Fabric MCP was not the only route

- Direct Fabric MCP login was blocked at one point by dynamic registration support issues.
- The Microsoft Fabric VS Code extension and local MCP server could still run independently.
- The reliable fallback in this repo was Power BI/Fabric REST plus local PowerShell scripts.

## 2. The target is a paginated report, not a canvas report

- The workstream is SSRS-like parity.
- The right artifact is `.rdl`.
- A standard `Report` item and a `PaginatedReport` item are not interchangeable in API calls.

## 3. SQL-side parity had to be made explicit

- It was not enough to point the report at raw tables.
- Views, labels, and a stored procedure were introduced so the flow is clearer and more maintainable.
- The main detail dataset moved to `dbo.usp_NWVVASSalesTaxStatement_GetData`.

## 4. Parameter layout errors were real and reproducible

- `rsInvalidParameterLayoutCellDefNotEqualsParameterCount` was caused by stale or missing `ReportParametersLayout`.
- The winning fix was to rebuild layout cells from the real parameter list before publish.

## 5. Unicode could break during layout repair

- A first repair flow accidentally corrupted Vietnamese text.
- The durable fix was BOM-aware reading plus explicit UTF-8 writing through the entire repair/build/publish chain.

## 6. Publish success did not guarantee runtime success

- A report could import or overwrite successfully and still fail to render in Fabric.
- One confirmed cause was datasource credentials missing after endpoint or catalog changes.
- Datasource verification after publish became mandatory.

## 7. Filter reset behavior came from parameter cascade design

- `DataAreaId` drives `LanguageCode`, `TaxVersionId`, and `TaxGroup`.
- `LanguageCode` also drives `TaxGroup`.
- Therefore changing a parent can refresh a child and send it back to its default.

## 8. Workspace context can drift

- Lakehouse and catalog names changed during the work.
- Runtime values such as catalog name, datasource IDs, and workspace item names must always be re-verified live before publish.

## 9. The reusable success pattern

The durable operating pattern for this repo is:

1. read the source report docs and SQL notes
2. prepare SQL parity objects
3. author or repair the RDL
4. publish through the repo script
5. verify datasource health and runtime render
6. only then treat the report as done

## 10. Trial first, publish later

- A safe first pass should use the ready-to-paste prompt in `docs/fabric-paginated/Codex-Prompt-Fabric-Paginated-Report-Parity.md`.
- For setup-only work, stop after verifying Fabric MCP, workspace access, and item visibility; do not publish until live runtime values and datasource credentials are confirmed.
- Keep `PaginatedReport` as the target item type and use the prompt sample to avoid rewriting the same instructions for each trial.
