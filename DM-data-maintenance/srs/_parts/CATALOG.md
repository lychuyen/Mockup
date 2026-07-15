---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-02"
status: "Draft"
document_type: "SRS Content Catalog"
subsystem: "Data Maintenance (Danh mục dùng chung)"
---

# CATALOG — Phân rã tra cứu SRS Data Maintenance v0.1

> **Mục đích:** Bảng tra cứu theo nội dung (content-based retrieval) trên tài liệu SRS Data Maintenance do người soạn (mã hiệu biểu mẫu VNA.FIMS — **FIMS = TOSS**, BA Lead xác nhận 2026-07-02). Chỉ **tổ chức lại** nội dung đã ghi trong các mảnh `sec-NN-*.md` — không suy diễn, không bổ sung logic (CLAUDE.md §0). Mọi dòng đều dẫn nguồn về file section tương ứng.
>
> **Quy ước đếm (chỉ để tra cứu, không phải nội dung nguồn):**
> - **Số trường** = số dòng thành phần trong bảng "Mô tả chi tiết màn hình" (không tính dòng nhóm/tiêu đề khối; dòng gộp nhiều trường tính 1 dòng; dòng bị gạch bỏ trong nguồn vẫn đếm và được gắn cờ).
> - **Số bước** = số dòng trong bảng "Mô tả luồng xử lý" (một dòng có thể gộp nhiều bước, ví dụ "Bước 7,8").
> - **Đã giải quyết (2026-07-13):** khôi phục file `.docx` gốc từ git history, trích 426/430 ảnh thật (2 ảnh không có trong nguồn — 1 icon ở ULD_TYPE_LIST, 1 icon ở AIRCRAFT_SEARCH) và gắn link trực tiếp vào cả 69 file feature (khớp 100% số placeholder = số ảnh). Riêng ảnh "Sơ đồ luồng hệ thống" (69/69, đúng 1 ảnh/feature) đã được xem trực tiếp và chuyển thành sơ đồ Mermaid (`flowchart TD`) chèn ngay dưới ảnh gốc trong từng file — vừa giữ ảnh gốc (người xem) vừa có bản Mermaid (agent/máy đọc). Ảnh "Màn hình chức năng" và icon trong bảng chỉ gắn link ảnh, không chuyển Mermaid (không phải sơ đồ luồng). Phát hiện thêm trong quá trình xem ảnh: xem §4.5 mục 11–15.

---

## 1. Catalog chức năng

**Sân bay (sec-14 → sec-19)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 1 | Danh sách sân bay | Danh sách | [TOSS.DM.AIRPORT_LIST.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_LIST.FD.v0.1.md) | Xem danh sách sân bay | Danh mục → Sân bay | 22 | 3 | Không có mapping DB/API; ô Actions mô tả "Sửa vai trò/Xóa vai trò" [Cần làm rõ: nghi sao chép từ module vai trò]; tham chiếu kịch bản chung trên Google Docs |
| 2 | Xem chi tiết sân bay | Xem | [TOSS.DM.AIRPORT_DETAIL.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_DETAIL.FD.v0.1.md) | Xem chi tiết sân bay | Click 1 bản ghi trong danh sách | 18 | 5 | Không có mapping (trừ btn_search/btn_refresh); tag trạng thái ghi "Is active"; có tab phân hệ (Meteorology, Minima, CHC infrastructure, Flight procedures…) + block thời tiết/môi trường [Cần làm rõ: phạm vi các tab] |
| 3 | Thêm mới sân bay | Tạo mới | [TOSS.DM.AIRPORT_CREATE.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_CREATE.FD.v0.1.md) | Thêm mới sân bay | Danh mục → Sân bay → "Create new" | 22 | 8 | 6 trường có mapping nhưng **trống kiểu dữ liệu & mô tả** (operating_hours…); mã lỗi VL004/VL006/VL007, TB019–TB021 trỏ Google Docs |
| 4 | Sửa thông tin sân bay | Sửa | [TOSS.DM.AIRPORT_UPDATE.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_UPDATE.FD.v0.1.md) | Sửa thông tin sân bay | Icon "Sửa" tại bản ghi | 17 | 8 | Region/Country name **bắt buộc** tại đây nhưng **không bắt buộc** ở sec-16 [Cần làm rõ: mâu thuẫn nguồn]; không có mapping cho đa số trường |
| 5 | Xóa sân bay | Xóa | [TOSS.DM.AIRPORT_DELETE.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_DELETE.FD.v0.1.md) | Xóa sân bay (kèm lý do) | Xem chi tiết → icon Xóa | 4 | 7 | Xóa mềm `is_delete=true`; mã lỗi VL/TB trỏ Google Docs |
| 6 | Xem lịch sử sân bay | Lịch sử | [TOSS.DM.AIRPORT_HISTORY.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_HISTORY.FD.v0.1.md) | Xem lịch sử thay đổi sân bay | Button/icon "History" | 11 | 4 | Bộ trường log dùng chung (updateAt/operationType/updateDetail/updateBy) |

**Danh mục Phi công (sec-22)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 7 | Xem danh sách Phi công | Danh sách | [TOSS.DM.PILOT_LIST.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_LIST.FD.v0.1.md) | Xem danh sách Phi công | Danh mục → Danh mục Phi công | 36 | 3 | Nhiều nội dung **bị gạch bỏ trong nguồn** (menu Excel edited/Export/Đồng bộ AVES, nhiều filter) [Cần làm rõ: hiệu lực]; điều kiện hiển thị `is_delete=false` |
| 8 | Xem chi tiết Phi công — Thông tin Phi công | Xem | [TOSS.DM.PILOT_DETAIL.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_DETAIL.FD.v0.1.md) | Xem chi tiết PC + hành trình bay 7 ngày | Click 1 bản ghi PC | 33 | 5 | Đồng bộ AVES theo Crewcode (btn_sync_aves); hành trình đồng bộ Nestline 5 phút/lần; quy tắc mapping đội bay theo 3 ký tự cuối |
| 9 | Xem chi tiết Phi công — Lịch sử | Lịch sử | [TOSS.DM.PILOT_HISTORY.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_HISTORY.FD.v0.1.md) | Xem lịch sử cập nhật PC | Tab "History" | 10 | 7 | Log dùng chung (system/time/executor/IP/module/action/updateDetail) |
| 10 | Sửa thông tin Phi công thủ công | Sửa | [TOSS.DM.PILOT_EDIT_MANUAL.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_EDIT_MANUAL.FD.v0.1.md) | Sửa Email/HRMS/Số thẻ ngành của PC | Xem chi tiết → button Sửa | 7 | 7 | Kịch bản trùng Crew code bị gạch bỏ một phần [Cần làm rõ]; VL/TB trỏ Google Docs |
| 11 | Sửa thông tin Phi công bằng excel | Action (import) | [TOSS.DM.PILOT_EDIT_EXCEL.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_EDIT_EXCEL.FD.v0.1.md) | Import excel sửa PC | Button Công cụ → Excel edited | 5 | 6 | Template import trên Google Sheets (external) |

**Danh mục Tiếp viên (sec-23)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 12 | Xem danh sách Tiếp viên | Danh sách | [TOSS.DM.ATTENDANT_LIST.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_LIST.FD.v0.1.md) | Xem danh sách Tiếp viên | Danh mục → Danh mục Tiếp viên | 33 | 3 | Menu Đồng bộ AVES **không bị gạch** (khác PC) [Cần làm rõ: nhất quán PC/TV]; `is_delete=false` |
| 13 | Xem chi tiết Tiếp viên — Thông tin Tiếp viên | Xem | [TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md) | Xem chi tiết TV + hành trình bay | Click 1 bản ghi TV | 33 | 5 | Hành trình "trong vòng 1 tháng hiện tại" nhưng liệt kê Day-1→Day+1 [Cần làm rõ]; Nestline 5 phút/lần |
| 14 | Xem chi tiết Tiếp viên — Lịch sử | Lịch sử | [TOSS.DM.ATTENDANT_HISTORY.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_HISTORY.FD.v0.1.md) | Xem lịch sử cập nhật TV | Tab "History" | 10 | 7 | — |
| 15 | Sửa thông tin Tiếp viên thủ công | Sửa | [TOSS.DM.ATTENDANT_EDIT_MANUAL.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_EDIT_MANUAL.FD.v0.1.md) | Sửa Email/HRMS/Số thẻ ngành của TV | Xem chi tiết → button Sửa | 7 | 7 | Kiểm tra trùng theo Code HRMS (Crew code bị gạch, thay bằng Code HRMS) |
| 16 | Sửa thông tin Tiếp viên bằng excel | Action (import) | [TOSS.DM.ATTENDANT_EDIT_EXCEL.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_EDIT_EXCEL.FD.v0.1.md) | Import excel sửa TV | Button Công cụ → Excel edited | 1 (tham chiếu kịch bản PC) | 6 | Template import trên Google Sheets (external) |

**Danh mục Carrier (sec-24)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 17 | Xem danh sách Carrier | Danh sách | [TOSS.DM.CARRIER_LIST.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_LIST.FD.v0.1.md) | Xem danh sách Carrier | Danh mục → Carrier | 14 | 6 | **Toàn bộ section không có mapping DB/API** |
| 18 | Thêm mới/Sửa Carrier | Tạo mới + Sửa | [TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md) | Thêm/Sửa Carrier (mã, tên, logo, note, status) | Button Thêm mới / icon Sửa | 7 | 8 | Upload logo .JPG/.JPEG/.PNG ≤ 5MB, resize 80x80px; message dùng lẫn ngữ cảnh "Folder thumbnail" [Cần làm rõ] |
| 19 | Xem chi tiết Carrier | Xem | [TOSS.DM.CARRIER_DETAIL.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_DETAIL.FD.v0.1.md) | Xem chi tiết Carrier | Click 1 dòng Carrier | 7 | 4 | Rỗng/lỗi hiện **N/A** (khác chuẩn "để trống" ở section khác) |
| 20 | Xóa Carrier | Xóa | [TOSS.DM.CARRIER_DELETE.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_DELETE.FD.v0.1.md) | Xóa Carrier (kèm lý do) | Icon Xóa | 7 | 7 | Chặn xóa khi Carrier đã gán với user, **FON, E-checklist** [Cần làm rõ: hệ thống liên quan]; content nhắc "Cơ quan đơn vị" (nghi sao chép) |
| 21 | Xem lịch sử Carrier | Lịch sử | [TOSS.DM.CARRIER_HISTORY.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_HISTORY.FD.v0.1.md) | Xem lịch sử Carrier | Icon/button Xem lịch sử | 11 | 4 | Người cập nhật lọc theo user phân quyền "Danh mục Carrier/**MO Plus & EDM**" [Cần làm rõ] |

**Danh mục Quốc gia (sec-25)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 22 | Xem danh sách Quốc gia | Danh sách | [TOSS.DM.COUNTRY_LIST.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_LIST.FD.v0.1.md) | Xem danh sách Quốc gia | Danh mục → Quốc gia | 20 | 3 | File mẫu export trên Google Sheets (external) |
| 23 | Thêm mới Quốc gia | Tạo mới | [TOSS.DM.COUNTRY_CREATE.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_CREATE.FD.v0.1.md) | Thêm mới quốc gia | Button "Thêm mới" | 8 | 8 | Abbreviation "Không bắt buộc" nhưng Action lại có IM VL004 khi trống [Cần làm rõ] |
| 24 | Sửa Quốc gia | Sửa | [TOSS.DM.COUNTRY_EDIT.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_EDIT.FD.v0.1.md) | Sửa thông tin quốc gia | Icon "Sửa" | 7 | 8 | — |
| 25 | Xóa Quốc gia | Xóa | [TOSS.DM.COUNTRY_DELETE.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_DELETE.FD.v0.1.md) | Xóa quốc gia (kèm lý do) | Icon Xóa | 4 | 7 | Chặn xóa khi Country đã gán bản ghi FIR (TB022); xóa mềm `is_delete=true` |
| 26 | Xem chi tiết Quốc gia | Xem | [TOSS.DM.COUNTRY_DETAIL.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_DETAIL.FD.v0.1.md) | Xem chi tiết quốc gia | Click 1 bản ghi | 7 | 5 | — |

**Danh mục FIR (sec-26)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 27 | Xem danh sách FIR | Danh sách | [TOSS.DM.FIR_LIST.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_LIST.FD.v0.1.md) | Xem danh sách FIR | Danh mục → FIR | 23 | 3 | Lower/Upper Limit không có mapping |
| 28 | Thêm mới FIR | Tạo mới | [TOSS.DM.FIR_CREATE.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_CREATE.FD.v0.1.md) | Thêm mới FIR | Button "Add New" | 14 | 8 | Trường ICAO mapping `region_type_id/regionTypeId` (Thêm mới) nhưng `icao_code` (Sửa/Chi tiết) [Cần làm rõ: 2 mapping cho 1 trường]; ANSP/Lower/Upper "Không bắt buộc" nhưng Action có IM VL004 khi trống [Cần làm rõ] |
| 29 | Sửa FIR | Sửa | [TOSS.DM.FIR_EDIT.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_EDIT.FD.v0.1.md) | Sửa thông tin FIR | Icon "Edit" | 14 | 8 | FIR code không cho phép sửa; message IM Lower/Upper dùng "tên FIR đã tồn tại" [Cần làm rõ: nghi sao chép] |
| 30 | Xóa FIR | Xóa | [TOSS.DM.FIR_DELETE.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_DELETE.FD.v0.1.md) | Xóa FIR (kèm lý do) | Xem chi tiết → icon Xóa | 4 | 7 | Title popup ghi "delete the country" [Cần làm rõ: nghi sao chép từ Quốc gia]; xóa mềm `is_delete=true` |
| 31 | Xem chi tiết FIR | Xem | [TOSS.DM.FIR_DETAIL.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_DETAIL.FD.v0.1.md) | Xem chi tiết FIR | Click 1 bản ghi | 14 | 5 | — |

**Danh sách Email (sec-27)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 32 | Xem danh sách Email | Danh sách | [TOSS.DM.EMAIL_LIST.FD.v0.1.md](TOSS.DM.EMAIL/TOSS.DM.EMAIL_LIST.FD.v0.1.md) | Xem danh sách Email hệ thống | Danh mục → Email | 11 | 5 | Luôn tồn tại đúng 1 email Active làm mặc định |
| 33 | Xem chi tiết Email | Xem | [TOSS.DM.EMAIL_DETAIL.FD.v0.1.md](TOSS.DM.EMAIL/TOSS.DM.EMAIL_DETAIL.FD.v0.1.md) | Xem chi tiết Email | Click 1 dòng Email | 8 | 4 | Password hiển thị dạng mã hóa |
| 34 | Thêm mới/Sửa Email | Tạo mới + Sửa | [TOSS.DM.EMAIL_ADD_EDIT.FD.v0.1.md](TOSS.DM.EMAIL/TOSS.DM.EMAIL_ADD_EDIT.FD.v0.1.md) | Add/Edit Email + password + set default | Add new / icon Edit | 7 | 8 | Bắt buộc domain nội bộ @vietnamairlines.com; chỉ 1 email Active default (TB024); password 8–32 ký tự có hoa/thường/số/ký tự đặc biệt |
| 35 | Xem lịch sử Email | Lịch sử | [TOSS.DM.EMAIL_HISTORY.FD.v0.1.md](TOSS.DM.EMAIL/TOSS.DM.EMAIL_HISTORY.FD.v0.1.md) | Xem lịch sử Email | Icon/button History | 11 | 4 | — |

**Danh mục loại ULD (sec-28)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 36 | Xem danh sách loại ULD | Danh sách | [TOSS.DM.ULD_TYPE_LIST.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_LIST.FD.v0.1.md) | Xem danh sách ULD Type | Danh mục → ULD Type | 17 | 3 | Trường dữ liệu **không có mapping** (chỉ btn_export/btn_create); 1 dòng gộp 4 trường số (Tare Weight/Max Gross/Volume/Width) |
| 37 | Thêm mới ULD Type | Tạo mới | [TOSS.DM.ULD_TYPE_CREATE.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_CREATE.FD.v0.1.md) | Thêm mới ULD Type | Button "Thêm mới" | 12 | 8 | Quy tắc số: số thực dương, dấu chấm thập phân, 15 số nguyên + 4 số thập phân; trạng thái ẩn ở form Thêm mới |
| 38 | Sửa ULD Type | Sửa | [TOSS.DM.ULD_TYPE_EDIT.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_EDIT.FD.v0.1.md) | Sửa ULD Type | Icon "Sửa" | 12 | 8 | ULD Type code/ULD Type không cho sửa; chặn Inactive khi đang gắn [n] ULD; IM Description dùng "tên FIR" [Cần làm rõ: nghi sao chép] |
| 39 | Xóa ULD Type | Xóa | [TOSS.DM.ULD_TYPE_DELETE.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_DELETE.FD.v0.1.md) | Xóa ULD Type (kèm lý do) | Icon Xóa | 4 | 7 | Chặn xóa khi gắn bản ghi ULD (TB022); xóa mềm `is_delete=true` |
| 40 | Xem chi tiết ULD Type | Xem | [TOSS.DM.ULD_TYPE_DETAIL.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_DETAIL.FD.v0.1.md) | Xem chi tiết ULD Type | Click 1 bản ghi | 10 | 5 | 1 dòng gộp 9 trường kích thước/trọng lượng |

**Danh mục ULD (sec-29)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 41 | Xem danh sách ULD | Danh sách | [TOSS.DM.ULD_LIST.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_LIST.FD.v0.1.md) | Xem danh sách ULD | Danh mục → ULD | 17 | 3 | Trường dữ liệu không có mapping; TB004/TB005 cho export |
| 42 | Thêm mới ULD | Tạo mới | [TOSS.DM.ULD_CREATE.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_CREATE.FD.v0.1.md) | Thêm mới ULD + bảng Serial Number | Button "Thêm mới" | 14 | 8 | ULD Code theo regex IATA `^[A-Z]{3}[0-9]{4,5}[A-Z]{2,3}$`; import Serial Number bằng excel (template Google Sheets, 2 cột Serial Number & Owner code, ≤5MB, tối đa 10 tệp) |
| 43 | Sửa ULD | Sửa | [TOSS.DM.ULD_EDIT.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_EDIT.FD.v0.1.md) | Sửa ULD | Icon "Sửa" | 14 | 8 | ULD Type/ULD Code/Current Location không cho sửa; trạng thái ghi "Active/Deactive" [Cần làm rõ: thuật ngữ] |
| 44 | Xóa ULD | Xóa | [TOSS.DM.ULD_DELETE.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_DELETE.FD.v0.1.md) | Xóa ULD (kèm lý do) | Icon Xóa | 4 | 7 | Chặn xóa khi ULD gắn FlightPlan/Danh sách chuyến bay (TB022); xóa mềm `is_delete=true` |
| 45 | Xem chi tiết ULD | Xem | [TOSS.DM.ULD_DETAIL.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_DETAIL.FD.v0.1.md) | Xem chi tiết ULD + Serial list | Click 1 bản ghi | 9 | 5 | — |

**Danh mục chặng bay (sec-30)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 46 | Xem danh sách chặng bay | Danh sách | [TOSS.DM.SECTOR_LIST.FD.v0.1.md](TOSS.DM.SECTOR/TOSS.DM.SECTOR_LIST.FD.v0.1.md) | Xem danh sách chặng bay | Danh mục → Chặng bay | 21 | 5 | Mô tả đầu module nói có "Xem chi tiết và Xem lịch sử" nhưng **không có đặc tả** trong nguồn [Cần làm rõ] |
| 47 | Thêm mới/sửa chặng bay | Tạo mới + Sửa | [TOSS.DM.SECTOR_ADD_EDIT.FD.v0.1.md](TOSS.DM.SECTOR/TOSS.DM.SECTOR_ADD_EDIT.FD.v0.1.md) | Thêm/Sửa chặng bay | Button Thêm mới / icon Sửa | 11 | 8 | International & Domestic loại trừ nhau; Departure ≠ Arrival; Flight code không sửa khi Edit |
| 48 | Xóa chặng bay | Xóa | [TOSS.DM.SECTOR_DELETE.FD.v0.1.md](TOSS.DM.SECTOR/TOSS.DM.SECTOR_DELETE.FD.v0.1.md) | Xóa chặng bay (kèm lý do) | Icon Xóa | 5 | 8 | Bảng chi tiết màn hình thiếu cột Mapping DB/API (format khác chuẩn) |

**Danh mục đội bay (sec-31)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 49 | Xem danh sách Đội bay | Danh sách | [TOSS.DM.FLEET_LIST.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_LIST.FD.v0.1.md) | Xem danh sách Đội bay | Danh mục → Đội bay | 17 | 6 | File mẫu export Google Sheets (external) |
| 50 | Xem chi tiết Đội bay | Xem | [TOSS.DM.FLEET_DETAIL.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_DETAIL.FD.v0.1.md) | Xem chi tiết Đội bay + danh sách tàu bay thuộc đội | Click 1 dòng Đội bay | 18 | 4 | — |
| 51 | Thêm/Sửa Đội bay | Tạo mới + Sửa | [TOSS.DM.FLEET_ADD_EDIT.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_ADD_EDIT.FD.v0.1.md) | Thêm/Sửa Đội bay | Button Thêm mới / icon Sửa | 7 | 8 | Flight Fleet Code không cho nhập space |
| 52 | Xoá Đội bay | Xóa | [TOSS.DM.FLEET_DELETE.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_DELETE.FD.v0.1.md) | Xóa Đội bay (kèm lý do) | Icon Xóa | 7 | 8 | Chặn xóa khi Flight Fleet Code gắn [n] AC Subtype |
| 53 | Xem lịch sử Đội bay | Lịch sử | [TOSS.DM.FLEET_HISTORY.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_HISTORY.FD.v0.1.md) | Xem lịch sử Đội bay | Icon "Xem" / button tại chi tiết | 11 | 4 | — |
| 54 | Thêm/Sửa Tàu bay (trong Đội bay) | Tạo mới + Sửa | [TOSS.DM.AIRCRAFT_IN_FLEET_ADD_EDIT.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.AIRCRAFT_IN_FLEET_ADD_EDIT.FD.v0.1.md) | Thêm/Sửa tàu bay của Đội bay | Chi tiết Đội bay → Thêm mới/Sửa tàu bay | 7 | 8 | IATA Designator TH Sửa hiển thị `[flightfleet_code]` [Cần làm rõ: nghi lỗi nguồn] |
| 55 | Xoá Tàu bay (trong Đội bay) | Xóa | [TOSS.DM.AIRCRAFT_IN_FLEET_DELETE.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.AIRCRAFT_IN_FLEET_DELETE.FD.v0.1.md) | Xóa tàu bay khỏi Đội bay | Chi tiết Đội bay → icon Xóa | 7 | 7 | Xóa mềm `is_delete=true`; error khi tàu bay đã liên kết chức năng khác |

**Danh mục AC Subtype (sec-32)** — xem [tổng quan nhóm + sơ đồ quan hệ giữa 3 chức năng](TOSS.DM.AC_SUBTYPE/TOSS.DM.AC_SUBTYPE.MD.v0.1.md) (không tính vào số đếm "chức năng" dưới đây — file tổng hợp, không phải feature riêng)

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 56 | Xem danh sách AC Subtype | Danh sách | [TOSS.DM.AC_SUBTYPE_LIST.FD.v0.1.md](TOSS.DM.AC_SUBTYPE/TOSS.DM.AC_SUBTYPE_LIST.FD.v0.1.md) | Xem/tìm kiếm/xuất excel AC Subtype | Danh mục → AC Subtype | 16 | 6 | Placeholder ô "Search AC Subtype Name" ghi nhầm "Search by AC Subtype Code" [Cần làm rõ] |
| 57 | Thêm mới/Sửa AC Subtype | Tạo mới + Sửa | [TOSS.DM.AC_SUBTYPE_ADD_EDIT.FD.v0.1.md](TOSS.DM.AC_SUBTYPE/TOSS.DM.AC_SUBTYPE_ADD_EDIT.FD.v0.1.md) | Thêm/Sửa AC Subtype | Button Thêm mới / icon Sửa | 8 | 8 | Aircraft Type lấy từ [Flight fleet code] của Danh mục Đội bay; AC Subtype code không cho sửa |
| 58 | Xóa AC Subtype | Xóa | [TOSS.DM.AC_SUBTYPE_DELETE.FD.v0.1.md](TOSS.DM.AC_SUBTYPE/TOSS.DM.AC_SUBTYPE_DELETE.FD.v0.1.md) | Xóa AC Subtype (kèm lý do) | Icon Xóa | 7 | 6 | Kiểm tra ràng buộc trước khi xóa (TB022) |

**Quản lý Tàu bay (sec-33)**

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 59 | Danh sách tàu bay | Danh sách | [TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md) | Xem/tìm/xuất excel danh sách tàu bay | Data Maintenance → Quản lý tàu bay | 11 | 3 | AC Registration + AC Subtype đồng bộ từ lịch bay **Netline ops++** (section dùng mã hiệu TOSS/Data Maintenance — FIMS = TOSS, BA Lead xác nhận) |
| 60 | Xem chi tiết tàu bay — tab General Information | Xem | [TOSS.DM.AIRCRAFT_DETAIL_GENERAL.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_DETAIL_GENERAL.FD.v0.1.md) | Xem General Information | Chi tiết tàu bay → tab General Information | 11 | 6 | Valid From/To đồng bộ Netline ops++ |
| 61 | Xem chi tiết tàu bay — tab Aircraft Configuration | Xem | [TOSS.DM.AIRCRAFT_DETAIL_CONFIG.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_DETAIL_CONFIG.FD.v0.1.md) | Xem Technical Parameters / Cabin / ACARS Fuel | Chi tiết tàu bay → tab Aircraft Configuration | 17 | 6 | 3 block: Technical Parameters, Cabin Configuration, ACARS Fuel Limit & Fuel Multiplier (From–To liên tiếp, không hở/không chồng lấn) |
| 62 | Xem chi tiết tàu bay — tab Group Attributes | Xem | [TOSS.DM.AIRCRAFT_DETAIL_ATTRIBUTES.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_DETAIL_ATTRIBUTES.FD.v0.1.md) | Xem Aircraft Category 1–5 + Fleet | Chi tiết tàu bay → tab Group Attributes | 8 | 6 | — |
| 63 | Sửa tàu bay — tab General Information | Sửa | [TOSS.DM.AIRCRAFT_EDIT_GENERAL.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_EDIT_GENERAL.FD.v0.1.md) | Sửa General Information | Tab General Information → button Sửa | 13 | 11 | Ownership Status: Owned/Wet Leased/Dry Leased; Owned ⇒ Owner mặc định "Vietnam Airlines"; khóa các tab khác khi đang edit; lưu log Old/New value |
| 64 | Sửa tàu bay — tab Aircraft Configuration | Sửa | [TOSS.DM.AIRCRAFT_EDIT_CONFIG.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_EDIT_CONFIG.FD.v0.1.md) | Sửa Technical/Cabin/ACARS Fuel | Tab Aircraft Configuration → button Sửa | 25 | 11 | From/To không cho sửa (kịch bản sửa From/To bị gạch bỏ); lưu log per-block |
| 65 | Thêm mới ACARS Fuel Limit & Fuel Multiplier | Tạo mới | [TOSS.DM.ACARS_FUEL_LIMIT_CREATE.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.ACARS_FUEL_LIMIT_CREATE.FD.v0.1.md) | Thêm khoảng thời gian Fuel Limit/Multiplier | Edit ACARS → button Add Time Period | 7 | 11 | From phải ngay sau To của dòng cuối; không trùng khoảng đã cấu hình; khoảng của bản ghi đã xóa được chọn lại |
| 66 | Xóa ACARS Fuel Limit & Fuel Multiplier | Xóa | [TOSS.DM.ACARS_FUEL_LIMIT_DELETE.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.ACARS_FUEL_LIMIT_DELETE.FD.v0.1.md) | Xóa khoảng Fuel Limit/Multiplier (kèm lý do) | Edit ACARS → icon Xóa | 7 | 9 | Chỉ xóa bản ghi cuối cùng (từ dưới lên); **xóa cứng** + lưu log; Reason tối đa 300 ký tự (khác chuẩn 1000) |
| 67 | Sửa tàu bay — tab Group Attributes | Sửa | [TOSS.DM.AIRCRAFT_EDIT_ATTRIBUTES.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_EDIT_ATTRIBUTES.FD.v0.1.md) | Sửa Aircraft Category 1–5 + Fleet | Tab Group Attributes → button Sửa | 10 | 11 | Danh sách giá trị cố định per Category (A320NEO…B787-10; 320/32B/32D/32N/350/787…) |
| 68 | Change History (Tàu bay) | Lịch sử | [TOSS.DM.AIRCRAFT_HISTORY.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_HISTORY.FD.v0.1.md) | Xem lịch sử chỉnh sửa tàu bay | Chi tiết tàu bay → tab History | 21 | 6 | Log chuẩn Date/Time·Changed By·Section·Action·Field·Old/New value; export excel template Google Sheets |
| 69 | Tìm kiếm tàu bay | Action (tìm kiếm) | [TOSS.DM.AIRCRAFT_SEARCH.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_SEARCH.FD.v0.1.md) | Lọc danh sách theo 8 tiêu chí | Bộ lọc màn danh sách tàu bay | 11 | 5 | Category 2–5 ghi "Dropdown (multi-select)" nhưng mô tả "chỉ cho phép chọn 1 giá trị" [Cần làm rõ] |

**Quản lý tàu bay — APU INOP (BR-420 — không có `sec-NN` gốc, khác nguồn trích xuất với 13 nhóm còn lại)**

> **[Cập nhật 2026-07-15 — chỉ đạo trực tiếp BA Lead, KHÔNG phải trích từ BR-420 gốc]** Bổ sung state machine 4 trạng thái xử lý (Hỏng — chưa sửa chữa → Đang sửa chữa → Đã khôi phục — chờ xác nhận → Đã xác nhận khôi phục, thay cho tính toán Active/Closed trực tiếp từ `to_date`) + 2 mã định danh tự sinh (Mã khai báo toàn cục `APU-YYYY-NNNN`, Lần khai báo riêng theo tàu bay) trên các Function Document liên quan. Xem chi tiết §Nghiệp vụ chính trong `TOSS.DM.APU_INOP_LIST.FD.v0.1.md` và §2.12 dưới đây.
>
> **[Cập nhật 2026-07-15 (tiếp) — tách file Sửa/Xóa]** File gộp `EDIT` (Sửa+Xóa) ban đầu đã tách thành 2 file riêng — `TOSS.DM.APU_INOP_EDIT.FD.v0.1.md` (chỉ Sửa) + `TOSS.DM.APU_INOP_DELETE.FD.v0.1.md` (chỉ Xóa) — khớp quy ước tách file mà 14 nhóm khác của module đều dùng. File `FILTER` không tồn tại trên đĩa (nội dung trùng lặp với bộ lọc đã có sẵn trong LIST — xem §4.6 điểm 2), không đăng ký vào bảng dưới đây.

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước | Cờ |
|---|---|---|---|---|---|---|---|---|
| 70 | Danh sách khai báo APU INOP | Danh sách | [TOSS.DM.APU_INOP_LIST.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_LIST.FD.v0.1.md) | Xem danh sách khai báo tàu bay hỏng APU (Active/Closed) | Danh mục Tàu bay → APU INOP | 8 | 4 | **[v0.2]** Trạng thái Active/Closed nay là nhãn tổng hợp gom từ trường lưu trữ "Trạng thái xử lý" (4 giá trị, không còn tính trực tiếp từ `to_date`); **[Đã xử lý]** bảng "Mô tả chi tiết màn hình" đã bổ sung dòng Button Export (STT 3) khớp Trigger mô tả ở #74 (EXPORT); nguồn dẫn **BR-420** (không phải `sec-NN` như 13 nhóm khác của module) |
| 71 | Tạo khai báo APU INOP | Tạo mới | [TOSS.DM.APU_INOP_CREATE.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_CREATE.FD.v0.1.md) | Khai báo tàu bay hỏng APU theo khoảng thời gian, kèm ghi chú | Nút "Thêm mới" trên màn Danh sách | 6 | 6 | Mã tàu bay chọn từ "danh mục tàu bay đang khai thác" (phụ thuộc nhóm `TOSS.DM.AIRCRAFT`, không phải link markdown — trích dẫn văn bản); **[v0.2]** tự sinh Mã khai báo + Lần khai báo khi lưu, khởi tạo Trạng thái xử lý = "Hỏng — chưa sửa chữa" |
| 72 | Sửa khai báo APU INOP | Sửa | [TOSS.DM.APU_INOP_EDIT.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_EDIT.FD.v0.1.md) | Cập nhật Trạng thái xử lý/Đến ngày/Ghi chú | Nút Sửa trên dòng bản ghi | 3 | 6 | **[v0.3 — tách khỏi Xóa]** File nay chỉ còn luồng Sửa, khớp quy ước tách file của 14 nhóm khác (xem #73 DELETE); Mã tàu bay + Từ ngày + Mã khai báo + Lần khai báo khóa không cho sửa sau khi tạo; **[v0.4 — BA Lead xác nhận 2026-07-15]** Chuyển Trạng thái xử lý là **tự do** — Dropdown cho chọn bất kỳ 1 trong 4 giá trị, không ràng buộc thứ tự tuần tự |
| 73 | Xóa khai báo APU INOP | Xóa | [TOSS.DM.APU_INOP_DELETE.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_DELETE.FD.v0.1.md) | Xóa khai báo không còn cần thiết | Nút Xóa trên dòng bản ghi | 0 (chỉ xác nhận) | 5 | Tách 2026-07-15 từ file gộp EDIT (Sửa+Xóa) — không đổi nội dung nghiệp vụ, chỉ tổ chức lại theo đúng quy ước tách file Sửa/Xóa riêng của module |
| 74 | Xuất Excel danh sách APU INOP | Action (export) | [TOSS.DM.APU_INOP_EXPORT.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_EXPORT.FD.v0.1.md) | Xuất danh sách (theo bộ lọc hiện tại) ra file `.xlsx` | Nút Export trên màn Danh sách | 7 | 5 | **[Đã xử lý]** Trigger mô tả nút Export nằm trên màn LIST — LIST #70 đã bổ sung dòng Button Export (STT 3), có link markdown thật tới file này; tên file `FIMS_APU_INOP_ddmmyy_hhmmss.xlsx`; **[v0.2]** thêm 3 cột xuất Mã khai báo/Lần khai báo/Trạng thái xử lý |

**Tổng: 74 chức năng** (Sân bay 6 · Phi công 5 · Tiếp viên 5 · Carrier 5 · Quốc gia 5 · FIR 5 · Email 4 · Loại ULD 5 · ULD 5 · Chặng bay 3 · Đội bay 7 · AC Subtype 3 · Tàu bay 11 · APU INOP 5).

---

## 2. Từ điển trường (Data Dictionary)

> Khử trùng lặp theo cột **Mapping DB/API** trên toàn module. Chỉ liệt kê trường có **tên + mapping thật** trong bảng "Mô tả chi tiết màn hình" của nguồn; loại trừ mapping nút bấm (`btn_*`). Trường chỉ hiển thị (view) không ghi bắt buộc ⇒ "—". Ký hiệu nguồn: SB=Sân bay (sec-14→19), PC=sec-22, TV=sec-23, QG=sec-25, FIR=sec-26, EM=sec-27, CB=sec-30, DB=sec-31, ACS=sec-32, TB=sec-33.

### 2.1 Thực thể Sân bay

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| IATA Code | iata_code | Textbox [10] | Bắt buộc | SB: Thêm mới (sec-16) |
| ICAO Code | icao_code | Textbox [10] | Bắt buộc | SB: Thêm mới (sec-16) · FIR: cột ICAO Region/ICAO dùng cùng mapping (sec-26) [Cần làm rõ: trùng tên mapping 2 thực thể] |
| Airport Name | airport_name | TextBox [100] | Bắt buộc | SB: Thêm mới (sec-16) |
| Region | region | DDL | Không bắt buộc (sec-16) / Bắt buộc (sec-17) [Cần làm rõ: mâu thuẫn] | SB: Thêm mới, Sửa |
| Country code | country_code | Textbox [10] | Không bắt buộc | SB: Thêm mới, Sửa (sec-16, 17) |
| Country name | country_name | DDL [100] | Không bắt buộc (sec-16, nhưng có IM khi trống) / Bắt buộc (sec-17) [Cần làm rõ] | SB: Thêm mới, Sửa |
| Fleets | fleet | DDL | Bắt buộc | SB: Thêm mới, Sửa (sec-16, 17) |
| Main Base | main_base / mainBase | Toggle switch (SB) · Textview (PC/TV) | — (SB mặc định No) | SB: Thêm mới (sec-16) · PC, TV: cột danh sách |
| Active | is_active / isActive | Toggle switch | — | SB: Thêm mới, Sửa (sec-16, 17) |
| Khung giờ cho phép khai thác | operating_hours | *(trống)* | *(trống)* | SB: Thêm mới (sec-16) — [Cần làm rõ: trống kiểu dữ liệu & mô tả] |
| Thông số đường băng | runway_specifications | *(trống)* | *(trống)* | SB: Thêm mới (sec-16) — [Cần làm rõ] |
| Chướng ngại vật | obstacles | *(trống)* | *(trống)* | SB: Thêm mới (sec-16) — [Cần làm rõ] |
| Thiết bị mặt đất đáp ứng | ground_equipment | *(trống)* | *(trống)* | SB: Thêm mới (sec-16) — [Cần làm rõ] |
| Có nạp nhiên liệu | is_fuel_available | *(trống)* | *(trống)* | SB: Thêm mới (sec-16) — [Cần làm rõ] |
| Các thông tin khai thác khác | other_operational_info | *(trống)* | *(trống)* | SB: Thêm mới (sec-16) — [Cần làm rõ] |

### 2.2 Trường log / lịch sử dùng chung

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| Thời gian cập nhật | updated_at / updateAt | Datepicker (lọc) · Textview | — | SB: Lịch sử (sec-19) · QG: danh sách (sec-25) · EM: Lịch sử (sec-27) |
| Nghiệp vụ ghi nhận | operation_type / operationType | Dropdown list · Textview | — | SB: Lịch sử (sec-19) · EM: Lịch sử (sec-27) |
| Chi tiết cập nhật | update_detail / updateDetail | Textbox [255] · Textview | — | SB: Lịch sử (sec-19) · PC, TV: Lịch sử · EM: Lịch sử |
| Người cập nhật | updated_by / updateBy | Combobox · Textview | — | SB: Lịch sử (sec-19) · QG: danh sách · EM: Lịch sử |
| System | system_name / systemName | Textview | — | PC, TV: Lịch sử |
| Time | action_time / actionTime | Textview (dd/mm/yyyy hh:mm) | — | PC, TV: Lịch sử |
| Executor | executor | Textview | — | PC, TV: Lịch sử |
| Device IP | ip_address / ipAddress | Textview | — | PC, TV: Lịch sử |
| Module Actions | module_name / moduleName | Textview | — | PC, TV: Lịch sử |
| Action | action_type / actionType | Textview | — | PC, TV: Lịch sử |
| Reason (lý do xóa) | reason | Text Area [1000] ([300] ở Xóa ACARS Fuel) | Bắt buộc | QG, FIR: Xóa · ULD Type, ULD: Xóa · TB: Xóa ACARS Fuel |

### 2.3 Thực thể Phi công / Tiếp viên

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| Pilot Code | pilot_code / pilotCode | Textbox [20] · Textview | — | PC: Danh sách |
| Full name | full_name / fullName | Textbox [100] · Textview | — | PC, TV: Danh sách, Chi tiết |
| Birth Date | date_of_birth / dateOfBirth | Datepicker (gạch bỏ ở filter) · Textview | — | PC, TV: Danh sách |
| Gender | gender | DDL · Textview (M: Nam; F: Nữ) | — | PC, TV: Danh sách |
| Position | position | Dropdown · Textview | — | PC, TV: Danh sách, Chi tiết |
| Phone number | phone_number / phoneNumber | Textview ((+84)xxx.xxx.xxx) | — | PC, TV: Danh sách, Chi tiết |
| Email | email | Textbox [100] | Bắt buộc (Sửa PC/TV; EM: định dạng @vietnamairlines.com) | PC, TV: Danh sách, Chi tiết, Sửa · EM: Danh sách, Thêm/Sửa |
| HRMS code | hrms_code / hrmsCode | Textbox [50] · Textview | Bắt buộc (Sửa thủ công) | PC, TV: Danh sách, Chi tiết, Sửa |
| Industry Card Number | industry_card_number / industryCardNumber | Textbox [50] · Textview | Bắt buộc (Sửa thủ công) | PC, TV: Danh sách, Chi tiết, Sửa |
| Carrier | carrier | Textbox [100] · Textview | — | PC, TV: Danh sách |
| Fleet (Đội tàu bay) | fleet / rank | Textview (parse "350:X,787:X…", map 3 ký tự cuối với Danh mục đội bay) | — | PC, TV: Danh sách, Chi tiết |
| Trạng thái hoạt động | active_status | DDL [Active, Inactive] · Toggle · TagStatus | — | PC, TV: Danh sách, Chi tiết |
| Avatar (PC) | pilot_avatar / pilotAvatar | *(trống kiểu)* | — | PC: Chi tiết |
| Avatar (TV) | flight_attendant_avatar / flightAttendantAvatar | *(trống kiểu)* | — | TV: Chi tiết |
| Crew code (Code AVES) | crew_code / crewCode | Textview | — | PC, TV: Chi tiết |
| Cabin code (filter) | flight_attendant_code / flighAttendantCode | Textbox [20] | — | TV: Danh sách (ô lọc) [Cần làm rõ: 2 mapping cho cùng trường Cabin code] |
| Cabin code (cột) | cabin_code | Textview | — | TV: Danh sách (cột) |
| Last Access Time | last_access_time | Textview (dd/mm/yyyy - hh:mm) | — | TV: Danh sách (PC: cột cùng tên không có mapping) |

### 2.4 Hành trình bay (chi tiết PC/TV)

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| Aircraft | aircraft_type / aircraftType | Textbox [20] · Textview | — | PC, TV: Chi tiết (hành trình bay) |
| Aircraft Registration Number | aircraft_registration_number / aircraftRegistrationNumber | Textbox [20] · Textview | — | PC, TV: Chi tiết |
| Flight Number | flight_number / flightNumber | Textbox [20] · Textview | — | PC, TV: Chi tiết |
| Takeoff Time | takeoff_time / takeoffTime | DateTimePicker · Textview (giờ dự kiến/thực tế theo status) | — | PC, TV: Chi tiết |
| Landing Time | landing_time / landingTime | DateTimePicker · Textview | — | PC, TV: Chi tiết |
| Departure Airport | departure_airport / departureAirport | Textbox [20] · Textview · Combobox/Dropdown (CB) | Bắt buộc chọn (CB: Thêm/Sửa, ≠ Arrival) | PC, TV: Chi tiết · CB: Danh sách, Thêm/Sửa |
| Arrival/Destination Airport | arrival_airport / arrivalAirport | Textbox [20] · Textview · Combobox/Dropdown (CB) | Bắt buộc chọn (CB: Thêm/Sửa, ≠ Departure) | PC, TV: Chi tiết · CB: Danh sách, Thêm/Sửa |
| Status chuyến bay | state | DDL [Completed/Complete, Flying, Not yet taken off] · TagState | — | PC, TV: Chi tiết |

### 2.5 Thực thể Quốc gia

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| Country code | country_code / countryCode | TextBox [0;20] · Textview | Bắt buộc | QG: Danh sách, Thêm mới, Sửa, Chi tiết |
| Country name | country_name / countryName | TextBox [0;100] · Textview | Bắt buộc | QG: Danh sách, Thêm mới, Sửa, Chi tiết |
| Abbreviation | abbreviation_name / abbreviationName | TextBox [0;100] · Textview | Không bắt buộc (Action có IM VL004 — [Cần làm rõ]) | QG: Danh sách, Thêm mới, Sửa, Chi tiết |
| Status (trạng thái danh mục) | status | Dropdownlist · Toggle Switch · Tag | — | QG, FIR, EM: Danh sách/Thêm/Sửa/Chi tiết · TB: Danh sách, Chi tiết, Sửa GI |

### 2.6 Thực thể FIR

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| FIR code | fir_code / firCode | TextBox [20] · Textview | Bắt buộc (không sửa được khi Edit) | FIR: Danh sách, Thêm, Sửa, Chi tiết |
| FIR name | fir_name / firName | TextBox [100] · Textview | Bắt buộc | FIR: Danh sách, Thêm, Sửa, Chi tiết |
| Country (FIR) | country_id / countryId | DDL · Combobox | Bắt buộc chọn | FIR: Danh sách, Thêm, Sửa, Chi tiết |
| ACC center | acc_center / accCenter | TextBox [100] · Textview | Không bắt buộc | FIR: Danh sách, Thêm, Sửa, Chi tiết |
| ANSP | ansp | Textbox [100] · Textview | Không bắt buộc (Action có IM VL004 — [Cần làm rõ]) | FIR: Thêm, Sửa, Chi tiết |
| ICAO (Thêm mới FIR) | region_type_id / regionTypeId | DDL | Không bắt buộc | FIR: Thêm mới — [Cần làm rõ: Sửa/Chi tiết dùng mapping `icao_code`] |
| FIR type | fir_type | Dropdownlist [Continental, Oceanic] · Textview | Không bắt buộc | FIR: Danh sách, Thêm, Sửa, Chi tiết |
| Lower Limit | lower_limit | Textbox [100] · Textview | Không bắt buộc | FIR: Chi tiết (Thêm/Sửa: cùng trường nhưng trống mapping) |
| Upper Limit | upper_limit | Textbox [100] · Textview | Không bắt buộc | FIR: Chi tiết |

### 2.7 Thực thể Email

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| Password | password | Textbox [8;32] | Bắt buộc (hoa + thường + số + ký tự đặc biệt) | EM: Chi tiết, Thêm/Sửa |
| Note | note | Textbox [0;3000] (EM) · Textview | Không bắt buộc | EM: Danh sách, Chi tiết, Thêm/Sửa · DB: Danh sách, Chi tiết |
| Set default | set_default | Checkbox | — (mặc định uncheck) | EM: Thêm/Sửa |

### 2.8 Thực thể Chặng bay

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| Flight Code | flight_code | TextBox [0;10] · Textview | Bắt buộc (không sửa khi Edit) | CB: Danh sách, Thêm/Sửa |
| International | international | DDL (lọc) · Toggle | — (loại trừ với Domestic) | CB: Danh sách, Thêm/Sửa |
| Domestic | domestic | DDL (lọc) · Toggle | — (loại trừ với International) | CB: Danh sách, Thêm/Sửa |
| EDTO | edto | DDL (lọc) · Toggle | — | CB: Danh sách, Thêm/Sửa |

### 2.9 Thực thể Đội bay & Tàu bay trong đội

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| Flight Fleet Code | flightfleet_code | Searchbox/Textbox [20] · Textview | Bắt buộc (không space) | DB: Danh sách, Chi tiết, Thêm/Sửa |
| Flight Fleet Name | flightfleet_name | Searchbox/Textbox · Textview | Bắt buộc | DB: Danh sách, Chi tiết, Thêm/Sửa |
| Number of Registration | numberof_registration | Textbox [20] · Textview | Bắt buộc | DB: Danh sách, Chi tiết, Thêm/Sửa |
| Creation date | creation_date | Textview | — | DB: Chi tiết |
| Last updated | last_updated | Textview | — | DB: Chi tiết |
| Registration | registration | Textbox [20] · Textview | Bắt buộc | DB: Chi tiết (danh sách tàu bay), Thêm/Sửa Tàu bay |
| ICAO Designator | icao_Designator | Textbox [20] · Textview | Bắt buộc | DB: Chi tiết, Thêm/Sửa Tàu bay |
| IATA Designator | iata_Designator | Textbox [20] · Textview | Bắt buộc | DB: Chi tiết, Thêm/Sửa Tàu bay |
| Trạng thái (hiển thị tag) | tagstatus | Textview/Tag | — | DB: Danh sách, Chi tiết |

### 2.10 Thực thể AC Subtype

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| AC Subtype Code | ac_subtype_code | Textview (danh sách) · Textbox (thêm; không sửa khi Edit) | Bắt buộc | ACS: Danh sách, Thêm/Sửa |
| AC Subtype Name | ac_subtype_name | Textview · Textbox [100] | Bắt buộc | ACS: Danh sách, Thêm/Sửa |
| Aircraft Type | aircraft_type_names | Textview (nguồn: [Flight fleet code] Danh mục Đội bay) | Bắt buộc chọn (form Thêm/Sửa) | ACS: Danh sách, Thêm/Sửa |
| Status | *(không có mapping trong nguồn)* | Tag (danh sách: Active=xanh lá, Inactive=xám) · DDL (thêm/sửa) | Bắt buộc chọn (form Thêm/Sửa) | ACS: Danh sách, Thêm/Sửa |
| Note | *(không có mapping trong nguồn)* | Textbox [1000], freetext | Không bắt buộc | ACS: Thêm/Sửa |
| Search AC Subtype Code *(tham số lọc)* | search_code | Textbox [0;10] | — | ACS: Danh sách |
| Search AC Subtype Name *(tham số lọc)* | search_name | Textbox [0;100] | — | ACS: Danh sách |
| Filter Aircraft Type *(tham số lọc)* | filter_aircraft_type_id | Dropdown | — | ACS: Danh sách |
| Filter Status *(tham số lọc)* | filter_status | Dropdown (single-select) | — | ACS: Danh sách · TB: Tìm kiếm tàu bay |

### 2.11 Thực thể Tàu bay (Aircraft — sec-33)

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| Taxi Fuel Flow (kg/h) | taxiFuelFlow | Number [20] | Bắt buộc (Sửa); ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| APU Fuel Flow (kg/h) | apuFuelFlow | Number [20] | Bắt buộc (Sửa); ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| Fuel Tank Capacity (kg) | fuelTankCapacity | Number [20] | Bắt buộc (Sửa); ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| Water Tank Capacity (liters) | waterTankCapacity | Number [20] | Bắt buộc (Sửa); ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| Cargo Capacity (kg) | cargoCapacity | Number [20] | Bắt buộc (Sửa); ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| Basic Operating Weight (kg) | basicOperatingWeight | Number [20] | Bắt buộc (Sửa); ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| Max Ramp Weight (kg) | maxRampWeight | Number [20] | Bắt buộc (Sửa); ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| MTOW (kg) | mtow | Number [20] | Bắt buộc (Sửa); ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| Cabin A | cabinA | Number [20] | Bắt buộc (Sửa); số nguyên ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| Cabin B | cabinB | Number [20] | Bắt buộc (Sửa); số nguyên ≥ 0 | TB: Xem/Sửa Aircraft Configuration |
| Cabin C | cabinC | Number [20] | Bắt buộc (Sửa); số nguyên ≥ 0 (nhập 0 nếu không có Cabin C) | TB: Xem/Sửa Aircraft Configuration |
| From (hiệu lực Fuel) | fromDate | Datetime (dd/MM/yyyy HH:mm) | Bắt buộc (Thêm mới ACARS); không sửa khi Edit | TB: Xem/Sửa Aircraft Configuration, Thêm ACARS Fuel |
| To (hiệu lực Fuel) | toDate | Datetime (dd/MM/yyyy HH:mm) | Bắt buộc (Thêm mới ACARS); không sửa khi Edit | TB: Xem/Sửa Aircraft Configuration, Thêm ACARS Fuel |
| Fuel Limit | fuelLimit | Number [20] | Bắt buộc; ≥ 0 | TB: Xem/Sửa Aircraft Configuration, Thêm ACARS Fuel |
| Fuel Multiplier | fuelMultiplier | Decimal/Number [20] | Bắt buộc; ≥ 0 | TB: Xem/Sửa Aircraft Configuration, Thêm ACARS Fuel |
| Aircraft Category 1 | aircraftCategory1 | Textview · DDL [A320NEO, A321 CEO, A321 NEO, A350, B787-9, B787-10] | Bắt buộc (Sửa) | TB: Xem/Sửa Group Attributes, Tìm kiếm |
| Aircraft Category 2 | aircraftCategory2 | Textview · DDL [A320, A321 CEO, A321 NEO, A350, B787] | Bắt buộc (Sửa) | TB: Xem/Sửa Group Attributes, Tìm kiếm |
| Aircraft Category 3 | aircraftCategory3 | Textview · DDL [A320-A321, A350, B787] | Bắt buộc (Sửa) | TB: Xem/Sửa Group Attributes, Tìm kiếm |
| Aircraft Category 4 | aircraftCategory4 | Textview · DDL [A320-A321, A350-B787] | Bắt buộc (Sửa) | TB: Xem/Sửa Group Attributes, Tìm kiếm |
| Aircraft Category 5 | aircraftCategory5 | Textview · DDL [320, 32B, 32D, 32N, 350, 787] | Bắt buộc (Sửa) | TB: Xem/Sửa Group Attributes, Tìm kiếm |
| Aircraft Fleet | aircraftFleet | Textview · DDL [A320, A321, A350, B787, ATR] | Bắt buộc (Sửa) | TB: Xem/Sửa Group Attributes |

### 2.12 Thực thể Khai báo APU INOP (BR-420)

> **[Cập nhật 2026-07-15 — chỉ đạo trực tiếp BA Lead, KHÔNG phải trích từ BR-420 gốc]** Bổ sung 3 trường: Mã khai báo, Lần khai báo (2 mã định danh tự sinh), Trạng thái xử lý (4 giá trị, thay cho tính toán Active/Closed trực tiếp từ `to_date`). Trạng thái Active/Closed **giữ lại** làm nhãn tổng hợp suy từ Trạng thái xử lý — không còn là trường tính từ `to_date`.

| Trường (Tên) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở chức năng(s) |
|---|---|---|---|---|
| Mã khai báo | `declaration_code` | Textview, chỉ đọc | Tự sinh — không nhập tay | APU: Danh sách, Export (CREATE sinh ra sau khi Lưu) |
| Mã tàu bay | `aircraft_code` | Textview (LIST) · Dropdown/Search (CREATE) | Bắt buộc; khóa sau khi tạo | APU: Danh sách, Tạo, Lọc, Export |
| Lần khai báo | `declaration_seq` | Textview, chỉ đọc | Tự sinh — đếm riêng theo Mã tàu bay | APU: Danh sách, Export (CREATE sinh ra sau khi Lưu) |
| Từ ngày | `from_date` | Textview (LIST) · Datepicker (CREATE) | Bắt buộc; khóa sau khi tạo | APU: Danh sách, Tạo, Lọc, Export |
| Đến ngày | `to_date` | Textview (LIST) · Datepicker (CREATE/EDIT) | Không bắt buộc — trống = "Chưa xác định" (đang hiệu lực) | APU: Danh sách, Tạo, Sửa, Lọc, Export |
| Trạng thái xử lý | `processing_status` | Tag (LIST) · Dropdown (EDIT) | Bắt buộc; khởi tạo = "Hỏng — chưa sửa chữa" khi Tạo, chỉ đổi được qua Sửa | APU: Danh sách, Sửa, Lọc, Export — 4 giá trị: Hỏng — chưa sửa chữa / Đang sửa chữa / Đã khôi phục — chờ xác nhận / Đã xác nhận khôi phục |
| Ghi chú | `note` | Textview (LIST) · Textarea [500] (CREATE/EDIT) | Không bắt buộc | APU: Danh sách, Tạo, Sửa, Export |
| Trạng thái *(nhãn tổng hợp — không lưu DB riêng)* | — | Tag (Active=xanh/Closed=xám) | — | APU: Danh sách — suy từ Trạng thái xử lý ∈{1,2,3}→Active; =4→Closed *(trước 2026-07-15: suy trực tiếp từ `to_date` so với hôm nay)* |

**Tổng từ điển: 118 trường** (Sân bay 15 · Log dùng chung 11 · Phi công/Tiếp viên 18 · Hành trình bay 8 · Quốc gia 4 · FIR 9 · Email 3 · Chặng bay 4 · Đội bay 9 · AC Subtype 9 · Tàu bay 21 · APU INOP 7 lưu trữ + 1 tính toán). *(AC Subtype tăng từ 7→9 ngày 2026-07-15: bổ sung 2 trường Status + Note — có trong nguồn [LIST STT10, ADD_EDIT] nhưng từng bị bỏ sót khỏi từ điển. APU INOP thêm mới 2026-07-15 (nhóm chưa từng có trong từ điển trước đó) với 5 trường ban đầu, sau đó tăng lên 8 cùng ngày theo chỉ đạo BA Lead bổ sung state machine 4 trạng thái + 2 mã định danh tự sinh.)*

> Lưu ý cho data-modeler: các cột dữ liệu của **Carrier (sec-24)**, **ULD Type (sec-28)**, **ULD (sec-29)** và phần lớn màn hình **Sân bay danh sách/chi tiết (sec-14, 15)**, **Tàu bay danh sách (sec-33)** **không có mapping DB/API trong nguồn** — chưa đưa vào từ điển này (xem §4).

---

## 3. Danh mục con của module

| # | Danh mục | Section | Trạng thái trong bản trích |
|---|---|---|---|
| 1 | Sân bay (Airport) — 6 chức năng CRUD + lịch sử | [TOSS.DM.AIRPORT_LIST.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_LIST.FD.v0.1.md) → [TOSS.DM.AIRPORT_HISTORY.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_HISTORY.FD.v0.1.md) | Có nội dung text đầy đủ |
| 2 | Quản lý chặng bay (mục cấp tài liệu, sau sec-19) | sec-20 | Chỉ tiêu đề — nội dung dạng ảnh/sơ đồ, đã gỡ khỏi _parts [cần xác nhận — xem .docx] |
| 3 | Quản lý Tankering | sec-21 | Chỉ tiêu đề — nội dung dạng ảnh/sơ đồ, đã gỡ khỏi _parts [cần xác nhận — xem .docx] |
| 4 | Danh mục Phi công | [TOSS.DM.PILOT_LIST.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_LIST.FD.v0.1.md) | Có nội dung (nhiều đoạn bị gạch bỏ trong nguồn) |
| 5 | Danh mục Tiếp viên | [TOSS.DM.ATTENDANT_LIST.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_LIST.FD.v0.1.md) | Có nội dung |
| 6 | Danh mục Carrier | [TOSS.DM.CARRIER_LIST.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_LIST.FD.v0.1.md) | Có nội dung (không có mapping DB/API) |
| 7 | Danh mục Quốc gia | [TOSS.DM.COUNTRY_LIST.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_LIST.FD.v0.1.md) | Có nội dung |
| 8 | Danh mục FIR | [TOSS.DM.FIR_LIST.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_LIST.FD.v0.1.md) | Có nội dung |
| 9 | Danh sách Email | [TOSS.DM.EMAIL_LIST.FD.v0.1.md](TOSS.DM.EMAIL/TOSS.DM.EMAIL_LIST.FD.v0.1.md) | Có nội dung |
| 10 | Danh mục loại ULD (ULD Type) | [TOSS.DM.ULD_TYPE_LIST.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_LIST.FD.v0.1.md) | Có nội dung (không có mapping trường dữ liệu) |
| 11 | Danh mục ULD | [TOSS.DM.ULD_LIST.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_LIST.FD.v0.1.md) | Có nội dung (không có mapping trường dữ liệu) |
| 12 | Danh mục chặng bay (Leg/Segment) | [TOSS.DM.SECTOR_LIST.FD.v0.1.md](TOSS.DM.SECTOR/TOSS.DM.SECTOR_LIST.FD.v0.1.md) | Có nội dung (thiếu đặc tả Xem chi tiết + Lịch sử dù mô tả đầu module có nhắc) |
| 13 | Danh mục đội bay (Flight Fleet) — kèm Thêm/Sửa/Xóa Tàu bay trong đội | [TOSS.DM.FLEET_LIST.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_LIST.FD.v0.1.md) | Có nội dung |
| 14 | Danh mục AC Subtype | [TOSS.DM.AC_SUBTYPE_LIST.FD.v0.1.md](TOSS.DM.AC_SUBTYPE/TOSS.DM.AC_SUBTYPE_LIST.FD.v0.1.md) | Có nội dung |
| 15 | Quản lý Tàu bay (Aircraft) — 11 chức năng | [TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md) | Có nội dung |
| 16 | Quản lý tàu bay — APU INOP — 5 chức năng | [TOSS.DM.APU_INOP_LIST.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_LIST.FD.v0.1.md) | Có nội dung — **nguồn khác biệt: dẫn BR-420, không có `sec-NN`** (14 danh mục còn lại đều trích từ `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`); đăng ký vào CATALOG/INDEX 2026-07-15, trước đó bị bỏ sót (xem §4.6) |

Tham chiếu phạm vi ([TOSS.DM.THONG_TIN_CHUNG.FD.v0.1.md](TOSS.DM.THONG_TIN_CHUNG.FD.v0.1.md) §Phạm vi tài liệu, mục 1.2.2): "Phân hệ Danh mục dùng chung: Tàu bay, Sân bay, Chặng bay, Phi công, Tiếp viên, Carrier, Quốc gia, FIR, ULD, Đội bay" — danh sách trong nguồn không nhắc Email, loại ULD, AC Subtype, Tankering, APU INOP dù có đặc tả/tiêu đề riêng [cần xác nhận phạm vi].

---

## 4. Điểm cần xác nhận

### 4.1 Section chỉ có ảnh (đã gỡ khỏi _parts — xem file .docx gốc / Figma)

Theo ghi chú INDEX (dọn 2026-07-02), 12 mục sau **không trích được text** — [cần xác nhận — nội dung dạng ảnh, xem .docx]:

| Sec | Nội dung |
|---|---|
| 04 | Tổng quan chức năng (Figma: FIMS board) |
| 05 | Mô hình giao tiếp với hệ thống/Module chức năng khác |
| 06 | Danh sách chuyến bay |
| 07 | Quản lý tài liệu CFP, NOTAM, WX, briefing package |
| 08 | Quản lý tài liệu LS, GD, PM, NOTOC Cargo, NOTOC Baggage, Cargo Manifest, Mail Manifest |
| 09 | Quản lý tải trọng |
| 10 | Quản lý Performance Factor |
| 11 | Quản lý thông tin tàu bay |
| 12 | Quản lý AOC |
| 13 | Quản lý MEL/CDL |
| 20 | Quản lý chặng bay (mục sau sec-19) |
| 21 | Quản lý Tankering |

Ngoài ra: mọi "Sơ đồ luồng hệ thống" và "Màn hình chức năng" trong các section còn lại cũng là ảnh placeholder.

### 4.2 Mã hiệu biểu mẫu & hệ thống liên quan

- **Ghi chú:** Tài liệu dùng mã hiệu biểu mẫu **VNA.FIMS** — **FIMS = TOSS** (BA Lead xác nhận 2026-07-02). Tên FIMS/TOSS và tiền tố file export `FIMS_*` / `TOSS_*` cùng chỉ một hệ thống, không phải điểm cần xác nhận.
- sec-24 nhắc các hệ thống **FON, E-checklist, MO Plus & EDM**; sec-22/23 nhắc **AVES, Nestline/Netline**; sec-33 nhắc **Netline ops++** — [cần xác nhận danh mục hệ thống liên quan].

### 4.3 Trường không có mapping DB/API

- **Carrier (sec-24):** toàn bộ bảng chi tiết màn hình không có mapping.
- **ULD Type (sec-28), ULD (sec-29):** trường dữ liệu không có mapping (chỉ nút bấm có `btn_*`).
- **Sân bay:** sec-14 (danh sách), sec-15 (chi tiết), phần lớn sec-17 (sửa) không mapping; sec-16 có 6 trường mapping (`operating_hours`, `runway_specifications`, `obstacles`, `ground_equipment`, `is_fuel_available`, `other_operational_info`) nhưng **trống kiểu dữ liệu và mô tả**.
- **Chặng bay (sec-30):** bảng Xóa dùng format 4 cột, không có cột Mapping; International/Domestic/EDTO/Status ở danh sách không có mapping riêng cho cột hiển thị.
- **Tàu bay (sec-33):** màn danh sách + tab General Information (trừ `status`) không có mapping.
- **Time zone (sec-16/17), Note (sân bay), Last Access Time (PC), Lower/Upper Limit (FIR Thêm/Sửa)**: có tên + mô tả nhưng trống mapping.

### 4.4 Tham chiếu external chưa có bản nội bộ

- **Mã kịch bản VL/TB** (VL004, VL006, VL007; TB004, TB005, TB019, TB020, TB021, TB022, TB023, TB024) đều trỏ **Google Docs** ("Kịch bản chung") — chưa có bản nội bộ trong repo.
- **Kịch bản chung** trỏ Google Docs: title hệ thống, ẩn/hiện filter (Collapsible Filter), phân trang, xuất Excel, Choose file.
- **Template/file mẫu** trỏ Google Sheets: FIMS_PILOT export, Template Import Phi_cong_v0.2, Template_Import_Tiep_Vien, Danh mục Quốc gia, Danh mục FIR, Fims_ULD_Type, FIMS_ULD, Template import row Serial Number, FIMS_Quanlychangbay, FIMS_Quanlydoibay, AC Subtype Excel, TOSS_Aircraft Type List, TOSS_History_Aircraft_type_list.
- sec-14/22 v.v. còn trỏ Google Docs của module khác (Sửa vai trò/Xóa vai trò, Danh mục đội bay, Mainbase).

### 4.5 Mâu thuẫn / bất thường trong nguồn (giữ nguyên văn, chờ BA Lead chốt)

1. **Region, Country name (Sân bay):** không bắt buộc ở Thêm mới (sec-16) nhưng bắt buộc ở Sửa (sec-17); Country name sec-16 ghi "Không bắt buộc" nhưng Action lại có IM khi trống.
2. **Abbreviation (QG), ANSP/Lower/Upper (FIR):** ghi "Không bắt buộc" nhưng Action có IM VL004 khi để trống.
3. **ICAO của FIR:** 2 mapping khác nhau (`region_type_id/regionTypeId` khi Thêm mới; `icao_code` khi Sửa/Chi tiết).
4. **Cabin code (TV):** 2 mapping (`flight_attendant_code/flighAttendantCode` ở filter; `cabin_code` ở cột danh sách).
5. **Nội dung nghi sao chép giữa các module:** sec-14 Actions mô tả "Sửa/Xóa vai trò"; sec-24 Xóa nhắc "Cơ quan đơn vị"; sec-26 Xóa ghi "delete the country"; sec-26/28 IM nhắc "tên FIR"; sec-31 IATA Designator TH Sửa hiển thị `[flightfleet_code]`.
6. **Đồng bộ AVES:** bị gạch bỏ toàn bộ ở danh sách PC (sec-22) nhưng giữ nguyên ở danh sách TV (sec-23) và vẫn còn nút đồng bộ ở màn chi tiết PC — cần chốt trạng thái hiệu lực.
7. **Chặng bay (sec-30):** mô tả đầu module liệt kê "Xem chi tiết và Xem lịch sử" nhưng không có đặc tả 2 chức năng này.
8. **[TOSS.DM.THONG_TIN_CHUNG.FD.v0.1.md](TOSS.DM.THONG_TIN_CHUNG.FD.v0.1.md) §Khái niệm, thuật ngữ:** dòng OFP để trống định nghĩa.
9. **Tìm kiếm tàu bay (sec-33):** Category 2–5 ghi kiểu "Dropdown (multi-select)" nhưng mô tả "chỉ cho phép chọn 1 giá trị".
10. **Reason khi xóa:** chuẩn chung 1000 ký tự, riêng Xóa ACARS Fuel Limit & Fuel Multiplier là 300 ký tự; Xóa ACARS là **xóa cứng**, các danh mục khác xóa mềm `is_delete=true`.
11. **ULD_CREATE — nghi sao chép từ sơ đồ Xóa:** sơ đồ luồng hệ thống bước 4 ghi "Nhập lý do và nhấn 'Lưu lại'" và bước 8 ghi "Hiển thị toast **xóa** thành công" trong khi đây là luồng **Thêm mới** ULD — giữ nguyên verbatim theo ảnh gốc.
12. **ULD_EDIT — nhầm tên thực thể:** sơ đồ luồng hệ thống bước (2) ghi "Click Icon Sửa ULD **Type**" trong khi đây là luồng Sửa **ULD** (không phải ULD Type) — giữ nguyên verbatim.
13. **FLEET_DELETE, AIRCRAFT_IN_FLEET_DELETE — sai nội dung toast:** bước cuối trong sơ đồ luồng hệ thống ghi "Hiển thị toast message **Thêm mới/Sửa** thành công" dù đang mô tả luồng **Xóa** — nghi lỗi copy giữa các sơ đồ, giữ nguyên verbatim.
14. **Nhãn làn (swimlane) không nhất quán:** nhóm Đội bay (Fleet) dùng nhãn "**Use**" (thiếu chữ "r") thay vì "User" trong toàn bộ 7 sơ đồ luồng hệ thống — giữ nguyên verbatim.
15. **Lỗi chính tả nhỏ trong sơ đồ luồng (giữ nguyên, không sửa):** EMAIL_HISTORY bước (3) ghi "call APi"; ULD_TYPE_CREATE bước 7 ghi "cập nhập" (thay vì "cập nhật"); ACARS_FUEL_LIMIT_CREATE bước 5 ghi "Click Buton Add Time Period" (thiếu chữ "t").

### 4.6 Nhóm APU INOP (BR-420) — nguồn khác biệt, chưa đăng ký + trùng lặp nội bộ (phát hiện 2026-07-15)

Nhóm `TOSS.DM.APU` (5 Function Document: LIST/CREATE/EDIT/DELETE/EXPORT) tồn tại sẵn trong `_parts/` nhưng **chưa từng được đăng ký vào CATALOG.md/INDEX.md** trước 2026-07-15 (không có dòng #, không nằm trong bảng §3, không có trong từ điển trường) — đã bổ sung đầy đủ cùng đợt với việc tạo file tổng quan nhóm `TOSS.DM.APU.MD.v0.1.md`. Các điểm cần xác nhận riêng của nhóm này:

1. **Nguồn khác 14 danh mục còn lại:** mọi file dẫn nguồn `BR-420` (Business Requirement), không phải `sec-NN` của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` như 14 danh mục khác — khả năng đây là nội dung soạn trực tiếp từ BRD, chưa qua vòng SRS chính thức của VNA/VTIT như phần còn lại của module. [Cần làm rõ với BA Lead: nhóm này đã được VNA/VTIT xác nhận hay còn là bản nháp nội bộ?]
2. **FILTER đã bỏ, không tồn tại trên đĩa:** một file `FILTER` từng được phác thảo với nội dung trùng gần như nguyên vẹn bảng "Bộ lọc" đã có sẵn trong `TOSS.DM.APU_INOP_LIST.FD.v0.1.md` (cùng 5 trường: Mã tàu bay/Từ ngày/Đến ngày/Button Tìm kiếm/Button Reset) — xác nhận là phân rã dư thừa (2 file tả cùng 1 UI) nên đã loại bỏ, giữ nguyên bộ lọc trong LIST làm nguồn duy nhất; không đăng ký vào bảng §3.
3. **[Đã xử lý 2026-07-15]** Export button từng thiếu trong bảng trường của LIST — LIST đã bổ sung dòng "Button Export" (STT 3, có link markdown thật tới `EXPORT.FD`), khớp với Trigger mô tả ở `EXPORT.FD`.
4. **EDIT đã tách thành 2 file riêng (Sửa / Xóa)** — khớp quy ước tách file riêng cho mỗi thao tác CRUD như 14 danh mục còn lại của module (vd AC Subtype có `_ADD_EDIT` và `_DELETE` riêng biệt): `TOSS.DM.APU_INOP_EDIT.FD.v0.1.md` (chỉ Sửa) + `TOSS.DM.APU_INOP_DELETE.FD.v0.1.md` (chỉ Xóa, nội dung giữ nguyên từ file gộp ban đầu).
5. **[Đã xử lý 2026-07-15]** Trước đây chỉ 1/4 liên kết trong nhóm có link markdown thật (LIST → CREATE) — LIST đã bổ sung link markdown thật cho cả 4 quan hệ: → CREATE (STT 2), → EXPORT (STT 3), → EDIT/DELETE (STT 8, Button Sửa/Xóa), khớp quy ước nhóm AC Subtype (LIST trỏ link tới cả file con).

### 4.7 Nhóm APU INOP — bổ sung state machine 4 trạng thái + 2 mã định danh (chỉ đạo trực tiếp BA Lead, 2026-07-15)

Khác với các mục 4.6 (phát hiện thuần từ nội dung nguồn có sẵn), mục này ghi nhận **nội dung nghiệp vụ mới do BA Lead trực tiếp cung cấp** ngày 2026-07-15 — không trích từ BR-420 gốc hay bất kỳ tài liệu nguồn nào đã có trong `ba/workspace/input/`:

1. **Trạng thái Active/Closed cũ (tính từ `to_date`) được xác nhận là chưa phản ánh đúng bản chất nghiệp vụ.** BA Lead chỉ rõ quy trình khai báo APU hỏng thực tế cần theo dõi qua 4 trạng thái theo thứ tự nghiệp vụ tự nhiên: Hỏng — chưa sửa chữa → Đang sửa chữa → Đã khôi phục — chờ xác nhận → Đã xác nhận khôi phục. Active/Closed được giữ lại làm nhãn tổng hợp (Active = 3 trạng thái đầu, Closed = trạng thái cuối), không còn tính trực tiếp từ so sánh ngày. *(Thứ tự này chỉ là ngữ nghĩa tự nhiên của 4 trạng thái — quy tắc chuyển trạng thái khi Sửa là tự do, không ràng buộc thứ tự, xem điểm 3.)*
2. **Cơ chế chuyển trạng thái:** thực hiện qua chính 2 thao tác Thêm mới (khởi tạo trạng thái đầu) và Sửa (chuyển sang trạng thái khác) — actor nào được phân quyền 2 thao tác này thì thực hiện được, không có vai trò/luồng phê duyệt riêng biệt (BA Lead xác nhận qua trao đổi trực tiếp, không phải văn bản chính thức).
3. **[BA Lead xác nhận 2026-07-15]** Quy tắc giới hạn khi Sửa: **tự do** — Dropdown Trạng thái xử lý cho phép chọn bất kỳ 1 trong 4 giá trị (Hỏng — chưa sửa chữa / Đang sửa chữa / Đã khôi phục — chờ xác nhận / Đã xác nhận khôi phục), không ràng buộc phải chuyển đúng thứ tự tuần tự. Đã cập nhật `TOSS.DM.APU_INOP_EDIT.FD.v0.1.md`.
4. **2 mã định danh tự sinh, không cho nhập tay:** (a) Mã khai báo toàn hệ thống, định dạng `APU-YYYY-NNNN`, tăng dần không phân biệt tàu bay; (b) Lần khai báo riêng theo từng tàu bay, đếm lại từ 1 cho mỗi mã tàu bay khác nhau. Cả 2 đều gán tự động khi Lưu ở màn Tạo mới, không hiển thị trên form nhập (chỉ hiển thị sau khi lưu thành công, ở màn Danh sách/Export).
5. **Nguồn xác nhận:** trao đổi trực tiếp qua hội thoại với BA Lead 2026-07-15 (3 lượt làm rõ: tập trạng thái, cách sinh 2 mã, cơ chế phân quyền chuyển trạng thái) — chưa có văn bản BR/BRD chính thức ghi nhận các quyết định này; cần bổ sung vào BR-420 (hoặc BR mới) nếu muốn có căn cứ văn bản lâu dài.
