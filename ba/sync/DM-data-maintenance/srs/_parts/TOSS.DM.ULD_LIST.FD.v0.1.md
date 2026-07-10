---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.ULD_LIST"
feature_name: "Xem danh sách ULD"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

## Quản lý danh mục ULD

### Xem danh sách ULD

| **Tên chức năng: Quản lý danh mục ULD** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem danh sách **ULD** |
| **Trigger** | Người dùng truy cập vào web FIMS => mở đến module Danh mục/ ULD |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Danh mục ULD |
| **Hậu điều kiện** | Mở màn hình danh sách ULD trên giao diện người dùng |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng hệ thống danh mục ULD

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| **1** | Truy cập web FIMS => mở đến module Danh mục/Danh mục ULD |
| **2** | Hệ thống call API xuống BE lấy danh sách ULD |
| **3** | Hiển thị danh sách ULD trên giao diện người dùng |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện danh mục ULD

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **1** | Title hệ thống |  |  | * + [Tham chiếu Kịch bản title hệ thống](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.f2nh07gdowb8) |
| Danh sách ULD  ![](data:image/png;base64...)  FE call API lấy lại DS ULD Type mới nhất hiện tại để hiển thị trên giao diện người dùng | | | | |
| **2** | ULD Type Master List | Title |  | * Fix cứng content “ULD Master List” * Không cho thao tác |
| **3** | ![](data:image/png;base64...) | Button | btn\_export | * Click vào => hệ thống thực hiện tạo file .xlsx để tải danh sách ULD về máy * Trạng thái button:   + Enable nếu có dữ liệu   + Disable nếu không có dữ liệu   + Có loading khi đang xử lý * Thông báo lỗi/thành công:   + Thành công, hiển thị thông báo [TB004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.lqwvqa8wfkpc): “The .xlsx file has been exported successfully. “   + Timeout/mất kết nối CSDL, hiển thị thông báo [TB005](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.8b6ytkw5l6eh): “Unable to retrieve data for export. Please try again. “ * Tên file tải về: FIMS\_ULD\_ddmmyy\_hhmm * File tham khảo: [FIMS\_ULD\_ddmmyy\_hhmm](https://docs.google.com/spreadsheets/d/1-urXlu6vsm4-A_3p0ZNT1Xte3Ep5aAqTuN7CJrpOHYc/edit?usp=drive_link) * Nội dung file tải về: tải theo cột dữ liệu view từ bảng ULD |
| **4** | ![](data:image/png;base64...) | Button | btn\_create | * Click button → Mở popup “Thêm mới” |
| **5** | **Tìm kiếm**   * Cơ chế Thu gọn/Mở rộng bộ lọc (Collapsible Fillter):   + [Tham chiếu kịch bản chức năng ẩn hiện filter](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.dgq51psil6dr) * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => click Enter/out focus box => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về và set Current page = 1   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0**   **Nút [Clear Filter]:**   * Click [Clear Filter] => Xóa trắng toàn bộ dữ liệu đang nhập ở các ô lọc. Tự động gọi lại API để load lại danh sách mặc định. | | | |
| **6** | Search by ULD code | Textbox |  | * Trường để lọc: Tìm kiếm gần đúng theo [ULD code or Current Location or Owner] * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| **7** | Search by ULD Type | Textbox |  | * Trường để lọc: Tìm kiếm gần đúng theo [ULD Type] * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Owner |  |  | * Trường để lọc: Tìm kiếm gần đúng theo [Owner] * Maxlength 255 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 255 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| **8** | Status | Dropdownlist [Đang hoạt động, Ngừng hoạt động] |  | * Trường để lọc: Tìm kiếm chính xác theo [status] * Các giá trị lựa chọn:   + Active   + InActive |
| **9** | Chi tiết danh sách   * Hệ thống call API xuống BE, lấy danh sách ULD   → hiển thị danh sách ULD trên màn hình   * Danh sách ULD sắp xếp theo thứ tự α-β của trường ULD * Khi user click vào 1 bản ghi bất kỳ → hiển thị màn hình [Xem chi tiết ULD](TOSS.DM.ULD_DETAIL.FD.v0.1.md) | | | |
| **10** | TT | Textview |  | * Hiển thị STT tăng dần theo số lượng bản ghi |
| **11** | ULD Code | Textview |  | * Hiển thị [ULD Code] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **12** | Type | Textview |  | * Hiển thị [Type] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **13** | Tare Weight (kg) | Number |  | * Hiển thị [Tare Weight (kg)] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu, căn trái dữ liệu trên cột * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **14** | Owner | Textview |  | * Hiển thị [Owner] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **15** | Current Location | Textview |  | * Hiển thị [Current Location] theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **16** | Trạng thái | Textview |  | * Hiển thị thông tin [status] dưới dạng tag status theo dữ liệu API trả về   + Status=Active: Tag màu xanh lá   + Status=Inactive: Tag màu xám * Trường hợp API trả về lỗi/rỗng: hiện **N/A** |
| **17** | Action |  |  | * **Icon [Edit]**  Click => Mở popup form Chỉnh [sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) với dữ liệu của dòng tương ứng được fill sẵn. * **Icon [Delete]** Click => Mở popup hỏi xác nhận "Are you sure you want to remove the uld: [ULD Code]?" |
| **18** | Chân trang | Pagination |  | [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) |

###

---

*Nguồn: tách trung thực từ `sec-29-quan-ly-danh-muc-uld.md`, mục "Xem danh sách ULD" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#41** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
