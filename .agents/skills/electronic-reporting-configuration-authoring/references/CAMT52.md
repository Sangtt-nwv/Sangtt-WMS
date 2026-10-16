---
name: electronic-reporting-camt52
description: 'Use when creating, importing, repairing, or validating a Microsoft Dynamics 365 Finance and Operations Electronic Reporting inbound CAMT.052 (CAMT52) configuration, including XML formats, format-to-model mappings, model-to-destination mappings, UAT files, Path not found, File/Document, IsMatched/Data, RemittanceLines/Ustrd, payment details, or duplicate StatementLineId errors.'
---

# Electronic Reporting CAMT52

This is the CAMT.052-specific companion to `Electronic-Reporting.md`. Load it for an inbound CAMT52 ER configuration or when a CAMT052 run fails in ER Designer or during the model mapping run.

It is based on the verified NWVEB configuration graph and the runtime errors observed with the UAT file. Use the exported ER XML and the actual input file as the source of truth. Do not invent ER paths, expression node names, multiplicities, or version metadata.

## Scope and Configuration Graph

The repository workflow is:

```text
HSBC-BankStatement-Model
    -> NWVEB-CAMT052-XML-Import
    -> NWVEB-Mapping-Format2Model
    -> NWVEB-Mapping-Model2Destination
```

The working files are:

- `VSProjects/NWVEB/NWVEB/Template-XML-ER/HSBC-BankStatement-Model.xml`
- `VSProjects/NWVEB/NWVEB/Template-XML-ER/NWVEB-CAMT052-XML-Import.xml`
- `VSProjects/NWVEB/NWVEB/Template-XML-ER/NWVEB-Mapping-Format2Model.xml`
- `VSProjects/NWVEB/NWVEB/Template-XML-ER/NWVEB-Mapping-Model2Destination.xml`
- `VSProjects/NWVEB/NWVEB/Template-XML-ER-Test/UAT_USD-CAMT52.xml`
- `Metadata/NWVEB/NWVEB/AxClass/NWVEBBankStatementERHelper.xml`
- `Metadata/NWVEB/NWVEB/AxTable/NWVEBBankPaymentReconciliationLine.xml`

The data model root is `BankStatement` with these important paths:

```text
model
  GroupHeader
  Reports[*]
    Balances[*]
    Entries[*]
      TransactionDetails[*]
        RemittanceLines[*]
```

The `TransactionDetails` model descriptor contains the following fields used by the mappings:

```text
AccountServicerReference
CreditorAccountIban
CreditorName
CreditorOtherAccount
DebtorAccountIban
DebtorAgentMemberId
DebtorName
DebtorOtherAccount
DebtorPartyId
EndToEndId
InstructionId
MessageId
RemittanceLines[*].Ustrd
TransactionAmount
TransactionAmountExists
TransactionCurrency
TransactionId
```

## CAMT052 Input Contract

The UAT root is:

```xml
<Document xmlns="urn:iso:std:iso:20022:tech:xsd:camt.052.001.02">
```

Always verify both the local name and the namespace with a namespace-aware XML parser. The exact namespace is:

```text
urn:iso:std:iso:20022:tech:xsd:camt.052.001.02
```

Do not treat a namespace-qualified `Document` as equivalent to an unqualified `Document`. ER matches both the element name and namespace URI.

The UAT file used during this work contains four `Ntry` records. Its remittance counts are `1, 1, 0, 0`: the first two transaction details contain one `Ustrd`, and the last two have no `RmtInf`. Its entries also omit `AmtDtls`, `RltdPties`, `RltdAgts`, and `RmtInf` on the last two transactions. These missing optional nodes are intentional test cases.

The UAT contains no `Dbtr/Acct` or `Cdtr/Acct` account nodes and no transaction `InstructionId` or `TransactionId` nodes. Do not add speculative account paths. Bind model fields that have no source value to an empty string, or extend the format with verified optional nodes when a real bank file provides those values.

## Format Root: File and Document

For an import XML format, the format tree must use the following structure:

```text
Root
  File
    Document
      BkToCstmrAcctRpt
```

In exported ER XML, `File` is represented by `ERTextFormatFileComponent`:

```xml
<Root>
  <ERTextFormatFileComponent ID.="{file-component-guid}" Encoding="utf-8">
    <ExtensionParameters>
      <ERFileExtensionParameters />
    </ExtensionParameters>
    <FormattingParameters>
      <ERFormattingParameters />
    </FormattingParameters>
    <Contents.>
      <ERTextFormatXMLElement Name="Document" Multiplicity="1">
        <Contents.>
          <ERTextFormatXMLAttribute
              Name="xmlns"
              Value="urn:iso:std:iso:20022:tech:xsd:camt.052.001.02" />
          ...
        </Contents.>
      </ERTextFormatXMLElement>
    </Contents.>
  </ERTextFormatFileComponent>
</Root>
```

Copy the `ERTextFormatFileComponent` shape from a compiling peer such as `HSBC-XML-LTR.xml` or `HSBC-XML-NAPAS.xml`. Keep the component ID stable after it has been created. Do not use a fake GUID or put `Document` directly under `Root`.

The format tree is `File/Document`, but this repository's import-format datasource exposes the source path as `XML.Document` in model mapping expressions. Do not prepend `File` to `XML` expressions unless a current ER export explicitly shows that path.

## CAMT Element Multiplicity

Use the current format export to confirm values before editing. The verified NWVEB CAMT052 format uses this shape:

| Format element | Multiplicity | ER meaning in this export | Mapping rule |
|---|---:|---|---|
| `Document` | `1` | Mandatory single record | Direct root record |
| `BkToCstmrAcctRpt` | `1` | Mandatory single record | Direct child |
| `GrpHdr` | `1` | Mandatory single record | Direct child |
| `MsgPgntn` | `10` | Optional record | Check `IsMatched` before `Data` |
| `AddtlInf` | `10` | Optional record | Check `IsMatched` before `Data` |
| `Rpt` | `200` | Record list | Enumerate before binding fields |
| `Bal` | `200` | Record list | Enumerate before binding fields |
| `CdtLine` | `200` | Record list | Enumerate if mapped |
| `Ntry` | `200` | Record list | Enumerate before binding fields |
| `NtryDtls` | `10` | Optional record | Check `IsMatched` before `Data` |
| `TxDtls` | `200` | Record list | Enumerate before binding fields |
| `Refs` | `10` | Optional record | Check `IsMatched` before `Data` |
| `AmtDtls` | `10` | Optional record | Check `IsMatched` before `Data` |
| `RltdPties` | `10` | Optional record | Check `IsMatched` before `Data` |
| `RltdAgts` | `10` | Optional record | Check `IsMatched` before `Data` |
| `RmtInf` | `10` | Optional record | Check `IsMatched` before `Data` |
| `Ustrd` | `200` | Record list | Enumerate; its child `Value` is String |
| `AddtlNtryInf` | `10` | Optional record | Check `IsMatched` before `Data` |

In this export, `Multiplicity="10"` is the optional-record shape and `Multiplicity="200"` is the repeating-list shape. Do not change all `10` values to `1` merely to make the hierarchy look singular. That removes optionality and makes valid UAT records without those nodes fail as mandatory input. Use `IsMatched` and `Data` for optional elements.

## Format-to-Model Datasource Pattern

The format-to-model mapping has one import-format datasource:

```xml
<ERModelItemValueDefinition Label="XML" Name="XML">
  <ValueSource>
    <ERImportFormatDatasource FormatGUID="{format-guid}" />
  </ValueSource>
</ERModelItemValueDefinition>
```

The `FormatGUID` must equal the `ERTextFormat/@ID.` value in `NWVEB-CAMT052-XML-Import.xml`. The format version is carried by the format configuration and its companion `ERFormatMappingVersion`; the stable component GUID remains unchanged.

Use dot notation in `ExpressionAsString` and slash notation in `ItemPath`:

```text
ExpressionAsString: XML.Document.BkToCstmrAcctRpt.Rpt
ItemPath:          XML/Document/BkToCstmrAcctRpt/Rpt
```

The special calculated field names use quotes in formulas and no quotes in serialized `ItemPath` values:

```text
ExpressionAsString: XML.Document.BkToCstmrAcctRpt.'$enumeratedReports'.Value.Ntry
ItemPath:          XML/Document/BkToCstmrAcctRpt/$enumeratedReports/Value/Ntry
```

Do not use the obsolete source prefix `XML.CAMT52.Document` or `XML/CAMT52/Document`. The CAMT052 XML root is `Document`; `CAMT52` is a business message type, not an element in the input tree.

## Enumerate Nested Lists

Define the list contexts in dependency order. The exact ParentPath and serialized paths must match the current export:

```text
$enumeratedReports =
    ENUMERATE(XML.Document.BkToCstmrAcctRpt.Rpt)

$enumeratedBalances =
    ENUMERATE(
        XML.Document.BkToCstmrAcctRpt.'$enumeratedReports'.Value.Bal
    )

$enumeratedEntries =
    ENUMERATE(
        XML.Document.BkToCstmrAcctRpt.'$enumeratedReports'.Value.Ntry
    )

$enumeratedTransactionDetails =
    ENUMERATE(
        XML.Document.BkToCstmrAcctRpt.'$enumeratedReports'.Value.'$enumeratedEntries'.Value.NtryDtls.Data.TxDtls
    )
```

The expression tree for `ENUMERATE(list)` is serialized as `ERExpressionListCounter` with the list under `Input`:

```xml
<ERExpressionListCounter>
  <Input>
    <ERExpressionListItemValue ItemPath="..." />
  </Input>
</ERExpressionListCounter>
```

A list root binding must use `ERExpressionListItemValue`. A scalar leaf binding must use the expression node matching the target type, normally `ERExpressionStringItemValue` for CAMT text.

## Optional Data Guard Pattern

Never access `.Data` on an optional format element without checking `.IsMatched` first. Use an ER `IF` and keep the expression tree synchronized with the display formula:

```text
IF(
    XML.Document.BkToCstmrAcctRpt.'$enumeratedReports'.Value.'$enumeratedEntries'.Value.'$enumeratedTransactionDetails'.Value.Refs.IsMatched,
    XML.Document.BkToCstmrAcctRpt.'$enumeratedReports'.Value.'$enumeratedEntries'.Value.'$enumeratedTransactionDetails'.Value.Refs.Data.EndToEndId.Value,
    ""
)
```

The corresponding tree is:

```xml
<ERExpressionGenericIf>
  <Condition>
    <ERExpressionBooleanItemValue ItemPath=".../Refs/IsMatched" />
  </Condition>
  <FalseValue>
    <ERExpressionStringConstant />
  </FalseValue>
  <TrueValue>
    <ERExpressionStringItemValue ItemPath=".../Refs/Data/EndToEndId/Value" />
  </TrueValue>
</ERExpressionGenericIf>
```

Apply this pattern to all optional parents, including `Refs`, `AmtDtls`, `RltdPties`, `RltdAgts`, `RmtInf`, `NtryDtls`, `MsgPgntn`, `AddtlInf`, and `AddtlNtryInf` when the input contract permits them to be absent.

For the transaction amount and currency fields, use the same `AmtDtls.IsMatched` condition:

```text
TransactionAmount = IF(
    AmtDtls.IsMatched,
    AmtDtls.Data.TxAmt.Amt.Value,
    ""
)

TransactionCurrency = IF(
    AmtDtls.IsMatched,
    AmtDtls.Data.TxAmt.Amt.Ccy,
    ""
)

TransactionAmountExists = AmtDtls.IsMatched
```

For `Refs`, guard all fields that read `Refs.Data`, not only the field that first appears in the error:

```text
AccountServicerReference -> IF(Refs.IsMatched, Refs.Data.AcctSvcrRef.Value, "")
EndToEndId              -> IF(Refs.IsMatched, Refs.Data.EndToEndId.Value, "")
MessageId               -> IF(Refs.IsMatched, Refs.Data.MsgId.Value, "")
```

## RemittanceLines and Ustrd

The format element is a repeating XML element with a nested String field:

```xml
<ERTextFormatXMLElement Multiplicity="200" Name="Ustrd">
  <Contents.>
    <ERTextFormatString Name="Value" />
  </Contents.>
</ERTextFormatXMLElement>
```

Because `RmtInf` is optional, create the remittance list with two branches that return the same enumerated list type:

```text
$enumeratedRemittanceLines = IF(
    RmtInf.IsMatched,
    ENUMERATE(RmtInf.Data.Ustrd),
    EMPTYLIST(ENUMERATE(RmtInf.Data.Ustrd))
)
```

Do not use `EMPTYLIST(RmtInf.Data.Ustrd)` as the false branch when the true branch returns `ENUMERATE(RmtInf.Data.Ustrd)`. That produces different list structures and can remove the enumerate `Value` field at runtime.

The list binding is:

```text
Reports/Entries/TransactionDetails/RemittanceLines
    -> $enumeratedRemittanceLines
```

The leaf binding to the model String field is:

```text
ExpressionAsString:
  XML.Document.BkToCstmrAcctRpt.'$enumeratedReports'.Value.'$enumeratedEntries'.Value.'$enumeratedTransactionDetails'.Value.'$enumeratedRemittanceLines'.Value.Value

ItemPath:
  XML/Document/BkToCstmrAcctRpt/$enumeratedReports/Value/$enumeratedEntries/Value/$enumeratedTransactionDetails/Value/$enumeratedRemittanceLines/Value/Value
```

The two `Value` segments are intentional:

1. The first `Value` accesses the record payload of the enumerated `Ustrd` item.
2. The second `Value` accesses the `ERTextFormatString` field named `Value`.

The leaf expression type must be `ERExpressionStringItemValue`, because the model target `RemittanceLines/Ustrd` is a String. Binding only `...$enumeratedRemittanceLines.Value` passes a Record to a String target and causes:

```text
Can't convert data source value of type Record to the bound data model item of type String.
```

## Missing Model Fields

Before running the destination mapping, audit every model field that downstream calculated fields reference. In this configuration, `cfDetailCounterpartyAccount` and `cfDetailTransactionReference` depend on fields that may not exist in a CAMT052 input file:

```text
CreditorAccountIban
CreditorOtherAccount
DebtorAccountIban
DebtorOtherAccount
InstructionId
TransactionId
```

If the current input format does not contain verified source nodes for these fields, add String constant bindings:

```xml
<ERDataContainerPathBinding
    ExpressionAsString="&quot;&quot;"
    Path="Reports/Entries/TransactionDetails/CreditorAccountIban"
    SyntaxVersion="1">
  <Expression>
    <ERExpressionStringConstant />
  </Expression>
</ERDataContainerPathBinding>
```

Repeat for the other absent fields. Do not invent paths such as `Cdtr/Acct` or `Dbtr/Acct` merely because the data model has account fields. First inspect the actual bank XML and the current format tree. If account data is required, add the verified optional format elements and guard their `Data` access.

Every model leaf should have exactly one binding in the format-to-model mapping. A missing binding can surface later as a failure in an unrelated calculated field, for example:

```text
cfDetailCounterpartyAccount -> Value/CreditorAccountIban
```

## Model-to-Destination List Scope

The destination mapping has two line destinations:

```text
LineByEntryFallback
LineByTransactionDetail
```

The standard detail flow is:

```text
cfEnumeratedTransactionDetails = ENUMERATE(
    model.Reports.Entries.TransactionDetails
)

cfAllEntries = IF(
    ISEMPTY(model.Reports.Entries),
    EMPTYLIST(model.Reports.Entries),
    ALLITEMS(model.Reports.Entries)
)

cfAllEnumeratedTransactionDetails = ENUMERATE(
    ALLITEMS(model.cfAllEntries.cfEnumeratedTransactionDetails)
)
```

The outer `ENUMERATE` is required for a globally unique ordinal. `ALLITEMS` alone preserves the inner per-entry `Number`, which resets for each entry.

There are two scopes to distinguish:

- The inner calculated fields under `ParentPath="model/Reports/Entries/cfEnumeratedTransactionDetails"` are fields of the inner enumerated record and are accessed from the outer list through `model.cfAllEnumeratedTransactionDetails.Value.<field>`.
- Calculated fields defined under `ParentPath="model/cfAllEnumeratedTransactionDetails"` are fields of the outer enumerated record and are accessed as `model.cfAllEnumeratedTransactionDetails.<field>`.

Do not add `.Value` to an outer calculated field or omit `.Value` when accessing an inner field. This distinction caused runtime `Path not found` errors for payment detail and counterparty calculated fields.

The destination root must bind to the outer list:

```text
LineByTransactionDetail -> model.cfAllEnumeratedTransactionDetails
```

Use the correct scope for child bindings:

```text
StatementLineId -> model.cfAllEnumeratedTransactionDetails.cfGlobalStatementLineId
Inner detail fields -> model.cfAllEnumeratedTransactionDetails.Value.cfDetail...
Outer payment detail fields -> model.cfAllEnumeratedTransactionDetails.cfDetailPaymentDetailsN
```

## PaymentDetails1-4

The UAT has one `Ustrd` for the first two transactions and no remittance lines for the last two. Therefore this is correct:

```text
cfDetailPaymentDetails1 = first Ustrd when count >= 1
cfDetailPaymentDetails2 = empty when count < 2
cfDetailPaymentDetails3 = empty when count < 3
cfDetailPaymentDetails4 = empty when count < 4
```

Blank Details2-4 is not an error when the input has only one `Ustrd`. It is an error when a multi-line input has values but the output fields cannot resolve their scope.

For the outer flattened list, define all four payment fields independently under:

```text
ParentPath = model/cfAllEnumeratedTransactionDetails
```

Their list source is the nested model path:

```text
model.cfAllEnumeratedTransactionDetails.Value.Value.RemittanceLines
```

Use a guarded formula for each index:

```text
IF(
    COUNT(model.cfAllEnumeratedTransactionDetails.Value.Value.RemittanceLines) >= N,
    INDEX(model.cfAllEnumeratedTransactionDetails.Value.Value.RemittanceLines, N).Ustrd,
    ""
)
```

Serialize the list access with `ERExpressionListCount`, `ERExpressionListIndex`, and `ERExpressionGenericRelativeItemValue RelativePath="Ustrd"`. Define Details1, Details2, Details3, and Details4 independently; do not group several `ValueDefinition` nodes in one calculated-field definition.

## Duplicate StatementLineId

`NWVEBBankPaymentReconciliationLine.PrimaryIdx` is unique on:

```text
StatementLineId
BankCode
StatementId
BankAccountCode
```

`buildStatementLineId` hashes these inputs:

```text
account-servicer-reference
entry-reference
transaction-reference
transaction-code
transaction-sequence
```

The original detail enumeration reset `transaction-sequence` for each entry. Two structurally equivalent transactions at ordinal 1 could therefore generate the same hash and a duplicate line such as:

```text
TT VNMN00R2AN-44fdaff3
```

Preserve all source rows. Do not deduplicate with `GROUPBY` or discard entries merely because `NtryRef` repeats. The robust mapping fix is:

```text
cfAllEnumeratedTransactionDetails = ENUMERATE(
    ALLITEMS(model.cfAllEntries.cfEnumeratedTransactionDetails)
)
```

Then define an outer-scope field:

```text
cfGlobalStatementLineId = ERHelper.buildStatementLineId(
    model.cfAllEnumeratedTransactionDetails.Value.cfDetailAccountServicerReference,
    model.cfAllEnumeratedTransactionDetails.Value.cfDetailEntryReference,
    model.cfAllEnumeratedTransactionDetails.Value.cfDetailTransactionReference,
    model.cfAllEnumeratedTransactionDetails.Value.cfDetailTransactionCode,
    model.cfAllEnumeratedTransactionDetails.Number
)
```

Bind `LineByTransactionDetail/StatementLineId` to:

```text
model.cfAllEnumeratedTransactionDetails.cfGlobalStatementLineId
```

The global `Number` differentiates transactions from different entries while retaining all fields and rows. The fallback destination remains separate and must be audited independently if two fallback entries are genuinely identical.

A duplicate error can also mean that test rows already exist in the database. Before rerunning a table destination, check whether the same header/line was inserted by an earlier attempt. Use a new controlled statement or clean only approved test data; do not assume every duplicate is a formula defect.

## Common Errors and Repairs

| Runtime or Designer error | Root cause | Repair |
|---|---|---|
| `mandatory Element with the name File/Document must be filled in` | `Document` is directly under `Root` | Add `ERTextFormatFileComponent` and place `Document` under `FileComponent/Contents.` |
| `Expected element File/Document ... not found` | Root or namespace does not match the imported XML | Verify `Document` and `urn:iso:std:iso:20022:tech:xsd:camt.052.001.02` exactly |
| `Path not found XML...CAMT52...` | Obsolete business-type segment in source path | Use `XML.Document...`, not `XML.CAMT52.Document...` |
| `Path not found` under a nested list | Direct traversal of a list without an enumerated record context | Define `ENUMERATE(...)` and use `...Value...` in the correct scope |
| `The option is not matched. Please check the IsMatched field before using Data` | `.Data` read from a `Multiplicity="10"` element without a guard | Use `IF(parent.IsMatched, parent.Data..., fallback)` |
| `Can't convert ... Record ... to ... String` on `Ustrd` | Binding ends at enumerated record `.../Value` | Use the nested text field `.../Value/Value` with `ERExpressionStringItemValue` |
| `Value not found` for `Ustrd` | `ENUMERATE` and `EMPTYLIST` branches return different list structures, or an extra/missing `Value` segment | Use `EMPTYLIST(ENUMERATE(Ustrd))` and verify the format's child `Value` field |
| `cfDetailCounterpartyAccount` fails at account fields | Model fields have no format-to-model binding | Bind each absent field to `""`, or add verified optional CAMT account nodes |
| `cfDetailPaymentDetails2-4` are blank | Input has fewer than 2, 3, or 4 `Ustrd` values | This is expected; verify UAT remittance count before changing formulas |
| `The record already exists` for reconciliation line | Per-entry sequence reset, duplicate source identity, or prior test data | Use global outer enumeration and check existing database rows |
| `cfDetailPaymentMethod` fails through `cfDetailTransactionReference` | Upstream `Refs.Data.EndToEndId` is unguarded or unavailable | Guard `Refs`, then allow transaction-reference fallback to other model fields |

## Versioning Rules

Every modified ER XML file must be versioned before handoff. Read the highest version already imported into Finance and Operations; do not assume the workspace number is unused.

For a new version of the same component:

1. Increment `ERSolutionVersion/@Number`.
2. Increment the component version number (`ERFormatVersion`, `ERModelMappingVersion`, or equivalent).
3. Increment the numeric suffix of the component `ID.` attribute.
4. Increment the public version consistently, normally the last segment.
5. Set a new `DateTime` and a useful description.
6. Keep the identity GUID stable.
7. Keep `VersionStatus="1"` when the environment requires a completed XML import.
8. If a format version changes, update its companion `ERFormatMapping/@FormatVersion` and `ERFormatMappingVersion`.
9. Keep model `ModelVersion` unchanged unless the data model itself changed.

The verified workspace baseline after the CAMT52 repairs was approximately:

| Configuration | Internal version | Public version |
|---|---:|---:|
| `NWVEB-CAMT052-XML-Import.xml` | `6` | `4.1.6` |
| `NWVEB-Mapping-Format2Model.xml` | `12` | `4.1.13` |
| `NWVEB-Mapping-Model2Destination.xml` | `9` | `4.1.10` |

These numbers are historical baselines, not values to copy blindly. Always inspect the current configuration list and file before editing.

## Import and Validation Workflow

Use this order for a full CAMT52 configuration:

1. Parse the input UAT XML with a namespace-aware XML parser.
2. Verify the data model and its `TransactionDetails`/`RemittanceLines` descriptors.
3. Import or update the CAMT052 format with the `File/Document` hierarchy.
4. Import or update the format-to-model mapping after the format is available.
5. Import or update the model-to-destination mapping after the model mapping is available.
6. In ER Designer, run **Validate** on the format and both mappings.
7. Run the format-to-model mapping with an input containing optional nodes and missing optional nodes.
8. Run the model-to-destination mapping and inspect destination row keys.
9. Confirm that the selected Finance and Operations versions are the new versions, not an older draft or completed version.

For lightweight local checks, use PowerShell:

```powershell
$xml = New-Object System.Xml.XmlDocument
$xml.Load('VSProjects/NWVEB/NWVEB/Template-XML-ER/NWVEB-CAMT052-XML-Import.xml')
if ($xml.DocumentElement.LocalName -ne 'ERSolutionVersion') {
    throw 'Unexpected ER root'
}

$format = $xml.SelectSingleNode('//ERTextFormat')
$file = $format.SelectSingleNode('./Root/ERTextFormatFileComponent')
$document = $file.SelectSingleNode('./Contents./ERTextFormatXMLElement[@Name="Document"]')
if ($null -eq $document) {
    throw 'Missing File/Document format root'
}

$namespace = $document.SelectSingleNode('./Contents./ERTextFormatXMLAttribute[@Name="xmlns"]')
if ($namespace.Value -ne 'urn:iso:std:iso:20022:tech:xsd:camt.052.001.02') {
    throw 'CAMT052 namespace mismatch'
}
```

Also assert:

- The import mapping `FormatGUID` equals the format `ERTextFormat/@ID.`.
- Every `ExpressionAsString` has a synchronized expression tree.
- All list roots use list expression nodes.
- Every optional `.Data` access has an `.IsMatched` guard.
- `Ustrd` leaf bindings use the nested String `Value` field.
- The outer detail list is globally enumerated before generating line IDs.
- `LineByTransactionDetail/StatementLineId` uses the global ordinal field.
- No destination binding target is duplicated.
- All model leaves required by downstream calculated fields have a binding.

ER Designer Validate is the authoritative validation for ER behavior. XML well-formedness and local scripts can catch structural errors, but they cannot replace Finance and Operations ER Designer validation.

## Scenario Matrix

Before handoff, test at least:

- Empty `Reports`.
- One report with one entry and one `Ustrd`.
- One report with four `Ustrd` values; Details1-4 must receive positions 1-4.
- An entry with no `AmtDtls`; amount and currency must fall back safely.
- An entry with no `RltdPties` or `RltdAgts`.
- An entry with no `RmtInf`; remittance list must be empty without a `.Data` error.
- An entry with `Refs` but no `MsgId`.
- Multiple reports with entries in each report.
- Repeated `NtryRef` values with different transactions.
- Two equivalent transactions at the same inner ordinal; global line IDs must differ.
- A rerun against a statement already present in the reconciliation tables.
- A bank-account parameter that matches and one that does not match the configured account.

## Completion Checklist

- [ ] Input root is `Document` with the exact CAMT052 namespace.
- [ ] Format tree is `Root/File/Document`, with `ERTextFormatFileComponent`.
- [ ] `Document` and `BkToCstmrAcctRpt` are mandatory single records.
- [ ] CAMT lists use `Multiplicity="200"` and are enumerated before scalar access.
- [ ] Optional CAMT records use `Multiplicity="10"` and are guarded by `IsMatched` before `Data`.
- [ ] Source paths use `XML.Document`, with no obsolete `CAMT52` path segment.
- [ ] `$enumeratedReports`, `$enumeratedEntries`, `$enumeratedTransactionDetails`, and `$enumeratedRemittanceLines` are defined in dependency order.
- [ ] Both remittance list branches return the same enumerate list structure.
- [ ] `RemittanceLines/Ustrd` binds the nested String `Value` (`.../Value/Value`).
- [ ] All 17 `TransactionDetails` model fields have exactly one binding, including safe constants for fields absent from the UAT.
- [ ] Amount, currency, references, parties, agents, remittance, and optional header accesses are guarded where needed.
- [ ] PaymentDetails1-4 are independently defined in the outer flattened-list scope when that scope is the destination source.
- [ ] The outer transaction-detail list is `ENUMERATE(ALLITEMS(...))`.
- [ ] Global statement-line IDs use the outer `Number` and preserve every source row.
- [ ] Existing database rows have been considered before rerunning the destination import.
- [ ] Every edited XML file has a unique incremented version and updated timestamp.
- [ ] Format companion mappings reference the new format version.
- [ ] ER Designer Validate has been run in Finance and Operations.
- [ ] Empty-list, optional-node, multi-remittance, multi-report, duplicate-reference, and rerun scenarios have been tested.

Do not claim an ER-only change is validated by an AOT build or X++ BP check. Those tools are outside the ER validation boundary unless the task also changes X++ or AOT metadata.
