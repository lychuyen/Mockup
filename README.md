---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "README — ba/sync/ (tài liệu chia sẻ chung)"
version: "1.1"
date: "2026-07-10"
status: "Active"
---

# ba/sync/ — Tài liệu chia sẻ chung (BA↔BA, BA↔team khác)

Cấu trúc: **một thư mục cho mỗi module kỹ thuật** (theo Function-list — 12 module), mỗi module chứa `brd/` (yêu cầu nghiệp vụ) + `srs/` (đặc tả thiết kế). Mở một thư mục module là thấy đủ toàn bộ yêu cầu + thiết kế của module đó — không cần tra catalog trung tâm trước.

> Xem khung quyết định cấu trúc tại [`.claude/knowledge/shared-doc-structure-production-vs-madetomeasure.md`](../../.claude/knowledge/shared-doc-structure-production-vs-madetomeasure.md) (Option C — bàn giao ngoài theo module kỹ thuật).

## Quy ước đặt tên tài liệu (mã hóa)

Mỗi file BRD/SRS cấp module (không phải file điều hướng như `INDEX.md`/`CATALOG.md`/`README.md`, và không phải file `.docx` gốc khách hàng) đặt tên theo:

```
MADUAN.TenVietTatPhanHe.VietTatChucNang.LoaiTaiLieu.version.md
```

Ví dụ: `TOSS.FD.ALL.BRD.v0.8.md` = dự án **TOSS**, phân hệ **FD** (Flight Dispatch), phủ **ALL** chức năng của phân hệ (BRD cấp phase, không phải 1 chức năng đơn lẻ), loại tài liệu **BRD**, phiên bản **v0.8**. Mã chức năng chi tiết theo từng chức năng cụ thể (không phải `ALL`) được gắn ở cấp dòng trong `CATALOG.md` của mỗi module SRS.

## 12 module (theo Function-list VNA-TOSS)

| # | Module | Mã phân hệ | `brd/` | `srs/` |
|---|---|---|---|---|
| 1 | [`LO-live-operations/`](LO-live-operations/) | `LO` | pointer sang FD (BRD-TOSS-PH1) | `TOSS.LO.ALL.FD.v0.1.md` — Google Doc live, **hiện trống**, chờ VNA/VTIT soạn |
| 2 | [`FD-flight-dispatch/`](FD-flight-dispatch/) | `FD` | `TOSS.FD.ALL.BRD.v0.8.md` (sở hữu chính PH1) + pointer sang FLC (PH2) | `TOSS.FD.ALL.FD.v0.1.md` — 8 chức năng (FLIGHT PLAN + UPLOAD DOCUMENT) |
| 3 | [`FLC-flight-load-control/`](FLC-flight-load-control/) | `FLC` | `TOSS.FLC.ALL.BRD.v0.8.md` (sở hữu chính PH2) | `TOSS.FLC.ALL.FD.v0.1.md` — 10 chức năng (Document + Fuel order), 1 phần dở (sec-10), 1 trống (sec-11) |
| 4 | Station Manager | `SM` | *(chưa có)* | *(chưa có)* — chưa tạo thư mục |
| 5 | [`RPT-report/`](RPT-report/) | `RPT` | `TOSS.RPT.ALL.BRD.v0.5.md` (sở hữu chính PH3) | *(chưa có SRS)* |
| 6 | [`DM-data-maintenance/`](DM-data-maintenance/) | `DM` | `TOSS.DM.ALL.BRD.v0.6.md` (sở hữu chính PH4) | 69 file đặc tả chức năng phân rã và Catalog thiết kế (`srs/_parts/`) |
| 7 | Data Source Monitoring | `DSM` | *(chưa có)* | *(chưa có)* — chưa tạo thư mục |
| 8 | [`SA-system-admin/`](SA-system-admin/) | `SA` | `TOSS.SA.ALL.BRD.v0.6.md` (sở hữu chính PH5) | 28 file đặc tả chức năng phân rã và Catalog thiết kế (`srs/_parts/`) |

| 9 | [`MCB-mail-canh-bao/`](MCB-mail-canh-bao/) | `MCB` | pointer sang SA (BRD-TOSS-PH5) | *(chưa có SRS)* |
| 10 | [`JDB-job-dong-bo/`](JDB-job-dong-bo/) | `JDB` | pointer sang SA (BRD-TOSS-PH5) | *(chưa có SRS)* |
| 11 | [`AUTH-authentication/`](AUTH-authentication/) | `AUTH` | pointer sang SA (BRD-TOSS-PH5) | *(chưa có SRS)* |
| 12 | Home | `HOME` | — | Nội dung nằm trong `_shared/srs/TOSS.HOME.ALL.FD.v0.1.md` |

`_shared/` (cross-cutting, không thuộc module nào) dùng mã `HOME` cho nội dung Thiết kế dùng chung — không có mã phân hệ riêng vì bản chất là dùng chung.

## Thư mục dùng chung

- [`_shared/`](_shared/) — nội dung cross-cutting không thuộc riêng module nào (thiết kế dùng chung, quy tắc/ghi chú áp cho mọi module). Có cùng hình dạng `brd/`+`srs/` như module thường.
- [`BRD-TOSS-001-khung-v0.12.md`](BRD-TOSS-001-khung-v0.12.md) — khung BRD top-down toàn dự án (không thuộc module nào, là văn kiện cha của mọi BRD-TOSS-PHn).
- [`models/`](../workspace/models/) — mô hình nghiệp vụ dùng chung: BPMN/To-Be, entity map, tích hợp hệ ngoài, truy vết. Không đổi khi tái cấu trúc lần này.
- [`output/`](../workspace/output/) — bản xuất Word/PDF/PPTX cho người đọc ngoài công cụ BA (`output/human/`), đầu ra tối ưu agent (`output/agents/`, scaffold).

## Khi một yêu cầu (BRD phase) trải nhiều module

Một file BRD-TOSS-PHn thường phủ nhiều module cùng lúc. File thật chỉ đặt **một lần** dưới module là **chủ sở hữu chính** (module có tỷ trọng yêu cầu lớn nhất của phase đó); các module còn lại nhận **file pointer** một dòng (`brd/SEE-<module-so-huu>.md`) trỏ sang, tránh nhân bản/lệch bản khi cập nhật. Xem chi tiết cơ chế tại Option C trong file knowledge dẫn ở trên.

## Không nằm ở đây

- **Hồ sơ QC/audit-trail nội bộ** (review, validation, đề xuất chờ duyệt của BRD) → [`ba/workspace/drafts/quy-trinh/qc-brd/`](../workspace/drafts/quy-trinh/qc-brd/) — không lộ dấu vết QC nội bộ trong gói bàn giao module.
- **Phân rã BRD→FUNC do agent (đã đóng băng 2026-07-09)** → `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/` — tài liệu tham khảo lịch sử, không phải tài liệu chia sẻ chủ động.
- **Nhật ký kiểm soát thay đổi yêu cầu (NKLR)** — scaffold cũ (2026-06-04) chưa từng có mục nào, đã gỡ khi tái cấu trúc; tạo lại tại `ba/sync/quan-ly-yeu-cau/` khi có mục NKLR thật.

---

*v1.1 — 2026-07-10: đổi tên 9 file BRD/SRS cấp module (5 BRD + 4 SRS Google Doc live) sang quy tắc `MADUAN.TenVietTatPhanHe.VietTatChucNang.LoaiTaiLieu.version` (vd `TOSS.FD.ALL.BRD.v0.8.md`); thêm cột "Mã phân hệ" vào bảng 12 module. File `.docx` gốc khách hàng (Data Maintenance, System Admin) và file điều hướng (`INDEX.md`/`CATALOG.md`/`README.md`/`SEE-*.md`) giữ nguyên tên — chỉ áp quy tắc cho tài liệu BRD/SRS chính.*
*v1.0 — 2026-07-10: dựng mới hoàn toàn theo Option C (1 thư mục/module kỹ thuật chứa cả brd+srs), thay thế `CATALOG.md` + `requirements/{brd,srs}/` của Option B (2026-07-10, chỉ tồn tại vài giờ trước khi bị thay). Lý do đổi: gói bàn giao made-to-measure/outsource cần trình bày theo module kỹ thuật mà bên nhận (client/DEV/QC ngoài) nhận diện được, không phải theo catalog nội bộ của BA.*
