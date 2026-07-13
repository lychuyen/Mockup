---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.DELETE_ROLE"
feature_name: "Xóa vai trò"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Xóa vai trò

| **Tên chức năng: Xóa vai trò** | |
| --- | --- |
| **Mục đích** | Cho phép người dùng **Xóa vai trò** |
| **Trigger** | Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Quản lý vai trò => Chọn Xóa vai trò |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Xóa vai trò/phân hệ Quản lý vai trò |
| **Hậu điều kiện** | Màn hình xác nhận **Xóa vai trò** được hiển thị với người dùng |

#### Sơ đồ luồng hệ thống

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
|  | * Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị Admin chọn menu vai trò |
|  | * Nhấn icon Xóa tại **danh sách** hoặc button Xóa tại màn hình **Sửa** |
|  | * Mở màn hình xác nhận **Xóa vai trò** |
|  | * Người dùng nhập **Lý do** và nhấn button **Lưu lại** |
|  | * Hệ thống kiểm tra dữ liệu, nếu:   + Dữ liệu không hợp lệ: chuyển sang bước 6   + Ngược lại: chuyển sang bước 7 |
|  | * Hiển thị toast message lỗi đến người dùng |
|  | * Update dữ liệu vào DB |
|  | * Hiển thị toast message Xóa thành công |

#### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Popup xóa vai trò

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Icon |  | * Icon confirm *(hình ảnh minh họa — xem file gốc/Google Doc)* * Không cho thao tác |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Icon |  | * Icon đóng popup * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Title | Textview |  | * Hiển thị [Are you sure you want to delete it?] * Không cho thao tác |
|  | Content | Textview |  | * Hiển thị [Are you sure you want to delete Roles: <Role Code>?] * Trong đó: <Role Code> lấy theo thông tin của vai trò bị xóa * Không cho thao tác |
|  | Reason | Textbox |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder: “Vui lòng nhập lý do...” * Tối đa: 1000 ký tự bao gồm chữ, số và ký tự đặc biệt * Chặn nếu nhập quá 1000 ký tự * Nếu paste đoạn văn > 1000 ký tự, chỉ nhận 1000 ký tự đầu tiên * Bắt buộc nhập * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo inline:” Đây là trường thông tin bắt buộc nhập” |
|  | Lưu ý | Textview |  | * Icon *(hình ảnh minh họa — xem file gốc/Google Doc)* * Nội dung: “Please note that after deletion, all Users assigned to these Roles will no longer be able to perform actions with the permissions associated with those Roles.” |
|  | Cancel | Button |  | * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Save | Button |  | Click:   * Đóng popup xác nhận * FE call API update trạng thái hoạt động của vai trò thành **Đã xóa** * Xử lý Response API trả về, nếu:   **Status = 200**:   * + Hiển thị toast message thành công   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + Sau 3s hoặc người dùng bấm X: đóng toast   + Update trạng thái của vai trò trên danh sách thành **Đã xóa,** không còn hiệu lực sử dụng.   + U**ser được gán với vai trò bị xóa** sẽ **bị thu hồi toàn bộ quyền** theo vai trò đó.   + Người dùng **không thể truy cập** các chức năng/phân hệ thuộc vai trò đã bị xóa.   + Update Toggle switch button **Hoạt động** thành **Off**   + Update list icon function theo trạng thái hoạt động   + Chặn quyền theo vai trò của các user được gán với vai trò bị xóa   **Status ≠ 200**:   * + Hiển thị toast message lỗi   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + Sau 3s hoặc người dùng bấm X: đóng toast   + Hệ thống không cần xử lý gì |

---

*Nguồn: tách trung thực từ `sec-12-quan-ly-vai-tro.md`, mục "Xóa vai trò" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#19** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
