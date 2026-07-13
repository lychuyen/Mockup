---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.ADMIN_LOG"
feature_name: "Danh sách nhật ký quản trị hệ thống"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Danh sách nhật ký quản trị hệ thống

| **Tên chức năng: Nhật ký quản trị hệ thống** | |
| --- | --- |
| **Mục đích** | Cho phép người dùng **Xem nhật ký quản trị hệ thống** |
| **Trigger** | Người dùng truy cập vào hệ thống FIMS → chọn hệ thống System Admin → Chọn “System Management History” |
| **Tiền điều kiện** | Người dùng đăng nhập thành công vào hệ thống Danh mục quản trị và có quyền xem Nhật ký quản trị hệ thống |
| **Hậu điều kiện** | Màn hình **Xem danh sách nhật ký quản trị hệ thống** |

#### Sơ đồ luồng hệ thống

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | * User truy vào hệ thống FIMS → chọn hệ thống System Admin → Chọn button “System Management History” |
| 2,3 | * Hệ thống truy xuất dữ liệu log theo từng hệ thống và từng chức năng phân quyền theo hệ thống * Hiển thị tất cả log của đối tượng truy cập theo IP Address * ~~Người dùng tìm kiếm thông tin theo~~ * ~~[Thời gian].Rule: Between~~ * ~~[IP máy].Rule: Like~~ * ~~[Người thực hiện]: Like. Tìm kiếm theo Tên, mã~~ * ~~[Hệ thống].Rule: Equals~~ * ~~[Đối tượng truy cập].Rule: Like~~ |

#### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Giao diện danh sách nhật ký truy cập

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** | |
| --- | --- | --- | --- | --- | --- |
|  | **Chức năng tìm kiếm:**  *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Click vào dòng dưới tiêu đề các cột để chọn lọc, tìm kiếm thông tin theo dữ liệu tại cột tương ứng. * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/click Enter/out focus box => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về   + Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | |
|  | System | Dropdown |  | * Trường để lọc: Tìm kiếm đúng theo [System] * Bao gồm các giá trị   + **EDM**   + **System Admin**   + **EDOC PILOT** | |
|  | Time | time |  | * Lưu trữ thời gian trong ngày theo định dạng dd/mm/yyyy | |
|  | Search by User name, Executor | Searchbox |  | * Trường để lọc: Tìm kiếm gần đúng theo [Search by User name, Executor] * Maxlength 100 ký tự * Validate cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [_]; dấu chấm [.]; dấu gạch chéo [/] * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm * Trường hợp không nhập dữ liệu:Hệ thống hiển thị toàn bộ danh sách theo điều kiện lọc khác (nếu có). | |
|  | Module | Dropdown |  | * Trường để lọc: Tìm kiếm đúng theo [Module] * Bao gồm các giá trị   + **Manage Roles**   + **User Management**   + **…** | |
|  | Action | Dropdown |  | * Trường để lọc: Tìm kiếm đúng theo [Action] * Bao gồm các giá trị   + **Edit**   + **Add New**   + **Turn on Active**   + **…** | |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Click vào *(hình ảnh minh họa — xem file gốc/Google Doc)* * Hệ thống lọc dữ liệu dựa trên nội dung trường lọc * Hệ thống trả về danh sách dữ liệu phù hợp với từ khoá tìm kiếm | |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Click vào *(hình ảnh minh họa — xem file gốc/Google Doc)* * Hệ thống   + Xoá nội dung search   + Reset toàn bộ trường lọc đã chọn   + Reset phân trang về trang đầu * Hệ thống gọi API lấy danh sách dữ liệu mặc định * Hiển thị lại danh sách ban đầu | |
|  | Title | Textview |  | * Fix cứng “System Management History” | |
|  | System administration log list | Table |  | Danh sách được sắp xếp theo thời gian mới nhất đến cũ nhất, hiển thị tất cả các hệ thống được phân quyền của người dùng, bao gồm   * Time: * Hiển thị dữ liệu api<> trả về * Hiển thị theo format [dd/MM/yyyy: hh:mm] * Device IP: * Hiển thị dữ liệu api<> trả về * User name: * Hiển thị dữ liệu api<> trả về * Hiển thị theo [User name, Aves code] * Executor: * Hiển thị dữ liệu api<> trả về * Hiển thị theo [Tên] * System: => hệ thống thực hiện thao tác update người dùng/nhóm người dùng/vai trò * Hiển thị dữ liệu api<> trả về * Đối tượng được thay đổi => thông tin người dùng/nhóm người dùng/vai trò bị update dữ liệu * Hiển thị dữ liệu api<> trả về * Update Details * Hiển thị thao tác khi thực hiện quản lý người dùng, quản lý vai trò * Hiển thị dữ liệu api<> trả về * Hiển thị tối đa 2 dòng. Dữ liệu quá 2 dòng hiển thị “...” và hiển thị tooltips tất cả dữ liệu * Cách ghi nhận log:   + Thêm Đối tượng: [Tên + mã Đối tượng]   + Sửa thông tin Đối tượng: [Tên trường]: [~~Nội dung bị xóa/thay đổi~~] > [Nội dung sau cập nhật]   + TH cập nhật vai trò: [Tên hệ thống] [[Danh sách vai trò](TOSS.SA.ROLE_LIST.FD.v0.1.md), mỗi vai trò cách nhau bởi **dấu phẩy**} => list các hệ thống được cập nhật vai trò, mỗi hệ thống cách nhau bởi **dấu chấm phẩy**   TH cập nhật [danh sách người dùng](../TOSS.SA.USER/TOSS.SA.USER_LIST.FD.v0.1.md): Hiển thị theo 2 tình huống Thêm người dùng và Bỏ người dùng khỏi nhóm. Dữ liệu ghi nhận bao gồm [Tên + mã người dùng] được update | |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Click vào → Tự động tải xuống file template [DS Nhật ký truy cập hệ thống](https://docs.google.com/spreadsheets/d/1EIn-EaUROmdYHqqrLLahNTu-52lECb9N/edit?gid=92710374#gid=92710374) * Định dạng xlsx * Tên file “DS_nhat_ky_truy_cap_he_thong.xlsx” | |
|  | Chân trang | Pagination |  | **Tham chiếu kịch bản** [**phân trang**](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=id.hy5fbrqw7e44) | |

---

*Nguồn: tách trung thực từ `sec-12-quan-ly-vai-tro.md`, mục "Danh sách nhật ký quản trị hệ thống" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#22** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
