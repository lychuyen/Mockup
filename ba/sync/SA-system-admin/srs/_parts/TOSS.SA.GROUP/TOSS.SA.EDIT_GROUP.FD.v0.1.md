---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.EDIT_GROUP"
feature_name: "Sửa nhóm Người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Sửa nhóm người dùng

| **Tên chức năng: Sửa nhóm Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Sửa nhóm Người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý nhóm người dùng => nhấn Sửa nhóm Người dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền trên phân hệ Quản lý nhóm người dùng |
| **Hậu điều kiện** | Màn hình Sửa nhóm Người dùng hiển thị |

#### Sơ đồ luồng hệ thống

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Sơ đồ luồng sửa nhóm người dùng

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | Bước 1 | User truy cập vào web FIMS => mở đến module Quản lý nhóm người dùng => hiển thị màn hình [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) trên giao diện |
|  | Bước 2 | User click button Sửa nhóm Người dùng |
|  | Bước 3 | Hệ thống hiển thị màn hình Sửa nhóm Người dùng |
|  | Bước 4 | User nhập dữ liệu và nhấn **Lưu lại** |
|  | Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Trường hợp thiếu dữ liệu bắt buộc/Sai định dạng valid/Call API tạo mới người dùng cho FIMS có lỗi => Báo lỗi theo bước 6 * Ngược lại: [Sửa Người dùng](../TOSS.SA.USER/TOSS.SA.EDIT_USER.FD.v0.1.md) thành công => Thực hiện tiếp bước 7 & 8 |
|  | Bước 6 | Hiển thị toast báo lỗi cho người dùng:   * Trường hợp thiếu trường bắt buộc: Hiển thị inline message (IM) tại trường có lỗi [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) * Trường hợp Sai định dạng valid: Hiển thị IM tại trường có lỗi [VL006](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.lwrynb3cmu73) * Trường hợp Call API sửa user trả về lỗi: hiển thị toast message (TM)   + Trường hợp lỗi API trả về có message: hiện [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + Hoặc: hiện [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)   *(hình ảnh minh họa — xem file gốc/Google Doc)* |
|  | Bước 7 | Trường hợp [sửa người dùng](../TOSS.SA.USER/TOSS.SA.EDIT_USER.FD.v0.1.md) thành công: BE Lưu và cập nhật danh sách nhóm Users  Trả API thành công cho FE |
|  | Bước 8 | FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  *(hình ảnh minh họa — xem file gốc/Google Doc)*  Đóng popup Sửa, tự động refresh màn danh sách và hiển thị [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Giao diện Sửa nhóm người dùng

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| Kịch bản xử lý mở popup và thao tác tại các trường: tương tự [Thêm mới nhóm người dùng](TOSS.SA.ADD_GROUP.FD.v0.1.md)  Trong đó:   * Dữ liệu tại các trường được fill sẵn thông tin theo dữ liệu API trả về * Disable trường Mã nhóm - không cho sửa * TH sửa nhóm người dùng mặc định (Phi công, Tiếp viên, Học viên, Vasco, Thợ máy): **Chỉ cho sửa bảng Vai trò** * Trường hợp API trả về lỗi/rỗng => để trống trường * User update thông tin và click Lưu lại:   + Đóng màn hình Sửa nhóm người dùng   + Call API Update nhóm người dùng vào database   + Hiển thị màn hình thông báo kết quả update nếu:     - Response API trả về status 200: hiển thị toast message thành công [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + - Ngược lại: hiển thị toast message lỗi theo từng tình huống [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   *(hình ảnh minh họa — xem file gốc/Google Doc)*  Hoặc [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)  *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + FE tự động refresh màn danh sách và hiển thị [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) mới nhất * User update thông tin và click Đóng: Đóng màn hình Sửa nhóm người dùng và không cần xử lý gì | | | | |

---

*Nguồn: tách trung thực từ `sec-14-quan-ly-nhom-nguoi-dung.md`, mục "Sửa nhóm Người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#25** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
