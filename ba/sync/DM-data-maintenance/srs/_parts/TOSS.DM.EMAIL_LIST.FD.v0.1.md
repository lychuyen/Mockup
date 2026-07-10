---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.EMAIL_LIST"
feature_name: "Xem danh sách Email"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

## Quản lý danh sách email

### Xem danh sách Email

| **Tên chức năng: Email List** | |
| --- | --- |
| **Mục đích** | Cho phép user xem Danh sách Email |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn Danh mục=> Email |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem Danh mục=> Email |
| **Hậu điều kiện** | Danh sách Email hiển thị trên giao diện |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

Hình 23. Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | User truy cập vào web FIMS => mở đến module Danh mục=> Email |
| 2 | Hệ thống hiển thị màn hình Email List trên giao diện |
| 3 → 4 | User click Add new => Hệ thống hiển thị màn hình Create Email |
| 5→ 6 | User click icon “ Edit” => Hệ thống hiển thị màn hình Edit Email |
| 7→ 8 | User click icon “ History” => Hệ thống hiển thị màn hình History |

#### Màn hình chức năng

![](data:image/png;base64...)

Hình 24. Giao diện Danh sách Email

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| Title hệ thống | | [Tham chiếu Kịch bản title hệ thống](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.f2nh07gdowb8) | | |
|  | Add new | Button | btn\_add\_new | * Luôn Enble * Click button, gọi chức năng Create Email |
|  | ![](data:image/png;base64...) | Button | btn\_export\_excel\_email | * Click vào => hệ thống thực hiện tạo file .xlsx để tải danh sách Email về máy * Tên file tải về: FIMS\_Email\_ddmmyyhhmm * File: * Nội dung file tải về: tải theo cột dữ liệu view từ bảng Email |
|  | **Tìm kiếm**   * Cơ chế Thu gọn/Mở rộng bộ lọc (Collapsible Fillter):   + [Tham chiếu kịch bản chức năng ẩn hiện filter](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.dgq51psil6dr) * Click vào dòng dưới tiêu đề các cột để chọn lọc, tìm kiếm thông tin theo dữ liệu tại cột tương ứng. * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó * Người dùng thao tác thay đổi giá trị trường dữ liệu => click Enter/out focus box => hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về * Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0** | | | |
|  | Email | Textbox | email | * Trường để lọc: Tìm kiếm gần đúng theo [email] * Maxlength 100 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Status | Dropdownlist | status | * Trường để lọc: Tìm kiếm chính xác theo [status] * Giá trị chọn lọc, chỉ được chọn duy nhất 1 giá trị:   + Active   + Inactive * Nếu dữ liệu chọn vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó |
|  | Note | Textbox | note | * Trường để lọc: Tìm kiếm gần đúng theo [note] * Maxlength 100 ký tự * Validate cho phép nhập chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi tìm kiếm |
|  | Chi tiết danh sách   * Danh sách sắp xếp theo thứ tự email được tạo và chỉnh sửa mới nhất được hiển thị lên đầu danh sách * Khi user click vào 1 bản ghi bất kỳ → hiển thị màn hình [View detail Email](#_heading=h.ap4zb7ea2dlm) | | | |
|  | No. | Textview |  | * Hiển thị STT tăng dần theo số lượng bản ghi |
|  | Email | Textview | email | * Hiển thị Email theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trên danh sách email luôn tồn tại 1 email duy nhất ở trạng thái Active( email được đặt làm mặc định- hiển thị default dưới email) |
|  | Status | Textview | status | * Hiển thị TagStatus theo dữ liệu API trả về   + Status=Active: Tag màu xanh lá   + Status=Is Active: Tag màu xám |
|  | Note | Textview | note | * Hiển thị thông tin comment theo dữ liệu API trả về * Hiển thị tối đa 2 dòng dữ liệu * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
|  | Action | Button |  | Bao gồm các function sau   * Sửa => Ẩn khi user không được phân quyền Sửa * Lịch sử => Ẩn khi user không được phân quyền Xem * Click function => mở màn hình chức năng tương ứng |
|  | Chân trang | Pagination |  | * Tham chiếu kịch bản [phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=id.hy5fbrqw7e44) |

---

*Nguồn: tách trung thực từ `sec-27-quan-ly-danh-sach-email.md`, mục "Xem danh sách Email" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#32** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
