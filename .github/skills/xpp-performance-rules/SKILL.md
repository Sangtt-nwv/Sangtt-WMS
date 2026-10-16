---
name: xpp-performance-rules
description: The performance rules every piece of X++ must satisfy as it is written — complexity budget, no N+1 round-trips, set-based over row-by-row, index-covered where clauses, no work inside loops, and the conditions that silently downgrade a set-based statement. Apply to EVERY implementation task that touches data or loops, alongside $xpp-best-practice-rules. Invoke before writing a select, a loop, a batch job, a CoC wrapper on a hot path, or any code that runs per-record.
applies_when: Any X++ is being written or reviewed that queries, loops, inserts, updates, deletes, or runs per record or per line.
---
<!-- GENERATED from .claude/skills/xpp-performance-rules/SKILL.md by tools/sync-agent-skills.ps1 - DO NOT EDIT THIS COPY. Edit the source and re-run the script. -->
> 💡 **TOOLCHAIN POLICY:** Create every new AOT object with `d365fo generate … --install-to <Model>` or the D365FO MCP scaffolding tools. If the CLI or Bridge is unavailable, **stop and report the missing prerequisite** — never hand-author a new AOT XML object. Editing an *existing* object's XML is fine once you have verified its path and model ownership.

# X++ performance rules

> This is a **gate, not a reference.** It is the performance equivalent of
> `$xpp-best-practice-rules`: a short list of things that must be true of the code you are
> about to write. Apply it while writing, not after someone reports the system is slow.
>
> For *fixing* something already slow — caching modes, temp-table choice, parallel batch
> fan-out, index design — go to `$performance-and-caching`. For query grammar, go to
> `$xpp-database-queries`.

Microsoft's own summary of what makes F&O slow, in their words: *"minimize the use of
nested loops and round-trips to the SQL database… avoid record-by-record operations.
Instead, use bulk processing methods such as `insert_recordset` and `update_recordset`."*
([Learn: Performance](https://learn.microsoft.com/dynamics365/get-started/support/support-scope-finance-technical#performance))

---

## 1. State the complexity before you write the loop

Every loop over data has a cost you can name. Write it down in a comment or in your
report, in terms of the business quantity — not "it's fine".

| Shape | Cost | Verdict |
|---|---|---|
| One `select` with a `where` covered by an index | ~O(log n) | Fine |
| One `while select` over a filtered set | O(n) | Fine — n is the filtered count, not the table |
| `while select` over A, inner `select` per row on B | **O(n) round-trips** | **Reject** — join it |
| Nested `while select` A × B | **O(n·m)** | **Reject** — join, or map one side |
| Loop calling a `find()` per record | **O(n) round-trips** | **Reject** — join, or preload into a `Map` |
| Loop calling `.insert()` / `.update()` per record | **O(n) round-trips** | **Reject** unless a documented exception below applies |
| Sorting/searching an in-memory list per record | O(n·log m) or worse | Use a `Map` — O(1) lookup |

**The number that matters is round-trips to SQL, not X++ statements executed.** A thousand
cheap `select firstOnly` calls in a loop is a thousand network round-trips; one join is
one. This is the single most common performance defect in D365FO custom code.

**Know your n.** "The loop is over open sales lines" is not a budget. Ask how many there
are in production — 50, 50 000, or 5 000 000 changes the correct design. If nobody knows,
say so and design for the larger case.

## 2. Never call the database inside a loop

```xpp
// ❌ O(n) round-trips — one SELECT per line
while select salesLine where salesLine.SalesId == _salesId
{
    inventTable = InventTable::find(salesLine.ItemId);   // round-trip per line
    total += inventTable.Weight * salesLine.QtyOrdered;
}

// ✅ One round-trip — the join happens in SQL
while select QtyOrdered from salesLine
    where salesLine.SalesId == _salesId
    join Weight from inventTable
        where inventTable.ItemId == salesLine.ItemId
{
    total += inventTable.Weight * salesLine.QtyOrdered;
}
```

When a join genuinely will not express it — the lookup set is small, reused across several
loops, or comes from a different company — **preload once into a `Map` and look up in
memory**:

```xpp
Map itemWeights = new Map(Types::String, Types::Real);

while select ItemId, Weight from inventTable
    where inventTable.ItemGroupId == _group
{
    itemWeights.insert(inventTable.ItemId, inventTable.Weight);
}
// now the per-line lookup is O(1) and costs no round-trip
```

Same rule for anything expensive, not just `select`: no `new` of a heavy class, no label
resolution, no `DimensionAttribute::findByName()`, no number-sequence fetch inside the
loop body. Hoist it above the loop.

## 3. Set-based first — and know when it silently downgrades

Prefer `insert_recordset`, `update_recordset`, `delete_from` and `RecordInsertList` over
row-by-row writes. But a set-based statement **falls back to record-by-record** under
conditions you must check first, because the fallback is silent and turns your one
round-trip back into n
([Learn: Conversion of operations from set-based to record-by-record](https://learn.microsoft.com/dynamics365/fin-ops-core/dev-itpro/dev-ref/xpp-data/xpp-data-perf)):

| Condition | `delete_from` | `update_recordset` | `insert_recordset` | `RecordInsertList` | Override |
|---|---|---|---|---|---|
| Non-SQL table | ✓ | ✓ | ✓ | ✓ | — |
| Delete actions defined | ✓ | — | — | — | `skipDeleteActions` |
| Database log enabled | ✓ | ✓ | ✓ | — | `skipDatabaseLog` |
| Overridden `insert`/`update`/`delete` | ✓ | ✓ | ✓ | ✓ | `skipDataMethods` |
| Alerts set up on the table | ✓ | ✓ | ✓ | — | `skipEvents` |
| `ValidTimeStateFieldType ≠ None` | ✓ | ✓ | ✓ | ✓ | — |

✓ = this condition downgrades the statement.

Two traps:

- **The `skip*` methods are a decision, not a default.** `skipDataMethods(true)` means the
  table's own `insert()` — including any CoC wrapper, any validation, any framework
  defaulting — does not run. That is sometimes right for a migration and almost always
  wrong for business logic. Say in your report that you used it and why.
- **If the statement downgrades for any reason, every `skip*` setting is ignored.** You
  get row-by-row execution *and* the overridden methods run. Do not assume `skip*` bought
  you the fast path.

## 4. Make the `where` clause index-usable

- **Never call a function in `where`.** `where custTable.AccountNum == strLTrim(_acct)`
  forces a scan. Assign to a local above the select. (This is also a BP rule — see
  `$xpp-best-practice-rules`.)
- **Order matters**: the leading fields of the `where` should match the leading fields of
  an existing index. Check with `d365fo get table <Name>` before assuming one exists.
- **Select only the fields you need** — `select AccountNum, Name from custTable` moves far
  less than the whole buffer, and lets the engine use a covering index.
- **`firstOnly`** when you want one row. Without it the engine may fetch a whole set.
- **`in` takes a `container`.** One `in` per `where`. Never expand it into `OR == OR ==`.
- `crossCompany` on the outer buffer only, and scope it to explicit legal entities when you
  can — `crossCompany : [companyA, companyB]` beats an unbounded sweep.

## 5. Transactions: short, and no chatter inside

- Keep `ttsbegin`/`ttscommit` as narrow as the invariant requires. A transaction held open
  across a loop holds locks across the loop, and turns a slow query into a blocking
  incident for every other user.
- **Never call an external service, write a file, or wait on anything inside a
  transaction.** The lock is held for the whole round-trip.
- Prepare and validate everything *before* `ttsbegin`; write inside it; report after
  `ttscommit`.
- SQL statements time out: **30 minutes** for an interactive session, **3 hours** for
  batch/services/OData
  ([Learn](https://learn.microsoft.com/dynamics365/fin-ops-core/dev-itpro/dev-ref/xpp-data/xpp-data-home-page)).
  A batch job designed to run for hours needs a chunking strategy, not a bigger timeout.
- See `$transactions-and-concurrency` for scoping and retry rules.

## 6. Volume work belongs in batch, chunked

- Anything that could touch more than a few thousand records belongs in a SysOperation
  batch job, not in a form's `clicked()` — see `$sysoperation-batch-patterns`.
- Split by a natural key range so tasks can run in parallel across batch threads, and give
  the batch group threads and a priority. Microsoft's guidance is explicit about batch
  groups, priority and threads as the scaling lever.
- Use **noncontinuous number sequences with preallocation** for high-volume inserts —
  a continuous sequence serialises every caller on one lock and is a classic throughput
  ceiling.
- For bulk data movement in or out, use DMF, not OData. OData does not handle large
  volumes well; see `$integration-dmf-dualwrite`.

## 7. Before you say it is done

- [ ] Every loop's complexity named, in terms of the business quantity.
- [ ] No `select`, `find()`, or other round-trip inside a loop body.
- [ ] No nested `while select` where a join would do.
- [ ] Set-based used where possible — and the downgrade table checked.
- [ ] Every `where` clause function-free and index-supported; field list narrowed.
- [ ] Transaction scope is the minimum, with no I/O inside.
- [ ] Volume path is batchable and chunkable.
- [ ] Any `skip*` call justified out loud.

## Hard rules

- **Never `forceLiterals`.** `AGENTS.md` bans it; it defeats plan caching and is a SQL
  injection vector.
- Never "fix" a slow query by caching it. Caching a bad query hides the problem and makes
  it harder to find later — fix the query, then consider caching.
- Never add an index speculatively. Confirm the `where` clause it would serve, and say what
  the write cost is — every index is paid for on every insert and update.
- Do not claim a performance improvement you have not measured. "This should be faster" is
  an inference; say so. Real numbers come from Trace Parser, the Performance timer
  (`debug=develop`), Query Store, or a timed run — not from reading the code.
