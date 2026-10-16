# Technical Design Document — Format Reference

This is the NaviWorld Vietnam house format for **Technical Design Documents (TDD)**,
used to document customizations and integrations for Microsoft Dynamics ERP
(AX 2009/2012 and Dynamics 365 Finance & Operations / Business Central).

The bundled template `assets/TDD_template.docx` already encodes all branding and
styling. You only supply content. Do **not** rebuild the cover, header, footer, or
heading styles by hand — fill the template instead.

## Page & style facts (already in the template)

- Page size A4, narrow margins, navy left sidebar on the cover.
- Default body font Calibri 12pt; heading font Cambria.
- **Heading 1** — auto-numbered (`1`, `2`, …), bold ALL-CAPS, light-blue banner
  (`CDE5FF`), starts on a new page.
- **Heading 2** — auto-numbered (`2.1`, `2.2`, …), bold small-caps.
- **Heading 3** — auto-numbered (`2.7.1`, …), bold.
- Numbering is carried by the styles, so headings number themselves — never type
  the "1", "2.1" prefixes yourself.
- Running header shows the NaviWorld logo; footer shows "Page X of Y".
- Table of Contents is a live field set to refresh when the document is opened.

## Document structure (in order)

1. **Thông Tin Chung (Document Control)**
   - Includes the cover page (Tên dự án, Tên module, Người thiết kế, Ngày tạo & Phiên bản).
   - Followed by the Lịch sử chỉnh sửa (Revision History) table: Bảng ghi nhận thay đổi (Phiên bản, Ngày, Người sửa, Mô tả).
2. **Table of Contents** — auto-generated; no manual entries.
3. **1. Yêu Cầu Nghiệp Vụ (Business Requirement)**
   - **Mô tả bài toán:** Chức năng này phục vụ quy trình nào của người dùng?
   - **Khoảng trống hệ thống (Gap Analysis):** Tại sao tính năng tiêu chuẩn không đáp ứng được?
   - **Quy tắc nghiệp vụ (Business Logic & Validation):** Các điều kiện ràng buộc, luồng duyệt (workflow), hoặc các quy tắc bắt buộc nhập liệu.
4. **2. Thiết Kế Kỹ Thuật (Technical Design)** — the implementation, broken into H2 subsections.
   - **2.1 Kiến trúc tổng thể (Overall Architecture):** Mô hình thiết kế (Pattern) sẽ sử dụng, Luồng luân chuyển dữ liệu.
   - **2.2 Từ điển dữ liệu (Data Dictionary):** Extended Data Types (EDT) / Base Enums, Tables.
   - **2.3 Cấu trúc Lớp (Classes):** Bảng liệt kê các Class sẽ tạo mới hoặc Extension.
   - **2.4 Truy vấn dữ liệu (Queries / Views):** Định nghĩa các AOT Query hoặc Views.
   - **2.5 Giao diện người dùng (Forms / UX):** Thiết kế layout của Form, Data Source.
   - **2.6 Điều hướng (Menu & Security):** Menu Items, Menus, Security (Privileges, Duties).
5. **3. Vấn Đề Lưu Ý & Đề Xuất Cải Tiến (Technical Notes & Best Practices)**
   - **Hiệu năng (Performance):** Chiến lược tránh lỗi N+1 query, set-based operations.
   - **Tính toàn vẹn dữ liệu:** Sử dụng ttsbegin/ttscommit/catch.
   - **Caching & Optimization:** Biện pháp cache để tránh gọi DB nhiều lần.

Not every document needs every subsection — include only what the change touches.

## Table conventions

All object tables share a "title bar + header row + data rows" shape. Header and
title cells are bold on a light-blue fill; the grid has thin grey borders.

**Extended Data Types** (no title bar):

| Extended Data Types Name | Label | Type | String Size |
|---|---|---|---|
| NWVTicketNumber | Scale Note | String | 100 |

EDTs that extend an existing type use **Extends** instead of **Type**.

**Table definition** (title bar = `Table name | <name> | New` or `Add new field`):

| Field name | Label | Extended Data Type/Base Enum | Mandatory (Y/N) | Allow edit (Y/N) |
|---|---|---|---|---|

An optional Index sub-row may precede the field header (Index name, Unique Y/N).

**Class** (title bar = `Class name | <name> | New/Modify`):
A "Purpose" row, then a `Methods | New/Modify` header, then one row per method.

**Form** (title bar = `Form name | <name> | New/Modify`):
A `Field | Control | Position | New/Modify` header, then one row per control.
A `Menu Item Button | Type | Position | New/Modify` block may follow.

**Menu Item Action / Display** header: `Name | Label | Object type | Object`.
**Menus** header: `Menu Name | Label | Position`.

**Query** (title bar = `Query name | <name> | New/Modify`):
A `Data Source | Join type | Purpose/Notes` header, then one row per data source.
An italicised note paragraph may follow the table to explain discrepancies between
the AOT query and its actual usage in code.

**Menu Item Output** header (for SSRS output menu items):
`Name | Label | Object type | Object`
Use sub-section heading "Menu Item Output" for report output actions.

## Issues & Improvement Proposals section

An optional trailing section **"Vấn Đề Đã Phát Hiện và Đề Xuất Cải Tiến"**
(Issues Discovered and Improvement Proposals) documents technical debt, bugs, and
refactoring recommendations found during analysis. It is rendered as a single table:

| Priority (High/Medium/Low) | Issue | Location | Recommendation |
|---|---|---|---|

Include this section only when there are actual issues to report. Use Vietnamese
section headings in Vietnamese-language TDDs.

## Bilingual (Vietnamese / English) TDDs

NaviWorld Vietnam produces TDDs in Vietnamese for local clients. Conventions:
- Section headings are in Vietnamese but object names (class, table, method) remain
  in English.
- "Yêu Cầu Nghiệp Vụ" = Business Requirement (H1).
- "Thiết Kế Kỹ Thuật" = Technical Design (H1).
- "Kiến trúc tổng thể" = Overall Architecture (H2).
- "Từ điển dữ liệu" = Data Dictionary (H2).
- "Cấu trúc Lớp" = Classes (H2).
- "Truy vấn dữ liệu" = Queries / Views (H2).
- "Giao diện người dùng" = Forms / UX (H2).
- "Điều hướng" = Menu & Security (H2).
- "Vấn Đề Lưu Ý & Đề Xuất Cải Tiến" = Technical Notes & Best Practices (H1).
- Table headers inside object tables may stay English for consistency.

## SSRS PreProcess pattern (SRSReportDataProviderPreProcessTempdb)

When a report processes large GL/ledger data, the architecture uses
`SRSReportDataProviderPreProcessTempdb` to isolate heavy batch processing from
SSRS rendering. The class architecture table in Section 2 ("Kiến Trúc Tổng Thể" /
"Overall Architecture") should capture these five layers:

| Layer | Class / Object | Inherits / Framework |
|---|---|---|
| Entry Point | *Controller | SrsReportRunController |
| Dialog Builder | *UIBuilder | SrsReportDataContractUIBuilder |
| Data Contract | *Contract | DataContractAttribute + SysOperationValidatable |
| Data Provider | *DP | SRSReportDataProviderPreProcessTempdb |
| SSRS Report | *.Report | SSRS (list datasets) |

A `UserConnection` is shared among classes to allow TempDB tables to be visible
across the Provider and its helpers.

## Naming conventions observed

- Custom objects are prefixed `NWV` (NaviWorld Vietnam), e.g. `NWVDSNSetup`,
  `NWVUpdateSalesParmLineFromWB`, `NWVVASTrialBalance`.
- Sub-module prefixes are common: `NWVVAS` = NaviWorld Vietnam VAS (Vietnamese
  Accounting Standards), `NWVHR` = HR module, etc.
- The "New/Modify" column states whether each object/method is added or changed.
- Error-message text is quoted verbatim and italicized in the requirement.
- `NWVVASParameters` is the central setup table for VAS module settings
  (language, consolidation flags, decimal/separator formats, chief accountant, etc.).

## How content maps to the builder

Express the whole document as a JSON spec and run `scripts/build_tdd.py`.
Each object table becomes a `table` block (optional `title`, a `header`, and
`rows`). Headings become `h1`/`h2`/`h3` blocks (numbering is automatic).
Screenshots become `image` blocks. See `spec-schema.md` for the exact schema.
