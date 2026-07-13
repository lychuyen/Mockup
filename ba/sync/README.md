---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "README — ba/sync/ (tài liệu chia sẻ chung)"
version: "1.4"
date: "2026-07-13"
status: "Active"
---

# ba/sync/ — Tài liệu chia sẻ chung

Cấu trúc: **một thư mục cho mỗi module kỹ thuật** (theo Function-list — 12 module), mỗi module chứa `brd/` (yêu cầu nghiệp vụ) + `srs/` (đặc tả thiết kế). Mở một thư mục module là thấy đủ toàn bộ yêu cầu + thiết kế của module đó — không cần tra catalog trung tâm trước.

> Xem khung quyết định cấu trúc tại [`.claude/knowledge/shared-doc-structure-production-vs-madetomeasure.md`](../../.claude/knowledge/shared-doc-structure-production-vs-madetomeasure.md) (Option C — bàn giao ngoài theo module kỹ thuật).

## Quy ước đặt tên tài liệu (mã hóa)

Mỗi file BRD/SRS cấp module (không phải file điều hướng như `INDEX.md`/`CATALOG.md`/`README.md`, và không phải file `.docx` gốc khách hàng) đặt tên theo:

```
MADUAN.TenVietTatPhanHe.VietTatChucNang.LoaiTaiLieu.version.md
```

Ví dụ: `TOSS.FD.ALL.BRD.v0.8.md` = dự án **TOSS**, phân hệ **FD** (Flight Dispatch), phủ **ALL** chức năng của phân hệ (BRD cấp phase, không phải 1 chức năng đơn lẻ), loại tài liệu **BRD**, phiên bản **v0.8**.

**Giá trị `LoaiTaiLieu`:**
- `BRD` — Business Requirements Document (yêu cầu nghiệp vụ, cấp phase).
- `FD` — **Function (Requirement) Document**, tức đặc tả SRS cấp chức năng/feature. Lưu ý: `FD` ở vị trí này là **mã loại tài liệu**, khác với `FD` dùng làm **mã phân hệ** (Flight Dispatch) ở vị trí `TenVietTatPhanHe` — hai vị trí khác nhau trong cùng tên file nên không nhầm lẫn khi đọc theo đúng thứ tự, dù cùng ký tự.

Mỗi module SRS phân rã xuống mức chức năng (`TOSS.<PhanHe>.<TenChucNang>.FD.v<x>.md`) có bảng tra cứu tại `CATALOG.md` của module đó — mỗi dòng trỏ đúng 1 file chức năng. **Từ 2026-07-13, các file chức năng đặt trong `srs/_parts/TOSS.<PhanHe>.<NHOM>/`** — thư mục nhóm đặt tên theo tiền tố `TOSS.<PhanHe>.<NHOM>` khớp trực tiếp với tiền tố tên file bên trong (vd DM có 13 nhóm: `TOSS.DM.AIRPORT/`, `TOSS.DM.PILOT/`, `TOSS.DM.CARRIER/`, `TOSS.DM.ULD/`, `TOSS.DM.AIRCRAFT/`...; FD có 2 nhóm: `TOSS.FD.FLIGHT_PLAN/`, `TOSS.FD.UPLOAD_DOCUMENT/`) — đọc tên file là suy ra ngay thư mục chứa nó, không cần bảng tra riêng. Thư mục **module cấp 1** (`FD-flight-dispatch/`, `DM-data-maintenance/`...) vẫn giữ tên tự mô tả đầy đủ (mã + tên tiếng Anh) theo đúng lý do Option C đã chọn — chỉ cấp nhóm chức năng bên trong mới dùng tiền tố `TOSS.<Mã>.` (kết hợp 2 lợi ích: thư mục ngoài cùng dễ nhận diện cho người ngoài dự án, thư mục nhóm bên trong nhất quán máy-đọc-được với tên file — BA Lead quyết định 2026-07-13 sau khi so sánh cả 2 hướng). `CATALOG.md`/`INDEX.md`/file thông tin chung (`TOSS.<PhanHe>.THONG_TIN_CHUNG.FD.v0.1.md`) vẫn đặt tại `srs/_parts/` gốc (không thuộc nhóm nào).

**Ngoại lệ — file SRS cấp CẢ MODULE (chưa/không phân rã chức năng):** đặt tên theo đúng quy ước chính thức mà VNA/VTIT đã dùng từ đầu cho tài liệu SRS gốc, ghi trong sheet "[TOSS] Theo dõi tiến độ sản xuất" §Thông tin dự án: `VNA.TOSS_SRS_<Tên Module>_v<x>.md` (vd `VNA.TOSS_SRS_Flight Dispatch_v0.1.md`, `VNA.TOSS_SRS_Live Operations_v0.1.md`). Áp dụng cho: `FD-flight-dispatch/srs/`, `FLC-flight-load-control/srs/`, `LO-live-operations/srs/` (2026-07-10 — sửa lại từ `TOSS.<Mã>.ALL.FD.v<x>.md` cho khớp tên chính thức). File `.docx` gốc khách hàng (System Admin, Data Maintenance — nay đã phân rã hết, không còn file "ALL") giữ nguyên đúng tên gốc đã có sẵn dạng này.

## 12 module (theo Function-list VNA-TOSS)

| # | Module | Mã phân hệ | `brd/` | `srs/` |
|---|---|---|---|---|
| 1 | [`LO-live-operations/`](LO-live-operations/) | `LO` | pointer sang FD (BRD-TOSS-PH1) | `VNA.TOSS_SRS_Live Operations_v0.1.md` — Google Doc live, **hiện trống**, chờ VNA/VTIT soạn |
| 2 | [`FD-flight-dispatch/`](FD-flight-dispatch/) | `FD` | `TOSS.FD.ALL.BRD.v0.8.md` (sở hữu chính PH1) + pointer sang FLC (PH2) | `VNA.TOSS_SRS_Flight Dispatch_v0.1.md` — 8 chức năng, 2 nhóm (`TOSS.FD.FLIGHT_PLAN/`, `TOSS.FD.UPLOAD_DOCUMENT/`) |
| 3 | [`FLC-flight-load-control/`](FLC-flight-load-control/) | `FLC` | `TOSS.FLC.ALL.BRD.v0.8.md` (sở hữu chính PH2) | `VNA.TOSS_SRS_Flight Load Control_v0.1.md` — 10 chức năng, 2 nhóm (`TOSS.FLC.DOCUMENT/`, `TOSS.FLC.FUEL_ORDER/`), 1 phần dở (sec-10), 1 trống (sec-11) |
| 4 | Station Manager | `SM` | *(chưa có)* | *(chưa có)* — chưa tạo thư mục |
| 5 | [`RPT-report/`](RPT-report/) | `RPT` | `TOSS.RPT.ALL.BRD.v0.5.md` (sở hữu chính PH3) | *(chưa có SRS)* |
| 6 | [`DM-data-maintenance/`](DM-data-maintenance/) | `DM` | `TOSS.DM.ALL.BRD.v0.6.md` (sở hữu chính PH4) | 69 file đặc tả chức năng, chia 13 nhóm (`srs/_parts/TOSS.DM.<NHOM>/`) + Catalog thiết kế |
| 7 | Data Source Monitoring | `DSM` | *(chưa có)* | *(chưa có)* — chưa tạo thư mục |
| 8 | [`SA-system-admin/`](SA-system-admin/) | `SA` | `TOSS.SA.ALL.BRD.v0.6.md` (sở hữu chính PH5) | 28 file đặc tả chức năng, chia 4 nhóm (`TOSS.SA.AUTH/`, `TOSS.SA.USER/`, `TOSS.SA.ROLE/`, `TOSS.SA.GROUP/`) + Catalog thiết kế |

| 9 | [`MCB-mail-canh-bao/`](MCB-mail-canh-bao/) | `MCB` | pointer sang SA (BRD-TOSS-PH5) | *(chưa có SRS)* |
| 10 | [`JDB-job-dong-bo/`](JDB-job-dong-bo/) | `JDB` | pointer sang SA (BRD-TOSS-PH5) | *(chưa có SRS)* |
| 11 | [`AUTH-authentication/`](AUTH-authentication/) | `AUTH` | pointer sang SA (BRD-TOSS-PH5) | *(chưa có SRS)* |
| 12 | Home | `HOME` | — | Nội dung nằm trong `common/srs/TOSS.HOME.ALL.FD.v0.1.md` |

`common/` dùng mã `HOME` cho nội dung Thiết kế dùng chung — không có mã phân hệ riêng vì bản chất là dùng chung.

## Thư mục dùng chung

- [`common/`](common/) — **không phải "nội dung không thuộc phân hệ nào"**, mà là nơi **mô tả MỘT LẦN** cho nội dung được **nhiều phân hệ cùng tham chiếu** (thiết kế UI/UX dùng chung, quy tắc/ghi chú áp cho nhiều module) — tránh phải mô tả lặp lại ở từng phân hệ khi cần nói tới nội dung chung đó. Có cùng hình dạng `brd/`+`srs/` như module thường.
- [`BRD-TOSS-001-khung-v0.12.md`](BRD-TOSS-001-khung-v0.12.md) — khung BRD top-down toàn dự án (không thuộc module nào, là văn kiện cha của mọi BRD-TOSS-PHn).
- [`SRS-TOSS-001-khung-v0.1.md`](SRS-TOSS-001-khung-v0.1.md) — **khung theo dõi SRS toàn dự án** (tracking index): bảng 12 module đối chiếu Function-list ↔ SRS đã có, số dòng cần rà tay, ưu tiên đề xuất. Đọc file này để biết nhanh module nào thiếu SRS mà không cần mở từng CATALOG.md.
- [`models/`](../workspace/models/) — mô hình nghiệp vụ dùng chung: BPMN/To-Be, entity map, tích hợp hệ ngoài, truy vết. Không đổi khi tái cấu trúc lần này.
- [`output/`](../workspace/output/) — bản xuất Word/PDF/PPTX cho người đọc ngoài công cụ BA (`output/human/`), đầu ra tối ưu agent (`output/agents/`, scaffold).

## Khi một yêu cầu (BRD phase) trải nhiều module

Một file BRD-TOSS-PHn thường phủ nhiều module cùng lúc. File thật chỉ đặt **một lần** dưới module là **chủ sở hữu chính** (module có tỷ trọng yêu cầu lớn nhất của phase đó); các module còn lại nhận **file pointer** một dòng (`brd/SEE-<module-so-huu>.md`) trỏ sang, tránh nhân bản/lệch bản khi cập nhật. Xem chi tiết cơ chế tại Option C trong file knowledge dẫn ở trên.

## Không nằm ở đây

- **Hồ sơ QC/audit-trail nội bộ** (review, validation, đề xuất chờ duyệt của BRD) → [`ba/workspace/drafts/quy-trinh/qc-brd/`](../workspace/drafts/quy-trinh/qc-brd/) — không lộ dấu vết QC nội bộ trong gói bàn giao module.
- **Phân rã BRD→FUNC do agent (đã đóng băng 2026-07-09)** → `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/` — tài liệu tham khảo lịch sử, không phải tài liệu chia sẻ chủ động.
- **Nhật ký kiểm soát thay đổi yêu cầu (NKLR)** — scaffold cũ (2026-06-04) chưa từng có mục nào, đã gỡ khi tái cấu trúc; tạo lại tại `ba/sync/quan-ly-yeu-cau/` khi có mục NKLR thật. Thư mục này cũng chứa **cơ chế đối chiếu Function-list ↔ sync/** (`check-function-list-vs-sync.py`) — xem [`quan-ly-yeu-cau/README.md`](quan-ly-yeu-cau/README.md).

---

*v1.4 — 2026-07-13: **đặt tên thư mục nhóm chức năng lại theo dạng lai** sau khi BA Lead nhờ Antigravity agents đổi tên thư mục `srs/_parts/` (kết quả v1.3 dùng kebab-case tiếng Việt như `san-bay/`) sang dạng `TOSS.<Mã>.<NHOM>` (vd `TOSS.DM.AIRPORT/`) — và **đổi luôn cả tên thư mục module cấp 1** từ `<Mã>-<ten-tieng-anh>` sang bare `TOSS.<Mã>` (vd `DM-data-maintenance/`→`TOSS.DM/`). Rà lại phát hiện Antigravity chạy find-replace không giới hạn phạm vi khi đổi tên "document"→`TOSS.FLC.DOCUMENT`, làm hỏng 219 link `docs.google.com/document/...` trên 72 file toàn bộ 4 module — đã sửa (xem `.claude/sync/SYNC-LOG.md` 2026-07-13). Sau khi BA Lead cân nhắc cả 2 hướng (thư mục module tự mô tả cho người ngoài dự án — đúng lý do Option C — vs thư mục nhóm nhất quán tiền tố với tên file, né rủi ro gán nhầm nhóm/lỗi encoding dấu tiếng Việt), quyết định **kết hợp**: khôi phục tên thư mục module cấp 1 tự mô tả (`DM-data-maintenance/`...) nhưng **giữ nguyên** tên thư mục nhóm chức năng kiểu Antigravity (`TOSS.DM.AIRPORT/`...) — không đổi lại kebab-case Việt của v1.3. Đã viết lại 94 tham chiếu tên thư mục module trên 22 file (README.md, CLAUDE.md/HUMAN.md, BRD-TOSS-001-khung, các file `SEE-*.md`, `common/srs/README.md`, báo cáo đối chiếu Function-list, link chéo module trong `_parts/`) — xác minh lại 127 file / 0 link hỏng.*
*v1.3 — 2026-07-13: **thêm 1 cấp thư mục "Nhóm chức năng" bên trong `srs/_parts/`** cho 4 module đã phân rã (FD, FLC, SA, DM — 115 file), khớp đúng cách Function-list tự phân theo Module → Chức năng → Feature, thay vì để phẳng tất cả file chức năng cùng cấp (đặc biệt cần với DM — 69 file trước đó nằm chung 1 thư mục). Nhóm lấy trực tiếp từ tiêu đề nhóm sẵn có trong `CATALOG.md` §1 của từng module (không tự đặt tên mới): FD (flight-plan, upload-document), FLC (document, fuel-order), SA (xac-thuc-phien-lam-viec, quan-ly-nguoi-dung, quan-ly-vai-tro, quan-ly-nhom-nguoi-dung), DM (san-bay, phi-cong, tiep-vien, carrier, quoc-gia, fir, email, uld-type, uld, chang-bay, doi-bay, ac-subtype, tau-bay). `CATALOG.md`/`INDEX.md`/file thông tin chung giữ nguyên ở gốc `srs/_parts/`. Toàn bộ link nội bộ (CATALOG↔file, file↔file cùng module, file↔file khác module) đã rà và sửa lại theo đường dẫn tương đối mới — xác minh 127 file / 0 link hỏng. `brd/` không đổi cấu trúc (BRD chưa phân rã tới cấp chức năng nên không có gì để chia nhóm thêm).*
*v1.2 — 2026-07-10: sửa tên 3 file SRS nguyên-khối (Flight Dispatch, Flight Load Control, Live Operations) từ `TOSS.<Mã>.ALL.FD.v0.1.md` sang tên chính thức `VNA.TOSS_SRS_<Tên Module>_v0.1.md` — theo sheet "[TOSS] Theo dõi tiến độ sản xuất" §Thông tin dự án (nguồn xác nhận quy ước tên SRS gốc của VNA/VTIT). Quy tắc `MADUAN.PhanHe.TenChucNang.FD.version` vẫn giữ nguyên ở cấp chức năng đã phân rã (`srs/_parts/`).*
*v1.1 — 2026-07-10: đổi tên 9 file BRD/SRS cấp module (5 BRD + 4 SRS Google Doc live) sang quy tắc `MADUAN.TenVietTatPhanHe.VietTatChucNang.LoaiTaiLieu.version` (vd `TOSS.FD.ALL.BRD.v0.8.md`); thêm cột "Mã phân hệ" vào bảng 12 module. File `.docx` gốc khách hàng (Data Maintenance, System Admin) và file điều hướng (`INDEX.md`/`CATALOG.md`/`README.md`/`SEE-*.md`) giữ nguyên tên — chỉ áp quy tắc cho tài liệu BRD/SRS chính.*
*v1.0 — 2026-07-10: dựng mới hoàn toàn theo Option C (1 thư mục/module kỹ thuật chứa cả brd+srs), thay thế `CATALOG.md` + `requirements/{brd,srs}/` của Option B (2026-07-10, chỉ tồn tại vài giờ trước khi bị thay). Lý do đổi: gói bàn giao made-to-measure/outsource cần trình bày theo module kỹ thuật mà bên nhận (client/DEV/QC ngoài) nhận diện được, không phải theo catalog nội bộ của BA.*
