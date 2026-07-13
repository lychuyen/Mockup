---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Content Catalog"
subsystem: "Flight Load Control"
---

# CATALOG — Phân rã tra cứu SRS Flight Load Control v0.1

> **Mục đích:** Bảng tra cứu theo nội dung (content-based retrieval) trên tài liệu SRS Flight Load Control do người soạn (VNA/VTIT, Google Doc live — sửa gần nhất 2026-07-10T10:57:39Z bởi `chuyenly2003`, version 2192). Chỉ **tổ chức lại** nội dung đã ghi trong các mảnh `sec-NN-*.md` — không suy diễn, không bổ sung logic (CLAUDE.md §0). Mọi dòng đều dẫn nguồn về file section tương ứng. Bản `CATALOG.md` này được dựng lại từ đầu ngày 2026-07-10 sau khi nguồn được đồng bộ lại và phân rã lại (`_parts/` mới, bản CATALOG cũ đã bị xóa cùng đợt phân rã).
>
> **Đồng bộ lại 2026-07-10 (phiên bản 2074 → 2192):** nguồn cập nhật 6 chức năng — #1 FLIGHT_LIST (bổ sung "Quy tắc đặt tên file tài liệu" .PDF/in hoa vào khối quy tắc, bỏ cụm "và lưu trữ vào Server"); #2 FLIGHT_DOCS_DETAIL (STT 1 đổi nguồn dữ liệu "Lấy từ cột Flight" → "Dữ liệu đồng bộ từ Netline ops++"); #3 UPLOAD_FLIGHT_DOC (viết lại bộ validate STT 3: chỉ .pdf, 30MB, thêm check khớp chuyến bay + Revision, bỏ TH "File already uploaded for another flight"; quy tắc đặt tên chuyển sang #1); #4 FLIGHT_SEARCH (gạch bỏ "Set current page=1" và "chân trang ="); #5 CUSTOMIZE_DOC_TABLE (chỉ khớp chính tả trường 5, không đổi nghiệp vụ); #6 FUEL_ORDER_LIST (viết lại quy tắc nhóm PIC release: OFP FUEL = OFP BLOCK FUEL, FUEL ORDER = REQUEST FUEL, TAXI = COR.TAXI FUEL, TRIP = COR.TRIP FUEL — trước đó là TOTAL FUEL/TAXI/TRIP cột C.FUEL). 4 mục còn lại (#7 FUEL_ORDER_DETAIL, #8 EDIT_FUEL_INFO, #9 FUEL_ORDER_SEARCH, #10 CUSTOMIZE_FUEL_TABLE) và phần Thông tin chung KHÔNG thay đổi — riêng #7 phần "Màn hình chức năng"/"Mô tả chi tiết màn hình" **vẫn trống** và #8 **vẫn trống hoàn toàn** ở version 2192.
>
> **Quy ước đếm (chỉ để tra cứu, không phải nội dung nguồn):**
> - **Số trường** = số dòng có nội dung trường/thành phần thực tế trong bảng "Mô tả chi tiết màn hình" (không tính dòng nhóm quy tắc/tiêu đề khối không mang tên trường; dòng gộp nhiều trường tính 1 dòng; nếu 1 trường bị tách thành nhiều dòng bảng do lỗi cấu trúc nguồn thì đếm theo đúng số dòng bảng thực tế — ghi chú tại cột Cờ).
> - **Số bước** = số dòng trong bảng "Mô tả luồng xử lý" (một dòng có thể gộp nhiều bước, ví dụ "Bước 1,2").
> - Phần "Màn hình chức năng" trong nguồn là **ảnh chụp màn hình** — không trích được nội dung, [cần xác nhận — xem Google Doc/Figma gốc]. Phần **"Sơ đồ luồng hệ thống"** (UML Activity Diagram) **đã được chuyển sang Mermaid** trong 9/10 file feature (2026-07-11, xuất Google Doc gốc sang `.docx` để lấy ảnh thật + xem trực tiếp — #8 EDIT_FUEL_INFO không có ảnh vì mục này trống hoàn toàn); ảnh gốc lưu tại `_images/FLC-flight-load-control.<FEATURE>.sodo-luong.png` cạnh mỗi file.
> - Toàn bộ 10 mục (sec-04 → sec-13) trong bản trích này **không có cột "Mapping DB/API"** được điền — cột này luôn để trống trong nguồn hiện tại.

**Ghi chú front-matter (gộp vào [TOSS.FLC.THONG_TIN_CHUNG.FD.v0.1.md](TOSS.FLC.THONG_TIN_CHUNG.FD.v0.1.md), không tính vào catalog chức năng):**
- Trang bìa: bìa biểu mẫu VTIT (mã hiệu dự án `VNA.FIMS`, mã tài liệu `VNA.FIMS_SRS_Flight_Load_Control_v1.0`), bảng ghi nhận thay đổi còn trống, trang ký còn trống placeholder.
- Mục đích: Mục đích tài liệu (SRS — phạm vi, giao kèo VNA/VTIT, định hướng dev/QA, cơ sở nghiệm thu).
- Phạm vi tài liệu: bảng 6 đối tượng đọc; mục 1.2.2 "Phạm vi hệ thống (Phase 1)" chỉ có tiêu đề, không có nội dung tiếp theo trong mảnh này.
- Khái niệm/thuật ngữ: bảng 7 thuật ngữ (TT/STT, VNA, FIMS, CFP, OFP, e-CFP/OFP, PIC); dòng "OFP" đã có khái niệm ("Operational Fight Plan") — không còn để trống như ghi nhận trước đây.

---

## 1. Catalog chức năng

**Document (sec-04 → sec-08)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 1 | Xem danh sách chuyến bay và trạng thái tài liệu | Danh sách | [TOSS.FLC.FLIGHT_LIST.FD.v0.1.md](TOSS.FLC.DOCUMENT/TOSS.FLC.FLIGHT_LIST.FD.v0.1.md) | Xem danh sách chuyến bay + trạng thái tài liệu LS/GD/PM | Module TOSS → Flight Load Control → tab Document | 9 | 4 | Không có mapping DB/API; 3 dòng đầu bảng là khối "quy tắc hiển thị/quy tắc phân bổ/kịch bản ứng xử" không tính vào số trường; dòng EDD không có STT còn FLT NO mang STT "1" [ghi nhận nguyên trạng lệch số thứ tự nguồn]; **v2192:** bổ sung "Quy tắc đặt tên file tài liệu" (cấu trúc `[tên tài liệu]_[mã chuyến bay]_[R<số phiên bản>]_[ngày cất cánh dự kiến].PDF`, in hoa, chỉ pdf) vào khối quy tắc, bỏ cụm "và lưu trữ vào Server" |
| 2 | Xem chi tiết tài liệu chuyến bay | Xem | [TOSS.FLC.FLIGHT_DOCS_DETAIL.FD.v0.1.md](TOSS.FLC.DOCUMENT/TOSS.FLC.FLIGHT_DOCS_DETAIL.FD.v0.1.md) | Xem chi tiết tài liệu (Load Sheet/Gen. Declaration/Pax Manifest) của 1 chuyến bay | tab Document → click 1 bản ghi | 23 | 4 | Không có mapping DB/API; khối header chuyến bay (STT1: số hiệu/ACREG/ACTYPE/ngày giờ cất-hạ cánh/sân bay đi-đến) bị tách thành 4 dòng bảng riêng do lỗi merge-cell nguồn — đã đếm theo đúng số dòng bảng thực tế; có popup xem 1 tài liệu lồng bên trong (STT11–20: trang, zoom, xoay, lật, tải, in); **v2192:** STT 1 (số hiệu chuyến bay) đổi nguồn dữ liệu "Lấy từ cột Flight" → "Dữ liệu đồng bộ từ Netline ops++" |
| 3 | Upload tài liệu chuyến bay | Action (upload) | [TOSS.FLC.UPLOAD_FLIGHT_DOC.FD.v0.1.md](TOSS.FLC.DOCUMENT/TOSS.FLC.UPLOAD_FLIGHT_DOC.FD.v0.1.md) | Upload tài liệu chuyến bay (LS/GD/PM), validate theo chuỗi kiểm tra (định dạng/dung lượng/tên/khớp chuyến bay/Revision) | Chi tiết chuyến bay → chọn tab tài liệu → kéo thả/chọn file | 3 | 9 | Không có mapping DB/API; Bước "1,2" gộp chung 1 dòng bảng; quy tắc validate + popup xác nhận upload + màn Processing đều lồng trong 1 dòng bảng duy nhất (STT3) dưới dạng bảng con — không tách riêng khi đếm; **v2192:** viết lại bộ validate (chỉ .pdf, ≤30MB, thêm check khớp FLT NO/ngày cất cánh trong tên file + Revision phải cao hơn hiện tại, bỏ TH "File already uploaded for another flight"; quy tắc đặt tên chuyển sang mục #1) [Cần làm rõ: mâu thuẫn nội tại — chú thích trường 2 vẫn ghi "Accepted formats are .pdf,.txt (maximum 5MB)" và ví dụ tên file đuôi .TXT, trong khi validate mới chỉ .pdf/30MB] |
| 4 | Tìm kiếm chuyến bay | Action (tìm kiếm) | [TOSS.FLC.FLIGHT_SEARCH.FD.v0.1.md](TOSS.FLC.DOCUMENT/TOSS.FLC.FLIGHT_SEARCH.FD.v0.1.md) | Tìm kiếm/lọc danh sách chuyến bay theo FLT NO/ACREG/ACTYPE/ETD/DEP/ARR (tab Document) | tab Document → nhập bộ lọc → Search/Clear Filter | 8 | 5 | Không có mapping DB/API; dòng lọc ETD không có STT nhưng vẫn là 1 trường lọc riêng; tham chiếu "kịch bản chức năng ẩn hiện filter" trỏ Google Docs ngoài, chưa có bản nội bộ; **v2192:** nguồn gạch bỏ (strikethrough) cụm "Set current page=1" và cụm "chân trang =" trong khối quy tắc tìm kiếm [Cần làm rõ: hiệu lực sau khi gạch bỏ — mục Tìm kiếm bên tab Fuel Order (#9) KHÔNG bị gạch tương ứng] |
| 5 | Customize bảng biểu (Document) | Action (customize) | [TOSS.FLC.CUSTOMIZE_DOC_TABLE.FD.v0.1.md](TOSS.FLC.DOCUMENT/TOSS.FLC.CUSTOMIZE_DOC_TABLE.FD.v0.1.md) | Kéo thả/ẩn-hiện cột hiển thị bảng danh sách Document, lưu cấu hình 96h | tab Document → click icon Table setting | 7 | 8 | Không có mapping DB/API; Trigger + Title trường 1 ("Document table setting") đúng đang nói về tab Document, NHƯNG **Bước 1–2 của Mô tả luồng xử lý vẫn ghi nhầm "chọn tab Fuel Order" / "hiển thị ... thông tin Fuel Order"** [Cần làm rõ: dấu vết sao chép chéo từ mục Fuel Order (sec-13) — còn tồn tại một phần, chưa sửa hết] |

**Fuel order (sec-09 → sec-13)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 6 | Xem danh sách chuyến bay và thông tin fuel order | Danh sách | [TOSS.FLC.FUEL_ORDER_LIST.FD.v0.1.md](TOSS.FLC.FUEL_ORDER/TOSS.FLC.FUEL_ORDER_LIST.FD.v0.1.md) | Xem danh sách chuyến bay + thông tin Fuel Order (OFP Rev, PIC release rev, EST/OFP PAYLOAD, OFP DOW, DIFFERENCE, OFP FUEL, FUEL ORDER, TAXI, TRIP) | Module TOSS → Flight Load Control → tab Fuel Order | 17 | 4 | Không có mapping DB/API; **toàn bộ 3 gạch đầu dòng "Quy tắc hiển thị" (±18h/thời gian thực/thứ tự ETD) vẫn bị GẠCH BỎ (strikethrough) trong nguồn**, gồm cả câu ETD "là cơ sở để hiển thị ... theo quy tắc hiển thị" [Cần làm rõ: hiệu lực quy tắc ±18h ở tab Fuel Order — chưa được xác nhận lại]; EDD và FLT NO cùng mang STT "1" (lệch số thứ tự nguồn, cùng dạng lỗi như sec-04); **v2192:** quy tắc Bước 3 tách thành "Quy tắc bóc tách OFP" + "Quy tắc đồng bộ dữ liệu PIC release", nguồn giá trị 4 trường release đổi: OFP FUEL = OFP BLOCK FUEL, FUEL ORDER = REQUEST FUEL, TAXI = COR.TAXI FUEL, TRIP = COR.TRIP FUEL (trước là TOTAL FUEL/TAXI/TRIP cột C.FUEL); nhãn nhóm cột thứ 3 đổi thành "(được đông bộ từ MO thuộc bản PIC release mới nhất)" — giữ nguyên lỗi chính tả nguồn |
| 7 | Xem details fuel chuyến bay | Xem | [TOSS.FLC.FUEL_ORDER_DETAIL.FD.v0.1.md](TOSS.FLC.FUEL_ORDER/TOSS.FLC.FUEL_ORDER_DETAIL.FD.v0.1.md) | Xem chi tiết fuel chuyến bay | tab Fuel Order → click 1 bản ghi | 0 | 4 | **Đã có nội dung một phần** — khác bản trước (từng trống hoàn toàn): bảng header (Mục đích/Trigger/Tiền-Hậu điều kiện) và "Mô tả luồng xử lý" (4 bước) đã được điền đầy đủ; TUY NHIÊN **"Màn hình chức năng" và "Mô tả chi tiết màn hình" VẪN HOÀN TOÀN TRỐNG** (không có ảnh, không có bảng, không có dòng nào) [Cần làm rõ: nội dung màn hình + đặc tả trường còn thiếu, chưa soạn xong]; thêm mâu thuẫn: Trigger ghi "Chọn tab Fuel Order" nhưng Bước 1 của luồng xử lý lại ghi "chọn tab Document" [Cần làm rõ: dấu vết sao chép chéo/nhầm lẫn tab]; **v2192: kiểm tra lại — KHÔNG đổi, phần màn hình vẫn chưa được bổ sung** |
| 8 | Chỉnh sửa và hiển thị thông tin dầu | (chưa xác định — trống) | [TOSS.FLC.EDIT_FUEL_INFO.FD.v0.1.md](TOSS.FLC.FUEL_ORDER/TOSS.FLC.EDIT_FUEL_INFO.FD.v0.1.md) | (chưa có nội dung) | (chưa có nội dung) | 0 | 0 | **TRỐNG HOÀN TOÀN** — xác nhận lại vẫn y như trước: chỉ có tiêu đề cấp 2 và 4 tiêu đề cấp 3 rỗng (Sơ đồ luồng hệ thống / Mô tả luồng xử lý / Màn hình chức năng / Mô tả chi tiết màn hình), không có bảng Mục đích/Trigger/Tiền-Hậu điều kiện, không có bất kỳ nội dung nào khác [Cần làm rõ: mục này chưa được VNA/VTIT soạn]; **v2192: kiểm tra lại — VẪN trống hoàn toàn** |
| 9 | Tìm kiếm chuyến bay và thông tin fuel order | Action (tìm kiếm) | [TOSS.FLC.FUEL_ORDER_SEARCH.FD.v0.1.md](TOSS.FLC.FUEL_ORDER/TOSS.FLC.FUEL_ORDER_SEARCH.FD.v0.1.md) | Tìm kiếm/lọc danh sách chuyến bay + thông tin Fuel Order theo FLT NO/ACREG/ACTYPE/DEP/ETD/ARR | tab Fuel Order → nhập bộ lọc → Search/Clear Filter | 8 | 5 | Không có mapping DB/API; thứ tự cột lọc khác sec-07 (DEP xuất hiện trước ETD; ETD không có STT); tham chiếu "kịch bản chức năng ẩn hiện filter" trỏ Google Docs ngoài, giống sec-07; **v2192: không đổi** (KHÔNG bị gạch "Set current page=1"/"chân trang =" như #4) |
| 10 | Customize bảng biểu (Fuel order) | Action (customize) | [TOSS.FLC.CUSTOMIZE_FUEL_TABLE.FD.v0.1.md](TOSS.FLC.FUEL_ORDER/TOSS.FLC.CUSTOMIZE_FUEL_TABLE.FD.v0.1.md) | Kéo thả/ẩn-hiện cột hiển thị bảng Fuel Order ("Flight Monitoring table setting"), lưu cấu hình 96h | tab Fuel Order → click icon Table setting | 7 | 8 | Không có mapping DB/API; **Title/Trigger/Bước 1–2/mô tả trường 1–6 đã được SỬA ĐÚNG** — nhất quán nói về "Fuel Order"/"Flight Monitoring table setting" (khác bản trước, khi đó Fuel Order từng ghi nhầm "Document table setting" toàn bộ); TUY NHIÊN **dòng mô tả trường 7 (nút Save) vẫn còn sót** "Đóng Popup 'Document table setting'" [Cần làm rõ: dấu vết sao chép chéo chưa được dọn hết, còn sót đúng 1 chỗ]; **v2192: không đổi** |

**Tổng: 10 mục tiêu đề** (8 chức năng có nội dung — dù chưa có Mapping DB/API — cộng 1 chức năng có nội dung một phần [sec-10] và 1 chức năng trống hoàn toàn [sec-11]). Nhóm Document: 5 mục (42 trường · 30 dòng bước). Nhóm Fuel order: 5 mục (32 trường · 21 dòng bước, tính cả sec-10/11 = 0).

---

## 2. Điểm cần xác nhận

### 2.1 Dấu vết sao chép chéo Document ↔ Fuel Order (sec-08, sec-13) — đã sửa một phần

So với bản trích trước (đã xóa), VNA/VTIT đã sửa phần lớn nhưng **chưa dọn hết**:

- **sec-08 (Document table setting):** Title (trường 1) và Trigger đúng nói về tab Document. Nhưng **Bước 1–2 trong "Mô tả luồng xử lý" vẫn ghi nhầm "chọn tab Fuel Order"** và "hiển thị ... thông tin Fuel Order" thay vì tab Document.
- **sec-13 (Flight Monitoring table setting):** Title, Trigger, toàn bộ Bước 1–8, và mô tả trường 1–6 đã sửa đúng, nhất quán nói về Fuel Order/"Flight Monitoring table setting" (đây là điểm đã được VNA/VTIT sửa so với bản trước). Nhưng **dòng mô tả trường 7 (nút Save) vẫn còn sót cụm "Đóng Popup 'Document table setting'"** — chưa cập nhật lại tên popup đúng ngữ cảnh Fuel Order.

→ Kết luận: lỗi sao chép chéo **chưa được khắc phục triệt để**, chỉ dịch chuyển vị trí còn sót (sec-08 còn sót ở luồng xử lý, sec-13 còn sót ở 1 dòng mô tả trường). *(Kiểm tra lại tại version 2192: cả 2 chỗ sót vẫn nguyên trạng.)*

### 2.2 sec-10 "Xem details fuel chuyến bay" — có nội dung một phần

Khác biệt so với bản trích trước (từng trống hoàn toàn):
- **Đã có:** bảng header (Mục đích, Trigger, Tiền điều kiện, Hậu điều kiện) và bảng "Mô tả luồng xử lý" đầy đủ 4 bước.
- **Vẫn trống:** mục "Màn hình chức năng" và "Mô tả chi tiết màn hình" — không có ảnh, không có bảng, không có trường nào được liệt kê.
- **Mâu thuẫn còn sót:** Trigger ghi "Chọn tab Fuel Order" nhưng Bước 1 của luồng xử lý ghi "chọn tab Document" — cùng loại lỗi sao chép chéo như mục 2.1.

*(Kiểm tra lại tại version 2192: mục này KHÔNG thay đổi — phần "Màn hình chức năng" và "Mô tả chi tiết màn hình" vẫn chưa được VNA/VTIT bổ sung.)*

### 2.3 sec-11 "Chỉnh sửa và hiển thị thông tin dầu" — vẫn trống hoàn toàn

Xác nhận lại: mục này **không có bất kỳ nội dung nào** ngoài 1 tiêu đề cấp 2 và 4 tiêu đề cấp 3 rỗng. Không có bảng Mục đích/Trigger, không có Mô tả luồng xử lý, không có Màn hình chức năng, không có Mô tả chi tiết màn hình. Chưa được VNA/VTIT soạn tại thời điểm đồng bộ 2026-07-10 *(kiểm tra lại tại version 2192: vẫn trống hoàn toàn)*.

### 2.4 Trường ETD (sec-09) — quy tắc ±18h vẫn bị gạch bỏ

Tại sec-09 (danh sách Fuel Order), cả 3 gạch đầu dòng của "Quy tắc hiển thị" — gồm khoảng ±18 giờ, cập nhật thời gian thực, và thứ tự sắp xếp theo ETD — **vẫn ở trạng thái bị gạch ngang (strikethrough)** trong nguồn, y như bản trích trước. Điều này khác với sec-04 (tab Document), nơi 3 gạch đầu dòng tương ứng **không** bị gạch bỏ. Chưa rõ quy tắc ±18h có còn hiệu lực ở tab Fuel Order hay không — cần VNA/VTIT xác nhận.

### 2.5 Không có Mapping DB/API trong toàn bộ module

Tất cả 10 mục (sec-04 → sec-13) đều để trống cột "Mapping DB/API" trong bảng "Mô tả chi tiết màn hình" — khác với SRS Data Maintenance (nơi phần lớn trường có mapping). Đây là đặc điểm chung của toàn module Flight Load Control trong bản trích hiện tại, không phải lỗi cục bộ ở 1 section.

### 2.6 Bất thường số thứ tự (STT) trong bảng "Mô tả chi tiết màn hình"

Nhiều section có ô STT để trống hoặc đánh trùng số — ghi nhận nguyên trạng, không suy diễn:
- sec-04, sec-09: EDD không có STT trong khi FLT NO mang STT "1" (đáng lẽ EDD phải là "1" nếu đếm tuần tự).
- sec-05: khối header chuyến bay ở đầu bảng chỉ dòng đầu tiên mang STT "1", 3 dòng label còn lại (ngày cất cánh, giờ cất/hạ cánh) không có STT dù là nội dung hiển thị riêng biệt.
- sec-07, sec-12: dòng lọc ETD không có STT.

### 2.7 Nội dung dạng ảnh không trích được

Phần "Màn hình chức năng" trong các section sec-04 → sec-13 chỉ là ảnh chụp màn hình, không trích được nội dung text — [cần xác nhận, xem Google Doc/Figma gốc nếu cần đối chiếu trực quan]. **"Sơ đồ luồng hệ thống" đã được giải quyết** (2026-07-11): xuất Google Doc gốc sang `.docx` để lấy ảnh thật (bản pull `.md` trước đó chỉ có placeholder text `data:image/png;base64...` không có dữ liệu ảnh), xem trực tiếp và chuyển thành sơ đồ Mermaid cho 9/10 file feature — #8 EDIT_FUEL_INFO không có ảnh vì mục này trống hoàn toàn trong nguồn.

### 2.8 Mâu thuẫn nội tại mới trong Upload tài liệu (sec-06, phát hiện tại version 2192)

Bộ validate STT 3 được viết lại chỉ chấp nhận định dạng **.pdf** ("Invalid file format. Only .pdf files are supported") và giới hạn dung lượng **30MB** ("smaller than 30MB"), NHƯNG chú thích ở trường 2 của cùng màn hình vẫn ghi "Accepted formats are **.pdf,.txt** (maximum **5MB**)" và ví dụ tên file trong STT 3 vẫn mang đuôi **.TXT** (`LOADSHEET_VN343_R01_02JUL26.TXT`). [Cần làm rõ: định dạng và giới hạn dung lượng nào có hiệu lực — chưa được VNA/VTIT thống nhất trong nguồn]

### 2.9 Gạch bỏ mới ở Tìm kiếm chuyến bay tab Document (sec-07, version 2192)

Trong khối quy tắc tìm kiếm của sec-07, nguồn mới gạch bỏ (strikethrough) cụm "Set current page=1" và cụm "chân trang =" (câu hiển thị khi data rỗng/lỗi còn lại "Tất cả danh sách : 0"). Mục Tìm kiếm tương ứng bên tab Fuel Order (sec-12) **không** bị gạch — hai tab đang lệch nhau về quy tắc reset trang. [Cần làm rõ: hiệu lực quy tắc sau khi gạch bỏ và tính nhất quán giữa 2 tab]
