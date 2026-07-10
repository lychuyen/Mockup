---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.GROUP_DETAIL"
feature_name: "Xem chi tiết Nhóm Người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Xem chi tiết nhóm người dùng

| **Tên chức năng: Xem chi tiết Nhóm Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem chi tiết Nhóm Người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý nhóm người dùng => nhấn vào 1 dòng người dùng bất kỳ |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Quản lý nhóm người dùng |
| **Hậu điều kiện** | Màn hình Xem chi tiết Nhóm Người dùng hiển thị |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng xem chi tiết nhóm người dùng

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
|  | User truy cập vào web FIMS => mở đến module Quản lý nhóm người dùng |
|  | Hệ thống call API lấy dữ liệu [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) từ db |
|  | Hệ thống hiển thị màn hình [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) trên giao diện |
|  | User click vào 1 dòng bất kỳ trên [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md), hệ thống check quyền nếu:   * User có quyền **Xem chi tiết Nhóm người dùng** => Chuyển sang bước 5 * Ngược lại: Không cần xử lý gì |
|  | Hệ thống hiển thị màn hình Xem chi tiết Nhóm người dùng ở bên phải bảng danh sách |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện Xem chi tiết nhóm người dùng

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** | |
| --- | --- | --- | --- | --- | --- |
| **Thông tin người dùng** | | | | | |
|  | User group name | Textview | user\_group\_name/userGroupName | * Hiển thị thông tin [userGroupName] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: để trống trường | |
|  | User group code | Textview | user\_group\_code/userGroupCode | * Hiển thị thông tin [userGroupCode] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: để trống trường | |
|  | Function | Textview |  | Bao gồm các function sau   * Sửa => Ẩn khi user không được phân quyền Sửa * Lịch sử => Ẩn khi user không được phân quyền Xem * Xóa => Ẩn khi user không được phân quyền Xóa   Click function => mở màn hình chức năng tương ứng | |
|  | Role | Tagview | role | Hiển thị các vai trò (ở trạng thái = Đang hoạt động) của nhóm người dùng theo hệ thống, mỗi hệ thống/vai trò được phân quyền hiển thị 1 tag  Chi tiết tag: ![](data:image/png;base64...)   * ![](data:image/png;base64...)Tên hệ thống được phân quyền * ![](data:image/png;base64...) Tên vai trò được phân quyền * Trường hợp API trả về lỗi/rỗng: hiện **N/A** * Click vào tag hiển thị tooltip chi tiết quyền như sau:   ![](data:image/png;base64...) | |
| **Bảng [Danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md)**: Hiển thị danh sách các user được gán vào nhóm người dùng | | | | | |
|  | **Tìm kiếm [Danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md)**   * Click vào filter để hiển thị popup filter * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => click Enter/out focus box => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về   + Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | |
| Full name | TextBox [0;100] | full\_name/fullName | * Trường để lọc: Tìm kiếm gần đúng theo [Tên và mã người dùng] * Maxlength 100 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm | |
| Phone number | TextBox [0;20] | phone\_number/phoneNumber | * Trường để lọc: Tìm kiếm gần đúng theo [phoneNumber] * Maxlength 20 ký tự * Validate cho phép nhập số * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 20 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm | |
| Email | TextBox [0;100] | email | * Trường để lọc: Tìm kiếm gần đúng theo [email] * Maxlength 100 ký tự * Validate cho phép nhập số, chữ, ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm | |
| Department | TextBox [0;100] | department | * Trường để lọc: Tìm kiếm gần đúng theo [department] * Maxlength 100 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm | |
| Status | Dropdownlist [Đang hoạt động, Ngừng hoạt động] | status | * Trường để lọc: Tìm kiếm chính xác theo [status] * Các giá trị lựa chọn:   + Đang hoạt động   + Ngừng hoạt động | |
|  | TT | Textview |  | Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo | |
|  | Full name | Textview | full\_name/fullName | * Hiển thị thông tin Người sử dụng * ![https://lh7-rt.googleusercontent.com/docsz/AD_4nXcb6tEXCTTNLLB18KIZH8J-pZAQCIhkc0u-VuSfAJ1Utvl4FJW09IShb9hcGhCP4NKurozxyfP6EaYbqaqWM2zjsxkMfIJ1A7jRBUR90Fn5o98J9d-Q4nfWEB51VtX4BdWEVmAsq7rbI3zGEdzmePL5QfTYkdslhLMkaJVF?key=AwrLZTmV_vzXUn83Yef17w](data:image/png;base64...): [Tên Người sử dụng] * ![https://lh7-rt.googleusercontent.com/docsz/AD_4nXfkN_AowfJG3bRieS_r_NKXp5RFor25r8qAq2VJ9MNPBegfTUNR7LdYXGWWIS6S2fcZKvGlkjiDoFmtZjSxXlC7uafaO2R82VGEY_Rk5q4ss4Gky5C_iv30gmWHdSQ_T2zZb5sm8SCcCRobZV3RQHaEFi-qXUFpod55IVA_?key=AwrLZTmV_vzXUn83Yef17w](data:image/png;base64...)[Mã Người sử dụng] | |
|  | Phone number | Textview | phone\_number/phoneNumber | Hiển thị thông tin liên hệ của người dùng bao gồm:   * [phoneNumber] | |
|  | Email | Textview | email | Hiển thị thông tin liên hệ của người dùng bao gồm:   * [email] | |
|  | Department | Textview | department | Hiển thị thông tin [department] của người dùng | |
|  | Status | TagStatus | status | Hiển thị thông tin [status] của người dùng dưới dạng tagStatus, trong đó:   * Đang hoạt động: Màu xanh lá * Ngừng hoạt động: Màu xám | |
| 12 | Footer | Pagination |  | [Tham chiếu kịch bản chân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=id.hy5fbrqw7e44) | |

---

*Nguồn: tách trung thực từ `sec-14-quan-ly-nhom-nguoi-dung.md`, mục "Xem chi tiết Nhóm Người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#27** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
