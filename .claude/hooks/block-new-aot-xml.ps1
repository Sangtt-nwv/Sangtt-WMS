<#
.SYNOPSIS
    PreToolUse hook: refuse to let an agent hand-author a NEW AOT XML object.

.DESCRIPTION
    AGENTS.md -> "Metadata And AOT Safety" says new AOT objects must be created with
    `d365fo generate ... --install-to <Model>` or the MCP scaffolding tools, and that an
    agent must stop and report the missing prerequisite if that tooling is unavailable.

    That rule was text-only, and it was broken: a hand-authored AxDataEntityView compiled
    cleanly, produced a correct SQL view, and still returned HTTP 404 from OData. About two
    days went into diagnosing it (see PROVENANCE.md and the
    data-entity-odata-404-troubleshooting skill). This hook is the machine-checkable half
    of that rule.

    What it blocks: creating a file that does not yet exist, under Metadata/, in an Ax*
    object folder, with a .xml extension.

    What it deliberately allows:
      - Editing an AOT object that already exists (AGENTS.md permits this once path and
        model ownership are verified).
      - Anything outside Metadata/.
      - Non-XML files, label files, and descriptors.
      - Files written by `d365fo generate`, which does not go through this tool.

    Escape hatch: set D365FO_ALLOW_AOT_HANDAUTHOR=1 in the environment for the session.
    That is for the `aot-xml-direct-scaffolding` procedure, which requires the user to
    authorize hand-authoring explicitly first.
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

try {
    $raw = [Console]::In.ReadToEnd()
    if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }
    $payload = $raw | ConvertFrom-Json
}
catch {
    # A hook that cannot parse its input must not block legitimate work.
    exit 0
}

if ($env:D365FO_ALLOW_AOT_HANDAUTHOR -eq '1') { exit 0 }

$toolName = $payload.tool_name
if ($toolName -notin @('Write', 'Edit', 'NotebookEdit')) { exit 0 }

$filePath = $null
if ($payload.PSObject.Properties.Name -contains 'tool_input' -and
    $payload.tool_input.PSObject.Properties.Name -contains 'file_path') {
    $filePath = [string]$payload.tool_input.file_path
}
if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }

# Editing an object that already exists is explicitly allowed.
if (Test-Path -LiteralPath $filePath) { exit 0 }

$normalized = $filePath -replace '/', '\'

# Must be an AOT object file: .../Metadata/<Package>/<Model>/Ax<Type>/<Object>.xml
if ($normalized -notmatch '\\Metadata\\') { exit 0 }
if ($normalized -notmatch '\.xml$') { exit 0 }
if ($normalized -notmatch '\\Ax[A-Za-z]+\\[^\\]+\.xml$') { exit 0 }

$objectName = [System.IO.Path]::GetFileNameWithoutExtension($normalized)
$axFolder = Split-Path (Split-Path $normalized -Parent) -Leaf
$objectType = $axFolder -replace '^Ax', ''

$message = @"
BLOCKED: this would hand-author a new AOT XML object.

  Object : $objectName
  Type   : $objectType
  Path   : $filePath

AGENTS.md -> "Metadata And AOT Safety" requires new AOT objects to be scaffolded, not
written by hand. Hand-authored XML has produced objects that compile cleanly and still do
not work at runtime - a new AxDataEntityView once built fine, generated a correct SQL view,
and returned HTTP 404 from OData for two days before the cause was found.

Create it instead with:

  d365fo generate $($objectType.ToLower()) $objectName --install-to <Model>

or the equivalent D365FO MCP tool (mcp__d365fo-mcp-server__generate_object).

If `d365fo doctor` reports the CLI or Bridge as missing, run tools/bootstrap-d365fo-cli.ps1
and retry. If it still cannot be provisioned, STOP and tell the user what is missing rather
than writing the XML by hand.

Editing an AOT object that already exists is allowed and is not affected by this hook.
"@

[Console]::Error.WriteLine($message)
exit 2
