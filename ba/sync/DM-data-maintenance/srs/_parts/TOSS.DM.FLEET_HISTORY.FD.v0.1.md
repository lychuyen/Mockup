---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.FLEET_HISTORY"
feature_name: "Xem lịch sử Đội bay"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xem lịch sử Đội bay

| **Tên chức năng: Xem lịch sử Đội bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem lịch sửĐội bay |
| **Trigger** | Người dùng truy cập vào web Fims => nhấn phân hệ Danh mục => Nhấn chọn Đội bay => màn [Danh sách Đội bay](TOSS.DM.FLEET_LIST.FD.v0.1.md) => Nhấn chọn icon “Xem”  Hoặc Button “Xem” tại chi tiết 1 Đội bay |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Đội bay |
| **Hậu điều kiện** | Màn hình Xem lịch sửĐội bay |

#### Sơ đồ luồng hệ thống

**![](data:image/png;base64...)**

####

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | Người dùng truy cập vào web Fims=> nhấn phân hệ Danh mục => Đội bay => Hiển thị [danh sách Đội bay](TOSS.DM.FLEET_LIST.FD.v0.1.md) |
| 2 | User click icon **Xem lịch sử Đội bay** |
| 3 | Hệ thống call API lấy dữ liệu lịch sử |
| 4 | Mở màn hình Xem lịch sử Đội bay |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **Thông tin chung** | | | | |
| **1** | Download file | Button |  | * Click vào => hệ thống thực hiện tạo file .xlsx để tải lịch sử Đội bay * Tên file tải về: Fims\_Lich su\_Doibay\_ddmmyyhhmm * Nội dung file tải về: tải theo cột dữ liệu view từ bảng Đội bay |
| **Lịch sử đội bay** | | | | |
| * **Tìm kiếm**   + Click vào dòng dưới tiêu đề các cột để chọn lọc, tìm kiếm thông tin theo dữ liệu tại cột tương ứng.   + Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó   + Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/click Enter/out focus box => hệ thống thực hiện:     - Reload dữ liệu table phù hợp với bộ lọc     - Set current page=1   + Hiển thị kết quả tìm kiếm:     - Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về     - Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | |
| **1.** | Time | Datepicker |  | * Trường để lọc: Tìm kiếm chính xác theo [time] (không tìm theo giờ) * Định dạng ngày dd/mm/yyyy |
| **2.** | Content | DDL |  | * Trường để lọc: Tìm kiếm chính xác theo [Content] * Các giá trị tìm kiếm bao gồm: Add Flight fleet/Edit Flight fleet * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập |
|  | Detail content | Textbox |  | * Trường để lọc: Tìm kiếm gần đúng theo [Detail content] * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | User | Combobox |  | Trường để lọc: Tìm kiếm chính xác theo [User]  ● Các giá trị tìm kiếm bao gồm: Danh sách user được phần quyền thao tác trên phân hệ ~~Danh mục Carrier~~ Quản lý người dùng  ● Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập |
| **Bảng log**   * Dữ liệu sắp xếp theo thứ tự các lịch sử có thời gian cập nhật mới nhất được hiển thị lên đầu danh sách | | | | |
|  | No | Textview |  | * Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo * Danh sách hiển thị tối đa 6 dòng dữ liệu |
|  | Time | Textview |  | * Hiển thị thời gian cập nhật dữ liệu * Định dạng dd/mm/yyyy hh:mm |
|  | Content | Textview |  | * Hiển thị nghiệp vụ ghi nhận thay đổi dữ liệu trên bảng [Danh sách Đội bay](TOSS.DM.FLEET_LIST.FD.v0.1.md), bao gồm: [Thêm mới Đội bay](TOSS.DM.FLEET_ADD_EDIT.FD.v0.1.md) /[Sửa Đội bay](TOSS.DM.FLEET_ADD_EDIT.FD.v0.1.md) |
|  | Detail content | Textview |  | * Hiển thị chi tiết cập nhật Đội bay * Hiện tối đa 2 dòng dữ liệu, nếu nội dung vượt quá 2 dòng, hiện dấu ba chấm […] tại cuối dòng thứ 2. Di chuột vào hiện tooltips full nội dung * Cách ghi nhận log: * [Thêm mới đội bay](TOSS.DM.FLEET_ADD_EDIT.FD.v0.1.md): Đơn vị [Mã Đội bay]- [Tên Đội bay] * [Sửa đội bay](TOSS.DM.FLEET_ADD_EDIT.FD.v0.1.md): [Tên trường]: [~~Nội dung bị xóa/thay đổi~~] > [Nội dung sau cập nhật] |
|  | User | Textview |  | * Hiển thị thông tin người cập nhật dữ liệu * Nội dung bao gồm [Tên người cập nhật] / [Mã người cập nhật] |
|  | Phân trang |  |  | * [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) |

---

*Nguồn: tách trung thực từ `sec-31-quan-ly-danh-muc-doi-bay.md`, mục "Xem lịch sử Đội bay" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#53** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
