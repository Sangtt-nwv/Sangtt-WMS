# NWVVASSalesTaxStatement Fabric CSV Export

This folder contains a temporary, read-only export path for moving the source
data behind `NWVVASSalesTaxStatement` into Microsoft Fabric for a prototype
semantic model.

It does not create or edit D365FO AOT objects. It reads from a Tier-1/dev
`AxDB` SQL database and writes CSV files plus schema metadata.

## Files

| File | Purpose |
| --- | --- |
| `Export-NWVVASSalesTaxStatementCsv.ps1` | Exports selected SQL tables/views to CSV. |
| `NWVVASSalesTaxStatement.tables.json` | Table set configuration. |
| `Load-NWVVASSalesTaxStatementCsvToLakehouse.py` | Optional Fabric notebook helper to load CSV files into Delta tables. |

## Table Sets

| TableSet | Use |
| --- | --- |
| `Core` | Minimum set for the report fact and tax statement mapping. |
| `CustomSetupOnly` | Only the four custom NWVVAS setup/config tables. |
| `CoreAndFallback` | Core plus customer/project/VAT identity fallback sources. |
| `All` | Core, fallback, and header/legal entity sources. |

Core tables:

```text
TaxTrans
NWVVASTaxStatementLineTaxCode
NWVVASTaxStatementLine
NWVVASTaxStatement
NWVVASParameters
LedgerJournalTrans
```

## Quick Run

From a Tier-1/dev machine with SQL access:

```powershell
cd %REPO_ROOT%\tools\fabric-export

.\Export-NWVVASSalesTaxStatementCsv.ps1 `
  -ServerInstance "localhost" `
  -Database "AxDB" `
  -TableSet Core `
  -DataAreaId "dat" `
  -FromDate "2026-01-01" `
  -ToDate "2026-12-31" `
  -OutputPath "C:\Temp\nwvvas_sales_tax_statement_export" `
  -CreateZip
```

For a quick sample:

```powershell
.\Export-NWVVASSalesTaxStatementCsv.ps1 `
  -ServerInstance "localhost" `
  -Database "AxDB" `
  -TableSet Core `
  -DataAreaId "dat" `
  -FromDate "2026-01-01" `
  -ToDate "2026-12-31" `
  -MaxRows 1000
```

For SQL authentication:

```powershell
$credential = Get-Credential

.\Export-NWVVASSalesTaxStatementCsv.ps1 `
  -ServerInstance "sqlserver01" `
  -Database "AxDB" `
  -SqlCredential $credential `
  -TableSet CoreAndFallback `
  -DataAreaId "dat"
```

## Output

The script creates this structure:

```text
<OutputPath>
  data
    TaxTrans.csv
    NWVVASTaxStatementLineTaxCode.csv
    ...
  schema
    TaxTrans.columns.csv
    TaxTrans.indexes.csv
    ...
  manifest.csv
  run.json
```

Use `data/*.csv` as the temporary Fabric ingestion files. Use
`schema/*.columns.csv` and `schema/*.indexes.csv` to validate column types,
keys, and index intent while building the semantic model.

## Fabric Load

1. Create or open a Lakehouse.
2. Upload the exported `data` folder into:

```text
Files/nwvvas_sales_tax_statement/data
```

3. Open a Fabric notebook attached to the Lakehouse.
4. Paste or attach `Load-NWVVASSalesTaxStatementCsvToLakehouse.py`.
5. Run it to create Delta tables with lowercase names.

The notebook uses inferred schema for speed. For a production model, use the
exported `schema/*.columns.csv` files to define explicit Spark schemas.

## Important Notes

- Do not export `NWVVASTaxOutTmp` or `NWVVASCompanyInfoTmp` as source tables.
  They are TempDB report output tables and should be rebuilt in Fabric.
- Apply date filters for large transaction tables, especially `TaxTrans`.
- If a table is global and has no `DataAreaId` column, the script ignores the
  company filter for that table.
- This is a POC path. The durable path is custom DMF/Fabric-ready entities for
  `NWVVASTaxStatement`, `NWVVASTaxStatementLine`,
  `NWVVASTaxStatementLineTaxCode`, and `NWVVASParameters`.
