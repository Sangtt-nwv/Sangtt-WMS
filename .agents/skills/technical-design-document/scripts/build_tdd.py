#!/usr/bin/env python3
"""
Build a NaviWorld-style Technical Design Document (.docx) from a JSON spec.

Usage:
    python build_tdd.py spec.json output.docx [--template path/to/TDD_template.docx]

The script loads the bundled clean template (cover page, NaviWorld branding,
heading styles with auto-numbering, header/footer, revision table), fills the
cover placeholders + revision history, then appends the body sections.

See references/spec-schema.md for the full JSON schema and
references/format-spec.md for the document format reference.
"""
import sys, os, json, argparse, copy, re
from docx import Document
from docx.shared import Inches, Pt, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT
from docx.oxml.ns import qn
from docx.oxml import OxmlElement

HEADER_FILL = "DDEBF7"   # Light blue
TITLE_FILL  = "DDEBF7"   # Light blue
BORDER_CLR  = "808080"
HEADER_TEXT_COLOR = "000000"
TITLE_TEXT_COLOR = "000000"
HEADING1_TEXT_COLOR = "1F4E79"
KEYWORD_TEXT_COLOR = "000000"

# ----------------------------------------------------------------------------
# Low-level helpers
# ----------------------------------------------------------------------------
def _set_cell_bg(cell, fill):
    tcPr = cell._tc.get_or_add_tcPr()
    shd = OxmlElement("w:shd")
    shd.set(qn("w:val"), "clear")
    shd.set(qn("w:color"), "auto")
    shd.set(qn("w:fill"), fill)
    tcPr.append(shd)

def _apply_sample_table_format(doc, new_table, sample_tblPr):
    if sample_tblPr is not None:
        new_tblPr = copy.deepcopy(sample_tblPr)
        new_table._tbl.replace(new_table._tbl.tblPr, new_tblPr)


def set_font(run, font_name='Times New Roman'):
    run.font.name = font_name
    rPr = run._element.get_or_add_rPr()
    rFonts = rPr.get_or_add_rFonts()
    rFonts.set(qn('w:eastAsia'), font_name)
    rFonts.set(qn('w:ascii'), font_name)
    rFonts.set(qn('w:hAnsi'), font_name)
    rFonts.set(qn('w:cs'), font_name)

INLINE_TOKEN_RE = re.compile(r"(\*\*.+?\*\*|==.+?==|`.+?`)")


def _inline_text_parts(text):
    text = "" if text is None else str(text)
    parts = []
    last_end = 0
    for match in INLINE_TOKEN_RE.finditer(text):
        if match.start() > last_end:
            parts.append((text[last_end:match.start()], False, False))
        token = match.group(0)
        if token.startswith("**") and token.endswith("**"):
            parts.append((token[2:-2], True, False))
        elif token.startswith("==") and token.endswith("=="):
            parts.append((token[2:-2], True, True))
        elif token.startswith("`") and token.endswith("`"):
            parts.append((token[1:-1], True, True))
        else:
            parts.append((token, False, False))
        last_end = match.end()
    if last_end < len(text):
        parts.append((text[last_end:], False, False))
    return parts or [("", False, False)]


def _add_inline_text(paragraph, text, bold=False, italic=False, color=None,
                     font_name='Times New Roman', size=None):
    for part, inline_bold, inline_accent in _inline_text_parts(text):
        run = paragraph.add_run(part)
        run.bold = bool(bold or inline_bold)
        run.italic = italic
        run_color = KEYWORD_TEXT_COLOR if inline_accent else color
        if run_color:
            run.font.color.rgb = RGBColor.from_string(run_color)
        if size:
            run.font.size = size
        set_font(run, font_name)

def _cell_text(cell, text, bold=False, align=None, color=None):
    cell.text = ""
    p = cell.paragraphs[0]
    if align == "center":
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    _add_inline_text(p, text, bold=bold, color=color)
    return cell

def _set_repeat_table_header(row):
    tr = row._tr
    trPr = tr.get_or_add_trPr()
    tblHeader = OxmlElement('w:tblHeader')
    tblHeader.set(qn('w:val'), "true")
    trPr.append(tblHeader)

def _merge_row(table, text, fill=TITLE_FILL, bold=True, color=TITLE_TEXT_COLOR, repeat_header=False):
    """Add a full-width merged row (used for table 'title' bars)."""
    row = table.add_row()
    first = row.cells[0]
    for c in row.cells[1:]:
        first = first.merge(c)
    _cell_text(first, text, bold=bold, color=color)
    _set_cell_bg(first, fill)
    if repeat_header:
        _set_repeat_table_header(row)
    return row

# ----------------------------------------------------------------------------
# Placeholder replacement (handles paragraphs, tables, headers, footers)
# ----------------------------------------------------------------------------
def _replace_in_paragraph(p, mapping):
    full = "".join(r.text for r in p.runs)
    if not any(k in full for k in mapping):
        return
    for k, v in mapping.items():
        full = full.replace(k, v)
    # collapse into the first run, clear the rest (keeps first run formatting)
    if p.runs:
        p.runs[0].text = full
        for r in p.runs[1:]:
            r.text = ""

def _replace_everywhere(doc, mapping):
    def walk_tables(tables):
        for t in tables:
            for row in t.rows:
                for cell in row.cells:
                    for p in cell.paragraphs:
                        _replace_in_paragraph(p, mapping)
                    walk_tables(cell.tables)
    for p in doc.paragraphs:
        _replace_in_paragraph(p, mapping)
    walk_tables(doc.tables)
    for sec in doc.sections:
        for hf in (sec.header, sec.footer, sec.first_page_header, sec.first_page_footer):
            for p in hf.paragraphs:
                _replace_in_paragraph(p, mapping)
            walk_tables(hf.tables)

# ----------------------------------------------------------------------------
# Revision history
# ----------------------------------------------------------------------------
def fill_revisions(doc, revisions):
    if not revisions:
        return
    # locate the revision table: the first table whose header row contains "Version" or "Date"
    rev_tbl = None
    for t in doc.tables:
        if not t.rows:
            continue
        hdr_row_texts = [(c.text or "").strip().lower() for c in t.rows[0].cells]
        if "version" in hdr_row_texts or "date" in hdr_row_texts:
            rev_tbl = t
            break
            
    if rev_tbl is None:
        return
        
    # remove existing data rows (keep header row 0)
    for r in rev_tbl.rows[1:]:
        r._tr.getparent().remove(r._tr)
        
    hdr_row_texts = [(c.text or "").strip().lower() for c in rev_tbl.rows[0].cells]
    
    for rev in revisions:
        cells = rev_tbl.add_row().cells
        for i, h in enumerate(hdr_row_texts):
            if "date" in h:
                _cell_text(cells[i], rev.get("date", ""))
            elif "author" in h:
                _cell_text(cells[i], rev.get("author", ""))
            elif "version" in h:
                _cell_text(cells[i], rev.get("version", ""))
            elif "note" in h or "description" in h:
                _cell_text(cells[i], rev.get("description", ""))

# ----------------------------------------------------------------------------
# Body block renderers
# ----------------------------------------------------------------------------
def _resolve_heading_style(doc, level):
    candidates = [f"Heading {level}", "Heading 2", "Heading 1", "Normal"]
    for name in candidates:
        try:
            doc.styles[name]
            return name
        except KeyError:
            continue
    return None


def add_heading(doc, text, level, sample_tblPr=None):
    style_name = _resolve_heading_style(doc, level)
    p = doc.add_paragraph(style=style_name) if style_name else doc.add_paragraph()
    
    if level == 1:
        text = text.upper()
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        
        pPr = p._p.get_or_add_pPr()
        shd = OxmlElement("w:shd")
        shd.set(qn("w:val"), "clear")
        shd.set(qn("w:color"), "auto")
        shd.set(qn("w:fill"), TITLE_FILL)
        pPr.append(shd)
        
        p.paragraph_format.space_before = Pt(12)
        p.paragraph_format.space_after = Pt(12)
        
        _add_inline_text(p, text, bold=True, color=HEADING1_TEXT_COLOR)
    else:
        _add_inline_text(p, text, bold=True)

def add_class_info(doc, c_name, desc, rows, sample_tblPr=None):
    # This combines the description and methods into one table
    ncols = max(3, len(rows[0]) if rows else 3)
    table = doc.add_table(rows=0, cols=ncols)
    table.autofit = False
    if sample_tblPr is not None:
        _apply_sample_table_format(doc, table, sample_tblPr)
    
    # Row 1: Tên class (Merged)
    r0 = table.add_row()
    c0 = r0.cells[0]
    for c in r0.cells[1:]:
        c0 = c0.merge(c)
    _set_cell_bg(c0, HEADER_FILL)
    _cell_text(c0, f"Tên class {c_name}", bold=True, color=HEADER_TEXT_COLOR)
    
    # Row 2: Mục Đích (Merged)
    r1 = table.add_row()
    c1 = r1.cells[0]
    for c in r1.cells[1:]:
        c1 = c1.merge(c)
    _set_cell_bg(c1, HEADER_FILL)
    _cell_text(c1, "Mục Đích", bold=True, color=HEADER_TEXT_COLOR)
    
    # Row 3: Description (Merged)
    r2 = table.add_row()
    c2 = r2.cells[0]
    for c in r2.cells[1:]:
        c2 = c2.merge(c)
    _cell_text(c2, desc, bold=False)
    
    # Row 4: Class name | c_name | New/Modify
    r3 = table.add_row()
    _set_cell_bg(r3.cells[0], TITLE_FILL)
    _cell_text(r3.cells[0], "Class name", bold=True, color=TITLE_TEXT_COLOR)
    _set_cell_bg(r3.cells[1], TITLE_FILL)
    _cell_text(r3.cells[1], c_name, bold=True, color=TITLE_TEXT_COLOR)
    for i in range(2, ncols):
        _set_cell_bg(r3.cells[i], TITLE_FILL)
    _cell_text(r3.cells[2], "New/Modify", bold=True, color=TITLE_TEXT_COLOR)
    _set_repeat_table_header(r3)
    
    # Row 5: Headers
    headers = ["Methods", "Giải thích", "New/Modify"]
    r4 = table.add_row()
    for i in range(ncols):
        _set_cell_bg(r4.cells[i], HEADER_FILL)
        _cell_text(r4.cells[i], headers[i] if i < len(headers) else "", bold=True, color=HEADER_TEXT_COLOR)
    _set_repeat_table_header(r4)
    
    # Method Rows
    for row_data in rows:
        r = table.add_row()
        for i in range(ncols):
            _cell_text(r.cells[i], row_data[i] if i < len(row_data) else "")
            
    # Set explicit widths (Methods: 1.5, Giải thích: 4.0, New/Modify: 1.0)
    # The first 3 rows are fully merged so they take full width.
    # The 4th row has 3 cells (if ncols=3). The remaining rows also have 3 cells.
    widths = [1.5, 4.0, 1.0]
    if ncols == 3:
        for row in table.rows[3:]:
            for idx, cell in enumerate(row.cells):
                cell.width = Inches(widths[idx])
                
def add_paragraph(doc, text, bold=False, italic=False):
    p = doc.add_paragraph()
    _add_inline_text(p, text, bold=bold, italic=italic)

def _set_numbering(paragraph, num_id, level=0):
    pPr = paragraph._p.get_or_add_pPr()
    # remove any inherited numPr first
    for existing in pPr.findall(qn("w:numPr")):
        pPr.remove(existing)
    numPr = OxmlElement("w:numPr")
    ilvl = OxmlElement("w:ilvl"); ilvl.set(qn("w:val"), str(level)); numPr.append(ilvl)
    nid = OxmlElement("w:numId"); nid.set(qn("w:val"), str(num_id)); numPr.append(nid)
    pPr.append(numPr)

def add_bullets(doc, items, level=0):
    for it in items:
        if isinstance(it, dict):
            add_bullets(doc, it.get("items", []), level + 1)
            continue
        p = doc.add_paragraph(style="Normal")
        p.paragraph_format.left_indent = Inches(0.28 + (0.22 * min(level, 4)))
        p.paragraph_format.first_line_indent = Inches(-0.18)
        _add_inline_text(p, f"• {it}")

def add_code(doc, text):
    p = doc.add_paragraph()
    for line in str(text).split("\n"):
        run = p.add_run(line)
        run.font.name = "Consolas"
        run.font.size = Pt(9)
        run.add_break()

def add_image(doc, path, width_in=None, caption=None):
    if not os.path.exists(path):
        add_paragraph(doc, f"[missing image: {path}]", italic=True)
    else:
        p = doc.add_paragraph()
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        run = p.add_run()
        run.add_picture(path, width=Inches(width_in) if width_in else None)
    if caption:
        c = doc.add_paragraph()
        c.alignment = WD_ALIGN_PARAGRAPH.CENTER
        cr = c.add_run(caption); cr.italic = True; cr.font.size = Pt(9)

def add_table(doc, block, sample_tblPr):
    """
    Generic table block:
      title  : optional str -> full-width shaded title bar (e.g. "Table name | NWVDSNSetup | New")
               may also be a list -> rendered as a shaded title row across columns
      header : optional list[str] -> bold shaded header row
      rows   : list[list[str]]
      widths : optional list[float] (inches) for column widths
    """
    rows = block.get("rows", [])
    header = block.get("header")
    ncols = (len(header) if header else (len(rows[0]) if rows else 1))
    ncols = max(ncols, 1)

    try:
        table = doc.add_table(rows=0, cols=ncols, style='Table Grid')
    except Exception:
        table = doc.add_table(rows=0, cols=ncols)
        
    if sample_tblPr is not None:
        _apply_sample_table_format(doc, table, sample_tblPr)
    table.autofit = False
    table.alignment = WD_TABLE_ALIGNMENT.CENTER

    title = block.get("title")
    if isinstance(title, str) and title:
        _merge_row(table, title, fill=TITLE_FILL, bold=True, color=TITLE_TEXT_COLOR, repeat_header=True)
    elif isinstance(title, list) and title:
        trow = table.add_row()
        _set_repeat_table_header(trow)
        if len(title) == 3 and ncols == 5:
            _cell_text(trow.cells[0], title[0], bold=True, color=TITLE_TEXT_COLOR)
            _set_cell_bg(trow.cells[0], TITLE_FILL)
            
            c1 = trow.cells[1].merge(trow.cells[2])
            _cell_text(c1, title[1], bold=True, color=TITLE_TEXT_COLOR)
            _set_cell_bg(c1, TITLE_FILL)
            
            c3 = trow.cells[3].merge(trow.cells[4])
            _cell_text(c3, title[2], bold=True, color=TITLE_TEXT_COLOR)
            _set_cell_bg(c3, TITLE_FILL)
        elif len(title) == 3 and ncols == 2:
            _cell_text(trow.cells[0], title[0], bold=True, color=TITLE_TEXT_COLOR)
            _set_cell_bg(trow.cells[0], TITLE_FILL)
            
            _cell_text(trow.cells[1], f"{title[1]} | {title[2]}", bold=True, color=TITLE_TEXT_COLOR)
            _set_cell_bg(trow.cells[1], TITLE_FILL)
        else:
            vals = (title + [""] * ncols)[:ncols]
            for cell, val in zip(trow.cells, vals):
                _cell_text(cell, val, bold=True, color="000000")
                _set_cell_bg(cell, "DDEBF7")

    if "header" in block:
        trow = table.add_row()
        _set_repeat_table_header(trow)
        hdr_cells = trow.cells
        for i, text in enumerate(block["header"]):
            _cell_text(hdr_cells[i], text, bold=True, color="000000")
            _set_cell_bg(hdr_cells[i], "DDEBF7")

    for r in rows:
        cells = table.add_row().cells
        for cell, val in zip(cells, r):
            _cell_text(cell, val)

    widths = block.get("widths")
    if widths:
        for col, w in zip(table.columns, widths):
            for cell in col.cells:
                cell.width = Inches(w)
    doc.add_paragraph()  # spacing after table

BLOCK_RENDERERS = {
    "h1": lambda doc, b, s: add_heading(doc, b["text"], 1, s),
    "h2": lambda doc, b, s: add_heading(doc, b["text"], 2, s),
    "h3": lambda doc, b, s: add_heading(doc, b["text"], 3, s),
    "h4": lambda doc, b, s: add_heading(doc, b["text"], 4, s),
    "p":  lambda doc, b, s: add_paragraph(doc, b["text"], b.get("bold", False), b.get("italic", False)),
    "bullets": lambda doc, b, s: add_bullets(doc, b["items"]),
    "table":   lambda doc, b, s: add_table(doc, b, s),
    "image":   lambda doc, b, s: add_image(doc, b["path"], b.get("width_in"), b.get("caption")),
    "code":    lambda doc, b, s: add_code(doc, b["text"]),
    "class_info": lambda doc, b, s: add_class_info(doc, b.get("c_name", ""), b.get("desc", ""), b.get("rows", []), s),
    "spacer":  lambda doc, b, s: doc.add_paragraph(),
}

def _heading_number(counters, level):
    idx = max(0, min(level - 1, len(counters) - 1))
    counters[idx] += 1
    for reset_idx in range(idx + 1, len(counters)):
        counters[reset_idx] = 0
    return ".".join(str(n) for n in counters[:idx + 1] if n)

def render_body(doc, body, sample_tblPr):
    heading_counters = [0, 0, 0, 0]
    for block in body:
        t = block.get("type")
        if t in {"h1", "h2", "h3", "h4"}:
            level = int(t[1])
            numbered = dict(block)
            numbered["text"] = f"{_heading_number(heading_counters, level)} {block['text']}"
            block = numbered
        fn = BLOCK_RENDERERS.get(t)
        if fn is None:
            add_paragraph(doc, f"[unknown block type: {t}]", italic=True)
        else:
            fn(doc, block, sample_tblPr)


# ----------------------------------------------------------------------------
# TOC auto-update on open
# ----------------------------------------------------------------------------
def force_toc_update(doc):
    el = doc.settings.element
    upd = el.find(qn("w:updateFields"))
    if upd is None:
        upd = OxmlElement("w:updateFields")
        # updateFields must appear before defaultTabStop / drawing-grid elements
        # in the CT_Settings schema order; insert before the first such anchor.
        anchor = None
        for name in ("w:hdrShapeDefaults", "w:footnotePr", "w:endnotePr",
                     "w:compat", "w:rsids"):
            anchor = el.find(qn(name))
            if anchor is not None:
                break
        if anchor is not None:
            anchor.addprevious(upd)
        else:
            el.insert(0, upd)
    upd.set(qn("w:val"), "true")

# ----------------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------------
def build(spec, out_path, template_path):
    doc = Document(template_path)

    # Extract sample_tblPr
    sample_tblPr = None
    for t in doc.tables:
        if not t.rows:
            continue
        first_cell_text = (t.rows[0].cells[0].text or "").strip().lower()
        if first_cell_text == "no.":
            sample_tblPr = copy.deepcopy(t._tbl.tblPr)
            break

    # Clear sample content starting from the first "Tạo Project" or specific heading
    from docx.oxml.ns import qn
    start_el = None
    for p in doc.paragraphs:
        if "Tạo Project trên Azure" in p.text:
            start_el = p._element
            break

    if start_el is not None:
        body_el = doc.element.body
        found = False
        to_delete = []
        for el in body_el:
            if el == start_el:
                found = True
            if found and el.tag in (qn('w:p'), qn('w:tbl')):
                to_delete.append(el)
        for el in to_delete:
            el.getparent().remove(el)

    cover = spec.get("cover", {})
    mapping = {
        "«CLIENT_NAME»":     cover.get("client_name", ""),
        "«PROJECT_NAME»":    cover.get("project_name", ""),
        "«VERSION»":         str(cover.get("version", "")),
        "«CONTENT_SUMMARY»": cover.get("content_summary", ""),
        "«PREPARED_BY»":     cover.get("prepared_by", ""),
    }
    _replace_everywhere(doc, mapping)
    fill_revisions(doc, spec.get("revisions", []))
    render_body(doc, spec.get("body", []), sample_tblPr)
    force_toc_update(doc)

    doc.save(out_path)
    print(f"Wrote {out_path}")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("spec")
    ap.add_argument("output")
    here = os.path.dirname(os.path.abspath(__file__))
    default_tpl = os.path.join(here, "..", "assets", "TDD_template.docx")
    ap.add_argument("--template", default=default_tpl)
    args = ap.parse_args()
    with open(args.spec, encoding="utf-8") as f:
        spec = json.load(f)
    build(spec, args.output, args.template)

if __name__ == "__main__":
    main()
