---
name: technical-design-document
description: "Create a NaviWorld Vietnam-style Technical Design Document (TDD) as a .docx for Microsoft Dynamics ERP work (Dynamics AX, D365 Finance & Operations, or Business Central). Use this skill whenever the user wants to write, generate, draft, or scaffold a technical design document, TDD, design spec, or solution-design doc for an ERP customization, integration, or enhancement — especially anything mentioning Dynamics AX/D365/BC objects like Tables, EDTs (Extended Data Types), Classes, Forms, Menu Items, X++/AL, or NWV-prefixed objects. Also use it when the user uploads or references an existing TDD in this house format and wants a new one in the same style. Trigger even if the user just says 'technical design document', 'TDD', or 'design doc for this customization' without naming the format explicitly."
---

# Technical Design Document (NaviWorld house format)

Generate a branded NaviWorld Vietnam **Technical Design Document** (`.docx`) for
Microsoft Dynamics ERP customizations. The skill ships a clean, branded template
and a builder that turns a structured spec into the finished document, so the
cover page, NaviWorld branding, auto-numbered heading styles, header/footer, and
table styling are always correct — you only provide content.

## When to use

Use whenever someone needs a technical design document for a Dynamics AX / D365
F&O / Business Central change: an integration, a new feature, or an enhancement
to existing functionality. The output is a polished `.docx` matching the house
style (see `references/format-spec.md`).

## What's in this skill

```
technical-design-document/
├── SKILL.md
├── assets/
│   └── TDD_template.docx             # branded, client-neutral template (cover, styles, header/footer, TOC)
├── scripts/
│   ├── build_tdd.py                  # fills the template from a JSON spec → finished .docx
│   └── gen_rich_json_spec.py         # automatically extracts D365FO XML metadata into JSON specs
└── references/
    ├── format-spec.md                # the document format: sections, table schemas, naming conventions
    ├── spec-schema.md                # JSON schema consumed by build_tdd.py
    ├── project_input_template.json   # template for defining categories to extract via metadata
    └── example_spec.json             # an example of a generated JSON spec
```

## Workflow

### 1. Gather the content & Extract Metadata

Instead of manually writing the JSON spec from scratch, use the metadata extraction script (`scripts/gen_rich_json_spec.py`) to automatically parse D365FO metadata and scaffold the JSON spec.

1. Create a `project_input.json` file based on `references/project_input_template.json`. This file defines the business requirements, features, and target classes/tables for each module.
2. Run the extraction script against the local D365FO metadata directory:

```bash
python scripts/gen_rich_json_spec.py --input path/to/project_input.json --metadata path/to/AosService/PackagesLocalDirectory/NWVEI/NWVEI --output /tmp/
```

This will automatically read the XML metadata of the objects defined in your input JSON, extract all methods, fields, queries, and constraints, and generate a set of `tdd_spec_*.json` files.

### 2. Refine the JSON spec

Open the generated JSON spec (e.g. `tdd_spec_Func1_CoreSetup.json`) and review the extracted metadata.
You can manually adjust explanations, add business logic descriptions, or insert screenshots.
Read `references/spec-schema.md` to see exactly what each section and table should contain and the `NWV` naming conventions. 

### 3. Build the document

```bash
python scripts/build_tdd.py /tmp/tdd_spec_Func1_CoreSetup.json /mnt/user-data/outputs/Func1_TDD.docx
```

The script fills cover placeholders, rewrites the revision history, appends the body, and flags the TOC to refresh on open. It will output a beautifully formatted Word document with all NaviWorld branding, repeated table headers, and proper styles.

### 4. Verify, then deliver

Review the generated `.docx` file. Tell the user the Table of Contents page numbers update when they open the file in Word (or press Ctrl+A then F9 in Word). If a client logo is needed on the cover, mention that the slot is a placeholder they can replace, or that you can swap in a provided logo image.

## Notes & tips

- **Custom cover logo**: the template's client-logo slot is a neutral placeholder.
  To use a real client logo, the simplest path is to replace `word/media/image1.png`
  inside the output via the `docx` skill's unpack → swap file → pack flow.
- **Further hand-editing**: the output is a normal `.docx`. For tracked changes,
  comments, or fine XML tweaks, switch to the `docx` skill.
- **Both AX and D365/BC**: the format is identical; only the object vocabulary
  differs (e.g. AL Tables/Pages for Business Central vs X++ Tables/Forms for AX).
  Keep the same section layout and `NWV` prefixing.
- **Don't hand-build the cover or styles.** Always start from `TDD_template.docx`;
  rebuilding branding from scratch loses the sidebar, logos, banner headings, and
  footer.
