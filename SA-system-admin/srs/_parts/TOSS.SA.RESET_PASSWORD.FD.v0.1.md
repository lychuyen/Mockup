---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.RESET_PASSWORD"
feature_name: "Lấy lại mật khẩu"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Lấy lại mật khẩu

| **Tên chức năng: Lấy lại mật khẩu** | |
| --- | --- |
| **Mục đích** | Chức năng cho phép user là admin được phân quyền lấy lại mật khẩu thực hiện Lấy lại mật khẩu |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý người dùng => nhấn vào Xem lịch sửNgười dùng=> Chọn Lấy lại mật khẩu |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Quản lý người dùng |
| **Hậu điều kiện** | Màn hình lấy lại mật khẩu |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

Hình: Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | 1 | User truy cập vào web FIMS => mở đến module Quản lý người dùng =>hiển thị màn hình [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) trên giao diện=> click Xem chi tiết 1 bản ghi |
|  | 2,3 | Hệ thống call API lấy dữ liệu hiển thị giao diện thông tin chi tiết user |
|  | 4 | User click button” Lấy lại mật khẩu” |
|  | 5 | Hiển thị popup Lấy lại mật khẩu |
|  | 6 | User nhập thông tin mật khẩu mới và xác nhận lại mật khẩu |
|  | 7 | Lấy lại mật khẩu thành công, thông báo tới user |

#### Màn hình chức năng

![](data:image/png;base64...)

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **I** | **Đối tượng** |  |  | **Chức năng cho admin hệ thống được phân quyền lấy lại mật khẩu=> Hiển thị button Lấy lại mật khẩu**  **User không có quyền lấy lại mật khẩu=> Ẩn chức năng lấy lại mật khẩu** |
| 1 | Avatar | Image | avatar | * Hiển thị [avatar] * Không cho thao tác * Trường hợp trả về null hoặc lỗi hiển thị avatar mặc dịnh |
| 2 | Full name | Textview | full\_name/fullName | * Hiển thị [fullName] * Không cho thao tác |
| 3 | Employee Code | Textview | employee\_code/employeeCode | * Hiển thị [employeeCode] * Không cho thao tác |
| 4 | Status | TagStatus | active\_status | * Hiển thị [active\_status]   + Đang hoạt động: Màu xanh lá   + Ngừng hoạt động: Màu xám * Không cho thao tác |
| 5 | New password | Textbox | new\_password/newPassword | * Bắt buộc nhập * Placeholder: “Nhập mật khẩu mới” * Nhận dữ liệu dạng chữ, số nguyên, ký tự đặc biệt * Không chấp nhận ký tự tiếng Việt có dấu (như đ, á, à,...) * Không trim space, hệ thống hiển thị lỗi validation nếu mật khẩu chứa khoảng trắng. * Valid độ dài {8; 100} ký tự, chặn khi nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động mã hóa dữ liệu và hiển thị \*\*\* khi người dùng nhập mật khẩu * Click ![](data:image/png;base64...) => hiển thị mật khẩu trong box, icon chuyển sang trạng thái ![](data:image/png;base64...). Nhấn icon ![](data:image/png;base64...) => ẩn mật khẩu và đổi lại icon ![](data:image/png;base64...) * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp mật khẩu ngắn (<8 ký tự) => hiển thị thông báo IM: [VL008](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.1a8lxr3bxlsg)   + Trong mật khẩu yêu cầu bắt buộc phải có 1 ký tự viết hoa, viết thường, số và ký tự đặc biệt |
| 6 | Re-enter new password | Textbox | old\_password/oldPassword | * Bắt buộc nhập * Placeholder: “Nhập mật khẩu mới” * Nhận dữ liệu dạng chữ, số nguyên, ký tự đặc biệt * Valid độ dài {8; 100} ký tự, chặn khi nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động mã hóa dữ liệu và hiển thị \*\*\* khi người dùng nhập mật khẩu * Click ![](data:image/png;base64...) => hiển thị mật khẩu trong box, icon chuyển sang trạng thái ![](data:image/png;base64...). Nhấn icon ![](data:image/png;base64...) => ẩn mật khẩu và đổi lại icon ![](data:image/png;base64...) * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp mật khẩu ngắn (<8 ký tự) => hiển thị thông báo IM: [VL008](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.1a8lxr3bxlsg)   + Trong mật khẩu yêu cầu bắt buộc phải có 1 ký tự viết hoa, viết thường, số và ký tự đặc biệt |
| 7 | Cancel/ button x | Button | btn\_cancel | * Luôn enable, click button đóng popup, hệ thống không cần xử lý gì thêm |
|  | Recover password | Button | btn\_forgotPassword | * Luôn enable, click button hệ thống thực hiện kiểm tra   + Nếu nhập thông tin trường Nhập lại mật khẩu mới không trùng thông tin trường Mật khẩu mới=> Hệ thống hiển thị error message: “ Mật khẩu mới và nhập lại mật khẩu không trùng nhau”   + Nếu nhập thông tin đúng và đủ, hệ thống thực hiện:   + Đổi mật khẩu mới cho tài khoản=>Tài khoản đang đăng nhập hệ thống với mật khẩu cũ tự đóng log out và yêu cầu người dùng nhập lại thông tin mật khẩu mới để đăng nhập  + Hiển thị thông báo: Lấy lại mật khẩu thành công  + Hệ thống tự động gửi mail cho user được lấy lại mật khẩu( user cần lấy lại mật khẩu)   * **Nội dung email**   Tiêu đề mail:Thông báo thay đổi mật khẩu trên hệ thống System Admin [@Ngày hệ thống]  Nội dung mail:  Kính gửi Anh/Chị **[@ họ tên user ]**,  Tổng Công Ty HKVN kính gửi anh/chị thông tin mật khẩu mới tài khoản đăng nhập trên hệ thống System Admin như sau:  **Thông tin mật khẩu: …**                        ……………  Vui lòng truy cập vào hệ thống và nhập thông tin mật khẩu mới để đăng nhập và sử dụng  Mọi phản hồi Anh/Chị vui lòng gửi về địa chỉ vnaefb.occ@vietnamairlines.com.  Trân trọng. |

---

*Nguồn: tách trung thực từ `sec-11-quan-ly-nguoi-dung.md`, mục "Lấy lại mật khẩu" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#14** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
