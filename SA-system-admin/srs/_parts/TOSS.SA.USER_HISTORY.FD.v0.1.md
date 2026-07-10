---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.USER_HISTORY"
feature_name: "Xem lịch sử Người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Xem lịch sử người dùng

| **Tên chức năng: Xem lịch sử Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem lịch sửNgười dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý người dùng => nhấn vào Xem lịch sửNgười dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Quản lý người dùng |
| **Hậu điều kiện** | Màn hình Xem lịch sửNgười dùng hiển thị |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | 1 | User truy cập vào web FIMS => mở đến module Quản lý người dùng =>hiển thị màn hình [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) trên giao diện |
|  | 2 | User click button **Xem lịch sử Người dùng** |
|  | 3 | Hệ thống call API lấy dữ liệu lịch sử |
|  | 4 | Mở màn hình Xem lịch sử cập nhật |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **Thông tin chung** | | | | |
|  | Avatar | Image | avatar | * Hiển thị [Avatar người dùng] * Không cho thao tác |
|  | Full name | Textview | full\_name/fullName | * Hiển thị [Tên người dùng] * Không cho thao tác |
|  | Employee Code | Textview | employee\_code/employeeCode | * Hiển thị [Mã người dùng] * Không cho thao tác |
|  | Status | TagStatus | active\_status | * Hiển thị [Trạng thái người dùng]   + Đang hoạt động: Màu xanh lá   + Ngừng hoạt động: Màu xám * Không cho thao tác |
| **Lịch sử Cập nhật người dùng** | | | | |
| * **Search**   + Click vào Icon filter để nhập các giá trị cần lọc   + Trường hợp filter không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó   ![](data:image/png;base64...)  Update time, cho phép chọn 1 ngày: dữ liệu truyền vào sẽ lấy khoảng thời gian là đầu và cuối ngày đã chọn  Action, cho phép chọn thao tác người sử dụng.  Update Details, cho phép nhập tìm kiếm update details   * + Hiển thị kết quả tìm kiếm:     - Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về     - Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | |
|  | Update Time | Datepicker | updated\_at/updateAt | * Trường để lọc: Tìm kiếm chính xác theo [updateAt] (không tìm theo giờ) * Định dạng ngày dd/mm/yyyy * Chỉ cho chọn từng ngày * Update Time hiển thị ngày và giờ (UTC) |
|  | Action | Dropdown list | operation\_type/operationType | * Trường để lọc: Tìm kiếm chính xác theo [Action] * Các giá trị chọn bao gồm: Thêm người dùng /[Sửa người dùng](TOSS.SA.EDIT_USER.FD.v0.1.md) /Thay đổi trạng thái hoạt động |
|  | Update Details | Textbox | update\_detail/updateDetail | * Trường để lọc: Tìm kiếm gần đúng theo [updateDetail] * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Updated by | Dropdown list | updated\_by/updateBy | * Trường để lọc: Tìm kiếm chính xác theo [updateBy] * Các giá trị tìm kiếm bao gồm: [Danh sách user](TOSS.SA.USER_LIST.FD.v0.1.md) được phần quyền thao tác trên phân hệ Quản lý người dùng/TOSS * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập |
| * **Bảng log** | | | | |
|  | TT | Textview |  | * Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo * Danh sách hiển thị tối đa 6 dòng dữ liệu |
|  | Updated Time | Textview | updated\_at/updateAt | * Hiển thị thời gian cập nhật dữ liệu * Định dạng dd/mm/yyyy hh:mm * Hiển thị giờ UTC |
|  | Action | Textview | operation\_type/operationType | * Hiển thị nghiệp vụ ghi nhận thay đổi dữ liệu trên bảng [Danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md), bao gồm: Thêm người dùng /[Sửa người dùng](TOSS.SA.EDIT_USER.FD.v0.1.md) /Thay đổi trạng thái hoạt động |
|  | Update Details | Textview | update\_detail/updateDetail | * Hiển thị chi tiết cập nhật người dùng * Hiện tối đa 2 dòng dữ liệu, nếu nội dung vượt quá 2 dòng, hiện dấu ba chấm […] tại cuối dòng thứ 2. Di chuột vào hiện tooltips full nội dung * Cách ghi nhận log:   + Thêm người dùng: [Tên + mã người dùng]   + [Sửa người dùng](TOSS.SA.EDIT_USER.FD.v0.1.md): [Tên trường]: [~~Nội dung bị xóa/thay đổi~~] > [Nội dung sau cập nhật]   TH cập nhật vai trò: [Tên hệ thống] [[Danh sách vai trò](TOSS.SA.ROLE_LIST.FD.v0.1.md), mỗi vai trò cách nhau bởi **dấu phẩy**} => list các hệ thống được cập nhật vai trò, mỗi hệ thống cách nhau bởi **dấu chấm phẩy**   * + Thay đổi trạng thái hoạt động: [~~TT trước~~] > [TT sau] |
|  | Updated by | Textview | updated\_by/updateBy | * Hiển thị thông tin người cập nhật dữ liệu * Nội dung bao gồm [fullName] |
|  | Pagination |  |  | * Khi SL dữ liệu API trả về >6 => hiển thị phân trang |
| **Lịch sử truy cập** | | | | |
| * **Tìm kiếm**   + Click vào dòng dưới tiêu đề các cột để chọn lọc, tìm kiếm thông tin theo dữ liệu tại cột tương ứng.   + Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó   + Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/click Enter/out focus box => hệ thống thực hiện:     - Reload dữ liệu table phù hợp với bộ lọc     - Set current page=1   + Hiển thị kết quả tìm kiếm:     - Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về     - Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | |
|  | Update Time | Datepicker | updated\_at/updateAt | * Trường để lọc: Tìm kiếm chính xác theo [Ngày cập nhật] (không tìm theo giờ) * Định dạng ngày dd/mm/yyyy |
|  | Update details | Textbox | device\_type/deviceType | * Trường để lọc: Tìm kiếm gần đúng theo [Update details] * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Action | Droplist | operation\_type/operationType | * Trường để Chọn: Tìm kiếm chính xác theo [Action] * Các giá trị chọn bao gồm: Login/Logout |
| **Bảng log** | | | | |
| 1. TTY | TT | Textview |  | * Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo * Danh sách hiển thị tối đa 6 dòng dữ liệu |
|  | Update Time | Textview | updated\_at/updateAt | * Hiển thị thời gian cập nhật dữ liệu * Định dạng dd/mm/yyyy - hh:mm |
|  | Update Details | Textview | operation\_type/operationType | * Hiển thị nghiệp vụ ghi nhận truy cập app bao gồm login/logout Của thiết bị loại nào và os phiên bản tương ứng |
|  | Action | Textview | device\_type/deviceType | * Hiển thị hành động login/logout của người dùng |

###

---

*Nguồn: tách trung thực từ `sec-11-quan-ly-nguoi-dung.md`, mục "Xem lịch sử Người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#13** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
