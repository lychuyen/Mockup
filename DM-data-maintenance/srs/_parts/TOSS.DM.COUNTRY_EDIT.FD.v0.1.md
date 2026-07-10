---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.COUNTRY_EDIT"
feature_name: "Sửa Quốc gia"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Sửa Quốc gia

| **Tên chức năng: Sửa Quốc gia** | |
| --- | --- |
| **Mục đích** | Cho phép user Sửa thông tin quốc gia |
| **Trigger** | Người dùng truy cập vào web FIMS =>mở đến module quốc gia => chọn icon “Sửa” tại quốc gia muốn chỉnh sửa thông tin |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Sửa trên Quốc gia |
| **Hậu điều kiện** | Mở màn hình popup **Sửa Quốc gia** trên giao diện người dùng |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng sửa quốc gia

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | Bước 1 | User truy cập vào web FIMS => mở đến module Danh mục => quốc gia  => hiển thị màn hình [Danh sách quốc gia](TOSS.DM.COUNTRY_LIST.FD.v0.1.md) |
|  | Bước 2 | User click icon “Sửa” tại quốc gia muốn chỉnh sửa |
|  | Bước 3 | Hệ thống hiển thị màn hình sửa quốc gia  Cho phép User chỉnh sửa thông tin quốc gia |
|  | Bước 4 | User update dữ liệu và nhấn **Lưu lại** |
|  | Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Dữ liệu không hợp lệ: chuyển sang Bước 6 * Ngược lại chuyển sang Bước 7 |
|  | Bước 6 | Hiển thị toast message lỗi đến người dùng |
|  | Bước 7 | Update dữ liệu vào DB |
|  | Bước 8 | Hiển thị toast message Sửa thành công; Đóng màn hình Sửa |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện sửa thông tin quốc gia

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | Title | Textview |  | * Text cứng “Edit Country” |
|  | Icon X | Icon |  | * Click icon → Đóng popup. Điều hướng về màn trước đó |
|  | Country code | TextBox [0;20] | country\_code/countryCode | * Hiển thị [countryCode] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Nhập mã Quốc gia” * Bắt buộc nhập * Maxlength 20 ký tự. Chặn nếu nhập quá 20 ký tự * Nếu paste đoạn văn > 20 ký tự, chỉ nhận 20 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/]   + Chặn trùng dữ liệu * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp nhập mã quốc gia đã tồn tại trong hệ thống. => Hiển thị thông báo IM: [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) |
|  | Country name | TextBox [0;100] | country\_name/countryName | Hiển thị [countryName] theo dữ liệu API trả về  Trường hợp API trả về rỗng/lỗi: hiện placeholder “Nhập tên Quốc gia”  Bắt buộc nhập  Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự  Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên  Tự động TRIM Spaces đầu cuối khi out focus box  Validate   * + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/]   + Chặn trùng dữ liệu   Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung  Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   * + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp nhập tên quốc gia đã tồn tại trong hệ thống. => Hiển thị thông báo IM: [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) |
|  | Abbreviation | TextBox [0;100] | abbreviation\_name/abbreviationName | * Hiển thị [abbreviationName] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Nhập tên viết tắt” * Không bắt buộc nhập * Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/] * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
|  | Cancel | Button | btn\_cancel | * Click → Đóng popup. Điều hướng về màn trước đó * Dữ liệu không được lưu vào DB |
|  | Save | Button | btn\_save | * Click vào. Hệ thống kiểm tra   + [quốc gia] đã tồn tại trong DB. Hiển thị toast message [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh) và giữ nguyên màn popup   + Dữ liệu hợp lệ, hệ thống lưu thành công và hiển thị toast message [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)     - Lưu thông tin thành công → Đóng popup. Điều hướng về màn danh sách     - Dữ liệu lưu trong DB |

---

*Nguồn: tách trung thực từ `sec-25-quan-ly-danh-muc-quoc-gia.md`, mục "Sửa Quốc gia" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#24** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
