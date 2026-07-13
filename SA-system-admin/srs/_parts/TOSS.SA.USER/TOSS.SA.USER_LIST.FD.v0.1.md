---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.USER_LIST"
feature_name: "Danh sách Người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

## Quản lý Người dùng

### Danh sách user

| **Tên chức năng: Danh sách Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user xem Danh sách Người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý người dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Quản lý người dùng |
| **Hậu điều kiện** | Danh sách người dùng hiển thị trên giao diện |

#### Sơ đồ luồng hệ thống

*(hình ảnh minh họa — xem file gốc/Google Doc)*

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | 1 | User truy cập vào web FIMS => mở đến module Quản lý người dùng |
|  | 2 | Hệ thống call API lấy dữ liệu danh sách người dùng từ db |
|  | 3 | Hệ thống hiển thị màn hình danh sách người dùng trên giao diện |

#### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)*

*(hình ảnh minh họa — xem file gốc/Google Doc)*

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** | | |
| --- | --- | --- | --- | --- | --- | --- |
| Title hệ thống | | Kịch bản màn hình tham chiếu tài liệu [Tham chiếu Kịch bản title hệ thống](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.f2nh07gdowb8) | | | | |
| Danh sách User  *(hình ảnh minh họa — xem file gốc/Google Doc)*  FE call API lấy lại DS User mới nhất hiện tại để hiển thị trên giao diện người dùng  Cho phép Scroll ngang danh sách để xem thêm thông tin nếu danh sách dài  Điều kiện hiển thị User: trường **is_delete=false** | | | | | | |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button | btn_refresh | * Click: refresh màn hình => FE call API lấy lại DS User mới nhất hiện tại để hiển thị trên giao diện người dùng * Nếu đang hiển thị kết quả search -> ấn refresh -> trả kết quả search hiện tại từ DS User mới nhất   Điều kiện hiển thị User: trường **is_delete=false**   * Trường hợp response API trả về thành công và có dữ liệu: hiển thị danh sách người dùng vào bảng bên dưới * Ngược lại: (API trả về rỗng hoặc lỗi) Hiển thị bảng danh sách với 1 dòng dữ liệu, nội ghi “Không có người dùng nào”   *(hình ảnh minh họa — xem file gốc/Google Doc)* | | |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Dropdown | btn_init | Hiển thị dưới dạng Button list *(hình ảnh minh họa — xem file gốc/Google Doc)*  Click vào => hiển thị tooltips menu action  *(hình ảnh minh họa — xem file gốc/Google Doc)*  Click lại lần 2 => đóng tooltips | | |
| *(hình ảnh minh họa — xem file gốc/Google Doc)* | | Click vào => mở màn hình [Thêm mới User/Đồng bộ LDAP](TOSS.SA.ADD_USER_LDAP.FD.v0.1.md) |
| *(hình ảnh minh họa — xem file gốc/Google Doc)* | | Click vào => mở màn hình [Thêm mới User/Tự khai báo](TOSS.SA.ADD_USER_MANUAL.FD.v0.1.md) |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button | btn_export_excel | * Tham chiếu kịch bản [xuất Excel](#bookmark=id.r5pkpuo7a6i2) * Tên file tải về: FIMS_UserGroupManagement_ddmmyyhhss * Nội dung file tải về: tải theo cột dữ liệu view từ bảng danh sách người dùng | | |
|  | **Bộ lọc tìm kiếm**   * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/click Enter/out focus box => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về   + Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | | |
| Search by Account | Textbox |  | * Cho phép nhập và tìm kiếm theo Account. * Cho phép nhập chữ, số và ký tự đặc biệt. * Không bắt buộc nhập. * Nếu nhập quá 255 ký tự: hiển thị “…” và có tooltip xem đầy đủ nội dung. * Trường hợp paste dữ liệu dài: chỉ ghi nhận 255 ký tự đầu tiên. Tự động **TRIM khoảng trắng đầu và cuối** khi tìm kiếm. * Nếu không nhập dữ liệu: mặc định tìm kiếm toàn bộ dữ liệu. | | |
| Search by AVES Code | Textbox |  | * Cho phép nhập và tìm kiếm theo AVES Code. * Cho phép nhập chữ, số và ký tự đặc biệt. * Không bắt buộc nhập. * Nếu nhập vượt quá 255 ký tự: phần vượt quá hiển thị “…” và có tooltip. * Khi paste dữ liệu dài: chỉ ghi nhận 255 ký tự đầu tiên. * Tự động TRIM khoảng trắng đầu và cuối khi thực hiện tìm kiếm. * Trường hợp không nhập dữ liệu: mặc định tìm kiếm toàn bộ dữ liệu. | | |
| Search by Email | Textbox |  | * Cho phép nhập và tìm kiếm theo Email. * Cho phép nhập chữ, số và ký tự đặc biệt. * Không validate format email khi tìm kiếm. * Không bắt buộc nhập. * Nếu nhập quá 255 ký tự: hiển thị “…” và tooltip xem đầy đủ. * Khi paste dữ liệu dài: chỉ ghi nhận 255 ký tự đầu tiên. * Tự động TRIM khoảng trắng đầu và cuối khi tìm kiếm. * Nếu không nhập dữ liệu: mặc định tìm kiếm toàn bộ dữ liệu. | | |
| Search by Full name | Textbox |  | * Cho phép nhập và tìm kiếm **gần đúng (LIKE)** theo Full Name. * Cho phép nhập chữ, số và ký tự đặc biệt. * Không phân biệt chữ hoa / chữ thường. * Không bắt buộc nhập. * Nếu nhập vượt quá 255 ký tự: hiển thị “…” và tooltip xem đầy đủ. * Trường hợp paste dữ liệu dài: chỉ ghi nhận 255 ký tự đầu tiên. * Tự động TRIM khoảng trắng đầu và cuối khi tìm kiếm. * Khi không nhập dữ liệu: mặc định tìm kiếm toàn bộ dữ liệu. | | |
| Status | Dropdown | status | * Hiển thị TagStatus   + Status=Đang hoạt động: Active tag màu xanh lá   + Status=Ngừng hoạt động: Inactive tag màu xám   Không cần hiển thị phím tắt  Có icon x để clear các giá trị đã chọn. | | |
| *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Click vào *(hình ảnh minh họa — xem file gốc/Google Doc)* * Thu thập toàn bộ giá trị hiện tại trong các trường bộ lọc. * Gửi yêu cầu tìm kiếm tới hệ thống. * Hiển thị danh sách kết quả phù hợp trong bảng dữ liệu.   Khi người dùng **nhấn phím Enter trên bàn phím** tại bất kỳ trường nhập liệu nào trong khu vực bộ lọc:   * Hệ thống PHẢI thực hiện tìm kiếm tương đương với hành động click nút “Search”. * Kết quả tìm kiếm, logic xử lý và dữ liệu trả vềgiống hoàn toàn với nút Search. | | |
| *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Cho phép người dùng nhanh chóng xóa tất cả các giá trị đã nhập/chọn trong bộ lọc để quay lại danh sách mặc định. | | |
| Bảng danh sách người dùng: Bao gồm **Người dùng mặc định của hệ thống [Admin tổng]** và Người dùng được tạo mới   * Mặc định hiển thị **Người dùng [Admin]** tại dòng đầu tiên * Các người dùng còn lại: Hiển thị và sắp xếp theo thứ tự từ người dùng được khởi tạo mới nhất đến cũ nhất   Click vào dòng người dùng bất kỳ: hiển thị màn hình [Xem chi tiết người dùng](TOSS.SA.USER_DETAIL.FD.v0.1.md) ở phía bên phải bảng danh sách | | | | | | |
|  | ~~TT~~ NO | Textview |  | * Hiển thị STT bản ghi tăng dần | | |
|  | Active | Toggle switch | is_active/isActive | * Hiển thị theo trạng thái hoạt động của người dùng:   + Trạng thái = Active: On   + Trạng thái = Inactive: Off * Cho phép user thao tác On/Off trạng thái hoạt động của người dùng * Chi tiết kịch bản tham chiếu mục [Bật/tắt Hoạt động người dùng](TOSS.SA.TOGGLE_USER.FD.v0.1.md) * Riêng đối với **Người dùng [Admin]**: không hiển thị Toggle switch | | |
|  | Account | Textview | account | * Hiển thị [account] theo dữ liệu API trả về * Người dùng [Admin]: hiển thị **Admin** * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | | |
| 8.0 | Aves Code | Text View | Aves Code | * Hiển thị Aves Code theo dữ liệu API trả về * Người dùng [Admin]: hiển thị **Admin** * Hiển thị định dạng number, không trùng với code đã tồn tại * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung   + ~~Status=Đang hoạt động: Tag màu xanh lá~~   + ~~Status=Ngừng hoạt động: Tag màu xám~~ * ~~Người dùng [Admin]: mặc định = [Đang hoạt động]~~ | | |
| 1. 9 | Full name | Textview | full_name/fullName | * Hiển thị [fullName] theo dữ liệu API trả về * Người dùng [Admin]: hiển thị **Admin** * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | | |
|  | Email | Textview | email | * Hiển thị [email] theo dữ liệu API trả về * Người dùng [Admin]: để trống * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | | |
|  | Phone number | Textview | phone_number/phoneNumber | * Hiển thị [phoneNumber] theo dữ liệu API trả về * Người dùng [Admin]: để trống * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | | |
|  | HRMS code | Textview | hrms_code/hrmsCode | * Hiển thị [hrmsCode] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | | |
|  | Industry Card Number | Textview | industry_card_number/industryCardNumber | * Hiển thị [industryCardNumber] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | | |
|  | User Group | Textview | user_group_name/userGroupName | * Trường dùng để hiển thị tên nhóm người dùng tương ứng với bản ghi. * Dữ liệu được lấy từ hệ thống, người dùng không được phép chỉnh sửa trực tiếp trên màn hình danh sách. * Nội dung hiển thị là tên đầy đủ của User Group. * Nếu tên User Group dài vượt quá chiều rộng cột:   + Hiển thị rút gọn bằng “…”   + Hiển thị tooltip khi hover để xem đầy đủ nội dung. * Không áp dụng validate nhập liệu do là trường chỉ hiển thị. | | |
|  | Department | Textview | department | * Hiển thị [department] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung | | |
|  | Carrier Authorization | Textview | carrier | * Hiển thị [carrier] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu | | |
|  | Fleet | Textview | fleet/rank | * Hiển thị [rank] theo dữ liệu Rank/API trả về   Cách xử lý dữ liệu:  Ví dụ Rank="**350**:X,**787**:X,**321**:B"  => hệ thống lấy các phần ký tự trước dấu [:] sau đó mapping gần bằng với Danh mục [đội bay](https://docs.google.com/document/d/11hp5UbcDLXGUWg--FudOX8CiILbqZwy6/edit#heading=h.3r6zjac): ([code 3 ký tự cuối/mã đội bay trên Aves]=[3 ký tự cuối trong mã đội bay trên Danh mục | | |
|  | Mainbase | Textview | main_base/mainBase | ● Hiển thị theo danh sách main base được gán cho người dùng, ngăn cách các mainbase bằng dấu phẩy   * Nếu vượt quá độ rộng cột thì sẽ hiển thị 3 chấm * Chỉ chuột vào sẽ hiển thị tooltip thông tin danh sách main base đầy đủ. * Hiển thị dưới dạng: code - name (vd: 8386 - Airport Nội Bài) | | |
|  | ~~Status~~ | ~~Textview~~ | ~~active_status~~ | * ~~Hiển thị TagStatus theo dữ liệu API trả về~~   + ~~Status=Active: Tag màu xanh lá~~   + ~~Status=Inactive: Tag màu xám~~ * ~~Người dùng [Admin]: mặc định = [Active]~~ | | |
|  | ~~Employee Code (SkyHr)~~ | ~~Textview~~ | ~~employee_code/employeeCode~~ | * ~~Hiển thị thông tin [employeeCode] theo dữ liệu API trả về~~ * ~~Trường hợp API trả về lỗi/rỗng: hiện~~ **~~N/A~~** | | |

---

*Nguồn: tách trung thực từ `sec-11-quan-ly-nguoi-dung.md`, mục "Danh sách Người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#6** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
