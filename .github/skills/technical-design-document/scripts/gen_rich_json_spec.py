import os
import json
import argparse
import xml.etree.ElementTree as ET
from datetime import datetime

parser = argparse.ArgumentParser(description='Generate Rich JSON spec from D365FO Metadata')
parser.add_argument('--input', required=True, help='Path to project input JSON file containing categories')
parser.add_argument('--metadata', required=True, help='Path to D365FO Metadata directory (e.g., .../Metadata/NWVEI/NWVEI)')
parser.add_argument('--output', required=True, help='Path to output directory for JSON files')
parser.add_argument('--client', default='NaviWorld Client', help='Client name for the cover page')
parser.add_argument('--project', default='D365FO Implementation', help='Project name for the cover page')
parser.add_argument('--author', default='Consultant', help='Author name')
args = parser.parse_args()

metadata_dir = args.metadata
output_dir = args.output

with open(args.input, 'r', encoding='utf-8') as f:
    categories = json.load(f)

def parse_table(file_path):
    try:
        tree = ET.parse(file_path)
        root = tree.getroot()
        fields = []
        for field in root.findall('.//AxTableField'):
            name = field.findtext('Name', '')
            label = field.findtext('Label', '')
            edt = field.findtext('ExtendedDataType', '')
            enum = field.findtext('EnumType', '')
            type_val = edt if edt else enum
            mandatory = field.findtext('Mandatory', 'No')
            allow_edit = field.findtext('AllowEdit', 'Yes')
            fields.append([name, label, type_val, mandatory, allow_edit])
        return fields
    except Exception as e:
        return []

def parse_class(file_path):
    try:
        tree = ET.parse(file_path)
        root = tree.getroot()
        methods = []
        for method in root.findall('.//Method'):
            name = method.findtext('Name', '')
            source = method.findtext('Source', '')
            desc = ""
            if source:
                import re
                match = re.search(r'///\s*<summary>\s*(.*?)\s*///\s*</summary>', source, re.DOTALL)
                if match:
                    desc = match.group(1).strip()
                    desc = re.sub(r'///\s*', '', desc).strip()
            
            if not desc:
                n_lower = name.lower()
                if "init" in n_lower: desc = f"Khởi tạo giá trị ban đầu cho class."
                elif "validate" in n_lower: desc = f"Kiểm tra tính hợp lệ của dữ liệu đầu vào."
                elif "insert" in n_lower: desc = f"Thêm mới bản ghi vào CSDL."
                elif "update" in n_lower: desc = f"Cập nhật bản ghi trong CSDL."
                elif "delete" in n_lower: desc = f"Xóa bản ghi khỏi CSDL."
                elif "main" in n_lower: desc = f"Điểm bắt đầu (entry point) để chạy lớp xử lý."
                elif "parm" in n_lower: desc = f"Hàm Getter/Setter để truy xuất hoặc gán tham số."
                elif "run" in n_lower: desc = f"Thực thi luồng logic chính."
                elif "dialog" in n_lower: desc = f"Hiển thị giao diện người dùng để nhập tham số."
                elif "construct" in n_lower: desc = f"Hàm khởi tạo (Factory method) để tạo mới đối tượng."
                elif "event" in n_lower: desc = f"Bắt sự kiện (Event Handler) để thực hiện logic mở rộng."
                elif "post" in n_lower: desc = f"Thực hiện xử lý sau khi hoàn tất tác vụ."
                elif "pre" in n_lower: desc = f"Thực hiện xử lý trước khi bắt đầu tác vụ."
                else: desc = f"Hàm chức năng phục vụ xử lý logic cho {name}."

            methods.append((name, desc))
        return methods
    except Exception as e:
        return []

def resolve_file(name):
    table_path = os.path.join(metadata_dir, "AxTable", name + ".xml")
    if os.path.exists(table_path):
        return ("table", table_path)
    class_path = os.path.join(metadata_dir, "AxClass", name + ".xml")
    if os.path.exists(class_path):
        return ("class", class_path)
    for root, dirs, files in os.walk(metadata_dir):
        if name + ".xml" in files:
            obj_type = "table" if "Table" in root else "class"
            return (obj_type, os.path.join(root, name + ".xml"))
    return None, None

def create_json_spec(cat_id, cat_info):
    spec = {
        "cover": {
            "client_name": "NaviWorld Project",
            "project_name": "Phân hệ Hóa đơn điện tử (E-Invoice Integration)",
            "version": "1.0",
            "content_summary": cat_info["title"],
            "prepared_by": "Khiem Cao"
        },
        "revisions": [
            {"version": "1.0", "date": datetime.now().strftime("%d/%m/%Y"), "author": "Khiem Cao", "description": "Khởi tạo thiết kế kỹ thuật (Technical Design Document)"}
        ],
        "body": []
    }
    
    # 1. Yêu cầu nghiệp vụ
    spec["body"].append({"type": "h1", "text": "1. Yêu Cầu Nghiệp Vụ"})
    spec["body"].append({"type": "h2", "text": "1.1. Mô tả bài toán"})
    spec["body"].append({"type": "p", "text": cat_info["mo_ta_bai_toan"], "bold": False, "italic": False})
    
    spec["body"].append({"type": "h2", "text": "1.2. Khoảng trống hệ thống (Gap Analysis)"})
    spec["body"].append({"type": "p", "text": cat_info["khoang_trong"], "bold": False, "italic": False})
    
    spec["body"].append({"type": "h2", "text": "1.3. Quy tắc nghiệp vụ (Business Logic & Validation)"})
    spec["body"].append({"type": "p", "text": cat_info["quy_tac"], "bold": False, "italic": False})
    
    # 2. Thiết Kế Kỹ Thuật
    spec["body"].append({"type": "h1", "text": "2. Thiết Kế Kỹ Thuật"})
    spec["body"].append({"type": "p", "text": "Phần này trình bày cấu trúc dữ liệu và các thành phần xử lý kỹ thuật cho phân hệ.", "bold": False, "italic": False})
    
    # Tables
    spec["body"].append({"type": "h2", "text": "2.1. Cấu trúc Dữ liệu (Tables)"})
    has_tables = False
    for t_name in cat_info.get("tables", []):
        obj_type, path = resolve_file(t_name)
        if obj_type == "table":
            fields = parse_table(path)
            if fields:
                has_tables = True
                spec["body"].append({
                    "type": "table",
                    "title": ["Table name", t_name, "New/Modify"],
                    "header": ["Field name", "Label", "Extended Data Type/Base Enum", "Mandatory (Y/N)", "Allow edit (Y/N)"],
                    "widths": [1.2, 1.2, 1.5, 0.8, 0.8],
                    "rows": fields
                })
    if not has_tables:
        spec["body"].append({"type": "p", "text": "[Chưa có bảng dữ liệu tạo mới/sửa đổi cho chức năng này]", "italic": True})
                
    # Classes
    spec["body"].append({"type": "h2", "text": "2.2. Cấu trúc Lớp (Classes)"})
    has_classes = False
    for c_name in cat_info.get("classes", []):
        obj_type, path = resolve_file(c_name)
        if obj_type == "class" or obj_type == "table":
            methods = parse_class(path)
            if methods:
                has_classes = True
                rows = [[m[0] + "()", m[1], "Modify"] for m in methods]
                spec["body"].append({
                    "type": "class_info",
                    "c_name": c_name,
                    "desc": f"Xử lý nghiệp vụ logic cho đối tượng {c_name}.",
                    "rows": rows
                })
    if not has_classes:
        spec["body"].append({"type": "p", "text": "[Chưa có class tạo mới/sửa đổi cho chức năng này]", "italic": True})

    spec["body"].append({"type": "h2", "text": "2.3. Truy vấn dữ liệu (Queries / Views)"})
    spec["body"].append({"type": "p", "text": cat_info["truy_van"], "bold": False, "italic": False})
    
    spec["body"].append({"type": "h2", "text": "2.4. Giao diện người dùng (Forms / UX)"})
    spec["body"].append({"type": "p", "text": cat_info["giao_dien"], "bold": False, "italic": False})
    
    spec["body"].append({"type": "h2", "text": "2.5. Điều hướng (Menu & Security)"})
    spec["body"].append({"type": "p", "text": cat_info["dieu_huong"], "bold": False, "italic": False})

    # 3. Vấn đề lưu ý
    spec["body"].append({"type": "h1", "text": "3. Vấn Đề Lưu Ý & Đề Xuất Cải Tiến"})
    
    spec["body"].append({"type": "h2", "text": "3.1. Hiệu năng (Performance)"})
    spec["body"].append({"type": "p", "text": cat_info["hieu_nang"], "bold": False, "italic": False})
    
    spec["body"].append({"type": "h2", "text": "3.2. Tính toàn vẹn dữ liệu"})
    spec["body"].append({"type": "p", "text": cat_info["toan_ven"], "bold": False, "italic": False})
    
    spec["body"].append({"type": "h2", "text": "3.3. Caching & Optimization"})
    spec["body"].append({"type": "p", "text": cat_info["caching"], "bold": False, "italic": False})

    out_file = os.path.join(output_dir, f"tdd_spec_{cat_id}.json")
    with open(out_file, "w", encoding="utf-8") as f:
        json.dump(spec, f, ensure_ascii=False, indent=2)
    print(f"Generated {out_file} with Rich Content")

for cat_id, cat_info in categories.items():
    create_json_spec(cat_id, cat_info)
