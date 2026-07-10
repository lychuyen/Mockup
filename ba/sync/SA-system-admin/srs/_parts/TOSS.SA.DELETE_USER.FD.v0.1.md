---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.DELETE_USER"
feature_name: "Xóa người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Xóa người dùng

| **Tên chức năng: Xóa người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Xóa người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý người dùng => nhấn Xóa người dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền trên phân hệ Quản lý người dùng |
| **Hậu điều kiện** | Màn hình xác nhận **Xóa người dùng** được hiển thị |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | 1 | * User truy cập vào web FIMS => mở đến module Quản lý người dùng => hiển thị màn hình [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) trên giao diện |
|  | 2 | * User click **Xóa người dùng** |
|  | 3 | * Mở màn hình xác nhận **Xóa người dùng** |
|  | 4 | * Người dùng nhập Lý do & nhấn button **Lưu lại** |
|  | 5 | * Hệ thống kiểm tra dữ liệu, nếu:   + Dữ liệu không hợp lệ: chuyển sang bước 8   + Ngược lại: chuyển sang bước 9 |
|  | 6 | * TH chưa nhập lý do => hiện IM [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) * TH User đã có lịch sử cập nhật dữ liệu trên hệ thống => hiện toast lỗi [TB022](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.ditg2fh3llv7) * ![](data:image/png;base64...) * TH API trả về có messages lỗi khác [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh) * ![](data:image/png;base64...) * Ngược lại: [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0) * ![](data:image/png;base64...) |
|  | 7 | * Trường hợp thành công: BE Lưu và cập nhật danh sách Users, trường **is\_delete=true** * Trả API thành công cho FE * FE Hiển thị toast thành công cho người dùng * ![](data:image/png;base64...) * Đóng popup xác nhận Xóa người dùng, tự động refresh màn danh sách và hiển thị [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | ![](data:image/png;base64...) | Icon |  | * Icon confirm ![](data:image/png;base64...) * Không cho thao tác |
|  | ![](data:image/png;base64...) | Icon | btn\_close | * Icon đóng popup * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Title | Textview |  | * Hiển thị [Bạn chắc chắn muốn xóa không?] * Không cho thao tác |
|  | Content | Textview |  | * Hiển thị [Bạn có chắc chắn muốn xóa người dùng : <Mã + tên người dùng> không?] * Trong đó: <Mã + tên người dùng> lấy theo thông tin của người dùng bị xóa * Không cho thao tác |
|  | Reason | Textbox [0;1000] | reason | * Mặc định: Để trống và cho nhập thông tin * Placeholder: “Vui lòng nhập lý do...” * Tối đa: 1000 ký tự bao gồm chữ, số và ký tự đặc biệt * Chặn nếu nhập quá 1000 ký tự * Nếu paste đoạn văn > 1000 ký tự, chỉ nhận 1000 ký tự đầu tiên * Bắt buộc nhập * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo IM: [VL004](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.oq8nkssherqj) |
|  | Cancel | Button | btn\_cancel | * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Save | Button | btn\_save | * Click: * Đóng popup xác nhận * FE call API update trạng thái **is\_delete=true** của người dùng bị xóa * Xử lý Response API trả về, nếu:   + **Status = 200**:   + Hiển thị toast message thành công * ![](data:image/png;base64...)   + Sau 3s hoặc người dùng bấm X: đóng toast   + Đóng popup xác nhận Xóa người dùng, tự động refresh màn danh sách và hiển thị [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) mới nhất   + **Status ≠ 200**:   + Hiển thị toast message lỗi   + TH User đã có lịch sử cập nhật dữ liệu trên hệ thống => hiện toast lỗi * ![](data:image/png;base64...)   + TH API trả về có messages lỗi khác * ![](data:image/png;base64...)   + Ngược lại:   + ![](data:image/png;base64...)   + Sau 3s hoặc người dùng bấm X: đóng toast   + Hệ thống không cần xử lý gì |

---

*Nguồn: tách trung thực từ `sec-11-quan-ly-nguoi-dung.md`, mục "Xóa người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#12** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
