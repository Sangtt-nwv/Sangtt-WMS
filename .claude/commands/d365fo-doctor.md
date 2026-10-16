---
description: Check d365fo CLI, Bridge and index health, and fix what can be fixed automatically.
allowed-tools: Bash(d365fo doctor:*), Bash(d365fo index:*), Bash(where d365fo:*), Read
---

Run `d365fo doctor --output json` and report the result.

Then act on what it found, in this order:

1. **CLI not on PATH** — tell the user to run `tools/bootstrap-d365fo-cli.ps1`, which clones, builds and installs the CLI, publishes `D365FO.Bridge.exe`, points the CLI at this VM's AOS package root and this repo's `Metadata/`, and builds the index. Do not proceed with metadata work until it is there, and do not fall back to hand-writing AOT XML.

2. **Bridge missing or not found** — `doctor` only reports this gap, it never self-heals, and the official `install.ps1` does not build the Bridge at all. Without it, every `get` / `generate --install-to` / `validate metadata` call silently falls back to the stale SQLite index. Build it:

   ```
   dotnet publish src\D365FO.Bridge -c Release -r win-x64 --self-contained -o "$(Split-Path (Get-Command d365fo).Source)"
   ```

   Then re-run `doctor` to confirm.

3. **Stale index** — run `d365fo index refresh`, then re-run `doctor`.

4. **Build tooling missing** (`xppc.exe`, `xppbp.exe`, `SyncEngine.exe`, MSBuild, Dynamics targets) — report it. These come from the AOS installation, not from the CLI, so they cannot be fixed from this repo. Say which are missing and what that blocks.

Finish with a one-line verdict: whether metadata results can be trusted right now, and if not, exactly what is still broken.
