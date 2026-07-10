---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "VNA/VTIT (nguồn SRS) — trích tách bởi agent BA"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Load Control"
feature_id: "TOSS.FLC.UPLOAD_FLIGHT_DOC"
feature_name: "Upload tài liệu chuyến bay"
group: "Document"
---

> **Phạm vi file:** Feature F03 (nhóm Document) — trích trung thực 100% từ nguồn SRS Flight Load Control do người soạn (CLAUDE.md §0), không suy diễn, không bổ sung. Cờ điểm cần xác nhận: xem CATALOG.md dòng #3.

## **Upload tài liệu chuyến bay**

| **Tên chức năng: Upload tài liệu chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user upload tài liệu chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Document => Nhấn vào một bản ghi bất kỳ => Hiển thị details chuyến bay => Nhấn tab tài liệu |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền chức năng upload tại phân hệ Flight load control |
| **Hậu điều kiện** | Upload tài liệu chuyến bay thành công |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1,2 | Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Document.  Hệ thống gọi API và hiển thị danh sách chuyến bay cùng trạng thái tài liệu lên màn hình |
| 3 | Người dùng nhấn vào một bản ghi chuyến bay bất kỳ trên danh sách |
| 4 | Hiển thị màn hình *“Chi tiết chuyến bay”* |
| 5 | Tại màn hình chi tiết người dùng chọn loại tài liệu cần Upload thông qua các Tab: Load Sheet, Gen.Declaration hoặc Pax Manifest. |
| 6 | Người dùng thực hiện **kéo thả file (Drag & drop)** vào vùng chỉ định, HOẶC nhấn button ![](data:image/png;base64...) để duyệt và chọn file từ thiết bị |
| 7 | Hệ thống tiến hành vadidate nếu   * Nếu file không hợp lệ chuyển sang Bước 8 * Nếu file hợp lệ chuyển sang bước 9 |
| 8 | Hệ thống hiển thị Toast Message báo lỗi: *“Failed to upload document. Please try again”*. Tiến trình tài file bị hủy, người dùng có thể chọn lại file khác |
| 9 | Hệ thống cập nhật dữ liệu vào DB |
| 10 | FE hiển thị Toast Message thành công : “*Document uploaded successfully*” |

### **Màn hình chức năng**

![](data:image/png;base64...)

![](data:image/png;base64...)

### **Mô tả chi tiết màn hình**

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| 1 | Title | Textview |  | * Text cứng “Drag [tên tài liệu LS/GD/PM] file here” |
| 2 | Chú thích | Textview |  | * Hiển thị chú thích các định dạng tài liệu được hỗ trợ: “Accepted formats are .pdf,.txt (maximum 5MB) “ |
| 3 | ![](data:image/png;base64...) | Button |  | * Quy tắc đặt tên file tài liệu:   + Cấu trúc: ***[tên tài liệu]\_[mã chuyến bay]\_[R<số phiên bản>]\_[ngày cất cánh dự kiến].[định dạng tên file***]   + Tên tài liệu: LOADSHEET/GD/PM   + Ngày cất cánh dự kiến định dạng: DD/MMM/YY   + Định dạng file: Chỉ phép định dạng file txt, pdf   *Ví dụ: LOADSHEET\_VN343\_R01\_02JUL26.TXT*   * Button “Select file” cho phép chọn tài liệu hoặc kéo thả file vào khu vực button để upload * Chặn tất cả các thao tác trên màn khi user đang thực hiện upload file * Các TH lỗi => Thực hiện disable button Upload   + TH upload file không đúng quy tắc đặt tên => Hiển thị IM: “*Invalid document name*”   + TH upload file không đúng định dạng hiển thị IM: *“Invalid file format. Only .txt and .pdf files are supported”*   + TH upload file mà vượt quá dung lượng=> Thông báo lỗi nếu tệp vượt quá giới hạn kích thước *“The file is too large. Please upload a file smaller than 5MB.”*   + Thông báo lỗi nếu lỗi xảy ra/mất mạng: *Failed to upload document. Please try again”*   + TH file tài liệu đã được upload cho chuyến bay khác, người dùng tiếp tục thực hiện upload file đó => Hiển thị IM*: “File already uploaded for another flight.”*   + TH tên file vượt quá độ rộng box => hiển thị dấu …..tooltips hiển thị full tên file * ![](data:image/png;base64...) : Click icon xóa tại tên tài liệu => xóa file hiện tại và hiển thị lại button ![](data:image/png;base64...) * User nhấn ![](data:image/png;base64...)=> Hiển thị popup xác nhận upload:   ![](data:image/png;base64...)   | ![](data:image/png;base64...) | * Fix cứng icon và không cho thao tác | | --- | --- | | ![](data:image/png;base64...) | * Click icon x => quay trở lại màn trước đó | | Content | “Are you sure you want to upload [Document Name]? “ | | ![](data:image/png;base64...) | * Click button => Quay trở lại màn trước đó | | ![](data:image/png;base64...) | * Click button => Hiển thị giao diện Processing: * ![](data:image/png;base64...) * Khi tài liệu được upload => Hệ thống cập nhật trạng thái tài liệu + thời gian upload + Rev tài liệu lên màn hình. Hiển thị tài liệu lên đầu bảng thông tin tài liệu.   + Chuyển trạng thái tài liệu về AWAIT ACK (màu vàng)   + Hiển thị toast thông báo upload thành công “*Document uploaded successfully*”   + Đồng thời bắn noti về MO cập nhật tài liệu | |

##

---

**Nguồn trích:** `sec-06-upload-tai-lieu-chuyen-bay.md` (mảnh phân rã h2 từ `TOSS.FLC.ALL.FD.v0.1.md`, đã xóa sau khi tách theo Feature — git giữ lịch sử) · CATALOG.md dòng #3.
