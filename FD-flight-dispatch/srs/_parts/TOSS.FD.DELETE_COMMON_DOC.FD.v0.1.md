---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Dispatch"
feature_id: "TOSS.FD.DELETE_COMMON_DOC"
feature_name: "Xoá tài liệu chung chuyến bay"
group: "Upload Document"
---

## Xoá tài liệu chung chuyến bay

| **Tên chức năng: Xoá tài liệu chung chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Xoá tài liệu chung chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => mở đến module Flight Dispatch -> chọn Upload Document |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền vào Upload Document |
| **Hậu điều kiện** | Xóa thành công 1 tài liệu khỏi danh sách |

###

### Sơ đồ nghiệp vụ

![](data:image/png;base64...)

### Mô tả luồng nghiệp vụ

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | Người dùng tích chọn một hoặc nhiều tài liệu cần xóa hoặc nhấn biểu tượng **Xóa** tại dòng tài liệu tương ứng. |
| 2 | Hệ thống hiển thị popup xác nhận xóa tài liệu. Nếu người dùng chọn **Hủy**, popup được đóng và không thực hiện xóa. Nếu người dùng chọn **Xác nhận**, hệ thống tiếp tục xử lý xóa tài liệu. |
| 3 | Hệ thống xóa tệp khỏi sách, cập nhật dữ liệu trong cơ sở dữ liệu và ghi log audit cho thao tác xóa. |
| 4 | Hệ thống hiển thị thông báo (toast) **"Xóa tài liệu thành công"**. Luồng kết thúc |

### Màn hình chức năng

![](data:image/png;base64...)

### Mô tả màn hình chức năng

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| 1 | Icon cảnh báo | Icon |  | * Hiển thị biểu tượng cảnh báo nhằm thông báo cho người dùng đây là thao tác có ảnh hưởng đến dữ liệu và yêu cầu xác nhận trước khi thực hiện. |
| 2 | Nút đóng | Button |  | * Cho phép người dùng đóng hộp thoại xác nhận. * Khi nhấn, hệ thống đóng popup và hủy thao tác xóa, không thực hiện bất kỳ thay đổi nào đối với dữ liệu. |
| 3 | Tiêu đề xác nhận | Label |  | * Hiển thị thông điệp xác nhận xóa tài liệu theo định dạng: **"Are you sure you want to delete [Document Name\_Version]? "**   + Trong đó **[Document Name\_Version]** được thay thế bằng tên và phiên bản của tài liệu được chọn. |
| 4 | Nội dung cảnh báo | Label |  | * Hiển thị thông báo cho người dùng biết rằng sau khi tài liệu bị xóa sẽ không còn xuất hiện trong danh sách tài liệu. Nội dung: **"Please note that after deletion, you will not be able to access this document. "** |
| 5 | Nút Cancel (Hủy) | Button |  | * Cho phép người dùng hủy thao tác xóa. * Khi nhấn, hệ thống đóng hộp thoại xác nhận và không thực hiện xóa tài liệu |
| 6 | Nút Save (Xác nhận ) | Button |  | * Cho phép người dùng xác nhận thao tác xóa tài liệu. * Khi nhấn, hệ thống thực hiện xóa tài liệu khỏi hệ thống. * Nếu xóa thành công, hệ thống đóng hộp thoại, cập nhật lại danh sách tài liệu và hiển thị thông báo thành công (nếu có). * Nếu xảy ra lỗi trong quá trình xóa, hệ thống giữ nguyên dữ liệu và hiển thị thông báo lỗi phù hợp. |

---

> **Nguồn gốc (truy vết):** Tách trung thực từ `sec-11-xoa-tai-lieu-chung-chuyen-bay.md` — mảnh phân rã `TOSS.FD.ALL.FD.v0.1.md` (SRS Flight Dispatch v0.1, người soạn VNA/VTIT, nguồn Google Drive live pull 2026-07-10) — ứng với dòng **#8** bảng §1 trong [CATALOG.md](CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0). Lưu ý cờ đã ghi tại CATALOG.md §2.7: Trigger trong bảng đầu mục không khớp Bước 1 của luồng nghiệp vụ thực tế [Cần làm rõ].
