---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.USER_DETAIL"
feature_name: "Xem chi tiết Người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Xem chi tiết người dùng

| **Tên chức năng: Xem chi tiết Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem chi tiết Người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý người dùng => nhấn vào 1 dòng người dùng bất kỳ |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Quản lý người dùng |
| **Hậu điều kiện** | Màn hình Xem chi tiết Người dùng hiển thị |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
|  | * User truy cập vào web FIMS => mở đến module Quản lý người dùng |
|  | * Hệ thống call API lấy dữ liệu [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) từ db |
|  | * Hệ thống hiển thị màn hình [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) trên giao diện |
|  | User click vào 1 dòng bất kỳ trên [Danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md), hệ thống check quyền nếu:   * User có quyền **Xem chi tiết người dùng** => Chuyển sang bước 5 * Ngược lại: Không cần xử lý gì |
|  | * Hệ thống hiển thị màn hình Xem chi tiết người dùng ở bên phải bảng danh sách * Cho phép scroll dọc trong màn xem chi tiết người dùng |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **Thông tin người dùng** | | | | |
|  | Avatar | Avatar | avatar | * Hiển thị [avatar] của người dùng theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện ảnh mặc định là logo VNA |
|  | Name | Textview | full\_name/fullName | * Hiển thị thông tin [fullName] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Employee Code (SkyHr) | Textview | employee\_code/employeeCode | * Hiển thị thông tin [employeeCode] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Status | Textview | active\_status | * Hiển thị thông tin [active\_status] dưới dạng tag status theo dữ liệu API trả về * Xanh là Active, đỏ là Deactive * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Function | Textview |  | Bao gồm các function sau   * Sửa => Ẩn khi user không được phân quyền Sửa * Lịch sử => Ẩn khi user không được phân quyền Xem * Xóa => Ẩn khi user không được phân quyền Xóa * [Lấy lại mật khẩu](TOSS.SA.RESET_PASSWORD.FD.v0.1.md)=> Ẩn khi user không được phân quyền [Lấy lại mật khẩu](TOSS.SA.RESET_PASSWORD.FD.v0.1.md)   Click function => mở màn hình chức năng tương ứng |
|  | Roles | Tagview | role | Hiển thị các vai trò (ở trạng thái = Đang hoạt động) của người dùng theo hệ thống, mỗi hệ thống được phân quyền hiển thị 1 tag  Chi tiết tag: ![](data:image/png;base64...)   * ![](data:image/png;base64...) Tên hệ thống được phân quyền * ![](data:image/png;base64...) Tên vai trò được phân quyền * Trường hợp API trả về lỗi/rỗng: hiện **N/A** * Click vào tag hiển thị tooltip chi tiết quyền như sau:   ![](data:image/png;base64...) |
|  | Department | Textview | department | * Hiển thị thông tin [unit] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Phone number | Textview | phone\_number/phoneNumber | * Hiển thị thông tin [phoneNumber] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Email | Textview | email | * Hiển thị thông tin [email] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Address | Textview | address | * Hiển thị thông tin [address] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | User group | Textview | user\_group\_name/userGroupName | * Hiển thị thông tin [userGroupName] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Position | Textview | position | * Hiển thị nhãn [Chức vụ] * Lấy trường Title bảng user trong DB * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | HRMS code (mã nhân viên cũ) | Textview | hrms\_code/hrmsCode | * Hiển thị nhãn [Mã HRMS (mã nhân viên cũ)] * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Crew code (mã AVES) | Textview | crew\_code/crewCode | * Hiển thị nhãn [Crew code (mã AVES)] * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Industry card number | Textview | industry\_card\_number/industryCardNumber | * Hiển thị nhãn [Số thẻ ngành] * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Last Access Time | Textview | last\_access\_time/lastAccessTime | * Hiển thị nhãn [Thời gian truy cập gần nhất] * Lấy dữ liệu từ log truy cập hệ thống * Hiển thị theo định dạng dd/mm/yyyy - hh:mm * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Carrier Authorization | Textview | carrier | * Hiển thị nhãn [Phân quyền carrier ] * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Main Base | Textview | main\_base/mainBase | * Hiển thị nhãn [Main base] * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Fleet | Textview | fleet/rank | * Hiển thị nhãn [Đội bay] * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |

###

---

*Nguồn: tách trung thực từ `sec-11-quan-ly-nguoi-dung.md`, mục "Xem chi tiết Người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#7** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
