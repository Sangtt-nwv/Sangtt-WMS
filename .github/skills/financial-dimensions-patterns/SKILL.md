---
name: financial-dimensions-patterns
description: 'Patterns for working with D365FO financial dimensions programmatically — reading, writing, merging DefaultDimension values, adding dimension storage to custom tables, and wiring dimension controls on forms. Use when the user asks about DefaultDimension, DimensionAttributeValueSetStorage, financial dimensions on a table, or dimension display on a form.'
---
<!-- GENERATED from .claude/skills/financial-dimensions-patterns/SKILL.md by tools/sync-agent-skills.ps1 - DO NOT EDIT THIS COPY. Edit the source and re-run the script. -->
> 💡 **TOOLCHAIN POLICY:** Create every new AOT object with `d365fo generate … --install-to <Model>` or the D365FO MCP scaffolding tools. If the CLI or Bridge is unavailable, **stop and report the missing prerequisite** — never hand-author a new AOT XML object. Editing an *existing* object's XML is fine once you have verified its path and model ownership. The only sanctioned exception is the `aot-xml-direct-scaffolding` procedure, which requires explicit user authorization first.

# Financial Dimensions Patterns in D365FO

> **Reference:** [learn:financial-dimension-framework](https://learn.microsoft.com/en-us/dynamics365/finance/general-ledger/financial-dimensions)

## Core concepts

| Concept | Description |
|---|---|
| `DefaultDimension` | `RecId` field on a table that stores a link to a frozen set of dimension values |
| `DimensionAttributeValueSetStorage` | Runtime container class — load, read, modify, save dimension sets |
| `DimensionAttribute` | Table containing dimension definitions (BusinessUnit, CostCenter, Department…) |
| `DimensionAttributeValue` | Table containing the concrete values per dimension |
| `DimensionController` / `LedgerDimensionController` | Real classes (Ledger\Ledger\AxClass) for wiring dimension UI controls on forms — verify current method signatures against installed metadata before use |

## Pre-flight

```sh
d365fo get table CustTable --output json     # check DefaultDimension field exists
d365fo get edt DefaultDimensionDisplayValue  # understand the EDT chain
d365fo search table DimensionAttribute --output json
```

## Pattern 1 — Read a dimension value from a record

```xpp
/// <summary>Gets the display value of a named dimension from a record's DefaultDimension.</summary>
public static DimensionValue getDimValue(RecId _defaultDimension, Name _dimName)
{
    DimensionAttributeValueSetStorage dimStorage;
    DimensionAttribute                dimAttr;

    dimAttr    = DimensionAttribute::findByName(_dimName);
    dimStorage = DimensionAttributeValueSetStorage::find(_defaultDimension);

    return dimStorage.getDisplayValueByDimensionAttribute(dimAttr.RecId);
}
```

## Pattern 2 — Write / update a dimension value on a record

```xpp
/// <summary>Sets a single dimension value on a record and saves it.</summary>
public static void setDimValue(
    Common  _record,
    Name    _dimName,
    str     _dimValue)
{
    DimensionAttributeValueSetStorage dimStorage;
    DimensionAttribute                dimAttr;
    DimensionAttributeValue           dimAttrValue;

    dimAttr    = DimensionAttribute::findByName(_dimName);
    dimStorage = DimensionAttributeValueSetStorage::find(_record.DefaultDimension);

    dimAttrValue = DimensionAttributeValue::findByDimensionAttributeAndValue(
        dimAttr,
        _dimValue,
        false,   // mustExist = false (don't throw if missing)
        true);   // createIfNotFound = true

    dimStorage.addItem(dimAttrValue);

    ttsbegin;
    _record.selectForUpdate(true);
    _record.(fieldNum(<YourTable>, DefaultDimension)) = dimStorage.save();
    _record.update();
    ttscommit;
}
```

> ⚠️ **Never assign `DefaultDimension` directly from another record's field.** Always go through `DimensionAttributeValueSetStorage` to ensure proper reference counting.

## Pattern 3 — Merge two DefaultDimension sets (precedence merge)

`DimensionAttributeValueSetStorage` has no `merge()` or `findOrCreate()` helper
— those do not exist on the class. Build a precedence merge from the
verified-real API instead: `DimensionAttributeValueSetStorage::find()` to
load each set, then walk the override set's dimension attribute values
(via its `elements()` / `getAttributeByIndex()` / `getValueByIndex()`
accessors) and `addItem()` each one onto the base storage — override values
added last win — then call `.save()` on the base storage to get the merged
`RecId`. Confirm exact accessor signatures against the installed
`DimensionAttributeValueSetStorage.xml` before writing this helper, since
the enumeration API differs by index vs. dimension attribute.

## Pattern 4 — Add DefaultDimension field to a custom table

### Step 1 — Add field via CLI or XML

There is no standalone `generate field` subcommand. `--field` is a
repeatable flag on `d365fo generate table` (used when creating a new
table, format `<name>:<edt>[:mandatory]`):

```sh
d365fo generate table MyTable --field DefaultDimension:DefaultDimensionDisplayValue --install-to MyModel
```

`d365fo generate extension Table <Target> <Suffix>` (for adding
`DefaultDimension` to an *existing* table) has no `--field` flag — it
emits a minimal extension skeleton, and the field must be hand-added to
the `<Fields>` block afterward, as shown below.

Or in `AxTableExtension` XML:

```xml
<Fields>
    <AxTableField xmlns="" i:type="AxTableFieldInt64">
        <Name>DefaultDimension</Name>
        <ExtendedDataType>DefaultDimensionDisplayValue</ExtendedDataType>
    </AxTableField>
</Fields>
```

### Step 2 — Add table relation to DimensionAttributeValueSet

Add via Application Explorer (VS 2022) or via AxTableExtension XML:

```xml
<Relations>
    <AxTableRelation>
        <Name>DimensionAttributeValueSet</Name>
        <Cardinality>ZeroMore</Cardinality>
        <RelatedTable>DimensionAttributeValueSet</RelatedTable>
        <RelatedTableCardinality>ExactlyOne</RelatedTableCardinality>
        <Constraints>
            <AxTableRelationConstraint i:type="AxTableRelationConstraintField">
                <Name>DefaultDimension</Name>
                <Field>DefaultDimension</Field>
                <RelatedField>RecId</RelatedField>
            </AxTableRelationConstraint>
        </Constraints>
    </AxTableRelation>
</Relations>
```

### Step 3 — Wire dimension control on the form

In the form extension's data source `active()` override:

```xpp
[ExtensionOf(formDataSourceStr(MyForm, MyTable))]
final class MyForm_MyTable_DS_Extension
{
    public int active()
    {
        int ret = next active();
        MyTable_DefaultDimension.allowEdit(
            MyTable.RecId != 0 && !MyTable.isInWorkflow());
        return ret;
    }
}
```

`DimensionDefaultingController` does not exist in D365FO — do not use it.
The real classes for wiring dimension UI controls are `DimensionController`
and `LedgerDimensionController` (Ledger\Ledger\AxClass). Read their current
constructor/static-construct signatures from installed metadata
(`d365fo get class DimensionController --output json` /
`d365fo get class LedgerDimensionController --output json`) before wiring
one into a form — do not invent a method call by analogy with the pattern
above.

## Hard rules

- **Never copy `DefaultDimension` RecId between records directly** — always merge or re-save via `DimensionAttributeValueSetStorage`.
- **`DefaultDimension` field must be EDT `DefaultDimensionDisplayValue`** — not raw `int64`.
- **Always add the `DimensionAttributeValueSet` table relation** when adding `DefaultDimension` to a table.
- **Use `DimensionController` / `LedgerDimensionController`** for form UI — do not manually bind the field, and do not use the nonexistent `DimensionDefaultingController`.
- After modifying dimensions, call `d365fo sync --output json` to ensure DB schema is updated.
