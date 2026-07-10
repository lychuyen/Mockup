---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.ADD_USER_LDAP"
feature_name: "Thêm mới User/Đồng bộ LDAP"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Thêm mới User/Đồng bộ LDAP

| **Tên chức năng: Thêm mới Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Thêm mới User/Đồng bộ LDAP |
| **Trigger** | Người dùng truy cập vào web FIMS=> nhấn phân hệ Quản lý người dùng => nhấn Thêm mới User/Đồng bộ LDAP |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền trên phân hệ Quản lý người dùng |
| **Hậu điều kiện** | Màn hình Thêm mới User/Đồng bộ LDAP hiển thị |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | 1 | User truy cập vào web FIMS => mở đến module Quản lý người dùng  => hiển thị màn hình [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) trên giao diện |
|  | 2 | User click button Tạo người dùng/chọn Đồng bộ LDAP => Thực hiện đồng thời bước 3&4 |
|  | 3 | Hệ thống call API lấy [Danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) mới nhất từ LDAP, nếu:   * API trả về danh sách: update danh sách vào bảng người dùng LDAP dưới db * Ngược lại: Cập nhật log call lỗi vào bảng log db |
|  | 4 | Hệ thống hiển thị màn hình Thêm mới người dùng/Đồng bộ từ LDAP  Cho phép User tìm và thêm người dùng từ LDAP vào hệ thống FIMS |
|  | 5 | User nhập dữ liệu và nhấn **Lưu lại** |
|  | 6 | Hệ thống kiểm tra dữ liệu, nếu:   * Trường hợp thiếu dữ liệu bắt buộc/Sai định dạng valid/Call API tạo mới người dùng cho FIMS có lỗi => Báo lỗi theo bước 7 * Ngược lại: Tạo mới người dùng thành công => Thực hiện tiếp bước 8 & 9 |
|  | 7 | Hiển thị toast báo lỗi cho người dùng:   * Trường hợp thiếu trường bắt buộc: Hiển thị inline message (IM) tại trường có lỗi [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) * Trường hợp Sai định dạng valid: Hiển thị IM tại trường có lỗi [VL006](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.lwrynb3cmu73) * Trường hợp Call API tạo mới trả về lỗi: hiển thị toast message (TM)   + Trường hợp lỗi API trả về có message: hiện [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   ![](data:image/png;base64...)   * + Ngược lại: hiện [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)   ![](data:image/png;base64...) |
|  | 8 | Trường hợp tạo người dùng thành công: BE Lưu và cập nhật danh sách Users  Trả API thành công cho FE |
|  | 9 | FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  ![](data:image/png;base64...)  Đóng popup Tạo mới, tự động refresh màn danh sách và hiển thị [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | Group box **Synchronize data from LDap** | | | |
|  | Avatar | Ảnh | avatar | Hiển thị ảnh đại diện của người dùng   * Không bắt buộc * Trường hợp không có ảnh => để trống * Trường hợp đồng bộ từ LDAP có ảnh => hiển thị ảnh lấy từ LDAP * Trường hợp user tải ảnh lên => hiển thị ảnh user tải lên * Button ![](data:image/png;base64...) => click => Mở cửa số Folder của thiết bị, cho phép user chọn file ảnh (định dạng file cho phép chọn .JPG, .JPEG, or .PNG) và upload lên hệ thống * Chọn file và upload, hệ thống valid định dạng & dung lượng ảnh (max = 5MB) nếu   + File vượt dung lượng tối đa: highlight đỏ viền box và hiển thị IM “Chỉ nhận ảnh có dung lượng tối đa 5MB !”   + File không đúng định dạng nhận: highlight đỏ viền box và hiển thị IM “Chỉ nhận ảnh định dạng .JPG, .GIF, or .PNG !”   + Trường hợp lỗi khác do hệ thống trả về và có message lỗi: Hiển thị toast message đến người dùng theo nội dung lỗi hệ thống trả về   ![](data:image/png;base64...)   * + Các trường hợp lỗi còn lại: Hiển thị toast message lỗi   ![](data:image/png;base64...)   * + Trường hợp load ảnh lên thành công: Insert ảnh lên hệ thống và hiển thị vào vùng ảnh |
|  | Title | Textview |  | Default “**Synchronize data from LDap**” |
|  | Account | Searchbox | account | Tìm và thêm người dùng từ LDAP   * **Action** nhấn vào Search Box => FE call API xuống BE lấy [danh sách User](TOSS.SA.USER_LIST.FD.v0.1.md) LDAP và hiển thị **tooltips suggest** cho người dùng   BE trả [danh sách user](TOSS.SA.USER_LIST.FD.v0.1.md) cho FE; Set current page=1  Ghi chú: [Danh sách User](TOSS.SA.USER_LIST.FD.v0.1.md) hiển thị tại màn này được lấy từ bảng User LDAP lưu trong db  ![](data:image/png;base64...)  **Searchbox**:   * + Placeholder “Enter Account”   + Cho phép nhận và tìm kiếm gần đúng theo [Acccount và email người dùng]   + Maxlength 100 ký tự   + Validate cho phép nhập chữ, số, và ký tự đặc biệt   + Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập   + Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu   + Tự động TRIM Spaces đầu cuối khi tìm kiếm   + Trường hợp Searchbox không có dữ liệu: Mặc định hiển thị full [danh sách User](TOSS.SA.USER_LIST.FD.v0.1.md) LDAP   + Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/nhấn Enter => hệ thống thực hiện:     - Reload dữ liệu suggest phù hợp với từ khóa     - Highlight phần nội dung khớp với từ khóa     - Default focus vào dòng đầu tiên của tooltips     - Set current page=1   + Hiển thị kết quả tìm kiếm:     - Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về     - Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” * **Action chọn người dùng** trong tooltips (User chọn 1 **suggest** bất kỳ, hoặc di chuyển focus và nhấn Enter) * => Đóng **tooltips** **suggest** và tự động insert thông tin người dùng vào cụm Thông tin khác bên dưới * **Tìm kiếm Email trên thanh Search box => Hiển thị kết quả và chọn để thêm người dùng**   + Nếu đã tồn tại tài khoản => Hiển thị IM: “ Tài khoản đã tồn tại”   + Nếu chưa tồn tại tài khoản => Đóng tooltips suggest và tự động insert thông tin user vào cụm thông tin khác bên dưới |
|  | Employee code | Textview | employee\_code/employeeCode | * Hiển thị [employeeCode] của người dùng được chọn tại box Tài khoản * Trường hợp api trả về lỗi/rỗng => để trống trường * Không cho sửa dữ liệu * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Mã nhân viên không được phép trùng trong toàn bộ [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md). Nếu trùng thì cảnh báo: “Mã nhân viên đã tồn tại, vui lòng kiểm tra lại.” |
|  | Full name | Textview | full\_name/fullName | * Hiển thị [fullName] của người dùng được chọn tại box Tài khoản * Trường hợp api trả về lỗi/rỗng => để trống trường * Không cho sửa dữ liệu |
|  | Birth Date | Textview | date\_of\_birth/dateOfBirth | * Hiển thị [dateOfBirth] của người dùng được chọn tại box Tài khoản * Trường hợp api trả về lỗi/rỗng => để trống trường * Không cho sửa dữ liệu |
|  | Department | Dropdownlist | department | * Hiển thị thông tin [unit] theo dữ liệu Danh mục cơ quan đơn vị * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
|  | Email | Textview | email | * Hiển thị [email] của người dùng được chọn tại box Tài khoản * Trường hợp api trả về lỗi/rỗng => để trống trường * Không cho sửa dữ liệu * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Email không được phép trùng trong toàn bộ [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md). Nếu trùng thì cảnh báo: “Email người dùng đã tồn tại, vui lòng kiểm tra lại.” |
|  | Phone number | Textview | phone\_number/phoneNumber | * Hiển thị [phoneNumber] của người dùng được chọn tại box Tài khoản * Trường hợp api trả về lỗi/rỗng => để trống trường * Không cho sửa dữ liệu |
|  | Address | Textview | address | * Hiển thị [address] của người dùng được chọn tại box Tài khoản * Trường hợp api trả về lỗi/rỗng => để trống trường * Không cho sửa dữ liệu |
|  | User Group | Multi select drop list | user\_group/userGroup | * Cho phép chọn nhóm người dùng từ dropdown list * Không bắt buộc chọn * Click vào box => FE call API lấy [danh sách Nhóm người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) và hiển thị **tooltips** **suggest select** kho cho phép chọn nhiều giá trị * Cách hiển thị nhóm người dùng: Hiện dưới dạng tag, mỗi nhóm là 1 tag, cho phép click ![](data:image/png;base64...) để xóa bỏ nhóm người dùng khỏi box |
| 13 | Position | Textview | position | * Hiển thị nhãn [Chức vụ] * Lấy trường Title trả về từ LDAP * Trường hợp API trả về lỗi/rỗng: hiện **N/A** * Disable không cho nhập |
|  | HRMS code | TextBox [0;50] | hrms\_code/hrmsCode | * Hiển thị nhãn [Mã HRMS (mã nhân viên cũ)] * Không bắt buộc * Placeholder: “Nhập HRMS code” * Nhận dữ liệu dạng chữ, số, dấu chấm (.), gạch ngang (-), gạch dưới (\_) * Valid maxlength = 50 ký tự, chặn khi nhập quá 50 ký tự * Nếu paste đoạn văn > 50 ký tự, chỉ nhận 50 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung |
|  | Crew code | TextBox | crew\_code/crewCode | * Hiển thị nhãn [Crew code (mã AVES)] * Không bắt buộc * Cho phép nhập mã AVES * Kiểu dữ liệu string * Maxlenght 10 * Placeholder: Avescode |
|  | Industry Card Number | TextBox [0;100] | industry\_card\_number/industryCardNumber | * Hiển thị nhãn [Industry Card Number] * Không bắt buộc * Placeholder: “Nhập số thẻ ngành” * Nhận dữ liệu dạng chữ, số, dấu chấm (.), gạch ngang (-), gạch dưới (\_) * Valid maxlength = 50 ký tự, chặn khi nhập quá 50 ký tự * Nếu paste đoạn văn > 50 ký tự, chỉ nhận 50 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung |
|  | Carrier Authorization | Multi- dropdown list | carrier | * Hiển thị nhãn [Carrier Permissions] * Không bắt buộc chọn * Placeholder: “Chọn carrier” * Cho phép chọn [All] hoặc nhiều * Dữ liệu droplist lấy từ danh mục carrier và giá trị [All] * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, |
|  | Main Base | Multi- dropdown list | main\_base/mainBase | ● Placeholder: Chọn Main Base  ● Không bắt buộc chọn  ● Cho phép chọn nhiều giá trị  ● Dữ liệu droplist lấy từ **danh sách Main Base, không có dữ liệu hiển thị danh sách trống**  ● **Action**: + Tích chọn checkbox=> Dữ liệu hiển thị trên label  **+** Click x tại từng dữ liệu=> Xóa dữ liệu đó  + Click x trên label=> Xóa toàn bộ dữ liệu đã chọn |
|  | Fleet | Multi- dropdown list | fleet/rank | ● Placeholder: Chọn Fleet  ● Không bắt buộc chọn  ● Cho phép chọn nhiều giá trị  ● Dữ liệu droplist lấy từ **danh sách đội bay, không có dữ liệu hiển thị danh sách trống**  ● **Action**: + Tích chọn checkbox=> Dữ liệu hiển thị trên label  **+** Click x tại từng dữ liệu=> Xóa dữ liệu đó  + Click x trên label=> Xóa toàn bộ dữ liệu đã chọn |
|  | Group box **User Permissions** | | | |
|  | Title | Textview |  | * Mặc định hiển thị “**User Permissions**” |
|  | All System | Toggle switch | is\_all\_systems\_enabled | * Phân quyền truy cập full 2 Phân hệ   + On: Người dùng được phân quyền truy cập cả full 2 phân hệ   + Off: Người dùng không được phân quyền full 2 phân hệ   **Action**:   * + Default Off button   + Cho phép On/Off button   + Trường hợp user thao tác chuyển từ Off => On button: Tự động On all Toggle switch của 2 phân hệ   + Trường hợp user thao tác chuyển từ On => Off button: Tự động Off all Toggle switch của 2 phân hệ   + Trường hợp đang On => User thao tác Off button trong list 2 phân hệ bên dưới => tự động chuyển sang Off   + Trường hợp button đang Off => chọn Vai trò => tự động On button |
|  | Toggle switch | Toggle switch |  | * Hiển thị On/Off quyền trên 2 phân hệ * Danh sách Toggle switch của 2 phân hệ trong bảng:   + On: Người dùng được phân quyền truy cập hệ thống   + Off: Người dùng không được phân quyền truy cập hệ thống |
|  | Subsystem | Textview |  | * Hiển thị [Phân hệ]-[Tên] 2 phân hệ, sắp xếp lần lượt theo thứ tự:   + System Admin   + Toss |
|  | Role | DDL | role | * Hiển thị thông tin vai trò được phân cho người dùng theo từng hệ thống   ![](data:image/png;base64...)  TH user có chọn nhóm người dùng => hệ thống tự động suggest list vai trò của nhóm cho user. Cho phép sửa   * Placeholder “Chọn vai trò” khi Off Toggle switch => chọn vai trò => tự động chuyển On Toggle switch đó * **Default chọn vai trò Admin\_<tên hệ thống>** trong list vai trò của hệ thống khi On Toggle switch * Cho phép user chọn vai trò theo hệ thống * Trường hợp on cả 2 phân hệ và đều chọn **vai trò Admin\_<tên hệ thống>** =>   + Tự động on toggle switch Tất cả hệ thống   + Tự động gán **vai trò Admin tổng** cho User đó   và ngược lại   * Click => FE call API lấy [danh sách vai trò](TOSS.SA.ROLE_LIST.FD.v0.1.md) (ở trạng thái = Đang hoạt động) theo hệ thống, [danh sách vai trò](TOSS.SA.ROLE_LIST.FD.v0.1.md) được set trong phân hệ Quản lý vai trò => hiển thị **tooltips** **suggest** cho phép chọn **nhiều** giá trị. [Danh sách vai trò](TOSS.SA.ROLE_LIST.FD.v0.1.md) sắp xếp theo thứ tự a>z   ![](data:image/png;base64...)   * + Các vai trò đã được chọn hiển thị có tick checkbox ![](data:image/png;base64...) như design   + Outfocus/nhấn icon tìm kiếm để tìm kiếm   + Được phép chọn nhiều giá trị   + Có thể bỏ tick chọn   + Cho phép tick Tất cả ([số lượng]) để chọn tất cả vai trò trong suggest * Trường hợp API trả [danh sách vai trò](TOSS.SA.ROLE_LIST.FD.v0.1.md) lỗi/rỗng => hiển thị “Không có dữ liệu” trong tooltips |
|  | Cancel | Button | btn\_cancel | * Click: Đóng màn hình Thêm mới người dùng và không cần xử lý gì |
|  | Save | Button | btn\_save | Click:  Đóng màn hình Thêm mới người dùng  Call API Tạo mới người dùng vào database  Hiển thị màn hình thông báo kết quả update nếu:  Response API trả về status 200: hiển thị toast message thành công: [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  ![](data:image/png;base64...)  Ngược lại: hiển thị toast message lỗi theo từng tình huống [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)  ![](data:image/png;base64...)  Hoặc [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)  ![](data:image/png;base64...)  FE tự động refresh màn danh sách và hiển thị [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) mới nhất |

###

---

*Nguồn: tách trung thực từ `sec-11-quan-ly-nguoi-dung.md`, mục "Thêm mới User/Đồng bộ LDAP" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#8** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
