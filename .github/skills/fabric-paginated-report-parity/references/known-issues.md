# Known issues and fixes

Use this file when the task includes an error, regression, or confusing runtime behavior.

## 1. `rsInvalidParameterLayoutCellDefNotEqualsParameterCount`

Symptom:

- Fabric or Report Builder rejects save/update
- error says the number of defined parameters does not equal the number of cell definitions

Root cause:

- `ReportParametersLayout` is stale or malformed

Fix path:

1. Run `docs/fabric-paginated/Repair-RdlParameterLayout.ps1`
2. Re-verify parameter count against cell-definition count
3. Re-publish from the repaired RDL

Do not rely on “remove only” unless doing an emergency fallback. Prefer full rebuild.

## 2. Unicode or Vietnamese text becomes mojibake

Symptom:

- prompts or inline SQL string literals render as `PhÃ¡p nhÃ¢n`, `NgÃ´n ngá»¯`, and similar

Root cause:

- the RDL was read or written using unsafe Windows PowerShell encoding behavior

Fix path:

1. Treat the source `.rdl` as UTF-8
2. Use the repo scripts that were patched to read BOM-aware and write UTF-8 explicitly
3. Re-publish from the repaired source

Avoid direct ad-hoc rewrites with default `Get-Content` and `Set-Content` if encoding is not explicit.

## 3. Report opens with datasource error after endpoint or catalog rename

Symptom:

- report renders with “error contacting an underlying data source”

Root cause:

- datasource connection details were updated
- but service-side credentials are missing, stale, or detached

Fix path:

1. Verify report datasource via REST or Fabric UI
2. Check datasource credential status
3. Re-enter credentials in Fabric/Power BI service if required
4. Re-test report render

Important:

- `Authentication=ActiveDirectoryInteractive` in Report Builder is local authoring behavior
- it does not guarantee service-side credentials exist

## 4. Filter selections reset other filters

Symptom:

- choosing one filter resets another filter back to its default or `All`

Root cause:

- cascading parameter dependencies
- the child parameter is refreshed because its valid-values or default dataset depends on the parent

Fix path:

1. inspect which datasets feed `ValidValues` and `DefaultValue`
2. decide whether the cascade is intentional
3. if not intentional, remove unnecessary parent dependencies from the lookup dataset

In the current parity scaffold, `TaxGroup` depends on `DataAreaId` and `LanguageCode`, so changing `LanguageCode` can reset `TaxGroup`.

## 5. Publish says success but runtime is still broken

Symptom:

- import/overwrite succeeds
- runtime still fails

Root cause:

- publish only updated definition
- datasource health or credentials were not verified

Fix path:

1. check datasource details after publish
2. check datasource status after publish
3. only treat publish as done when datasource status is healthy

## 6. SQL objects exist conceptually but not in the current endpoint

Symptom:

- report query references an object that does not exist in the actual SQL analytics endpoint

Root cause:

- the object was not deployed
- the lakehouse/endpoint changed
- the report was moved to a new catalog

Fix path:

1. re-check the live endpoint
2. re-run parity SQL files
3. update workspace context and publish target
