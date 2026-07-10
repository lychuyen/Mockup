---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "VNA/VTIT (nguồn SRS) — trích tách bởi agent BA"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Load Control"
feature_id: "TOSS.FLC.FLIGHT_LIST"
feature_name: "Xem danh sách chuyến bay và trạng thái tài liệu đối với từng chuyến bay"
group: "Document"
---

> **Phạm vi file:** Feature F01 (nhóm Document) — trích trung thực 100% từ nguồn SRS Flight Load Control do người soạn (CLAUDE.md §0), không suy diễn, không bổ sung. Cờ điểm cần xác nhận: xem CATALOG.md dòng #1.

## **Xem danh sách chuyến bay và trạng thái tài liệu đối với từng chuyến bay**

| **Tên chức năng: Xem danh sách chuyến bay và trạng thái tài liệu đối với từng chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user xem danh sách chuyến bay và trạng thái tài liệu đối với từng chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Document |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight load control |
| **Hậu điều kiện** | Mở màn hình danh sách chuyến bay - trạng thái tài liệu đối với từng chuyến bay |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1 | * Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Document. |
| 2 | * Hệ thống gọi API lấy đữ liệu danh sách toàn bộ chuyến bay và tài liệu |
| 3 | * Đồng bộ danh sách chuyến bay từ Netline:   + Trường hợp data trả ra # null -> có bản ghi danh sách chuyến bay, hiển thị bảng danh sách chuyến bay theo [quy tắc hiển thị](#gv48fwux7pm)   + Trường hợp data trả ra = null -> không có bản ghi danh sách chuyến bay, hiển thị bảng danh sách chuyến bay trống kèm text “ No data”.   + Trường hợp lỗi đồng bộ từ Netline trong quá trình xử lý => Hiển thị toast: “*An error has occurred, please try again”* * Đồng bộ tài liệu chuyến bay LS,GD,PM => Hệ thống check ID chuyến bay nếu:   + Tồn tại ID chuyến bay:     - Hệ thống thực hiện lưu/cập nhật tài liệu vào đúng chuyến bay tương ứng.     - Tài liệu mới được ghi nhận là phiên bản hiện hành và hiển thị trên màn hình tương ứng với các cột tài liệu   + Không tồn tại ID chuyến bay =>Hệ thống không thực hiện gắn tài liệu vào chuyến bay và không hiển thị trên màn hình do không xác định được chuyến bay tương ứng     - Timeout: Xảy ra lỗi trong quá trình xử lý -> trả msg: “*An error has occurred, please try again”* |
| 4 | * Hiển thị danh sách chuyến bay và tài liệu chuyến bay tương ứng |

####

### Màn hình chức năng

![](data:image/png;base64...)

### **Mô tả chi tiết màn hình**

####

|  | **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- | --- |
|  | * FE call API lấy danh sách chuyến bay và trạng thái tài liệu mới nhất hiển thị trên màn hình.  * **Quy tắc hiển thị:**   + Hiển thị danh sách chuyến bay trong khoảng ±18 giờ so với thời điểm hiện tại (UTC).   + Danh sách được cập nhật theo thời gian thực.   + Thứ tự hiển thị theo chiều top → bottom: Chuyến bay chuẩn bị khai thác → Chuyến bay đang khai thác → Chuyến bay đã khai thác. Sắp xếp theo ETD giảm dần từ trên xuống * Các cột thông tin trên màn danh sách   + Các cột thông tin đồng bộ từ Netline ops ++:     - EDD     - FLT NO     - ACREG     - ACTYPE     - ETD     - DEP     - ARR   + Cột cảnh báo PIC request: Hiển thị icon cảnh báo khi phi công request các đầu tài liệu trong chuyến bay   + Các cột tài liệu tương ứng với chuyến bay bao gồm LS, GD, PM được đồng bộ theo cơ chế:     - Loadsheet: Hệ thống TOSS tự động nhận mail do Amadeus gửi, lấy file LS và đồng bộ về     - GD: Hệ thống TOSS tự động nhận mail do Amadeus gửi, lấy file GD và đồng bộ về     - PM: Hệ thống TOSS tự động nhận mail do Amadeus gửi, lấy file PM và đồng bộ về * **Quy tắc phân bổ:** Hệ thống đọc nội dung, tiêu đề Email để lấy thông tin định danh (FLT NO, EDD, DEP, ARR…) từ đó mapping tài liệu về đúng ID chuyến bay * **Quy tắc xử lý file (Convert sang PDF):** Bất kể tài liệu nào nhận qua mail là file đính kèm hay dạng content, khi lưu vào hệ thống TOSS đều phải convert/generate thành định dạng PDF và lưu trữ vào Server.   Kịch bản đồng bộ tài liệu từ amadeus: | | | | |
|  | * Thông tin tài liệu hiển thị trên màn hình danh sách bao gồm :  * + Khối thông tin đồng bộ/upload:     - Rev tài liệu đồng bộ/upload (Ví dụ: Rev 01, 02,.....)     - Thời gian đồng bộ mới nhất: định dạng ddMMM( ví dụ; 23JUN, 24JUL,..)  * + Khối thông tin trạng thái tài liệu:     - Rev tài liệu mà phi công rejected/accepted/await ack (Ví dụ: Rev 01, 02,.....)     - Thời gian phi công rejected/accepted (với trạng thái AWAIT ACK thì không hiển thị thời gian): định dạng ddMMM( ví dụ; 23JUN, 24JUL,..)     - Màu trạng thái tài liệu * **Các trạng thái tài liệu bao gồm:**   + Màu xanh: tài liệu đã accept bởi phi công   + Màu đỏ: tài liệu đã bị reject bởi phi công   + Màu vàng: tài liệu đang chờ phi công accept   + Gạch ngang “--”: chuyến bay chưa có tài liệu | | | | |
|  | * **Kịch bản ứng xử của hệ thống TOSS khi tài liệu được đồng bộ/upload:** Khi hệ thống TOSS nhận được tài liệu hợp lệ từ đồng bộ/upload, hệ thống sẽ:   + Trường hợp 1: Đồng bộ/upload lần đầu     - Đối với [khối thông tin đồng bộ/upload:](#609vdysm2jwo) Hiển thị Rev 01 + thời gian đồng bộ/upload     - Đối với [khối thông tin trạng thái tài liệu](#suaxmhm11uq1): Hiển thị Rev 01 + trạng thái tài liệu AWAIT ACK   => Đồng thời hệ thống sẽ gửi Noti sang MO để sync tài liệu mới nhất (Khi truyền sang MO chỉ truyền định dạng file PDF)   * + Trường hợp 2: Đồng bộ/upload tài liệu các lần tiếp theo.     - Không thực hiện check trùng so với tài liệu cũ và luôn thay thế bằng tài liệu đồng bộ/upload mới nhất     - Nâng số Rev lên 1 cấp so với phiên bản gần nhất (Rev liền trước + 1).     - Ghi nhận thời gian đồng bộ/upload mới nhất.     - Trạng thái tài liệu cũ đang *Await ack*/*Rejected*/*Accepted* => Thực hiện chuyển trạng thái của tài liệu về "Await ack".     - Đồng thời gửi Noti về hệ thống MO để sync dữ liệu mới nhất (Chỉ truyền định dạng file PDF) * Nếu Noti gửi sang MO thất bại => Tài liệu trên màn hình danh sách vẫn giữ nguyên trạng thái, Rev, thời gian đồng bộ/upload. | | | | |
|  |  | EDD | Datetime |  | * EDD: Ngày dự kiến khởi hành * Hiển thị [EDD ] theo dữ liệu API trả về * Định dạng: ddMMM ( ví dụ: 23JUN) * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | 1 | FLT NO | Textview |  | * FLIGHT: Số hiệu chuyến bay * Hiển thị [FLT NO ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin số hiệu của chuyến bay |
|  | 2 | ACREG | Textview |  | * ACREG: Số hiệu đăng ký chuyến bay * Hiển thị [ACREG ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin số hiệu đăng ký của chuyến bay |
|  | 3 | ACTYPE | Textview |  | * ACTYPE: Loại tàu bay * Hiển thị [ACTYPE ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin loại tàu bay của chuyến bay |
|  | 4 | ETD | Textview |  | * ETD: Thời gian cất cánh dự kiến * Hiển thị [ETD] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin thời gian cất cánh dự kiến * Cấu trúc hiển thị: giờ - phút (hh:mm) * Trường này là cơ sở để hiển thị danh sách chuyến bay theo [quy tắc hiển thị](#gv48fwux7pm) |
|  |  | DEP | Textview |  | * DEP: Hiển thị thông tin Điểm đi * Hiển thị [DEP] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin Điểm đi của máy bay * Hiển thị dưới dạng viết tắt của điểm đi |
|  |  | ARR | Textview |  | * ARR: Hiển thị thông tin Điểm đến * Hiển thị [ARR ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin Điểm đến * Hiển thị dưới dạng viết tắt của điểm đến |
|  |  | PIC REQUEST | Icon |  | * Hiển thị icon ![](data:image/png;base64...)này khi các đầu tài liệu bị phi công request từ MO * Khi Hover details => sẽ hiển thị tên tài liệu bi phi công request + thời gian request   + Tên tài liệu: LOADSHEET/GD/PM   + Thời gian request định dạng: ddMMM hh:mm * Khi tài liệu bị request được đồng bộ/upload phiên bản mới về => Hệ thống TOSS bắn noti vể MO thông báo cập nhật phiên bản mới nhất. Đồng thời ẩn tên tài liệu đó trong hover details. Nếu không còn tài liệu bị request thì thực hiện ẩn icon cảnh báo ở cột PIC REQUEST |
|  |  | Các cột tài liệu:  LS, GD, PM | Textview |  | * Hiển thị thông tin tài liệu theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Thông tin tài liệu của chuyến bay, tham chiếu:   + [khối thông tin đồng bộ/upload](#609vdysm2jwo)   + [khối thông tin trạng thái tài liệu](#suaxmhm11uq1) |

##

---

**Nguồn trích:** `sec-04-xem-danh-sach-chuyen-bay-va-trang-thai-t.md` (mảnh phân rã h2 từ `TOSS.FLC.ALL.FD.v0.1.md`, đã xóa sau khi tách theo Feature — git giữ lịch sử) · CATALOG.md dòng #1.
