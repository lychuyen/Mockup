---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Khung — Tracking Index toàn dự án"
---

# SRS-TOSS-001 — Khung theo dõi SRS toàn dự án

> Văn kiện cha, không thuộc module nào — cùng vai trò với [`BRD-TOSS-001-khung-v0.12.md`](BRD-TOSS-001-khung-v0.12.md) nhưng cho SRS. Mục đích: **một điểm nhìn duy nhất** để biết module nào đã có SRS, phủ bao nhiêu % chức năng theo Function-list, và chỗ nào cần bổ sung — không cần mở từng `CATALOG.md`.

## 1. Nguồn đối chiếu

- **Function-list** (nguồn W.B.S đầy đủ 12 module): [Google Sheet](https://docs.google.com/spreadsheets/d/15icZM004vwMt0YvUbrLpj-2Z40T0QXsE/edit?gid=1588738845#gid=1588738845) → bản trích `ba/workspace/drafts/phan-tich/01-nguon/VNA-TOSS-Function-list-v1.0.extracted.md`.
- **SRS thật đã publish**: `ba/sync/<module>/srs/` — mỗi module có `CATALOG.md` (module đã phân rã) hoặc 1 file `TOSS.<module>.ALL.FD.v<x>.md` (module chưa phân rã).
- **Cơ chế đối chiếu tự động**: `.claude/skills/crawl-pdf/scripts/check-function-list-vs-sync.py` — xem [`quan-ly-yeu-cau/README.md`](quan-ly-yeu-cau/README.md). Bảng dưới lấy số liệu từ lần chạy gần nhất; **chạy lại script để có số mới nhất**, đừng chỉ tin bảng này nếu đã lâu chưa chạy.

## 2. Bảng theo dõi 12 module (cập nhật lần cuối: 2026-07-10, báo cáo [`FUNCTION-LIST-RECONCILE-2026-07-10.md`](quan-ly-yeu-cau/FUNCTION-LIST-RECONCILE-2026-07-10.md))

| # | Module | Mã | Function-list | SRS đã có | Phủ (%) | Chưa rà (cần xác nhận) | Trạng thái |
|---|---|---|---|---|---|---|---|
| 1 | Live Operations | `LO` | 0 | 0 | — | 0 | Function-list chưa có dòng nào; SRS **hiện trống**, chờ VNA/VTIT soạn |
| 2 | Flight Dispatch | `FD` | 15 | 8 | 53% | 7 | Có SRS (8 chức năng), **7 dòng Function-list chưa khớp** — cần rà (vd DSP Release OFP, Customize bảng) |
| 3 | Flight Load Control | `FLC` | 10 | 10 | 100%* | 2 | Có SRS đủ 10 chức năng theo đếm CATALOG, nhưng **2 dòng "Lọc trên danh sách" ở 2 nhóm khác nhau** chưa khớp rõ — cần rà tên |
| 4 | Station Manager | `SM` | 0 | — | — | 0 | Chưa có dòng nào trong Function-list, chưa có thư mục `sync/` |
| 5 | Report | `RPT` | 38 | 0 | 0% | 38 | **Chưa có SRS nào** — toàn bộ 38 chức năng Report cần soạn SRS |
| 6 | Data Maintenance | `DM` | 13 | 69 | — | 3 | SRS đã rất đầy đủ (69 chức năng chi tiết, vượt xa 13 dòng nhóm trong Function-list) — 3 dòng lọc/filter lẻ cần rà xem đã có trong 1 trong 69 file chưa |
| 7 | Data Source Monitoring | `DSM` | 0 | — | — | 0 | Chưa có dòng nào trong Function-list, chưa có thư mục `sync/` |
| 8 | System Admin | `SA` | 26 | 30 | — | 2 | SRS đầy đủ (30 chức năng), 2 dòng tham số ZFW/cảnh báo OFP cần rà (có thể thuộc Data Maintenance thay vì System Admin) |
| 9 | Mail cảnh báo | `MCB` | 0 | — | — | 0 | Chưa có dòng nào trong Function-list, chưa có SRS |
| 10 | Job đồng bộ | `JDB` | 0 | — | — | 0 | Chưa có dòng nào trong Function-list, chưa có SRS |
| 11 | Authentication | `AUTH` | 6 | 0 | 0% | 6 | **Chưa có SRS nào** — 6 chức năng (Login, Home, Logout, Thông tin user, Đổi pass, Dark mode) cần soạn SRS |
| 12 | Home | `HOME` | 4 | — | — | 4 | Nội dung nằm trong `common/srs/` (Thiết kế dùng chung) — 4 dòng "chọn phân hệ" trong Function-list chưa đối chiếu vào đó |

*\* "Phủ %" chỉ mang tính tham khảo khi 2 nguồn đếm ở granularity khác nhau (Function-list đếm theo nhóm Lv1/Lv2, CATALOG.md đếm theo Feature chi tiết) — con số quan trọng hơn là cột "Chưa rà".*

**Tổng cần rà tay hiện tại: 62 dòng** (chi tiết từng dòng xem báo cáo đối chiếu).

## 3. Ưu tiên đề xuất (BA Lead quyết định thứ tự thật)

1. **Report (38) và Authentication (6)** — hai module hoàn toàn chưa có SRS, ưu tiên cao vì chặn cả module chứ không phải vài chức năng lẻ.
2. **Flight Dispatch (7 dòng)** — đã có SRS nhưng thiếu khá nhiều so với Function-list, cần rà xem là chức năng mới hay đã có nhưng đặt tên khác.
3. **Data Maintenance / System Admin / Flight Load Control (3/2/2 dòng)** — số lượng nhỏ, khả năng cao chỉ là lệch tên gọi (vd "Lọc trên danh sách" đã nằm trong 1 file chức năng lớn hơn) — rà nhanh.
4. **Station Manager / Data Source Monitoring / Mail cảnh báo / Job đồng bộ** — Function-list chưa có nội dung, chưa cần hành động.

## 4. Liên kết

- Điểm vào gốc `ba/sync/`: [`README.md`](README.md)
- Khung BRD tương ứng: [`BRD-TOSS-001-khung-v0.12.md`](BRD-TOSS-001-khung-v0.12.md)
- Cơ chế + lịch sử đối chiếu: [`quan-ly-yeu-cau/README.md`](quan-ly-yeu-cau/README.md)

---

*v0.1 — 2026-07-10: tạo mới theo yêu cầu BA Lead — điểm nhìn tracking SRS toàn dự án, đối chiếu từ báo cáo Function-list ↔ sync/ lần đầu.*
