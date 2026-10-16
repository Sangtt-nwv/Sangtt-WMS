# Build Spec Schema (`build_tdd.py`)

`scripts/build_tdd.py` consumes a single JSON file and produces a finished `.docx`.

```
python scripts/build_tdd.py spec.json output.docx [--template assets/TDD_template.docx]
```

## Top-level shape

```json
{
  "cover":     { ... },
  "revisions": [ { ... } ],
  "body":      [ { "type": "...", ... } ]
}
```

### `cover` (object)

| Field | Meaning |
|---|---|
| `client_name` | Client company, e.g. "Acme Manufacturing Co., Ltd" |
| `project_name` | Project/subtitle, e.g. "Microsoft Dynamics 365 F&O Implementation" |
| `version` | Document version shown on the cover, e.g. "1.0" |
| `content_summary` | One line describing what the document covers |
| `prepared_by` | Author name |

### `revisions` (array, oldest first)

```json
{ "version": "1.0", "date": "06/16/2026", "author": "Name", "description": "Initial technical design" }
```

### `body` (array of ordered blocks)

Blocks render top-to-bottom. Types:

**Headings** — numbering is automatic; do **not** include "1." / "2.1" prefixes.
```json
{ "type": "h1", "text": "Business Requirement" }
{ "type": "h2", "text": "Data dictionary" }
{ "type": "h3", "text": "Menu Item Action" }
```

**Paragraph**
```json
{ "type": "p", "text": "Plain prose.", "bold": false, "italic": false }
```

**Bullets** (nest by putting an object with its own `items` inside `items`)
```json
{ "type": "bullets", "items": [
    "Top-level point",
    { "items": ["Sub-point A", "Sub-point B"] }
] }
```

**Table** — the workhorse. `title` draws a shaded bar, `header` a bold header row.
```json
{ "type": "table",
  "title":  ["Table name", "NWVPayrollStaging", "New"],
  "header": ["Field name", "Label", "Extended Data Type/Base Enum", "Mandatory (Y/N)", "Allow edit (Y/N)"],
  "rows":   [ ["BatchId", "Payroll Batch", "NWVPayrollBatchId", "Y", "N"] ],
  "widths": [1.4, 1.4, 2.2, 1.2, 1.2]
}
```
- `title` may be a **string** (single full-width merged bar) or a **list**
  (one shaded cell per column — used for `Table name | <name> | New`).
- `header` and `widths` (inches) are optional. Omit `title` for EDT tables.
- Leave a cell empty with `""`.

**Image** (screenshot)
```json
{ "type": "image", "path": "/abs/path/screenshot.png", "width_in": 5.5, "caption": "Posting packing slip" }
```

**Code** (monospaced block, e.g. X++ / AL snippets)
```json
{ "type": "code", "text": "while select custTable\n{\n    info(custTable.AccountNum);\n}" }
```

**Spacer** — a blank line: `{ "type": "spacer" }`

## Worked mapping (Data dictionary example)

Document text:
> 2.2 Từ điển dữ liệu
> • Extended Data Types  → EDT table
> • Table  → table-definition table(s)

Spec:
```json
[
  { "type": "h2", "text": "Từ điển dữ liệu (Data Dictionary)" },
  { "type": "p", "text": "Extended Data Types", "bold": true },
  { "type": "table",
    "header": ["Extended Data Types Name", "Label", "Type", "String Size"],
    "rows": [["NWVTicketNumber", "Scale Note", "String", "100"]] },
  { "type": "p", "text": "Table", "bold": true },
  { "type": "table",
    "title": ["Table name", "NWVDSNSetup", "New"],
    "header": ["Field name", "Label", "Extended Data Type/Base Enum", "Mandatory (Y/N)", "Allow edit (Y/N)"],
    "rows": [["InventLocationId", "", "InventLocationId", "Y", "Y"]] }
]
```

## Notes

- The builder fills cover placeholders, replaces the revision rows, appends the
  body before the final section break, and flags the TOC to refresh on open.
- Output always validates as a well-formed `.docx`; if editing further, use the
  `docx` skill's unpack → edit → pack flow.

## Worked mapping (Query section)

```json
[
  { "type": "h2", "text": "Truy vấn dữ liệu (Queries / Views)" },
  { "type": "table",
    "title": ["Tên query", "NWVVASTrialBalance", "Mới"],
    "header": ["Data Source", "Kiểu Join", "Mục Đích / Ghi Chú"],
    "rows": [
      ["GeneralJournalAccountEntry", "Root", "Root data source, registered via SRSReportQueryAttribute on the DP class."],
      ["GeneralJournalEntry", "Inner Join", "Joins on GeneralJournalEntry.RecId = GeneralJournalAccountEntry.GeneralJournalEntry."],
      ["TransactionReversalTrans", "Outer Join", "Adds reversal transaction context."]
    ],
    "widths": [2.0, 1.2, 4.2]
  },
  { "type": "p", "text": "Note: This query is registered via annotation on the DP class but is not used directly in processReport(). All GL data is fetched via the standard LedgerTrialBalanceDP framework. Align query design with actual usage in the next version.", "italic": true }
]
```

## Worked mapping (Issues & Improvement Proposals section)

```json
[
  { "type": "h1", "text": "Vấn Đề Lưu Ý & Đề Xuất Cải Tiến (Technical Notes & Best Practices)" },
  { "type": "p", "text": "The following issues were found during technical analysis and should be addressed in the next sprint." },
  { "type": "table",
    "header": ["Ưu Tiên", "Vấn Đề", "Vị Trí", "Đề Xuất"],
    "rows": [
      ["Cao", "N+1 query: SELECT SUM per account inside a full MainAccount loop", "calculateReportData()", "Pre-load NWVVASAccountBalanceTmp into Map<str, Container> and do in-memory lookups."],
      ["Trung bình", "Row-by-row buf2Buf insert inside a loop", "insertNoneConsolidateAccount()", "Replace with insert_recordset for set-based bulk insert."]
    ],
    "widths": [0.9, 2.4, 1.8, 2.3]
  }
]
```

## Worked mapping (Overall Architecture table — SSRS PreProcess pattern)

```json
[
  { "type": "h2", "text": "Kiến trúc tổng thể (Overall Architecture)" },
  { "type": "p", "text": "The report uses the SRS PreProcess pattern (SRSReportDataProviderPreProcessTempdb) to isolate heavy batch processing from SSRS rendering. A shared UserConnection is used to share TempDB tables across classes." },
  { "type": "table",
    "header": ["Lớp", "Class / Đối Tượng", "Kế Thừa / Framework"],
    "rows": [
      ["Entry Point", "NWVVASTrialBalanceController", "SrsReportRunController"],
      ["Xây dựng Dialog", "NWVVASTrialBalanceUIBuilder", "SrsReportDataContractUIBuilder"],
      ["Data Contract", "NWVVASTrialBalanceContract", "DataContractAttribute + SysOperationValidatable"],
      ["Data Provider", "NWVVASTrialBalanceDP", "SRSReportDataProviderPreProcessTempdb"],
      ["Báo cáo SSRS", "NWVVASTrialBalance.Report", "SSRS (hai dataset)"]
    ],
    "widths": [1.5, 2.5, 3.4]
  }
]
```
