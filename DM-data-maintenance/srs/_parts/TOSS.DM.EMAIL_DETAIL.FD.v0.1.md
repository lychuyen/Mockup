---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.EMAIL_DETAIL"
feature_name: "Xem chi tiết Email"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xem chi tiết Email

| **Tên chức năng: View detail Email** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem chi tiết Email |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn Danh mục => Email => click vào 1 dòng Email bất kỳ |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Email |
| **Hậu điều kiện** | Màn hình Xem chi tiết Email hiển thị |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

Hình 25. Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | User truy cập vào web FIMS => mở đến module Danh mục=> Email |
| 2 | Hệ thống hiển thị màn hình [danh sách Email](TOSS.DM.EMAIL_LIST.FD.v0.1.md) trên giao diện |
| 3 | User click vào 1 dòng bất kỳ trên [Danh sách Email](TOSS.DM.EMAIL_LIST.FD.v0.1.md) |
| 4 | Hệ thống hiển thị popup View detail Email |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **Detail information** | | | | |
|  | Email | Textview | email | * Hiển thị thông tin [email ] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Password | Textview | password | * Hiển thị thông tin [password] theo dữ liệu API trả về dưới dạng mã hóa * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Status | Textview | status | * Hiển thị thông tin [status] dưới dạng tag status theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Note | Textview | note | * Hiển thị thông tin [note] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Action | Textview |  | Bao gồm các function sau   * Update => Ẩn khi user không được phân quyền Sửa * History => Ẩn khi user không được phân quyền Xem   Click function => mở màn hình chức năng tương ứng |
|  | x | Button | btn\_close | Click button=> Đóng popup, trở về giao diện trước đó, không cần xử lý gì |
|  | Edit | Button | btn\_edit | Click button=> Mở popup Edit Email |
|  | History | Button | btn\_history | Click button=> Mở popup History of Email |

---

*Nguồn: tách trung thực từ `sec-27-quan-ly-danh-sach-email.md`, mục "Xem chi tiết Email" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#33** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
