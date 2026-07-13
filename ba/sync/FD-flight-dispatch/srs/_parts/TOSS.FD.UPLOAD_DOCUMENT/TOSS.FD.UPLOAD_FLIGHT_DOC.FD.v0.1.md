---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Dispatch"
feature_id: "TOSS.FD.UPLOAD_FLIGHT_DOC"
feature_name: "Upload tài liệu theo từng chuyến bay"
group: "Upload Document"
---

## Upload tài liệu theo từng chuyến bay

| **Tên chức năng: Upload tài liệu theo từng chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Upload tài liệu theo từng chuyến bay chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => mở đến module Flight Dispatch -> chọn Upload Document |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền vào Upload Document |
| **Hậu điều kiện** | Upload tài liệu theo từng chuyến bay thành công |

### Sơ đồ nghiệp vụ

*(hình ảnh minh họa — xem file gốc/Google Doc)*

### Mô tả luồng nghiệp vụ

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | Người dùng truy cập Upload Document và chọn tab Tài liệu chuyến bay. |
| 2 | Hệ thống gọi API lấy [danh sách tài liệu theo từng chuyến](TOSS.FD.FLIGHT_DOCS_LIST.FD.v0.1.md) bay theo điều kiện mặc định. |
| 3 | Hệ thống hiển thị [danh sách tài liệu theo từng chuyến](TOSS.FD.FLIGHT_DOCS_LIST.FD.v0.1.md) bay cùng các bộ lọc tìm kiếm trên màn hình. |
| 4 | Người dùng chọn chuyến bay cần upload tài liệu và nhấn nút **Choose file** tại bản ghi tương ứng. |
| 5 | Hệ thống hiển thị popup **Upload tài liệu**, cho phép người dùng chọn loại tài liệu và tải tệp lên. |
| 6 | Người dùng chọn **loại tài liệu**, chọn **tệp**. |
| 7 | Hệ thống kiểm tra tính hợp lệ của dữ liệu upload, định dạng tệp, dung lượng tệp.   * Chỉ cho phép upload các tệp có định dạng .pdf và .txt. Nếu định dạng tệp không đúng sẽ thông báo lỗi: “**The file format does not conform to the rules. Please try again.**” * Dung lượng tối đa của mỗi tệp là 30MB. Nếu dung lượng vượt quá sẽ có thông báo: “**The file you Upload exceeds the 30MB size limit.**” * Quy tắc đặt tên : Name_Rev.pdf. Ví dụ: OFP_R01.pdf Nếu tên tệp không đúng quy tắc, hệ thống hiển thị thông báo lỗi: “**Invalid file name. Please follow the naming convention.**” và không cho phép upload. * Nếu tệp upload trùng tên với tệp đã có trong danh sách, hệ thống kiểm tra phiên bản tài liệu. Trường hợp phiên bản của tệp upload nhỏ hơn hoặc bằng phiên bản hiện có, hệ thống chặn upload và hiển thị thông báo: **"The uploaded file version must be greater than the existing file version."** |
| 8 | Trường hợp tệp không hợp lệ, hệ thống không thực hiện upload và hiển thị **toast message** thông báo lỗi: “**Failed to upload document. Please try again**.” để người dùng kiểm tra và thực hiện lại. |
| 9 | Trường hợp dữ liệu hợp lệ, hệ thống tự động upload tài liệu và lưu thông tin tài liệu vào cơ sở dữ liệu, cập nhật danh sách tài liệu của chuyến bay và hiển thị **toast message** thông báo **"Upload document successfully."**. |

### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)**(hình ảnh minh họa — xem file gốc/Google Doc)**(hình ảnh minh họa — xem file gốc/Google Doc)*

### Mô tả màn hình chức năng

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| 1 | Flight Information | Textview |  | * Hiển thị thông tin chuyến bay gồm: Flight No, Aircraft Registration, sân bay đi (DEP), sân bay đến (ARR), ngày khai thác, ETD và ETA. * Dữ liệu được lấy theo chuyến bay người dùng đã chọn. |
| 2 | Choose File | Button |  | * Khi người dùng nhấn Choose file, hệ thống mở hộp thoại để người dùng chọn tệp từ máy tính. * Cho phép người dùng kéo thả (Drag & Drop) hoặc nhấn Choose file để chọn tệp từ máy tính. * Chỉ cho phép upload 1 tài liệu 1 lần. * Sau khi người dùng chọn tệp thành công, hệ thống hiển thị tên tệp đã chọn. Khi chưa chọn tệp, hệ thống hiển thị thông báo "Chưa có file được chọn". * Chỉ cho phép upload các tệp có định dạng .pdf và .txt. Nếu định dạng tệp không đúng sẽ thông báo lỗi: “**The file format does not conform to the rules. Please try again.**” * Dung lượng tối đa của mỗi tệp là 30MB. Nếu dung lượng vượt quá sẽ có thông báo: “**The file you Upload exceeds the 30MB size limit.**” * Quy tắc đặt tên tệp được thực hiện theo quy định. Nếu tên tệp không đúng quy tắc, hệ thống hiển thị thông báo lỗi: “**Invalid file name. Please follow the naming convention.**” và không cho phép upload. * Nếu tệp upload trùng tên với tệp đã có trong danh sách, hệ thống kiểm tra phiên bản tài liệu. Trường hợp phiên bản của tệp upload nhỏ hơn hoặc bằng phiên bản hiện có, hệ thống chặn upload và hiển thị thông báo: **"The uploaded file version must be greater than the existing file version."** * Nếu tên tệp hợp lệ, hệ thống tiếp tục kiểm tra các điều kiện khác (định dạng, dung lượng...) và hệ thống tự động upload tài liệu:   + Trong quá trình upload, hệ thống hiển thị tên tệp, thanh tiến trình (Progress Bar) và tỷ lệ hoàn thành (%) để người dùng theo dõi trạng thái upload.   + Sau khi chọn file tải lên thành công, hệ thống hiển thị trạng thái thành công: “ File uploaded successfully .”. Người dùng có thể nhấn biểu tượng **Delete** để hủy tệp đã chọn và chọn tệp khác trước khi thực hiện upload   + Trường hợp chọn file tải lên thất bại, hệ thống hiển thị thông báo lỗi: “**File uploaded unsuccessfully** ” và cho phép người dùng có thể nhấn biểu tượng **Delete** để hủy tệp đã chọn và chọn tệp khác trước khi thực hiện upload. * Quy tắc đặt tên : Name_Rev. Ví dụ: OFP_R01.pdf * Khi nhấn button upload:   + Hệ thống lưu thông tin tài liệu vào cơ sở dữ liệu và tự động cập nhật danh sách tài liệu.   + Trường hợp upload thất bại, hệ thống hiển thị thông báo lỗi: “**File Upload unsuccessful**.” và cho phép người dùng thực hiện upload lại. |
| Bảng danh sách tài liệu chuyến bay:   * FE gọi API lấy [danh sách tài liệu theo từng chuyến](TOSS.FD.FLIGHT_DOCS_LIST.FD.v0.1.md) bay để hiển thị trên giao diện người dùng. * Mỗi bản ghi trong danh sách tương ứng với một phiên bản (Revision) của một tài liệu được upload cho chuyến bay. * Người dùng có thể upload tài liệu mới bằng cách kéo thả (Drag & Drop) hoặc nhấn Choose File để chọn tệp từ máy tính. * Sau khi người dùng chọn tệp hợp lệ, hệ thống tự động upload tài liệu, cập nhật danh sách và hiển thị kết quả mới nhất. * Danh sách hiển thị các thông tin của tài liệu gồm: Document Name, Upload Date, Rev,Active. * Quy tắc sắp xếp mặc định: Hệ thống sắp xếp danh sách theo Revision (Rev) theo thứ tự giảm dần (Revision mới nhất hiển thị trước). Trường hợp các tài liệu có cùng Revision, hệ thống sắp xếp theo Upload Date giảm dần (tài liệu được upload gần nhất hiển thị trước). | | | | |
| 3 | Document Name | Textview |  | * Hiển thị tên tài liệu đã upload. * Nếu tên tài liệu vượt quá chiều rộng cột, hiển thị dấu **"..."** và tooltip hiển thị đầy đủ tên tài liệu. * Trường hợp API trả về rỗng/lỗi: để trống. |
| 4 | Upload date | Textview |  | * Hiển thị thời điểm tài liệu được upload. * Định dạng hiển thị: **ddMM - HH:mm.** (Ví dụ: 24JUN • 11:11) * Trường hợp API trả về rỗng/lỗi: để trống. |
| 5 | Rev | Textview |  | * Hiển thị phiên bản (Revision) của tài liệu. * Sau khi người dùng upload tài liệu thành công, hệ thống **trích xuất phiên bản (Revision) từ tên tệp theo quy tắc đặt tên tài liệu**, lưu vào cơ sở dữ liệu và hiển thị trên danh sách tài liệu. * Giá trị được lấy theo dữ liệu API trả về. * Trường hợp API trả về rỗng/lỗi: để trống. |
| 6 | Action | Button |  | * Hiển thị icon Delete đối với từng tài liệu trong danh sách. * Khi người dùng nhấn icon Delete, hệ thống hiển thị popup xác nhận xóa tài liệu.   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Khi người dùng chọn Save, hệ thống gọi API xóa tài liệu, cập nhật lại danh sách tài liệu và hiển thị toast message: "**Document has been deleted successfully**.". * Khi người dùng chọn Cancel, hệ thống đóng popup, không thực hiện xóa tài liệu và quay lại màn hình danh sách tài liệu. |
| 7 | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Hiển thị biểu tượng **Close (X)** tại góc trên bên phải của popup **Upload tài liệu theo từng chuyến bay**. * Khi người dùng nhấn nút **Close**, hệ thống đóng popup và quay về màn hình **Danh sách chuyến bay**. * Trường hợp đang có dữ liệu chưa được upload, hệ thống hủy thao tác upload và không lưu dữ liệu. |

---

> **Nguồn gốc (truy vết):** Tách trung thực từ `sec-09-upload-tai-lieu-theo-tung-chuyen-bay.md` — mảnh phân rã `VNA.TOSS_SRS_Flight Dispatch_v0.1.md` (SRS Flight Dispatch v0.1, người soạn VNA/VTIT, nguồn Google Drive live pull 2026-07-10) — ứng với dòng **#6** bảng §1 trong [CATALOG.md](../CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0). Lưu ý cờ đã ghi tại CATALOG.md §2.4/§2.10: Mục đích lặp từ "chuyến bay" (giữ nguyên văn nguồn); cột Bước ghi số thuần 1-9 (khác định dạng "Bước N" của F01/F03/F04/F05/F08).
