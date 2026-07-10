---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.AIRPORT_UPDATE"
feature_name: "Sửa thông tin sân bay"
---

## Sửa thông tin sân bay

| **Tên chức năng: Edit sân bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Sửa thông tin sân bay |
| **Trigger** | Người dùng truy cập vào web FIMS => mở đến module sân bay => chọn icon “ Sửa” tại sân bay muốn chỉnh sửa thông tin |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Sửa trên sân bay |
| **Hậu điều kiện** | Mở màn hình popup **Edit sân bay** trên giao diện người dùng |

### *Sơ đồ luồng hệ thống*

![](data:image/png;base64...)

1. Sơ đồ luồng nghiệp vụ

### *Mô tả luồng xử lý*

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | Bước 1 | User truy cập vào web FIMS => mở đến module Danh mục => sân bay  => hiển thị màn hình sân bay List |
|  | Bước 2 | User click icon “Sửa” tại sân bay muốn chỉnh sửa |
|  | Bước 3 | Hệ thống hiển thị màn hình sửa sân bay  Cho phép User chỉnh sửa thông tin sân bay |
|  | Bước 4 | User update dữ liệu và nhấn **Lưu lại** |
|  | Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Dữ liệu không hợp lệ: chuyển sang Bước 6 * Ngược lại chuyển sang Bước 7 |
|  | Bước 6 | Hiển thị toast message lỗi đến người dùng |
|  | Bước 7 | Update dữ liệu vào DB |
|  | Bước 8 | Hiển thị toast message Sửa thành công; Đóng màn hình Sửa |

### *Màn hình chức năng*

![](data:image/png;base64...)

1. Giao diện Edit sân bay

### *Mô tả chi tiết màn hình danh sách*

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | Edit airport | Title |  | * Fix cứng text “Edit airport” * ![](data:image/png;base64...) => click > thực hiện đóng popup và không cần xử lý gì |
|  | Detail Information | Textview |  |  |
|  | IATA Code | TextBox |  | * Hiển thị [IATA Code] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter IATA Code” * Bắt buộc nhập * Nhận dữ liệu dạng chữ, số, dấu chấm (.), gạch ngang (-), gạch dưới (\_), 3 ký tự đầu bắt buộc nhập định dạng chữ in hoa. VD: ABC=> không nhập 3 ký tự đầu tiên bằng chữ in hoa=> chặn không cho phép nhập * Valid maxlength = 10 ký tự, chặn khi nhập quá 10 ký tự * Nếu paste đoạn văn > 10 ký tự, chỉ nhận 10 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp nhập mã IATA Code đã tồn tại trong hệ thống. => Hiển thị thông báo IM: “IATA Code already exists" |
|  | ICAO Code | TextBox |  | * Hiển thị [ICAO Code] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter ICAO Code” * Bắt buộc nhập * Nhận dữ liệu dạng chữ, số, dấu chấm (.), gạch ngang (-), gạch dưới (\_), 4 ký tự đầu bắt buộc nhập định dạng chữ in hoa. VD: ABCD=> không nhập 4 ký tự đầu tiên bằng chữ in hoa=> chặn không cho phép nhập * Valid maxlength = 10 ký tự, chặn khi nhập quá 10 ký tự * Nếu paste đoạn văn > 10 ký tự, chỉ nhận 10 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp nhập mã IATA Code đã tồn tại trong hệ thống. => Hiển thị thông báo IM: “ICAO Code already exists" |
|  | Airport Name | TextBox |  | * Hiển thị [Airport Name] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter Airport Name” * Bắt buộc nhập * Nhận dữ liệu dạng chữ, số, dấu chấm (.), gạch ngang (-), gạch dưới (\_) * Valid maxlength = 100 ký tự, chặn khi nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 10 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Cho phép trùng tên * Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM:[VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
|  | Region | Textview |  | * Hiển thị [Region] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter Region” * Bắt buộc nhập * Nhận dữ liệu dạng chữ, số, dấu chấm (.), gạch ngang (-), gạch dưới (\_) * Valid maxlength = 100 ký tự, chặn khi nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
|  | Country code | Textview |  | * Hiển thị [Country code] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter country code” * Không bắt buộc nhập * Nhận dữ liệu dạng chữ, số, và ký tự đặc biệt * Valid maxlength = 10 ký tự, chặn khi nhập quá 100 ký tự * Nếu paste đoạn văn > 10 ký tự, chỉ nhận 10 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống lưu thông tin Country code |
|  | Country Name | Textview |  | * Hiển thị [Country name] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter Country name” * Bắt buộc nhập * Nhận dữ liệu dạng chữ, số, dấu chấm (.), gạch ngang (-), gạch dưới (\_) * Valid maxlength = 100 ký tự, chặn khi nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
|  | Fleets | DDL |  | * Hiển thị [Fleets] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Select Fleets” * Bắt buộc chọn * Các giá trị fleets API trả về * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM:[VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
|  | Time zone | Dropdown |  | * Hiển thị danh sách [Time Zone] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiển thị placeholder **“Select Time zone”** * Bắt buộc chọn * Chỉ cho phép chọn 01 giá trị * Không cho phép nhập tự do (không editable text) * Danh sách được sắp xếp theo GMT tăng dần * Trường hợp nội dung dài vượt quá độ rộng box ⇒ hiển thị tooltip khi hover để xem full nội dung |
|  | Main Base | Toggle switch |  | * Hiển thị trạng thái [Main Base] * Switch to turn Yes/No |
|  | Active | Toggle switch | is\_active/isActive | * Hiển thị theo trạng thái hoạt động của người dùng:   + Trạng thái = Active: On   + Trạng thái = Inactive: Off   + Cho phép user thao tác On/Off trạng thái hoạt động của người dùng   + Chi tiết kịch bản tham chiếu mục [Bật/tắt Hoạt động người dùng](../../../SA-system-admin/srs/_parts/TOSS.SA.TOGGLE_USER.FD.v0.1.md)   + Riêng đối với **Người dùng [Admin]**: không hiển thị Toggle switch |
| 1. 1 | Contact Information |  |  | * User nhấn icon ![](data:image/png;base64...) trên bản ghi ở list Liên hệ: Hiển thị popup cảnh báo   ![](data:image/png;base64...)   * **Title:**    + Text “Delete Contact sân bay”   + Text “Are you sure want to delete Contact sân bay: [Full name]/Position] * **Reason**   + Mặc định để trống   + Placeholder = “Enter reason…”   + Maxlength = 1000 ký tự, nếu paste chỉ nhận 1000 ký tự đầu tiên * **Cancel hoặc Icon X phải popup:** Click vào → Đóng popup. Điều hướng về màn danh sách * **Delete:**    + Click vào → Hệ thống kiểm tra trường [Reason] không nhập thông tin,hiển thị toast message   ![](data:image/png;base64...)   * Hệ thống xóa thành công Liên hệ => Hiển thị toast message Xóa thành công → Đóng popup => Quay trở lại màn Edit |
|  | ![](data:image/png;base64...) |  |  | * Không bắt buộc thêm   **Thêm contact sân bay**:  Click![](data:image/png;base64...) => Hệ thống call API lấy trường [Họ và tên] , [Vị trí làm việc] từ phân hệ **Liên hệ.** Và các trường ấy phải của Liên hệ có [Loại] = Thường, [Trạng thái hoạt động] = Đang hoạt động   * Hiển thị Dropdown list các liên hệ với thông tin bao gồm [Họ và tên], [Vị trí làm việc] sắp xếp từ a -> z: ![](data:image/png;base64...)   + ![](data:image/png;base64...):     - TH **Add**:   + Mặc định uncheck, user được phép tích chọn thêm nhiều liên hệ.  + Khi user tích chọn, hiển thị **Đã chọn**: [X], fix cứng “**Đã chọn**”, **X** là tổng số checkbox được chọn. Mặc định không hiện khi chưa có checkbox được chọn   * + - TH **Edit**: Không cho phép sửa * **Searchbox**:   + - Placeholder “Search”     - Cho phép nhận và tìm kiếm gần đúng theo [Họ và tên , Vị trí làm việc]     - Maxlength 100 ký tự     - Validate cho phép nhập chữ, số, và ký tự đặc biệt     - Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập     - Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu     - Tự động TRIM Spaces đầu cuối khi tìm kiếm Liên hệ     - Trường hợp Searchbox không có dữ liệu: Mặc định hiển thị full danh sách Liên hệ     - Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/nhấn Enter => hệ thống thực hiện:       * Reload dữ liệu suggest phù hợp với từ khóa       * Highlight phần nội dung khớp với từ khóa       * Default focus vào dòng đầu tiên của tooltips   + Hiển thị kết quả tìm kiếm:     - Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về     - Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” * **Action chọn người dùng** trong tooltips (User chọn 1 **suggest** bất kỳ, hoặc di chuyển focus và nhấn Enter)   => Đóng **tooltips** **suggest** và tự động insert thông tin người dùng vào bảng ( Khi user nhấn Add new thì sẽ không hiện Liên hệ ở bảng vào DDL nữa) :  ![](data:image/png;base64...)  **Xóa contact sân bay:**   1. TH Add: User click icon ![](data:image/png;base64...)=> Xóa Liên hệ khỏi table ( Khi user nhấn Add new thi Liên hệ đó hiện lại ở DDL và ngược lại ) 2. TH Edit: User click icon ![](data:image/png;base64...)=> [Hiển thị popup cảnh báo](#bookmark=kix.vz18n0395dg1) |
|  | Note | Textbox |  | * Placeholder: Enter Note * Không bắt buộc nhập * Maxlength 3000 ký tự. Chặn nếu nhập quá 3000 ký tự * Nhận dữ liệu chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 3000 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống lưu thông tin ghi chú. Không có thông tin, lưu trống |
|  | Cancel | Button | btn\_cancel | Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Save | Button |  | Click:   * Đóng màn hình Edit * Call API Update dữ liệu sân bay vào database * Hiển thị màn hình thông báo kết quả update nếu:   + Response API trả về status 200: hiển thị toast message thành công: [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f) * Ngược lại: hiển thị toast message lỗi theo dữ liệu API trả về: [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh) |

---

*Nguồn: tách trung thực từ `sec-17-sua-thong-tin-san-bay.md` (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, mục `Sửa thông tin sân bay`) — tương ứng dòng **#4** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
