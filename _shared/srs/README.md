---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Ghi chú dùng chung — SRS toàn dự án"
status: "Active"
date: "2026-07-10"
---

# Ghi chú dùng chung cho SRS mọi module (`_shared/srs/`)

Ghi chú cross-cutting áp dụng cho SRS ở **mọi module** dưới `ba/sync/<module>/srs/` — không lặp lại ở từng module.

> **Quy tắc phạm vi (BA Lead quyết định 2026-07-09 — MANDATORY):** SRS trong dự án này do **BA human soạn trực tiếp**, không phải agent. Agent `srs-writer` đã bị xóa; `business-analyst` không còn nhận yêu cầu "viết SRS". Agent được phép **đọc/đối chiếu** SRS đã có (cho `gen-mockup`, BRD gap-analysis…), **không được tạo mới/mở rộng nội dung SRS**. Xem CLAUDE.md §5 "SRS do con người".
>
> **Trạng thái tài liệu:** các SRS dưới `ba/sync/<module>/srs/` có `status: Draft` trong frontmatter nguồn — đưa vào `sync/` để chia sẻ chung/bàn giao, KHÔNG đồng nghĩa đã "Approved". Đổi status là quyền BA Lead.

## SRS hiện có theo module (2026-07-10)

| Module | Tên file | Nguồn | Loại |
|---|---|---|---|
| `DM-data-maintenance/srs/` | `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` (giữ tên gốc khách hàng) | biểu mẫu VTIT | Word tĩnh — 69 chức năng, từ điển 109 trường |
| `SA-system-admin/srs/` | `VNA.TOSS_SRS_System Admin_V0.1.docx` (giữ tên gốc khách hàng) | biểu mẫu VTIT | Word tĩnh — 30 chức năng, từ điển 49 trường |
| `FD-flight-dispatch/srs/` | `TOSS.FD.ALL.FD.v0.1.md` | Google Doc live (ttphuong060403) | Live — 8 chức năng |
| `FLC-flight-load-control/srs/` | `TOSS.FLC.ALL.FD.v0.1.md` | Google Doc live (lyphat676) | Live — 10 chức năng |
| `_shared/srs/` (đây) | `TOSS.HOME.ALL.FD.v0.1.md` | Google Doc live "Thiết kế dùng chung" (vietanh3796) | Live, cross-cutting — không thuộc module Function-list nào |
| `LO-live-operations/srs/` | `TOSS.LO.ALL.FD.v0.1.md` | Google Doc live (hiepdv0695) | Live, **hiện trống** — chờ VNA/VTIT soạn |

Quy tắc đặt tên: `MADUAN.TenVietTatPhanHe.VietTatChucNang.LoaiTaiLieu.version.md` — xem [`../../README.md`](../../README.md) §"Quy ước đặt tên tài liệu". File `.docx` gốc khách hàng KHÔNG đổi tên.

**6 module còn lại của Function-list chưa có SRS:** Station Manager, Report, Data Source Monitoring, Mail cảnh báo, Job đồng bộ, Authentication *(Home = nội dung đã nằm trong `_shared/srs/`, không tính riêng)*. Xem đủ 12 module tại [`../../README.md`](../../README.md) (root).

## Ghi chú mã hiệu

Các file `.docx` mang mã hiệu `VNA.FIMS` (`VNA.FIMS_SRS_..._v1.0`, phạm vi ghi "Hệ thống FIMS Phase 1"). **FIMS = TOSS** — cùng một hệ thống (BA Lead xác nhận 2026-07-02), KHÔNG phải lệch nguồn.

⚠️ **Phát hiện cần BA Lead xác nhận (2026-07-10):** SRS Flight Load Control (bảng thuật ngữ, sec-03) định nghĩa **FIMS = "OPERATION DATA LAKE/PLATFORM"** — khác cách hiểu "FIMS = TOSS" đã chốt. Giữ nguyên văn nguồn, chưa tự diễn giải quan hệ giữa 2 cách dùng — xem `../../FLC-flight-load-control/srs/_parts/CATALOG.md` §3.6.

## Nguồn refresh (SRS live)

4 module Google Doc refresh qua `gdrive-to-md.py` (xem `ba/workspace/drafts/phan-tich/01-nguon/INDEX.md` §1 để lấy đúng file ID). Sau mỗi lần refresh: chạy lại `split-md-by-section.py` để `_parts/` không lệch nội dung (không dùng `--delete-original` — nguồn live cần giữ bản gốc làm đích ghi lần refresh sau).

## Phân rã BRD → FUNC do agent (đã đóng băng)

**Không nằm ở đây** — vẫn ở `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/` (không promote sang `sync/`: nội dung đã đóng băng 2026-07-09, chỉ giữ tham khảo lịch sử, không phải tài liệu chia sẻ chủ động).

---

*v0.1 — 2026-07-10: dựng lại tại `_shared/srs/` sau khi tái cấu trúc `ba/sync/` theo Option C (1 thư mục/module kỹ thuật). Nội dung kế thừa từ `sync/requirements/srs/README.md` (Option B, xóa).*
