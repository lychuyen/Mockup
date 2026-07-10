---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.FIR_CREATE"
feature_name: "Thêm mới FIR"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Thêm mới FIR

| **Tên chức năng: Thêm mới FIR** | |
| --- | --- |
| **Mục đích** | Cho phép user Thêm mới FIR |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Danh mục => Nhấn chọn FIR => Chọn button “Add New” |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền thêm FIR |
| **Hậu điều kiện** | Thêm mới thành công FIR |

### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng hệ thống thêm mới FIR

### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng truy cập vào web FIMS =>Chọn tab Danh mục => Chọn “Danh mục FIR” |
| Bước 2 | Người dùng chọn button “Add New” |
| Bước 3 | Hệ thống hiển thị màn hình Add New FIR |
| Bước 4 | User nhập dữ liệu và nhấn **Save** |
| Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Trường hợp thiếu dữ liệu bắt buộc/Sai định dạng valid/Call API tạo mới FIR cho FIMS có lỗi => Báo lỗi theo bước 6 * Ngược lại: Tạo mới FIR thành công => Thực hiện tiếp bước 7 & 8 |
| Bước 6 | Hiển thị toast báo lỗi cho người dùng:   * Trường hợp thiếu trường bắt buộc: Hiển thị inline message (IM) tại trường có lỗi [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) * Trường hợp Sai định dạng valid: Hiển thị IM tại trường có lỗi [VL006](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.lwrynb3cmu73) * Trường hợp Call API tạo mới trả về lỗi: hiển thị toast message (TM)   + Trường hợp lỗi API trả về có message: hiện [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   + Hoặc hiện [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0) |
| Bước 7 | Trường hợp tạo FIR thành công: BE Lưu và cập nhật [danh sách FIR](TOSS.DM.FIR_LIST.FD.v0.1.md)  Trả API thành công cho FE |
| Bước 8 | FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  Đóng popup Tạo mới, tự động refresh màn danh sách và hiển thị [Danh sách FIR](TOSS.DM.FIR_LIST.FD.v0.1.md) mới nhất |

### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện thêm mới FIR

### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| 1 | Title | Textview |  | * Text cứng “Add New FIR” |
| 2 | Icon X | Icon |  | * Click icon → Đóng popup. Điều hướng về màn trước đó |
| 3 | Status | Toggle Switch | status | * Mặc định: Active * TH On Toggle Switch button: **Active** * Ngược lại: **Inactive** * Update Toggle switch button **Hoạt động** thành **Active/Inactive** tương ứng trạng thái |
| 4 | FIR code | TextBox | fir\_code/firCode | * Mặc định: Để trống và cho nhập thông tin * Placeholder “FIR Code” * Bắt buộc nhập * Maxlength 20 ký tự. Chặn nếu nhập quá 20 ký tự. Nếu paste đoạn văn > 20 ký tự, chỉ nhận 20 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/]   + Chặn trùng dữ liệu * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp nhập mã FIR đã tồn tại trong hệ thống. => Hiển thị thông báo IM: [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) |
| 5 | FIR name | TextBox | fir\_name/firName | Mặc định: Để trống và cho nhập thông tin  Placeholder “Nhập tên FIR”  Bắt buộc nhập  Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự  Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên  Tự động TRIM Spaces đầu cuối khi out focus box  Validate   * + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/]   + Chặn trùng dữ liệu   Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung  Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   * + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp nhập tên FIR đã tồn tại trong hệ thống. => Hiển thị thông báo IM: [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) |
| 6 | Country | DDL | country\_id/countryId | * Cho phép chọn quốc gia từ dropdown list * Bắt buộc chọn * Click vào box => FE call API lấy danh sách Quốc gia và hiển thị tooltips suggest select cho phép chọn nhiều giá trị * Cách hiển thị quốc gia: Hiện dưới dạng tag, mỗi quốc gia là 1 tag, cho phép click để xóa bỏ quốc gia khỏi box |
| 7 | ACC center | TextBox | acc\_center/accCenter | * Mặc định: Để trống và cho nhập thông tin * Placeholder “Trung tâm ACC” * Không bắt buộc nhập * Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box   Validate   * + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/] * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
| 8 | ICAO | DDL | region\_type\_id/regionTypeId | * Mặc định cho phép nhập thông tin * Không bắt buộc chọn * Placeholder: “Chọn ICAO” * Dữ liệu lấy ở Chức năng ICAO FIR. * Cho phép người dùng nhập để tìm kiếm hoặc chọn trong danh sách dữ liệu lấy tại chức năng ICAO FIR * Chỉ chọn 1 giá trị * **Action**: Nhấn Enter/out focus/click button **Save**, hệ thống lưu thông tin ghi chú. Không có thông tin, lưu trống |
| 9 | ANSP | Textbox |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “ansp” * Không bắt buộc nhập * Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/] * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
| 10 | FIR type | Dropdownlist |  | * Cho phép chọn type từ dropdown list * Không bắt buộc chọn * Click vào box => FE call API lấy [danh sách FIR](TOSS.DM.FIR_LIST.FD.v0.1.md) type và hiển thị tooltips suggest select cho phép chọn nhiều giá trị * Các giá trị lựa chọn:   + Continental   + Oceanic * Cách hiển thị Fir type: Hiện dưới dạng tag, mỗi fir type là 1 tag, cho phép click để xóa bỏ fir type khỏi box |
| 11 | Lower Limit | Textbox |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “Lower Limit” * Không bắt buộc nhập * Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/]   + Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung   + Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM:[VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
| 12 | Upper Limit | Textbox |  | * Mặc định: Để trống và cho nhập thông tin * Placeholder “Upper Limit” * Không bắt buộc nhập * Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Validate   + Cho phép nhập chữ, số, dấu gạch ngang [-]; dấu gạch dưới [\_]; dấu chấm [.]; dấu gạch chéo [/] * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * Action: Nhấn Enter/out focus/click button Save, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM:[VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
| 13 | Cancel | Button | btn\_cancel | * Click → Đóng popup. Điều hướng về màn trước đó * Dữ liệu không được lưu vào DB |
| 14 | Save | Button | btn\_save | * Click vào. Hệ thống kiểm tra   + [FIR] đã tồn tại trong DB. Hiển thị toast message [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh) và giữ nguyên màn popup   + Dữ liệu hợp lệ, hệ thống lưu thành công và hiển thị toast message [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)     - Lưu thông tin thành công → Đóng popup. Điều hướng về màn danh sách     - Dữ liệu lưu trong DB |

---

*Nguồn: tách trung thực từ `sec-26-quan-ly-danh-muc-fir.md`, mục "Thêm mới FIR" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#28** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
