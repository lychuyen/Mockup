---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Dispatch"
feature_id: "TOSS.FD.FLIGHT_DOCS_LIST"
feature_name: "Danh sách tài liệu theo từng chuyến"
group: "Upload Document"
---

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
| **Tìm kiếm:**  **![](data:image/png;base64...)**   * Trường hợp người dùng không nhập bất kỳ điều kiện tìm kiếm nào, hệ thống mặc định hiển thị toàn bộ dữ liệu. * Người dùng nhập hoặc thay đổi một hoặc nhiều điều kiện tìm kiếm, sau đó nhấn **Enter** hoặc nút **Search**, hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về.   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0**. | | | | |
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

---

> **Nguồn gốc (truy vết):** Tách trung thực từ `sec-08-danh-sach-tai-lieu-theo-tung-chuyen.md` — mảnh phân rã `TOSS.FD.ALL.FD.v0.1.md` (SRS Flight Dispatch v0.1, người soạn VNA/VTIT, nguồn Google Drive live pull 2026-07-10) — ứng với dòng **#5** bảng §1 trong [CATALOG.md](CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0). Lưu ý cờ đã ghi tại CATALOG.md §2.3/§2.4: bảng danh sách nhảy STT 9 → 11 (thiếu STT 10); cột "Upload date" (STT 6) mô tả nội dung là Operating Date [Cần làm rõ].
