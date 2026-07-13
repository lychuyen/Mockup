---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.ROLE_DETAIL"
feature_name: "Xem vai trò"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Xem vai trò

*(hình ảnh minh họa — xem file gốc/Google Doc)*

*(hình ảnh minh họa — xem file gốc/Google Doc)*

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** | |
| --- | --- | --- | --- | --- | --- |
|  | Role Name | Textview |  | Hiển thị [Role Name] theo dữ liệu API trả về | |
|  | Role Code | Textview |  | Hiển thị [Role Code] theo dữ liệu API trả về | |
|  | Status | TagStatus |  | * Hiển thị TagStatus theo dữ liệu API trả về   + Status=Active: Tag màu xanh lá   + Status=Inactive: Tag màu xám   + Status=Deleted: Tag màu đỏ | |
|  | Function | Button |  | * Hiển thị các function theo trạng thái (chi tiết được mô tả tại Bảng function theo trạng thái hoạt động của vai trò/[Mô tả chi tiết màn hình danh sách](https://docs.google.com/document/d/11hp5UbcDLXGUWg--FudOX8CiILbqZwy6/edit#heading=h.3e23ne0)) * Click **Edit** mở màn hình [sửa vai trò](TOSS.SA.ADD_EDIT_ROLE.FD.v0.1.md) * Click **Delete** mở màn hình [xóa vai trò](TOSS.SA.DELETE_ROLE.FD.v0.1.md) | |
|  | User Permissions | Tab table |  | * Hiển thị giao diện bảng theo mô tả tại mục [phân quyền người dùng](TOSS.SA.ASSIGN_ROLE.FD.v0.1.md) * Tick/bỏ tick các action theo cấu hình quyền của vai trò * Disable thao tác On/Off Toggle switch button và Disable Tick/bỏ tick checkbox action tại màn hình này | |
|  | User list | Tab table |  | Hiển thị giao diện bảng [danh sách người dùng](../TOSS.SA.USER/TOSS.SA.USER_LIST.FD.v0.1.md) đã được gán vài trò | |
| **Bảng [Danh sách người dùng](../TOSS.SA.USER/TOSS.SA.USER_LIST.FD.v0.1.md)**: Hiển thị danh sách các user được phân quyền theo vai trò | | | | | |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Khi người dùng nhấn vào biểu tượng **Filter**:   + Hệ thống hiển thị khung/bảng lọc dữ liệu.   + Người dùng có thể chọn một hoặc nhiều tiêu chí lọc (ví dụ: trạng thái, phòng ban, hệ thống,…). * Hệ thống cập nhật và hiển thị danh sách dữ liệu phù hợp với điều kiện lọc đã chọn. * Cho phép kết hợp nhiều điều kiện lọc cùng lúc. * Cho phép xóa điều kiện lọc để quay về danh sách mặc định. | |
|  | TT | Textview |  | Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo | |
|  | Full name | Textview |  | * Hiển thị thông tin Người sử dụng * *(hình ảnh minh họa — xem file gốc/Google Doc)*: [Username] * *(hình ảnh minh họa — xem file gốc/Google Doc)*[User ID] | |
|  | Phone number | Textview |  | Hiển thị thông tin liên hệ của người dùng bao gồm:   * [Phone number] | |
|  | Email | Textview |  | Hiển thị thông tin liên hệ của người dùng bao gồm:   * [Email] | |
|  | Department | Textview |  | Hiển thị thông tin [[Department] của người dùng | |
|  | Status | TagStatus |  | Hiển thị thông tin [Trạng thái hoạt động] của người dùng dưới dạng tagStatus, trong đó:   * Active: Màu xanh lá * Inactive: Màu xám | |
| 13 | Footer |  |  | Tham chiếu kịch bản [chân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=id.hy5fbrqw7e44) | |

---

*Nguồn: tách trung thực từ `sec-12-quan-ly-vai-tro.md`, mục "Xem vai trò" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#16** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
