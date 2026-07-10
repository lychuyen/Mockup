---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.TOGGLE_USER"
feature_name: "Bật/tắt hoạt động người dùng"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Bật tắt hoạt động người dùng

| **Tên chức năng: Bật/tắt hoạt động người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user Bật/tắt hoạt động người dùng |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Quản lý người dùng => nhấn Bật/tắt hoạt động người dùng |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền trên phân hệ Quản lý người dùng |
| **Hậu điều kiện** | Màn hình xác nhận **Bật/tắt Hoạt động** được hiển thị với người dùng |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | 1 | User truy cập vào web FIMS => mở đến module Quản lý người dùng =>hiển thị màn hình [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) trên giao diện |
|  | 2 | User click icon Bật/tắt hoạt động người dùng - > |
|  | 3 | Hệ thống kiểm tra quyền, nếu:  User không được phân quyền Bật/tắt hoạt động người dùng: chuyển sang bước 4  Ngược lại: chuyển sang bước 5 |
|  | 4 | Hiển thị toast message lỗi đến người dùng  ![](data:image/png;base64...) |
|  | 5 | Mở màn hình xác nhận Bật/tắt hoạt động người dùng  -> Tài khoản người dùng đang đăng nhập trên bất kì thiết bị, trình duyệt nào đều bị log out ngay lập tức |
|  | 6 | Người dùng nhấn button **Lưu lại**, hệ thống call API update trạng thái hoạt động người dùng, nếu:  Cập nhật trạng thái người dùng thành công: Thực hiện bước 7 & 8  Ngược lại: BE trả lỗi cho FE và hiển thị lỗi với người dùng  TH API trả về có messages lỗi  ![](data:image/png;base64...)  Ngược lại:  ![](data:image/png;base64...) |
|  | 7 | Trường hợp thành công: BE Lưu và cập nhật danh sách Users  Trả API thành công cho FE |
|  | 8 | FE Hiển thị toast thành công cho người dùng  ![](data:image/png;base64...)  Đóng popup xác nhận Bật/tắt hoạt động người dùng, tự động refresh màn danh sách và hiển thị [danh sách người dùng](TOSS.SA.USER_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | ![](data:image/png;base64...) | Icon |  | * Icon confirm ![](data:image/png;base64...) * Không cho thao tác |
|  | ![](data:image/png;base64...) | Icon | btn\_close | * Icon đóng popup * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Title | Textview |  | * Hiển thị [Bạn chắc chắn muốn <thao tác> trạng thái hoạt động không?]   + <thao tác> =   + On Toggle switch button: <bật>   + Off Toggle switch button: <tắt> * Không cho thao tác |
|  | Content | Textview |  | * Hiển thị [Bạn có chắc chắn muốn <thao tác> trạng thái hoạt động người dùng: <Mã + Tên người dùng> không?] * Trong đó: <Mã + Tên người dùng> lấy theo thông tin của người dùng được thực hiện * Không cho thao tác |
|  | Cancel | Button | btn\_cancel | * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |

---

*Nguồn: tách trung thực từ `sec-11-quan-ly-nguoi-dung.md`, mục "Bật/tắt hoạt động người dùng" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#11** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
