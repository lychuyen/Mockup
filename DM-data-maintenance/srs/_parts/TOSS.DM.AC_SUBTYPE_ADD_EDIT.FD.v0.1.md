---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.AC_SUBTYPE_ADD_EDIT"
feature_name: "Thêm mới/Sửa AC Subtype"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Thêm mới / Sửa AC Subtype

| **Tên chức năng**: Thêm mới / Sửa AC Subtype | |
| --- | --- |
| **Mục đích** | Cho phép user thêm mới hoặc chỉnh sửa thông tin AC Subtype |
| **Trigger** | User click button "Thêm mới" hoặc click icon “Sửa” tại một bản ghi AC Subtype trong danh sách |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Thêm mới / Sửa AC Subtype |
| **Hậu điều kiện** | Thêm mới / Sửa thành công, dữ liệu được lưu vào DB |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Mô tả** |
| --- | --- | --- |
| 1 | Bước 1 | User truy cập module Danh mục / AC Subtype |
| 2 | Bước 2 | User click "Thêm mới" hoặc icon “Sửa” tại bản ghi muốn chỉnh sửa |
| 3 | Bước 3 | Hệ thống hiển thị popup Thêm mới / Sửa AC Subtype  - TH Thêm mới: các trường để trống  - TH Sửa: load dữ liệu hiện tại vào form |
| 4 | Bước 4 | User nhập / cập nhật dữ liệu và nhấn "Save" |
| 5 | Bước 5 | Hệ thống validate dữ liệu:  - Dữ liệu không hợp lệ => chuyển sang Bước 6  - Dữ liệu hợp lệ => chuyển sang Bước 7 |
| 6 | Bước 6 | Hiển thị thông báo lỗi IM tương ứng. Giữ nguyên màn hình popup |
| 7 | Bước 7 | Hệ thống lưu dữ liệu vào DB (insert hoặc update) |
| 8 | Bước 8 | Đóng popup. Hiển thị toast message thành công [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f). Reload danh sách: ![](data:image/png;base64...)  ![](data:image/png;base64...) |

#### Màn hình chức năng

![](data:image/png;base64...)

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

##

| **STT** | **Tên** | **Kiểu dữ liệu** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
|  | * Edit AC Subtype * Add new AC Subtype | Heading |  | * Tiêu đề của màn hình thêm mới/ sửa, thể hiện chức năng thao tác ( thêm /sửa ) |
|  | **![](data:image/png;base64...)** | Icon |  | * Click Icon => Đóng màn hình thêm mới/ sửa => Điều hướng về màn trước đó * Dữ liệu thay đổi không được lưu vào DB |
|  | **![](data:image/png;base64...)** | Button |  | * Click button Hủy bỏ => Đóng màn hình thêm mới/ sửa => Điều hướng về màn trước đó * Dữ liệu thay đổi không được lưu vào DB |
|  | AC Subtype code | Textbox (Thêm mới)  Textview (Sửa) |  | * TH **Thêm mới**:   + Mặc định: Để trống và cho nhập thông tin   + Placeholder “Enter AC subtype code ”   + Bắt buộc nhập * TH **Sửa** ⇒Dữ liệu được fill sẵn thông tin theo dữ liệu từ API trả về. Nếu API trả về lỗi/ rỗng => Để trống trường và hiển thị Placeholder “Select AC Subtype code” * **Validate chung:**   + Maxlength 10 ký tự. Chặn nếu nhập quá 10 ký tự   + Validate     - Cho phép nhập chữ, số, kí tự đặc biệt     - Chặn trùng dữ liệu     - Không cho phép chỉnh sửa * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: User out focus/click button Save, hệ thống validate, nếu:   + (1) Để trống ⇒ Hiển thị thông báo inline: “The AC Subtype code field must not be empty.”   + (2) Trường hợp **Mã AC Subtype đã tồn tại** ⇒ Hiển thị thông báo inline: “**AC Subtype code** already exists. Please check again.”   + Ngược lại: Hiển thị AC Subtype code đã điền (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
|  | AC Subtype name | Textbox |  | * TH **Thêm mới**:   + Mặc định: Để trống và cho nhập thông tin   + Placeholder “Enter AC Subtype name ”   + Bắt buộc nhập * TH **Sửa** ⇒Dữ liệu được fill sẵn thông tin theo dữ liệu từ API trả về. Nếu API trả về lỗi/ rỗng => Để trống trường và hiển thị Placeholder “Enter AC Subtype name” * **Validate chung:**   + Maxlength 100 ký tự. Chặn nếu nhập quá 100 ký tự   + Validate     - Cho phép nhập chữ, số, kí tự đặc biệt * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: User out focus/click button Save/click button Save, hệ thống validate, nếu:   + Để trống ⇒ Hiển thị thông báo inline: “The AC Subtype name field must not be empty.”   + Ngược lại: Hiển thị AC Subtype name đã điền (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
|  | Aircraft Type | DDL |  | * Bắt buộc chọn * Chỉ cho phép chọn 1 giá trị * TH Thêm mới:   + Mặc định: Để trống và cho chọn   + Placeholder “Select aircraft type” * TH Sửa ⇒Dữ liệu được fill sẵn thông tin theo dữ liệu từ API trả về. Nếu API trả về lỗi/ rỗng => Để trống trường và hiển thị Placeholder “Select aircraft type” * Click vào ô ⇒ Hệ thống call API lấy dữ liệu từ trường **[**Flight fleet code] của Danh mục Quản lý Đội bay hiển thị dropdown list mã đội tàu bay:   ![](data:image/png;base64...)   * + Mặc định unselected cho radio button đối với TH thêm mới. và cho phép thay đổi chọn với TH sửa * **Action**: Nhấn out focus/click button Save hệ thống validate, nếu * Để trống ⇒ Hiển thị thông báo IM: “The Aircraft type field must not be empty.” * Ngược lại: Hiển thị tàu bay đã chọn (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
|  | Status | DDL |  | * Bắt buộc chọn * Chỉ cho phép chọn 1 giá trị * TH Thêm mới:   + Mặc định: Để trống và cho chọn   + Placeholder “Select status” * TH Sửa ⇒Dữ liệu được fill sẵn thông tin theo dữ liệu từ API trả về. Nếu API trả về lỗi/ rỗng => Để trống trường và hiển thị Placeholder “Select status” * **Action**: Nhấn out focus/click button Save hệ thống validate, nếu * Để trống ⇒ Hiển thị thông báo IM: “The Status field must not be empty.” * Ngược lại: Hiển thị trạng thái đã chọn (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |
|  | Note | Textbox |  | * TH **Thêm mới**:   + Mặc định: Để trống và cho nhập thông tin   + Placeholder “Enter note ”   + Không bắt buộc nhập * TH **Sửa** ⇒Dữ liệu được fill sẵn thông tin theo dữ liệu từ API trả về. Nếu API trả về lỗi/ rỗng => Để trống trường và hiển thị Placeholder “Enter note” * **Validate chung:**   + Maxlength 1000 ký tự. Chặn nếu nhập quá 1000 ký tự   + Validate :Cho phép nhập freetext * Nếu dữ liệu nhập vượt quá độ dài ô => thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập * Nếu paste đoạn văn thì ghi nhận 1000 ký tự đầu * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: User out focus/click button Save, hệ thống hiển thị note đã điền (out focus) hoặc hệ thống call API update data vào DB khi user click button Save |

---

*Nguồn: tách trung thực từ `sec-32-quan-ly-danh-muc-ac-subtype.md`, mục "Thêm mới/Sửa AC Subtype" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#57** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
