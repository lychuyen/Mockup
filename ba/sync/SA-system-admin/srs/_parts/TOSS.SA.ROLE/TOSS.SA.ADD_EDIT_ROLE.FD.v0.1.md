---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.ADD_EDIT_ROLE"
feature_name: "Thêm/Sửa vai trò"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Thêm/Sửa vai trò

| **Tên chức năng: Thêm/Sửa vai trò** | |
| --- | --- |
| **Mục đích** | Cho phép người dùng Thêm/Sửa vai trò |
| **Trigger** | Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Quản lý vai trò => Chọn button “Khởi tạo” để thêm vai trò hoặc chọn icon “Sửa” để Sửa vai trò |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Thêm mới; Sửa vai trò/phân hệ Quản lý vai trò |
| **Hậu điều kiện** | Màn hình cập nhật vai trò được hiển thị với người dùng |

#### Sơ đồ luồng hệ thống

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
|  | * Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Quản lý vai trò |
|  | * Nhấn button **Khởi tạo**hoặc icon**Sửa**tại dòng vai trò |
|  | * Mở màn hình **Thêm mới/Sửa vai trò** |
|  | * Người dùng nhập thông tin và nhấn button **Lưu lại** |
|  | * Hệ thống kiểm tra dữ liệu, nếu:   + Dữ liệu không hợp lệ: chuyển sang bước 6   + Ngược lại: chuyển sang bước 7 |
|  | * Hiển thị toast message lỗi đến người dùng |
|  | * Update dữ liệu vào DB |
|  | * Hiển thị toast message Thêm mới/Sửa thành công; Đóng màn hình cập nhật |

#### Màn hình chức năng

***(hình ảnh minh họa — xem file gốc/Google Doc)***

***(hình ảnh minh họa — xem file gốc/Google Doc)***

1. Thêm vai trò

*(hình ảnh minh họa — xem file gốc/Google Doc)*

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Sửa vai trò

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **Thông tin vai trò** | | | | |
|  | Role Code | Textbox |  | * TH **Thêm mới**:   + Mặc định: Để trống và cho nhập thông tin   + Placeholder “Enter role code”   + Bắt buộc nhập   + Validate chặn trùng mã vai trò * TH **Sửa**:   + Hiển thị [Role Code]   + Dis box nếu vai trò đó là Admin tổng/Admin module sinh mặc định * Maxlength 20 ký tự. Chặn nếu nhập quá 20 ký tự * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [_]; dấu chấm [.]; dấu gạch chéo [/]   + Chặn trùng dữ liệu * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 20 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * Bắt buộc nhập * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo inline [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp **Mã vai trò đã tồn tại** ⇒ Hiển thị thông báo toast: The role code already exists.” |
|  | Roles name | Textbox |  | * TH **Thêm mới**:   + Mặc định: Để trống và cho nhập thông tin   + Placeholder “Enter Roles name”   + Bắt buộc nhập   + Validate chặn trùng tên. Hiển thị thông báo khi nhập trùng “The role name already exists.” * TH **Sửa**:   + Hiển thị [Roles name ]   + Dis box nếu vai trò đó là Admin tổng/Admin module sinh mặc định * Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự * Nhận dữ liệu chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * Bắt buộc nhập * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo inline [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
|  | System |  |  | * TH **Thêm mới:**   + Mặc định: Để trống và cho nhập thông tin   + Placeholder “Select system”   + Bắt buộc nhập   + Chỉ cho phép chọn 1. * TH **Sửa**:   + Hiển thị [System] trả từ api   + Nếu vai trò đang sửa là Admin tổng/Admin module sinh mặc định:     - Dis box     - default [All] với Admin tổng     - default [tên hệ thống tương ứng] với Admin module * Giá trị trong combobox bao gồm   + **System Admin**   + **Toss** * Bắt buộc chọn * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo inline [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
|  | User Permissions | Tab table |  | * Chỉ hiển thị khi người dùng chọn Hệ thống * Hiển thị giao diện và kịch bản bảng theo mô tả tại mục [Phân quyền người dùng](https://docs.google.com/document/d/11hp5UbcDLXGUWg--FudOX8CiILbqZwy6/edit#heading=h.2ex5uie) * Đối với màn hình **Edit**: Hiển thị trạng thái Tick/bỏ tick các action theo cấu hình quyền của vai trò |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Click: *(hình ảnh minh họa — xem file gốc/Google Doc)* màn hình Thêm/Sửa và không cần xử lý gì   Lưu ý: TH user có update bảng [danh sách người dùng](../TOSS.SA.USER/TOSS.SA.USER_LIST.FD.v0.1.md) của Vai trò => tại thao tác chuyển bảng người dùng > hệ thống call API update danh sách ngay khi chuyển và ghi nhận kết quả ngay trên bảng => User nhấn Đóng thì bảng danh sách vẫn được update theo thao tác trước đó |
| 6. | Cancel | Button |  | * Click: Đóng màn hình Thêm mới/Sửa và không cần xử lý gì * Hiển thị với màn Thêm mới/Sửa |
| 7. | Save | Button |  | * Click:   + Đóng màn hình Thêm mới/Sửa   + Call API Update dữ liệu Vai trò vào database   + Hiển thị màn hình thông báo kết quả update nếu:     - Response API trả về Thêm mới/Sửa thành công   *(hình ảnh minh họa — xem file gốc/Google Doc)*  *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + - Ngược lại: hiển thị Thêm mới/Sửa không thành công   *(hình ảnh minh họa — xem file gốc/Google Doc)*  *(hình ảnh minh họa — xem file gốc/Google Doc)* |
| **Quyền của người dùng**   * Màn hình hiển thị danh sách các phân hệ nghiệp vụ dưới dạng tab gồm: * Flight Operations * Crew Management * Aircraft & Maintenance * Airport & Ground, …. * Cho phép người dùng chuyển đổi giữa các phân hệ để cấu hình quyền tương ứng * Khi chuyển tab, hệ thống hiển thị danh sách quyền của phân hệ được chọn | | | | |
|  | Full Permissions | Toggle |  | * Cho phép bật/tắt toàn quyền đối với phân hệ đang chọn * Trạng thái mặc định lấy theo dữ liệu API trả về * Khi **bật Full Permissions**:   + Tự động tick tất cả các quyền chi tiết thuộc phân hệ   + Không cho phép thao tác tick/bỏ tick từng quyền riêng lẻ * Khi tắt **Full Permissions**:   + Cho phép người dùng tick/bỏ tick từng quyền chi tiết * Đối với màn hình **Sửa**: Hiển thị trạng thái Tick/bỏ tick **Full Permissions** theo cấu hình quyền của vai trò |
| 6. | List of permissions | Checkbox list |  | * Hiển thị danh sách các quyền chức năng thuộc phân hệ được chọn * Ví dụ đối với phân hệ **Flight Operations**:   + Flight schedule   + Assign crew   + Create / Edit flight   + View operational notes   + Update flight status   + Lock flight   + Export flight report * Cho phép tick/bỏ tick từng quyền để gán hoặc thu hồi quyền cho vai trò * Trạng thái checkbox được hiển thị theo dữ liệu API trả về * Trường hợp **Full Permissions** đang bật:   + Các checkbox quyền chi tiết được tự động tick   + Chặn thao tác tại các checkbox này * Đối với màn hình **Sửa**: Hiển thị trạng thái Tick/bỏ tick các action theo cấu hình quyền của vai trò |
| **[Danh sách người dùng](../TOSS.SA.USER/TOSS.SA.USER_LIST.FD.v0.1.md)**   * Màn hình hiển thị 2 bảng danh sách, bao gồm: * Bảng 1 - Hiển thị [danh sách người dùng](../TOSS.SA.USER/TOSS.SA.USER_LIST.FD.v0.1.md) hệ thống có trạng thái = “Đang hoạt động” * Text title “Người dùng hệ thống” * Bảng 2 - Người dùng thuộc nhóm: hiển thị list người dùng trong hệ thống đã được add vào nhóm người dùng thuộc vai trò * Text title “Người dùng thuộc vai trò” + (X) * Trong đó X là số lượng bản ghi ở bảng 2 * Danh sách user sắp xếp theo thứ tự a → z được sắp xếp theo các trường thông tin | | | | |
|  | TT | Textview |  | Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Checkbox |  | * Default không tick * Cho phép tick chọn, nếu:   + Trường hợp user tick checkbox tại title: Tự động tick all danh sách trên trang   + User bỏ tick checkbox tại title: Tự động bỏ tick all danh sách trên trang   + Trường hợp đang tick checkbox tại title => User thao tác bỏ tick 1 dòng trong danh sách => tự động chuyển sang không tick   + Cho phép tick/bỏ tick từng dòng trong danh sách trên trang |
|  | Full name | Textview |  | * Hiển thị thông tin Người sử dụng * *(hình ảnh minh họa — xem file gốc/Google Doc)*: [Name] * [Employee code] |
|  | Status | TagStatus |  | * Hiển thị [Trạng thái người dùng], bao gồm: * Active : Màu xanh lá * Inactive : Màu xám |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Icon |  | * Chức năng chuyển người dùng * Hiển thị: * Khi checkbox bảng 1 được tick: enable icon *(hình ảnh minh họa — xem file gốc/Google Doc)*và màu xanh, không enable màu xám * Khi checkbox bảng 2 được tích: enable icon *(hình ảnh minh họa — xem file gốc/Google Doc)*và màu xanh, không enable màu xám * Click icon: * Hệ thống thực hiện chuyển user được chọn sang bảng còn lại (bảng 1 > bảng 2 / bảng 2 > bảng 1) * Clear trạng thái tick checkbox sau khi chuyển, load lại danh sách * Refresh lại 2 bảng danh sách |
|  | Pagination | Panigation |  | Tham chiếu kịch bản [chân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=id.hy5fbrqw7e44) |

---

*Nguồn: tách trung thực từ `sec-12-quan-ly-vai-tro.md`, mục "Thêm/Sửa vai trò" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#17** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
