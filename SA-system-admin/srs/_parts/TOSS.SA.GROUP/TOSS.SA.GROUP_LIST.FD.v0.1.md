---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.GROUP_LIST"
feature_name: "Danh sách Nhóm Người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

## Quản lý Nhóm người dùng

### Danh sách nhóm người dùng

| **Tên chức năng: Danh sách Nhóm Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user xem Danh sách Nhóm Người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý nhóm người dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Quản lý nhóm người dùng |
| **Hậu điều kiện** | Danh sách Nhóm Người dùng hiển thị trên giao diện |

#### Luồng nghiệp vụ

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Sơ đồ luồng hệ thống

#### Mô tả luồng nghiệp vụ

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | Bước 1 | User truy cập vào web FIMS => mở đến module Quản lý nhóm người dùng |
|  | Bước 2 | Hệ thống call API lấy dữ liệu Danh sách Nhóm Người dùng từ database |
|  | Bước 3 | Hệ thống hiển thị màn hình Danh sách Nhóm Người dùng trên giao diện |

#### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Giao diện Danh sách nhóm User

#### Mô tả màn hình

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** | |
| --- | --- | --- | --- | --- | --- |
| Title hệ thống | | Kịch bản màn hình tham chiếu tài liệu [Tham chiếu Kịch bản title hệ thống](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.f2nh07gdowb8) | | | |
| Danh sách nhóm user | | | | | |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button | btn_refresh | Click: refresh màn hình => FE call API lấy lại DS nhóm User mới nhất hiện tại để hiển thị trên giao diện người dùng  Điều kiện hiển thị nhóm User: trường **is_delete=false**   * Trường hợp response API trả về thành công và có dữ liệu: hiển thị Danh sách Nhóm Người dùng vào bảng bên dưới * Ngược lại: (API trả về rỗng hoặc lỗi) Hiển thị **Tất cả danh sách : 0** | |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button | btn_init | Click vào => mở màn hình [Thêm mới nhóm người dùng](TOSS.SA.ADD_GROUP.FD.v0.1.md) | |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button | btn_export_excel | * [Tham chiếu kịch bản Export](#_heading=h.bqdzkq5i2tdb) file .xlsx * Cấu trúc của file/Template file .xlsx:   + File xuất ra có định dạng **.xlsx**   + Dữ liệu trong file được lấy theo **danh sách nhóm người dùng** trên màn hình:     - Nếu người dùng đang sử dụng bộ lọc tìm kiếm, hệ thống tải danh sách đã chọn lọc     - Nếu người dùng không sử dụng bộ lọc tìm kiếm, hệ thống tải toàn bộ danh sách * Tên file tải về: FIMS_UserGroupManagement_ddmmyyhhmm | |
|  | **Bộ lọc tìm kiếm trên danh sách**   * Click vào dòng dưới tiêu đề các cột để chọn lọc, tìm kiếm thông tin theo dữ liệu tại cột tương ứng. * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/click Enter/out focus box => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị **Tất cả danh sách : 0** | | | | |
| Search by Group ID | Searchbox |  | * Trường để lọc: Tìm kiếm gần đúng theo [Search by Group ID] * Maxlength 100 ký tự * Validate cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [_]; dấu chấm [.]; dấu gạch chéo [/] * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm * Trường hợp không nhập dữ liệu:Hệ thống hiển thị toàn bộ danh sách theo điều kiện lọc khác (nếu có). | |
| Search by Group Name | Searchbox |  | * Trường để lọc: Tìm kiếm gần đúng theo [ Group Name] * Maxlength 100 ký tự * Validate cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [_]; dấu chấm [.]; dấu gạch chéo [/] * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm * Trường hợp không nhập dữ liệu:Hệ thống hiển thị toàn bộ danh sách theo điều kiện lọc khác (nếu có). | |
| Bảng Danh sách Nhóm Người dùng: Hiển thị và sắp xếp theo thứ tự từ nhóm người dùng được khởi tạo mới nhất đến cũ nhất  Hệ thống fix cứng sẵn các nhóm người dùng sau:   * Thông tin chi tiết:  | **Mã nhóm** | **Tên nhóm** | **Người tạo** | **Ngày tạo** | | --- | --- | --- | --- | | PC | Phi công | Hệ thống | Để trống | | TV | Tiếp viên | Hệ thống | Để trống | | DSP | Điều phái mặt đất | Hệ thống | Để trống | | Vasco | Vasco | Hệ thống | Để trống | | OCC | OCC | Hệ thống | Để trống |  * **Ẩn chức năng Xóa** của các nhóm mặc định này   Click vào dòng người dùng bất kỳ: hiển thị màn hình [Xem chi tiết nhóm người dùng](TOSS.SA.GROUP_DETAIL.FD.v0.1.md) ở phía bên phải bảng danh sách  Default focus vào nhóm người dùng đầu tiên trên danh sách khi user làm mới danh sách hoặc truy cập vào phân hệ | | | | | |
|  | TT | Textview |  | * Hiển thị STT bản ghi tăng dần | |
|  | Group ID | Textview | user_group_code/userGroupCode | * Hiển thị [userGroupCode] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | |
|  | Name | Textview | user_group_name/userGroupName | * Hiển thị [userGroupName] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | |
|  | Created by | Textview | created_by/createBy | * Hiển thị [createBy] [Employee code] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | |
|  | Created date | Textview | created_at/createAt | * Hiển thị [createAt] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Định dạng dd/mm/yyyy | |
|  | Actions | Textview |  | Bao gồm các function sau   * Sửa => Ẩn khi user không được phân quyền Sửa * Lịch sử => Ẩn khi user không được phân quyền Xem * Xóa => Ẩn khi user không được phân quyền Xóa   Click function => mở màn hình chức năng tương ứng | |
|  | Footer | Pagination |  | [Tham chiếu kịch bản chân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=id.hy5fbrqw7e44) | |

---

*Nguồn: tách trung thực từ `sec-14-quan-ly-nhom-nguoi-dung.md`, mục "Danh sách Nhóm Người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#23** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
