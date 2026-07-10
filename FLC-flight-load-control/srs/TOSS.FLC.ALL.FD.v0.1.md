---
source_gdrive: "https://docs.google.com/spreadsheets/d/1h5wsfTtU6sKJDIqZod2MKWhhjQTNB-BVEn5252n1ALs"
source_name: "VNA.TOSS_SRS_Flight Load Control_v0.1"
document_type: "Google Drive → MD (read-only)"
source_version: "2074"
source_modified: "2026-07-10T03:03:55.729Z"
last_modifying_user: "lyphat676"
pulled: "2026-07-10"
status: "Raw pull — chưa biên tập"
---

> **Nguồn (Google Drive, live):** VNA.TOSS_SRS_Flight Load Control_v0.1 — https://drive.google.com/file/d/1h5wsfTtU6sKJDIqZod2MKWhhjQTNB-BVEn5252n1ALs  
> Pull 2026-07-10 (version 2074, sửa 2026-07-10T03:03:55.729Z bởi lyphat676).

![D:\Picture\Logo\Viettel_logo_2021.svg.png](data:image/png;base64...)

**TẬP ĐOÀN CÔNG NGHIỆP - VIỄN THÔNG QUÂN ĐỘI VIETTEL**

**<VTIT>**

**BIỂU MẪU**

**TÀI LIỆU THIẾT KẾ CHI TIẾT**

Mã hiệu dự án: **VNA.FIMS**

Mã hiệu tài liệu: **VNA.FIMS\_SRS\_Flight\_Load\_Control\_v1.0**

<Hà Nội, 01/2026>

**BẢNG GHI NHẬN THAY ĐỔI TÀI LIỆU**

| Ngày  thay đổi | Vị trí  thay đổi | A\*  M, D | Nguồn gốc | Phiên  bản cũ | Mô tả thay đổi | Phiên  bản mới |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |

\*A – Tạo mới, M – Sửa đổi, D – Xóa bỏ

**TRANG KÝ**

Người lập: <Ngày>

<Chức danh>

Người xem xét: <Ngày>

<Chức danh>

Người xem xét: <Ngày>

<Chức danh>

Người phê duyệt: <Ngày>

<Chức danh>

# **A - THÔNG TIN CHUNG**

# **GIỚI THIỆU**

Tài liệu mô tả chi tiết các quy trình nghiệp vụ và đặc tả chức năng yêu cầu của Module TOSS

## **Mục đích**

Tài liệu **Đặc tả Yêu cầu Phần mềm (SRS)** này có các mục đích sau:

* **Xác định rõ phạm vi hệ thống**: Mô tả đầy đủ những gì hệ thống TOSS cần thực hiện trong Phase 1, bao gồm các chức năng được triển khai và các chức năng nằm ngoài phạm vi.
* **Làm cơ sở thống nhất giữa các bên**: Là tài liệu giao kèo giữa Bên đặt hàng (VNA), Bên phát triển (VTIT) và các bên liên quan về những gì hệ thống sẽ cung cấp.
* **Định hướng thiết kế và phát triển**: Cung cấp đặc tả đủ chi tiết để đội ngũ kỹ thuật (Dev, QA, DevOps) có thể thiết kế, xây dựng và kiểm thử hệ thống mà không cần diễn giải thêm.
* **Là cơ sở kiểm thử và nghiệm thu**: Mỗi yêu cầu trong tài liệu này là một tiêu chí có thể kiểm tra được (testable requirement), làm nền tảng cho kế hoạch kiểm thử và tiêu chí nghiệm thu hệ thống.

Tài liệu này **không** mô tả kiến trúc hệ thống chi tiết, không bao gồm kế hoạch triển khai hay vận hành.

## **Phạm vi tài liệu**

***1.2.1*****Đối tượng đọc tài liệu**

Tài liệu này phục vụ cho các đối tượng sau:

| **STT** | **Đối tượng** | **Vai trò sử dụng tài liệu** |
| --- | --- | --- |
| 1 | Business Analyst | Xác nhận yêu cầu nghiệp vụ đã được ghi nhận đầy đủ và chính xác |
| 2 | Nhân viên thiết kế & phát triển (Dev) | Thiết kế hệ thống, viết code theo đúng yêu cầu chức năng |
| 3 | Nhân viên kiểm thử (QA/Tester) | Xây dựng kịch bản kiểm thử, kiểm tra hệ thống đáp ứng yêu cầu |
| 4 | Quản trị dự án (PM | Theo dõi phạm vi và kiểm soát thay đổi yêu cầu |
| 5 | Đơn vị vận hành | Nắm bắt quy trình và chức năng để vận hành, hỗ trợ người dùng |
| 6 | Đại diện Vietnam Airlines (Khách hàng) | Xem xét, phê duyệt yêu cầu trước khi phát triển |

***1.2.2*****Phạm vi hệ thống (Phase 1)**

## **Khái niệm, thuật ngữ**

[Phần này sẽ cung cấp các định nghĩa của tất cả các khái niệm, thuật ngữ… được sử dụng trong tài liệu Kiến trúc hệ thống.]

| STT | Thuật ngữ | Khái niệm |
| --- | --- | --- |
| 1 | TT/STT | Số thứ tự |
| 2 | VNA | Vietnam airlines |
| 3 | FIMS | OPERATION DATA LAKE/PLATFORM |
| 4 | CFP | Computerized Flight Plan |
| 5 | OFP | Operational Fight Plan |
| 6 | e-CFP/OFP | Electronic - Computerized Flight Plan |
| 7 | PIC | Pilot in Command |

#

# **B - THIẾT KẾ CHI TIẾT**

# **Document**

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

## **Xem chi tiết tài liệu chuyến bay**

| **Tên chức năng: Xem chi tiết tài liệu chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user xem chi tiết tài liệu chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Document => Nhấn vào một bản ghi bất kỳ |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight load control |
| **Hậu điều kiện** | Màn hình chi tiết tài liệu chuyến bay hiển thị |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Document. |
| 2 | Hệ thống gọi API để lấy dữ liệu và hiển thị danh sách chuyến bay cùng trạng thái tài liệu lên màn hình |
| 3 | Người dùng nhấn chọn một bản ghi bất ký trên danh sách |
| 4 | Hệ thống hiển thị view “Chi tiết tài liệu chuyến bay”, tương ứng với bản ghi người dùng vừa thao tác |

### **Màn hình chức năng**

![](data:image/png;base64...)

![](data:image/png;base64...)

### **Mô tả chi tiết màn hình**

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | ![](data:image/png;base64...) | | | |
| 1 | ![](data:image/png;base64...) | Label |  | * Top: Hiển thị số hiệu chuyến bay => Lấy từ cột Flight * Bottom: Hiển thị ACREG + ACTYPE |
| ![](data:image/png;base64...) | Label |  | * Hiển thị ngày cất cánh dự kiến => Dữ liệu đồng bộ từ Netline ops++ |
| ![](data:image/png;base64...) | Label |  | * Top: Hiển thị giờ cất cánh dự kiến (ETD) =>Dữ liệu được đồng bộ từ Netline ops++ * Bottom: Hiển thị sân bay khởi hành theo định dạng IATA - ICAO => Dữ liệu được đồng bộ từ Netline ops++ |
| ![](data:image/png;base64...) | Label |  | * Top: Hiển thị giờ hạ cánh dự kiến => Dữ liệ được đồng bộ từ Netline * Bottom: Hiển thị sân bay khởi hành theo định dạng IATA - ICAO => Dữ liệu được đồng bộ từ Netline |
| 2 | ![](data:image/png;base64...) | icon |  | * Click icon x => Quay trở lại màn hình danh sách và tài liệu chuyến bay |
| 3 | Document Type | Tab |  | * Hiển thị các nhóm tài liệu: **Load Sheet**, **Gen. Declaration**, **Pax Manifest**. * Mặc định chọn **Load Sheet** * Khi user chọn tab khác, hệ thống hiển thị danh sách tài liệu của loại tương ứng. |
| 4 | Upload Area | View |  | * Vùng hiển thị chức năng tải lên tài liệu. * [Tham chiếu kịch bản upload tài liệu](#_g3cvtakkbgr2) |
| **Bảng dữ liệu thông tin tài liệu chuyến bay**   * ***Fix cứng 20 bản ghi phiên bản tài liệu và cho phép scroll*** | | | | |
| 5 | Document Name | Textview |  | * Hiển thị tên file tài liệu được upload/ đồng bộ về * Trường hợp API trả về rỗng/lỗi: để trống trường |
| 6 | Upload Date | Datetime |  | * Hiển thị thời gian tài liệu được upload/đồng bộ lên hệ thống.   ![](data:image/png;base64...)   * Định dạng ddMM hh:mm * Trường hợp API trả về rỗng/lỗi: để trống trường |
| 7 | ACK Time | Datetime |  | * Hiển thị thời điểm phi công confirm (ACK) tài liệu   ![](data:image/png;base64...)   * Định dạng ddMM hh:mm * Trường hợp API trả về rỗng/lỗi: để trống trường * *Đối với tài liệu đang ở trạng thái AWAIT ACK => Mặc định để trống trường này và hiển thị “---”* |
| 8 | Rev | Texview |  | * Hiển thị phiên bản (Revision) của tài liệu. Ví dụ: R01, R02. * Trường hợp API trả về rỗng/lỗi: để trống trường |
| 9 | Source | Texview |  | * Hiển thị nguồn của tài liệu: Có 2 nguồn:   + System: là nguồn đồng bộ từ hệ thống khác   + Manual: là nguồn user upload thủ công trên hệ thống TOSS |
| 10 | Status | Badge | status | * Hiển thị trạng thái hiện tại của tài liệu * Các trạng thái gồm:   + AWAIT ACK : tương ứng với trạng thái màu vàng trên màn hình danh sách   + REJECTED: tương ứng với trạng thái màu đỏ trên màn hình danh sách   + ACCEPTED: Tương ứng với trạng thái màu xanh trên màn hình danh sách |
|  | **User click vào 1 bản ghi => Poup xem chi tiết 1 tài liệu:**  ![](data:image/png;base64...) | | | |
| 11 | Tên file |  |  | * Hiển thị theo tên file gốc được đồng bộ/upload lên hệ thống tương ứng với cột Document Name |
| 12 | Trang hiện tại / Tổng số trang  ![](data:image/png;base64...) | page |  | * Hiển thị số trạng hiện tại người dùng đang xem / Tổng số trang của file. * Tại box số trang hiện tại cho phép người dùng nhập trực tiếp số trang muốn xem -> ấn enter để nhảy đến trang đó. * Chỉ cho phép nhập ký tự số từ 0->tổng số trang |
| 13 | ![](data:image/png;base64...) | Icon |  | * Cho phép click vào icon để thực hiện giảm kích thước hiển thị của tài liệu * Di chuột vào hiển thị tooltip: Zoom out * Bước nhảy: 10 * Min: 10% |
| 14 | ![](data:image/png;base64...) | Icon |  | * Cho phép click vào icon để thực hiện tăng kích thước hiển thị của tài liệu * Di chuột vào hiển thị tooltip: Zoom in * Bước nhảy: 10 * Max: 200% |
| 15 | ![](data:image/png;base64...) | Icon |  | * Cho phép user thực hiện click vào icon để xoay tài liệu 90 độ * Di chuột vào hiển thị tooltip: Rotate |
| 16 | ![](data:image/png;base64...) | Icon |  | * Lật tài liệu theo chiều ngang (trái ↔ phải). Mỗi lần nhấn sẽ chuyển đổi giữa trạng thái lật và trạng thái ban đầu. * Di chuột vào hiển thị tooltip: Flip Horizontal |
| 17 | ![](data:image/png;base64...) | Icon |  | * Lật tài liệu theo chiều dọc (trên ↔ dưới). Mỗi lần nhấn sẽ chuyển đổi giữa trạng thái lật và trạng thái ban đầu. * Di chuột vào hiển thị tooltip: Flip Vertical |
| 18 | ![](data:image/png;base64...) | Icon |  | * Click icon => Đóng popup view tài liệu và quay trở lại màn hình trước đó |
| 19 | ![](data:image/png;base64...) | Icon |  | * Cho phép user thực hiện click vào icon để download trực tiếp tài liệu về thiết bị * Di chuột vào hiển thị tooltip: Download |
| 20 | ![](data:image/png;base64...) | Icon |  | * Cho phép user thực hiện click vào icon để in trực tiếp tài liệu * Di chuột vào hiển thị tooltip: Printer |

## **Upload tài liệu chuyến bay**

| **Tên chức năng: Upload tài liệu chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user upload tài liệu chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Document => Nhấn vào một bản ghi bất kỳ => Hiển thị details chuyến bay => Nhấn tab tài liệu |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền chức năng upload tại phân hệ Flight load control |
| **Hậu điều kiện** | Upload tài liệu chuyến bay thành công |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1,2 | Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Document.  Hệ thống gọi API và hiển thị danh sách chuyến bay cùng trạng thái tài liệu lên màn hình |
| 3 | Người dùng nhấn vào một bản ghi chuyến bay bất kỳ trên danh sách |
| 4 | Hiển thị màn hình *“Chi tiết chuyến bay”* |
| 5 | Tại màn hình chi tiết người dùng chọn loại tài liệu cần Upload thông qua các Tab: Load Sheet, Gen.Declaration hoặc Pax Manifest. |
| 6 | Người dùng thực hiện **kéo thả file (Drag & drop)** vào vùng chỉ định, HOẶC nhấn button ![](data:image/png;base64...) để duyệt và chọn file từ thiết bị |
| 7 | Hệ thống tiến hành vadidate nếu   * Nếu file không hợp lệ chuyển sang Bước 8 * Nếu file hợp lệ chuyển sang bước 9 |
| 8 | Hệ thống hiển thị Toast Message báo lỗi: *“Failed to upload document. Please try again”*. Tiến trình tài file bị hủy, người dùng có thể chọn lại file khác |
| 9 | Hệ thống cập nhật dữ liệu vào DB |
| 10 | FE hiển thị Toast Message thành công : “*Document uploaded successfully*” |

### **Màn hình chức năng**

![](data:image/png;base64...)

![](data:image/png;base64...)

### **Mô tả chi tiết màn hình**

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| 1 | Title | Textview |  | * Text cứng “Drag [tên tài liệu LS/GD/PM] file here” |
| 2 | Chú thích | Textview |  | * Hiển thị chú thích các định dạng tài liệu được hỗ trợ: “Accepted formats are .pdf,.txt (maximum 5MB) “ |
| 3 | ![](data:image/png;base64...) | Button |  | * Quy tắc đặt tên file tài liệu:   + Cấu trúc: ***[tên tài liệu]\_[mã chuyến bay]\_[R<số phiên bản>]\_[ngày cất cánh dự kiến].[định dạng tên file***]   + Tên tài liệu: LOADSHEET/GD/PM   + Ngày cất cánh dự kiến định dạng: DD/MMM/YY   + Định dạng file: Chỉ phép định dạng file txt, pdf   *Ví dụ: LOADSHEET\_VN343\_R01\_02JUL26.TXT*   * Button “Select file” cho phép chọn tài liệu hoặc kéo thả file vào khu vực button để upload * Chặn tất cả các thao tác trên màn khi user đang thực hiện upload file * Các TH lỗi => Thực hiện disable button Upload   + TH upload file không đúng quy tắc đặt tên => Hiển thị IM: “*Invalid document name*”   + TH upload file không đúng định dạng hiển thị IM: *“Invalid file format. Only .txt and .pdf files are supported”*   + TH upload file mà vượt quá dung lượng=> Thông báo lỗi nếu tệp vượt quá giới hạn kích thước *“The file is too large. Please upload a file smaller than 5MB.”*   + Thông báo lỗi nếu lỗi xảy ra/mất mạng: *Failed to upload document. Please try again”*   + TH file tài liệu đã được upload cho chuyến bay khác, người dùng tiếp tục thực hiện upload file đó => Hiển thị IM*: “File already uploaded for another flight.”*   + TH tên file vượt quá độ rộng box => hiển thị dấu …..tooltips hiển thị full tên file * ![](data:image/png;base64...) : Click icon xóa tại tên tài liệu => xóa file hiện tại và hiển thị lại button ![](data:image/png;base64...) * User nhấn ![](data:image/png;base64...)=> Hiển thị popup xác nhận upload:   ![](data:image/png;base64...)   | ![](data:image/png;base64...) | * Fix cứng icon và không cho thao tác | | --- | --- | | ![](data:image/png;base64...) | * Click icon x => quay trở lại màn trước đó | | Content | “Are you sure you want to upload [Document Name]? “ | | ![](data:image/png;base64...) | * Click button => Quay trở lại màn trước đó | | ![](data:image/png;base64...) | * Click button => Hiển thị giao diện Processing: * ![](data:image/png;base64...) * Khi tài liệu được upload => Hệ thống cập nhật trạng thái tài liệu + thời gian upload + Rev tài liệu lên màn hình. Hiển thị tài liệu lên đầu bảng thông tin tài liệu.   + Chuyển trạng thái tài liệu về AWAIT ACK (màu vàng)   + Hiển thị toast thông báo upload thành công “*Document uploaded successfully*”   + Đồng thời bắn noti về MO cập nhật tài liệu | |

##

## **Tìm kiếm chuyến bay**

| **Tên chức năng: Tìm kiếm chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user tìm kiếm danh sách chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Document |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight load control |
| **Hậu điều kiện** | Hiển thị màn hình danh sách đã lọc theo tìm kiếm |

### ***Sơ đồ luồng***

![](data:image/png;base64...)

### ***Mô tả luồng xử lý***

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Document. |
| 2 | Hệ thống gọi API và hiển thị danh sách chuyến bay cùng trạng thái tài liệu lên màn hình |
| 3 | Người dùng nhập một hoặc nhiều điều kiện tìm kiếm trên bộ lọc. |
| 4 | **Trường hợp Tìm kiếm (Search):**  - User click button **Search**.  - Hệ thống xử lý, gọi API theo điều kiện lọc và hiển thị danh sách FLC Document tương ứng với kết quả tìm kiếm. |
| 5 | **Trường hợp Xóa bộ lọc (Clear Filter):**  - User click button **Clear Filter**.  - Hệ thống xóa toàn bộ thông tin/điều kiện đã nhập trên bộ lọc (Đồng thời tự động lấy lại danh sách mặc định như bước  2). |

###

### ***Màn hình chức năng***

![](data:image/png;base64...)

### ***Mô tả chi tiết màn hình***

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| * Tìm kiếm:   ![](data:image/png;base64...)   * Cơ chế Thu gọn/Mở rộng bộ lọc (Collapsible Filter): ![](data:image/png;base64...)[Tham chiếu kịch bản chức năng ẩn hiện filter](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.dgq51psil6dr) * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => click Enter/button **![](data:image/png;base64...)** => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về.   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0**. | | | | |
| 1 | FLT NO | Textbox |  | * Mặc định: Để trống * Placeholder: FLT NO * Trường để lọc: Tìm kiếm gần đúng theo [FLT NO] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 2 | ACREG | Textbox |  | * Mặc định: Để trống * Placeholder: ACREG * Trường để lọc: Tìm kiếm gần đúng theo [ACREG] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 3 | ACTYPE | Textbox |  | * Mặc định: Để trống * Placeholder: ACTYPE * Trường để lọc: Tìm kiếm gần đúng theo [ACTYPE] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | ETD | Time picker |  | * Mặc định: Để trống * Place holder: ETD * Trường để lọc: Tìm kiếm các chuyến bay trùng khớp theo [ETD] * Cho phép chọn thời gian cất cánh dự kiến (Estimated Time of Departure) theo múi giờ UTC. * Định dạng HH:mm. |
| 4 | DEP | Textbox |  | * Mặc định: Để trống * Placeholder: DEP * Trường để lọc: Tìm kiếm gần đúng theo [DEP] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 5 | ARR | Textbox |  | * Mặc định: Để trống * Placeholder: ARR * Trường để lọc: Tìm kiếm gần đúng theo [ARR] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 6 | ![](data:image/png;base64...) | Button |  | * Click vào ![](data:image/png;base64...) * Hệ thống thực hiện lọc dữ liệu dựa trên từ khoá * Hệ thống trả về danh sách dữ liệ u phù hợp với từ khoá tìm kiếm |
| 7 | ![](data:image/png;base64...) | Button |  | * Click vào ![](data:image/png;base64...) * Hệ thống:   + Xoá nội dung search   + Reset toàn trường lọc đã chọn   + Reset phân trang về trang đầu * Hiển thị lại danh sách ban đầu |

##

## **Customize bảng biểu**

| **Tên chức năng: Table Setting** | |
| --- | --- |
| **Mục đích** | Cho phép user Customize bảng biểu |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Document => Chọn ![](data:image/png;base64...) |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight load control |
| **Hậu điều kiện** | Hiển thị màn hình danh sách chuyến bay và tài liệu chuyến bay khi user Customize |

### **Sơ đồ luồng hệ thống**

### **![](data:image/png;base64...)**

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Fuel Order |
| 2 | Hệ thống gọi API và hiển thị danh sách chuyến bay và thông tin Fuel Order lên màn hình |
| 3 | Người dùng click button ![](data:image/png;base64...) |
| 4 | Hệ thống hiển thị Popup **Document table setting** (Hiển thị list toàn bộ các cột dữ liệu hiện có) |
| 5 | Người dùng thực hiện các thao tác thay đổi tham số cấu hình bảng: Kéo thả vị trí cột, bật/tắt hiển thị (Check/Uncheck) |
| 6 | Trường hợp người dùng nhấn nút [Cancel]: hệ thống đóng Popup, không lưu dữ liệu và giữ nguyên giao diện bảng hiện tại |
| 7 | Trường hợp người dùng nhấn nút [Save] => Hệ thống lưu thông tin cấu hình bảng (Table view) vào DB |
| 8 | Hệ thống đóng Popup và áp dụng cấu hình vừa lưu để render lại danh sách chuyến bay và trạng thái tài liệu trên giao diện |

### **Màn hình chức năng**

![](data:image/png;base64...)

### **Mô tả chi tiết màn hình**

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| **QUY TẮC LƯU CẤU HÌNH BẢNG**   * Nếu User đang trong phiên đăng nhập hợp lệ (96h kể từ lúc login) và đã có cấu hình bảng được lưu (Customize view), hệ thống tự động hiển thị danh sách theo cấu hình đã lưu (Lưu ý: Thao tác Logout/Login lại trong 96h sẽ không làm mất cấu hình) * Trường hợp quá 96h hoặc chưa từng cấu hình, hệ thống hiển thị danh sách theo giao diện mặc định   **QUY TẮC CÁC CỘT LUÔN HIỂN THỊ**   * Phạm vi áp dụng: 7 cột dữ liệu (EDD, FLT NO, ACREG, ACTYPE, ETD, DEP, ARR) * Tại danh sách chuyến bay: Các cột này luôn được sắp xếp cố định ở đầu bảng (từ trái sang phải) và không bị ghim, cho phép cuộn ngang cùng bảng dữ liệu * Tại giao diện cấu hình cột (Table setting Popup): Không hiển thị 7 cột cố định trong list “*Data column name”* | | | | |
| 1 | Title | Textview |  | * Fix cứng text “Document table setting” * Không cho thao tác |
| 2 | ![](data:image/png;base64...) | Icon |  | * Click Button => Đóng Popup, trở lại màn hình danh sách chuyến bay và trạng thái tài liệu |
| 3 | Data column name | Textview |  | * Hiển thị tên danh sách tên các cột dữ liệu khả dụng của của bảng * Fix cứng text, không cho thao tác |
| ![](data:image/png;base64...) | | | | |
| 4 | ![](data:image/png;base64...) | Icon |  | * Cho phép người dùng nhấn giữ (hold) và kéo thả để thay đổi vị trí sắp xếp của các cột   (Từ trên xuống tương đương Từ trái sang Phải) |
| 5 | ![](data:image/png;base64...) | Checkbox |  | * Trạng thái mặc định:   + Chưa có cấu hình hoặc lần đầu Login: Tick chọn toàn bộ theo cấu hình gốc của hệ thống   + Đã có cấu hình tùy chỉnh: Load trạng thái đồng bộ với cấu hình hiện tại của bảng (Cột đang hiển thị -> [Check], cột đang bị ẩn -> [Uncheck] ) * Action   + Tick chọn: Hiển thị cột dữ liệu tương ứng trong bảng danh sách   + Bỏ tick: Ẩn cột dữ liệu tương ứng trong bảng danh sách |
| 6 | ![](data:image/png;base64...) | Button |  | * Click [Cancel] =>Đóng Popup, trở lại màn hình danh sách chuyến bay và trạng thái tài liệu |
| 7 | ![](data:image/png;base64...) | Button |  | Click [Button] ![](data:image/png;base64...) =>   * Đóng Popup “Document table setting” * Reload màn hình danh chuyến bay áp dụng theo cấu hình mới |

# **Fuel order**

## **Xem danh sách chuyến bay và thông tin fuel order**

| **Tên chức năng: Xem danh sách chuyến bay và thông tin fuel order** | |
| --- | --- |
| **Mục đích** | Cho phép user xem danh sách chuyến bay và thông tin fuel order |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Fuel Order |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight load control |
| **Hậu điều kiện** | Mở màn hình danh sách chuyến bay và thông tin fuel order đối với từng chuyến bay |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1 | * Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Fuel Order |
| 2 | * Hệ thống gọi API lấy đữ liệu danh sách toàn bộ chuyến bay và thông tin Fuel Order |
| 3 | * Đồng bộ danh sách chuyến bay từ Netline:   + Trường hợp data trả ra # null -> có bản ghi danh sách chuyến bay, hiển thị bảng danh sách chuyến bay theo [quy tắc hiển thị](#4lfzq7keam4h)   + Trường hợp data trả ra = null -> không có bản ghi danh sách chuyến bay, hiển thị bảng danh sách chuyến bay trống kèm text “ No data”.   + Trường hợp lỗi đồng bộ từ Netline trong quá trình xử lý => Hiển thị toast: “*An error has occurred, please try again”* * **Cơ chế tự động cập nhật dữ liệu**   + Khi nhận được bản OFP mới nhất được đồng bộ từ MO về: Hệ thống sẽ [mapping chuyến bay](#dj19egjxpzxo) và [bóc tách](#jo9zs5p15n8s) tự động fill vào 3 trường     - OFP Rev (Cập nhật số phiên bản OFP mới nhất)     - OFP PAYLOAD     - OFP DOW   + Khi PIC confirm release OFP => Hệ thống sẽ [mapping chuyến bay](#dj19egjxpzxo) và [bóc tách](#jo9zs5p15n8s) tự động fill vào 5 trường     - PIC Release Rev (Cập nhật số phiên bản mới nhất)     - OFP FUEL     - FUEL ORDER     - TAXI     - TRIP * Quy tắc mapping    + TOSS thực hiện phân loại tài liệu và gắn (mapping) tự động vào đúng chuyến bay tương ứng dựa trên quy tắc đọc thông tin tài liệu   + Cấu trúc tên file: [LOẠI\_TÀI\_LIỆU]\_[FLT\_NO]\_[DEP]\_[EDD]\_[dd\_mm\_yyyy] [hh\_mm\_ss]     - [LOẠI TÀI LIỆU]: → FLIGHT RELEASE, OFP     - [FLT NO]: → VN343, VN177     - [DEP]: → NGO, HAN     - [EDD]: → 6JUN     - [dd\_mm\_yyyy] [hh\_mm\_ss]: → 07\_07\_2026 22\_06\_00   => Hệ thống sẽ tự động map [FLT NO ] [EDD] trong tên file vào chuyến bay tương ứng để bóc tách dữ liệu   * Quy tắc bóc tách và ghi nhận dữ liệu   + OFP Rev: Hiển thị thông tin phiên bản OFP mới nhất được đồng bộ từ MO về   + PIC release rev :Hiển thị thông tin phiên bản PIC release mới nhất từ MO về   + OFP PAYLOAD: Bóc tách từ trường PLD trong OFP phiên bản mới nhất   ![](data:image/png;base64...)   * + OFP DOW : Được bóc tách từ trường DOW trong OFP phiên bản mới nhất   ![](data:image/png;base64...)   * + OFP FUEL : Đồng bộ từ Database của MO (thuộc bản PIC Release mới nhất), lấy giá trị tại trường lấy gái trị OFP BLOCK FUEL cột C.FUEL   + FUEL ORDER:Đồng bộ từ Database của MO (thuộc bản PIC Release mới nhất) lấy giá trị TOTAL FUEL cột C.FUEL   + TAXI (release): Đồng bộ từ Database của MO (thuộc bản PIC Release mới nhất) lấy giá trị TAXI cột C.FUEL   + TRIP (release) :Đồng bộ từ Database của MO (thuộc bản PIC Release mới nhất) lấy giá trị TRIP cột C.FUEL |
| 4 | * Hiển thị danh sách chuyến bay và thông tin fuel order của chuyến bay tương ứng |

####

### **Màn hình chức năng**

### **Mô tả chi tiết màn hình**

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| * **Quy tắc hiển thị:**   + ~~Hiển thị danh sách chuyến bay trong khoảng ±18 giờ so với thời điểm hiện tại (UTC).~~   + ~~Danh sách được cập nhật theo thời gian thực.~~   + ~~Thứ tự hiển thị theo chiều top → bottom: Chuyến bay chuẩn bị khai thác → Chuyến bay đang khai thác → Chuyến bay đã khai thác. Sắp xếp theo ETD giảm dần từ trên xuống~~ * Các cột thông tin trên màn danh sách   + Các cột thông tin đồng bộ từ Netline ops ++:     - EDD     - FLT NO     - ACREG     - ACTYPE     - ETD     - DEP     - ARR   + Các cột thông tin hiển thị (dựa trên dữ liệu bóc tách từ bản OFP mới nhất đồng bộ từ MO)     - OFP PAYLOAD     - OFP DOW     - OFP Rev   + Các cột thông tin hiển thị (dựa trên dữ liệu bóc tách từ bản Flight Release mới nhất được PIC confirm release từ MO)     - PIC release rev     - OFP Fuel     - Fuel Order     - TAXI     - TRIP | | | | |
| 1 | EDD | Datetime |  | * EDD: Ngày dự kiến khởi hành * Hiển thị [EDD ] theo dữ liệu API trả về * Định dạng: ddMMM ( ví dụ: 23JUN) * Trường hợp API trả về rỗng/lỗi: để trống trường |
| 1 | FLT NO | Textview |  | * FLIGHT: Số hiệu chuyến bay * Hiển thị [FLT NO ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin số hiệu của chuyến bay |
| 2 | ACREG | Textview |  | * ACREG: Số hiệu đăng ký chuyến bay * Hiển thị [ACREG ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin số hiệu đăng ký của chuyến bay |
| 3 | ACTYPE | Textview |  | * ACTYPE: Loại tàu bay * Hiển thị [ACTYPE ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin loại tàu bay của chuyến bay |
| 4 | ETD | Textview |  | * ETD: Thời gian cất cánh dự kiến * Hiển thị [ETD] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Cấu trúc hiển thị: giờ - phút (hh:mm) * ~~Trường này là cơ sở để hiển thị danh sách chuyến bay theo~~ [~~quy tắc hiển thị~~](#gv48fwux7pm) |
|  | DEP | Textview |  | * DEP: Hiển thị thông tin Điểm đi * Hiển thị [DEP] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin Điểm đi của máy bay * Hiển thị dưới dạng viết tắt của điểm đi |
|  | ARR | Textview |  | * ARR: Hiển thị thông tin Điểm đến * Hiển thị [ARR ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin Điểm đến * Hiển thị dưới dạng viết tắt của điểm đến |
|  | OFP Rev | Textview |  | * OFP Rev: Hiển thị thông tin phiên bản OFP mới nhất được đồng bộ từ MO về * Hiển thị [OFP Rev ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin phiên bản OFP mới nhất |
|  | PIC release rev | Textview |  | * PIC release rev: Hiển thị thông tin phiên bản PIC release mới nhất từ MO * Hiển thị [PIC release rev ] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
|  | EST PAYLOAD | Numer |  | * EST PAYLOAD: Hiển thị Tải trọng dự kiến do KST nhập/ gửi. Đơn vị (**Kg**) * Gía trị lấy từ trường TOTAL PAYLOAD trong màn chi tiết * Hiển thị [EST PAYLOAD] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
|  | OFP PAYLOAD | Number |  | * OFP PAYLOAD: Hiển thị Tải trọng dự kiến trên OFP. Đơn vị (**Kg**) * Bóc tách từ trường PLD trong OFP phiên bản mới nhất   ![](data:image/png;base64...)   * Hiển thị [OFP PAYLOAD] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin Tải trọng dự kiến trên OFP * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
|  | OFP DOW | Number |  | * OFP DOW: Trọng lượng cơ sở của tàu bay đã sẵn sàng để thực hiện chuyến bay. Đơn vị (**Kg**) * Bóc tách từ trường DOW trong OFP phiên bản mới nhất   ![](data:image/png;base64...)   * Hiển thị [OFP DOW] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin Trọng lượng cơ sỏ của tàu bay * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
|  | DIFFERENCE | Number |  | * Hiển thị Chênh lệch tải trọng. Đơn vị (Kg) * Hệ thống tự động tính toán theo công thức DIFFERENCE = EST PAYLOAD - OFP PAYLOAD để hiển thị ra màn hình * Giá trị có thể số dương **(≥ 0)** hoặc số âm **(< 0)** * Trường hợp API trả về rỗng/lỗi, HOẶC một trong hai trường dữ liệu gốc (EST PAYLOAD, OFP PAYLOAD) bị rỗng: Để trống trường * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm [...] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
|  | OFP FUEL |  |  | * Hiển thị dầu dự kiến trên OFP. Đơn vị (Kg) * Gía trị được bóc tách từ Flight Release: lấy gái trị OFP BLOCK FUEL cột C.FUEL * ![](data:image/png;base64...) * Hiển thị [OFP FUEL] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
|  | FUEL ORDER |  |  | * Hiển thị số dầu mà PIC request. Đơn vị (Kg) * Hiển thị [FUEL ORDER ] theo dữ liệu API trả về * Gía trị được bóc tách từ Flight Release phiên bản mới nhất: lấy gái trị TOTAL FUEL cột C.FUEL * ![](data:image/png;base64...) * Trường hợp API trả về rỗng/lỗi: để trống trường * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
|  | TAXI (release) |  |  | * Hiển thị Taxi Fuel. Đơn vị (Kg) * Hiển thị [TAXI] theo dữ liệu API trả về * Gía trị được bóc tách từ Flight release phiên bản mới nhất: lấy giá trị TAXI cột C.FUEL   ![](data:image/png;base64...)   * Trường hợp API trả về rỗng/lỗi: để trống trường * Dữ liệu trong cột hiển thị thông tin Taxi Fuel * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
|  | TRIP (release) |  |  | * Hiển thị Trip Fuel. Đơn vị (Kg) * Hiển thị [TRIP] theo dữ liệu API trả về * Gía trị được bóc tách từ Flight release phiên bản mới nhất: lấy giá trị TRIP cột C.FUEL   + ![](data:image/png;base64...) * Trường hợp API trả về rỗng/lỗi: để trống trường * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |

## **Xem details fuel chuyến bay**

| **Tên chức năng: Xem details fuel chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user xem chi tiết fuel chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Fuel Order =>Nhấp chọn vào 1 bản ghi |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight Load Control |
| **Hậu điều kiện** | Mở màn hình xem chi tiết fuel chuyến bay |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1 | * Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Document |
| 2 | * Hệ thống gọi API để lấy dữ liệu và hiển thị danh sách chuyến bay cùng thông tin fuel lên màn hình |
| 3 | * Người dùng nhấn chọn một bản ghi bất ký trên danh sách |
| 4 | * Hệ thống hiển thị view “Chi tiết fuel chuyến bay”, tương ứng với bản ghi người dùng vừa thao tác |

####

### **Màn hình chức năng**

### **Mô tả chi tiết màn hình**

## **Chỉnh sửa và hiển thị thông tin dầu**

### **Sơ đồ luồng hệ thống**

### **Mô tả luồng xử lý**

### **Màn hình chức năng**

### **Mô tả chi tiết màn hình**

## **Tìm kiếm chuyến bay và thông tin fuel order**

| **Tên chức năng: Tìm kiếm chuyến bay và thông tin fuel order** | |
| --- | --- |
| **Mục đích** | Cho phép user xem tìm kiếm chuyến bay và thông tin fuel order |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Fuel Order |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight Load Control |
| **Hậu điều kiện** | Mở màn hình danh sách chuyến bay và thông tin Fuel Order với từng chuyến bay |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Fuel Order |
| 2 | Hệ thống gọi API và hiển thị danh sách chuyến bay và thông tin Fuel Order lên màn hình |
| 3 | Người dùng nhập một hoặc nhiều điều kiện tìm kiếm trên bộ lọc. |
| 4 | **Trường hợp Tìm kiếm (Search):**  - User click button **Search**.  - Hệ thống xử lý, gọi API theo điều kiện lọc và hiển thị danh sách chuyến bay và thông tin Fuel Order tương ứng với kết quả tìm kiếm. |
| 5 | **Trường hợp Xóa bộ lọc (Clear Filter):**  - User click button **Clear Filter**.  - Hệ thống xóa toàn bộ thông tin/điều kiện đã nhập trên bộ lọc (Đồng thời tự động lấy lại danh sách mặc định như bước  2). |

###

### **Màn hình chức năng**

### **Mô tả chi tiết màn hình**

###

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| * Tìm kiếm:   ![](data:image/png;base64...)   * Cơ chế Thu gọn/Mở rộng bộ lọc (Collapsible Filter): ![](data:image/png;base64...)[Tham chiếu kịch bản chức năng ẩn hiện filter](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.dgq51psil6dr) * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => click Enter/button **![](data:image/png;base64...)** => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về.   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0**. | | | | |
| 1 | FLT NO | Textbox |  | * Mặc định: Để trống * Placeholder: FLT NO * Trường để lọc: Tìm kiếm gần đúng theo [FLT NO] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 2 | ACREG | Textbox |  | * Mặc định: Để trống * Placeholder: ACREG * Trường để lọc: Tìm kiếm gần đúng theo [ACREG] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 3 | ACTYPE | Textbox |  | * Mặc định: Để trống * Placeholder: ACTYPE * Trường để lọc: Tìm kiếm gần đúng theo [ACTYPE] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 4 | DEP | Textbox |  | * Mặc định: Để trống * Placeholder: DEP * Trường để lọc: Tìm kiếm gần đúng theo [DEP] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | ETD | Time picker |  | * Mặc định: Để trống * Place holder: ETD * Trường để lọc: Tìm kiếm các chuyến bay trùng khớp theo [ETD] * Cho phép chọn thời gian cất cánh dự kiến (Estimated Time of Departure) theo múi giờ UTC. * Định dạng HH:mm. |
| 5 | ARR | Textbox |  | * Mặc định: Để trống * Placeholder: ARR * Trường để lọc: Tìm kiếm gần đúng theo [ARR] * Maxlength 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Không cho phép nhận space * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 6 | ![](data:image/png;base64...) | Button |  | * Click vào ![](data:image/png;base64...) * Hệ thống thực hiện lọc dữ liệu dựa trên từ khoá * Hệ thống trả về danh sách dữ liệ u phù hợp với từ khoá tìm kiếm |
| 7 | ![](data:image/png;base64...) | Button |  | * Click vào ![](data:image/png;base64...) * Hệ thống:   + Xoá nội dung search   + Reset toàn trường lọc đã chọn   + Reset phân trang về trang đầu * Hiển thị lại danh sách ban đầu |

## **Customize bảng biểu**

| **Tên chức năng: Table Setting** | |
| --- | --- |
| **Mục đích** | Cho phép user Customize bảng biểu |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Fuel Order => Chọn ![](data:image/png;base64...) |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight load control |
| **Hậu điều kiện** | Hiển thị màn hình danh sách chuyến bay và thông tin Fuel Order khi user Customize |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Fuel Order |
| 2 | Hệ thống gọi API và hiển thị danh sách chuyến bay và thông tin Fuel Order lên màn hình |
| 3 | Người dùng click button ![](data:image/png;base64...) |
| 4 | Hệ thống hiển thị Popup **Flight Monitoring table setting** (Hiển thị list toàn bộ các cột dữ liệu hiện có) |
| 5 | Người dùng thực hiện các thao tác thay đổi tham số cấu hình bảng: Kéo thả vị trí cột, bật/tắt hiển thị (Check/Uncheck) |
| 6 | Trường hợp người dùng nhấn nút [Cancel]: hệ thống đóng Popup, không lưu dữ liệu và giữ nguyên giao diện bảng hiện tại |
| 7 | Trường hợp người dùng nhấn nút [Save] => Hệ thống lưu thông tin cấu hình bảng (Table view) vào DB |
| 8 | Hệ thống đóng Popup và áp dụng cấu hình vừa lưu để render lại danh sách chuyến bay và thông tin Fuel Order trên giao diện |

### **Màn hình chức năng**

![](data:image/png;base64...)

### **Mô tả chi tiết màn hình**

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| **QUY TẮC LƯU CẤU HÌNH BẢNG**   * Nếu User đang trong phiên đăng nhập hợp lệ (96h kể từ lúc login) và đã có cấu hình bảng được lưu (Customize view), hệ thống tự động hiển thị danh sách theo cấu hình đã lưu (Lưu ý: Thao tác Logout/Login lại trong 96h sẽ không làm mất cấu hình) * Trường hợp quá 96h hoặc chưa từng cấu hình, hệ thống hiển thị danh sách theo giao diện mặc định   **QUY TẮC CÁC CỘT LUÔN HIỂN THỊ**   * Phạm vi áp dụng: 7 cột dữ liệu (EDD, FLT NO, ACREG, ACTYPE, ETD, DEP, ARR) * Tại danh sách chuyến bay: Các cột này luôn được sắp xếp cố định ở đầu bảng (từ trái sang phải) và không bị ghim, cho phép cuộn ngang cùng bảng dữ liệu * Tại giao diện cấu hình cột (Table setting Popup): Không hiển thị 7 cột cố định trong list “*Data column name”* | | | | |
| 1 | Title | Textview |  | * Fix cứng text “Flight Monitoring table setting” * Không cho thao tác |
| 2 | ![](data:image/png;base64...) | Icon |  | * Click Button => Đóng Popup, trở lại màn hình danh sách chuyến bay và thông tin Fuel Order |
| 3 | Data column name | Textview |  | * Hiển thị tên danh sách tên các cột dữ liệu khả dụng của của bảng * Fix cứng text, không cho thao tác |
| ![](data:image/png;base64...) | | | | |
| 4 | ![](data:image/png;base64...) | Icon |  | * Cho phép người dùng nhấn giữ (hold) và kéo thả để thay đổi vị trí sắp xếp của các cột   (Từ trên xuống tương đương Từ trái sang Phải) |
| 5 | ![](data:image/png;base64...) | Checkbox |  | * Trạng thái mặc định:   + Chưa có cấu hình hoặc lần đầu Login: Tick chọn toàn bộ theo cấu hình gốc của hệ thống   + Đã có cấu hình tùy chinh: Load trạng thái đồng bộ với cấu hình hiện tại của bảng (Cột đang hiển thị -> [Check], cột đang bị ẩn -> [Uncheck] ) * Action   + Tick chọn: Hiển thị cột dữ liệu tương ứng trong bảng danh sách   + Bỏ tick: Ẩn cột dữ liệu tương ứng trong bảng danh sách |
| 6 | ![](data:image/png;base64...) | Button |  | * Click [Cancel] =>Đóng Popup, trở lại màn hình danh sách chuyến bay và thông tin Fuel Order |
| 7 | ![](data:image/png;base64...) | Button |  | Click [Button] ![](data:image/png;base64...) =>   * Đóng Popup “Document table setting” * Reload màn hình danh chuyến bay áp dụng theo cấu hình mới |

###