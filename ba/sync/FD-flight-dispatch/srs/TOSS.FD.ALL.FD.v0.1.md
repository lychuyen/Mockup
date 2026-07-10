---
source_gdrive: "https://docs.google.com/spreadsheets/d/1gk6cOzlZoU_jTd8nFlIziasify7EVdDu0sEH6aQKOZM"
source_name: "VNA.TOSS_SRS_Flight Dispatch_v0.1"
document_type: "Google Drive → MD (read-only)"
source_version: "1450"
source_modified: "2026-07-10T01:46:42.607Z"
last_modifying_user: "ttphuong060403"
pulled: "2026-07-10"
status: "Raw pull — chưa biên tập"
---

> **Nguồn (Google Drive, live):** VNA.TOSS_SRS_Flight Dispatch_v0.1 — https://drive.google.com/file/d/1gk6cOzlZoU_jTd8nFlIziasify7EVdDu0sEH6aQKOZM  
> Pull 2026-07-10 (version 1450, sửa 2026-07-10T01:46:42.607Z bởi ttphuong060403).

![D:\Picture\Logo\Viettel_logo_2021.svg.png](data:image/png;base64...)

**TẬP ĐOÀN CÔNG NGHIỆP - VIỄN THÔNG QUÂN ĐỘI VIETTEL**

**<VTIT>**

**BIỂU MẪU**

**TÀI LIỆU THIẾT KẾ CHI TIẾT**

Mã hiệu dự án: **VNA.FIMS**

Mã hiệu tài liệu: **VNA.FIMS\_SRS\_Flight Dispatch\_v0.1**

<Hà Nội, 01/2026>

**BẢNG GHI NHẬN THAY ĐỔI TÀI LIỆU**

\*A – Tạo mới, M – Sửa đổi, D – Xóa bỏ

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

**TRANG KÝ**

Người lập: <Ngày>

<Chức danh>

Người xem xét: <Ngày>

<Chức danh>

Người xem xét: <Ngày>

<Chức danh>

Người phê duyệt: <Ngày>

<Chức danh>

**MỤC LỤC**

[**A - THÔNG TIN CHUNG 10**](#_qfrorb2f7iq3)

[**1. GIỚI THIỆU 10**](#_d6dp3icfd51v)

[1.1. Mục đích 10](#_68o9myz7ea66)

[1.2. Phạm vi tài liệu 10](#_rhoskemr3vc)

[1.3. Khái niệm, thuật ngữ 12](#_hfs3rgqmtkap)

#

#

# **A - THÔNG TIN CHUNG**

# **GIỚI THIỆU**

Tài liệu mô tả chi tiết các quy trình nghiệp vụ và đặc tả chức năng yêu cầu của hệ thống TOSS

## **Mục đích**

Tài liệu **Đặc tả Yêu cầu Phần mềm (SRS)** này có các mục đích sau:

* **Xác định rõ phạm vi hệ thống**: Mô tả đầy đủ những gì hệ thống TOSS cần thực hiện trong Phase 1, bao gồm các chức năng được triển khai và các chức năng nằm ngoài phạm vi.
* **Làm cơ sở thống nhất giữa các bên**: Là tài liệu giao kèo giữa Bên đặt hàng (VNA), Bên phát triển (VTIT) và các bên liên quan về những gì hệ thống sẽ cung cấp.
* **Định hướng thiết kế và phát triển**: Cung cấp đặc tả đủ chi tiết để đội ngũ kỹ thuật (Dev, QA, DevOps) có thể thiết kế, xây dựng và kiểm thử hệ thống mà không cần diễn giải thêm.
* **Là cơ sở kiểm thử và nghiệm thu**: Mỗi yêu cầu trong tài liệu này là một tiêu chí có thể kiểm tra được (testable requirement), làm nền tảng cho kế hoạch kiểm thử và tiêu chí nghiệm thu hệ thống.

Tài liệu này **không** mô tả kiến trúc hệ thống chi tiết, không bao gồm kế hoạch triển khai hay vận hành.

## **Phạm vi tài liệu**

### ***1.2.1*****Đối tượng đọc tài liệu**

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

Hệ thống TOSS Phase 1 bao gồm các phân hệ sau:

| **Phân hệ** | **Mô tả** | **Trạng thái Phase 1** |
| --- | --- | --- |
| I. HOME — Đăng nhập & Quản lý phiên | Đăng nhập (Local/LDAP), quản lý phiên, đổi mật khẩu | ✅ Trong phạm vi |
| II. Phân hệ Quản lý Điều hành Bay (TOSS) | Flight Plan, CFP/NOTAM/WX, tải trọng, Performance Factor | ✅ Trong phạm vi |
| III. Phân hệ Danh mục dùng chung | Tàu bay, Sân bay, Chặng bay, Phi công, Tiếp viên, Carrier, Quốc gia, FIR, ULD, Đội bay | ✅ Trong phạm vi |
| Quản trị hệ thống | Quản lý người dùng, vai trò, nhóm người dùng, phân quyền, email, tham số hệ thống | ✅ Trong phạm vi |
| Báo cáo | Các báo cáo thống kê, xuất dữ liệu | ✅ Trong phạm vi |

## **Khái niệm, thuật ngữ**

[Phần này sẽ cung cấp các định nghĩa của tất cả các khái niệm, thuật ngữ… được sử dụng trong tài liệu Kiến trúc hệ thống.]

| STT | Thuật ngữ | Khái niệm |
| --- | --- | --- |
| 1 | TT/STT | Số thứ tự |
| 2 | VNA | Vietnam airlines |
| 3 | FIMS | OPERATION DATA LAKE/PLATFORM |
| 4 | CFP | Computerized Flight Plan |
| 5 | OFP |  |
| 6 | e-CFP/OFP | Electronic - Computerized Flight Plan |
| 7 | PIC | Pilot in Command |

# **THIẾT KẾ CHI TIẾT**

# ***I - PHÂN HỆ QUẢN LÝ ĐIỀU HÀNH BAY\_TOSS***

# **FLIGHT PLAN**

## **Danh sách Flight Plan**

| **Tên chức năng: Danh sách Flight Plan** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem danh sách Flight Plan |
| **Trigger** | Người dùng truy cập vào web TOSS => mở đến module Flight Plan |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền vào Flight Plan |
| **Hậu điều kiện** | Mở màn hình danh sách Flight Plan trên giao diện người dùng |

###

### **Sơ đồ nghiệp vụ**

![](data:image/png;base64...)

### **Mô tả sơ đồ nghiệp vụ**

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng đăng nhập vào hệ thống TOSS |
| Bước 2 | Người dùng truy cập module TOSS -> chọn Flight Dispatch -> chọn tab Flight Plan |
| Bước 3 | Hệ thống gọi API lấy danh sách Flight Plan và hiển thị dữ liệu trên màn hình |

### **Màn hình chức năng**

![](data:image/png;base64...)

###

### **Mô tả màn hình chức năng**

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| Danh sách Flight Plan:   * FE call API lấy lại danh sách Flight Plan mới nhất hiện tại để hiển thị trên giao diện người dùng * Các thông tin đồng bộ từ lịch bay (Netline ops++) về bao gồm:   + AC Registration   + Flt no   + DEP, ARR   + DATE   + ETD, ETA   + Type, Status * Dữ liệu flight plan đc lấy từ MO các thông tin đã bóc tách trên OFP và realease dầu của PIC kết hợp mapping với lịch bay netline gồm:  | Dispatcher  DSP Relesase Time  PIC  Pilot Release Time  Block Fuel  Fuel Order  Trip fuel  Trip Time | Cont %  Dest Altn  Dest Altn Fuel  Taxi time  Taxi fuel  Poss Extra  DOW  PLD  TOW | | --- | --- |  * Quy tắc sắp xếp mặc định:   + Hệ thống sẽ sắp xếp danh sách Flight Plan theo các chuyến bay legNo có ETD theo thứ tự tăng dần (tính từ đầu bảng đến cuối bảng) và gom nhóm theo EOFP của chuyến bay theo từng legno * Đơn vị bản ghi: mỗi dòng trên bảng ứng với 1 phiên bản OFP (OFP Revision). Một chuyến bay có N revision OFP sẽ hiển thị thành N dòng trên bảng. Bộ lọc 'Last Revision' thu gọn về 1 dòng/chuyến bay | | | | |
| 1 | Flight Plan List | Title |  | Fix cứng text “ Flight Plan List “ |
| 2 | ![](data:image/png;base64...) | Button |  | Click: refresh màn hình => FE call API lấy lại DS Flight Plan mới nhất hiện tại để hiển thị trên giao diện người dùng, nếu có bộ lọc thì giữ nguyên điều kiện lọc   * Trường hợp response API trả về thành công và có dữ liệu: hiển thị danh sách Flight Plan vào bảng bên dưới * Ngược lại: (API trả về rỗng hoặc lỗi) Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0** |
| 3 | ![](data:image/png;base64...) | Button |  | * Tên file tải về: [TOSS\_FlightPlan\_ddmmyyhhmm](https://docs.google.com/spreadsheets/d/1_or-Hx1EBsPhjyIcVMI5SF7mxZNy7-I8D5-N4ZOExdQ/edit?usp=drive_link) * Nội dung file tải về: tải theo cột dữ liệu view từ bảng danh sách Flight plan |
| 4 | OFP Rev | Textview |  | * Hiển thị số phiên bản (Revision) của Operational Flight Plan (OFP) * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 5 | AC REG | Textview |  | * Hiển thị số đăng ký (Aircraft Registration) của tàu bay thực hiện chuyến bay. * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 6 | FLT NO | Textview |  | * Hiển thị số hiệu chuyến bay (Flight Number). * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 7 | DEP | Textview |  | * Hiển thị mã sân bay khởi hành (Departure Airport) theo chuẩn IATA * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 8 | ARR | Textview |  | * Hiển thị mã sân bay đến (Arrival Airport) theo chuẩn IATA. * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 9 | DATE | Textview |  | * Hiển thị ngày khai thác (Operating Date) của chuyến bay theo định dạng dd/MM (ví dụ: 24 Jun). * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 10 | ETD | Textview |  | * Hiển thị giờ cất cánh dự kiến (Estimated Time of Departure) theo múi giờ UTC. * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 11 | ETA | Textview |  | * Hiển thị giờ hạ cánh dự kiến (Estimated Time of Arrival) theo múi giờ UTC. * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 12 | Type | Textview |  | * Hiển thị loại của chuyến bay * Loại chuyến bay đồng bộ Leg type, không lấy các Y Z N * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 13 | Status | Textview |  | * Hiển thị TagStatus theo dữ liệu API trả về   + Status=: ENR - đang bay   + Status=: ARR - đã đến   + Status=: BRD - boardinh   + Status = OUT - off-block |
| 14 | Dispatcher | Textview |  | * Hiển thị tên điều phái viên (Dispatcher) phụ trách phát hành Flight Plan. * DSP bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 15 | DSP Relesase Time | Textview |  | | * Hiển thị thời điểm Dispatcher thực hiện bấm Release OFP theo múi giờ UTC * Thời điểm Dispatcher bấm Release OFP. Định dạng HH:mm UTC. Để [ — ] nếu OFP chưa được Release * DSP Relesase time lấy theo thời điểm DSP bấm release OFP | | --- |  * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 16 | PIC | Textview |  | * Hiển thị tên Cơ trưởng của chuyến bay. * PIC bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 17 | Pilot Release Time | Textview |  | * Hiển thị thời điểm cơ trưởng xác nhận Flight Release (Pilot Release) theo múi giờ UTC. * Thời điểm PIC bấm Release OFP. Định dạng HH:mm UTC. Để [ — ] nếu OFP chưa được Release * Pilot Release Time bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 18 | Block Fuel | Textview |  | * Hiển thị tổng lượng nhiên liệu Block Fuel được lập cho chuyến bay. Đơn vị: KG * Block Fuel bóc tách từ file ofp   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 19 | Fuel Order | Textview |  | * Hiển thị lượng nhiên liệu được đặt (Fuel Order) cho chuyến bay. Đơn vị: KG * Fuel Order bóc tách từ file relase OFP mới nhất trên từng phiên bản OFP của PIC * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 20 | Trip fuel | Textview |  | * Hiển thị lượng nhiên liệu dự kiến tiêu hao trong toàn bộ chặng bay từ khởi hành đến điểm đến. Đơn vị: KG * Trip fuel bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 21 | Trip Time | Textview |  | * Hiển thị thời gian bay dự kiến của chặng bay theo định dạng HH:mm. * Trip time bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 22 | Cont % | Textview |  | * Hiển thị tỷ lệ nhiên liệu dự phòng (Contingency Fuel Percentage) được sử dụng để tính toán Flight Plan. * Cont % bóc tách từ file OFP * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 23 | Dest Altn | Textview |  | * Hiển thị mã sân bay dự bị (Destination Alternate Airport) của chuyến bay. * Dest Altn bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 24 | Dest Altn Fuel | Textview |  | * Hiển thị lượng nhiên liệu cần thiết để bay từ sân bay đích đến sân bay dự bị. * Dest Altn Fuel bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 25 | Taxi time | Textview |  | * Hiển thị thời gian taxi của chuyến bay. * Taxi time bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 26 | Taxi fuel | Textview |  | * Hiển thị lượng nhiên liệu tiêu hao trong quá trình taxi. Đơn vị : L * Taxi fuel bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 27 | Poss Extra | Textview |  | * Hiển thị lượng nhiên liệu bổ sung (Possible Extra Fuel) có thể mang thêm theo tính toán của Flight Plan. Đơn vị: L * Poss Extra bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 28 | DOW | Textview |  | * Hiển thị Dry Operating Weight của tàu bay (trọng lượng khai thác không bao gồm Payload và nhiên liệu). * DOW bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 29 | PLD | Textview |  | * Hiển thị trọng lượng Payload của chuyến bay (hành khách, hành lý và hàng hóa). * PLD bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 30 | TOW | Textview |  | * Hiển thị Take-off Weight (trọng lượng cất cánh) của tàu bay. * TOW bóc tách từ file OFP   ![](data:image/png;base64...)   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 31 | Action | Button |  | | * Hiển thị thao tác View Briefing Sheet cho từng Flight Plan. Khi người dùng nhấn vào liên kết, hệ thống mở màn hình Briefing Sheet tương ứng với Flight Plan được chọn để người dùng xem chi tiết thông tin briefing của chuyến bay : [Xem chi tiết Flight Plan](#_30y9z1lnluwm) | | --- | |
| 32 | Thanh scrollbar |  |  | * Hiển thị thanh cuộn ngang khi tổng chiều rộng của bảng vượt quá vùng hiển thị. * Cho phép người dùng kéo sang trái/phải để xem toàn bộ các cột dữ liệu mà không làm thay đổi vị trí các bản ghi. |
| 33 | Phân trang | Pagination |  | [Kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) |

## **Xem chi tiết Briefings sheet**

### **Sơ đồ nghiệp vụ**

![](data:image/png;base64...)

### **Mô tả sơ đồ nghiệp vụ**

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng đăng nhập vào hệ thống TOSS, truy cập module TOSS và chọn tab Flight Plan |
| Bước 2 | Hệ thống gọi API lấy danh sách Flight Plan và hiển thị dữ liệu trên màn hình |
| Bước 3 | Người dùng chọn một Flight Plan trong danh sách để xem thông tin chi tiết |
| Bước 4 | Hệ thống gọi API lấy thông tin chi tiết của Flight Plan được chọn và hiển thị dữ liệu trên màn hình |

### **Màn hình chức năng(chưa chốt)**

### **Mô tả màn hình chức năng**

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| 1 |  |  |  |  |
| 2 |  |  |  |  |
| 3 |  |  |  |  |
| 4 |  |  |  |  |

## **Tìm kiếm Flight Plan**

### **Sơ đồ nghiệp vụ**

![](data:image/png;base64...)

### **Mô tả sơ đồ nghiệp vụ**

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng đăng nhập vào hệ thống TOSS -> chọn Filght Dispatch và chọn tab **Flight Plan** |
| Bước 2 | Hệ thống gọi API lấy danh sách **Flight Plan** và hiển thị dữ liệu trên màn hình |
| Bước 3 | Người dùng nhập bất kỳ một hoặc nhiều thông tin tìm kiếm trên bộ lọc |
| Bước 4 | Trường hợp người dùng nhấn nút **Search**, hệ thống thực hiện tìm kiếm theo thông tin đã nhập |
| Bước 5 | Trường hợp người dùng muốn xóa điều kiện lọc, người dùng nhấn nút **Clear Filters** |
| Bước 6 | Sau khi người dùng nhấn **Search**, hệ thống gọi API tìm kiếm và hiển thị danh sách **Flight Plan** phù hợp với điều kiện đã nhập. Luồng kết thúc |
| Bước 7 | Sau khi người dùng nhấn **Clear Filters**, hệ thống xóa toàn bộ thông tin đã nhập trên bộ lọc. Luồng kết thúc . |

### **Màn hình chức năng**

![](data:image/png;base64...)

### **Mô tả màn hình chức năng**

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| 1 | Filter | Button |  | * Cho phép người dùng mở hoặc thu gọn khu vực bộ lọc tìm kiếm của màn hình Flight Plans. * Khi nhấn, hệ thống hiển thị hoặc ẩn các trường điều kiện tìm kiếm như Operating Date, Flt no, Aircraft Registration, DEP, ARR, ETD, ETA, Dispatcher, Status và các điều kiện lọc khác. * Trạng thái mở/đóng của bộ lọc được giữ nguyên cho đến khi người dùng thay đổi. |
| 2 | From Date | Date |  | * Placeholder: From Date * Trường để lọc: Tìm kiếm đúng theo [From Date] * Khi chưa chọn ngày thì hệ thống mặc định lấy ngày hiện tại. * Cho phép người dùng chọn ngày bắt đầu của khoảng thời gian tìm kiếm Flight Plan. Định dạng hiển thị dd/MM/yyyy. * Người dùng có thể chọn ngày từ Date Picker hoặc nhập trực tiếp theo đúng định dạng. Ngày bắt đầu không được lớn hơn ngày kết thúc. * Giá trị **From Date ≤ To Date**. |
| 3 | To Date | Date |  | * Placeholder: To Date * Trường để lọc: Tìm kiếm đúng theo [To Date] * Khi chưa chọn ngày thì hệ thống mặc định lấy ngày hiện tại. * Cho phép người dùng chọn ngày kết thúc của khoảng thời gian tìm kiếm Flight Plan. * Định dạng hiển thị **dd/MM/yyyy**. * Người dùng có thể chọn ngày từ Date Picker hoặc nhập trực tiếp theo đúng định dạng. Ngày kết thúc không được nhỏ hơn ngày bắt đầu. * Giá trị **To Date ≥ From Date** |
| 4 | Flt no | Text |  | * Placeholder: Flt no * Trường để lọc: Tìm kiếm gần đúng theo [Flt no] * Maxlength 10 ký tự * Chặn nếu nhập quá 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Hệ thống thực hiện **TRIM** khoảng trắng đầu/cuối , hỗ trợ tìm kiếm gần đúng, không phân biệt chữ hoa/chữ thường. |
| 5 | AC Reg | Text |  | * Placeholder: AC Reg * Trường để lọc: Tìm kiếm gần đúng theo [AC Reg] * Maxlength 10 ký tự * Chặn nếu nhập quá 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Hệ thống thực hiện **TRIM** khoảng trắng đầu/cuối , hỗ trợ tìm kiếm gần đúng, không phân biệt chữ hoa/chữ thường. |
| 6 | DEP | Dropdown |  | * Mặc định: All * Placeholder: DEP * Trường để lọc: Tìm kiếm chính xác theo [DEP] * Khi người dùng nhấn vào trường, hệ thống hiển thị danh sách các mã sân bay khởi hành (**DEP**) có trong dữ liệu. * Danh sách chỉ hiển thị các giá trị duy nhất (Distinct), không hiển thị các mã sân bay trùng lặp. * Chỉ cho phép chọn 1 giá trị |
| 7 | ARR | Dropdown |  | * Mặc định: All * Placeholder: ARR * Trường để lọc: Tìm kiếm chính xác theo [ARR] * Khi người dùng nhấn vào trường, hệ thống hiển thị danh sách các mã sân bay khởi hành (**ARR**) có trong dữ liệu. * Danh sách chỉ hiển thị các giá trị duy nhất (Distinct), không hiển thị các mã sân bay trùng lặp. * Chỉ cho phép chọn 1 giá trị |
| 8 | ETD | Datetime |  | * Placeholder: ETD * Trường để lọc: Tìm kiếm các chuyến bay có **ETD** nằm trong khoảng thời gian được chọn * Cho phép nhập hoặc chọn thời gian cất cánh dự kiến (Estimated Time of Departure) theo múi giờ UTC. * Định dạng dd/MM/yyyy HH:mm. |
| 9 | ETA | Time/Datetime |  | * Placeholder: ETA * Trường để lọc: Tìm kiếm các chuyến bay có **ETA** nằm trong khoảng thời gian được chọn * Cho phép nhập hoặc chọn thời gian hạ cánh dự kiến (Estimated Time of Arrival) theo múi giờ UTC. * Định dạng dd/MM/yyyy HH:mm |
| 10 | TYPE | Dropdown |  | * Mặc đinh: All * Placeholder: Type * Trường để lọc: Tìm kiếm đúng theo [Type] * Cho phép lựa chọn loại Flight Plan để tìm kiếm. * Chỉ cho phép chọn một giá trị. |
| 11 | STATUS | Dropdown |  | * Mặc đinh: All * Placeholder: Status * Trường để lọc: Tìm kiếm đúng theo [Status] * Cho phép lựa chọn trạng thái của Flight Plan. * Chỉ cho phép chọn một giá trị. * Giá trị gồm:   + Status=: ENR - đang bay   + Status=: ARR - đã đến   + Status=: BRD - boardinh   + Status = OUT - off-block |
| 12 | All Revision/ Last Revision | DDL |  | * Mặc đinh: All * Placeholder: All Revision/Last Revision * Trường để lọc: Tìm kiếm đúng theo [All Revision/Last Revision] * All Revision : Hiển thị tất cả phiên bản OFP của mỗi chuyến bay thỏa mãn điều kiện tìm kiếm. Khi **All Revision** được chọn thì **Last Revision** sẽ bỏ chọn. * Last Revision : Chỉ hiển thị phiên bản OFP mới nhất (số revision cao nhất) của mỗi chuyến bay . Khi **Last Revision** được chọn thì **All Revision** sẽ bỏ chọn. |
| 13 | Dispatcher | Text |  | * Placeholder: Dispatcher * Trường để lọc: Tìm kiếm gần đúng theo [Dispatcher] * Maxlength 50 ký tự * Chặn nếu nhập quá 50 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 50 ký tự đầu * Hệ thống thực hiện **TRIM** khoảng trắng đầu/cuối , hỗ trợ tìm kiếm gần đúng, không phân biệt chữ hoa/chữ thường. |
| 14 | Search | Button |  | * Thực hiện validate dữ liệu bộ lọc và gọi API tìm kiếm theo các điều kiện đã nhập. |
| 15 | Clear filter | Button |  | * Xóa toàn bộ giá trị trên bộ lọc, khôi phục giá trị mặc định và tải lại danh sách dữ liệu. |
| 16 | Table Setting | Button |  | * Cho phép người dùng cấu hình hiển thị bảng dữ liệu. * Khi nhấn, hệ thống mở popup **Table Setting** để người dùng lựa chọn các cột cần hiển thị/ẩn trên bảng Flight Plans, sắp xếp thứ tự hiển thị của bảng dữ liệu và lưu cấu hình hiển thị. * Cấu hình được áp dụng sau khi người dùng xác nhận và được lưu theo từng tài khoản người dùng. |

# **UPLOAD DOCUMENT**

## Danh sách tài liệu chung chuyến bay

| **Tên chức năng: Danh sách tài liệu chung chuyến bay** | |
| --- | --- |
| **Mục đích** | Quản lý danh sách, tìm kiếm, upload và xóa các tài liệu dùng chung chuyến bay theo khoảng hiệu lực. |
| **Trigger** | Click tab Tài liệu chung trong màn hình Upload Document. |
| **Tiền điều kiện** | Đăng nhập thành công và có quyền View Common Documents. |
| **Hậu điều kiện** | Hiển thị bảng danh sách tài liệu chung, các bộ lọc và nút thao tác. |

###

### Sơ đồ nghiệp vụ

![](data:image/png;base64...)

### Mô tả luồng nghiệp vụ

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng truy cập chức năng Flight Dispatch và chọn tab Tài liệu chung. |
| Bước 2 | Hệ thống gọi API lấy danh sách tài liệu chung mặc định. |
| Bước 3 | Hệ thống hiển thị danh sách tài liệu cùng các bộ lọc tìm kiếm trên màn hình. |
| Bước 4 | Người dùng nhập một hoặc nhiều điều kiện tìm kiếm (ví dụ: Tên, Ngày hiệu lực) và nhấn Tìm kiếm. |
| Bước 5 | Hệ thống kiểm tra kết quả tìm kiếm. Nếu có bản ghi phù hợp, hệ thống hiển thị danh sách tài liệu tương ứng. Nếu không có bản ghi phù hợp, hệ thống hiển thị thông báo "Không có kết quả nào liên quan". Luồng kết thúc. |

### Màn hình chức năng (tạm mockup)

![](data:image/png;base64...)

### Mô tả màn hình chức năng

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| Tìm kiếm tài liệu :  ![](data:image/png;base64...)   * Chức năng **Tìm kiếm** cho phép người dùng tra cứu nhanh danh sách tài liệu dựa trên các điều kiện lọc được cung cấp. * Người dùng nhập hoặc thay đổi một hoặc nhiều điều kiện tìm kiếm, sau đó nhấn **Enter** hoặc nút **Search**, hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về.   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0**. * Hệ thống sử dụng các tiêu chí tìm kiếm để lọc và hiển thị những tài liệu phù hợp, giúp người dùng dễ dàng xác định tài liệu cần tra cứu, giảm thời gian tìm kiếm khi số lượng tài liệu lớn. | | | | |
| 1 | Search | Textbox |  | * Cho phép người dùng nhập toàn bộ hoặc một phần tên tài liệu để tìm kiếm. * Cho phép nhập tối đa 100 ký tự. Khi đạt giới hạn, hệ thống không cho phép người dùng nhập thêm ký tự. * Tự động loại bỏ khoảng trắng thừa ở hai đầu chuỗi (TRIM) khi click tìm kiếm. * Hệ thống thực hiện tìm kiếm theo tên tài liệu phù hợp với giá trị được nhập. * Khi để trống, hệ thống không áp dụng điều kiện lọc theo tên tài liệu. |
| 2 | Hiệu lực tài liệu | Date time picker |  | * Cho phép người dùng lựa chọn khoảng thời gian hiệu lực của tài liệu. * Hệ thống chỉ hiển thị các tài liệu có thời gian hiệu lực thuộc khoảng thời gian được chọn. * Định dạng hiển thị: **dd/MM/yyyy HH:mm** -> **dd/MM/yyyy HH:mm** * Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu. |
| 3 | Search ![](data:image/png;base64...) | Button |  | * Khi người dùng nhấn nút **Search** , hệ thống kiểm tra tính hợp lệ của dữ liệu nhập (nếu có), sau đó thực hiện tìm kiếm theo các điều kiện đã nhập và cập nhật lại danh sách tài liệu. * Nếu không nhập điều kiện nào, hệ thống hiển thị toàn bộ dữ liệu mà người dùng có quyền truy cập |
| 4 | Clear Filter ![](data:image/png;base64...) | Button |  | * Cho phép người dùng xóa toàn bộ giá trị đã nhập hoặc đã chọn tại khu vực bộ lọc và đưa các trường tìm kiếm về trạng thái mặc định. * Khi người dùng nhấn nút **Clear Filter**, hệ thống xóa tất cả điều kiện tìm kiếm hiện tại và làm mới danh sách tài liệu theo trạng thái mặc định của màn hình. |
| Bảng danh sách tài liệu chung :  ![](data:image/png;base64...)   * Hiển thị danh sách các tài liệu đáp ứng điều kiện tìm kiếm hoặc bộ lọc được thiết lập. * Thông tin của mỗi tài liệu được trình bày dưới dạng bảng nhằm hỗ trợ người dùng theo dõi, tra cứu và quản lý dữ liệu. Bảng đồng thời hỗ trợ lựa chọn một hoặc nhiều bản ghi để thực hiện các thao tác nghiệp vụ được hệ thống cho phép. | | | | |
| 1 | Document name | Textview |  | * Hiển thị tên của tài liệu đã được tải lên hệ thống * Đặt theo định dạng chuẩn: **[Document Name\_Version]** * Click vào tên file để xem trực tiếp tài liệu |
| 3 | Valid From | Textview |  | * Cho phép người dùng nhập hoặc chọn thời điểm bắt đầu của khoảng thời gian hiệu lực (ETD) để tìm kiếm tài liệu. * Khi thực hiện tìm kiếm, hệ thống sử dụng giá trị này làm điều kiện lọc và chỉ hiển thị các tài liệu có thời gian **Hiệu lực từ** nằm trong phạm vi tìm kiếm được chỉ định. * Định dạng hiển thị: **dd/MM/yyyy HH:mm**.   + Giá trị được hiển thị theo định dạng **dd/MM/yyyy HH:mm** và được sử dụng để xác định khoảng thời gian tài liệu có hiệu lực.   + Khi để trống, hệ thống không áp dụng điều kiện lọc theo thời gian bắt đầu. |
| 4 | Valid To | Textview |  | * Cho phép người dùng nhập hoặc chọn thời điểm kết thúc của khoảng thời gian hiệu lực để tìm kiếm tài liệu. * Khi thực hiện tìm kiếm, hệ thống sử dụng giá trị này làm điều kiện lọc và chỉ hiển thị các tài liệu có thời gian **Hiệu lực đến** nằm trong phạm vi tìm kiếm được chỉ định. * Định dạng hiển thị: **dd/MM/yyyy HH:mm**.   + Giá trị được hiển thị theo định dạng **dd/MM/yyyy HH:mm** và được sử dụng để xác định khoảng thời gian tài liệu có hiệu lực.   + Khi để trống, hệ thống không áp dụng điều kiện lọc theo thời gian bắt đầu. |
| 5 | Upload by | Textview |  | * Hiển thị tên người dùng đã thực hiện tải tài liệu lên hệ thống. * Giá trị được lấy từ tài khoản đăng nhập tại thời điểm Upload và chỉ có mục đích tra cứu. |
| 6 | Upload date | Datetime |  | * Hiển thị ngày, giờ tài liệu được tải lên hệ thống. * Giá trị được hệ thống tự động ghi nhận khi thao tác Upload hoàn tất. * Định dạng hiển thị **dd/MM/yyyy HH:mm**. |
| 7 | REV | Text |  | * Hiển thị phiên bản (Revision) hiện tại của tài liệu, ví dụ: R01, R02, R03… * Giá trị được quản lý theo cơ chế phiên bản của hệ thống nhằm hỗ trợ theo dõi lịch sử cập nhật tài liệu. |
| 8 | Action | Icon Button |  | * Hiển thị các công cụ thao tác nhanh trực tiếp với tệp tin của dòng tương ứng. * **Icon Tải tài liệu ![](data:image/png;base64...)** :   + Tải tệp tin gốc về máy tính cá nhân của người dùng để lưu trữ hoặc xem.   + Nút này **luôn luôn được Enable** và khi click trình duyệt sẽ kích hoạt tiến trình download file từ máy chủ. * **Icon Thùng rác ![](data:image/png;base64...)** : * Xóa đơn lẻ tệp tin tài liệu chung khỏi hệ thống. * Luôn khả dụng, click để hiển thị popup xác nhận xóa tài liệu đó. |
| 9 | Phân trang | Pagination |  | [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.5b0ejgezpbny) |

## Danh sách tài liệu theo từng chuyến

| **Tên chức năng: Danh sách tài liệu theo từng chuyến** | |
| --- | --- |
| **Mục đích** | Cho phép user Danh sách tài liệu theo từng chuyến |
| **Trigger** | Người dùng truy cập vào web TOSS => mở đến module Flight Dispatch -> chọn Upload Document |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền vào Upload Document |
| **Hậu điều kiện** | Mở màn hình danh sách tài liệu từng chuyến bay |

###

### Sơ đồ nghiệp vụ

![](data:image/png;base64...)

### Mô tả luồng nghiệp vụ

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng truy cập module **Flight Dispatch ->** chọn Upload document và chọn tab **Tài liệu chuyến bay**. |
| Bước 2 | Hệ thống gọi API lấy danh sách tài liệu của các chuyến bay theo điều kiện mặc định và trả về kết quả. |
| Bước 3 | Hệ thống hiển thị danh sách tài liệu cùng các trường bộ lọc như **Flt No, AC Reg, DEP, ARR,...** để người dùng tra cứu. |
| Bước 4 | Người dùng nhập một hoặc nhiều điều kiện tìm kiếm trên bộ lọc. |
| Bước 5 | Hệ thống gọi API tìm kiếm theo các điều kiện đã nhập và hiển thị danh sách tài liệu theo từng chuyến bay phù hợp với kết quả trả về. |

### Màn hình chức năng

![](data:image/png;base64...)

### Mô tả màn hình chức năng

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| **Tìm kiếm:**  **![](data:image/png;base64...)**   * Trường hợp người dùng không nhập bất kỳ điều kiện tìm kiếm nào, hệ thống mặc định hiển thị toàn bộ dữ liệu. * Người dùng nhập hoặc thay đổi một hoặc nhiều điều kiện tìm kiếm, sau đó nhấn **Enter** hoặc nút **Search**, hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về.   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0**. | | | | |
| 1 | Ac Reg | Textbox |  | * Placeholder: AC Reg * Trường để lọc: Tìm kiếm gần đúng theo [AC Reg] * Maxlength 10 ký tự * Chặn nếu nhập quá 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Hệ thống thực hiện **TRIM** khoảng trắng đầu/cuối , hỗ trợ tìm kiếm gần đúng, không phân biệt chữ hoa/chữ thường. |
| 2 | Flt No | Textbox |  | * Placeholder: Flt no * Trường để lọc: Tìm kiếm gần đúng theo [Flt no] * Maxlength 10 ký tự * Chặn nếu nhập quá 10 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Hệ thống thực hiện **TRIM** khoảng trắng đầu/cuối , hỗ trợ tìm kiếm gần đúng, không phân biệt chữ hoa/chữ thường. |
| 3 | DEP | Textbox |  | * Mặc định: All * Placeholder: DEP * Trường để lọc: Tìm kiếm chính xác theo [DEP] * Chỉ cho phép chọn 1 giá trị |
| 4 | ARR | Textbox |  | * Mặc định: All * Placeholder: ARR * Trường để lọc: Tìm kiếm chính xác theo [ARR] * Chỉ cho phép chọn 1 giá trị |
| 5 | ETD | Datepicker |  | * Placeholder: DD/MM/YYYY * Trường để lọc: Tìm kiếm các chuyến bay có **ETD** nằm trong khoảng thời gian được chọn * Cho phép nhập hoặc chọn thời gian cất cánh dự kiến (Estimated Time of Departure) theo múi giờ UTC. * Định dạng dd/MM/yyyy HH:mm. |
| 6 | ETA | Datepicker |  | * Placeholder: DD/MM/YYYY * Trường để lọc: Tìm kiếm các chuyến bay có **ETA** nằm trong khoảng thời gian được chọn * Cho phép nhập hoặc chọn thời gian hạ cánh dự kiến (Estimated Time of Arrival) theo múi giờ UTC. * Định dạng dd/MM/yyyy HH:mm |
| 7 | Search | Button |  | * Thực hiện validate dữ liệu bộ lọc và gọi API tìm kiếm theo các điều kiện đã nhập. |
| 8 | Clear filter | Button |  | * Xóa toàn bộ giá trị trên bộ lọc, khôi phục giá trị mặc định và tải lại danh sách dữ liệu. |
| 9 | Filter | Button |  | * Cho phép người dùng mở hoặc thu gọn khu vực bộ lọc tìm kiếm của màn hình **Danh sách chuyến bay**. * Khi nhấn, hệ thống hiển thị hoặc ẩn các trường điều kiện tìm kiếm gồm: **AC Reg, FLT NO, DEP, ARR, ETD và ETA**. * Trạng thái mở/đóng của bộ lọc được giữ nguyên cho đến khi người dùng thay đổi. * Mặc định khi người dùng truy cập màn hình, khu vực bộ lọc được hiển thị. |
| **Danh sách tài liệu từng chuyến bay:**   * FE call API lấy lại danh sách tài liệu từng chuyến bay mới nhất hiện tại để hiển thị trên giao diện người dùng * Các thông tin đồng bộ từ lịch bay (Netline ops++) về bao gồm   + AC Registration   + Flt no   + DEP, ARR   + DATE   + ETD, ETA | | | | |
| 1 | ![](data:image/png;base64...) | Button |  | Click: refresh màn hình => FE call API lấy lại DS tài liệu chuyến bay mới nhất hiện tại để hiển thị trên giao diện người dùng, nếu có bộ lọc thì giữ nguyên điều kiện lọc   * Trường hợp response API trả về thành công và có dữ liệu: hiển thị danh sách tài liệu chuyến bay vào bảng bên dưới * Ngược lại: (API trả về rỗng hoặc lỗi) Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0** |
| 2 | AC REG | Textview |  | * Hiển thị số đăng ký (Aircraft Registration) của tàu bay thực hiện chuyến bay. * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 3 | FLT NO | Textview |  | * Hiển thị số hiệu chuyến bay (Flight Number). * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 4 | DEP | Textview |  | * Hiển thị mã sân bay khởi hành (Departure Airport) theo chuẩn IATA * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 5 | ARR | Textview |  | * Hiển thị mã sân bay đến (Arrival Airport) theo chuẩn IATA. * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 6 | Upload date | Textview |  | * Hiển thị ngày khai thác (Operating Date) của chuyến bay theo định dạng dd/MM (ví dụ: 24 Jun). * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 7 | ETD | Textview |  | * Hiển thị giờ cất cánh dự kiến (Estimated Time of Departure) theo múi giờ UTC. ví dụ: 01JUN26 11:11 * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 8 | ETA | Textview |  | * Hiển thị giờ hạ cánh dự kiến theo múi giờ UTC. ví dụ: 01JUN26 11:11 * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 9 | Document | Textview |  | * Hiển thị số lượng tài liệu đã được upload của từng chuyến bay. * Giá trị được lấy theo dữ liệu API trả về. * Nếu chuyến bay chưa có tài liệu, hệ thống hiển thị **0**. * Trường hợp API trả về rỗng/lỗi: để trống |
| 11 | Phân trang | Pagination |  | [Kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) |

## Upload tài liệu theo từng chuyến bay

| **Tên chức năng: Upload tài liệu theo từng chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Upload tài liệu theo từng chuyến bay chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => mở đến module Flight Dispatch -> chọn Upload Document |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền vào Upload Document |
| **Hậu điều kiện** | Upload tài liệu theo từng chuyến bay thành công |

###

### Sơ đồ nghiệp vụ

![](data:image/png;base64...)

### Mô tả luồng nghiệp vụ

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | Người dùng truy cập Upload Document và chọn tab Tài liệu chuyến bay. |
| 2 | Hệ thống gọi API lấy danh sách tài liệu theo từng chuyến bay theo điều kiện mặc định. |
| 3 | Hệ thống hiển thị danh sách tài liệu theo từng chuyến bay cùng các bộ lọc tìm kiếm trên màn hình. |
| 4 | Người dùng chọn chuyến bay cần upload tài liệu và nhấn nút **Choose file** tại bản ghi tương ứng. |
| 5 | Hệ thống hiển thị popup **Upload tài liệu**, cho phép người dùng chọn loại tài liệu và tải tệp lên. |
| 6 | Người dùng chọn **loại tài liệu**, chọn **tệp**. |
| 7 | Hệ thống kiểm tra tính hợp lệ của dữ liệu upload, định dạng tệp, dung lượng tệp.   * Chỉ cho phép upload các tệp có định dạng .pdf và .txt. Nếu định dạng tệp không đúng sẽ thông báo lỗi: “**The file format does not conform to the rules. Please try again.**” * Dung lượng tối đa của mỗi tệp là 30MB. Nếu dung lượng vượt quá sẽ có thông báo: “**The file you Upload exceeds the 30MB size limit.**” * Quy tắc đặt tên : Name\_Rev.pdf. Ví dụ: OFP\_R01.pdf Nếu tên tệp không đúng quy tắc, hệ thống hiển thị thông báo lỗi: “**Invalid file name. Please follow the naming convention.**” và không cho phép upload. * Nếu tệp upload trùng tên với tệp đã có trong danh sách, hệ thống kiểm tra phiên bản tài liệu. Trường hợp phiên bản của tệp upload nhỏ hơn hoặc bằng phiên bản hiện có, hệ thống chặn upload và hiển thị thông báo: **"The uploaded file version must be greater than the existing file version."** |
| 8 | Trường hợp tệp không hợp lệ, hệ thống không thực hiện upload và hiển thị **toast message** thông báo lỗi: “**Failed to upload document. Please try again**.” để người dùng kiểm tra và thực hiện lại. |
| 9 | Trường hợp dữ liệu hợp lệ, hệ thống tự động upload tài liệu và lưu thông tin tài liệu vào cơ sở dữ liệu, cập nhật danh sách tài liệu của chuyến bay và hiển thị **toast message** thông báo **"Upload document successfully."**. |

### Màn hình chức năng

![](data:image/png;base64...)![](data:image/png;base64...)![](data:image/png;base64...)

### Mô tả màn hình chức năng

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| 1 | Flight Information | Textview |  | * Hiển thị thông tin chuyến bay gồm: Flight No, Aircraft Registration, sân bay đi (DEP), sân bay đến (ARR), ngày khai thác, ETD và ETA. * Dữ liệu được lấy theo chuyến bay người dùng đã chọn. |
| 2 | Choose File | Button |  | * Khi người dùng nhấn Choose file, hệ thống mở hộp thoại để người dùng chọn tệp từ máy tính. * Cho phép người dùng kéo thả (Drag & Drop) hoặc nhấn Choose file để chọn tệp từ máy tính. * Chỉ cho phép upload 1 tài liệu 1 lần. * Sau khi người dùng chọn tệp thành công, hệ thống hiển thị tên tệp đã chọn. Khi chưa chọn tệp, hệ thống hiển thị thông báo "Chưa có file được chọn". * Chỉ cho phép upload các tệp có định dạng .pdf và .txt. Nếu định dạng tệp không đúng sẽ thông báo lỗi: “**The file format does not conform to the rules. Please try again.**” * Dung lượng tối đa của mỗi tệp là 30MB. Nếu dung lượng vượt quá sẽ có thông báo: “**The file you Upload exceeds the 30MB size limit.**” * Quy tắc đặt tên tệp được thực hiện theo quy định. Nếu tên tệp không đúng quy tắc, hệ thống hiển thị thông báo lỗi: “**Invalid file name. Please follow the naming convention.**” và không cho phép upload. * Nếu tệp upload trùng tên với tệp đã có trong danh sách, hệ thống kiểm tra phiên bản tài liệu. Trường hợp phiên bản của tệp upload nhỏ hơn hoặc bằng phiên bản hiện có, hệ thống chặn upload và hiển thị thông báo: **"The uploaded file version must be greater than the existing file version."** * Nếu tên tệp hợp lệ, hệ thống tiếp tục kiểm tra các điều kiện khác (định dạng, dung lượng...) và hệ thống tự động upload tài liệu:   + Trong quá trình upload, hệ thống hiển thị tên tệp, thanh tiến trình (Progress Bar) và tỷ lệ hoàn thành (%) để người dùng theo dõi trạng thái upload.   + Sau khi chọn file tải lên thành công, hệ thống hiển thị trạng thái thành công: “ File uploaded successfully .”. Người dùng có thể nhấn biểu tượng **Delete** để hủy tệp đã chọn và chọn tệp khác trước khi thực hiện upload   + Trường hợp chọn file tải lên thất bại, hệ thống hiển thị thông báo lỗi: “**File uploaded unsuccessfully** ” và cho phép người dùng có thể nhấn biểu tượng **Delete** để hủy tệp đã chọn và chọn tệp khác trước khi thực hiện upload. * Quy tắc đặt tên : Name\_Rev. Ví dụ: OFP\_R01.pdf * Khi nhấn button upload:   + Hệ thống lưu thông tin tài liệu vào cơ sở dữ liệu và tự động cập nhật danh sách tài liệu.   + Trường hợp upload thất bại, hệ thống hiển thị thông báo lỗi: “**File Upload unsuccessful**.” và cho phép người dùng thực hiện upload lại. |
| Bảng danh sách tài liệu chuyến bay:   * FE gọi API lấy danh sách tài liệu theo từng chuyến bay để hiển thị trên giao diện người dùng. * Mỗi bản ghi trong danh sách tương ứng với một phiên bản (Revision) của một tài liệu được upload cho chuyến bay. * Người dùng có thể upload tài liệu mới bằng cách kéo thả (Drag & Drop) hoặc nhấn Choose File để chọn tệp từ máy tính. * Sau khi người dùng chọn tệp hợp lệ, hệ thống tự động upload tài liệu, cập nhật danh sách và hiển thị kết quả mới nhất. * Danh sách hiển thị các thông tin của tài liệu gồm: Document Name, Upload Date, Rev,Active. * Quy tắc sắp xếp mặc định: Hệ thống sắp xếp danh sách theo Revision (Rev) theo thứ tự giảm dần (Revision mới nhất hiển thị trước). Trường hợp các tài liệu có cùng Revision, hệ thống sắp xếp theo Upload Date giảm dần (tài liệu được upload gần nhất hiển thị trước). | | | | |
| 3 | Document Name | Textview |  | * Hiển thị tên tài liệu đã upload. * Nếu tên tài liệu vượt quá chiều rộng cột, hiển thị dấu **"..."** và tooltip hiển thị đầy đủ tên tài liệu. * Trường hợp API trả về rỗng/lỗi: để trống. |
| 4 | Upload date | Textview |  | * Hiển thị thời điểm tài liệu được upload. * Định dạng hiển thị: **ddMM - HH:mm.** (Ví dụ: 24JUN • 11:11) * Trường hợp API trả về rỗng/lỗi: để trống. |
| 5 | Rev | Textview |  | * Hiển thị phiên bản (Revision) của tài liệu. * Sau khi người dùng upload tài liệu thành công, hệ thống **trích xuất phiên bản (Revision) từ tên tệp theo quy tắc đặt tên tài liệu**, lưu vào cơ sở dữ liệu và hiển thị trên danh sách tài liệu. * Giá trị được lấy theo dữ liệu API trả về. * Trường hợp API trả về rỗng/lỗi: để trống. |
| 6 | Action | Button |  | * Hiển thị icon Delete đối với từng tài liệu trong danh sách. * Khi người dùng nhấn icon Delete, hệ thống hiển thị popup xác nhận xóa tài liệu.   ![](data:image/png;base64...)   * Khi người dùng chọn Save, hệ thống gọi API xóa tài liệu, cập nhật lại danh sách tài liệu và hiển thị toast message: "**Document has been deleted successfully**.". * Khi người dùng chọn Cancel, hệ thống đóng popup, không thực hiện xóa tài liệu và quay lại màn hình danh sách tài liệu. |
| 7 | ![](data:image/png;base64...) | Button |  | * Hiển thị biểu tượng **Close (X)** tại góc trên bên phải của popup **Upload tài liệu theo từng chuyến bay**. * Khi người dùng nhấn nút **Close**, hệ thống đóng popup và quay về màn hình **Danh sách chuyến bay**. * Trường hợp đang có dữ liệu chưa được upload, hệ thống hủy thao tác upload và không lưu dữ liệu. |

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
| * Người dùng thực hiện upload tài liệu chung để áp dụng cho nhiều chuyến bay trong một khoảng thời gian hiệu lực. * Người dùng lựa chọn Khoảng ngày hiệu lực của tài liệu , Phiên bản và tệp cần upload. * Hệ thống chỉ cho phép upload tệp có định dạng .pdf và .txt, dung lượng tối đa 30MB. * Sau khi người dùng chọn tệp hợp lệ và nhấn Xác nhận Upload, hệ thống kiểm tra tính hợp lệ của dữ liệu (định dạng tệp, dung lượng tệp). * Trường hợp dữ liệu hợp lệ, hệ thống upload tài liệu, lưu thông tin vào hệ thống và áp dụng tài liệu cho tất cả các chuyến bay có ETD nằm trong khoảng thời gian hiệu lực đã khai báo. * Sau khi upload thành công:   + Hệ thống hiển thị thông báo thành công và tải lại danh sách tài liệu chung chuyến bay để hiển thị dữ liệu mới nhất.   + Hệ thống lưu thông tin tệp và hiển thị tên tệp upload tại cột Document Name trong danh sách tài liệu * Trường hợp dữ liệu không hợp lệ, hệ thống hiển thị thông báo lỗi tương ứng và không thực hiện upload. | | | | |
| 1 | Valid From | Datetime picker |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “DD/MM/YYYY HH:MM” * Bắt buộc chọn. * Cho phép người dùng chọn thời điểm bắt đầu hiệu lực của tài liệu. * Định dạng hiển thị: dd/MM/yyyy HH:mm. * Người dùng có thể nhập trực tiếp hoặc chọn từ DateTime Picker. * Giá trị Valid From không được lớn hơn Valid To. . * Action: Out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: “The **<field name>** field must not be empty.” |
| 2 | Valid To | Datetime picker |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “DD/MM/YYYY HH:MM ” * Bắt buộc nhập. * Cho phép người dùng chọn thời điểm kết thúc hiệu lực của tài liệu. * Định dạng hiển thị: dd/MM/yyyy HH:mm. * Người dùng có thể nhập trực tiếp hoặc chọn từ DateTime Picker. * Giá trị Valid To không được nhỏ hơn Valid From. * Tài liệu sau khi upload sẽ được áp dụng cho tất cả các chuyến bay có ETD nằm trong khoảng thời gian từ Valid From đến Valid To (bao gồm cả hai mốc thời gian). * Action: Out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: “The **<field name>** field must not be empty.” |
| 3 | Revision | Textview |  | * Mặc định: Để [—] khi chưa chọn tệp * Hiển thị phiên bản (Revision) của tài liệu khi đã chọn tệp. * Trường không cho phép người dùng nhập hoặc chỉnh sửa. * Sau khi người dùng chọn tệp, hệ thống kiểm tra tên tệp theo **Quy tắc đặt tên** và tự động trích xuất giá trị **Revision (Rev)** từ tên tệp để hiển thị tại trường này. * Nếu tên tệp không đúng quy tắc hệ thống thông báo lỗi: “**Invalid file name. Please follow the naming convention.”** * Nếu không trích xuất được Revision, hệ thống hiển thị thông báo lỗi: “**The file name does not contain a version. Please rename the file and try again.**” và không cho phép lưu tài liệu. |
| 4 | Choose File | Button |  | * Khi người dùng nhấn Choose file, hệ thống mở hộp thoại để người dùng chọn tệp từ máy tính. * Cho phép người dùng kéo thả (Drag & Drop) hoặc nhấn Choose file để chọn tệp từ máy tính. * Chỉ cho phép upload 1 tài liệu 1 lần. * Sau khi người dùng chọn tệp thành công, hệ thống hiển thị tên tệp đã chọn. Khi chưa chọn tệp, hệ thống hiển thị thông báo "No file has been selected.". * Chỉ cho phép upload các tệp có định dạng .pdf và .txt. Nếu định dạng tệp không đúng sẽ thông báo lỗi: “**The file format does not conform to the rules. Please try again.**” * Dung lượng tối đa của mỗi tệp là 30MB. Nếu dung lượng vượt quá sẽ có thông báo: “**The file you added exceeds the 30MB size limit.**” * Quy tắc đặt tên tệp được thực hiện theo quy định. Nếu tên tệp không đúng quy tắc, hệ thống hiển thị thông báo lỗi: “**Invalid file name. Please follow the naming convention.**” và không cho phép upload. * Nếu tệp upload trùng tên với tệp đã có trong danh sách, hệ thống kiểm tra phiên bản tài liệu. Trường hợp phiên bản của tệp upload nhỏ hơn hoặc bằng phiên bản hiện có, hệ thống chặn upload và hiển thị thông báo: **"The uploaded file version must be greater than the existing file version."** * Nếu tên tệp hợp lệ, hệ thống tiếp tục kiểm tra các điều kiện khác (định dạng, dung lượng...) và hệ thống upload tài liệu:   + Trong quá trình upload, hệ thống hiển thị tên tệp, thanh tiến trình (Progress Bar) và tỷ lệ hoàn thành (%) để người dùng theo dõi trạng thái upload.   + Sau khi chọn file tải lên thành công, hệ thống hiển thị trạng thái thành công: “ File uploaded successfully .”. Người dùng có thể nhấn biểu tượng **Delete** để hủy tệp đã chọn và chọn tệp khác trước khi thực hiện upload   + Trường hợp chọn file tải lên thất bại, hệ thống hiển thị thông báo lỗi: “**File uploaded unsuccessfully** ” và cho phép người dùng có thể nhấn biểu tượng **Delete** để hủy tệp đã chọn và chọn tệp khác trước khi thực hiện upload. * Quy tắc đặt tên : Name\_Rev. Ví dụ: OFP\_R01.pdf |
| 5 | Save | Button |  | * Khi người dùng nhấn Save, hệ thống thực hiện kiểm tra dữ liệu nhập. * Nếu dữ liệu hợp lệ, hệ thống upload tài liệu, lưu thông tin vào hệ thống và hiển thị thông báo "Document has been uploaded successfully.". * Nếu dữ liệu không hợp lệ, hệ thống hiển thị thông báo lỗi “File Upload unsuccessful.” và không thực hiện upload. |
| 6 | Cancel | Button |  | * Khi người dùng nhấn Cancel, hệ thống đóng popup và không lưu dữ liệu upload. Quay lại màn hình danh sách tài liệu chung |
| 7 | ![](data:image/png;base64...) | Button |  | * Hiển thị biểu tượng Close (X) tại góc trên bên phải của popup Upload tài liệu chung. * Khi người dùng nhấn nút Close, hệ thống đóng popup và quay về màn hình Danh sách tài liệu. * Trường hợp đang có dữ liệu chưa được upload, hệ thống hủy thao tác upload và không lưu dữ liệu. |

## Xoá tài liệu chung chuyến bay

| **Tên chức năng: Xoá tài liệu chung chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Xoá tài liệu chung chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => mở đến module Flight Dispatch -> chọn Upload Document |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền vào Upload Document |
| **Hậu điều kiện** | Xóa thành công 1 tài liệu khỏi danh sách |

###

### Sơ đồ nghiệp vụ

![](data:image/png;base64...)

### Mô tả luồng nghiệp vụ

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | Người dùng tích chọn một hoặc nhiều tài liệu cần xóa hoặc nhấn biểu tượng **Xóa** tại dòng tài liệu tương ứng. |
| 2 | Hệ thống hiển thị popup xác nhận xóa tài liệu. Nếu người dùng chọn **Hủy**, popup được đóng và không thực hiện xóa. Nếu người dùng chọn **Xác nhận**, hệ thống tiếp tục xử lý xóa tài liệu. |
| 3 | Hệ thống xóa tệp khỏi sách, cập nhật dữ liệu trong cơ sở dữ liệu và ghi log audit cho thao tác xóa. |
| 4 | Hệ thống hiển thị thông báo (toast) **"Xóa tài liệu thành công"**. Luồng kết thúc |

### Màn hình chức năng

![](data:image/png;base64...)

### Mô tả màn hình chức năng

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| 1 | Icon cảnh báo | Icon |  | * Hiển thị biểu tượng cảnh báo nhằm thông báo cho người dùng đây là thao tác có ảnh hưởng đến dữ liệu và yêu cầu xác nhận trước khi thực hiện. |
| 2 | Nút đóng | Button |  | * Cho phép người dùng đóng hộp thoại xác nhận. * Khi nhấn, hệ thống đóng popup và hủy thao tác xóa, không thực hiện bất kỳ thay đổi nào đối với dữ liệu. |
| 3 | Tiêu đề xác nhận | Label |  | * Hiển thị thông điệp xác nhận xóa tài liệu theo định dạng: **"Are you sure you want to delete [Document Name\_Version]? "**   + Trong đó **[Document Name\_Version]** được thay thế bằng tên và phiên bản của tài liệu được chọn. |
| 4 | Nội dung cảnh báo | Label |  | * Hiển thị thông báo cho người dùng biết rằng sau khi tài liệu bị xóa sẽ không còn xuất hiện trong danh sách tài liệu. Nội dung: **"Please note that after deletion, you will not be able to access this document. "** |
| 5 | Nút Cancel (Hủy) | Button |  | * Cho phép người dùng hủy thao tác xóa. * Khi nhấn, hệ thống đóng hộp thoại xác nhận và không thực hiện xóa tài liệu |
| 6 | Nút Save (Xác nhận ) | Button |  | * Cho phép người dùng xác nhận thao tác xóa tài liệu. * Khi nhấn, hệ thống thực hiện xóa tài liệu khỏi hệ thống. * Nếu xóa thành công, hệ thống đóng hộp thoại, cập nhật lại danh sách tài liệu và hiển thị thông báo thành công (nếu có). * Nếu xảy ra lỗi trong quá trình xóa, hệ thống giữ nguyên dữ liệu và hiển thị thông báo lỗi phù hợp. |