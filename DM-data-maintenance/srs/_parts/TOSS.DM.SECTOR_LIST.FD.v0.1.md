---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.SECTOR_LIST"
feature_name: "Xem danh sách chặng bay"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

## Quản lý danh mục chặng bay

Module quản lý danh mục Chặng bay (Leg/Segment) định nghĩa các cặp sân bay khởi hành – đến trong mạng đường bay của VNA. Mỗi chặng bay xác định loại hành trình (Nội địa / Quốc tế), khoảng cách, múi giờ và các thuộc tính khai thác đặc biệt như EDTO. Module cho phép thực hiện đầy đủ: Xem danh sách, Tìm kiếm/Lọc, Xuất Excel, Thêm mới, Sửa, Xóa, Xem chi tiết và Xem lịch sử.

### Xem danh sách chặng bay

| **Tên chức năng: Xem danh sách chặng bay** | |
| --- | --- |
| **Tên chức năng** | Xem danh sách chặng bay |
| **Mục đích** | Cho phép user xem toàn bộ danh sách chặng bay đã được khai báo trong hệ thống |
| **Trigger** | Người dùng truy cập vào web FIMS → nhấn phân hệ **Danh mục** → chọn **Chặng bay** |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và có phân quyền xem phân hệ Danh mục Chặng bay |
| **Hậu điều kiện** | Màn hình hiển thị danh sách chặng bay |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | User truy cập vào web Fims => mở đến module Danh mục=> Chặng bay |
| 2 | Hệ thống hiển thị màn hình danh sách Chặng bay trên giao diện |
| 3 | User click Thêm mới => Hệ thống hiển thị màn hình [Thêm mới Chặng bay](TOSS.DM.SECTOR_ADD_EDIT.FD.v0.1.md) |
| 4 | User click icon “ Sửa” => Hệ thống hiển thị màn hình [Sửa Chặng bay](TOSS.DM.SECTOR_ADD_EDIT.FD.v0.1.md) |
| 5 | User click icon “ Xóa” => Hệ thống hiển thị màn hình [Xóa Chặng bay](TOSS.DM.SECTOR_DELETE.FD.v0.1.md) |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | | **Kiểu dữ liệu** | | **Mapping DB/API** | | **Mô tả** | |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| **Màn hình danh sách:**  **![](data:image/png;base64...)**   * **Danh sách chặng bay được sắp xếp theo quy tắc sau:** Danh sách được sắp xếp mặc định theo Departure Airport tăng dần (A→Z), sau đó theo Arrival Airport tăng dần (A→Z). Không hỗ trợ sort theo cột trên giao diện.   **Chức năng tìm kiếm**  **![](data:image/png;base64...)**   * Cơ chế Thu gọn/Mở rộng bộ lọc (Collapsible Fillter):   + [Tham chiếu kịch bản chức năng ẩn hiện filter](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.dgq51psil6dr) * Click vào các ô search để chọn lọc, tìm kiếm thông tin theo dữ liệu của Chặng bay * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => debounce 0.5s/click Enter/button Search => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về   + Trường hợp API trả về data rỗng hoặc lỗi: hiển thị “Không có kết quả nào liên quan” | | | | | | | | |
| 1 | | Title hệ thống | | Label | |  | | * + [Tham chiếu Kịch bản title hệ thống](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.f2nh07gdowb8) |
| 2 | | Departure Airport | | Combobox | | departure\_airport | | * Trường để lọc: Tìm kiếm gần đúng theo [departure\_airport ] * List giá trị gồm: ‘All’, ‘HAN’ và ‘SGN’,.. * Chọn ‘All’ = chọn cả‘HAN’ và ‘SGN’,.. |
| 3 | | Arrival Airport | | Combobox | | arrival\_airport | | * Trường để lọc: Tìm kiếm gần đúng theo [arrival\_airport ] * List giá trị gồm: ‘All’, ‘HAN’ và ‘SGN’,.. * Chọn ‘All’ = chọn cả ‘HAN’ và ‘SGN’,.. |
| 4 | | International | | DDL | | international | | * Trường để lọc: Tìm kiếm gần đúng theo [international ] * List giá trị gồm: ‘All’, ‘Yes’ và ‘No’,.. * Chọn ‘All’ = chọn cả Yes’ và ‘No’,.. |
| 5 | | Domestic | | DDL | | domestic | | * Trường để lọc: Tìm kiếm gần đúng theo [domestic ] * List giá trị gồm: ‘All’, ‘Yes’ và ‘No’,.. * Chọn ‘All’ = chọn cả Yes’ và ‘No’,.. |
| 6 | | EDTO | | DDL | | edto | | * Trường để lọc: Tìm kiếm gần đúng theo [edto ] * List giá trị gồm: ‘All’, ‘Yes’ và ‘No’,.. * Chọn ‘All’ = chọn cả Yes’ và ‘No’,.. |
| 7 | | Status | | DDL | |  | | * Trường để lọc: Tìm kiếm gần đúng theo [status ] * List giá trị gồm: ‘All’, ‘Active’ và ‘Inactive’ * Chọn ‘All’ = chọn cả ‘Active’ và ‘Inactive’ |
| 8 | | ![](data:image/png;base64...) | | Button | |  | | * Click vào ![](data:image/png;base64...) * Hệ thống lọc dữ liệu dựa trên nội dung trường lọc * Hệ thống trả về danh sách dữ liệu phù hợp với từ khoá tìm kiếm |
| 9 | | ![](data:image/png;base64...) | | Button | |  | | * Click vào ![](data:image/png;base64...) * Hệ thống   + Xoá nội dung search   + Reset toàn bộ trường lọc đã chọn   + Reset phân trang về trang đầu * Hệ thống gọi API lấy danh sách dữ liệu mặc định * Hiển thị lại danh sách ban đầu |
| **Danh sách chặng bay** | | | | | | | | |
| 10 | | ![](data:image/png;base64...) | | Button | |  | | * Click vào => mở màn hình [Thêm mới Chặng bay](TOSS.DM.SECTOR_ADD_EDIT.FD.v0.1.md) * Hiển thị form nhập thông tin tương ứng với đối tượng cần tạo * Button **Create** chỉ hiển thị khi:   + Người dùng đã đăng nhập thành công   Người dùng có **quyền Thêm mới** đối với chức năng tương ứng |
| 11 | | ![](data:image/png;base64...) | | Button | |  | | * Tham chiếu kịch bản [xuất Excel](#bookmark=id.r5pkpuo7a6i2) * Tên file tải về: [FIMS\_Quanlychangbay\_ddmmyyhhss](https://docs.google.com/spreadsheets/d/1pLH_huV4sAU5_xnBtCnAO_YbPjaABjgD98xwJ5u-56Q/edit?usp=drive_link) * Nội dung file tải về: tải theo cột dữ liệu view từ bảng danh sách Chặng bay * Định dạng xlsx |
| 12 | | No | | Textview | |  | | Hiển thị No bản ghi tăng dần |
| 13 | | Flight Code | | Textview | | flight\_code | | * Hiển thị [flight\_code] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp lỗi API trả về N/A |
| 14 | | Departure Airport | | Textview | | departure\_airport | | * Hiển thị [departure\_airport] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp lỗi API trả về N/A |
| 15 | | Arrival Airport | | Textview | | arrival\_airport | | * Hiển thị [arrival\_airport ] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp lỗi API trả về N/A |
| 16 | | International | | Icon, text | |  | | Hiển thị trạng thái tương ứng giá trị được lưu tại CSDL. Read only. |
| 17 | | Domestic | | Icon, text | |  | | Hiển thị trạng thái tương ứng giá trị được lưu tại CSDL. Read only. |
| 18 | | EDTO | | Icon, text | |  | | Hiển thị trạng thái tương ứng giá trị được lưu tại CSDL. Read only. |
| 19 | | Status | | Textview | |  | | * Hiển thị TagStatus theo dữ liệu API trả về   + Status=Active: Tag màu xanh lá   + Status=Inactive: Tag màu xám |
| 20 | | Action | | Icon function | |  | | Bao gồm các function sau   * Sửa => Ẩn khi user không được phân quyền Sửa * Xóa => Ẩn khi user không được phân quyền Xóa * Click function => mở màn hình chức năng tương ứng |
| 21 | | Phân trang | |  | |  | | * Khi SL dữ liệu API trả về >10 => hiển thị phân trang * Xem chi tiết ở : [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) |

###

---

*Nguồn: tách trung thực từ `sec-30-quan-ly-danh-muc-chang-bay.md`, mục "Xem danh sách chặng bay" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#46** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
