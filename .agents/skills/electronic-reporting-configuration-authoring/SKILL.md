---
name: electronic-reporting-configuration-authoring
description: 'Create, repair, import, export, and version Microsoft Dynamics 365 Finance and Operations Electronic Reporting configurations through data models, XML formats, model mappings, destinations, and calculated fields. Use when the user asks to create an ER configuration, map an XML format to a model, map a model to a destination, fix ER Designer validation errors, use Exchange > Load from XML file or Export as XML file, add calculated fields, fix Path not found, fix Can not overwrite a version, or author CAMT/bank-statement ER XML.'
---
<!-- GENERATED from .claude/skills/electronic-reporting-configuration-authoring/SKILL.md by tools/sync-agent-skills.ps1 - DO NOT EDIT THIS COPY. Edit the source and re-run the script. -->

# Electronic Reporting Configuration Authoring

Use this skill for ER configuration work that is represented by exported ER XML. It is deliberately focused on Electronic Reporting structure and ER Designer behavior. Do not apply AOT, X++, build, or BP validation rules to an ER-only change unless the task also changes Finance and Operations code.

## Repository Reference Set

Use these files as the local schema and behavior references before creating or repairing an ER configuration:

- `VSProjects/NWVEB/NWVEB/Template XML ER/HSBC-BankStatement-Model.xml`
  - ER data model definition for `BankStatement`.
  - Root containers: `GroupHeader` and `Reports`.
  - Nested lists: `Reports`, `Reports/Balances`, `Reports/Entries`, `Entries/TransactionDetails`, and `TransactionDetails/RemittanceLines`.
- `VSProjects/NWVEB/NWVEB/Template XML ER/NWVEB-CAMT052-XML-Import.xml`
  - CAMT052 XML input format and import-oriented format structure.
  - Use it to understand `ERTextFormat`, XML elements, multiplicity, and `DataImportSupport`.
- `VSProjects/NWVEB/NWVEB/Template XML ER/NWVEB-Mapping-Format2Model.xml`
  - XML format to `BankStatement` model mapping.
  - Use it to copy model-path binding syntax and exact ER expression serialization.
- `VSProjects/NWVEB/NWVEB/Template XML ER/NWVEB-Mapping-Model2Destination.xml`
  - `BankStatement` model to reconciliation-table destination mapping.
  - Use it for `ERModelMapping Direction="1"`, `ERTableDestination`, calculated fields, list flattening, fallback lines, and bank-account lookup patterns.
- `VSProjects/NWVEB/NWVEB/Template XML ER/HSBC-XML-LTR.xml`
  - Outbound XML format example for LTR.
  - Use it for model-to-format export structure and format versioning.
- `VSProjects/NWVEB/NWVEB/Template XML ER/HSBC-XML-NAPAS.xml`
  - Outbound XML format example for NAPAS.
  - Use it as a second export-format peer rather than trusting one format alone.
- `VSProjects/NWVEB/NWVEB/Template-XML-ER/Electronic-Reporting-CAMT52.md`
  - CAMT.052/CAMT52 inbound-import troubleshooting and authoring guide.
  - Load this specialized guide whenever the ER input format is CAMT52 or CAMT.052.

The repository exports are the source of truth for element order, attributes, `ID.` values, expression node names, and empty collection shapes. Do not invent an ER XML schema from memory when a peer export is available.

## Configuration Graph

Reason about the complete ER graph before editing one component:

```text
ER data model
    |
    +--> XML/text format for inbound or outbound data
    |
    +--> format-to-model mapping       (input format -> model)
    |
    +--> model-to-destination mapping  (model -> tables or other destinations)
    |
    +--> model-to-format mapping       (model -> output format, when applicable)
```

For the repository's CAMT052 workflow, the normal dependency order is:

```text
HSBC-BankStatement-Model
    -> NWVEB-CAMT052-XML-Import
    -> NWVEB-Mapping-Format2Model
    -> NWVEB-Mapping-Model2Destination
```

For outbound examples, inspect the references in `HSBC-XML-LTR.xml` and `HSBC-XML-NAPAS.xml` and follow the actual `Ref. ID.` graph. Do not infer direction from a filename alone.

## ER XML Component Shapes

An exported ER configuration normally has this outer shape:

```xml
<?xml version="1.0" encoding="utf-8"?>
<ERSolutionVersion
    DateTime="..."
    Description="..."
    Number="N"
    PublicVersionNumber="x.y.z"
    VersionStatus="1">
  <Prerequisites>...</Prerequisites>
  <Solution>
    <ERSolution ID.="{solution-guid}" Base="{base-guid},N" ...>
      <Vendor>
        <ERVendor Name="NWV" Url="..." />
      </Vendor>
      <Contents.>
        <Ref. ID.="{component-guid}" />
      </Contents.>
    </ERSolution>
  </Solution>
  <Contents.>
    <ERDataModelVersion ...>...</ERDataModelVersion>
    <!-- or ERFormatVersion / ERModelMappingVersion -->
  </Contents.>
</ERSolutionVersion>
```

Use the exact component node for the object being changed:

- Model: `ERDataModelVersion` containing `ERDataModel`.
- Format: `ERFormatVersion` containing `ERTextFormat` or the matching format type.
- Model mapping: `ERModelMappingVersion` containing `ERModelMapping`.
- Destination mapping: `ERModelMapping` commonly has `Direction="1"` and an `ERMappingDestinationDefinition` with `ERTableDestination` nodes.

Preserve these details:

- `ID.` attributes and their version suffixes.
- `Base` and prerequisite references.
- `Model`, `ModelName`, and `ModelVersion` on model mappings.
- `Contents.` element names, including the trailing period.
- The order of children as produced by ER export.
- Empty collections such as `<ERPathsToCache />`, `<ERDataContainerBinding />`, and `<EREnumDefinitionList />`.

Well-formed XML is necessary but not sufficient. ER Designer also validates component identity, version identity, data-source scope, expression types, and destination paths.

## Versioning and Import Status

Treat version identity as a first-class part of every ER edit.

### Required rules

1. Read the current highest version from the existing export and from the FO configuration version list when available.
2. Never load an XML file that reuses an existing completed or draft version.
3. Increment the internal version number consistently:
   - `ERSolutionVersion Number`.
   - `ERDataModelVersion`, `ERFormatVersion`, or `ERModelMappingVersion Number`.
   - The suffix of the component `ID.` value, for example `{guid},5`.
4. Keep the base component GUID stable when creating a new version of the same configuration. Do not change the identity GUID merely to fix a formula.
5. Set a new `DateTime` and a useful description that identifies the change.
6. Use `VersionStatus="1"` for XML that must be imported as a completed version in this environment. `VersionStatus="0"` is draft and may be rejected by `Exchange > Load from XML file`.
7. Do not assume the public version and internal number are the same value. Preserve the repository's pattern and increment both consistently with the existing configuration list.
8. Whenever an ER XML file is modified, increment its version by one before handoff. For a configuration export, update the root and component version numbers, the component `ID.` suffix, and the public version consistently; preserve identity GUIDs and set a new `DateTime`.

For example, a mapping currently exported as public version `4.1.5`, internal number `4`, and mapping ID suffix `,4` becomes a new version such as public version `4.1.6`, internal number `5`, and mapping ID suffix `,5`.

### `Can not overwrite a version`

When FO shows `Can not overwrite a version`:

- Compare `PublicVersionNumber` with the versions already shown in FO.
- Compare the root `Number` with the component version `Number`.
- Compare the `ER...Version ID.` suffix with the component number.
- Check that the XML is not reusing a completed version as a draft or vice versa.
- Create a new unique version; do not delete or overwrite an existing FO version.
- Keep the mapping content unchanged while first repairing version metadata, so version errors are separated from formula errors.

## Calculated Fields

Calculated fields are the most common source of ER Designer path errors. Author them as actual ER data-source nodes, not merely as strings referenced by a binding.

### Independent serialization

Serialize each calculated field as its own `ERModelItemDefinition` with one `ValueDefinition`:

```xml
<ERModelItemDefinition>
  <ValueDefinition>
    <ERModelItemValueDefinition Label="cfBankAccount" Name="cfBankAccount">
      <ValueSource>
        <ERModelExpressionItem ExpressionAsString="FIRSTORNULL(cfBankAccountRows)" SyntaxVersion="1">
          <Expression>
            <ERExpressionListFirstOrNull>
              <List>
                <ERExpressionListItemValue ItemPath="cfBankAccountRows" />
              </List>
            </ERExpressionListFirstOrNull>
          </Expression>
        </ERModelExpressionItem>
      </ValueSource>
    </ERModelItemValueDefinition>
  </ValueDefinition>
</ERModelItemDefinition>
```

Do not group several unrelated calculated fields under one `ERModelItemDefinition`. FO may deserialize only the first value or fail to expose the other names, producing errors such as `Path not found 'cfBankCode'` even when the text appears elsewhere in the file.

### Formula and expression tree must match

Every `ERModelExpressionItem` stores both:

- `ExpressionAsString`: the formula displayed by ER Designer.
- `<Expression>`: the serialized expression tree used by ER.

When changing a formula, change both representations. A stale display formula or stale `ItemPath` can make Designer show an old expression, recreate a warning, or reject a binding.

Typical pairs include:

| ER formula | Serialized expression family |
|---|---|
| `FIRSTORNULL(list)` | `ERExpressionListFirstOrNull` |
| `ALLITEMS(list)` | `ERExpressionListAllItems` |
| `WHERE(list, condition)` | `ERExpressionListWhere` |
| `ISEMPTY(list)` | `ERExpressionListIsEmpty` |
| `EMPTYLIST(list)` | `ERExpressionListEmpty` |
| `IF(condition, false, true)` | `ERExpressionGenericIf` |
| String value | `ERExpressionStringItemValue` |
| Date value | `ERExpressionDateItemValue` |
| Real value | `ERExpressionRealItemValue` |
| Enum value | `ERExpressionEnumItemValue` |

Use dot notation in `ExpressionAsString` and slash notation in `ItemPath`, following the exports. For example:

```text
ExpressionAsString: model.cfFallbackEntriesSafe.cfEntryStatementId
ItemPath:          model/cfFallbackEntriesSafe/cfEntryStatementId
```

### Scope and `ParentPath`

The calculated field's `ParentPath` determines the record context in which its formula resolves:

- Root calculated field: omit `ParentPath` or use the same empty form as the local export.
- Report field: `ParentPath="model/Reports"`.
- Entry field: `ParentPath="model/Reports/Entries"`.
- Transaction-detail field: `ParentPath="model/Reports/Entries/cfEnumeratedTransactionDetails"`.
- Calculated fields on a filtered entry list: use the list data source's record scope, for example `ParentPath="model/cfFallbackEntriesSafe"`.

Define upstream calculated fields before dependent fields. Confirm that every path in both the formula text and expression tree belongs to the current `ParentPath` record structure.

### Bank-account calculated-field pattern

The supplied NWVEB mapping uses a root table data source and a parameter:

```text
pBankAccountCode: CompanyBankAccountId
BankAccountTable: table data source
```

The valid dependency chain is:

```text
cfBankAccountRows = FILTER(
    BankAccountTable,
    BankAccountTable.AccountID = pBankAccountCode
)

cfBankAccount = FIRSTORNULL(cfBankAccountRows)

cfBankCode = cfBankAccount.NWVEBVendorBankCode

cfBankAccountNo = cfBankAccount.AccountNum
```

The XML must contain independent definitions for all four names. Verify `AccountID`, `AccountNum`, and `NWVEBVendorBankCode` against the current metadata or a compiling/exported peer before using them. Never substitute a guessed field such as `BankGroupId` or `BankAccountNum`.

## Lists, Flattening, and Empty-List Safety

A table destination binding must receive a valid `Record list` with the structure expected by its child bindings. Avoid direct traversal through multiple nested record lists from a root destination binding.

### CAMT052 detail and fallback pattern

The repository's `BankStatement` hierarchy is:

```text
model
  Reports[*]
    Entries[*]
      TransactionDetails[*]
        RemittanceLines[*]
```

For one line per `TransactionDetails` and one fallback line per `Entry` without details, use this conceptual pattern:

```text
cfAllEntries = IF(
    ISEMPTY(model.Reports.Entries),
    EMPTYLIST(model.Reports.Entries),
    ALLITEMS(model.Reports.Entries)
)

cfEntriesWithoutDetails = WHERE(
    cfAllEntries,
    ISEMPTY(@.TransactionDetails)
)

cfAllEnumeratedTransactionDetails = ALLITEMS(
    cfAllEntries.cfEnumeratedTransactionDetails
)
```

In ER Designer, `@` means the current record in a list filter. If the exported XML uses a different serialized current-record path, copy that representation from a known ER export or let Designer generate it; do not invent an `ItemPath` form.

Bind the destinations to the calculated lists:

```text
LineByEntryFallback    -> model.cfEntriesWithoutDetails
LineByTransactionDetail -> model.cfAllEnumeratedTransactionDetails
```

Then bind every child field through the same current list context. Do not leave one child on a first-report path while the root uses an all-entry list.

### `FIRSTORNULL` warning

`FIRSTORNULL(model.Reports)` is acceptable only when the business rule explicitly needs the first report. It is not a valid substitute for processing multiple reports. Do not use a first-report helper for transaction lines, statement IDs, dates, or currencies when the source can contain multiple reports.

### Empty-list guards

When a formula traverses a nested list, guard the list before flattening or aggregating it when ER Designer reports a list warning. A common pattern is:

```text
IF(
    ISEMPTY(sourceList),
    EMPTYLIST(sourceList),
    ALLITEMS(sourceList)
)
```

For numeric or date values, use the correct empty fallback for the type. For list destinations, use `EMPTYLIST` with a list of the same record structure. `ISEMPTY` in an unrelated calculated field does not make a direct unsafe destination path safe; the destination root itself must bind to a safe list.

## Model Mapping and Destination Rules

### Format-to-model mapping

For input formats such as CAMT052:

- Bind the XML format paths to the exact model paths in `NWVEB-Mapping-Format2Model.xml`.
- Preserve list bindings such as `Reports` and `Reports/Entries` as list values.
- Preserve model field names and descriptor types from `HSBC-BankStatement-Model.xml`.
- Use explicit formula trees for boolean conversions, dates, numbers, and optional XML values.
- Do not change the model structure in a format-to-model mapping when the task only requires a destination fix.

### Model-to-destination mapping

For `NWVEB-Mapping-Model2Destination.xml`:

- Keep `ERModelMapping Direction="1"` for the model-to-destination mapping.
- Keep destination names stable, such as `Header`, `LineByEntryFallback`, and `LineByTransactionDetail`.
- Ensure each destination root binding returns the correct list or record type.
- Ensure child binding expression types match destination field types.
- Keep header and line keys consistent: `BankCode`, `BankAccountCode`, and `StatementId` must come from the intended context.
- For per-entry fields, do not use a root-level statement or currency value when multiple reports can exist.
- For accounting-currency conversion, use the line's amount, source currency, and posting date from the same entry/detail record.

### Destination field audit

Before import, enumerate every `ERDataContainerPathBinding` under each destination and verify:

- The `Path` belongs to a declared destination.
- The `ExpressionAsString` name or path is declared in the mapping data sources.
- The expression tree `ItemPath` matches the display formula.
- List roots use list expression nodes.
- Date, real, enum, string, and Int64 constants use the correct ER expression node family.
- No binding still references removed calculated fields or obsolete first-report helpers.

## Import and Export Workflow in FO

### Import XML configuration

Use this sequence when the user asks to load a configuration from XML:

1. Identify whether the XML is a model, format, format-to-model mapping, or model-to-destination mapping.
2. Parse the XML and inspect its prerequisite and `Ref. ID.` graph.
3. Import prerequisite components first. For the NWVEB CAMT052 flow, use the model before mappings.
4. Confirm the new version metadata is unique and `VersionStatus="1"` when the environment requires completed imports.
5. In FO, use `Configurations -> Exchange -> Load from XML file`.
6. Confirm that the new version appears instead of replacing an existing version.
7. Open the configuration in Designer and use ER's Validate action.
8. Resolve all `Path not found`, list-safety, type, and reference errors before runtime testing.

Do not use a draft XML version for an import when FO rejects draft configurations. Make the imported XML completed, then edit a draft in Designer only after it exists in FO.

### Export XML configuration

When exporting:

1. Select the exact configuration and version in FO.
2. Use `Configurations -> Exchange -> Export as XML file`.
3. Export labels separately only when labels are part of the requested handoff.
4. Preserve the exported file as the baseline for later changes.
5. Do not manually reconstruct a configuration by copying only the `Mapping` node; prerequisites, solution references, version identity, and component metadata are required.

## ER-Only Validation

Run lightweight ER validation after every edit. Do not substitute AOT/X++ validation for ER Designer validation.

### XML well-formedness

Use PowerShell or an equivalent XML parser:

```powershell
$xml = New-Object System.Xml.XmlDocument
$xml.Load('VSProjects/NWVEB/NWVEB/Template XML ER/NWVEB-Mapping-Model2Destination.xml')
if ($xml.DocumentElement.Name -ne 'ERSolutionVersion') {
    throw 'Unexpected ER root element'
}
```

### Version assertions

Check:

- Root `PublicVersionNumber`, `Number`, `VersionStatus`.
- Component version `Number`.
- Component `ID.` suffix.
- Required `Ref. ID.` and prerequisite references.
- No duplicate calculated-field names.

### Calculated-field assertions

For every calculated field:

- Exactly one `ERModelItemDefinition` contains the name.
- It contains one `ValueDefinition`.
- Its `ExpressionAsString` has a matching expression tree.
- Every `ItemPath` resolves to a declared data source or model field in the correct scope.
- Dependent fields are defined after their upstream fields.

### Scenario matrix

For CAMT052-style list mappings, validate at least these scenarios in ER Designer or a controlled test run:

- Empty `Reports`.
- One report with only detailed entries.
- One report with an entry whose `TransactionDetails` is empty.
- Multiple reports with entries in each report.
- A mixture of detailed and fallback entries.
- Empty optional dates, currencies, references, and remittance lines.
- Bank-account parameter matching one `BankAccountTable` row.
- Missing bank-code setup.

Expected behavior for the fallback design is one destination line per detail record and one fallback line per entry with no detail records.

## Common Errors and Repairs

### `Path not found 'cfBankCode'`

Cause: the binding references a name that is absent, grouped incorrectly, or scoped under the wrong `ParentPath`.

Repair:

- Add an independent `cfBankCode` calculated-field definition.
- Verify its formula and expression tree.
- Verify the upstream `cfBankAccount` definition.
- Check every binding and helper formula that uses the name.

### `Path not found 'cfBankAccount.AccountNum'`

Cause: `cfBankAccount` was referenced without defining the record returned by `FIRSTORNULL(cfBankAccountRows)`.

Repair the dependency chain in this order:

```text
BankAccountTable
    -> cfBankAccountRows
    -> cfBankAccount
    -> cfBankAccountNo
```

### `Path not found 'cfBankAccount.AccountNum'` after the name was added

Cause: several `ValueDefinition` nodes were grouped into one `ERModelItemDefinition` and ER did not expose all of them after import.

Repair: serialize each calculated field under its own `ERModelItemDefinition`, matching the independent-definition pattern in the local ER export.

### `Can not overwrite a version`

Cause: root or component version metadata matches an existing FO version.

Repair: create a new unique public/internal version and keep `VersionStatus="1"` for import.

### `List ... does not have any check for empty list case`

Cause: a destination or calculated field traverses a nested list directly from the root.

Repair:

- Flatten the list into a root calculated field.
- Guard the source list with `ISEMPTY` and `EMPTYLIST` when required.
- Filter the flattened list for fallback cases.
- Bind the destination root to the safe filtered list.
- Keep child bindings on that same list context.

### Formula text and expression tree disagree

Cause: only `ExpressionAsString` or only `<Expression>` was edited.

Repair: update both forms and compare their paths after parsing the XML.

### Version imports but Validate still reports old paths

Cause: FO loaded a different version or the XML contains stale calculated-field definitions/references.

Repair:

- Confirm the version selected in the FO configuration list.
- Export the loaded version back to XML and compare it with the workspace file.
- Search both `ExpressionAsString` and `ItemPath` attributes.
- Remove obsolete first-report helpers and old binding paths.

## Completion Checklist

Before handing off an ER configuration change:

- [ ] All six local reference exports were considered where relevant.
- [ ] The component type and dependency graph are identified.
- [ ] Version metadata is unique and internally consistent.
- [ ] `VersionStatus="1"` is used when FO requires completed XML imports.
- [ ] XML parses with `ERSolutionVersion` as the root.
- [ ] Every calculated field is independently serialized.
- [ ] `ExpressionAsString` and `<Expression>` are synchronized.
- [ ] All referenced paths resolve in their `ParentPath` scope.
- [ ] Nested lists are flattened and guarded where required.
- [ ] Destination root and child bindings use the same list context.
- [ ] No obsolete first-report or removed-field references remain.
- [ ] ER Designer Validate has been run after import.
- [ ] Empty-list, multiple-report, detail, and fallback scenarios have been tested.
- [ ] No AOT/X++ build or validator was claimed as ER validation.
