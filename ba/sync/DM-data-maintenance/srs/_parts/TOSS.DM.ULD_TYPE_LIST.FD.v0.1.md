---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.ULD_TYPE_LIST"
feature_name: "Xem danh sách loại ULD"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

## Quản lý danh mục loại ULD

### Xem danh sách loại ULD

| **Tên chức năng: Quản lý danh mục loại ULD** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem danh sách loại **ULD** |
| **Trigger** | Người dùng truy cập vào web FIMS => mở đến module Danh mục/ ULD Type |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Danh mục ULD Type |
| **Hậu điều kiện** | Mở màn hình danh sách ULD Type trên giao diện người dùng |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng hệ thống danh mục ULD Type

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| **1** | Truy cập web FIMS => mở đến module Danh mục/Danh mục ULD Type |
| **2** | Hệ thống call API xuống BE lấy danh sách ULD Type |
| **3** | Hiển thị danh sách ULD Type trên giao diện người dùng |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện danh mục ULD Type

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **1** | Title hệ thống |  |  | * + [Tham chiếu Kịch bản title hệ thống](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.f2nh07gdowb8) |
| Danh sách ULD Type  ![](data:image/png;base64...)  FE call API lấy lại DS ULD Type mới nhất hiện tại để hiển thị trên giao diện người dùng | | | | |
| **2** | ULD Type Master List | Title |  | * Fix cứng text “ULD Type Master List” |
| **3** | ![](data:image/png;base64...) | Button | btn\_export | * Click vào => hệ thống thực hiện tạo file .xlsx để tải danh sách ULD Type về máy * Tên file tải về: Fims\_ULD\_Type\_ddmmyy\_hhmm * File tham khảo: [Fims\_ULD\_Type\_\_ddmmyy\_hhmm](https://docs.google.com/spreadsheets/d/1tSBAI99-KdfE8dJAOaljwinDFyud7Ey9Mr1pDREbviM/edit?usp=drive_link) * Nội dung file tải về: tải theo cột dữ liệu view từ bảng ULD Type |
| **4** | ![](data:image/png;base64...) | Button | btn\_create | * Click button → Mở popup “Thêm mới” |
| **5** | **Tìm kiếm**   * Cơ chế Thu gọn/Mở rộng bộ lọc (Collapsible Fillter):   + [Tham chiếu kịch bản chức năng ẩn hiện filter](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.dgq51psil6dr) * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => click Enter/out focus box => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0** | | | |
| **6** | Search by ULD Type | Textbox |  | * Trường để lọc: Tìm kiếm tương đối theo [ULD] Type * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Search by ULD Type Code |  |  | * Trường để lọc: Tìm kiếm tương đối theo [ULD] Type Code * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ Sơdài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| **7** | AC Subtype | Dropdownlist |  | * Trường để lọc: Tìm kiếm chính xác theo [AC Subtype] * Các giá trị lựa chọn: Danh sách các AC Subtype * Cho phép chọn nhiều giá trị để lọc * Các giá trị được chọn sẽ hiển thị dạng label và có tick để xóa các giá trị được chọn và clear all. |
| **8** | Trạng thái | Dropdownlist [Đang hoạt động, Ngừng hoạt động] |  | * Trường để lọc: Tìm kiếm chính xác theo [status] * Các giá trị lựa chọn:   + Active   + InActive |
|  | Chi tiết danh sách   * Hệ thống call API xuống BE, lấy danh sách ULD Type   → hiển thị danh sách ULD Type trên màn hình   * Danh sách ULD Type sắp xếp theo thứ tự α-β của trường ULD Type * Khi user click vào 1 bản ghi bất kỳ → hiển thị màn hình [Xem chi tiết ULD Type](TOSS.DM.ULD_TYPE_DETAIL.FD.v0.1.md) | | | |
| **9** | ~~TT~~ No | Textview |  | * Hiển thị No tăng dần theo số lượng bản ghi |
|  | ULD Type code | Textview |  | * Hiển thị [ULD Type Code ] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **10** | ULD Type | Textview |  | * Hiển thị [ULD Type ] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **11** | Description | Textview |  | * Hiển thị [Description] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **12** | Tare Weight (kg);  Max Gross (kg);  Volume (m³);  Width (in) | Number |  | * Hiển thị [Tare Weight (kg); Max Gross (kg); Volume (m³); Width (in)] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu, căn trái dữ liệu trên cột * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **13** | AC Subtype | Textview |  | * Hiển thị [AC Subtype] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **14** | Trạng thái | Textview |  | * Hiển thị thông tin [status] dưới dạng tag status theo dữ liệu API trả về   + Status=Active: Tag màu xanh lá   + Status=Inactive: Tag màu xám * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
| **15** | Actions | Icon function |  | Bao gồm các function sau   * Sửa => Ẩn khi user không được phân quyền Sửa * Xoá => Ẩn khi user không được phân quyền Xoá   Click function => mở màn hình chức năng tương ứng |
| **16** | Chân trang | Pagination |  | [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) |

---

*Nguồn: tách trung thực từ `sec-28-quan-ly-danh-muc-loai-uld.md`, mục "Xem danh sách loại ULD" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#36** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
