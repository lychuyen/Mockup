---
name: export-drawio
description: "Pipeline draw.io đầy đủ: (1) Mermaid → .drawio XML (gen), (2) .drawio → PNG/SVG (export, cần draw.io CLI), (3) verify 5 lớp chất lượng. Dùng khi người dùng muốn: 'xuất drawio', 'export drawio', 'chuyển drawio sang png', 'gen drawio', 'mermaid sang drawio', 'drawio to png', 'verify drawio', 'kiểm tra chất lượng drawio'."
metadata:
  version: "1.0.0"
---

# Skill: export-drawio — Pipeline draw.io

Ba bước trong một skill, dùng độc lập hoặc kết hợp:

| Bước | Script | Đầu vào | Đầu ra |
|---|---|---|---|
| **1. Gen** | `mermaid-to-drawio.py` | file `.md` có Mermaid blocks | file `.drawio` (1 page/block) |
| **2. Export** | `export-drawio-png.ps1` | file/thư mục `.drawio` | PNG (1 file/page) |
| **3. Verify** | `verify-drawio.py` | file `.drawio` | báo cáo pass/fail 5 lớp |

## Khi nào dùng bước nào

- **Chỉ bước 1** — có Mermaid trong `.md`, cần file `.drawio` để BA chỉnh tay trên draw.io desktop.
- **Chỉ bước 2** — đã có `.drawio` (hand-authored), cần PNG để chèn vào Word/Slide.
- **Chỉ bước 3** — trước khi commit `.drawio`, kiểm tra 5 lớp chất lượng.
- **Bước 1+2** — workflow tự động: Mermaid → drawio → PNG (nhanh, chất lượng thấp hơn hand-author).
- **Bước 1+3** — sinh drawio rồi verify trước khi giao BA chỉnh.

## Bước 1 — Gen: Mermaid → draw.io

```
python .claude/skills/export-drawio/scripts/mermaid-to-drawio.py "<file.md>" ["<out.drawio>"]
```

- Mỗi Mermaid block → 1 page trong `.drawio`.
- Hỗ trợ: `flowchart`, `stateDiagram-v2`, `sequenceDiagram`.
- Chất lượng layout: layered (flowchart/state), lifeline (sequence).
- Sau khi gen: BA Lead mở draw.io desktop chỉnh thủ công để đạt chất lượng trình bày.

## Bước 2 — Export: draw.io → PNG

```powershell
# Export 1 file, tất cả pages
.claude/skills/export-drawio/scripts/export-drawio-png.ps1 -Source "file.drawio"

# Export toàn bộ thư mục
.claude/skills/export-drawio/scripts/export-drawio-png.ps1 -Source "ba/sync/models/quy-trinh-tobe" -Pattern "*.drawio"

# Export chỉ page cụ thể (index 0-based)
.claude/skills/export-drawio/scripts/export-drawio-png.ps1 -Source "file.drawio" -PageIndex 0
```

Yêu cầu: draw.io desktop cài sẵn (`winget install --id JGraph.drawio -e`).
Script tự tìm exe, báo hướng dẫn cài nếu chưa có.

Quy ước tên PNG ra: `<stem>-<PAGE_NAME>.png` (dùng tên page trong drawio).
Nếu page không có tên: `<stem>-p<index>.png`.

## Bước 3 — Verify: 5 lớp chất lượng

```
python .claude/skills/export-drawio/scripts/verify-drawio.py "<file.drawio>"
```

| Lớp | Kiểm tra |
|---|---|
| V1 | Đủ node/edge — đếm khớp tổng từ XML |
| V2 | Mọi edge dùng `edgeStyle=orthogonalEdgeStyle` |
| V3 | Không edge "tự do" — mọi cạnh có `source`/`target` id |
| V4 | Cạnh vào hình thoi chỉ nối vào 4 chóp `(0.5,0)/(0.5,1)/(0,0.5)/(1,0.5)` |
| V5 | Mọi edge có `jumpStyle=arc;jumpSize=6` |

Exit code 0 = PASS. Exit code 1 = có lỗi (kèm danh sách).

## Quy ước lưu file

- Script gen/verify chạy từ project root (`D:\TOSS`).
- PNG output mặc định: cùng thư mục với `.drawio` nguồn.
- Tên PNG dùng tên page trong drawio (không dùng index số).

## Nguyên tắc chất lượng & phương pháp dựng (chốt BA Lead 2026-06-25)

Áp dụng khi dựng `.drawio` cho mô hình quy trình/tích hợp chính thức (không chỉ draft nhanh).

### A. Song song Mermaid + draw.io — Mermaid TRƯỚC, draw.io suy ra SAU
- Mọi sơ đồ (ERD/sequence/flowchart/tích hợp) tạo **CẢ hai bản**: Mermaid nhúng trong `.md` (agent "nhìn" — nguồn chuẩn, phải hoàn chỉnh trước) + `.drawio` cùng tên (human "nhìn" — trình bày/họp, luôn suy ra SAU khi Mermaid đã chốt, không đảo ngược thứ tự).
- Mermaid dùng `<br/>` (KHÔNG `\n`) cho xuống dòng trong nhãn — render đúng trên GitHub.
- Trỏ chéo `.drawio` trong `.md` (đầu mục sơ đồ) + cập nhật INDEX.md + BA-VERSION-LOG.md của thư mục chứa.
- Validate `.drawio` well-formed (`python -c "import xml.dom.minidom; xml.dom.minidom.parse('<file>')"`) trước khi commit.

### B. Hand-author qua agent cho mô hình chính thức — KHÔNG converter sinh loạt
- Bước 1 (Gen, `mermaid-to-drawio.py`) parse + auto-layout chất lượng kém cho mô hình phức tạp: subgraph phantom, sequence floating, khó kiểm thị giác. Dùng Gen cho draft nhanh hoặc khung sườn ban đầu; với mô hình cần trình bày chính thức (giao khách/họp), giao agent modeling (`process-modeler`/`data-modeler`) **tự đặt tọa độ/nối cạnh** cẩn thận từ khung Gen.
- **1 agent / 1 file** — không dựng nhiều file `.drawio` cùng lúc trong một lần giao việc (tập trung chất lượng, tránh loãng).

### C. Pattern luồng — gom Decision thành chuỗi polling
- Một bước (Rectangle) **không rẽ thẳng ra nhiều Decision song song** (nhiều mũi tên không nhãn từ 1 box → mơ hồ khi đọc).
- Gom lại: bước chỉ ra **1 decision**; mỗi decision nhánh "không/chưa" chảy tiếp sang decision kế tiếp (chuỗi polling); nhánh "có" xử lý xong rồi back-loop về bước ban đầu.

### D. 5 lớp verify — bắt buộc trước khi giao bản chính thức
Chạy `verify-drawio.py` (Bước 3) trước khi trình/commit — bắt lỗi không cần render:

| Lớp | Kiểm tra |
|---|---|
| V1 | Đủ node/cạnh khớp Mermaid nguồn |
| V2 | Mọi cạnh `edgeStyle=orthogonalEdgeStyle` (H/V tự nắn, không waypoint tùy ý trong box) |
| V3 | 0 cạnh "tự do" — mọi edge nối bằng `source`/`target` id (KHÔNG mxPoint tọa độ tự do); sequence diagram: lifeline là vertex thanh-dọc, message nối id vào lifeline |
| V4 | Cạnh vào hình thoi (Decision) chỉ nối vào 4 chóp `(0.5,0)/(0.5,1)/(0,0.5)/(1,0.5)` — phân số khác rơi vào góc trống ngoài hình thoi → lệch |
| V5 | Mọi edge có `jumpStyle=arc;jumpSize=6` (line-jump cung khi cắt nhau) |

**Why:** Human "nhìn" draw.io để trình bày/họp — phải sạch thị giác; các lỗi A-D chỉ thấy khi render nên cần rule + script tự bắt trước khi giao, không dựa vào mắt thường.
