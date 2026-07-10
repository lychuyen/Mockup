---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.AIRCRAFT_EDIT_GENERAL"
feature_name: "Sửa tàu bay — tab General Information"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Sửa [chi tiết tàu bay](TOSS.DM.AIRCRAFT_DETAIL_GENERAL.FD.v0.1.md) - tab General Information

| **Tên chức năng**: **Sửa tàu bay - tab General Information** | |
| --- | --- |
| **Mục đích** | Cho phép user chỉnh sửa thông tin General Information |
| **Trigger** | User click button “Sửa” tại màn hình [chi tiết tàu bay](TOSS.DM.AIRCRAFT_DETAIL_GENERAL.FD.v0.1.md) General Information |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Sửa tàu bay - tab General Information |
| **Hậu điều kiện** | Sửa thành công, dữ liệu được lưu vào DB |

#### Sơ đồ luồng

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng đăng nhập vào hệ thống TOSS, truy cập Data Maintenance → Quản lý tàu bay và chọn một tàu bay để xem thông tin chi tiết |
| 2 | Hệ thống gọi API lấy thông tin chi tiết của tàu bay và hiển thị trên màn hình |
| 3 | Người dùng chọn tab General Information |
| 4 | Hệ thống hiển thị thông tin General Information của tàu bay . |
| 5 | Người dùng nhấn nút Edit |
| 6 | Hệ thống mở màn hình Edit General Information |
| 7 | Người dùng cập nhật thông tin và nhấn Save |
| 8 | Hệ thống kiểm tra tính hợp lệ của dữ liệu nhập |
| 9 | Nếu dữ liệu không hợp lệ, hệ thống hiển thị thông báo lỗi và yêu cầu người dùng chỉnh sửa |
| 10 | Nếu dữ liệu hợp lệ, hệ thống cập nhật dữ liệu vào cơ sở dữ liệu |
| 11 | Hệ thống hiển thị thông báo "Updated successfully." |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

####

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| * **Khi user đang edit tại tab này => Hệ thống thực hiện không cho thao tác ở các tab khác, chức năng khác trên màn và trên cùng 1 tab** | | | | |
| 1 | Tab General Information | Tab |  | User click vào tab => bôi đậm |
| 2 | General Information | Title |  | * Fix cứng không cho thao tác |
| 3 | AC Subtype Type | Textview |  | * Hiển thị tên AC Subtype Type * Hiển thị [AC Subtype Type] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: Để trống * Không cho phép thao tác sửa |
| 4 | Aircraft Type Name | Textview |  | * Hiển thị tên Aircraft Type Name * Hiển thị [Aircraft Subtype Name] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter the Aircraft Type Name” * Bắt buộc nhập * Nhập free text * Valid maxlength = 100 ký tự, chặn khi nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Action: User out focus/click button Save, hệ thống validate, nếu:   + Để trống ⇒ Hiển thị thông báo IM: “The Aircraft Type Name field must not be empty.”   + Ngược lại: Hiển thị Aircraft Type Name đã điền (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
| 5 | Valid From | Datetime picker |  | * Đồng bộ từ Netline ops ++ * Ngày bắt đầu hiệu lực * Hiển thị ngày bắt đầu hiệu lực * Trường hợp API trả về rỗng/lỗi: để trống * Format dd/mm/yyyy * Không cho phép chỉnh sửa |
| 6 | Valid To | Datetime picker |  | * Đồng bộ từ Netline ops ++ * Ngày kết thúc hiệu lực * Hiển thị ngày kết thúc hiệu lực * Trường hợp API trả về rỗng/lỗi: để trống * Format dd/mm/yyyy * Không cho phép chỉnh sửa |
| 7 | ICAO Code | Textbox |  | * Hiển thị thông tin [ICAO Code ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter ICAO Code” * Maxlength 10 ký tự. Chặn nếu nhập quá 10 ký tự * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/] * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * Bắt buộc nhập * Action: User out focus/click button Save, hệ thống validate, nếu:   + Để trống ⇒ Hiển thị thông báo inline: “The ICAO Code field must not be empty.”   + Ngược lại: Hiển thị ICAO Code đã điền (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
| 8 | IATA Code | Textbox |  | * Hiển thị thông tin [IATA Code ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter IATA Code” * Maxlength 10 ký tự. Chặn nếu nhập quá 10 ký tự * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/] * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * Bắt buộc nhập * Action: User out focus/click button Save, hệ thống validate, nếu:   + Để trống ⇒ Hiển thị thông báo inline: “The IATA Code field must not be empty.”   + Ngược lại: Hiển thị IATA Code đã điền (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
| 9 | Ownership Status | DDL |  | * Hiển thị thông tin [Ownership Status] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: để trống * Chỉ cho phép chọn 1 giá trị: Owned / Wet Leased / Dry Leased * **Action**: Nhấn out focus/click button Save hệ thống validate, nếu * Để trống ⇒ Hiển thị thông báo IM: “The Ownership Status field must not be empty.” * Ngược lại: Hiển thị trạng thái đã chọn (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
| 10 | Owner | Textbox |  | * Hiển thị thông tin [Owner ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter Owner” * Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự * Validate   + Cho phép nhập freetext * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * Bắt buộc nhập * TH user chọn Ownership status là Owned thì mặc định Owner là “Vietnam Airlines” và cho phép sửa * TH user đã sửa Owner khác “VietNam Airlines” và quay lại chọn lại Ownership status là “ Owned” => Thì tự động chuyển Owner thành “VietNam Airlines” * Action: User out focus/click button Save, hệ thống validate, nếu:   + Để trống ⇒ Hiển thị thông báo inline: “The Owner field must not be empty.”   + Ngược lại: Hiển thị Owner đã điền (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
| 11 | Status | DDL |  | * Hiển thị thông tin [Status] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: để trống * Chỉ cho phép chọn 1 giá trị: Active/Inactive * **Action**: Nhấn out focus/click button Save hệ thống validate, nếu * Để trống ⇒ Hiển thị thông báo IM: “The Status field must not be empty.” * Ngược lại: Hiển thị trạng thái đã chọn (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
| 12 | Cancel | button |  | * Click button Hủy bỏ => Đóng màn hình sửa Dữ liệu thay đổi không được lưu vào DB |
| 13 | Save | button |  | * User click button => Hệ thống lưu thông tin chỉnh sửa hợp lệ, đồng thời lưu log chỉnh sửa những trường thông tin:   + Aircraft Type Name   + ICAO Code   + IATA Code   + Ownership Status   + Owner   + Status   Theo:   | **Thông tin lưu log** | **Mô tả** | | --- | --- | | **Date/Time** | Thời điểm thực hiện thao tác. | | **Changed By** | Người thực hiện thao tác. | | **Section** | Tên cụm block thay đổi thông tin | | **Action** | Loại thao tác được ghi nhận (**Add**, **Modify**, **Delete**). | | **Field** | Tên trường dữ liệu được thay đổi. | | **Old Value** | Giá trị của trường dữ liệu trước khi thay đổi. | | **New Value** | Giá trị của trường dữ liệu sau khi thay đổi. |  * TH API trả về thành công => Hiển thị toast thông báo thành công: “General Information successfully edited.”   ![](data:image/png;base64...)   * TH API trả về lỗi => Hiển thị toast thông báo không thành công: “Failed to edit General Information. ”   ![](data:image/png;base64...) |

---

*Nguồn: tách trung thực từ `sec-33-quan-ly-tau-bay.md`, mục "Sửa tàu bay — tab General Information" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#63** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
