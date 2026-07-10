---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.RESTORE_ROLE"
feature_name: "Khôi phục vai trò"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Khôi phục vai trò

| **Tên chức năng: Khôi phục vai trò** | |
| --- | --- |
| **Mục đích** | Cho phép người dùng **Khôi phục vai trò** |
| **Trigger** | Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Quản lý vai trò => Chọn Khôi phụcvai trò |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Khôi phụcvai trò/phân hệ Quản lý vai trò |
| **Hậu điều kiện** | Màn hình xác nhận **Khôi phục vai trò** được hiển thị với người dùng |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
|  | * Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Vai trò |
|  | * Nhấn icon/button Khôi phục vai trò màn Danh sách hoặc màn view chi tiết |
|  | * Mở màn hình xác nhận **Khôi phục vai trò** |
|  | * Người dùng nhập **Lý do** và nhấn button **Lưu lại** |
|  | * Hệ thống kiểm tra dữ liệu, nếu:   + Dữ liệu không hợp lệ: chuyển sang bước 6   + Ngược lại: chuyển sang bước 7 |
|  | * Hiển thị toast message lỗi đến người dùng |
|  | * Update dữ liệu vào DB |
|  | * Hiển thị toast message Khôi phục thành công |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Popup các nhận khôi phục vai trò

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | ![](data:image/png;base64...) | Icon |  | * Icon confirm ![](data:image/png;base64...) * Không cho thao tác |
|  | ![](data:image/png;base64...) | Icon |  | * Icon đóng popup * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Title | Textview |  | * Hiển thị [Are you sure you want to restore it?] * Không cho thao tác |
|  | Content | Textview |  | * Hiển thị [Are you sure you want to restore Roles: <Role Code>?] * Trong đó: <Role Code> lấy theo thông tin của vai trò được khôi phục * Không cho thao tác |
|  | Reason | Textbox |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder: “Please enter reason...” * Tối đa: 1000 ký tự bao gồm chữ, số và ký tự đặc biệt * Chặn nếu nhập quá 1000 ký tự * Nếu paste đoạn văn > 1000 ký tự, chỉ nhận 1000 ký tự đầu tiên * Bắt buộc nhập * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo inline:” Đây là trường thông tin bắt buộc nhập” |
|  | Lưu ý | Textview |  | * Icon ![](data:image/png;base64...) * Nội dung: “Note that after restoration, all Users assigned to these Roles will be able to operate according to the permissions of those Roles” |
|  | Cancel | Button |  | * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Save | Button |  | Click:   * Đóng popup xác nhận * FE call API update trạng thái hoạt động của vai trò thành **Đang hoạt động** * Xử lý Response API trả về, nếu:   **Status = 200**:   * + Hiển thị toast message thành công   ![](data:image/png;base64...)   * + Sau 3s hoặc người dùng bấm X: đóng toast   + Vai trò được cập nhật trạng thái **Đang hoạt động** và có hiệu lực trở lại.   + **User đã được gán vai trò này trước đó** sẽ **được khôi phục lại quyền truy cập** theo cấu hình của vai trò.   + Người dùng có thể **tiếp tục sử dụng các chức năng/phân hệ** thuộc vai trò được khôi phục.   + Update trạng thái của vai trò trên danh sách thành **Đang hoạt động**   + Update Toggle switch button **Hoạt động** thành **On**   + Update list icon function theo trạng thái hoạt động   + Mở quyền theo vai trò của các user được gán với vai trò được khôi phục   **Status ≠ 200**:   * + Hiển thị toast message lỗi   ![](data:image/png;base64...)   * + Sau 3s hoặc người dùng bấm X: đóng toast   + Hệ thống không cần xử lý gì |

---

*Nguồn: tách trung thực từ `sec-12-quan-ly-vai-tro.md`, mục "Khôi phục vai trò" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#20** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
