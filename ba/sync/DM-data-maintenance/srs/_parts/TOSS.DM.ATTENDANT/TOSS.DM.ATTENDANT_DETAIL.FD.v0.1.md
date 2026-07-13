---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.ATTENDANT_DETAIL"
feature_name: "Xem chi tiết Tiếp viên — Thông tin Tiếp viên"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xem chi tiết Tiếp viên_Thông tin Tiếp viên

| **Tên chức năng: Xem chi tiết Tiếp viên_Thông tin Tiếp viên** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem chi tiết Tiếp viên_Thông tin Tiếp viên |
| **Trigger** | Người dùng truy cập vào web FIMS => mở đến module Danh mục/Danh mục Tiếp viên => click vào 1 bản ghi bất kỳ |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Danh mục Tiếp viên |
| **Hậu điều kiện** | Mở màn hình Xem chi tiết Tiếp viên_Thông tin Tiếp viên trên giao diện người dùng |

#### Sơ đồ luồng hệ thống

![Ảnh minh họa](../_images/TOSS.DM.ATTENDANT_DETAIL.img01.png)

```mermaid
flowchart TD
    subgraph SG1["User"]
        S0(("●"))
        A1["(1) Truy cập web ODP =&gt; chọn Danh mục Tiếp viên"]
        A4["(4) Click vào 1 bản ghi trên danh sách"]
    end
    subgraph SG2["ODP_Danh mục Tiếp viên"]
        A2["(2) Hệ thống call API lấy dữ liệu"]
        A3["(3) Hiển thị màn hình danh sách Tiếp viên"]
        A5["(5) Hiển thị màn hình Xem chi tiết Tiếp viên_Thông tin Tiếp viên"]
        E0((("●")))
    end
    S0 --> A1
    A1 --> A2
    A2 --> A3
    A3 --> A4
    A4 --> A5
    A5 --> E0
```

1. Sơ đồ luồng nghiệp vụ

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
|  | Truy cập web FIMS => mở đến module Danh mục/Danh mục Tiếp viên |
|  | Hệ thống call API xuống BE lấy [danh sách Tiếp viên](TOSS.DM.ATTENDANT_LIST.FD.v0.1.md) |
|  | Hiển thị [danh sách Tiếp viên](TOSS.DM.ATTENDANT_LIST.FD.v0.1.md) trên giao diện người dùng |
|  | User click vào 1 bản ghi trên danh sách |
|  | Hiển thị màn hình Xem chi tiết Tiếp viên, focus tab Thông tin Tiếp viên |

#### Màn hình chức năng

![Ảnh minh họa](../_images/TOSS.DM.ATTENDANT_DETAIL.img02.png)

1. Giao diện Thông tin chi tiết_Thông tin Tiếp viên

#### Mô tả chi tiết màn hình danh sách

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
|  | ~~Thông tin chi tiết~~  Details | Title |  | * Fix cứng text “~~Thông tin chi tiết~~ Details” * Icon back ![Ảnh minh họa](../_images/TOSS.DM.ATTENDANT_DETAIL.img03.png) => click > hệ thống xử lý quay về và refresh màn hình [Danh sách Tiếp viên](TOSS.DM.ATTENDANT_LIST.FD.v0.1.md) |
|  | ![Ảnh minh họa](../_images/TOSS.DM.ATTENDANT_DETAIL.img04.png) | Button | btn_sync_aves | * Click button → Hệ thống call API đồng bộ thông tin TV từ hệ thống AVES, trong đó   Input: Crewcode và typeUser=TV đang xem  Output: AVES trả thông tin của TV lấy từ AVES theo Crewcode, hệ thống update thông tin cho TV và Người dùng nhóm TV/[Danh sách người dùng](../../../../SA-system-admin/srs/_parts/TOSS.SA.USER/TOSS.SA.USER_LIST.FD.v0.1.md) tương ứng (nếu có) |
|  | ![Ảnh minh họa](../_images/TOSS.DM.ATTENDANT_DETAIL.img05.png) | Button | btn_edit | * Click button → mở màn hình popup [Sửa thông tin Tiếp viên thủ công](TOSS.DM.ATTENDANT_EDIT_MANUAL.FD.v0.1.md) |
|  | ~~Thông tin Tiếp viên~~  Cabin Crew Information | Tab |  | * Default focus tab này khi mở xem Chi tiết TV * Highlight vàng tab khi được focus đến |
|  | ~~Lịch sử~~  History | Tab |  | * Click tab: mở màn hình xem Lịch sử cập nhật TV * Highlight vàng tab khi được focus đến |
|  | Avatar |  | flight_attendant_avatar/flightAttendantAvatar | * Hiển thị [flightAttendantAvatar] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | ~~Họ và tên~~  Full name | Textview | full_name/fullName | * Hiển thị [fullName] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | HRMS code | Textview | hrms_code/hrmsCode | * Hiển thị [hrmsCode] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Crew code (code AVES) | Textview | crew_code/crewCode | * Hiển thị [crewCode] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | ~~Số thẻ ngành~~  Industry Card Number | Textview | industry_card_number/industryCardNumber | * Hiển thị [industryCardNumber] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | ~~Đội tàu bay~~  Fleet | Textview | fleet/rank | * Hiển thị [rank] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | ~~Chức vụ~~  Position | Textview | position | * Hiển thị [position] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Status | Tagstatus | active_status | * Hiển thị TagStatus * Hệ thống check theo **Crew code** mapping với **Người dùng nhóm Tiếp viên**, lấy và hiển thị theo trạng thái của người dùng tương ứng   + Status=Active: Tag màu xanh lá   + Status=Inactive: Tag màu xám * Trường hợp có > 1 **Người dùng nhóm Tiếp viên** cùng **Crew code** với **Tiếp viên** này =>   + nếu Ǝ Người dùng có trạng thái = Đang hoạt động => hiển thị theo trạng thái = Đang hoạt động   + nếu tất cả Người dùng đều có trạng thái = Ngừng hoạt động => hiển thị theo trạng thái = Ngừng hoạt động * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Phone number | Textview | phone_number/phoneNumber | * Hiển thị [phoneNumber] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Email | Textview | email | * Hiển thị [email] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Tìm kiếm   * Click vào dòng dưới tiêu đề các cột để chọn lọc, tìm kiếm thông tin theo dữ liệu tại cột tương ứng. * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => click Enter/out focus box => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0** | | | |
|  | Aircraft | Textbox [0;20] | aircraft_type/aircraftType | * Trường để lọc: Tìm kiếm gần đúng theo [aircraftType] * Maxlength 20 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 20 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Aircraft Registration Number | Textbox [0;20] | aircraft_registration_number/aircraftRegistrationNumber | * Trường để lọc: Tìm kiếm gần đúng theo [aircraftRegistrationNumber] * Maxlength 20 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 20 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Flight Number | Textbox [0;20] | flight_number/flightNumber | * Trường để lọc: Tìm kiếm gần đúng theo [flightNumber] * Maxlength 20 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 20 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Takeoff Time | DateTimePicker | takeoff_time/takeoffTime | * Trường để lọc: Tìm kiếm gần đúng theo [takeoffTime] * Định dạng dd/mm/yyyy - dd/mm/yyyy * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập |
|  | Landing Time | DateTimePicker | landing_time/landingTime | * Trường để lọc: Tìm kiếm gần đúng theo [landingTime] * Định dạng dd/mm/yyyy - dd/mm/yyyy * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập |
|  | Departure Airport | Textbox [0;20] | departure_airport/departureAirport | * Trường để lọc: Tìm kiếm gần đúng theo [departureAirport] * Maxlength 20 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 20 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Arrival Airport | Textbox [0;20] | arrival_airport/arrivalAirport | * Trường để lọc: Tìm kiếm gần đúng theo [arrivalAirport] * Maxlength 20 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 20 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Status | DDL [Complete, Flying, Not yet taken off] | state | * Trường để lọc: Tìm kiếm chính xác theo [state] * Giá trị chọn lọc:   + Complete   + Flying   + Not yet taken off |
|  | Chi tiết danh sách   * Hệ thống call API lấy dữ liệu và hiển thị thông tin danh sách hành trình bay của TV (trong vòng 1 tháng hiện tại) theo điều kiện:   + [Takeoff Time] - [Landing Time] sớm nhất trong ngày   + Hiển thị 7 bản ghi/ 1 trang   + Đầu tiên là các chuyến bay của Day -1, đến chuyến bay Day+1   + Sắp xếp theo thực tự từ thời gian cất cánh gần nhất * Thông tin được đồng bộ từ hệ thống Nestline với tần suất 5 phút/ lần | | | |
|  | TT | Textview |  | * Hiển thị STT của các bản ghi theo thứ tự tăng dần từ 1 |
|  | Aircraft | Textview | aircraft_type/aircraftType | * Hiển thị [aircraftType] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Aircraft Registration Number | Textview | aircraft_registration_number/aircraftRegistrationNumber | * Hiển thị [aircraftRegistrationNumber] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Flight Number | Textview | flight_number/flightNumber | * Hiển thị [flightNumber] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Takeoff Time | Textview | takeoff_time/takeoffTime | * Hiển thị [takeoffTime] theo dữ liệu API trả về, nếu:   + Status=Not yet taken off: Lấy giờ dự kiến   + Status=Flying: Lấy giờ dự kiến   + Status=Complete: Lấy giờ thực tế * Định dạng dd/mm/yyyy - hh:mm * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Landing Time | Textview | landing_time/landingTime | * Hiển thị [landingTime] theo dữ liệu API trả về, nếu:   + Status=Not yet taken off: Lấy giờ dự kiến   + Status=Flying: Lấy giờ dự kiến   + Status=Complete: Lấy giờ thực tế * Định dạng dd/mm/yyyy - hh:mm * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Departure Airport | Textview | departure_airport/departureAirport | * Hiển thị [departureAirport] theo dữ liệu API trả về, nếu:   + Status=Not yet taken off: Lấy sân dự kiến   + Status=Flying: Lấy sân dự kiến   + Status=Complete: Lấy sân thực tế * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Arrival Airport | Textview | arrival_airport/arrivalAirport | * Hiển thị [arrivalAirport] theo dữ liệu API trả về, nếu:   + Status=Not yet taken off: Lấy sân dự kiến   + Status=Flying: Lấy sân dự kiến   + Status=Complete: Lấy sân thực tế * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Status | Textview | state | * Hiển thị TagState theo dữ liệu API trả về   + State=Not yet taken off: Tag màu cam   + State=Flying: Tag màu xanh lam   + State=Complete: Tag màu xanh lá * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Chân trang | Pagination |  | * [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) |

---

*Nguồn: tách trung thực từ `sec-23-quan-ly-danh-muc-tiep-vien.md`, mục "Xem chi tiết Tiếp viên — Thông tin Tiếp viên" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#13** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
