---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.ULD_CREATE"
feature_name: "Thêm mới ULD"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Thêm mới ULD

| **Tên chức năng: Thêm mới ULD** | |
| --- | --- |
| **Mục đích** | Cho phép user Thêm mới ULD |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Danh mục => Nhấn chọn ULD => Chọn button “Thêm mới” |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền thêm ULD |
| **Hậu điều kiện** | Thêm mới thành công ULD |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng hệ thống thêm mới ULD

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
| **1** | Bước 1 | Người dùng truy cập vào web FIMS =>Chọn tab Danh mục => Chọn “Danh mục ULD” |
| **2** | Bước 2 | Người dùng chọn button “Thêm mới” |
| **3** | Bước 3 | Hệ thống hiển thị màn hình Thêm mới ULD |
| **4** | Bước 4 | User nhập dữ liệu và nhấn **Lưu lại** |
| **5** | Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Trường hợp thiếu dữ liệu bắt buộc/Sai định dạng valid/Call API tạo mới ULD cho FIMS có lỗi => Báo lỗi theo bước 6 * Ngược lại: Tạo mới ULD thành công => Thực hiện tiếp bước 7 & 8 |
| **6** | Bước 6 | Hiển thị toast báo lỗi cho người dùng:   * Trường hợp thiếu trường bắt buộc: Hiển thị inline message (IM) tại trường có lỗi [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj):ng “The **<field name>** field must not be empty.” * Trường hợp Sai định dạng valid: Hiển thị IM tại trường có lỗi [VL006](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.lwrynb3cmu73): “**<Field name>** is in an invalid format.” * Trường hợp Call API tạo mới trả về lỗi: hiển thị toast message (TM)   + Trườ hợp lỗi API trả về có message: hiện [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   ![](data:image/png;base64...)   * + Hoặc hiện [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)   ![](data:image/png;base64...) |
| **7** | Bước 7 | Trường hợp tạo ULD Type thành công: BE Lưu và cập nhật [danh sách ULD](TOSS.DM.ULD_LIST.FD.v0.1.md)  Trả API thành công cho FE |
| **8** | Bước 8 | FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  ![](data:image/png;base64...)  Đóng popup Tạo mới, tự động refresh màn danh sách và hiển thị [Danh sách ULD](TOSS.DM.ULD_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện thêm mới ULD

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **1** | Title | Textview |  | * Text cứng “Add New” |
| **2** | Icon X | Icon |  | * Click icon → Đóng popup. Điều hướng về màn trước đó |
| **3** | ULD Type | DDL |  | * Chỉ hiển thị ULD type ở trạng thái active * Bắt buộc chọn * Placeholder: “Chose ULD Type” * Dữ liệu lấy ở Danh mục ULD Type, lấy theo ULD Type code. * Cho phép người dùng nhập để tìm kiếm hoặc chọn trong danh sách dữ liệu ULD type * Cho phép chọn 1 giá trị * Trường hợp nội dung dài vượt quá độ rộng box, hiển thị dấu … => di chuột vào hiện tooltips hiển thị full nội dung * Action: User out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) “The **ULD Type** field must not be empty.” * **Sau khi chọn xong** ⇒ mặc định hiển thị thông Tare Weight (kg) theo ULD Type được chọn dưới chận box |
| **4** | ULD Code | TextBox [0;255] |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “Enter ULD Code” * Bắt buộc nhập * Maxlength 255 ký tự. Chặn nếu nhập quá 255 ký tự. * Nếu paste đoạn văn > 255 ký tự, chỉ nhận 255 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/]   + Chặn trùng dữ liệu.   + Regex chuẩn IATA: ^[A-Z]{3}[0-9]{4,5}[A-Z]{2,3}$   + Không nhập theo IATA thì khi save sẽ hiển thị inline mesage “ULD Code is invalid” * Trường hợp nội dung dài vượt quá độ rộng box hiển thị dấu … => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: User out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) “The **ULD Code**   field must not be empty.”   * + Trường hợp nhập ULD Code đã tồn tại trong hệ thống. => Hiển thị thông báo toast: “The ULD code already exists.”   ![](data:image/png;base64...) |
| **5** | Owner | TextBox [0;255] |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “Enter Owner” * Bắt buộc nhập * Maxlength 255 ký tự. Chặn nếu nhập quá 255 ký tự * Nếu paste đoạn văn > 255 ký tự, chỉ nhận 255 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập String * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: User out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) “The **Owner**   field must not be empty.” |
| **6** | Current Location | TextBox [0;255] |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “Enter Current Location ” * Bắt buộc nhập * Maxlength 255 ký tự. Chặn nếu nhập quá 255 ký tự * Nếu paste đoạn văn > 255 ký tự, chỉ nhận 255 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập String * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: User out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) “**The Current Location** field must not be empty” |
| **7** | **Serial Number** | | | |
| **8** | ![](data:image/png;base64...) |  |  | * Click ⇒ thêm 1 dòng trống dưới cuối bảng Serial Number * Trường hợp thêm row mới (chưa nhập dữ liệu) hoặc user nhập thiếu trường dữ liệu trong row đó => User nhấn button Save thì hệ thống validate dữ liệu tuần tự từ trên xuống và hiển thị toast: “Row {N}: Please complete all required fields.”   ![](data:image/png;base64...) |
| **9** | ![](data:image/png;base64...) |  |  | * Click ⇒ mở cửa sổ Open của thiết bị ⇒ cho phép chọn file upload dữ liệu dạng xls, xlsx; Tối đa upload cùng 1 lúc: 10 tệp; Kích thước tối đa mỗi tệp: 5MB   ![](data:image/png;base64...)   | Tên | Kiểu dữ liệu | Mô tả | | --- | --- | --- | | Title | Textview | * Fix cứng content : “Initialize with excel” * Không cho thao tác | | ![](data:image/png;base64...) | Icon | * Click icon → Đóng popup tải file. Điều hướng về màn hình popup sửa trước đó | | Khu vực kéo thả (Drag & Drop Area)  ![](data:image/png;base64...) |  | * Hiển thị khu vực cho phép người dùng thao tác kéo thả file trực tiếp từ máy tính vào. * Hiển thị text cứng bên trong: “Drag and drop files here.” | | ![](data:image/png;base64...) | Button | * Click ⇒ Mở cửa sổ Open (File Explorer/Finder) của thiết bị ⇒ cho phép người dùng duyệt và chọn file upload dữ liệu. | | “Accepted formats include .xlsx and xls (maximum is 5MB)” | Textview | * Fix cứng content * Không cho thao tác | | “For accurate import results, please use the template file.” | Text view | * Fix cứng content * Không cho thao tác | | ![](data:image/png;base64...) | Hyperlink | * Click ⇒ Hệ thống tự động tải xuống thiết bị (download) file excel template mẫu chuẩn có chứa các cột dữ liệu tương ứng. * Template: [Template import row Serial Number](https://docs.google.com/spreadsheets/d/1LWiRM1U7d_pGvO9obI3Brk8ohSxy6Ma5v9Jfm8xTSNQ/edit?usp=sharing) | | “Each line of data in the import file corresponds to one record.” | Textview | * Fix cứng content * Không cho thao tác |   Popup khi upload file lỗi:  ![](data:image/png;base64...)   | Tên | Kiểu dữ liệu | Mô tả | | --- | --- | --- | | Title | Textview | * Fix cứng content : “Initialize with excel” * Không cho thao tác | | ![](data:image/png;base64...) | Icon | * Click icon → Đóng popup tải file. Điều hướng về màn hình popup sửa trước đó. | | ![](data:image/png;base64...) |  | * Hiển thị hình minh họa màn hình máy tính kèm icon cảnh báo lỗi (dấu X nền đỏ) ở trung tâm | | Thông báo lỗi | Textview | * Các TH lỗi upload một file:   + TH upload file không đúng định dạng hiển thị IM: “Invalid file format. Only .xls and .xlsx files are supported”   + TH upload file mà các cột bên trong không đúng theo template mẫu thì hiển thị IM: “Invalid file template. Please use the provided template file.”   + TH upload file mà vượt quá dung lượng=> Thông báo lỗi nếu tệp vượt quá giới hạn kích thước “The file is too large. Please upload a file smaller than 5MB.”   + Thông báo lỗi nếu lỗi xảy ra: “File upload failed. Please try again later.” | | Tên file tải lên | Textview | * Hiển thị tên đầy đủ của file đã được chọn   ![](data:image/png;base64...)   * Trường hợp tên file dài vượt quá độ rộng box, hiển thị dấu … => di chuột vào hiện tooltips hiển thị full tên file | | ![](data:image/png;base64...) | Icon | **Action:** Click ⇒ Hủy bỏ file hiện tại đang bị lỗi. Hệ thống xóa tên file khỏi màn hình và quay trở lại giao diện Upload ban đầu (kéo thả/chọn file) | | Choose another file | Button | ![](data:image/png;base64...)   * **Action:** Click ⇒ Mở lại cửa sổ hệ thống (File Explorer) để người dùng trực tiếp chọn một file excel khác thay thế cho file đang bị lỗi. | | ![](data:image/png;base64...) | Button | * **Action:** Click → Đóng popup, hủy thao tác. Không có dữ liệu nào được lưu. Điều hướng về màn hình popup sửa trước đó. | | ![](data:image/png;base64...) | Button | * Khi file tải lên bị lỗi=> nút 'Continue' sẽ bị Disable (vô hiệu hóa/làm mờ) để ngăn user tiếp tục thao tác. |   Popup khi upload file thành công:   * + TH đã nhập dữ liệu, khi upload file (đúng định dạng, đúng template, đúng dung lượng) => Hiển thị giao diện upload file thành công:   ![](data:image/png;base64...)Đồng thời hệ thống sẽ check:   * + - Dữ liệu trùng Serial number => thực hiện cập nhật các trường dữ liệu theo file     - Dữ liệu mới => Thực hiện update xuống dưới row cuối cùng mà user đã nhập * File mẫu: [Template import row Serial Number](https://docs.google.com/spreadsheets/d/1LWiRM1U7d_pGvO9obI3Brk8ohSxy6Ma5v9Jfm8xTSNQ/edit?usp=sharing) * Định dạng file: gồm 2 cột: Serial Number & Owner code |
| **10** | Serial Number | Textbox |  | * Placeholder: Serial Number * Bắt buộc nhập * Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự * Nhận dữ liệu chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập chữ, số, và ký tự đặc biệt   + Chặn trùng dữ liệu trên bảng Serial Number thuộc cùng ULD Code * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: User out focus/click button **Save**, hệ thống validate, nếu   + Trường hợp nhập Serial Number đã tồn tại trong cùng bảng => Hiển thị thông báo IM: [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) “**Serial Number** already exists. Please check again.” |
| **11** | Owner code | Textbox |  | * Default = [Owner của ULD Code], cho phép sửa * Bắt buộc nhập * Maxlength 255 ký tự. Chặn nếu nhập quá 255 ký tự * Nhận dữ liệu chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập chữ, số, và ký tự đặc biệt * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**:   + Out focus => Hiển thị thông tin owner code   + Click button **Save** => hệ thống lưu thông tin Owner code. |
| **12** | ![](data:image/png;base64...) | Icon |  | * Click ⇒ xóa dòng |
| **13** | Trạng thái | Radio button |  | * Mặc định: Tick Active * Cho phép chọn InActive * Ẩn trường này tại form Thêm mới, chỉ hiện tại form sửa |
| **14** | Hủy bỏ | Button |  | * Click → Đóng popup. Điều hướng về màn trước đó * Dữ liệu không được lưu vào DB |
| **15** | Lưu lại | Button |  | * Click vào. Hệ thống kiểm tra   + Dữ liệu hợp lệ, hệ thống lưu thành công và hiển thị toast message [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)   ![](data:image/png;base64...)   * + - Lưu thông tin thành công → Đóng popup. Điều hướng về màn danh sách     - Dữ liệu lưu trong DB |

---

*Nguồn: tách trung thực từ `sec-29-quan-ly-danh-muc-uld.md`, mục "Thêm mới ULD" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#42** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
