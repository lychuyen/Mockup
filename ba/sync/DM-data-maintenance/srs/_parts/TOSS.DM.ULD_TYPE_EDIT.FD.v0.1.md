---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.ULD_TYPE_EDIT"
feature_name: "[Sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### [Sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type

| **Tên chức năng: [Sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type** | |
| --- | --- |
| **Mục đích** | Cho phép user [Sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Danh mục => Nhấn chọn ULD Type => Chọn Icon “Sửa” |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền [sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type |
| **Hậu điều kiện** | Sửa thành công ULD Type |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
| **1** | Bước 1 | Người dùng truy cập vào web FIMS =>Chọn tab Danh mục => Chọn “Danh mục ULD Type ” |
| **2** | Bước 2 | Người dùng chọn Icon “Sửa” |
| **3** | Bước 3 | Hệ thống hiển thị màn hình [Sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type |
| **4** | Bước 4 | User nhập dữ liệu và nhấn **Lưu lại** |
| **5** | Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Trường hợp thiếu dữ liệu bắt buộc/Sai định dạng valid/Call API [sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type cho FIMS có lỗi => Báo lỗi theo bước 6 * Ngược lại: [Sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type thành công => Thực hiện tiếp bước 7 & 8 |
| **6** | Bước 6 | Hiển thị toast báo lỗi cho người dùng:   * Trường hợp thiếu trường bắt buộc: Hiển thị inline message (IM) tại trường có lỗi [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) “The **<field name>** field must not be empty.” * Trường hợp Sai định dạng valid: Hiển thị IM tại trường có lỗi [VL006](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.lwrynb3cmu73) “**<Field name>** is in an invalid format.” * Trường hợp Call API tạo mới trả về lỗi: hiển thị toast message (TM)   + Trường hợp lỗi API trả về có message: hiện [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   ![](data:image/png;base64...)   * + Hoặc hiện [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)   ![](data:image/png;base64...) |
| **7** | Bước 7 | Trường hợp [Sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type thành công: BE Lưu và cập nhật danh sách ULD Type  Trả API thành công cho FE |
| **8** | Bước 8 | FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  ![](data:image/png;base64...)  Đóng popup Sửa, tự động refresh màn danh sách và hiển thị Danh sách ULD Type mới nhất |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **1** | Title | Textview |  | * Text cứng “Update” |
| **2** | Icon X | Icon |  | * Click icon → Đóng popup. Điều hướng về màn trước đó |
| **3** | ULD Type code | Textview |  | * Hiển thị [ULD Type code] theo dữ liệu API trả về * Mặc định: Không cho phép sửa |
| **4** | ULD Type | Textview |  | * Hiển thị [ULD Type] theo dữ liệu API trả về * Mặc định: Không cho phép sửa |
| **5** | Description | Textbox |  | * Hiển thị [Description] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter Description” * Bắt buộc nhập * Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập string   + Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: “The **Description** field must not be empty.”   + Trường hợp nhập tên FIR đã tồn tại trong hệ thống. => Hiển thị thông báo IM: “**Description** already exists. Please check again.” |
| **6** | Tare Weight (kg);  Max Gross (kg);  Volume (m³) | NumberBox [0;20] |  | * Hiển thị theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter + tên trường” * Bắt buộc nhập * Maxlength 20 ký tự. Chặn nếu nhập quá 20 ký tự * Nếu paste dãy số > 20 ký tự, chỉ nhận 20 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập số thực dương, số thập phân   + Dấu phân cách thập phân là dấu chấm (.).   + Không cho phép dấu phẩy (,), số âm, ký tự chữ, khoảng trắng giữa số, hay nhiều hơn 1 dấu chấm.   + Ví dụ hợp lệ: 1, 10.5, 1000.999.   + Ví dụ không hợp lệ: 0, -2, 1,5, 12.3456.   + Phần thập phân sau dấu phảy 4 số   + Phần nguyên để 15 số * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: “The **<field name>** field must not be empty.” |
| **7** | AC Subtype | DDL |  | * Hiển thị [AC Subtype] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Choose AC Subtype” * Bắt buộc chọn * Dữ liệu lấy ở Danh mục Quản lý tàu bay, lấy theo mã tàu bay. * Cho phép người dùng nhập để tìm kiếm hoặc chọn trong danh sách dữ liệu * Cho phép chọn nhiều giá trị * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM:“The **AC Subtype** field must not be empty.” |
| **8** | Note | TextBox [0;3000] |  | * Hiển thị [Note] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter Note” * Không bắt buộc nhập * Maxlength 3000 ký tự. Chặn nếu nhập quá 3000 ký tự * Nhận dữ liệu chữ, số, và ký tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 3000 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống lưu thông tin ghi chú. Không có thông tin, lưu trống |
| **9** | Width (In);  Width (Mm);  Height;  Depth (In);  Depth (Mm);  Base Dimensions | NumberBox [0;20] |  | * Hiển thị theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: hiện placeholder “Enter + tên trường” * Không bắt buộc nhập * Maxlength 20 ký tự. Chặn nếu nhập quá 20 ký tự * Nếu paste dãy số > 20 ký tự, chỉ nhận 50 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập số nguyên; số thập phân   + Dấu phân cách thập phân là dấu chấm (.).   + Không cho phép dấu phẩy (,), số âm, ký tự chữ, khoảng trắng giữa số, hay nhiều hơn 1 dấu chấm.   + Ví dụ hợp lệ: 1, 10.5, 1000.999.   + Ví dụ không hợp lệ: 0, -2, 1,5, 12.3456.   + Phần thập phân sau dấu phảy 4 số   + Phần nguyên để 15 số * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: Nhấn Enter/out focus/click button Save, hệ thống lưu thông tin. Không có thông tin, lưu trống |
| **10** | Trạng thái | Radio button |  | * Hiển thị [trạng thái] theo dữ liệu API trả về * Cho phép chọn Active/inactive * Nếu ULD type đang được gắn với ULD => Không cho phép inactive và hiển thị toast cảnh báo: “Cannot change the ULD Type to Inactive because it is currently used by [n] ULD”.   + [n] là số ULD được gắn bởi ULD type |
| **11** | Hủy bỏ | Button |  | * Click → Đóng popup. Điều hướng về màn trước đó * Dữ liệu không được lưu vào DB |
| **12** | Lưu lại | Button |  | * Click vào. Hệ thống kiểm tra   + Sửa: [ULD] đã tồn tại trong DB. Hiển thị toast message [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)và giữ nguyên màn popup   ![](data:image/png;base64...)   * + Dữ liệu hợp lệ, hệ thống lưu thành công và hiển thị toast message [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)   ![](data:image/png;base64...)   * + - Lưu thông tin thành công → Đóng popup. Điều hướng về màn danh sách     - Dữ liệu lưu trong DB |

###

---

*Nguồn: tách trung thực từ `sec-28-quan-ly-danh-muc-loai-uld.md`, mục "[Sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) Type" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#38** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
