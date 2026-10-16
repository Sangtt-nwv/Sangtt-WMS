# Codex Repository Overlay

This file records the current repository facts that override stale layout or ownership assumptions in the migrated `.github` and `.prompts` material.

## Current Layout

- D365FO source of truth: `Metadata/`.
- Package root: `Metadata/<Package>/`.
- Model descriptor: `Metadata/<Package>/Descriptor/*.xml`.
- AOT source: `Metadata/<Package>/<Model name>/Ax<Type>/<Object>.xml`.
- Hosted build solution: `Build/SandboxBuild/SandboxBuild.sln`.
- Hosted build projects: `Build/SandboxBuild/<Project>/*.rnrproj`.
- Binary-only package: `Metadata/AmicisLifestyle/`.

## Ownership

Determine ownership from the actual descriptor and source path. Do not limit repo-managed ownership to the three models named in older Copilot instructions.

Existing source objects under a repo-managed model may be edited directly when that is the intended change. Standard Microsoft and external third-party objects not present as managed source must be customized through supported extensions, CoC, or event handlers.

Every new AOT XML object still requires D365FO scaffolding tooling.

## Tool Availability

The project config declares the Microsoft Learn MCP server. The `d365fo` MCP server is declared but disabled because `d365fo-mcp` is not currently available on `PATH`.

Until the D365FO tool is installed:

- Inspect repository source for objects that exist under `Metadata/`.
- Do not claim complete knowledge of external platform metadata.
- Do not hand-create new AOT XML.
- Report new-object scaffolding as blocked by the missing tool.

## Migrated Prompt Semantics

The role, discovery, planning, approval gate, implementation, and reporting rules from `.prompts/master.md` are represented in the root `AGENTS.md`.

The core X++ extensibility and database rules from `.github/instructions/agent-skill-xpp-d365fo.instruction.md` are represented by `AGENTS.md`, this core skill, and the focused X++ skills.
