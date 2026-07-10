---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Dispatch"
feature_id: "TOSS.FD.UPLOAD_COMMON_DOC"
feature_name: "Upload tài liệu chung chuyến bay"
group: "Upload Document"
---

## Upload tài liệu chung chuyến bay

| **Tên chức năng: Upload tài liệu chung chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Upload tài liệu chung chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => mở đến module Flight Dispatch -> chọn Upload Document |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền vào Upload Document |
| **Hậu điều kiện** | Upload tài liệu chung thành công |

###

### Sơ đồ nghiệp vụ

![](data:image/png;base64...)

### Mô tả luồng nghiệp vụ

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | Người dùng truy cập Upload Document và chọn tab Tài liệu chung. |
| 2 | Hệ thống gọi API lấy danh sách tài liệu chung theo điều kiện mặc định. |
| 3 | Hệ thống hiển thị danh sách tài liệu chung cùng các bộ lọc tìm kiếm trên màn hình. |
| 4 | Người dùng nhấn nút **Upload tài liệu chung** để thực hiện upload tài liệu mới. |
| 5 | Hệ thống hiển thị popup **Upload tài liệu**, cho phép người dùng lựa chọn loại tài liệu và tệp cần upload. |
| 6 | Người dùng chọn **loại tài liệu**, chọn **tệp** và nhấn **Save** để thực hiện upload. |
| 7 | Hệ thống kiểm tra tính hợp lệ của dữ liệu upload, định dạng tệp, dung lượng tệp.   * Chỉ cho phép upload các tệp có định dạng .pdf và .txt. Nếu định dạng tệp không đúng sẽ thông báo lỗi: “**The file format does not conform to the rules. Please try again.**” * Dung lượng tối đa của mỗi tệp là 30MB. Nếu dung lượng vượt quá sẽ có thông báo: “**The file you Upload exceeds the 30MB size limit.**” * Quy tắc đặt tên : Name\_Rev.pdf. Ví dụ: OFP\_R01.pdf Nếu tên tệp không đúng quy tắc, hệ thống hiển thị thông báo lỗi: “**Invalid file name. Please follow the naming convention.**” và không cho phép upload. * Nếu tệp upload trùng tên với tệp đã có trong danh sách, hệ thống kiểm tra phiên bản tài liệu. Trường hợp phiên bản của tệp upload nhỏ hơn hoặc bằng phiên bản hiện có, hệ thống chặn upload và hiển thị thông báo: **"The uploaded file version must be greater than the existing file version."** |
| 8 | Trường hợp tệp không hợp lệ, hệ thống không thực hiện upload và hiển thị **toast message** thông báo lỗi: “**Unable to upload the shared document. Please try again.**.” để người dùng kiểm tra và thực hiện lại. |
| 9 | Trường hợp dữ liệu hợp lệ, hệ thống tự động upload tài liệu và lưu thông tin tài liệu vào cơ sở dữ liệu, cập nhật danh sách tài liệu của chuyến bay và hiển thị **toast message** thông báo **"The shared document has been uploaded successfully."**. |

### Màn hình chức năng

![](data:image/png;base64...)![](data:image/png;base64...)

![](data:image/png;base64...)![](data:image/png;base64...)

### Mô tả màn hình chức năng

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| * Người dùng thực hiện upload tài liệu chung để áp dụng cho nhiều chuyến bay trong một khoảng thời gian hiệu lực. * Người dùng lựa chọn Khoảng ngày hiệu lực của tài liệu , Phiên bản và tệp cần upload. * Hệ thống chỉ cho phép upload tệp có định dạng .pdf và .txt, dung lượng tối đa 30MB. * Sau khi người dùng chọn tệp hợp lệ và nhấn Xác nhận Upload, hệ thống kiểm tra tính hợp lệ của dữ liệu (định dạng tệp, dung lượng tệp). * Trường hợp dữ liệu hợp lệ, hệ thống upload tài liệu, lưu thông tin vào hệ thống và áp dụng tài liệu cho tất cả các chuyến bay có ETD nằm trong khoảng thời gian hiệu lực đã khai báo. * Sau khi upload thành công:   + Hệ thống hiển thị thông báo thành công và tải lại [danh sách tài liệu chung chuyến bay](TOSS.FD.COMMON_DOCS_LIST.FD.v0.1.md) để hiển thị dữ liệu mới nhất.   + Hệ thống lưu thông tin tệp và hiển thị tên tệp upload tại cột Document Name trong danh sách tài liệu * Trường hợp dữ liệu không hợp lệ, hệ thống hiển thị thông báo lỗi tương ứng và không thực hiện upload. | | | | |
| 1 | Valid From | Datetime picker |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “DD/MM/YYYY HH:MM” * Bắt buộc chọn. * Cho phép người dùng chọn thời điểm bắt đầu hiệu lực của tài liệu. * Định dạng hiển thị: dd/MM/yyyy HH:mm. * Người dùng có thể nhập trực tiếp hoặc chọn từ DateTime Picker. * Giá trị Valid From không được lớn hơn Valid To. . * Action: Out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: “The **<field name>** field must not be empty.” |
| 2 | Valid To | Datetime picker |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “DD/MM/YYYY HH:MM ” * Bắt buộc nhập. * Cho phép người dùng chọn thời điểm kết thúc hiệu lực của tài liệu. * Định dạng hiển thị: dd/MM/yyyy HH:mm. * Người dùng có thể nhập trực tiếp hoặc chọn từ DateTime Picker. * Giá trị Valid To không được nhỏ hơn Valid From. * Tài liệu sau khi upload sẽ được áp dụng cho tất cả các chuyến bay có ETD nằm trong khoảng thời gian từ Valid From đến Valid To (bao gồm cả hai mốc thời gian). * Action: Out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: “The **<field name>** field must not be empty.” |
| 3 | Revision | Textview |  | * Mặc định: Để [—] khi chưa chọn tệp * Hiển thị phiên bản (Revision) của tài liệu khi đã chọn tệp. * Trường không cho phép người dùng nhập hoặc chỉnh sửa. * Sau khi người dùng chọn tệp, hệ thống kiểm tra tên tệp theo **Quy tắc đặt tên** và tự động trích xuất giá trị **Revision (Rev)** từ tên tệp để hiển thị tại trường này. * Nếu tên tệp không đúng quy tắc hệ thống thông báo lỗi: “**Invalid file name. Please follow the naming convention.”** * Nếu không trích xuất được Revision, hệ thống hiển thị thông báo lỗi: “**The file name does not contain a version. Please rename the file and try again.**” và không cho phép lưu tài liệu. |
| 4 | Choose File | Button |  | * Khi người dùng nhấn Choose file, hệ thống mở hộp thoại để người dùng chọn tệp từ máy tính. * Cho phép người dùng kéo thả (Drag & Drop) hoặc nhấn Choose file để chọn tệp từ máy tính. * Chỉ cho phép upload 1 tài liệu 1 lần. * Sau khi người dùng chọn tệp thành công, hệ thống hiển thị tên tệp đã chọn. Khi chưa chọn tệp, hệ thống hiển thị thông báo "No file has been selected.". * Chỉ cho phép upload các tệp có định dạng .pdf và .txt. Nếu định dạng tệp không đúng sẽ thông báo lỗi: “**The file format does not conform to the rules. Please try again.**” * Dung lượng tối đa của mỗi tệp là 30MB. Nếu dung lượng vượt quá sẽ có thông báo: “**The file you added exceeds the 30MB size limit.**” * Quy tắc đặt tên tệp được thực hiện theo quy định. Nếu tên tệp không đúng quy tắc, hệ thống hiển thị thông báo lỗi: “**Invalid file name. Please follow the naming convention.**” và không cho phép upload. * Nếu tệp upload trùng tên với tệp đã có trong danh sách, hệ thống kiểm tra phiên bản tài liệu. Trường hợp phiên bản của tệp upload nhỏ hơn hoặc bằng phiên bản hiện có, hệ thống chặn upload và hiển thị thông báo: **"The uploaded file version must be greater than the existing file version."** * Nếu tên tệp hợp lệ, hệ thống tiếp tục kiểm tra các điều kiện khác (định dạng, dung lượng...) và hệ thống upload tài liệu:   + Trong quá trình upload, hệ thống hiển thị tên tệp, thanh tiến trình (Progress Bar) và tỷ lệ hoàn thành (%) để người dùng theo dõi trạng thái upload.   + Sau khi chọn file tải lên thành công, hệ thống hiển thị trạng thái thành công: “ File uploaded successfully .”. Người dùng có thể nhấn biểu tượng **Delete** để hủy tệp đã chọn và chọn tệp khác trước khi thực hiện upload   + Trường hợp chọn file tải lên thất bại, hệ thống hiển thị thông báo lỗi: “**File uploaded unsuccessfully** ” và cho phép người dùng có thể nhấn biểu tượng **Delete** để hủy tệp đã chọn và chọn tệp khác trước khi thực hiện upload. * Quy tắc đặt tên : Name\_Rev. Ví dụ: OFP\_R01.pdf |
| 5 | Save | Button |  | * Khi người dùng nhấn Save, hệ thống thực hiện kiểm tra dữ liệu nhập. * Nếu dữ liệu hợp lệ, hệ thống upload tài liệu, lưu thông tin vào hệ thống và hiển thị thông báo "Document has been uploaded successfully.". * Nếu dữ liệu không hợp lệ, hệ thống hiển thị thông báo lỗi “File Upload unsuccessful.” và không thực hiện upload. |
| 6 | Cancel | Button |  | * Khi người dùng nhấn Cancel, hệ thống đóng popup và không lưu dữ liệu upload. Quay lại màn hình danh sách tài liệu chung |
| 7 | ![](data:image/png;base64...) | Button |  | * Hiển thị biểu tượng Close (X) tại góc trên bên phải của popup Upload tài liệu chung. * Khi người dùng nhấn nút Close, hệ thống đóng popup và quay về màn hình Danh sách tài liệu. * Trường hợp đang có dữ liệu chưa được upload, hệ thống hủy thao tác upload và không lưu dữ liệu. |

---

> **Nguồn gốc (truy vết):** Tách trung thực từ `sec-10-upload-tai-lieu-chung-chuyen-bay.md` — mảnh phân rã `TOSS.FD.ALL.FD.v0.1.md` (SRS Flight Dispatch v0.1, người soạn VNA/VTIT, nguồn Google Drive live pull 2026-07-10) — ứng với dòng **#7** bảng §1 trong [CATALOG.md](CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0). Lưu ý cờ đã ghi tại CATALOG.md §2.10: cột Bước ghi số thuần 1-9 (khác định dạng "Bước N" của F01/F03/F04/F05/F08).
