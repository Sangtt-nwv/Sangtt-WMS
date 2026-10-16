# Case study: NWVVASSalesTaxStatement

Use this file when the task is specifically about `NWVVASSalesTaxStatement` or when another developer needs the current known-good route for this repo.

## 1. Report objective

Create a Microsoft Fabric paginated report that matches the original `NWVVASSalesTaxStatement` behavior and layout as closely as possible, using Fabric-side SQL objects and a publishable `.rdl`.

## 2. Current scaffold strategy

The mature path in this repo is the parity scaffold:

- `docs/fabric-paginated/NWVVASSalesTaxStatement_ParityScaffold.rdl`

The earlier sandbox path is:

- `docs/fabric-paginated/NWVVASSalesTaxStatement_FirstPass.rdl`

Prefer `ParityScaffold` unless the task is explicitly to inspect the evolution history.

## 3. SQL object strategy

The current pattern is hybrid:

- header, lookup, and label data from views
- main detail data from stored procedure
- diagnostic queries kept outside the `.rdl`

Key SQL objects:

- `dbo.vw_nwvvas_tax_statement_header`
- `dbo.vw_nwvvas_tax_statement_line_catalog`
- `dbo.vw_nwvvas_tax_statement_version_lookup`
- `dbo.vw_nwvvas_tax_group_lookup`
- `dbo.vw_nwvvas_tax_statement_transaction_seed`
- `dbo.vw_nwvvas_tax_statement_detail_seed`
- `dbo.vw_nwvvas_report_label`
- `dbo.usp_NWVVASSalesTaxStatement_GetData`

## 4. Parameter model

The current parity scaffold uses these report parameters:

- `DataAreaId`
- `LanguageCode`
- `FromDate`
- `ToDate`
- `TaxVersionId`
- `ShowZeroLines`
- `TaxGroup`

Key behavior notes:

- `LanguageCode` default depends on `DataAreaId`
- `TaxVersionId` valid values depend on `DataAreaId`
- `TaxGroup` valid values depend on `DataAreaId` and `LanguageCode`
- `TaxGroup` default blank means `All`

This is why some filters reset after parent changes.

## 5. Current publish/runtime route

Preferred script:

- `tools/fabric-paginated/Publish-PaginatedReportViaImport.ps1`

This script now handles:

- RDL hydration
- parameter layout rebuild
- UTF-8-safe output
- import/overwrite
- datasource update
- datasource status verification

## 6. High-value fixes already learned

- Parameter layout must be rebuilt, not only removed.
- UTF-8 must be preserved through repair, build, hydrate, and publish.
- A report can publish successfully and still fail at runtime if datasource credentials are absent.
- Datasource verification after publish is mandatory.

## 7. Drift-prone runtime values

These values can change and must be re-verified live before publish:

- workspace ID
- report ID
- SQL server FQDN
- SQL catalog/database
- gateway ID
- datasource ID

Read `docs/fabric-paginated/workspace-context.json`, then verify the values live rather than assuming they are still current.

## 8. Completion criteria

Treat the task as complete only when all of the following are true:

- report layout matches the original closely enough for parity acceptance
- SQL contract and filters behave correctly
- multilingual labels render correctly
- `.rdl` can be reopened and republished without layout/encoding breakage
- Fabric runtime opens the report without datasource or parameter errors
