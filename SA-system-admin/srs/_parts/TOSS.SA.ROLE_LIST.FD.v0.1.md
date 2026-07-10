---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.ROLE_LIST"
feature_name: "Danh sách vai trò"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

## Quản lý vai trò

### Danh sách vai trò

| **Tên chức năng: Quản lý vai trò** | |
| --- | --- |
| **Mục đích** | Cho phép người dùng quản lý danh sách các vai trò trên hệ thống |
| **Trigger** | Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Quản lý vai trò |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Quản lý vai trò |
| **Hậu điều kiện** | Danh sách Vai trò được hiển thị cho người dùng |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
|  | Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Quản lý vai trò |
|  | Hệ thống hiển thị Danh sách vai trò |
|  | Focus vào vai trò đầu tiên trên danh sách  Hiển thị màn hình view chi tiết vai trò đó ở phía bên phải bảng danh sách |
|  | Khi User nhấn button **Khởi tạo** => hệ thống hiển thị màn hình [Thêm mới vai trò](TOSS.SA.ADD_EDIT_ROLE.FD.v0.1.md) |
|  | Khi User nhấn chọn 1 dòng vai trò bất kỳ => hệ thống hiển thị màn View chi tiết vai trò |
|  | Khi User nhấn Bật/tắt **Hoạt động** vai trò => hệ thống hiển thị màn hình Mở màn hình xác nhận **bật/tắt trạng thái Hoạt động** => Update trạng thái **Đang hoạt động/Ngừng hoạt động** |
|  | Khi User nhấn icon **Sửa** => hệ thống hiển thị màn hình [Sửa vai trò](TOSS.SA.ADD_EDIT_ROLE.FD.v0.1.md) |
|  | Khi User nhấn icon **Xóa** => hệ thống hiển thị màn hình Mở màn hình xác nhận **[Xóa vai trò](TOSS.SA.DELETE_ROLE.FD.v0.1.md)** |
|  | Khi User nhấn icon **Khôi phục** => hệ thống hiển thị màn hình Mở màn hình xác nhận **[Khôi phục vai trò](TOSS.SA.RESTORE_ROLE.FD.v0.1.md)** |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Danh sách vai trò

![](data:image/png;base64...)

1. Danh sách vai trò

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** | |
| --- | --- | --- | --- | --- | --- |
| Title hệ thống | | Kịch bản màn hình tham chiếu tài liệu [Tham chiếu Kịch bản title hệ thống](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.f2nh07gdowb8) | | | |
|  | Tiêu đề | Textview |  | Hiển thị mặc định: “Danh sách vai trò” | |
|  | Khởi tạo | Button |  | Click button: Mở màn hình [thêm mới vai trò](../../../DM-data-maintenance/srs/_parts/TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md) | |
| Chức năng tìm kiếm:  ![](data:image/png;base64...)   * Click vào dòng dưới tiêu đề các cột để chọn lọc, tìm kiếm thông tin theo dữ liệu tại cột tương ứng. * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/click Enter/out focus box => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về   + Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | | |
|  | Code | Searchbox |  | * Trường để lọc: Tìm kiếm gần đúng theo [code] * Maxlength 20 ký tự định dạng number * Validate cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/] * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 20 ký tự đầu hệ thống báo lỗi * Tự động TRIM Spaces đầu cuối khi tìm kiếm | |
|  | Role Name | Searchbox |  | * Trường để lọc: Tìm kiếm gần đúng theo [rolename] * Maxlength 100 ký tự * Cho phép nhập chữ, số, ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm | |
|  | System | ~~Combobox~~  Dropdown |  | * Trường để lọc: Tìm kiếm đúng theo [System] * Bao gồm các giá trị   + ALL   + **System Admin**   + **Toss** | |
|  | ~~User tạo/sửa~~ | ~~Searchbox~~ |  | * ~~Trường để lọc: Tìm kiếm gần đúng theo [Họ và tên] và [mã nhân viên]~~ * ~~Maxlength 100 ký tự~~ * ~~Cho phép nhập chữ, số, ký tự đặc biệt~~ * ~~Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập~~ * ~~Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu~~ * ~~Tự động TRIM Spaces đầu cuối khi tìm kiếm~~ | |
|  | ~~Trạng thái~~  Status | ~~Searchbox~~  Dropdown |  | * Trường để lọc: Tìm kiếm chính xác theo [Trạng thái hoạt động] * Các giá trị lựa chọn:   + Active   + Inactive   + Delete | |
| 8 | ![](data:image/png;base64...) | Button |  | * Click vào ![](data:image/png;base64...) * Hệ thống lọc dữ liệu dựa trên nội dung trường lọc * Hệ thống trả về danh sách dữ liệu phù hợp với từ khoá tìm kiếm | |
| 9 | ![](data:image/png;base64...) | Button |  | * Click vào ![](data:image/png;base64...) * Hệ thống   + Xoá nội dung search   + Reset toàn bộ truòng lọc đã chọn   + Reset phân trang về trang đầu * Hệ thống gọi API lấy danh sách dữ liệu mặc định * Hiển thị lại danh sách ban đầu | |
| Bảng danh sách vai trò: Bao gồm vai trò mặc định hệ thống “Admin” tổng của hệ thống; “Admin\_[<tên hệ thống> của 2 hệ thống con]”; và các vai trò được tạo thủ công bởi người dùng   * Mặc định hiển thị vai trò mặc định của hệ thống “Admin”; “Admin\_[<tên hệ thống> của 2 hệ thống con]”, **không cho Xóa** các vai trò này. * Vai trò “Admin”; “Admin\_[<tên hệ thống> của 2 hệ thống con]”: có đầy đủ các quyền của toàn bộ các hệ thống/module tương ứng * Các vai trò còn lại: Hiển thị và sắp xếp theo thứ tự từ vai trò được khởi tạo mới nhất đến cũ nhất * Click vào dòng vai trò bất kỳ: hiển thị màn hình [Xem chi tiết vai trò](https://docs.google.com/document/d/11hp5UbcDLXGUWg--FudOX8CiILbqZwy6/edit#heading=h.3zrvkal) ở phía bên phải bảng danh sách | | | | | |
|  | TT | Textview |  | * Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo | |
|  | Active | Toggle switch button |  | * Hiển thị theo trạng thái hoạt động của vai trò:   + Trạng thái = Đang hoạt động: On   + Trạng thái = Ngừng hoạt động: Off   + Trạng thái = Đã xóa: Off & disable icon * Cho phép user thao tác On/Off trạng thái hoạt động của vai trò * Lưu ý: Chặn thao tác với các vai trò sinh mặc định của hệ thống * Chi tiết kịch bản tham chiếu mục [Bật/tắt Hoạt động vai trò](https://docs.google.com/document/d/11hp5UbcDLXGUWg--FudOX8CiILbqZwy6/edit#heading=h.30mxrez) | |
|  | Code | Textview |  | * Hiển thị [Code Roles] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | |
|  | Roles name | Textview |  | * Hiển thị [Roles name] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | |
|  | System | Textview |  | * Quyền Admin mặc định của hệ thống mặc định để giá trị = “ALL” * Các trường hợp khác lấy theo dữ liệu API trả về | |
|  | Updated by | Textview |  | * Hiển thị [Updated by] và [ Employee code] theo dữ liệu API trả về * Với các vai trò có user tạo và user eidt khác nhau=> lấy dữ liệu user thao tác mới nhất hiển thị trên giao diện * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | |
|  | Status | TagStatus |  | * Hiển thị Tag Status theo dữ liệu API trả về   + Status=Active: Tag màu xanh lá   + Status=Inactive: Tag màu xám   + Status=Deleted: Tag màu đỏ | |
|  | Actions | Icon function |  | * Hiển thị các function theo trạng thái (chi tiết được mô tả tại Bảng function theo trạng thái hoạt động của vai trò bên dưới) * Click ![](data:image/png;base64...) mở màn hình [Sửa vai trò](https://docs.google.com/document/d/11hp5UbcDLXGUWg--FudOX8CiILbqZwy6/edit#heading=h.1fs81ms). Đối với các vai trò có Trạng thái = “Đã xóa” không hiển thị icon * Click ![](data:image/png;base64...) mở màn hình [Xóa vai trò](https://docs.google.com/document/d/11hp5UbcDLXGUWg--FudOX8CiILbqZwy6/edit#heading=h.2ex5uie). Đối với admin mặc định hệ thống không hiển thị icon * Click ![](data:image/png;base64...) mở màn hình [Khôi phục vai trò](https://docs.google.com/document/d/11hp5UbcDLXGUWg--FudOX8CiILbqZwy6/edit#heading=h.u2g4q7) | |
|  | ![](data:image/png;base64...) | Button |  | * Click vào => mở màn hình [Thêm mới User/Tự khai báo](TOSS.SA.ADD_USER_MANUAL.FD.v0.1.md) * Hiển thị form nhập thông tin tương ứng với đối tượng cần tạo * Button **Create** chỉ hiển thị khi:   + Người dùng đã đăng nhập thành công   + Người dùng có **quyền Thêm mới** đối với chức năng tương ứng | |
|  | Footer | Pagination |  | Tham chiếu kịch bản [chân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=id.hy5fbrqw7e44) | |

---

*Nguồn: tách trung thực từ `sec-12-quan-ly-vai-tro.md`, mục "Danh sách vai trò" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#15** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
