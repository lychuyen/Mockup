---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.LOGOUT"
feature_name: "Đăng xuất (Logout)"
---

## Logout

###

| **Tên chức năng: Đăng xuất** | |
| --- | --- |
| **Mục Đích** | Cho phép người dùng kết thúc phiên làm việc hiện tại, đảm bảo an toàn bảo mật cho tài khoản |
| **Trigger** | Người dùng thực hiện thao tác click vào nút “Đăng xuất” trên giao diện hệ xem thông tin user |
| **Tiền điều kiện** | Người dùng đã đăng nhập được vào hệ thống |
| **Hậu điều kiện** | Phiên làm việc của người dùng được huỷ bỏ. |

###

### Luồng nghiệp vụ

![](data:image/png;base64...)

1. Sơ đồ luồng logout

### Mô tả luồng nghiệp vụ

###

| **STT** | **Bước** | **Mô tả** |
| --- | --- | --- |
|  | Bước 1 | Người dùng click nút “Sign out” trên màn hình Personal information. |
|  | Bước 2-5 | * Kịch bản hoạt động:   + 1 - Người dùng click nút “Sign out” trên màn hình Personal information   + 2 - FE hiển thị popup xác nhận Sign out với thông báo: “ Are you sure you want to sign out?”   + 3 - Nếu người dùng bấm “Cancel” (hoặc icon X): FE đóng popup, giữ nguyên trạng thái làm việc.   + 4 - Nếu người dùng bấm nút “Sign out”(màu đỏ) trên popup: FE gọi API logout kèm theo Access Token, đồng thời thực hiện xóa token khỏi local và chuyển đến màn hình Login   + 5- BE kiểm tra token, thực hiện thu hồi token và ghi log. |

### Màn hình chức năng

![](data:image/png;base64...)

![](data:image/png;base64...)

1. Giao diện logout

### Mô tả màn hình

###

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
|  | ![](data:image/png;base64...) | Button | btn\_logout | * Cho phép người dùng chủ động kết thúc phiên đăng nhập * Label: “Sign out” ((kèm icon 🚪) * Khi click btn Sign out, FE hiển thị Popup xác nhận đăng xuất: * Icon: Icon cảnh báo ❗ màu đỏ ở góc trái trên. * Nội dung: "Are you sure you want to sign out?". * Nút Cancel: Button viền (outlined), click → đóng popup, quay lại màn hình trước đó. * Nút Sign out: Button đỏ (filled), click-> chính thức gửi request đăng xuất * Icon X: Góc phải trên, click → đóng popup.   + Case thành công:   {  "status": "success",  "message": "Đăng xuất thành công."  }   * + Case lỗi:     - Lỗi hệ thống:   {  "status": "error",  "message": "Có lỗi xảy ra. Vui lòng thử lại."  }   * FE xử lý response:   + Case thành công:     - * Hiển thị thông báo [TB009](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.y5wdq7jbraf8)       * Xoá token khỏi local/session       * Điều hướng về màn hình Login   + Case lỗi:     - Lỗi token không hợp lệ/hết hạn       * Hiển thị thông báo [TB010](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.tpftwfivnp6a)       * Xóa token nếu còn       * Chuyển về màn Login     - Lỗi hệ thống:       * Hiển thị thông báo [TB011](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.e6e7xtbfmtoo)       * Không redirect, giữ nguyên trạng thái |

---

*Nguồn: tách trung thực từ `sec-08-logout.md` (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, mục `Đăng xuất (Logout)`) — tương ứng dòng **#3** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
