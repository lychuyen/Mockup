---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.CARRIER_HISTORY"
feature_name: "Xem lịch sử Carrier"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xem lịch sử Carrier

| **Tên chức năng: Xem lịch sử Carrier** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem lịch sửCarrier |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Danh mục => Nhấn chọn Carrier => nhấn vào Xem lịch sửCarrier  Hoặc tại màn [Danh sách Carrier](TOSS.DM.CARRIER_LIST.FD.v0.1.md)=> Nhấn chọn icon “Sửa” tại đơn vị muốn chỉnh sửa => Click “Xem lịch sử”  Hoặc tại màn hình [Xem chi tiết Carrier](TOSS.DM.CARRIER_DETAIL.FD.v0.1.md)=> Click button “Xem lịch sử” |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Carrier |
| **Hậu điều kiện** | Màn hình Xem lịch sửCarrier |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng truy cập vào web FIMS => nhấn phân hệ Danh mục => Carrier => Hiển thị [danh sách Carrier](TOSS.DM.CARRIER_LIST.FD.v0.1.md) |
| Bước 2 | User click icon **Xem lịch sử Carrier** |
| Bước 3 | Hệ thống call API lấy dữ liệu lịch sử |
| Bước 4 | Mở màn hình Xem lịch sử Carrier |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện Xem lịch sử Carrier

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **Thông tin chung** | | | | |
|  | Download file | Button |  | * Click vào => hệ thống thực hiện tạo file .xlsx để tải lịch sử Carrier * Tên file tải về: FIMS\_History\_Carrier\_ddmmyyhhss * Nội dung file tải về: tải theo cột dữ liệu view từ bảng Danh mục Carrier |
| **Lịch sử Carrier** | | | | |
| * **Tìm kiếm**   **![](data:image/png;base64...)**   * + Click vào dòng dưới tiêu đề các cột để chọn lọc, tìm kiếm thông tin theo dữ liệu tại cột tương ứng.   + Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó   + Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/click Enter/out focus box => hệ thống thực hiện:     - Reload dữ liệu table phù hợp với bộ lọc     - Set current page=1   + Hiển thị kết quả tìm kiếm:     - Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về     - Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | |
|  | ~~Thời gian cập nhật~~  Update Time | Datepicker |  | * Trường để lọc: Tìm kiếm chính xác theo [~~Thời gian cập nhật~~ Update Time] (không tìm theo giờ) * Định dạng ngày dd/mm/yyyy |
|  | ~~Nghiệp vụ ghi nhận~~  Action | Dropdown list |  | * Trường để lọc: Tìm kiếm chính xác theo [Nghiệp vụ ghi nhận] * Các giá trị tìm kiếm bao gồm: [Thêm mới Carrier](TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md) /[Sửa Carrier](TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md) * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập |
|  | ~~Chi tiết cập nhật~~  Update Details | Textbox |  | * Trường để lọc: Tìm kiếm gần đúng theo [Chi tiết cập nhật] * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | ~~Người cập nhật trạng thái~~  Updated by | Combobox |  | ● Trường để lọc: Tìm kiếm chính xác theo [Người cập nhật]  ● Các giá trị tìm kiếm bao gồm: Danh sách user được phần quyền thao tác trên phân hệ Danh mục Carrier/MO Plus & EDM  ● Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập |
| **Bảng log** | | | | |
|  | TT | Textview |  | * Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo * Danh sách hiển thị tối đa 6 dòng dữ liệu |
|  | Update Time | Textview |  | * Hiển thị thời gian cập nhật dữ liệu * Định dạng dd/mm/yyyy hh:mm |
|  | Recognition of operations | Textview |  | * Hiển thị nghiệp vụ ghi nhận thay đổi dữ liệu trên bảng Danh mục Carrier, bao gồm: [Thêm mới Carrier](TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md) /[Sửa Carrier](TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md) |
|  | Update Details | Textview |  | * Hiển thị chi tiết cập nhật Carrier * Hiện tối đa 2 dòng dữ liệu, nếu nội dung vượt quá 2 dòng, hiện dấu ba chấm […] tại cuối dòng thứ 2. Di chuột vào hiện tooltips full nội dung * Cách ghi nhận log:   + [Thêm mới carrier](TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md): [Thêm mới Carrier](TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md)[Mã Carrier][Name Carrier]   + [Sửa Carrier](TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md): [Tên trường]: [~~Nội dung bị xóa/thay đổi~~] > [Nội dung sau cập nhật]Hiển thị thông tin người cập nhật dữ liệu |
|  | Updated by | Textview |  | * Nội dung bao gồm [Name of the updater] / [ User update code] |
|  | Pagination |  |  | * [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) |

---

*Nguồn: tách trung thực từ `sec-24-quan-ly-danh-muc-carrier.md`, mục "Xem lịch sử Carrier" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#21** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
