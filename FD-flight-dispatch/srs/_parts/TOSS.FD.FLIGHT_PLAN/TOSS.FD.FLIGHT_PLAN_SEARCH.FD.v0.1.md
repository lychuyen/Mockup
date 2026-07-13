---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Dispatch"
feature_id: "TOSS.FD.FLIGHT_PLAN_SEARCH"
feature_name: "Tìm kiếm Flight Plan"
group: "Flight Plan"
---

## **Tìm kiếm Flight Plan**

### **Sơ đồ nghiệp vụ**

*(hình ảnh minh họa — xem file gốc/Google Doc)*

### **Mô tả sơ đồ nghiệp vụ**

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng đăng nhập vào hệ thống TOSS -> chọn Filght Dispatch và chọn tab **Flight Plan** |
| Bước 2 | Hệ thống gọi API lấy danh sách **Flight Plan** và hiển thị dữ liệu trên màn hình |
| Bước 3 | Người dùng nhập bất kỳ một hoặc nhiều thông tin tìm kiếm trên bộ lọc |
| Bước 4 | Trường hợp người dùng nhấn nút **Search**, hệ thống thực hiện tìm kiếm theo thông tin đã nhập |
| Bước 5 | Trường hợp người dùng muốn xóa điều kiện lọc, người dùng nhấn nút **Clear Filters** |
| Bước 6 | Sau khi người dùng nhấn **Search**, hệ thống gọi API tìm kiếm và hiển thị danh sách **Flight Plan** phù hợp với điều kiện đã nhập. Luồng kết thúc |
| Bước 7 | Sau khi người dùng nhấn **Clear Filters**, hệ thống xóa toàn bộ thông tin đã nhập trên bộ lọc. Luồng kết thúc . |

### **Màn hình chức năng**

*(hình ảnh minh họa — xem file gốc/Google Doc)*

### **Mô tả màn hình chức năng**

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| 1 | Filter | Button |  | * Cho phép người dùng mở hoặc thu gọn khu vực bộ lọc tìm kiếm của màn hình Flight Plans. * Khi nhấn, hệ thống hiển thị hoặc ẩn các trường điều kiện tìm kiếm như Operating Date, Flt no, Aircraft Registration, DEP, ARR, ETD, ETA, Dispatcher, Status và các điều kiện lọc khác. * Trạng thái mở/đóng của bộ lọc được giữ nguyên cho đến khi người dùng thay đổi. |
| 2 | From Date | Date |  | * Placeholder: From Date * Trường để lọc: Tìm kiếm đúng theo [From Date] * Khi chưa chọn ngày thì hệ thống mặc định lấy ngày hiện tại. * Cho phép người dùng chọn ngày bắt đầu của khoảng thời gian tìm kiếm Flight Plan. Định dạng hiển thị dd/MM/yyyy. * Người dùng có thể chọn ngày từ Date Picker hoặc nhập trực tiếp theo đúng định dạng. Ngày bắt đầu không được lớn hơn ngày kết thúc. * Giá trị **From Date ≤ To Date**. |
| 3 | To Date | Date |  | * Placeholder: To Date * Trường để lọc: Tìm kiếm đúng theo [To Date] * Khi chưa chọn ngày thì hệ thống mặc định lấy ngày hiện tại. * Cho phép người dùng chọn ngày kết thúc của khoảng thời gian tìm kiếm Flight Plan. * Định dạng hiển thị **dd/MM/yyyy**. * Người dùng có thể chọn ngày từ Date Picker hoặc nhập trực tiếp theo đúng định dạng. Ngày kết thúc không được nhỏ hơn ngày bắt đầu. * Giá trị **To Date ≥ From Date** |
| 4 | Flt no | Text |  | * Placeholder: Flt no * Trường để lọc: Tìm kiếm gần đúng theo [Flt no] * Maxlength 10 ký tự * Chặn nếu nhập quá 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Hệ thống thực hiện **TRIM** khoảng trắng đầu/cuối , hỗ trợ tìm kiếm gần đúng, không phân biệt chữ hoa/chữ thường. |
| 5 | AC Reg | Text |  | * Placeholder: AC Reg * Trường để lọc: Tìm kiếm gần đúng theo [AC Reg] * Maxlength 10 ký tự * Chặn nếu nhập quá 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Hệ thống thực hiện **TRIM** khoảng trắng đầu/cuối , hỗ trợ tìm kiếm gần đúng, không phân biệt chữ hoa/chữ thường. |
| 6 | DEP | Dropdown |  | * Mặc định: All * Placeholder: DEP * Trường để lọc: Tìm kiếm chính xác theo [DEP] * Khi người dùng nhấn vào trường, hệ thống hiển thị danh sách các mã sân bay khởi hành (**DEP**) có trong dữ liệu. * Danh sách chỉ hiển thị các giá trị duy nhất (Distinct), không hiển thị các mã sân bay trùng lặp. * Chỉ cho phép chọn 1 giá trị |
| 7 | ARR | Dropdown |  | * Mặc định: All * Placeholder: ARR * Trường để lọc: Tìm kiếm chính xác theo [ARR] * Khi người dùng nhấn vào trường, hệ thống hiển thị danh sách các mã sân bay khởi hành (**ARR**) có trong dữ liệu. * Danh sách chỉ hiển thị các giá trị duy nhất (Distinct), không hiển thị các mã sân bay trùng lặp. * Chỉ cho phép chọn 1 giá trị |
| 8 | ETD | Datetime |  | * Placeholder: ETD * Trường để lọc: Tìm kiếm các chuyến bay có **ETD** nằm trong khoảng thời gian được chọn * Cho phép nhập hoặc chọn thời gian cất cánh dự kiến (Estimated Time of Departure) theo múi giờ UTC. * Định dạng dd/MM/yyyy HH:mm. |
| 9 | ETA | Time/Datetime |  | * Placeholder: ETA * Trường để lọc: Tìm kiếm các chuyến bay có **ETA** nằm trong khoảng thời gian được chọn * Cho phép nhập hoặc chọn thời gian hạ cánh dự kiến (Estimated Time of Arrival) theo múi giờ UTC. * Định dạng dd/MM/yyyy HH:mm |
| 10 | TYPE | Dropdown |  | * Mặc đinh: All * Placeholder: Type * Trường để lọc: Tìm kiếm đúng theo [Type] * Cho phép lựa chọn loại Flight Plan để tìm kiếm. * Chỉ cho phép chọn một giá trị. |
| 11 | STATUS | Dropdown |  | * Mặc đinh: All * Placeholder: Status * Trường để lọc: Tìm kiếm đúng theo [Status] * Cho phép lựa chọn trạng thái của Flight Plan. * Chỉ cho phép chọn một giá trị. * Giá trị gồm:   + Status=: ENR - đang bay   + Status=: ARR - đã đến   + Status=: BRD - boardinh   + Status = OUT - off-block |
| 12 | All Revision/ Last Revision | DDL |  | * Mặc đinh: All * Placeholder: All Revision/Last Revision * Trường để lọc: Tìm kiếm đúng theo [All Revision/Last Revision] * All Revision : Hiển thị tất cả phiên bản OFP của mỗi chuyến bay thỏa mãn điều kiện tìm kiếm. Khi **All Revision** được chọn thì **Last Revision** sẽ bỏ chọn. * Last Revision : Chỉ hiển thị phiên bản OFP mới nhất (số revision cao nhất) của mỗi chuyến bay . Khi **Last Revision** được chọn thì **All Revision** sẽ bỏ chọn. |
| 13 | Dispatcher | Text |  | * Placeholder: Dispatcher * Trường để lọc: Tìm kiếm gần đúng theo [Dispatcher] * Maxlength 50 ký tự * Chặn nếu nhập quá 50 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 50 ký tự đầu * Hệ thống thực hiện **TRIM** khoảng trắng đầu/cuối , hỗ trợ tìm kiếm gần đúng, không phân biệt chữ hoa/chữ thường. |
| 14 | Search | Button |  | * Thực hiện validate dữ liệu bộ lọc và gọi API tìm kiếm theo các điều kiện đã nhập. |
| 15 | Clear filter | Button |  | * Xóa toàn bộ giá trị trên bộ lọc, khôi phục giá trị mặc định và tải lại danh sách dữ liệu. |
| 16 | Table Setting | Button |  | * Cho phép người dùng cấu hình các cột hiển thị trên bảng dữ liệu. * Khi người dùng nhấn **Table Setting**, hệ thống hiển thị popup **Table Setting** để người dùng lựa chọn các cột cần hiển thị hoặc ẩn trên bảng dữ liệu. * Ba cột đầu tiên của bảng dữ liệu luôn được hiển thị và không xuất hiện trong danh sách cấu hình. * Thứ tự hiển thị của các cột là cố định, người dùng không được phép thay đổi vị trí các cột. * Sau khi người dùng xác nhận và lưu cấu hình, hệ thống áp dụng cấu hình hiển thị cho bảng dữ liệu. * Cấu hình được lưu theo từng tài khoản người dùng và được áp dụng cho lần đăng nhập tiếp theo đến khi người dùng đó thay đổi. |

---

> **Nguồn gốc (truy vết):** Tách trung thực từ `sec-06-tim-kiem-flight-plan.md` — mảnh phân rã `VNA.TOSS_SRS_Flight Dispatch_v0.1.md` (SRS Flight Dispatch v0.1, người soạn VNA/VTIT, nguồn Google Drive live pull 2026-07-10) — ứng với dòng **#3** bảng §1 trong [CATALOG.md](../CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0).
>
> **Đồng bộ lại 2026-07-10** theo bản pull Google Doc **phiên bản 1577** (sửa 2026-07-10 bởi tohuonggiang02; bản phân rã trước theo phiên bản 1450): mô tả trường **Table Setting** (STT 16) được nguồn viết chi tiết hơn — bổ sung quy tắc "ba cột đầu tiên luôn hiển thị, không xuất hiện trong danh sách cấu hình", "thứ tự cột cố định, không cho đổi vị trí", "cấu hình lưu theo tài khoản và áp dụng cho lần đăng nhập tiếp theo". Các nội dung còn lại không thay đổi.
>
> **Ghi chú tách file:** Dòng cuối của `sec-06` là tiêu đề nhóm `# **UPLOAD DOCUMENT**` (dấu phân nhóm của tài liệu gốc, dính vào sec-06 do chế độ cắt h2) — đã chuyển sang đầu file `TOSS.FD.COMMON_DOCS_LIST.FD.v0.1.md` (chức năng đầu tiên của nhóm UPLOAD DOCUMENT), không thuộc nội dung chức năng Tìm kiếm Flight Plan.
