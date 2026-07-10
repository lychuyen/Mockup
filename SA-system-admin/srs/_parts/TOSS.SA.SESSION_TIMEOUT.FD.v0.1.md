---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.SESSION_TIMEOUT"
feature_name: "Hết phiên đăng nhập"
---

## Hết phiên đăng nhập

###

| **Tên chức năng: Hết phiên đăng nhập** | |
| --- | --- |
| **Mục Đích** | Tự động kết thúc phiên làm việc của người dùng khi quá thời gian đăng nhập cho phép (timeout) để đảm bảo bảo mật |
| **Trigger** | Khi người dùng truy cập web sau một thời gian dài không hoạt động. |
| **Tiền điều kiện** | Người dùng đã từng đăng nhập thành công trước đó.  FE đang lưu trữ một Token kèm thời điểm hết hạn. |
| **Hậu điều kiện** | Hệ thống xử lý API cho phép người dùng thao tác. |

### Luồng nghiệp vụ

![](data:image/png;base64...)

1. Sơ đồ luồng hết phiên đăng nhập

### Mô tả luồng nghiệp vụ

| **STT** | **Bước** | **Mô tả** |
| --- | --- | --- |
|  | Bước 1 | Người dùng truy cập vào hệ thống |
|  | Bước 2 | Ở mỗi request, FE gửi kèm Access Token đã lưu trước đó từ lần đăng nhập thành công.  Khi người dùng đăng nhập thành công, hệ thống tạo một Access Token và tính thời gian hết hạn phiên theo TT (Timeout Time):   * Mặc định: TT = 96 giờ * Nếu người dùng chọn “Remember login”: TT = 30 ngày (30 x 24 giờ) |
|  | Bước 3 | Backend (BE) kiểm tra thời hạn hiệu lực của Access Token này:   * Nếu Token còn hạn → chuyển đến Bước 4.1 tiếp tục xử lý request * Nếu Token đã hết hạn (now ≥ token.exp) → chuyển đến Bước 4.2 trả lỗi về FE |
|  | Bước 4.1 | BE xử lý API thành công  FE hiển thị giao diện màn hình trước khi hết phiên |
|  | Bước 4.2, 5 | BE trả về lỗi có thông báo [TB008](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.wprbbwdb8xj).  FE nhận lỗi và điều hướng người dùng về màn hình đăng nhập. Sau đó, quy trình đăng nhập được thực hiện theo [Chức năng đăng nhập](TOSS.SA.LOGIN.FD.v0.1.md) đã mô tả tại mục 3.1.1. |

###

### Màn hình chức năng

N/A

### Mô tả màn hình

N/A

---

*Nguồn: tách trung thực từ `sec-07-het-phien-dang-nhap.md` (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, mục `Hết phiên đăng nhập`) — tương ứng dòng **#2** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
