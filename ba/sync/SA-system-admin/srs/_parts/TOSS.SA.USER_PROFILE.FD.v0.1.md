---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.USER_PROFILE"
feature_name: "Xem thông tin user đăng nhập"
---

## Thông tin user đăng nhập

###

| **Tên chức năng: Xem thông tin user đăng nhập** | |
| --- | --- |
| **Mục đích** | Cho phép người dùng xem thông tin tài khoản đăng nhập trên popup Personal information |
| **Trigger** | Người dùng click icon ![](data:image/png;base64...)ở góc phải màn hình Home |
| **Tiền điều kiện** | Người dùng đã đăng nhập thành công vào hệ thống |
| **Hậu điều kiện** | Hiển thị thành công thông tin tài khoản người dùng |

###

### Luồng nghiệp vụ

**![](data:image/png;base64...)**

1. Sơ đồ luồng xem thông tin user

### Mô tả luồng nghiệp vụ

###

| **STT** | **Bước** | **Mô tả** |
| --- | --- | --- |
|  | Bước 1 | Người dùng click icon ![](data:image/png;base64...)trên màn hình Home |
|  | Bước 2,3 | Hệ thống lấy thông tin người dùng từ bộ nhớ cục bộ.  Dữ liệu được trích xuất từ thông tin đăng nhập và thông tin người dùng được lấy từ hệ thống FIMS với các thông tin bao gồm:   * Họ và tên * Email * Trạng thái hoạt động (status) * Vai trò trên hệ thống (role) * Phòng ban (Department) * Số điện thoại (Phone) * Mã nhân viên (code)   Nếu có thay đổi từ phía FIMS, khi người dùng truy cập màn home, hệ thống sẽ load lại dữ liệu để hiển thị thông tin người dùng mới |

### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện xem thông tin user

### Mô tả màn hình

###

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
|  | ![](data:image/png;base64...) | Button | btn\_exit | * Click button → Đóng pop-up giao diện xem thông tin user đăng nhập (Personal ìnformation) |
|  | ![](data:image/png;base64...) | Button | btn\_logout | * Click button → Hỗ trợ đăng xuất tài khoản hiện tại ra khỏi web theo chức năng [Sign out](#_heading=h.gn8dm6y6i6a1) (kích hoạt popup xác nhận Sign out) |
|  | ![](data:image/png;base64...) | Button | btn\_changePassword | * Button chỉ hiển thị áp dụng cho user là local user * Click button → Hiển thị popup [Đổi mật khẩu](TOSS.SA.CHANGE_PASSWORD.FD.v0.1.md) |
|  | Image | Image | image/userImage | * Hiển thị thông tin bao gồm chữ cái đầu của họ và và chữ cái đầu của tên |
|  | Name | Text | name/userName | * Hiển thị thông tin [fullName] của người dùng * Kiểu dữ liệu: Text, chỉ hiển thị không được sửa * Vị trí dữ liệu: căn giữa |
|  | Email | Text | email/userEmail | * Hiển thị thông tin [userEmail] của tài khoản * Label: Email * Kiểu dữ liệu: Text, chỉ hiển thị không được sửa * Vị trí label: căn trái * Vị trí dữ liệu: căn phải |
|  | Role | Text | Role | * Hiển thị thông tin [role] của tài khoản = Vai trò trên hệ thống (VD: Admin) * Label: Role * Kiểu dữ liệu: Text, chỉ hiển thị không được sửa * Vị trí label: căn trái * Vị trí dữ liệu: căn phải |
|  | Code | Text | code/userCode | * Hiển thị thông tin [userCode] của tài khoản = Mã nhân viên * Không có label “Code” riêng trong bảng, hiển thị trực tiếp ngay dưới tên người dùng (với định dạng text màu xám) * Kiểu dữ liệu: Text, chỉ hiển thị không được sửa * Vị trí label: căn trái * Vị trí dữ liệu: căn phải |
| 9. | Phone | Text |  | * Hiển thị số điện thoại của user * Label: Phone * Kiểu dữ liệu: Text, chỉ hiển thị không được sửa * Vị trí label: căn trái * Vị trí dữ liệu: căn phải * Định dạng: VD: (+84) 623.224.124 |
| 10.. | Department | Text |  | * Hiển thị Department của user (Phòng ban) * Label: Department * Kiểu dữ liệu: Text, chỉ hiển thị không được sửa * Vị trí label: căn trái * Vị trí dữ liệu: căn phải |
| 11. | Status | text | Status | * Hiển thị trạng thái hoạt động của tài khoản * Hiển thị dưới dạng Badge: “● Active” (màu xanh) nằm dưới tên và mã nhân viên. * Kiểu dữ liệu: Text, chỉ hiển thị không được sửa. * Vị trí dữ liệu: Căn giữa |

---

*Nguồn: tách trung thực từ `sec-09-thong-tin-user-dang-nhap.md` (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, mục `Xem thông tin user đăng nhập`) — tương ứng dòng **#4** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
