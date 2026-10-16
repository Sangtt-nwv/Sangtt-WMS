---
name: data-upgrade-and-migration
description: 'Patterns for writing D365FO data upgrade scripts (PreSync, PostSync, ReleaseUpdateTransformDB) and one-time data-fix batch jobs. Use when the user asks about "data upgrade script", "PreSync", "PostSync", "ReleaseUpdateDB", "data migration", "one-time data fix", or "upgrade class D365FO".'
---
<!-- GENERATED from .claude/skills/data-upgrade-and-migration/SKILL.md by tools/sync-agent-skills.ps1 - DO NOT EDIT THIS COPY. Edit the source and re-run the script. -->
> 💡 **TOOLCHAIN POLICY:** Create every new AOT object with `d365fo generate … --install-to <Model>` or the D365FO MCP scaffolding tools. If the CLI or Bridge is unavailable, **stop and report the missing prerequisite** — never hand-author a new AOT XML object. Editing an *existing* object's XML is fine once you have verified its path and model ownership. The only sanctioned exception is the `aot-xml-direct-scaffolding` procedure, which requires explicit user authorization first.

# Data Upgrade & Migration Patterns in D365FO

> **Reference:** [learn:data-upgrade-overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-upgrade-overview)
> **Troubleshoot:** [learn:presync-postsync-troubleshoot](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/prepare-data-upgrade)

## When to use which pattern

| Scenario | Pattern |
|---|---|
| Schema-dependent data transform (new fields, new tables) | **PostSync** script |
| Data preparation before schema change | **PreSync** script |
| One-time production data fix (post-go-live) | **Data fix batch job** (`SysOperationServiceBase`) |
| Copying data from old to new table structure | **ReleaseUpdateTransformDB_** class |

## PreSync vs PostSync — key difference

```
PreSync:  runs BEFORE d365fo sync — old schema still in DB
          → Use to CLEAN UP data that would break sync (e.g., duplicate keys)
          → Use to SPLIT a field before the table changes

PostSync: runs AFTER d365fo sync  — new schema is live in DB
          → Use to POPULATE new fields from old data
          → Use to TRANSFORM data to match new enum values
```

## Pre-flight

```sh
d365fo search class ReleaseUpdateDB --output json  # find existing upgrade classes
d365fo validate references --file <MyUpgradeClass>.xml --output json
d365fo validate xpp --file <MyUpgradeClass>.xml --output json
```

## Pattern 1 — PostSync upgrade class (most common)

```xpp
/// <summary>PostSync data upgrade: populates MyNewField from MyOldField.</summary>
public class ReleaseUpdateDB_MyModel extends ReleaseUpdateDB
{
    /// <summary>Upgrades MyTable.MyNewField from MyTable.MyOldField.</summary>
    [UpgradeScriptStage(ReleaseUpdateScriptStage::PostSync),
     UpgradeScriptDescription("Populate MyNewField from MyOldField")]
    public void upgradeMyTableMyNewField()
    {
        // ✅ Set-based when possible — never row-by-row in upgrade scripts
        update_recordset MyTable
            setting MyNewField = MyTable.MyOldField
            where MyTable.MyNewField == '';

        // Row-by-row ONLY if business logic is required
        // MyTable myTable;
        // while select forUpdate myTable where myTable.MyNewField == ''
        // {
        //     myTable.MyNewField = this.transformValue(myTable.MyOldField);
        //     myTable.doUpdate(); // doUpdate OK in upgrade scripts
        // }
    }
}
```

> ⚠️ **`doUpdate()` and `doInsert()` are allowed in data upgrade scripts** — they bypass business logic intentionally. This is one of the few legitimate uses.

## Pattern 2 — PreSync upgrade class

```xpp
[UpgradeScriptStage(ReleaseUpdateScriptStage::PreSync),
 UpgradeScriptDescription("Remove duplicate keys before sync")]
public void removeDuplicateMyTableEntries()
{
    MyTable   myTable;
    MyTable   duplicateTable;

    while select myTable
        group by myTable.KeyField
        having count(myTable.RecId) > 1
    {
        // Delete all but the latest
        delete_from duplicateTable
            where duplicateTable.KeyField == myTable.KeyField
               && duplicateTable.RecId != myTable.RecId;
    }
}
```

## Pattern 3 — One-time data fix batch job (post-go-live)

For production data fixes after go-live (no upgrade framework), use a `SysOperationServiceBase` batch:

```xpp
/// <summary>One-time data fix: backfills MyTable.MyNewField.</summary>
public class MyDataFixService extends SysOperationServiceBase
{
    [SysEntryPointAttribute(false)]
    public void process(MyDataFixContract _contract)
    {
        MyTable myTable;
        int     count;

        ttsbegin;
        while select forUpdate myTable
            where myTable.MyNewField == ''
        {
            myTable.MyNewField = this.computeValue(myTable);
            myTable.doUpdate();  // bypass business events for data fix
            count++;

            if (count mod 1000 == 0)  // commit every 1000 records to avoid log growth
            {
                ttscommit;
                ttsbegin;
            }
        }
        ttscommit;

        info(strFmt("@MyModel:DataFixProcessedCount", count));
    }

    private MyNewFieldValue computeValue(MyTable _myTable)
    {
        // ... transformation logic ...
        return _myTable.MyOldField;
    }
}
```

## Pattern 4 — allowDupOnIndex for upgrade

When adding a unique index on a table that has existing data, use `allowDupOnIndex` in PreSync:

```xpp
[UpgradeScriptStage(ReleaseUpdateScriptStage::PreSync)]
public void allowDupBeforeSync()
{
    // Temporarily allows duplicate data while the upgrade resolves duplicates
    ReleaseUpdateDB::allowDupOnIndex(
        tableNum(MyTable),
        indexNum(MyTable, MyNewUniqueIndex));
}
```

Then in PostSync, restore:

```xpp
[UpgradeScriptStage(ReleaseUpdateScriptStage::PostSync)]
public void disallowDupAfterSync()
{
    ReleaseUpdateDB::renameDupIndex(
        tableNum(MyTable),
        indexNum(MyTable, MyNewUniqueIndex));
}
```

## Debugging upgrade scripts

```sh
# Check error log (SQL Server)
SELECT * FROM RELEASEUPDATESCRIPTSERRORLOG ORDER BY CREATEDATETIME DESC

# Attach debugger in VS to Batch process on dev VM
# Tools > Attach to Process > AXServ (batch service)
```

## Hard rules

- **`doUpdate()` / `doInsert()` / `doDelete()` are ALLOWED in upgrade scripts** — they are FORBIDDEN in regular business logic.
- **Prefer set-based operations** (`update_recordset`, `insert_recordset`, `delete_from`) over row-by-row loops for performance.
- **Commit every N records** in large row-by-row loops to prevent transaction log overflow (`count mod 1000`).
- **Use `[UpgradeScriptStage(ReleaseUpdateScriptStage::...)]`** to declare Pre vs Post sync stage explicitly — `UpgradeScriptStage` is the attribute class; `ReleaseUpdateScriptStage` is the enum holding the stage values (`PreSync`, `PostSync`, `Additional`, `BulkCopy`, `PreSyncUpdate`, `PostSyncUpdate`, `AdditionalUpdate`).
- **Validate the upgrade class** with `d365fo validate references` before deploying.
- **Monitor via `RELEASEUPDATESCRIPTSERRORLOG`** in SQL if the script fails during upgrade.
- **Do NOT use `today()` or hardcoded dates** in upgrade scripts. Prefer deriving the value
  from existing fields on the row you are upgrading — a stamped "now" makes the result
  depend on when the upgrade happened to run, which is not reproducible. When you do need
  the current moment, pick by return type: `DateTimeUtil::utcNow()` or
  `DateTimeUtil::getSystemDateTime()` for a `utcdatetime` field, and
  `DateTimeUtil::getToday(DateTimeUtil::getUserPreferredTimeZone())` for a `date` field.
  `getSystemDateTime()` returns `utcdatetime`, so it is **not** a drop-in replacement for
  `today()`, which returns `date` — see `$xpp-best-practice-rules`.
