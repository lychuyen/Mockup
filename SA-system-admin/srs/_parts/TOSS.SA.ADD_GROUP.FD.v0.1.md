---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.ADD_GROUP"
feature_name: "Thêm mới Nhóm người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Thêm mới nhóm người dùng

| **Tên chức năng: Thêm mới Nhóm Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Thêm mới Nhóm người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý nhóm người dùng => nhấn Thêm mới Nhóm người dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền trên phân hệ Quản lý nhóm người dùng |
| **Hậu điều kiện** | Màn hình Thêm mới Nhóm người dùng hiển thị |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng thêm mới nhóm người dùng

#### Mô tả luồng nghiệp vụ

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | Bước 1 | User truy cập vào web FIMS => mở đến module Quản lý nhóm người dùng =>hiển thị màn hình [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) trên giao diện |
|  | Bước 2 | User click button Tạo Nhóm người dùng |
|  | Bước 3 | Hệ thống hiển thị màn hình Thêm mới Nhóm người dùng |
|  | Bước 4 | User nhập dữ liệu và nhấn **Lưu lại** |
|  | Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Trường hợp thiếu dữ liệu bắt buộc/Sai định dạng valid/Call API tạo mới nhóm người dùng cho FIMS có lỗi => Báo lỗi theo bước 6 * Ngược lại: Tạo mới nhóm người dùng thành công => Thực hiện tiếp bước 7 & 8 |
|  | Bước 6 | Hiển thị toast báo lỗi cho người dùng:   * Trường hợp thiếu trường bắt buộc: Hiển thị inline message (IM) tại trường có lỗi [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) * Trường hợp Sai định dạng valid: Hiển thị IM tại trường có lỗi [VL006](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.lwrynb3cmu73) * Trường hợp Call API tạo mới trả về lỗi: hiển thị toast message (TM)   + Trường hợp lỗi API trả về có message: hiện [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   ![](data:image/png;base64...)   * + Hoặc hiện [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)   ![](data:image/png;base64...) |
|  | Bước 7 | Trường hợp tạo nhóm người dùng thành công: BE Lưu và cập nhật danh sách nhóm Users  Trả API thành công cho FE |
|  | Bước 8 | FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  ![](data:image/png;base64...)  Đóng popup Tạo mới, tự động refresh màn danh sách và hiển thị [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện thêm mới nhóm người dùng

#### Mô tả màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | | **Mapping DB/API** | | **Mô tả** |
| --- | --- | --- | --- | --- | --- | --- |
|  | User group code | | Textbox [0;50] | | user\_group\_code/userGroupCode | * Bắt buộc nhập * Placeholder: “Nhập mã nhóm người dùng” * Nhận dữ liệu dạng chữ, số, dấu chấm (.), gạch ngang (-), gạch dưới (\_) * Valid maxlength = 50 ký tự, chặn khi nhập quá 50 ký tự * Nếu paste đoạn văn > 50 ký tự, chỉ nhận 50 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp tên Mã trùng với Mã nhóm đã tồn tại trên hệ thống => Hiển thị thông báo IM [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) |
|  | User group name | | Textbox [0;100] | | user\_group\_name/userGroupName | * Bắt buộc nhập * Placeholder: “Nhập tên nhóm người dùng” * Nhận dữ liệu dạng chữ, số, dấu chấm (.), gạch ngang (-), gạch dưới (\_) * Valid maxlength = 100 ký tự, chặn khi nhập quá 100 ký tự * Nếu paste đoạn văn > 100 ký tự, chỉ nhận 100 ký tự đầu tiên * Tự động TRIM Spaces đầu cuối khi out focus box * Trường hợp nội dung dài vượt quá độ rộng box => di chuột vào hiện tooltips hiển thị full nội dung * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj)   + Trường hợp tên Tên trùng với tên nhóm đã tồn tại trên hệ thống => Hiển thị thông báo IM [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) |
| Group box **Phân quyền nhóm người dùng** | | | | | | |
|  | Title | | Textview | |  | Mặc định hiển thị “**Phân quyền nhóm người dùng**” |
|  | Tất cả hệ thống | | Toggle switch | | is\_all\_systems\_enabled | Phân quyền truy cập full 2 hệ thống   * On: Người dùng được phân quyền truy cập cả 2 hệ thống * Off: Người dùng không được phân quyền full 2 hệ thống   **Action**:   * Default Off button * Cho phép On/Off button * Trường hợp user thao tác chuyển từ Off => On button: Tự động On all Toggle switch của 2 hệ thống * Trường hợp user thao tác chuyển từ On => Off button: Tự động Off all Toggle switch của 2 hệ thống * Trường hợp đang On => User thao tác Off button trong list 2 hệ thống bên dưới => tự động chuyển sang Off * Trường hợp button đang Off => chọn Vai trò => tự động On button |
|  | Toggle switch | | Toggle switch | |  | * Hiển thị On/Off quyền trên các hệ thống * Danh sách Toggle switch của các hệ thống trong bảng: * On: Người dùng được phân quyền truy cập hệ thống * Off: Người dùng không được phân quyền truy cập hệ thống |
|  | System | | Textview | |  | Hiển thị [Tên] các hệ thống, bao gồm:   * **System Admin** * **Toss** |

---

*Nguồn: tách trung thực từ `sec-14-quan-ly-nhom-nguoi-dung.md`, mục "Thêm mới Nhóm người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#24** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
