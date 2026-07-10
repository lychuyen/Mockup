---
source_gdrive: "https://docs.google.com/spreadsheets/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A"
source_name: "VNA.TOSS_SRS_Thiết kế dùng chung_v0.1"
document_type: "Google Drive → MD (read-only)"
source_version: "856"
source_modified: "2026-07-09T02:07:13.130Z"
last_modifying_user: "vietanh3796"
pulled: "2026-07-10"
status: "Raw pull — chưa biên tập"
---

> **Nguồn (Google Drive, live):** VNA.TOSS_SRS_Thiết kế dùng chung_v0.1 — https://drive.google.com/file/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A  
> Pull 2026-07-10 (version 856, sửa 2026-07-09T02:07:13.130Z bởi vietanh3796).

# **THIẾT KẾ DÙNG CHUNG VÀ TÁI SỬ DỤNG**

## **Thiết kế dùng chung**

| **STT** | **Yêu cầu** |
| --- | --- |
| **Quy tắc chung về giao diện người dùng** | |
|  | **Menu hệ thống**   * Khi di chuột qua, menu đó sẽ được highlight để thể hiện trạng thái hover. * Khi nhấn vào 1 mục menu chính, điều hướng đến trang tương ứng:   + Home   + … * Nhấn vào chevron bên cạnh một mục menu chính sẽ mở rộng (expand) submenu tương ứng.   **=> Lưu ý:** Khi 1 submenu mở rộng, các submenu khác sẽ tự động đóng lại.   * Nhấn vào một mục trong submenu sẽ điều hướng đến trang tương ứng. * Khi nhấn vào “Collapse menu”, thì thu gọn và hiển thị icon tượng trưng. |
|  | **Tab Navigator:**  **….**  Cung cấp cách thức điều hướng giữa các mục (tab) trong cùng một cấp độ.   * **Thanh tab:** Khi nhấn vào một tab, nội dung tương ứng được hiển thị * **Chỉ báo tab hiện tại:** Hiển thị tab được chọn với đường gạch chân, màu xanh highlight. * **Badge:** Hiển thị banner noti tab. Ví dụ: “Drafts (1)” và “Actions (1)” |
| 3. | **Toast message (Thông báo):** Hiển thị thông báo ngắn gọn về trạng thái của hành động hoặc sự kiện   * Vị trí: Hiển thị ở góc dưới bên phải của màn hình hệ thống * Thời gian hiển thị: Tự động biến mất sau 3 giây * Kiểu dáng:   + Thông báo thành công: Biểu tượng checkmark màu xanh lá   + Thông báo lỗi: Biểu tượng alert màu đỏ   + Thông báo cảnh báo: Biểu tượng info màu xanh dương * Nội dung: Phụ thuộc vào hành động, sự kiện dẫn tới thông báo |
| **Quy tắc chung về nhập liệu và hiển thị dữ liệu** | |
|  | **Lưu trữ dữ liệu trên form nhập liệu:**   * Khi reload:   + Nếu bản ghi chưa được lưu - hiển thị popup cảnh báo huỷ dữ liệu đã nhập, xóa toàn bộ thông tin đã nhập trên form.   + Nếu bản ghi đã được lưu, giữ nguyên thông tin hiện tại trên màn hình.   + Ghi nhớ vị trí đang xem trên màn hình |
|  | **Nút (Buttons):** Kích hoạt hành động cụ thể khi người dùng nhấp vào.   * Kiểu dáng:   + Nút chính: màu xanh dương, dùng cho hành động chính   + Nút phụ: màu trắng, dùng cho hành động phụ (ví dụ: Cancel, Close…)   + Các nút có thể tuỳ vào thiết kế của từng chức năng theo mẫu * Trạng thái:   + Bình thường: Hiển thị rõ ràng, có thể nhấp được   + Hover: Khi di chuột qua, thay đổi sang màu “...”   + Vô hiệu hóa: Bị mờ và không thể nhấp được |
|  | **Trường thông tin nhập cơ bản:**   * **Khi hiển thị:**   + Nếu số lượng ký tự ngắn hơn độ dài ô, hiển thị toàn bộ giá trị.   + Nếu số lượng ký tự vượt quá độ dài ô, hiển thị một phần giá trị + "...". Khi di chuột qua trường, hiển thị toàn bộ giá trị trong tooltip. * **Khi nhập dữ liệu**   + Khi focus vào textbox, placeholder ẩn đi   + Khi nhập dữ liệu, nội dung sẽ hiển thị trong textbox   + Nếu không nhập dữ liệu và chuyển sang trường khác:     - Trường không bắt buộc -> placeholder hiển thị lại.     - Trường bắt buộc, hiển thị cảnh báo đỏ: “This field is required!”. * **Kiểm tra dữ liệu**   + **Yêu cầu kiểm tra trường bắt buộc:**      - Trường dữ liệu bắt buộc nhập được đánh dấu (\*) cạnh tên trường.     - Nếu các trường dữ liệu bắt buộc còn trống, highlight các trường thông tin đó và hiển thị: “This field is required!”.   + **Yêu cầu kiểm tra độ dài tối đa:**      - Không hiển thị thêm bất kỳ ký tự nào khi dữ liệu đạt đến độ dài tối đa.     - Hiển thị cảnh báo đỏ: “Character limit X reached!”.   + **Yêu cầu kiểm tra định dạng dữ liệu:** Không hiển thị bất kỳ ký tự nào không hợp lệ đối với kiểu dữ liệu. |
|  | **Danh sách lựa chọn (Dropdownlist):** Cung cấp danh sách lựa chọn có sẵn để lựa chọn 1 hoặc nhiều giá trị.   * **Hiển thị:**    + Mặc định: Hiển thị giá trị được chọn hiện tại hoặc placeholder   + Khi kích hoạt: Hiển thị danh sách các lựa chọn có thể chọn được * **Lựa chọn:**   + Đơn lựa chọn: Chỉ chọn 1 giá trị   + Đa lựa chọn: Có thể chọn nhiều giá trị * **Dữ liệu**: sắp xếp theo thứ tự từ alphabet đến thứ tự số. * **Trạng thái:**    + Bình thường: hiển thị bình thường, người dùng có thể tương tác.   + Vô hiệu hóa: bị mờ đi và không thể tương tác. * **Lưu ý: Nếu là dữ liệu danh mục, chỉ hiển thị những giá trị còn hiệu lực** |
|  | **Bộ chọn ngày (Datepicker):** Cho chọn ngày tháng năm từ lịch tương tác   * **Hiển thị:**    + Mặc định: Hiển thị ngày tháng năm hiện tại hoặc placeholder   + Khi được kích hoạt: Hiển thị lịch để chọn thời gian * **Lựa chọn:** Chọn ngày tháng năm bằng cách nhấp vào ngày trên lịch. * **Điều hướng:** Di chuyển giữa các tháng, năm bằng nút điều hướng. * **Giới hạn:** Chỉ cho phép chọn thời gian từ hôm nay trở về trước. * **Trạng thái:**   + Bình thường: Hiển thị bình thường, người dùng có thể tương tác.   + Vô hiệu hóa: Bị mờ đi và không thể tương tác. |
|  | **Checkbox:** Lựa chọn một hoặc nhiều mục từ danh sách tùy chọn   * **Lựa chọn:** Cho phép chọn nhiều checkbox cùng lúc * **Trạng thái:**   + Chọn: Checkbox được chọn và có dấu tích.   + Không chọn: Checkbox không được chọn và ô vuông trống.   + Vô hiệu hóa: Checkbox bị mờ đi và không thể tương tác. * **Hành vi:** Khi người dùng nhấp vào checkbox, trạng thái sẽ thay đổi (chọn hoặc không chọn). |
|  | **Trình soạn thảo văn bản (Text editor):**  ![](data:image/png;base64...)   * Cho phép nhập và định dạng văn bản gồm:   + Heading (H1, H2…)   + In đậm (**B**)   + In nghiêng (*I*)   + Gạch bỏ (~~S~~)   + Line Separator (-)   + Text block (“”)   + Chèn liên kết   + Danh sách (có thứ tự và không thứ tự)   + Căn lề (trái, giữa, phải) * **Xử lý:** Hiển thị chính xác định dạng văn bản khi xem trước và sau khi lưu.   + Tự động điều chỉnh kích thước theo nội dung.   + Hỗ trợ hiển thị trên các thiết bị và trình duyệt khác nhau. |
|  | **Tệp đính kèm (Attachments):** Cho phép đính kèm tệp tin vào báo cáo  ![](data:image/png;base64...)   * Cách thức upload:   + Kéo thả từ máy tính vào vùng chỉ định   + Nhấn “Add Attachment” để mở hộp thoại chọn tệp từ máy tính. * Tối đa upload cùng 1 lúc: 10 tệp * Kích thước tối đa mỗi tệp: 5MB * Xử lý lỗi:   + Thông báo lỗi nếu định dạng tệp không hợp lệ: *“Unsupported file type. Please upload .xlsx, .docx, .pdf, .jpg, .jpeg, .png, .gif, .mp4* *files.”*   + Thông báo lỗi nếu tệp vượt quá giới hạn kích thước *“The file is too large. Please upload a file smaller than 5MB.”*   + Thông báo lỗi nếu tổng số file vượt quá cho phép: *“Too many files uploaded. Please remove some files before adding more.”*   + Thông báo lỗi nếu số lượng file vượt quá 10 tệp: *“Please upload no more than 10 files at a time.”*   + Thông báo lỗi nếu lỗi xảy ra: *“File upload failed. Please try again later.”* |
|  | **Kịch bản Title của hệ thống:**  **![](data:image/png;base64...)** => **Logo hệ thống** => Click: **Điều hướng trang HOME** của TOSS  ![](data:image/png;base64...)  ![](data:image/png;base64...)   * Màn Home của hệ thống TOSS bao gồm 4 phân hệ: System Admin (mô tả tại B8)   + System Admin   + Data Maintenance   + Data Source Monitoring   + TOSS (để trống)   Icon System Admin ![](data:image/png;base64...)=> **System Admin:**   * + Hiển thị khi người dùng được phân quyền   + Click vào => Hiển thị hệ thống System Admin, đồng thời menu dọc mở ra hiển thị đầy đủ list menu (user có thể thu mở menu), hiển thị màn hình chờ (không focus vào phân hệ nào).   Icon Data Maintenance ![](data:image/png;base64...) => **Data Maintenance:**   * + Hiển thị khi người dùng được phân quyền   + Click vào => Hiển thị hệ thống Data Maintenance, đồng thời menu dọc mở ra hiển thị đầy đủ list menu, (user có thể thu mở menu) , default focus phân hệ **đầu tiên trong list menu** khi User truy cập hệ thống Data Maintenance   + Trường hợp User không được phân quyền => ẩn icon Data Maintenance ở màn Home   Icon Data Source Monitoring ![](data:image/png;base64...) => **Data Source Monitoring:**   * + Hiển thị khi người dùng được phân quyền   + Click vào => Hiển thị hệ thống Data Source Monitoring, đồng thời menu dọc mở ra hiển thị đầy đủ list menu (user có thể thu mở menu) , default focus phân hệ **đầu tiên trong list menu** khi User truy cập hệ thống Data Source Monitoring   + Trường hợp User không được phân quyền => ẩn icon Data Source Monitoring ở màn Home   Icon TOSS ![](data:image/png;base64...) => **TOSS:**   * + Hiển thị khi người dùng được phân quyền   + Click vào => Hiển thị hệ thống TOSS, đồng thời menu dọc mở ra hiển thị đầy đủ list menu (user có thể thu mở menu) , default focus phân hệ **đầu tiên trong list menu** khi User truy cập hệ thống TOSS   + Trường hợp User không được phân quyền => ẩn icon TOSS ở màn Home   ![](data:image/png;base64...) => **Chuông thông báo**: Click => Mở màn hình Thông báo hệ thống (Kịch bản màn hình tham chiếu tài liệu **SRS\_Notification**)  ![](data:image/png;base64...)=> **Thông tin User đăng nhập**   * ![](data:image/png;base64...)Avatar User đăng nhập * Di chuột hiển thị tooltip [Xem thông tin cá nhân của người dùng](https://docs.google.com/document/d/1pDG8yL_7-iD9dH030r843FdHB-kTjl9E/edit#heading=h.gn8dm6y6i6a1) |
|  | * Quy tắc hiển thị nội dung trong bảng**:**  | **Loại dữ liệu** | **Quy tắc hiển thị** | | --- | --- | | Văn bản (Tên, Mô tả, Trạng thái, Ghi chú,...) | Căn trái (Left Align) | | Số (Số lượng, Giá trị, %,...) | Căn phải (Right Align) để thuận tiện cho việc so sánh và đối chiếu dữ liệu | | Ngày/Ngày giờ | Căn trái (Left Align) | | Icon, Checkbox, ID | Căn giữa (Center Align) | | Action (View, Download, Edit, Delete) | Căn trái (Left Align) | |

## **Lịch sử**

* **Ý nghĩa:** Cho phép người dùng xem các thay đổi đã xảy ra trên một bản ghi theo thời gian.
* **Kịch bản ghi nhận log:**
  + Hiển thị danh sách dữ liệu dạng cột:
    - No: STT tăng dần, khởi đầu từ 1
    - Time: Thời gian ghi nhận nghiệp vụ ở log. Hiển thị dạng dd/mm/yyyy hh:mm, các bản ghi được sắp xếp theo thời gian này - mới nhất xếp trước
    - User: dữ liệu lấy trường fullname của tài khoản thao tác
    - Module Function: dữ liệu trong cột hiển thị nghiệp vụ phát sinh log
    - Action: Hiển thị thông tin cụ thể nghiệp vụ phát sinh log ghi nhận tại chức năng nào
    - Details: Hiển thị mô tả nghiệp vụ phát sinh log
  + Nội dung hiển thị ghi log:
    - ActionType:Update/Add/Delete
    - Item Title: [name of items]
    - Changes Made:
      * Title: “~~Old Title~~” → “New Title” (TH edit, update)
      * Title: “Add new title” (TH thêm mới)
      * Title “Delete Title” (TH xóa)

## **Thông báo/Cảnh báo**

| Tên chức năng: Thông báo/cảnh báo | |
| --- | --- |
| Mục đích | Cảnh báo/thông báo khi người dùng thực hiện hành động trên web |
| Trigger | Truy cập hệ thống → Thực hiện các hành động trên web |
| Tiền điều kiện | Người dùng truy cập web ⇒ Nhấn nút đăng nhập.  Người dùng thực hiện các hành động kích hoạt cảnh báo/thông báo |
| Hậu điều kiện | Hiển thị các cảnh báo/thông báo tương ứng |

####

### **Luồng nghiệp vụ**

N/A

### **Mô tả luồng nghiệp vụ**

N/A

### **Màn hình chức năng**

![](data:image/png;base64...)

Giao diện Inline message

![](data:image/png;base64...)

Giao diện Confirmation Message

![](data:image/png;base64...)

Giao diện Error Message

![](data:image/png;base64...)

Giao diện Error Message và Informing Message

### **Mô tả màn hình**

| **STT** | **Mã cảnh báo/thông báo** | **Loại** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
|  | VL | Lỗi tại field (Inline Message) | field\_validation\_error | Lỗi tại field (In-line Error Message)  ![](data:image/png;base64...)   * Hiển thị chữ đỏ và viền đỏ tại field lỗi( red border). * Hiển thị ngay dưới field lỗi * Thông điệp hiển thị khi có lỗi trong xác thực dữ liệu( validation). * Thông báo biến mất ngay khi người dùng nhập lại đúng.  | **Mã** | **Nội dung cảnh báo** | | --- | --- | | **VL001** | The old password is incorrect. Please enter it again. | | **VL002** | The password is invalid. Please check again. | | **VL003** | The re-entered password does not match. | | **VL004** | The **<field name>** field must not be empty. | | **VL005** | Must not exceed **<maxlength>** characters. | | **VL006** | **<Field name>** is in an invalid format. | | **VL007** | **<Field name>** already exists. Please check again. | | **VL008** | The password must be at least 8 characters long. | | **VL009** | The year of birth must not be greater than **[Current year – 17 years]**. | |
|  | EM | Thông điệp lỗi( Error Message) | error\_popup | Thông điệp lỗi( Error Message)  ![](data:image/png;base64...)   * Popup chỉ chứa nội dung lỗi màu đỏ và nút “Đóng” * Khi click ngoài popup không đóng popup, chỉ khi click vào nút “Đóng” popup mới đóng * Sau khi đóng popup, quay trở lại màn hình hiện tại * Thông điệp được hiển thị khi có lỗi trong quá trình xác thực, lỗi hệ thống, lỗi quyền hạn * Vị trí: Hiện trung tâm màn hình   + Width: 400px   + Height: 24px |
|  | CM | Thông điệp xác nhận (Confirmation Message) | confirmation\_popup | Thông điệp xác nhận (Confirmation Message)  ![](data:image/png;base64...)   * Popup chỉ chứa nội dung và 2 nút “Đồng ý”,”Hủy” * Click ngoài popup không đóng popup. Popup chỉ đóng khi click vào nút trên popup * Sau khi đóng popup, thực hiện hành động tương ứng với nút đã chọn * Thông điệp được hiển thị khi hành động cần xác nhận * Vị trí: Hiện trung tâm màn hình   + Width: 400px   + Height: 24px |
|  | TB | Thông điệp thông báo (Informing Message) | info\_popup | Thông điệp thông báo (Informing Message)  ![](data:image/png;base64...)   1. Popup chỉ chứa nội dung chữ màu xanh/đỏ và biến mất sau 5s 2. Thông điệp chỉ xuất hiện sau khi hệ thống thực hiện thành công chính xác/thất bại 1 chức năng/hành động. 3. Vị trí cách lề    1. Right: 20px    2. Bot: 20px 4. Chiều rộng: 400px 5. TH nhiều thông báo ⇒ Thông báo mới nhất sẽ hiện lên trên thông báo cũ, cách nhau 20px  | **Mã** | **Nội dung cảnh báo** | | --- | --- | | **TB001** | Login successful. | | **TB002** | Incorrect username or password. | | **TB003** | Account does not exist. | | **TB004** | Exported .xlsx file successfully. | | **TB005** | Unable to retrieve data for export. Please try again. | | **TB006** | Unstable connection. Failed to download file. | | **TB007** | Template file downloaded successfully. | | **TB008** | Session expired. Please log in again. | | **TB009** | Logout successful. | | **TB010** | Session expired or token is invalid. | | **TB011** | System error. Please try again. | | **TB012** | Password must be between 8 and 100 characters long and contain at least one letter, one number, and one special character (@$!%\*#?&) | | **TB013** | Please select a file to upload. | | **TB014** | File is too large. Maximum limit is <max\_size>. | | **TB015** | Invalid upload file format. Only .xlsx is supported. Please check again. | | **TB016** | Data imported successfully. | | **TB017** | Import completed with some failed rows. | | **TB018** | Invalid data in file. Import failed. | | **TB019** | <Action> <Object> successful  You have successfully <action> <object> <value> | | **TB020** | <Action> <Object> failed  <Error details from API response> | | **TB021** | <Action> <Object> failed  An error occurred during data processing. Please try again later! | | **TB022** | <Action> <Object> failed  <Object> [code+name] already has an update history in the system. You cannot <action> this <object>. | | **TB023** | Reason cannot be blank. Please check again. | | **TB024** | [Action] failed  A default [Object] already exists. Please check again. | |

## **Export**

| Tên chức năng: Export | |
| --- | --- |
| Mục đích | Người dùng xuất dữ liệu từ hệ thống ra định dạng tệp như Excel (.xlsx), PDF nhằm phục vụ báo cáo, lưu trữ hoặc chia sẻ. |
| Trigger | Người dùng nhấn nút “Xuất file” (Export) trong giao diện hệ thống. |
| Tiền điều kiện | Đăng nhập thành công vào hệ thống  Người dùng được phân quyền Export excel, Export PDF |
| Hậu điều kiện | Một tệp (Excel, PDF) được tạo thành công và cung cấp cho người dùng để tải về. Lưu log trong hệ thống. |

####

### **Luồng nghiệp vụ**

![](data:image/png;base64...)

1. Sơ đồ luồng export

### **Mô tả luồng nghiệp vụ**

| **STT** | **Bước** | **Mô tả** |
| --- | --- | --- |
|  | Bước 1 | Người dùng có thể lọc  Click vào nút Export Excel hoặc Export PDF |
|  | Bước 2 | Hệ thống gọi API đến backend để trích xuất dữ liệu |
|  | Bước 3 | Trả về file và tự động tải xuống |

### **Màn hình chức năng**

![](data:image/png;base64...)

*Giao diện nút export*

### **Mô tả màn hình**

###

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
|  | Export Excel | Button | btn\_export\_excel | * Tên button: Export Excel * Vị trí button: Góc trên phải bảng dữ liệu, trên màn hình danh sách * Chức năng khi click: Gửi yêu cầu export và tải file xlsx về * Trạng thái button: * Enabled nếu có dữ liệu * Disabled nếu không có dữ liệu * Có loading khi đang xử lý * Thông báo lỗi/thành công:   + Thành công, hiển thị thông báo [TB004](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.og0qzr36ep37)   + Timeout/mất kết nối CSDL, hiển thị thông báo [TB005](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.6i14i6qmgfmw) * Tên tải xuống [module\_ddMMyyhhmm.xlsx] (Trong đó ddMMyyyyhhmm là ngày giờ tải file) * Tải xuống theo template |
|  | Export pdf | Button | btn\_export\_pdf | * Tên button hiển thị (label): Export PDF * Vị trí button: Góc trên phải bảng dữ liệu, trên màn hình danh sách * Chức năng khi click: Gửi yêu cầu export và tải file PDF về * Trạng thái button: luôn enabled   + TH k có dữ liệu vẫn cho export => file excel sẽ không có dữ liệu * ~~Enabled nếu có dữ liệu~~ * ~~Disabled nếu không có dữ liệu~~ * Có loading khi đang xử lý * Thông báo lỗi/thành công:   + Thành công, hiển thị thông báo [TB004](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.og0qzr36ep37)   + Timeout/mất kết nối CSDL, hiển thị thông báo [TB005](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.6i14i6qmgfmw) * Tên tải xuống [module\_ddMMyyyyhhmm.pdf] (Trong đó ddMMyyyyhhmm là ngày giờ tải file) * Tải xuống theo template |

## **Import**

| Tên chức năng: Import | |
| --- | --- |
| Mục đích | Cho phép người dùng nhập dữ liệu vào hệ thống thông qua tệp định dạng chuẩn .xlsx để cập nhật, bổ sung dữ liệu hàng loạt. |
| Trigger | Người dùng nhấn nút “Import” trong giao diện hệ thống. |
| Tiền điều kiện | Người dùng đã đăng nhập hệ thống. Có quyền sử dụng chức năng Import tại module tương ứng. |
| Hậu điều kiện | Dữ liệu hợp lệ trong file được lưu vào hệ thống. Lưu log trong hệ thống. |

### **Luồng nghiệp vụ**

![](data:image/png;base64...)

*Sơ đồ luồng import*

### **Mô tả luồng nghiệp vụ**

| **STT** | **Bước** | **Mô tả** |
| --- | --- | --- |
|  | Bước 1 | Người dùng click vào nút “Download template file” để nhận được file mẫu chuẩn. |
|  | Bước 2 | Hệ thống gọi API đến backend để lấy file mẫu (template định dạng sẵn theo cấu trúc hệ thống yêu cầu). |
|  | Bước 3 | File mẫu được tự động tải xuống. |
|  | Bước 4,5 | Người dùng điền dữ liệu vào file vừa tải, sau đó lưu lại.  Nhấn Drag and drop hoặc chọn Choose file để tải file |
|  | Bước 6 | Hệ thống đọc dữ liệu lên model, kiểm tra ràng buộc dữ liệu.   * Nếu lỗi → chuyển đến Bước 6 * Nếu không lỗi → chuyển đến Bước 7 |
|  | Bước 7 | Hệ thống không rollback, chỉ log lỗi. Hiển thị thông báo lỗi cho người dùng. |
|  | Bước 8 | Hệ thống tiến hành ghi dữ liệu vào cơ sở dữ liệu, sau đó hiển thị danh sách các bản ghi đã import thành công. |

### **Màn hình chức năng**

###

![](data:image/png;base64...)

*Giao diện nút import*

### **Mô tả màn hình**

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
|  | Choose file ![](data:image/png;base64...) | Button [0;5MB] | btn\_import\_choose\_file | * Tên nút: Choose file * Vị trí: Nằm ở giữa popup * Trạng thái mặc định: Luôn bật (enabled) * Khi nhấn nút: giao diện mở hộp thoại file picker. Chỉ cho phép chọn các file định dạng được hỗ trợ * File tải lên tối đa 5MB * Chỉ được tải lên 1 file trong 1 lần tải, hỗ trợ định dạng .xls, .xlsx * Trường hợp lỗi và thông báo hiển thị:   + Nếu chưa chọn file tải lên, thông báo [TB013](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.vna5y6tbq0zb)   + File lớn hơn giới hạn, hiển thị toast message [TB014](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.6szt7q8qjhsz)   + Nếu file tải lên không đúng định dạng .xlsx, hiển thị toast message [TB015](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.86grxwfg9njj)   + Nếu định dạng đã đúng theo biểu mẫu thì hệ thống sẽ tiếp tục validate toàn bộ dữ liệu trong file import có thỏa mãn các điều kiện sau:     - Không để trống các cột bắt buộc     - Không trùng mã     - Định dạng ngày tháng đúng     - Định dạng email/số điện thoại hợp lệ     - Giá trị trong danh mục hợp lệ   + BE trả về response     - Import thành công toàn bộ: {   "status": "success",  "data.message": "Import dữ liệu thành công.",  "data.imported\_count": [số lượng dòng đã import thành công]  }   * + - Import thành công một phần: {   "status": "partial",  "data.message": "Import hoàn tất với một số dòng lỗi.",  "data.imported\_count": [số lượng dòng đã import thành công],  "data.error\_count": [số lượng dòng bị lỗi],  "data.errors": [  {  "row": "[số dòng lỗi trong file]",  "column": "[tên cột lỗi]",  "message": "[nội dung lỗi]"  }  Import thất bại toàn bộ: {  "status": "fail",  "data.message": "Dữ liệu trong file không hợp lệ.",  "data.imported\_count": 0,  "data.errors": [  {  "row": "[số dòng lỗi]",  "column": "[tên cột lỗi]",  "message": "[nội dung lỗi]"  }   * + FE xử lý response     - Import thành công toàn bộ:   Hiển thị toast message [TB016](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.rmd1idswiear) (nội dung lấy từ data.message)  Giao diện import đóng (nếu có popup)  Reload lại danh sách dữ liệu nếu có   * + - Import thành công một phần:   Hiển thị toast message: [TB017](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.qkmegfo2xw2d) (từ data.message)  Giao diện hiển thị:   * + - * Tổng số dòng đã import thành công: lấy từ data.imported\_count       * Tổng số dòng bị lỗi: lấy từ data.error\_count   Chỉ ghi dữ liệu đã import thành công, không lưu dữ liệu bị lỗi.   * + - Import thất bại toàn bộ:   Hiển thị toast lỗi: [TB018](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.o4xi9sf7c4ep) (từ data.message)  Giao diện hiển thị: danh sách trắng, không có dòng nào được ghi |
|  | Download template file | Button link | btn\_import\_download\_template | * Tên nút: Download template file * Vị trí: Nằm ở khu vực hướng dẫn * Trạng thái mặc định: Luôn bật (enabled) * File tải về có tên: template\_import\_[module].xlsx * Trường hợp lỗi và thông báo hiển thị: ”   + Mạng lỗi, hiển thị thông báo [TB006](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.ezrmpmpidug)   + Tải file thành công, hiển thị thông báo [TB007](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.cnobkg94hlw5) |
| **Action**   * Cho phép user kéo thả file vào vùng import   ![](data:image/png;base64...)   * Sau khi file được chọn tải lên/kéo thả vào vùng import => hệ thống thực hiện tiến trình tải dữ liệu file lên hệ thống,   ![](data:image/png;base64...)  đồng thời check valid các trường trong file, nếu:   * + Valid file tải lên thành công: hiển thị màn hình   ![](data:image/png;base64...)   * + - Click **Cancel**: Đóng popup và không cần xử lý gì     - Click **Continue**: hệ thống thực hiện tiến trình update thông tin cho danh mục theo thông tin trên file   ![](data:image/png;base64...)  Nếu:   * + - * update thành công (xử lý update thông tin các bản ghi và người dùng tương ứng theo KB sửa): hiện toast báo thành công [TB019](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.jsiuauzgpaj1)       * ngược lại: hiện toast lỗi [TB020](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.89c7c2lipqad)   Hoặc [TB021](https://docs.google.com/document/d/14u5WJYigaomf4MupIIDxPeayYOf3_zq-/edit#bookmark=id.97ib6b4szg04)   * + Ngược lại: hiện thống báo lỗi   ![](data:image/png;base64...)  Trong đó:   * + - Số bản ghi thành công: = [SL bản ghi thỏa màn valid]/Tổng số bản ghi tải lên     - Số bản ghi thất bại: = [SL bản ghi **không** thỏa màn valid]/Tổng số bản ghi tải lên     - File result: ![](data:image/png;base64...) => click vào > thực hiện tải file kết quả về thiết bị theo mẫu template\_import\_[module].xlsx | | | | |

## **Kịch bản phân trang & load more**

### **Phân Trang**

* **Mục đích:** phân trang là việc chia danh sách dữ liệu thành nhiều trang nhỏ, nhằm giới hạn số lượng bản ghi hiển thị tại một thời điểm.
* **Giao diện:**

![](data:image/png;base64...)

![](data:image/png;base64...)

* + Hiển thị: “Tất cả danh sách: X” mà ở đó X là tổng số bản ghi
  + Hiển thị số lượng bản ghi mỗi trang:
  + Mặc định tối đa 10 bản ghi trên một trang
  + Tùy chọn số lượng bản ghi qua dropdownlist: 10, 25, 50, 100.
  + Nút điều hướng:
    - ![](data:image/png;base64...): Di chuyển đến trang đầu
    - ![](data:image/png;base64...): Di chuyển đến trang trước
    - ![](data:image/png;base64...): Hiển thị số trang hiện tại của bảng dữ liệu
    - ![](data:image/png;base64...): Di chuyển trực tiếp đến trang mong muốn
  + Khi tổng số trang nhỏ hơn hoặc bằng 5, hiển thị đầy đủ số
  + Khi tổng số trang lớn hơn 5:
  + Hiển thị số trang hiện tại, một số trang xung quanh
  + Sử dụng “...” để biểu thị các trang bị ẩn ở giữa
  + ![](data:image/png;base64...): Di chuyển đến trang sau
  + ![](data:image/png;base64...): Di chuyển đến trang cuối
  + => Khi tương tác lên điều hướng, cập nhật danh sách tương ứng với trang chọn
* **Kịch bản phân trang:**
  + Khi người dùng thực hiện 1 tìm kiếm mới( bao gồm thực hiện mới hoàn toàn hoặc sửa đổi tìm kiếm đang có), reload dữ liệu bảng, quay về trang 1
  + Khi người dùng thay đổi thiết lập phân trang( số lượng bản ghi/trang), reload dữ liệu bảng và quay về trang 1
  + Khi người dùng đang ở trang 1, thì nút “<<” và “<” không thể click
  + Khi người dùng đang ở trang cuối. thì nút “>>” và “>” không thể click
  + Nếu không thì các nút đều có thể click được
  + Nút “>” và”<” tăng hoặc giảm số trang 1 đơn vị
  + Nút “>>” và “”<<” di chuyển tới trang cuối hoặc trang 1
  + Nếu chỉ có 1 trang, vẫn hiển thị phân trang với 1 trang
  + Số bản ghi/trang có thể lựa chọn gồm: 10, 25, 50
  + Số lượng bản ghi/trang mặc định = 10
  + Khi truyền tham số page nhận giá trị 0 và giá trị âm, hệ thống sẽ mặc định xử lý với page=1 và trả về kết quả phân trang của trang đầu tiên.

### **Load more**

* **Mục đích:** Load More cho phép hiển thị một phần dữ liệu ban đầu thay vì tải toàn bộ cùng lúc. Khi người dùng xem hết phần dữ liệu hiện có và muốn xem thêm, họ có thể bấm “Xem thêm” để tải tiếp dữ liệu mới mà không làm mất dữ liệu đã hiển thị trước đó.
* **Kịch bản load more:**
  + Mặc định, hệ thống hiển thị trước X bản ghi đầu tiên (ví dụ: 50).
  + Khi người dùng cuộn đến cuối danh sách:
    - Nếu số bản ghi đang hiển thị ít hơn tổng số bản ghi , hiển thị nút “Xem thêm”.
    - Khi người dùng nhấn “Xem thêm”, hệ thống sẽ getlist thêm X bản ghi tiếp theo (kể từ bản ghi cuối đang hiển thị).
    - Các bản ghi đã hiển thị trước đó vẫn được giữ nguyên, không bị làm mới.
  + Khi toàn bộ dữ liệu đã được hiển thị hết => Không hiển thị “Xem thêm”
  + Nếu người dùng làm mới trang (refresh), danh sách sẽ được tải lại từ đầu và cập nhật với dữ liệu mới nhất.

## **Kịch bản phân trang & load more**

* **Mục đích:** Để giảm tải cho server và tăng tốc độ hiển thị dữ liệu, hệ thống sẽ sử dụng cache (SessionStorage) để lấy các giá trị (Value) đã được lưu ở trước đó, thay vì gọi API mỗi lần.
* **Kịch bản lưu vết - Cache:**
  + Khi người dùng truy cập vào một **Page, Tab** hoặc mở một **Form** có các Control (như dropdown, input, checkbox,…) cần lấy value trước đó thì hệ thống sẽ kiểm tra:
    - Nếu trong cache chưa tồn tại giá trị value nào ⇒ Hệ thống sẽ call API lên server lấy dữ liệu fill lên giao diện (theo key- value)
    - Nếu trong cache đã tồn tại value (Tìm kiếm theo key trong key-value) ⇒ Hệ thống lấy value mới nhất từ cache hiển thị lên giao diện
  + Khi người dùng thay đổi value thì sẽ update value vào trong cache đồng thời call API lên server để hiển thị dữ liệu trên giao diện

## **Kịch bản Chức năng tìm kiếm**

1. **Mục đích:** Chức năng Tìm kiếm (Search) giúp người dùng nhanh chóng và thuận tiện tra cứu nội dung hoặc sản phẩm họ quan tâm trên website thay vì phải duyệt thủ công qua nhiều danh mục hay trang thông tin
2. **Kịch bản chức năng tìm kiếm:**

Cho phép người dùng tìm kiếm tương đối các trường thông tin mà người dùng muốn tìm kiếm tại màn hình chức năng

Placeholder “Tên trường thông tin”

Mặc định bỏ trống các ô box search khi vào mới vào màn hình chức năng. Khi người dùng thoát khỏi màn hình thì lưu vết theo [Kịch bản lưu vết - Cache](https://docs.google.com/document/d/1elHiW76Y2pH-pXvAGPd2cyb0eMShokxq/edit#heading=h.wcvynlyon6bq)

Tự động TRIM Spaces đầu cuối khi out focus box

Cho phép nhập chuỗi dài **X** ký tự.

Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” , nội dung sẽ cuộn ngang sang trái và khuất khỏi tầm nhìn. User có thể di chuột để xem lại nội dung trước đó

Nếu paste đoạn văn > **X** kí tự thì ghi nhận **X** ký tự đầu, <**X** kí tự thì ghi nhận all

Người dùng nhấn "Enter" hoặc button Search sau khi điền hoặc chọn thông tin để thực hiện tìm kiếm ⇒ Hệ thống sẽ call API trả ra danh sách phù hợp với điều kiện tìm kiếm

Nếu có kết quả khớp với tiêu chí tìm kiếm, hệ thống hiển thị kết quả trong bảng danh sách

Nếu không có kết quả nào khớp, hệ thống hiển thị thông báo trong bảng danh sách: "Không có kết quả nào liên quan"

Nếu để trống trường search thì được hiểu là hiển thị tất cả ‘

## **Kịch bản Chức năng ẩn/hiện fillter**

![](data:image/png;base64...)

* Cơ chế Thu gọn/Mở rộng bộ lọc (Collapsible Fillter):
  + **Mặc định khi vào trang:** Bộ lọc luôn **Mở rộng (Expanded)** để hiện đủ 8 trường tìm kiếm.
  + **Thao tác Thu / Mở:**
    - * Bấm icon ![](data:image/png;base64...) => Thu gọn bộ lọc (chỉ còn thanh Header Bộ lọc tìm kiếm ▼), tự động kéo bảng danh sách tàu bay phía dưới rộng lên trên.
      * Bấm icon ![](data:image/png;base64...) => Thả cụm bộ lọc xuống lại bình thường.
  + **Bảo lưu kết quả (State Persistence):** Đóng/thu gọn bộ lọc **KHÔNG** làm mất kết quả đang lọc ở bảng bên dưới.
* Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó
* Người dùng thao tác thay đổi giá trị trường dữ liệu => click Enter/button Search => hệ thống thực hiện:
  + Reload dữ liệu table phù hợp với bộ lọc
  + Set current page=1
* Hiển thị kết quả tìm kiếm:
  + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về.
  + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0**.