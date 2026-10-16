# Repo map

Read this file first when using `fabric-paginated-report-parity`.

## 1. Source report understanding

- `docs/NWVVASSalesTaxStatement_Fabric_Demo_TaxTrans_Model.md`
  Primary narrative design note. Read the paginated-report guidance section before touching the RDL.
- `docs/NWVVASSalesTaxStatement_Fabric_Demo_TaxTrans.sql`
  Early SQL/data-shaping baseline for the report logic.
- `docs/NWVVASSalesTaxStatement_Fabric_Field_Lineage.csv`
  Field lineage map between report fields and source entities.
- `docs/NWVVASSalesTaxStatement_Fabric_Table_Entity_Matrix.csv`
  Table/entity mapping for Fabric-side availability.

## 2. Generic guidance

- `docs/Fabric_Paginated_Report_Manual_Guide_Generic.md`
  Generic authoring and delivery guidance for Fabric paginated reports.
- `docs/NWVVASSalesTaxStatement_Fabric_Paginated_Report_Manual_Guide.md`
  Report-specific implementation guidance.
- `docs/NWVVASSalesTaxStatement_Fabric_Readiness_Assessment.md`
  Read when checking whether the current environment is ready for parity work.

## 3. SQL parity assets

- `docs/fabric-paginated/NWVVASSalesTaxStatement_ParityViews.sql`
  Creates the parity views.
- `docs/fabric-paginated/NWVVASSalesTaxStatement_Procedures.sql`
  Creates the stored procedures, including the main report detail contract.
- `docs/fabric-paginated/NWVVASSalesTaxStatement_Labels.sql`
  Creates the label dataset/view used for multilingual captions.
- `docs/fabric-paginated/Diagnostic_TaxStatement.sql`
  Diagnostic SQL for join/filter mismatches and source-data validation.

## 4. Runtime and publish context

- `docs/fabric-paginated/workspace-context.json`
  Current workspace, endpoint, report IDs, and observed runtime notes. Treat as drift-prone and re-verify live before writing.
- `docs/fabric-paginated/Codex-Prompt-Fabric-Paginated-Report-Parity.md`
  Ready-to-paste prompt for the connection-first VS Code/Codex trial or the full parity delivery flow.
- `docs/fabric-paginated/Publish-PaginatedReport-Runbook.md`
  Operational publish runbook.
- `docs/fabric-paginated/Publish-NWVVASSalesTaxStatement-In-Workspace.ps1`
  NWVVAS-specific publish helper when the workspace context is already known.
- `docs/fabric-paginated/README.md`
  Current scaffold summary, known constraints, and publish notes.

## 5. RDL and helper scripts

- `docs/fabric-paginated/NWVVASSalesTaxStatement_ParityScaffold.rdl`
  Current main parity scaffold.
- `docs/fabric-paginated/NWVVASSalesTaxStatement_FirstPass.rdl`
  Earlier first-pass scaffold.
- `docs/fabric-paginated/Repair-RdlParameterLayout.ps1`
  Repairs and rebuilds `ReportParametersLayout`.
- `tools/fabric-paginated/Build-PaginatedReportDefinition.ps1`
  Builds definition payloads from the `.rdl`.
- `tools/fabric-paginated/Publish-PaginatedReportViaImport.ps1`
  Imports or overwrites the paginated report in Fabric and verifies datasource health.
- `tools/fabric-paginated/Build-ReportLabelView.ps1`
  Label-view helper.
- `tools/fabric-paginated/Update-NWVVASSalesTaxStatementRdlLabels.ps1`
  Label update helper for the RDL.

## 6. Generated artifacts

- `docs/fabric-paginated/out/*.json`
  Publish payload outputs.
- `docs/fabric-paginated/out/*.rdl`
  Hydrated or repaired runtime artifacts.

Do not treat generated output as the primary source unless the task is specifically to inspect the exact payload that was published.
