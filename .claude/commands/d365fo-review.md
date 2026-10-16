---
description: Review the current D365FO changes with the reviewer subagent as a second set of eyes.
argument-hint: "[path or object name to scope the review]"
---

Review the pending D365FO changes. Scope: $1 (if empty, review everything currently changed).

1. Establish what actually changed — `git status`, then `git diff` for source and `d365fo review diff` for AOT XML, which adds a BP-style probe (missing EDT or label, hard-coded strings, dynamic query) on top of the raw byte diff. Do not review from memory of what was written.

2. Delegate to the `reviewer` subagent via the Agent tool. It is read-only and deliberately less invested in the code than this session is — that is the point of using it rather than re-reading your own work. Give it the diff scope and any context it needs about intent.

3. While it runs, verify the things a diff alone cannot show:
   - New objects are members of the right build project (`Build/SandboxBuild/<Project>/*.rnrproj`).
   - Model dependencies are declared in the descriptor for anything newly referenced.
   - Labels referenced in the diff actually resolve.

4. Report findings ranked by severity, each with a file reference and a concrete fix. Then state plainly what was verified, how, what could not be verified and why, and what the user should check themselves in a live environment.

Per `AGENTS.md`, a task is not done until this review has actually happened — not merely been described.
