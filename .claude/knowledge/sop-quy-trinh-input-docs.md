---
title: "SOP — Quy trình xử lý Tài liệu Đầu vào (Input Docs Intake)"
version: "1.0"
date: "2026-07-02"
status: "Framework — dùng chung mọi dự án"
scope: "Chuẩn hóa cách tiếp nhận → trích xuất → lập chỉ mục → theo dõi tài liệu đầu vào"
---

# SOP — Quy trình xử lý Tài liệu Đầu vào

> **Framework dùng chung** (mọi dự án BA). Gom quy trình vốn rải rác ở CLAUDE.md §8 + skill `crawl-pdf` + `check-input-timeline.ps1` + convention `01-nguon` thành một tài liệu mạch lạc. Template khởi tạo: [`templates/input-docs/`](../templates/input-docs/). Nguyên tắc nền: agent **phân rã + tái hiện trung thực**, không suy diễn (§0).

## 0. Hai loại thư mục đầu vào — hai quy tắc khác nhau

| Thư mục | Chủ sở hữu | Quy tắc |
|---|---|---|
| `ba/workspace/input/Customer_docs/` | Khách hàng cung cấp | **Agent tự đọc + rã MD** (mục §1 dưới) |
| `ba/workspace/input/domain-knowledge/` | Human + Agent song song | Human thêm tham chiếu bất kỳ lúc nào; agent làm giàu glossary/phân tích; **không tự extract toàn bộ** PDF lớn (dùng chọn lọc); xung đột → BA Lead quyết (mục §2) |

## 1. Customer_docs → Agent tự rã (BẮT BUỘC khi có file mới/đổi)

**Loại trừ:** bulk binary (gói zip dữ liệu thô), bộ cài phần mềm, và file đã có `.extracted.md` không đổi.

**5 bước:**

1. **Extract** → `ba/workspace/drafts/phan-tich/01-nguon/<tên-file>.extracted.md`
   - DOCX/PPTX/XLSX: `python -m markitdown <file>` (lỗi encoding → `python-docx` trực tiếp; Google Sheet live → `gsheet-to-md.py`/`gdrive-to-md.py` với ID).
   - PDF (giữ cấu trúc): `python .claude/skills/crawl-pdf/scripts/pdf-to-md.py "<file>" "<out-dir>"` (pymupdf4llm). Text thô/tốc độ → fallback `pdftotext -layout`.
   - **Bản trích > ~800 dòng** → phân rã section cấp 1: `split-md-by-section.py "<file.md>" --outdir <ten>_parts --delete-original` → `<ten>_parts/sec-NN-*.md` + `INDEX.md` (tra theo section, không nạp cả file — token economy §0.5).
2. **Cập nhật `01-nguon/INDEX.md`** — thêm dòng vào **đúng nhóm** (file + số dòng/đoạn + mô tả ngắn); nếu đã phân rã thì trỏ `<ten>_parts/INDEX.md`. **+ 1 đoạn vào `01-nguon/THUYET-MINH-NGUON.md`** (nội dung cốt lõi + vai trò + phân hệ + liên kết chéo) theo "Quy tắc bổ sung nguồn".
3. **Cập nhật `Customer_docs/INDEX.md`** — điền cột "Extracted" + "Trạng thái".
4. **Cập nhật `TIMELINE-INPUT-DOCS.md`** (mục A theo ngày + mục B theo loại + bump version) → chạy `.claude/sync/check-input-timeline.ps1 -Mode Both`.
5. Entry TIMELINE không có file tương ứng → **báo BA Lead, KHÔNG tự xóa**.

## 2. domain-knowledge → Human + Agent song song

- **Human**: thêm PDF/XLSX/DOCX tham khảo miền (ICAO/IATA/tiêu chuẩn ngành/glossary…) bất kỳ lúc nào, không cần báo trước.
- **Agent**: làm giàu glossary + file phân tích miền khi phát hiện thuật ngữ/khái niệm mới; **không tự xóa** file human thêm; **không tự extract toàn bộ** PDF lớn (dùng Grep/Read chọn lọc đúng mục).
- **Xung đột** (cùng sửa 1 term/entry): BA Lead quyết bản giữ.

## 3. Ba tài liệu điều phối (mỗi dự án 1 bộ — khởi tạo từ template)

| Tài liệu | Vai trò | Template |
|---|---|---|
| `01-nguon/INDEX.md` | Bảng tra nhanh 1 dòng/file, **theo nhóm nguồn** | `INDEX-01-nguon-template.md` |
| `01-nguon/THUYET-MINH-NGUON.md` | Diễn giải nội dung + vai trò + bản đồ nguồn→phân hệ (companion của INDEX) | `THUYET-MINH-NGUON-template.md` |
| `TIMELINE-INPUT-DOCS.md` | Nhật ký tiếp nhận theo thời gian (A) + theo loại (B) | `TIMELINE-INPUT-DOCS-template.md` |

## 4. Công cụ (đã có trong framework)

- `skills/crawl-pdf/` — extract PDF/Office → md (pdf-to-md, markitdown, gsheet/gdrive-to-md, split-md-by-section).
- `sync/check-input-timeline.ps1` — đối soát TIMELINE ↔ thư mục `input/` (Scan/Check/Both); **chỉ báo cáo, không tự sửa**.

## 5. Quy tắc INDEX completeness (áp cho mọi INDEX)

Mọi thư mục có `INDEX.md` phải liệt kê **đủ** mọi file (1 dòng mô tả + version/ngày/trạng thái nếu có cột). Thêm/xóa/đổi tên/bump version → cập nhật INDEX **cùng task**. File vắng khỏi INDEX = coi như chưa map / không tra được.
