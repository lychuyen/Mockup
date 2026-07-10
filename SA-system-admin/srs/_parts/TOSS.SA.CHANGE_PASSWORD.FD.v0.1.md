---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.CHANGE_PASSWORD"
feature_name: "Thay đổi mật khẩu (Change password)"
---

## Change password

| **Tên chức năng: Thay đổi mật khẩu** | |
| --- | --- |
| **Mục đích** | Cho phép người dùng thay đổi mật khẩu đăng nhập hệ thống |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn xem thông tin user => Chọn change password |
| **Tiền điều kiện** | Người dùng đăng nhập thành công |
| **Hậu điều kiện** | Màn hình đổi mật khẩu |

###

### Luồng nghiệp vụ

![](data:image/png;base64...)

1. Sơ đồ luồng change password

### Mô tả luồng nghiệp vụ

###

| **STT** | **Bước** | **Mô tả** |
| --- | --- | --- |
|  | Bước 1 | User truy cập vào web FIMS, chọn xem thông tin user |
| 1. 2 | Bước 2 | Hệ thống hiển thị giao diện thông tin chi tiết user |
| 1. 3 | Bước 3 | User chọn button “Change password”  Nếu user không phải là local user thì button này không hiển thị |
| 1. 4 | Bước 4 | Hệ thống hiển thị popup Thay đổi mật khẩu |
| 1. 5 | Bước 5 | User nhập thông tin mật khẩu cũ, mật khẩu mới và xác nhận lại mật khẩu |
| 1. 6 | Bước 6 | WEB thực hiện validate thông tin “Mật khẩu cũ”, “Mật khẩu mới” và “Nhập lại mật khẩu mới” đã được nhập trước đó   * Nếu hợp lệ → chuyển Bước 8 * Nếu không hợp lệ → chuyển Bước 7. Thông báo lỗi   Quy tắc Validate mật khẩu:   * Không trùng với tên đăng nhập * Không trùng với mật khẩu cũ * Regex kiểm tra độ mạnh của mật khẩu mới theo Biểu thức chính quy sau: ^(?=.\*[A-Z])(?=.\*[a-z])(?=.\*[0-9])(?=.\*[^a-zA-Z0-9\.\_]).{8,30}$   + .{8,30}: Chuỗi có độ dài từ 8 đến 30 ký tự   + Trong đó, Chuỗi cần thỏa mãn các điều kiện sau:     - (?=.\*[A-Z]): Có ít nhất một ký tự viết hoa từ A đến Z     - (?=.\*[a-z]): Có ít nhất một ký tự viết thường từ a đến z     - (?=.\*[0-9]): Có ít nhất một ký tự là chữ số từ 0 đến 9     - (?=.\*[^a-zA-Z0-9\.\_]): Có ít nhất một ký tự đặc biệt (Ký tự Khác 0-9, a-z, A-Z, dấu chấm, dấu gạch dưới) |
| 1. 7 | Bước 7 | Hiển thị giao diện thay đổi mật khẩu kèm thông báo lỗi:   * Sai mật khẩu cũ thì hiển thị cảnh báo [VL001](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.t49k888ot8ba) * Mật khẩu mới chưa đáp ứng yêu cầu bảo mật, hiển thị cảnh báo [VL002](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.k5oyyureshae). * Mật khẩu nhập lại chưa khớp, hiển thị cảnh báo [VL003](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.snvem09gvr9l) |
| 1. 8 | Bước 8 | Hệ thống lưu thông tin mật khẩu thay đổi, trả về thông báo thay đổi mật khẩu thành công |

### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện change password

### Mô tả màn hình

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
|  | Recover Password | Text |  | * Gắn cứng trên hệ thống: “Recover Password” |
| 1. 2 | Các quy tắc mật khẩu | Text |  | * Gắn cứng trên hệ thống như trong ảnh |
|  | Old Password | TextBox [8;100] | OldPassword | * Label: “Old password” * Placeholder: “Enter old password” * Mặc định Tắt xem mật khẩu * Cho phép người dùng nhập mật khẩu hiện tại |
| 1. 4 | New password | TextBox [8;100] | newPassword | * Label: “New password” * Placeholder: “Enter a new password” * Mặc định Tắt xem mật khẩu * Cho phép người dùng nhập mật khẩu được ẩn với ký tự “\*” * Khi người dùng click ![](data:image/png;base64...), hiển thị mật khẩu dạng text * Quy tắc Validate mật khẩu:   + Không trùng với tên đăng nhập   + Không trùng với mật khẩu cũ   + Regex kiểm tra độ mạnh của mật khẩu mới theo Biểu thức chính quy sau: ^(?=.\*[A-Z])(?=.\*[a-z])(?=.\*[0-9])(?=.\*[^a-zA-Z0-9\.\_]).{8,100}$     - .{8,100}: Chuỗi có độ dài từ 8 đến 100 ký tự     - Trong đó, Chuỗi cần thỏa mãn các điều kiện sau:       * (?=.\*[A-Z]): Có ít nhất một ký tự viết hoa từ A đến Z       * (?=.\*[a-z]): Có ít nhất một ký tự viết thường từ a đến z       * (?=.\*[0-9]): Có ít nhất một ký tự là chữ số từ 0 đến 9       * (?=.\*[^a-zA-Z0-9\.\_]): Có ít nhất một ký tự đặc biệt (Ký tự Khác 0-9, a-z, A-Z, dấu chấm, dấu gạch dưới) * Điều kiện ràng buộc:   + Nếu bỏ trống => hiển thị cảnh báo [VL004](#bookmark=id.rwqlzog4htjj)   + Nếu nhập mật khẩu mới không thỏa mãn điều kiện validate → Click btn Thay đổi mật khẩu HT cảnh báo [VL002](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.k5oyyureshae) và [TB012](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.eqduhx4b0vb1) |
| 1. 5 | Re-enter new password mới | TextBox [8;100] | confirmPassword | * Label: “Confirm new password” * Placeholder: “Confirm new password” * Mặc định Tắt xem mật khẩu * Cho phép người dùng nhập mật khẩu được ẩn với ký tự “\*” * Khi người dùng click ![](data:image/png;base64...), hiển thị mật khẩu dạng text * Validate: Nhập lại mật khẩu mới phải trùng với Nhập mật khẩu mới đã được nhập ở mục 4. * Điều kiện ràng buộc:   + Nếu bỏ trống” => hiển thị cảnh cáo [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Nếu nhập khác với mật khẩu mới được nhập ở mục 4 → Click btn Thay đổi mật khẩu → HT cảnh báo [VL003](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.snvem09gvr9l) |
| 1. 6 | Recover password | Button | btn\_save | * Click Button → Hệ thống thực hiện check theo thứ tự: validate mật khẩu mới và nhập lại mật khẩu: Nếu không thỏa mãn → Hiển thị lỗi tương ứng |
|  | ![](data:image/png;base64...) | Button | btn\_cancel | Khi người dùng click vào sẽ đóng popup thay đổi pass, quay về màn hình trước đó. |

###

# QUẢN TRỊ HỆ THỐNG

---

*Nguồn: tách trung thực từ `sec-10-change-password.md` (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, mục `Thay đổi mật khẩu (Change password)`) — tương ứng dòng **#5** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
