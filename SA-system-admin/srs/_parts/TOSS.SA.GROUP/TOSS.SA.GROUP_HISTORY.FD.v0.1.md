---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.GROUP_HISTORY"
feature_name: "Xem lịch sử nhóm Người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Xem lịch sử nhóm người dùng

| **Tên chức năng: Xem lịch sử nhóm Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem lịch sử nhómNgười dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý nhóm người dùng => nhấn vào Xem lịch sử nhómNgười dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Quản lý nhóm người dùng |
| **Hậu điều kiện** | Màn hình Xem lịch sửnhóm Người dùng hiển thị |

#### Sơ đồ luồng hệ thống

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Sơ đồ luồng xem lịch sử nhóm người dùng

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | Bước 1 | User truy cập vào web FIMS => mở đến module Quản lý nhóm người dùng => hiển thị màn hình [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) trên giao diện |
|  | Bước 2 | User click button **Xem lịch sử nhóm Người dùng** |
|  | Bước 3 | Hệ thống call API lấy dữ liệu lịch sử |
|  | Bước 4 | Mở màn hình Xem lịch sử cập nhật |

#### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Giao diện Xem lịch sử nhóm người dùng

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **Thông tin chung** | | | | |
|  | User group name | Textview | user_group_name/userGroupName | * Hiển thị [userGroupName] * Không cho thao tác |
|  | User group code | Textview | user_group_code/userGroupCode | * Hiển thị [userGroupCode] * Không cho thao tác |
| **Lịch sử Cập nhật nhóm người dùng** | | | | |
| * **Tìm kiếm**   + Click vào dòng dưới tiêu đề các cột để chọn lọc, tìm kiếm thông tin theo dữ liệu tại cột tương ứng.   + Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó   + Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/click Enter/out focus box => hệ thống thực hiện:     - Reload dữ liệu table phù hợp với bộ lọc     - Set current page=1   + Hiển thị kết quả tìm kiếm:     - Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về     - Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | |
|  | Update Time | Datepicker | updated_at/updateAt | * Trường để lọc: Tìm kiếm chính xác theo [updateAt] (không tìm theo giờ) * Định dạng ngày dd/mm/yyyy |
|  | Action | Dropdown list | operation_type/operationType | * Trường để lọc: Tìm kiếm chính xác theo [operationType] * Các giá trị tìm kiếm bao gồm: Thêm nhóm người dùng /[Sửa nhóm người dùng](TOSS.SA.EDIT_GROUP.FD.v0.1.md) * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập |
|  | Update Details | Textbox | update_detail/updateDetail | * Trường để lọc: Tìm kiếm gần đúng theo [updateDetail] * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Updated by | Dropdown list | updated_by/updateBy | * Trường để lọc: Tìm kiếm chính xác theo [updateBy] * Các giá trị tìm kiếm bao gồm: Danh sách user được phần quyền thao tác trên phân hệ Quản lý nhóm người dùng/FIMS * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập |
| * **Bảng log** | | | | |
|  | TT | Textview |  | * Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo * Danh sách hiển thị tối đa 6 dòng dữ liệu |
|  | Update Time | Textview | updated_at/updateAt | * Hiển thị thời gian cập nhật dữ liệu * Định dạng dd/mm/yyyy hh:mm |
|  | Nghiệp vụ ghi nhận | Textview | operation_type/operationType | * Hiển thị nghiệp vụ ghi nhận thay đổi dữ liệu trên bảng [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md), bao gồm: Thêm nhóm người dùng /[Sửa nhóm người dùng](TOSS.SA.EDIT_GROUP.FD.v0.1.md) |
|  | Update Details | Textview | update_detail/updateDetail | * Hiển thị chi tiết cập nhật nhóm người dùng * Hiện tối đa 2 dòng dữ liệu, nếu nội dung vượt quá 2 dòng, hiện dấu ba chấm […] tại cuối dòng thứ 2. Di chuột vào hiện tooltips full nội dung * Cách ghi nhận log:   + Thêm nhóm người dùng: [Tên + mã nhóm người dùng]   + Sửa thông tin người dùng: [Tên trường]: [Nội dung sau cập nhật]   TH cập nhật vai trò: [Tên hệ thống] [[Danh sách vai trò](../TOSS.SA.ROLE/TOSS.SA.ROLE_LIST.FD.v0.1.md), mỗi vai trò cách nhau bởi **dấu phẩy**} => list các hệ thống được cập nhật vai trò, mỗi hệ thống cách nhau bởi **dấu chấm phẩy** |
|  | Updated by | Textview | updated_by/updateBy | * Hiển thị thông tin người cập nhật dữ liệu * Nội dung bao gồm [Tên người cập nhật] / [Mã người cập nhật] |
|  | Pagination |  |  | * Hiển thị theo [kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=id.hy5fbrqw7e44) |

---

*Nguồn: tách trung thực từ `sec-14-quan-ly-nhom-nguoi-dung.md`, mục "Xem lịch sử nhóm Người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#28** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
