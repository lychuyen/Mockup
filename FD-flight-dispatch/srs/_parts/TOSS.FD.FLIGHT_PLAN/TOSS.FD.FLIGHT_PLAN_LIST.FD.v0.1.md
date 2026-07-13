---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Dispatch"
feature_id: "TOSS.FD.FLIGHT_PLAN_LIST"
feature_name: "Danh sách Flight Plan"
group: "Flight Plan"
---

## **Danh sách Flight Plan**

| **Tên chức năng: Danh sách Flight Plan** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem danh sách Flight Plan |
| **Trigger** | Người dùng truy cập vào web TOSS => mở đến module Flight Plan |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền vào Flight Plan |
| **Hậu điều kiện** | Mở màn hình danh sách Flight Plan trên giao diện người dùng |

### **Sơ đồ nghiệp vụ**

*(hình ảnh minh họa — xem file gốc/Google Doc)*

### **Mô tả sơ đồ nghiệp vụ**

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng đăng nhập vào hệ thống TOSS |
| Bước 2 | Người dùng truy cập module TOSS -> chọn Flight Dispatch -> chọn tab Flight Plan |
| Bước 3 | Hệ thống gọi API lấy danh sách Flight Plan và hiển thị dữ liệu trên màn hình |

### **Màn hình chức năng**

*(hình ảnh minh họa — xem file gốc/Google Doc)*

### **Mô tả màn hình chức năng**

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| Danh sách Flight Plan:   * FE call API lấy lại danh sách Flight Plan mới nhất hiện tại để hiển thị trên giao diện người dùng * Các thông tin đồng bộ từ lịch bay (Netline ops++) về bao gồm:   + AC Registration   + Flt no   + DEP, ARR   + DATE   + ETD, ETA   + Type, Status * Dữ liệu flight plan đc lấy từ MO các thông tin đã bóc tách trên OFP và realease dầu của PIC kết hợp mapping với lịch bay netline gồm:  | Dispatcher  DSP Relesase Time  PIC  Pilot Release Time  Block Fuel  Fuel Order  Trip fuel  Trip Time | Cont %  Dest Altn  Dest Altn Fuel  Taxi time  Taxi fuel  Poss Extra  DOW  PLD  TOW | | --- | --- |  * Quy tắc sắp xếp mặc định:   + Hệ thống sẽ sắp xếp danh sách Flight Plan theo các chuyến bay legNo có ETD theo thứ tự tăng dần (tính từ đầu bảng đến cuối bảng) và gom nhóm theo EOFP của chuyến bay theo từng legno * Đơn vị bản ghi: mỗi dòng trên bảng ứng với 1 phiên bản OFP (OFP Revision). Một chuyến bay có N revision OFP sẽ hiển thị thành N dòng trên bảng. Bộ lọc 'Last Revision' thu gọn về 1 dòng/chuyến bay | | | | |
| 1 | Flight Plan List | Title |  | Fix cứng text “ Flight Plan List “ |
| 2 | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | Click: refresh màn hình => FE call API lấy lại DS Flight Plan mới nhất hiện tại để hiển thị trên giao diện người dùng, nếu có bộ lọc thì giữ nguyên điều kiện lọc   * Trường hợp response API trả về thành công và có dữ liệu: hiển thị danh sách Flight Plan vào bảng bên dưới * Ngược lại: (API trả về rỗng hoặc lỗi) Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0** |
| 3 | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Tên file tải về: [TOSS_FlightPlan_ddmmyyhhmm](https://docs.google.com/spreadsheets/d/1_or-Hx1EBsPhjyIcVMI5SF7mxZNy7-I8D5-N4ZOExdQ/edit?usp=drive_link) * Nội dung file tải về: tải theo cột dữ liệu view từ bảng danh sách Flight plan |
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
| 14 | Dispatcher | Textview |  | * Hiển thị tên điều phái viên (Dispatcher) phụ trách phát hành Flight Plan. * DSP bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 15 | DSP Relesase Time | Textview |  | | * Hiển thị thời điểm Dispatcher thực hiện bấm Release OFP theo múi giờ UTC * Thời điểm Dispatcher bấm Release OFP. Định dạng HH:mm UTC. Để [ — ] nếu OFP chưa được Release * DSP Relesase time lấy theo thời điểm DSP bấm release OFP | | --- |  * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 16 | PIC | Textview |  | * Hiển thị tên Cơ trưởng của chuyến bay. * PIC bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 17 | Pilot Release Time | Textview |  | * Hiển thị thời điểm cơ trưởng xác nhận Flight Release (Pilot Release) theo múi giờ UTC. * Thời điểm PIC bấm Release OFP. Định dạng HH:mm UTC. Để [ — ] nếu OFP chưa được Release * Pilot Release Time bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 18 | Block Fuel | Textview |  | * Hiển thị tổng lượng nhiên liệu Block Fuel được lập cho chuyến bay. Đơn vị: KG * Block Fuel bóc tách từ file ofp   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 19 | Fuel Order | Textview |  | * Hiển thị lượng nhiên liệu được đặt (Fuel Order) cho chuyến bay. Đơn vị: KG * Fuel Order bóc tách từ file relase OFP mới nhất trên từng phiên bản OFP của PIC * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 20 | Trip fuel | Textview |  | * Hiển thị lượng nhiên liệu dự kiến tiêu hao trong toàn bộ chặng bay từ khởi hành đến điểm đến. Đơn vị: KG * Trip fuel bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 21 | Trip Time | Textview |  | * Hiển thị thời gian bay dự kiến của chặng bay theo định dạng HH:mm. * Trip time bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 22 | Cont % | Textview |  | * Hiển thị tỷ lệ nhiên liệu dự phòng (Contingency Fuel Percentage) được sử dụng để tính toán Flight Plan. * Cont % bóc tách từ file OFP * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 23 | Dest Altn | Textview |  | * Hiển thị mã sân bay dự bị (Destination Alternate Airport) của chuyến bay. * Dest Altn bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 24 | Dest Altn Fuel | Textview |  | * Hiển thị lượng nhiên liệu cần thiết để bay từ sân bay đích đến sân bay dự bị. * Dest Altn Fuel bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 25 | Taxi time | Textview |  | * Hiển thị thời gian taxi của chuyến bay. * Taxi time bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 26 | Taxi fuel | Textview |  | * Hiển thị lượng nhiên liệu tiêu hao trong quá trình taxi. Đơn vị : L * Taxi fuel bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 27 | Poss Extra | Textview |  | * Hiển thị lượng nhiên liệu bổ sung (Possible Extra Fuel) có thể mang thêm theo tính toán của Flight Plan. Đơn vị: L * Poss Extra bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 28 | DOW | Textview |  | * Hiển thị Dry Operating Weight của tàu bay (trọng lượng khai thác không bao gồm Payload và nhiên liệu). * DOW bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 29 | PLD | Textview |  | * Hiển thị trọng lượng Payload của chuyến bay (hành khách, hành lý và hàng hóa). * PLD bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 30 | TOW | Textview |  | * Hiển thị Take-off Weight (trọng lượng cất cánh) của tàu bay. * TOW bóc tách từ file OFP   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 31 | Action | Button |  | | * Hiển thị thao tác View Briefing Sheet cho từng Flight Plan. Khi người dùng nhấn vào liên kết, hệ thống mở màn hình Briefing Sheet tương ứng với Flight Plan được chọn để người dùng xem chi tiết thông tin briefing của chuyến bay : Xem chi tiết Flight Plan | | --- | |
| 32 | Thanh scrollbar |  |  | * Hiển thị thanh cuộn ngang khi tổng chiều rộng của bảng vượt quá vùng hiển thị. * Cho phép người dùng kéo sang trái/phải để xem toàn bộ các cột dữ liệu mà không làm thay đổi vị trí các bản ghi. |
| 33 | Phân trang | Pagination |  | Theo [Kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) ngoại trừ số bản ghi hiển thị mặc định: là **25 bản ghi/1 trang (thay vì 10 như kịch bản chung)** |

---

> **Nguồn gốc (truy vết):** Tách trung thực từ `sec-04-danh-sach-flight-plan.md` — mảnh phân rã `VNA.TOSS_SRS_Flight Dispatch_v0.1.md` (SRS Flight Dispatch v0.1, người soạn VNA/VTIT, nguồn Google Drive live pull 2026-07-10) — ứng với dòng **#1** bảng §1 trong [CATALOG.md](../CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0).
>
> **Đồng bộ lại 2026-07-10** theo bản pull Google Doc **phiên bản 1577** (sửa 2026-07-10 bởi tohuonggiang02; bản phân rã trước theo phiên bản 1450): cập nhật quy tắc phân trang (STT 33) — mặc định **25 bản ghi/1 trang** thay vì 10 như kịch bản chung. Các nội dung còn lại không thay đổi.
