---
name: aot-xml-direct-scaffolding
description: 'Sanctioned direct AOT XML editing/repair procedure for D365FO extension objects (CoC classes, table/form extensions, EDTs, enums, security) when the d365fo CLI/bridge is genuinely unavailable AND the user has explicitly authorized hand-authoring. Use for AxClass, AxTableExtension, AxFormExtension, AxEnum, AxEdt, security XML, especially missing table field groups, invalid control types, DataContract ordering, and metadata deserialization errors. Do NOT use this skill to create a brand-new top-level AxDataEntityView, AxTable, or other new root object — see the incident note below.'
---
<!-- GENERATED from .claude/skills/aot-xml-direct-scaffolding/SKILL.md by tools/sync-agent-skills.ps1 - DO NOT EDIT THIS COPY. Edit the source and re-run the script. -->

> ⚠️ **Incident note (read before using this skill for a *new* object):** hand-authoring a
> brand-new `AxDataEntityView` from this skill's templates — instead of `d365fo generate
> entity --install-to` or the Visual Studio Data Entity Wizard — produced XML that compiled
> cleanly (0 errors, correct SQL view, correct XppMetadata) but never registered an OData
> route, because creating a *new* top-level object through Visual Studio's wizard (or the
> `d365fo` CLI's Bridge, `D365FO.Bridge.exe`, which drives the same live
> `IMetadataProvider` API) triggers kernel-side registration that a raw file write plus a
> manual Build + Synchronize Database does not. This cost roughly two days to diagnose. The
> fix that actually worked: create the object through the wizard/CLI bridge, *then* use this
> skill's patterns to edit its fields/keys/joins/labels afterward — editing an
> already-registered object is safe; the gap is specifically in how a *new* object gets
> created. See `AGENTS.md` → "Required Workflow" step 0 and `CLAUDE.md` → "Mandatory first
> steps" for the corresponding Bridge health-check rule.

## Toolchain & fallback policy

Prefer `d365fo generate …` (with `--install-to`, so it goes through the Bridge the same way
the wizard does) whenever `d365fo doctor --output json` reports the CLI and Bridge both
healthy. When it is not available: **stop and ask the user** before hand-authoring — do not
silently fall back. If the user explicitly authorizes hand-authoring anyway (e.g. genuinely
offline, or editing an object the CLI cannot resolve), use this skill's templates for the
*editing/extension* case below, and prefer creating any brand-new root object once the CLI/
Bridge is available rather than by hand.

# AOT XML Direct Scaffolding — Sanctioned Fallback / Extension-Editing Guide

> **Source of truth:** [learn:application-explorer](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/dev-tools/application-explorer)

## Step 1 — Locate target directory

```
Primary:   <workspace>\<ModelName>\<ModelName>\<ObjectType>\
Fallback:  C:\AOSService\PackagesLocalDirectory\<ModelName>\<ModelName>\<ObjectType>\
```

Example object type folders:

| AOT Type | Folder |
|---|---|
| Class (new) | `AxClass\` |
| Table (new) | `AxTable\` |
| Table extension | `AxTableExtension\` |
| Form extension | `AxFormExtension\` |
| EDT | `AxEdt\` |
| Enum | `AxEnum\` |
| Enum extension | `AxEnumExtension\` |
| Data entity | `AxDataEntityView\` |
| Security privilege | `AxSecurityPrivilege\` |
| Security duty | `AxSecurityDuty\` |
| Security role | `AxSecurityRole\` |
| Service | `AxService\` |
| Service group | `AxServiceGroup\` |
| Query | `AxQuery\` |

## Step 2 — Inspect compiling peers first

Before writing XML, read at least two compiling peers:

1. one object of the same AOT type in the target model;
2. one canonical object with the same role/pattern in the current platform or a proven repository model.

For AxForm, also inspect the active platform pattern/version. Never use an old form as the sole schema source.

Capture the exact namespace, `i:type`, enum values, property order, child location, and empty collection shape. A well-formed XML file can still fail DataContract deserialization or silently lose child controls.

## Step 3 — XML templates by object type

### AxClass (new class)

```xml
<?xml version="1.0" encoding="utf-8"?>
<AxClass xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Name>MyNewClass</Name>
    <SourceCode>
        <Declaration><![CDATA[
/// <summary>Short description of the class.</summary>
public final class MyNewClass
{
}
        ]]></Declaration>
        <Methods>
            <Method>
                <Name>myMethod</Name>
                <Source><![CDATA[
    /// <summary>Short description.</summary>
    /// <param name="_param">Parameter description.</param>
    /// <returns>Return description.</returns>
    public str myMethod(AccountNum _param)
    {
        return _param;
    }
                ]]></Source>
            </Method>
        </Methods>
    </SourceCode>
</AxClass>
```

### AxClass — CoC extension wrapper

```xml
<?xml version="1.0" encoding="utf-8"?>
<AxClass xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Name>TargetClass_MySuffix_Extension</Name>
    <SourceCode>
        <Declaration><![CDATA[
[ExtensionOf(classStr(TargetClass))]
final class TargetClass_MySuffix_Extension
{
}
        ]]></Declaration>
        <Methods>
            <Method>
                <Name>targetMethod</Name>
                <Source><![CDATA[
    public void targetMethod()
    {
        next targetMethod();   // MANDATORY — call before any post-processing
        // post-processing here
    }
                ]]></Source>
            </Method>
        </Methods>
    </SourceCode>
</AxClass>
```

### AxTableExtension

```xml
<?xml version="1.0" encoding="utf-8"?>
<AxTableExtension xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Name>CustTable.MySuffix</Name>
    <FieldGroupExtensions />
    <FieldGroups />
    <FieldModifications />
    <Fields>
        <AxTableField xmlns="" i:type="AxTableFieldString">
            <Name>MyCustomField</Name>
            <ExtendedDataType>MyCustomEDT</ExtendedDataType>
        </AxTableField>
    </Fields>
    <FullTextIndexes />
    <Indexes />
    <Mappings />
    <PropertyModifications />
    <RelationExtensions />
    <RelationModifications />
    <Relations />
</AxTableExtension>
```

Element order is alphabetical: `FieldGroupExtensions`, `FieldGroups`, `FieldModifications`, `Fields`, `FullTextIndexes`, `Indexes`, `Mappings`, `PropertyModifications`, `RelationExtensions`, `RelationModifications`, `Relations`. Verified against a real compiling extension (`Metadata\NWVEB\NWVEB\AxTableExtension\BankAccountTable.NWVEB.xml`) — include every one of these collections (empty self-closing tags are fine) even if only `Fields` or `Relations` has content.

### AxTable — mandatory standard field-group completion

Whether the table came from AI, direct XML, or `d365fo generate table`, verify that its `<FieldGroups>` collection contains:

```xml
<FieldGroups>
    <AxTableFieldGroup>
        <Name>AutoSummary</Name>
        <Fields />
    </AxTableFieldGroup>
    <AxTableFieldGroup>
        <Name>AutoBrowse</Name>
        <Fields />
    </AxTableFieldGroup>
    <AxTableFieldGroup>
        <Name>AutoReport</Name>
        <Fields />
    </AxTableFieldGroup>
    <AxTableFieldGroup>
        <Name>AutoLookup</Name>
        <Fields />
    </AxTableFieldGroup>
    <AxTableFieldGroup>
        <Name>AutoIdentification</Name>
        <AutoPopulate>Yes</AutoPopulate>
        <Fields />
    </AxTableFieldGroup>
</FieldGroups>
```

This is the Microsoft-standard order (verified against a real standard table, CustTable): `AutoSummary, AutoBrowse, AutoReport, AutoLookup, AutoIdentification`.

> Note: `d365fo generate table` output may emit the groups in a different order (e.g. `AutoReport, AutoLookup, AutoIdentification, AutoSummary, AutoBrowse`) — that is the generator's convention, not the universal AOT standard. Either order compiles; prefer matching the order used by a compiling peer in the target model.

Insert this collection at the exact location used by a compiling AxTable peer. Preserve business groups and add groups such as `Overview` only when forms reference them.

Before accepting the table:

- verify every EDT/enum and model dependency;
- reject reserved system-field names such as `CreatedDateTime`;
- verify relation field type compatibility;
- verify primary, clustered, and alternate-key indexes;
- cross-check every form `DataGroup` against the table.

### AxFormExtension

```xml
<?xml version="1.0" encoding="utf-8"?>
<AxFormExtension xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="Microsoft.Dynamics.AX.Metadata.V6">
    <Name>CustTable.MySuffix</Name>
    <ControlModifications />
    <Controls>
        <AxFormExtensionControl xmlns="">
            <Name>MyNewStringControlExtension</Name>
            <FormControl xmlns="" i:type="AxFormStringControl">
                <Name>MyNewStringControl</Name>
                <Type>String</Type>
                <FormControlExtension i:nil="true" />
                <DataField>MyCustomField</DataField>
                <DataSource>CustTable</DataSource>
            </FormControl>
            <Parent>Grid</Parent>
        </AxFormExtensionControl>
    </Controls>
    <DataSourceModifications />
    <DataSourceReferences />
    <DataSources />
    <Parts />
    <PropertyModifications />
</AxFormExtension>
```

The root wrapper is `<AxFormExtensionControl>`, not a flat `<AxFormControlExtension>`. It nests a `<FormControl i:type="Ax...Control">` (choose the real control type, e.g. `AxFormStringControl`, `AxFormCheckBoxControl`) carrying its own `<Name>`, `<Type>`, `<FormControlExtension i:nil="true" />`, `<DataField>`, `<DataSource>` — plus a required sibling `<Parent>` naming the real parent control on the base form (e.g. `Grid`). The `AxFormExtension` root requires `xmlns="Microsoft.Dynamics.AX.Metadata.V6"` in addition to `xmlns:i`, and needs the full required element set in alphabetical order: `ControlModifications`, `Controls`, `DataSourceModifications`, `DataSourceReferences`, `DataSources`, `Parts`, `PropertyModifications`. There is no `<Methods />` element on `AxFormExtension`. Verified against a real compiling extension (`Metadata\NWVEB\NWVEB\AxFormExtension\BankAccountTable.NWVEB.xml`).

### AxForm and AxFormExtension safety

Do not use a generic hand-written AxForm template. Clone a compiling form with the same root pattern/version, then replace only grounded datasources, fields, labels, and actions.

- Preserve DataContract element order for each exact `i:type`.
- Use verified control types such as `AxFormIntegerControl`; never invent `AxFormIntControl`.
- Use only enum/style values observed in current metadata.
- Put only TabPage controls directly under a Tab.
- Validate required pattern roles and child locations.
- Assign nested patterns only to their root. For `FieldsFieldGroups 1.1`, the root is `Fill` and child field groups are `Fixed`.
- Deserialize the result with current metadata assemblies and run the active pattern analyzer when available.

### AxEdt (Extended Data Type — string)

```xml
<?xml version="1.0" encoding="utf-8"?>
<AxEdt xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Name>MyStringEDT</Name>
    <Label>@MyModel:MyStringEDTLabel</Label>
    <Extends>Name</Extends>
    <StringSize>60</StringSize>
</AxEdt>
```

### AxEnum (new base enum)

```xml
<?xml version="1.0" encoding="utf-8"?>
<AxEnum xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Name>MyEnum</Name>
    <Label>@MyModel:MyEnumLabel</Label>
    <EnumValues>
        <AxEnumValue>
            <Name>None</Name>
            <Value>0</Value>
        </AxEnumValue>
        <AxEnumValue>
            <Name>Active</Name>
            <Label>@MyModel:MyEnumActiveLabel</Label>
            <Value>1</Value>
        </AxEnumValue>
    </EnumValues>
</AxEnum>
```

### AxSecurityPrivilege

```xml
<?xml version="1.0" encoding="utf-8"?>
<AxSecurityPrivilege xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Name>MyFormViewPrivilege</Name>
    <Label>@MyModel:MyFormViewPrivilegeLabel</Label>
    <EntryPoints>
        <AxSecurityEntryPointReference>
            <EntryPoint>MyFormMenuItem</EntryPoint>
            <GrantRead>Yes</GrantRead>
        </AxSecurityEntryPointReference>
    </EntryPoints>
</AxSecurityPrivilege>
```

## Step 4 — X++ code rules inside CDATA blocks

All X++ inside `<Source><![CDATA[ ... ]]></Source>` must follow BP rules:

- ✅ `DateTimeUtil::getToday(DateTimeUtil::getUserPreferredTimeZone())` — never `today()`
- ✅ Labels only — never hardcoded strings in `info()`, `error()`, `warning()`
- ✅ EDTs for domain fields — never raw `str`/`int`
- ✅ `/// <summary>` doc comment on every public method
- ✅ `next <method>()` unconditional in CoC wrappers (before post-processing)
- ❌ No nested `while select` loops
- ❌ No `forceLiterals` in queries
- ❌ No `doInsert` / `doUpdate` / `doDelete` in business logic

## Step 5 — File naming

- Class: `<ClassName>.xml` e.g. `CustVendPaymProposalExtension.xml`
- Table extension: `<TableName>.<Suffix>.xml` e.g. `CustTable.MySuffix.xml`
- Form extension: `<FormName>.<Suffix>.xml` e.g. `CustTable.MySuffix.xml`

## Hard rules

- **NEVER guess XML schema** — always inspect an existing file of the same type first.
- **NEVER trust generator output without a post-generation metadata audit.**
- **NEVER reorder form XML for readability; preserve the current DataContract order.**
- **NEVER accept a new AxTable without the five standard field groups unless a verified peer proves an exception.**
- **NEVER leave form `DataGroup` references unresolved.**
- **NEVER invent EDTs, control `i:type` names, pattern versions, or enum values.**
- **ALWAYS use label tokens** in `<Label>` attributes — never hardcode UI text.
- **Extension objects** must use dot-separator naming: `<TargetObject>.<ModelSuffix>`.
- **NEVER hand-author a brand-new `AxDataEntityView`/other new root object without first
  telling the user you are doing so because the CLI/Bridge is unavailable** — see the
  incident note at the top of this file.
