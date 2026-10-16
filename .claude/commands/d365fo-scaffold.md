---
description: Scaffold a new D365FO AOT object the sanctioned way, with pre-flight checks.
argument-hint: "<type> <ObjectName> [into <Model>]"
---

Scaffold: $ARGUMENTS

Work through these steps in order. Do not skip ahead — each one has caught a real defect.

1. **Health check.** Run `d365fo doctor --output json`. If the Bridge reports missing, `generate --install-to` cannot write into a model and every metadata lookup silently uses the stale index instead. Fix it before continuing (see `/d365fo-doctor`). Never work around a missing toolchain by hand-writing the XML — a `PreToolUse` hook will block that anyway, and it once cost two days of debugging.

2. **Does it already exist?** `d365fo search <ObjectName>` and `d365fo get <type> <ObjectName>`. D365FO ships thousands of entities, tables and services; adding a redundant one is pure maintenance cost. If something close already exists, say so and ask whether to extend it instead.

3. **Load the matching skill** before writing anything: `table-scaffolding`, `data-entity-scaffolding`, `form-pattern-scaffolding`, `coc-extension-authoring`, `custom-service-authoring`, `business-events-authoring`, `sysoperation-batch-patterns`, `event-handler-authoring`, `object-extension-authoring`, or `security-hierarchy-trace` for security objects. Each one carries the pattern presets and the traps for that object type.

4. **Confirm the target model.** Determine ownership from the actual source location under `Metadata/<Package>/<Model>/`, never from the object-name prefix. If the model is ambiguous, ask — putting an object in the wrong model creates a dependency that is painful to unwind later.

5. **Generate.** Use `d365fo generate <type> <Name> --install-to <Model>` or `mcp__d365fo-mcp-server__generate_object`. Where a `prepare` step exists for this object type, run it first and pass the grounding token to the generator — it binds the output to real metadata instead of a plausible guess.

6. **Wire it up.** Add the object to the correct build project, declare any new model dependency in the descriptor, and create labels rather than hardcoding user-facing strings.

7. **Verify and report.** Run the offline checks (`d365fo validate xpp`, `validate references`, `lint`). For a new data entity, remember that a successful build is NOT proof it works — the ground truth is a live OData GET against `/data/<Collection>`. Report what you ran, what passed, and what still needs a live environment.
