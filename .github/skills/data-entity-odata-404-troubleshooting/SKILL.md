---
name: data-entity-odata-404-troubleshooting
description: 'Diagnose a D365FO AxDataEntityView that compiles cleanly (0 build errors, correct SQL view, correct XppMetadata/Persister) but returns HTTP 404 "No route data was found" from OData (/data/<Collection>). Use when a new custom entity was hand-authored as XML instead of created through d365fo generate --install-to or the Visual Studio Data Entity Wizard, or when a working entity mysteriously stops routing after edits.'
---
<!-- GENERATED from .claude/skills/data-entity-odata-404-troubleshooting/SKILL.md by tools/sync-agent-skills.ps1 - DO NOT EDIT THIS COPY. Edit the source and re-run the script. -->

# Data Entity OData 404 Troubleshooting

## The one-line answer, first

**If the entity was created by hand-writing `AxDataEntityView` XML and then Build +
Synchronize Database — not through `d365fo generate entity --install-to <Model>` (with
`D365FO_BRIDGE_ENABLED=1` and `D365FO.Bridge.exe` present) or the Visual Studio Data Entity
Wizard — that is almost certainly the root cause.** Stop auditing XML properties and instead:

1. Confirm the Bridge is healthy: `d365fo doctor --output json`. If `bridge.executable` or
   `bridge.enabled` is not `ok`, fix that first (see `AGENTS.md` → Required Workflow step 0 /
   `CLAUDE.md` → Mandatory first steps) — a hand-XML fallback with a broken Bridge is exactly
   how this happens.
2. Recreate the entity through `d365fo generate entity <Name> --table <Table> --install-to
   <Model> --verify`, or through the wizard, on the entity's real root table if it has a
   usable unique index (see "table has no natural key" below if it does not).
3. Only *then* edit the generated object's fields/keys/joins/labels by hand if you need
   something the generator didn't produce — editing an already-registered object is safe;
   the gap is specifically in how a brand-new object gets registered for OData routing.

## Why this happens (confirmed by direct testing, not guesswork)

Writing `AxDataEntityView` XML directly to disk and running Build + Synchronize Database
produces a fully compiling object: the SQL view is created correctly, `XppMetadata` and the
generated `__Persister__.xpp` are correct, and `d365fo validate metadata` (bridge round-trip
through Microsoft's `IMetadataProvider`) can even confirm the XML is well-formed. None of that
means it is *routable*. Creating the object through Visual Studio's Data Entity Wizard (or the
CLI's `generate --install-to`, which drives the same live `IMetadataProvider` via
`D365FO.Bridge.exe`) goes through additional kernel-side registration that a raw file write
plus offline compile does not trigger. Two entities in the same model, built on the same root
table, with near-identical final XML (same `ConfigurationKey`, no `EntityCategory`, same label
format) produced different results — the hand-authored one 404'd, the wizard-created one
returned 200 — which isolates the cause to *how the object was created*, not what its XML
contains.

## Red herrings — already tried, already ruled out, do not re-litigate these

Each of these was tested in isolation against a live environment and found **not** to be the
cause of the 404 (though some are still worth getting right for other reasons):

| Hypothesis | Verdict | Why |
|---|---|---|
| `ConfigurationKey` missing/wrong | Not the cause in general | Matters for licensing visibility of the *feature*, and should match the root table's own `ConfigurationKey` (`d365fo get table <Table>` / grep the table XML) — but a working entity with the wrong key still worked, and several correctly-keyed entities still 404'd. |
| `EntityCategory` missing | Not the cause | The confirmed-working reference entity had no `EntityCategory` at all; several 404'ing entities had it set. Omit it unless a real requirement calls for it. |
| `<Label>` is plain text instead of `@Model:Id` | Not the cause of the 404 (but fix it anyway) | Every working entity found used a real label reference, and plain-text labels are against `xpp-best-practice-rules`/`label-translation` regardless — but a plain-text label alone did not reproduce the 404 on its own. |
| Entity missing from `DMFENTITY` (SQL table behind the Data Management "entity list") | A real, separate gap — not the OData route table | `DMFENTITY` is populated by "Refresh entity list" in the Data Management workspace, is unrelated to `/data/<Collection>` routing (an entity absent from `DMFENTITY` can still return 200 via OData), and was observed to reset/need re-refreshing independent of the 404. Don't chase it as an OData fix. |
| Entity missing/present in `Dynamics.AX.<Model>.ODataExtends.runtime` (a build output file) | Unreliable signal, ignore it | A known-working production entity in an unrelated model was *absent* from this file and still returned 200 live. This file reflects incremental-build bookkeeping, not a complete or authoritative registry. |
| `iisreset` / AOS restart | No effect observed | Worth trying once for a genuinely stale `$metadata` cache, but did not fix a hand-authored-object 404 in testing. |
| Security privilege/duty wiring | Not the cause | A confirmed-working entity had zero Duty/Role assignment and still worked (admin bypass). Privileges control who can use the entity, not whether the route exists. |

## Tables with no natural/unique key

`d365fo generate entity`/the wizard require a unique index to derive the entity key. Some
legitimate root tables have none (every index `AllowDuplicates=Yes`) — check with
`d365fo get table <Table> --output json` or grep the table XML's `<Indexes>`. When that's the
case:

1. Generate/create the entity against a **related table that does have a real key** (e.g. the
   parent table) instead of the field-of-interest's own table.
2. Once created (and registered), edit the generated XML's `ViewMetadata/DataSources` root and
   `Fields`/`Keys` to point at the real target table instead, keeping the object's `Name`
   unchanged. This has been confirmed safe — swapping the query root and field list on an
   already-registered object does not un-register it.
3. Give the entity's own key field(s) explicitly in `<Keys>` (they won't be auto-derived once
   the datasource is swapped).

## Live verification — the only ground truth

Build success, a compiling SQL view, and `XppMetadata` existing are all necessary but **not
sufficient**. The only proof an entity actually routes is a live call:

```
GET {BaseUrl}/data/{PublicCollectionName}?$top=1
Authorization: Bearer {token}
```

`200` (even with an empty `value: []`) means it routes. `404 "No route data was found for
this request"` means it does not, regardless of what the build log says.
