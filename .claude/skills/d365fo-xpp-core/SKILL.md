---
name: d365fo-xpp-core
description: "Ground D365 Finance and Operations X++ implementation, debugging, refactoring, review, and AOT work in verified metadata and repository rules. Use for any task involving X++ code, D365FO AOT XML, models, tables, classes, forms, extensions, labels, security, queries, services, entities, business events, or batch jobs."
---

# D365FO X++ Core

## Workflow

1. Read [repository-overlay.md](references/repository-overlay.md) first. It overrides stale layout and ownership assumptions in the migrated Copilot material.
2. Read [cli-guide.md](references/cli-guide.md) for the metadata and CLI workflow.
3. Read [copilot-canon.md](references/copilot-canon.md) when the task needs the full X++ rule canon or object-routing matrix.
4. Inspect `AGENTS.md`, the target descriptor, source object, related objects, and build project.
5. Resolve metadata with D365FO MCP or `d365fo --output json` when available.
6. If tooling is unavailable, use repository source only for objects present under `Metadata/`; do not infer external platform metadata.
7. Use object-specific skills for implementation details and `$xpp-best-practice-rules` for every X++ edit.
8. Never hand-create new AOT XML. Stop and report the missing scaffolding prerequisite when no generator is available.
9. Verify the diff, references, labels, project membership, and available static checks.

## Output

Report verified metadata, architecture decision, changed objects, validation performed, and any environment-dependent checks still required.
