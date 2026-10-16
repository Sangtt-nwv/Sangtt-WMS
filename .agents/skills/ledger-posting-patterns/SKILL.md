---
name: ledger-posting-patterns
description: Create and post general journals programmatically in D365FO X++ — the LedgerJournalTable/LedgerJournalTrans/LedgerJournalEngine/LedgerJournalCheckPost path, i.e. the same journal a user could type in by hand. Use when the user asks to "post a journal", "create a LedgerJournalTable", "add LedgerJournalTrans lines", "use LedgerJournalEngine", or "post a general journal in X++". For posting straight from a business document through the accounting engine (LedgerVoucher / SubledgerJournalizer), use $posting-and-financials instead.
---
<!-- GENERATED from .claude/skills/ledger-posting-patterns/SKILL.md by tools/sync-agent-skills.ps1 - DO NOT EDIT THIS COPY. Edit the source and re-run the script. -->
> 💡 **TOOLCHAIN POLICY:** Create every new AOT object with `d365fo generate … --install-to <Model>` or the D365FO MCP scaffolding tools. If the CLI or Bridge is unavailable, **stop and report the missing prerequisite** — never hand-author a new AOT XML object. Editing an *existing* object's XML is fine once you have verified its path and model ownership. The only sanctioned exception is the `aot-xml-direct-scaffolding` procedure, which requires explicit user authorization first.

# Ledger Posting Patterns in D365FO

> **Reference:** [learn:ledger-journal](https://learn.microsoft.com/en-us/dynamics365/finance/general-ledger/general-journal-processing)

## Architecture overview

```
LedgerJournalTable (header)  ← one journal
    └── LedgerJournalTrans (lines) ← debit/credit lines
            └── LedgerDimension (RecId) ← main account + dims
LedgerJournalCheckPost        ← validates & posts
LedgerJournalEngine           ← initializes line defaults correctly
```

## Pre-flight

```sh
d365fo get class LedgerJournalEngine --output json        # check method signatures
d365fo get class LedgerJournalCheckPost --output json     # check method signatures
d365fo get table LedgerJournalTable --output json         # required fields
d365fo get table LedgerJournalTrans --output json         # required fields
```

## Pattern 1 — Create journal header

```xpp
/// <summary>Creates a LedgerJournalTable header for the specified journal name.</summary>
public static LedgerJournalTable createJournalHeader(LedgerJournalNameId _journalName)
{
    LedgerJournalTable journalTable;

    journalTable.JournalName = _journalName;
    LedgerJournalName::find(_journalName).copyDefaultsToJournal(journalTable);

    ttsbegin;
    journalTable.insert();
    ttscommit;

    return journalTable;
}
```

## Pattern 2 — Add journal lines via LedgerJournalEngine

> ⚠️ **Always use `LedgerJournalEngine` to initialize lines** — never insert `LedgerJournalTrans` directly. Bypassing the engine leaves calculated fields empty and causes posting errors.

```xpp
/// <summary>Adds a debit/credit line pair to the journal.</summary>
public static void addJournalLine(
    LedgerJournalTable  _journalTable,
    LedgerAccount       _mainAccountNum,
    AmountCur           _amount,
    CurrencyCode        _currency,
    TransDate           _transDate)
{
    LedgerJournalTrans  journalTrans;
    LedgerJournalEngine engine;

    engine = LedgerJournalEngine::construct(_journalTable.JournalType);
    engine.newJournalActive(_journalTable);

    journalTrans.clear();
    journalTrans.JournalNum = _journalTable.JournalNum;
    engine.initValue(journalTrans);

    journalTrans.TransDate          = _transDate;
    journalTrans.CurrencyCode       = _currency;
    journalTrans.Txt                = "@MyModel:JournalLineDescription";
    journalTrans.Voucher            = journalTrans.newVoucher(_journalTable);

    // Debit side — use LedgerDimension (main account + financial dims)
    journalTrans.LedgerDimension    = LedgerDefaultAccountHelper::getDefaultAccountFromMainAccountIdAndCOA(
        _mainAccountNum, LedgerChartOfAccounts::current());
    journalTrans.AmountCurDebit     = _amount;
    journalTrans.AmountCurCredit    = 0;

    ttsbegin;
    journalTrans.insert();
    ttscommit;
}
```

## Pattern 3 — Validate only (dry run)

`LedgerJournalCheckPost extends RunBaseBatch`; there is no `runOperation()`
or externally-callable `isError()` on it. The real entry point is `run()`,
and it signals failure by throwing (`Exception::Error`) rather than by a
boolean return — catch the exception to detect a failed validation/post.

```xpp
/// <summary>Validates a journal without posting. Returns true if valid.</summary>
public static boolean validateJournal(LedgerJournalTable _journalTable)
{
    LedgerJournalCheckPost jourCheck;

    // NoYes::No = validate only, do NOT post
    jourCheck = LedgerJournalCheckPost::newLedgerJournalTable(
        _journalTable,
        NoYes::No);

    try
    {
        jourCheck.run();
    }
    catch (Exception::Error)
    {
        return false;
    }

    return true;
}
```

## Pattern 4 — Post the journal

```xpp
/// <summary>Posts a validated journal.</summary>
public static void postJournal(LedgerJournalTable _journalTable)
{
    LedgerJournalCheckPost jourPost;

    // NoYes::Yes = validate AND post
    jourPost = LedgerJournalCheckPost::newLedgerJournalTable(
        _journalTable,
        NoYes::Yes);

    try
    {
        jourPost.run();
    }
    catch (Exception::Error)
    {
        throw error("@MyModel:JournalPostingFailed");
    }
}
```

## Pattern 5 — High-volume: batch posting

For large journals (>1000 lines), use `LedgerJournalMultiPost` to parallelize:

```xpp
LedgerJournalMultiPost::newLedgerJournalTable(_journalTable).run();
```

> ⚠️ `LedgerJournalMultiPost` requires Batch framework to be configured and active.

## LedgerDimension helpers

```xpp
// From main account number + chart of accounts (no financial dims)
LedgerDimensionDefaultAccount dim = LedgerDefaultAccountHelper::getDefaultAccountFromMainAccountIdAndCOA(
    mainAccNum,
    LedgerChartOfAccounts::current());
```

There is no `...AndDimension` overload that also takes an existing
`DefaultDimension` set — no such method exists on `LedgerDefaultAccountHelper`.
Confirm the current method list (`d365fo get class LedgerDefaultAccountHelper
--output json`) before assuming an overload for that case.

## Hard rules

- **Never insert `LedgerJournalTrans` directly** — always use `LedgerJournalEngine` to initialize.
- **Always use `LedgerJournalCheckPost::newLedgerJournalTable()`** — not a direct `.post()` call.
- **Voucher number must come from `journalTrans.newVoucher(_journalTable)`** — never hardcode.
- **Use `LedgerDefaultAccountHelper`** to build `LedgerDimension` RecId — never assign a raw account string.
- **Validate before posting** — call with `NoYes::No` first in non-batch scenarios.
- **Use labels** for `Txt` (description field) — never hardcode strings.
- **Use `LedgerJournalMultiPost`** for high volume — not a loop calling `LedgerJournalCheckPost` per line.
