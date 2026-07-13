---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Content Catalog"
subsystem: "Flight Dispatch (Flight Plan + Upload Document)"
---

# CATALOG — Phân rã tra cứu SRS Flight Dispatch v0.1

> **Mục đích:** Bảng tra cứu theo nội dung (content-based retrieval) trên tài liệu SRS Flight Dispatch do người soạn (mã hiệu dự án **VNA.FIMS** — **FIMS = TOSS**, BA Lead xác nhận 2026-07-02; nguồn Google Drive live, pull 2026-07-10, **phiên bản 1577**, sửa lần cuối bởi `tohuonggiang02`). Chỉ **tổ chức lại** nội dung đã ghi trong các mảnh `sec-NN-*.md` — không suy diễn, không bổ sung logic (CLAUDE.md §0). Mọi dòng đều dẫn nguồn về file section tương ứng.
>
> **Đồng bộ lại 2026-07-10 (phiên bản 1450 → 1577):** nguồn cập nhật 4 chức năng — #1 (quy tắc phân trang 25 bản ghi/trang), #3 (mô tả Table Setting chi tiết hơn), #5 (bổ sung Table Setting + quy tắc sắp xếp, bỏ dòng nút refresh, đổi nhãn cột "Upload date" → "Date", đổi mô tả ETD/ETA, đánh lại STT liên tục), #7 (điều chỉnh trường Revision/Choose File/Save — kiểm tra "chưa chọn tệp" chuyển sang nút Save). Vẫn **8 chức năng**, không thêm/bớt chức năng nào. Chi tiết tại footer từng file feature và các mục §2 tương ứng.
>
> **Quy ước đếm (chỉ để tra cứu, không phải nội dung nguồn):**
> - **Số trường** = số dòng thành phần trong bảng "Mô tả màn hình chức năng" (không tính dòng nhóm/tiêu đề khối; dòng gộp nhiều trường tính 1 dòng; dòng STT bị nhảy số trong nguồn vẫn đếm theo số dòng thực tế và được gắn cờ).
> - **Số bước** = số dòng trong bảng "Mô tả sơ đồ nghiệp vụ" (sec-04→06) / "Mô tả luồng nghiệp vụ" (sec-07→11).
> - Mọi "Sơ đồ nghiệp vụ" và "Màn hình chức năng" trong nguồn là **ảnh** — [cần xác nhận — nội dung dạng ảnh, xem Google Doc/Figma gốc].
> - Cột **Mapping DB/API** trống 100% trên toàn bộ 8 chức năng của module này — không đủ căn cứ dựng Từ điển trường (Data Dictionary) như case study Data-Maintenance (xem §2.9).

---

## 0. Ghi chú nguồn (gộp vào [TOSS.FD.THONG_TIN_CHUNG.FD.v0.1.md](TOSS.FD.THONG_TIN_CHUNG.FD.v0.1.md), không tính vào catalog chức năng)

- **Trang bìa + mục lục:** mã hiệu dự án `VNA.FIMS`, mã hiệu tài liệu `VNA.FIMS_SRS_Flight Dispatch_v0.1`; Bảng ghi nhận thay đổi tài liệu và Trang ký còn để trống (mẫu biểu Viettel VTIT chưa điền).
- **Mục đích tài liệu SRS:** 4 gạch đầu dòng chuẩn (xác định phạm vi hệ thống, làm cơ sở thống nhất VNA–VTIT, định hướng thiết kế/phát triển, cơ sở kiểm thử/nghiệm thu); ghi rõ tài liệu **không** mô tả kiến trúc hệ thống chi tiết, không bao gồm kế hoạch triển khai/vận hành.
- **Phạm vi tài liệu:** bảng đối tượng đọc (6 vai trò: BA, Dev, QA/Tester, PM, Đơn vị vận hành, Đại diện VNA) + bảng phạm vi hệ thống Phase 1 (5 phân hệ, đều đánh dấu "✅ Trong phạm vi": HOME — Đăng nhập & Quản lý phiên; Phân hệ Quản lý Điều hành Bay (TOSS); Phân hệ Danh mục dùng chung; Quản trị hệ thống; Báo cáo).
- **Khái niệm/thuật ngữ:** bảng 7 thuật ngữ (TT/STT, VNA, FIMS, CFP, OFP, e-CFP/OFP, PIC); dòng **OFP để trống cột Khái niệm** [Cần làm rõ: chưa có định nghĩa].

---

## 1. Catalog chức năng

**FLIGHT PLAN (sec-04 → sec-06)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 1 | Danh sách Flight Plan | Danh sách | [TOSS.FD.FLIGHT_PLAN_LIST.FD.v0.1.md](TOSS.FD.FLIGHT_PLAN/TOSS.FD.FLIGHT_PLAN_LIST.FD.v0.1.md) | Xem danh sách Flight Plan | Truy cập module TOSS → Flight Dispatch → tab Flight Plan | 33 | 3 | Toàn bộ 33 trường không có mapping DB/API; nút Action "View Briefing Sheet" trỏ liên kết nội bộ "Xem chi tiết Flight Plan" nhưng tên section thực tế trong tài liệu là "Xem chi tiết Briefings sheet" [Cần làm rõ: tên liên kết không khớp tiêu đề section]; export "TOSS_FlightPlan_ddmmyyhhmm" trỏ Google Sheets; [cập nhật v1577] phân trang mặc định **25 bản ghi/1 trang** (ngoại lệ so với kịch bản chung 10) |
| 2 | Xem chi tiết Briefings sheet | Xem | [TOSS.FD.BRIEFING_DETAIL.FD.v0.1.md](TOSS.FD.FLIGHT_PLAN/TOSS.FD.BRIEFING_DETAIL.FD.v0.1.md) | Xem chi tiết Briefing Sheet của Flight Plan được chọn (suy từ luồng — xem cờ) | Chọn 1 Flight Plan trong danh sách (suy từ Bước 3 luồng nghiệp vụ) | 4 | 4 | Tiêu đề mục "Màn hình chức năng" vẫn ghi **"(chưa chốt)"**; bảng 4 dòng STT (1-4) nhưng toàn bộ cột Tên/Kiểu dữ liệu/Mapping/Mô tả đều **trống** — không thay đổi so với bản trích trước; nguồn không có bảng Mục đích/Trigger/Tiền điều kiện/Hậu điều kiện riêng (khác chuẩn sec-04, sec-07→11) [Cần làm rõ] |
| 3 | Tìm kiếm Flight Plan | Action (tìm kiếm) | [TOSS.FD.FLIGHT_PLAN_SEARCH.FD.v0.1.md](TOSS.FD.FLIGHT_PLAN/TOSS.FD.FLIGHT_PLAN_SEARCH.FD.v0.1.md) | Tìm kiếm/lọc danh sách Flight Plan theo nhiều tiêu chí (suy từ luồng — xem cờ) | Nhập điều kiện lọc và nhấn Search (suy từ Bước 3-4 luồng nghiệp vụ) | 16 | 7 | Nguồn không có bảng Mục đích/Trigger riêng (khác chuẩn sec-04, sec-07→11) [Cần làm rõ]; trường ARR (dropdown) mô tả nhầm "hiển thị danh sách các mã sân bay khởi hành (ARR)" — nghi sao chép từ mô tả DEP (ARR phải là sân bay đến); toàn bộ không có mapping DB/API; [cập nhật v1577] Table Setting mô tả chi tiết hơn (3 cột đầu luôn hiển thị, thứ tự cột cố định, cấu hình lưu theo tài khoản) |

**UPLOAD DOCUMENT (sec-07 → sec-11)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 4 | Danh sách tài liệu chung chuyến bay | Danh sách | [TOSS.FD.COMMON_DOCS_LIST.FD.v0.1.md](TOSS.FD.UPLOAD_DOCUMENT/TOSS.FD.COMMON_DOCS_LIST.FD.v0.1.md) | Xem/tìm kiếm danh sách tài liệu dùng chung chuyến bay theo khoảng hiệu lực | Click tab "Tài liệu chung" trong màn hình Upload Document | 12 | 5 | Bảng danh sách tài liệu nhảy STT từ 1 sang 3 (**thiếu STT 2**); toàn bộ không có mapping DB/API |
| 5 | Danh sách tài liệu theo từng chuyến | Danh sách | [TOSS.FD.FLIGHT_DOCS_LIST.FD.v0.1.md](TOSS.FD.UPLOAD_DOCUMENT/TOSS.FD.FLIGHT_DOCS_LIST.FD.v0.1.md) | Xem/tìm kiếm danh sách tài liệu theo từng chuyến bay | Truy cập Flight Dispatch → Upload Document → tab Tài liệu chuyến bay | 19 | 5 | [cập nhật v1577] bổ sung Table Setting (bộ lọc, STT 10) + quy tắc sắp xếp mặc định theo ETD tăng dần; bỏ dòng nút refresh; đổi nhãn cột "Upload date" → "Date" và đánh lại STT liên tục 1-9 — 2 cờ cũ (nhảy STT 9→11; nhãn "Upload date" không khớp mô tả Operating Date) **đã được nguồn khắc phục** (xem §2.3, §2.4); mô tả ETD/ETA đổi sang "hiển thị đầy đủ, cho phép xuống dòng"; toàn bộ không có mapping DB/API |
| 6 | Upload tài liệu theo từng chuyến bay | Action (upload) | [TOSS.FD.UPLOAD_FLIGHT_DOC.FD.v0.1.md](TOSS.FD.UPLOAD_DOCUMENT/TOSS.FD.UPLOAD_FLIGHT_DOC.FD.v0.1.md) | Upload tài liệu cho 1 chuyến bay cụ thể | Chọn chuyến bay → nhấn "Choose file" tại bản ghi tương ứng | 7 | 9 | Mục đích ghi lặp từ "Upload tài liệu theo từng chuyến bay **chuyến bay**" (giữ nguyên văn nguồn); cột Bước ghi số thuần (1-9) không có tiền tố "Bước" (khác định dạng sec-04/06/07/08) [ghi chú định dạng]; toàn bộ không có mapping DB/API |
| 7 | Upload tài liệu chung chuyến bay | Action (upload) | [TOSS.FD.UPLOAD_COMMON_DOC.FD.v0.1.md](TOSS.FD.UPLOAD_DOCUMENT/TOSS.FD.UPLOAD_COMMON_DOC.FD.v0.1.md) | Upload tài liệu dùng chung, áp dụng cho nhiều chuyến bay có ETD trong khoảng hiệu lực khai báo | Nhấn nút "Upload tài liệu chung" | 7 | 9 | Cột Bước ghi số thuần (1-9) không có tiền tố "Bước" (khác định dạng sec-04/06/07/08) [ghi chú định dạng]; toàn bộ không có mapping DB/API; [cập nhật v1577] kiểm tra "chưa chọn tệp → No file has been selected." chuyển từ Choose File sang nút Save; trường Revision bỏ 1 gạch đầu dòng báo lỗi tên tệp (vẫn còn ở Choose File) |
| 8 | Xoá tài liệu chung chuyến bay | Xóa | [TOSS.FD.DELETE_COMMON_DOC.FD.v0.1.md](TOSS.FD.UPLOAD_DOCUMENT/TOSS.FD.DELETE_COMMON_DOC.FD.v0.1.md) | Xóa 1 hoặc nhiều tài liệu chung chuyến bay (kèm popup xác nhận) | Tích chọn tài liệu cần xóa hoặc nhấn icon Xóa tại dòng tương ứng (theo Bước 1 luồng thực tế) | 6 | 4 | Trigger ghi trong bảng đầu mục là "mở Flight Dispatch → Upload Document" (giống hệt các chức năng upload khác) nhưng **không khớp** Bước 1 thực tế của luồng nghiệp vụ (tích chọn tài liệu/nhấn icon Xóa) [Cần làm rõ]; toàn bộ không có mapping DB/API |

**Tổng: 8 chức năng** (Flight Plan 3 · Upload Document 5) — 104 trường · 46 bước.

---

## 2. Điểm cần xác nhận

### 2.1 Mapping DB/API trống toàn bộ module

Cả 8 chức năng (sec-04 → sec-11) đều để trống cột "Mapping DB/API" trong bảng "Mô tả màn hình chức năng" — không có ngoại lệ nào trong module này (khác với module Data Maintenance, nơi một số chức năng có mapping).

### 2.2 Thiếu bảng đầu mục chuẩn (Mục đích / Trigger / Tiền điều kiện / Hậu điều kiện)

sec-05 và sec-06 **không có** bảng "Tên chức năng / Mục đích / Trigger / Tiền điều kiện / Hậu điều kiện" mà sec-04 và sec-07→11 đều có — hai section này bắt đầu thẳng vào "Sơ đồ nghiệp vụ". Cột "Mục đích" và "Trigger" tương ứng trong bảng §1 được **suy từ nội dung luồng nghiệp vụ đã ghi trong nguồn** (không phải trích trực tiếp một trường riêng) — đã ghi chú "(suy từ luồng)" tại mỗi ô liên quan.

### 2.3 Đánh số STT nhảy số / thiếu dòng

- **sec-07** (bảng danh sách tài liệu chung): STT nhảy từ 1 sang 3, thiếu dòng số 2 — **vẫn còn** ở phiên bản 1577.
- **sec-08** (bảng danh sách tài liệu theo chuyến): ~~STT nhảy từ 9 sang 11, thiếu dòng số 10~~ — **đã được nguồn khắc phục ở phiên bản 1577** (bỏ dòng nút refresh, đánh lại STT liên tục 1-9).

### 2.4 Nghi sao chép / nội dung không khớp nhãn trường

- **sec-06**, trường ARR (dropdown): mô tả ghi "hệ thống hiển thị danh sách các mã sân bay khởi hành (**ARR**)" — nghi sao chép nguyên văn từ mô tả trường DEP phía trên (ARR phải là sân bay đến, không phải khởi hành).
- **sec-08**, cột "Upload date" (STT 6 cũ trong bảng danh sách): ~~nội dung mô tả nghiệp vụ là "Operating Date... định dạng dd/MM" không khớp tên cột~~ — **đã được nguồn khắc phục ở phiên bản 1577**: cột đổi nhãn thành "**Date**" (STT 5 mới), mô tả Operating Date giữ nguyên và nay khớp nhãn.
- **sec-09**: trường Mục đích ghi "Cho phép user Upload tài liệu theo từng chuyến bay **chuyến bay**" — lặp cụm từ "chuyến bay" (giữ nguyên văn nguồn, không sửa).

### 2.5 "(chưa chốt)" và nội dung trống — sec-05

Mục "Xem chi tiết Briefings sheet" (sec-05): tiêu đề "Màn hình chức năng" vẫn ghi **"(chưa chốt)"**; bảng "Mô tả màn hình chức năng" có đủ 4 dòng STT (1-4) nhưng toàn bộ các cột Tên / Kiểu dữ liệu / Mapping DB/API / Mô tả nghiệp vụ đều **để trống**. So với ghi nhận trong bản trích trước (đã xóa), nội dung phần này **chưa có thay đổi** — vẫn ở trạng thái chưa chốt.

### 2.6 Liên kết nội bộ không khớp tên section

sec-04, trường "Action" (STT 31): mô tả nút "View Briefing Sheet" trỏ liên kết nội bộ `Xem chi tiết Flight Plan`, nhưng tên section đích thực tế trong tài liệu là "**Xem chi tiết Briefings sheet**" (sec-05) — tên liên kết và tên section không khớp nhau.

### 2.7 Trigger không khớp luồng thực tế — sec-11

sec-11 (Xoá tài liệu chung chuyến bay): bảng đầu mục ghi Trigger là "Người dùng truy cập vào web TOSS => mở đến module Flight Dispatch -> chọn Upload Document" — giống hệt Trigger của các chức năng Upload khác (sec-09, sec-10) — trong khi Bước 1 của luồng nghiệp vụ thực tế mô tả hành động khác: "Người dùng tích chọn một hoặc nhiều tài liệu cần xóa hoặc nhấn biểu tượng Xóa tại dòng tài liệu tương ứng."

### 2.8 Tham chiếu external chưa có bản nội bộ

- **Kịch bản phân trang**: sec-04 và sec-07/08 đều trỏ tới cùng 1 Google Doc (`1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A`) nhưng khác anchor `#heading` — chưa có bản nội bộ trong repo.
- **File export "TOSS_FlightPlan_ddmmyyhhmm"** (sec-04): trỏ Google Sheets.

### 2.9 Không đủ căn cứ dựng Từ điển trường (Data Dictionary)

Không như module Data Maintenance (có mapping cho phần lớn trường), toàn bộ 8 chức năng của Flight Dispatch **không có bất kỳ mapping DB/API nào** trong nguồn hiện tại — do đó CATALOG này không có mục "Từ điển trường"; cần bổ sung từ nguồn khác (ví dụ tài liệu thiết kế API/DB riêng) nếu `data-modeler` cần dựng entity map cho phân hệ này.

### 2.10 Định dạng bảng bước không nhất quán

sec-09 và sec-10 dùng cột "Bước" ghi số thuần (1, 2, 3…) thay vì định dạng "Bước 1", "Bước 2"… như sec-04, sec-06, sec-07, sec-08, sec-11 — không ảnh hưởng nội dung, chỉ ghi chú khác biệt định dạng giữa các section.
