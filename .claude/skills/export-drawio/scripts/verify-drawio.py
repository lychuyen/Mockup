"""
verify-drawio.py — Kiểm tra chất lượng file .drawio (5 lớp).
Chạy TRƯỚC khi commit hoặc xuất PNG.

Usage: python verify-drawio.py "<file.drawio>" [--verbose]
Exit code: 0 = PASS, 1 = có lỗi
"""
import sys, re, xml.etree.ElementTree as ET

APEX_X = {"0", "0.5", "1"}
APEX_Y = {"0", "0.5", "1"}
VALID_APEXES = {("0.5","0"),("0.5","1"),("0","0.5"),("1","0.5")}

def parse(path):
    tree = ET.parse(path)
    root = tree.getroot()
    # mxfile > diagram > mxGraphModel > root > mxCell
    cells = []
    for diagram in root.iter("diagram"):
        for cell in diagram.iter("mxCell"):
            cells.append(cell)
    return cells

def is_edge(cell):
    return cell.get("edge") == "1"

def is_vertex(cell):
    return cell.get("vertex") == "1"

def is_diamond(cell):
    style = cell.get("style","")
    return "rhombus" in style or "shape=mxgraph" in style and "rhombus" in style.lower()

def get_style_val(style_str, key):
    """Lấy giá trị key=value trong chuỗi style."""
    m = re.search(rf'(?:^|;){re.escape(key)}=([^;]+)', style_str)
    return m.group(1) if m else None

def check_v1_count(cells):
    """V1: Đủ node/edge — có ít nhất 2 vertex và 1 edge."""
    verts = [c for c in cells if is_vertex(c) and c.get("id") not in ("0","1")]
    edges = [c for c in cells if is_edge(c)]
    issues = []
    if len(verts) < 2:
        issues.append(f"V1: Chỉ có {len(verts)} vertex (cần ≥2)")
    if len(edges) < 1:
        issues.append("V1: Không có edge nào")
    return issues, len(verts), len(edges)

def check_v2_edge_style(cells):
    """V2: Mọi edge dùng edgeStyle=orthogonalEdgeStyle."""
    issues = []
    for c in cells:
        if not is_edge(c): continue
        style = c.get("style","")
        if "edgeStyle=orthogonalEdgeStyle" not in style:
            label = c.get("value","(no label)") or c.get("id","?")
            issues.append(f"V2: Edge '{label}' thiếu edgeStyle=orthogonalEdgeStyle")
    return issues

def check_v3_no_free_edge(cells):
    """V3: Không có 'free edge' — mọi cạnh phải có source VÀ target id."""
    issues = []
    for c in cells:
        if not is_edge(c): continue
        src = c.get("source","")
        tgt = c.get("target","")
        label = c.get("value","(no label)") or c.get("id","?")
        if not src or not tgt:
            missing = []
            if not src: missing.append("source")
            if not tgt: missing.append("target")
            issues.append(f"V3: Edge '{label}' thiếu {'/'.join(missing)} (free edge)")
    return issues

def check_v4_diamond_apex(cells):
    """V4: Cạnh vào/ra hình thoi chỉ nối tại 4 chóp."""
    diamond_ids = {c.get("id") for c in cells if is_vertex(c) and is_diamond(c)}
    if not diamond_ids:
        return []
    issues = []
    for c in cells:
        if not is_edge(c): continue
        for attr, point_attr in [("source", "exitX"), ("target", "entryX")]:
            cell_id = c.get(attr,"")
            if cell_id not in diamond_ids: continue
            style = c.get("style","")
            x_key = "exitX" if attr=="source" else "entryX"
            y_key = "exitY" if attr=="source" else "entryY"
            ex = get_style_val(style, x_key)
            ey = get_style_val(style, y_key)
            if ex is None and ey is None: continue  # không có constraint → bỏ qua
            pair = (ex, ey)
            if pair not in VALID_APEXES:
                label = c.get("value","(no label)") or c.get("id","?")
                issues.append(
                    f"V4: Edge '{label}' nối hình thoi tại ({ex},{ey}) — "
                    f"chỉ cho phép (0.5,0)/(0.5,1)/(0,0.5)/(1,0.5)"
                )
    return issues

def check_v5_jump_style(cells):
    """V5: Mọi edge có jumpStyle=arc;jumpSize=6."""
    issues = []
    for c in cells:
        if not is_edge(c): continue
        style = c.get("style","")
        label = c.get("value","(no label)") or c.get("id","?")
        if "jumpStyle=arc" not in style:
            issues.append(f"V5: Edge '{label}' thiếu jumpStyle=arc")
        if "jumpSize=6" not in style:
            issues.append(f"V5: Edge '{label}' thiếu jumpSize=6")
    return issues

# ─── Main ──────────────────────────────────────────────────────────────────
if len(sys.argv) < 2:
    print("Usage: python verify-drawio.py <file.drawio> [--verbose]")
    sys.exit(1)

path    = sys.argv[1]
verbose = "--verbose" in sys.argv

try:
    cells = parse(path)
except Exception as e:
    print(f"❌  Không đọc được file: {e}")
    sys.exit(1)

all_issues = []

v1_issues, n_verts, n_edges = check_v1_count(cells)
all_issues += v1_issues
v2 = check_v2_edge_style(cells)
all_issues += v2
v3 = check_v3_no_free_edge(cells)
all_issues += v3
v4 = check_v4_diamond_apex(cells)
all_issues += v4
v5 = check_v5_jump_style(cells)
all_issues += v5

# ─── Báo cáo ───────────────────────────────────────────────────────────────
print(f"\nVerify: {path}")
print(f"  Cells: {n_verts} vertex, {n_edges} edge(s)\n")

checks = [
    ("V1", "Đủ node/edge",              v1_issues),
    ("V2", "edgeStyle=orthogonal",       v2),
    ("V3", "Không free edge",            v3),
    ("V4", "Chóp hình thoi đúng apex",   v4),
    ("V5", "jumpStyle=arc;jumpSize=6",   v5),
]

for code, name, issues in checks:
    if issues:
        print(f"  [{code}] ✗  {name}")
        if verbose:
            for i in issues:
                print(f"         · {i}")
    else:
        print(f"  [{code}] ✓  {name}")

print()
if all_issues:
    print(f"❌  FAIL — {len(all_issues)} lỗi")
    if not verbose:
        print("   (chạy với --verbose để xem chi tiết từng lỗi)")
    for issue in all_issues:
        print(f"   · {issue}")
    sys.exit(1)
else:
    print("✅  PASS — tất cả 5 lớp")
    sys.exit(0)
