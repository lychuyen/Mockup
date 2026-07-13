---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.DELETE_GROUP"
feature_name: "Xóa nhóm người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Xóa nhóm người dùng

| **Tên chức năng: Xóa nhóm người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Xóa nhóm người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý nhóm người dùng => nhấn Xóa nhóm người dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền trên phân hệ Quản lý nhóm người dùng |
| **Hậu điều kiện** | Màn hình xác nhận **Xóa nhóm người dùng** được hiển thị |

#### Sơ đồ luồng hệ thống

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Sơ đồ luồng xóa nhóm người dùng

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | Bước 1 | User truy cập vào web FIMS => mở đến module Quản lý nhóm người dùng => hiển thị màn hình [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) trên giao diện |
|  | Bước 2 | User click **Xóa nhóm người dùng** |
|  | Bước 3 | Mở màn hình xác nhận **Xóa nhóm người dùng** |
|  | Bước 4 | Người dùng nhập Lý do & nhấn button **Lưu lại** |
|  | Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Dữ liệu không hợp lệ: chuyển sang bước 6 * Ngược lại: chuyển sang bước 7&8 |
|  | Bước 6 | * TH chưa nhập lý do => hiện IM [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) * TH API trả về có messages lỗi khác [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Hoặc: [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)   *(hình ảnh minh họa — xem file gốc/Google Doc)* |
|  | Bước 7,8 | Trường hợp thành công: BE Lưu và cập nhật danh sách nhóm Users, trường **is_delete=true**  Trả API thành công cho FE  FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  *(hình ảnh minh họa — xem file gốc/Google Doc)*  Đóng popup xác nhận Xóa nhóm người dùng, tự động refresh màn danh sách và hiển thị [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Giao diện Xoá nhóm người dùng

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Icon |  | * Icon confirm *(hình ảnh minh họa — xem file gốc/Google Doc)* * Không cho thao tác |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Icon | btn_close | * Icon đóng popup * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Title | Textview |  | * Hiển thị [Bạn chắc chắn muốn xoá nhóm người dùng không?] * Không cho thao tác |
|  | Content | Textview |  | * Hiển thị [Bạn có chắc chắn muốn xóa nhóm người dùng : <Mã + tên nhóm người dùng> không?] * Trong đó: <Mã + tên nhóm người dùng> lấy theo thông tin của nhóm người dùng bị xóa * Không cho thao tác |
|  | Reason | Textbox [0;1000] | reason_delete/reasonDelete | * Mặc định: Để trống và cho nhập thông tin * Placeholder: “Vui lòng nhập lý do...” * Tối đa: 1000 ký tự bao gồm chữ, số và ký tự đặc biệt * Chặn nếu nhập quá 1000 ký tự * Nếu paste đoạn văn > 1000 ký tự, chỉ nhận 1000 ký tự đầu tiên * Bắt buộc nhập * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo inline [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) |
|  | Cancel | Button | btn_cancel | * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Save | Button | btn_save | Click:   * Đóng popup xác nhận * FE call API update trạng thái **is_delete=true** của nhóm người dùng bị xóa * Xử lý Response API trả về, nếu:   **Status = 200**:   * + Hiển thị toast message thành công [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + Sau 3s hoặc người dùng bấm X: đóng toast   + Đóng popup xác nhận Xóa nhóm người dùng, tự động refresh màn danh sách và hiển thị [Danh sách Nhóm Người dùng](TOSS.SA.GROUP_LIST.FD.v0.1.md) mới nhất   **Status ≠ 200**:   * + Hiển thị toast message lỗi   + TH API trả về có messages lỗi khác [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + Hoặc [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + Sau 3s hoặc người dùng bấm X: đóng toast   + Hệ thống không cần xử lý gì |

---

*Nguồn: tách trung thực từ `sec-14-quan-ly-nhom-nguoi-dung.md`, mục "Xóa nhóm người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#26** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
