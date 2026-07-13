---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.EDIT_USER"
feature_name: "Sửa Người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Sửa User

| **Tên chức năng: Sửa Người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Sửa Người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý người dùng => nhấn Sửa Người dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền trên phân hệ Quản lý người dùng |
| **Hậu điều kiện** | Màn hình Sửa Người dùng hiển thị |

#### Sơ đồ luồng hệ thống

*(hình ảnh minh họa — xem file gốc/Google Doc)*

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | 1 | User truy cập vào web FIMS => mở đến module Quản lý người dùng =>hiển thị màn hình [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) trên giao diện |
|  | 2 | User click button Sửa Người dùng |
|  | 3 | Hệ thống hiển thị màn hình Sửa Người dùng |
|  | 4 | User nhập dữ liệu và nhấn **Lưu lại** |
|  | 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Trường hợp thiếu dữ liệu bắt buộc/Sai định dạng valid/Call API tạo mới người dùng cho FIMS có lỗi => Báo lỗi theo bước 6 * Ngược lại: Sửa Người dùng thành công => Thực hiện tiếp bước 7 & 8 |
|  | 6 | Hiển thị toast báo lỗi cho người dùng:   * Trường hợp thiếu trường bắt buộc: Hiển thị inline message (IM) tại trường có lỗi [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) * Trường hợp Sai định dạng valid: Hiển thị IM tại trường có lỗi [VL006](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.lwrynb3cmu73) * Trường hợp Call API sửa user trả về lỗi: hiển thị toast message (TM)   + Trường hợp lỗi API trả về có message: hiện [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + Ngược lại: hiện [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)   *(hình ảnh minh họa — xem file gốc/Google Doc)* |
|  | 7 | Trường hợp sửa người dùng thành công: BE Lưu và cập nhật danh sách Users  Trả API thành công cho FE |
|  | 8 | FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  *(hình ảnh minh họa — xem file gốc/Google Doc)*  Đóng popup Sửa, tự động refresh màn danh sách và hiển thị [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)*

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| Kịch bản xử lý mở popup và thao tác tại các trường   * TH sửa người dùng tự khai báo: tương tự [Thêm mới User/Tự khai báo](TOSS.SA.ADD_USER_MANUAL.FD.v0.1.md) * TH sửa người dùng đồng bộ từ LDAP: tương tự [Thêm mới User/Đồng bộ LDAP](TOSS.SA.ADD_USER_LDAP.FD.v0.1.md)   Trong đó:   * Dữ liệu tại các trường được fill sẵn thông tin theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng => để trống trường * Tại màn sửa người dùng tự khai báo => disable box Tài khoản và mật khẩu * Tại màn sửa người dùng đồng bộ từ LDAP => box Tài khoản hiển thị   + Thông tin người dùng => không được sửa   + icon Đồng bộ lại thông tin người dùng *(hình ảnh minh họa — xem file gốc/Google Doc)* => click => call API lấy lại thông tin người dùng mới nhất và update vào phần Thông tin khác * User update thông tin và click Lưu lại:   + Đóng màn hình Sửa người dùng   + Call API Update người dùng vào database   + Hiển thị màn hình thông báo kết quả update nếu:     - Response API trả về status 200: hiển thị toast message thành công: [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + - Ngược lại: hiển thị toast message lỗi theo từng tình huống [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   *(hình ảnh minh họa — xem file gốc/Google Doc)*  Hoặc [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)  *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + FE tự động refresh màn danh sách và hiển thị [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) mới nhất | | | | |

---

*Nguồn: tách trung thực từ `sec-11-quan-ly-nguoi-dung.md`, mục "Sửa Người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#10** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
