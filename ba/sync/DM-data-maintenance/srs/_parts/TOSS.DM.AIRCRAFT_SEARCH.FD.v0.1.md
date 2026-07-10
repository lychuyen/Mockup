---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.AIRCRAFT_SEARCH"
feature_name: "Tìm kiếm tàu bay"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Tìm kiếm tàu bay

| **Tên chức năng: Tìm kiếm tàu bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Tìm kiếm tàu bay |
| **Trigger** | Người dùng truy cập vào web => Chọn Data Maintenance => nhấn Danh mục tàu bay => bộ lọc tìm kiếm theo thông tin của tàu bay |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Tàu bay |
| **Hậu điều kiện** | Màn hình màn hinh danh sách đã lọc theo tìm kiếm |

####

#### Sơ đồ luồng

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng đăng nhập vào hệ thống TOSS, truy cập **Data Maintenance** → **Quản lý tàu bay**. |
| 2 | Hệ thống gọi API lấy danh sách **Aircraft Type** và hiển thị [danh sách tàu bay](TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md) |
| 3 | Người dùng nhập một hoặc nhiều điều kiện tìm kiếm trên bộ lọc |
| 4 | Người dùng nhấn nút **Search** . |
| 5 | Hệ thống gọi API tìm kiếm theo các điều kiện đã nhập và hiển thị [danh sách tàu bay](TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md) phù hợp |

####

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| * **Tìm kiếm:**   ![](data:image/png;base64...)   * Cơ chế Thu gọn/Mở rộng bộ lọc (Collapsible Fillter):   + **Mặc định khi vào trang:** Bộ lọc luôn **Mở rộng (Expanded)** để hiện đủ 8 trường tìm kiếm.   + **Thao tác Thu / Mở:**     - * Bấm icon ▲ => Thu gọn bộ lọc (chỉ còn thanh Header Bộ lọc tìm kiếm ▼), tự động kéo bảng [danh sách tàu bay](TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md) phía dưới rộng lên trên.       * Bấm icon ▼ => Thả cụm bộ lọc xuống lại bình thường.   + **Bảo lưu kết quả (State Persistence):** Đóng/thu gọn bộ lọc **KHÔNG** làm mất kết quả đang lọc ở bảng bên dưới. * Click vào các ô search để chọn lọc thông tin theo 8 trường tiêu chí tàu bay (AC Subtype, ACreg, Category 1-> 5, Trạng thái). * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => click Enter/button Search => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về.   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0**. | | | | |
| 1 | Title hệ thống | Label |  | * + [Tham chiếu Kịch bản title hệ thống](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.f2nh07gdowb8) |
| 2 | Search AC Subtype | Textbox [0;10] |  | * Placeholder: Search by AC Subtype * Trường để lọc: Tìm kiếm gần đúng theo [AC Subtype] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 3 | AC Registration (ACreg) | Textbox [0;10] |  | * Placeholder: Search by AC Registration * Trường để lọc: Tìm kiếm gần đúng theo [AC Registration] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 4 | Category 1 | Dropdown |  | * Mặc định: All * Place holder: Category 1 * Trường để lọc: Tìm kiếm chính xác theo [Category 1] * Chỉ cho phép chọn 1 giá trị bao gồm các giá trị sau:   + A320NEO   + A321 CEO   + A321 NEO   + A350   + B787-9   + B787-10 |
| 5 | Category 2 | Dropdown (multi-select) |  | * Mặc định: All * Place holder: Category 2 * Trường để lọc: Tìm kiếm chính xác theo [Category 2] * Chỉ cho phép chọn 1 giá trị bao gồm các giá trị sau:   + A320   + A321 CEO   + A321 NEO   + A350   + B787 |
| 6 | Category 3 | Dropdown (multi-select) |  | * Mặc định: All * Place holder: Category 3 * Trường để lọc: Tìm kiếm chính xác theo [Category 3] * Chỉ cho phép chọn 1 giá trị bao gồm các giá trị sau:   + A320-A321   + A350   + B787 |
| 7 | Category 4 | Dropdown (multi-select) |  | * Mặc định: All * Place holder: Category 4 * Trường để lọc: Tìm kiếm chính xác theo [Category 4] * Chỉ cho phép chọn 1 giá trị bao gồm các giá trị sau:   + A320-A321   + A350-B787 |
| 8 | Category 5 | Dropdown (multi-select) |  | * Mặc định: All * Place holder: Category 5 * Trường để lọc: Tìm kiếm chính xác theo [Category 5] * Chỉ cho phép chọn 1 giá trị bao gồm các giá trị sau:   + 320   + 32B   + 32D   + 32N   + 350   + 787 |
| 9 | Filter Status | Dropdown (single-select) | filter\_status | * Placeholder: Status * Trường để lọc: Tìm kiếm chính xác theo [Status] * Các lựa chọn: Active / Inactive |
| 10 | ![](data:image/png;base64...) | Button |  | * Click vào ![](data:image/png;base64...) * Hệ thống thực hiện lọc dữ liệu dựa trên từ khoá * Hệ thống trả về danh sách dữ liệ u phù hợp với từ khoá tìm kiếm |
| 11 | ![](data:image/png;base64...) | Button |  | * Click vào ![](data:image/png;base64...) * Hệ thống:   + Xoá nội dung search   + Reset toàn trường lọc đã chọn   + Reset phân trang về trang đầu * Hiển thị lại danh sách ban đầu |

###

---

*Nguồn: tách trung thực từ `sec-33-quan-ly-tau-bay.md`, mục "Tìm kiếm tàu bay" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#69** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
