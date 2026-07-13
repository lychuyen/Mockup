---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.TOGGLE_ROLE"
feature_name: "Bật/tắt hoạt động vai trò"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Bật/tắt hoạt động vai trò

| **Tên chức năng: Bật/tắt Hoạt động vai trò** | |
| --- | --- |
| **Mục đích** | Cho phép người dùng **Bật/tắt Hoạt động vai trò** |
| **Trigger** | Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Quản lý vai trò => Click Toggle switch button **Hoạt động** |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Xem/Thêm mới/Sửa/[Xóa vai trò](TOSS.SA.DELETE_ROLE.FD.v0.1.md)/phân hệ Quản lý vai trò |
| **Hậu điều kiện** | Màn hình xác nhận **Bật/tắt Hoạt động vai trò** được hiển thị với người dùng |

#### Sơ đồ luồng hệ thống

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Sơ đồ luồng hệ thống

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
|  | * Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Quản lý vai trò |
|  | * Nhấn Toggle switch button **Hoạt động** trên [danh sách vai trò](TOSS.SA.ROLE_LIST.FD.v0.1.md) |
|  | * Hệ thống kiểm tra quyền, nếu:   + User không được phân quyền Xem/Thêm mới/Sửa/[Xóa vai trò](TOSS.SA.DELETE_ROLE.FD.v0.1.md): chuyển sang bước 4   + Ngược lại: chuyển sang bước 5 |
|  | * Hiển thị toast message lỗi đến người dùng   *(hình ảnh minh họa — xem file gốc/Google Doc)* |
|  | * Mở màn hình xác nhận **Turn Role Activities On/Off** |
|  | * Người dùng nhấn button **Save** |
|  | * Update dữ liệu vào DB |
|  | * Hiển thị toast message **Turn Role Activities On/Off** thành công |

#### Màn hình chức năng

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Popup Bật/tắt trạng thái

*(hình ảnh minh họa — xem file gốc/Google Doc)*

1. Popup bật/tắt trạng thái hoạt động

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Icon |  | * Icon confirm *(hình ảnh minh họa — xem file gốc/Google Doc)* * Không cho thao tác |
|  | *(hình ảnh minh họa — xem file gốc/Google Doc)* | Icon |  | * Icon đóng popup * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Title | Textview |  | * Hiển thị [Are you sure you want the <operation> to be active??]   <operation> =   * + On Toggle switch button: <turn on>   + Off Toggle switch button: <turn off> * Không cho thao tác |
|  | Content | Textview |  | * Với bật trạng thái: Hiển thị [Are you sure you want the <action> role activity status: <Role ID>?] * Trong đó: <Role ID> lấy theo thông tin của vai trò được khôi phục * Không cho thao tác * Với tắt trạng thái: Vai trò<Role ID> đang được gán với [số lượng người gán với vai trò đó] user. Bạn có chắc chắn muốn bật trạng thái hoạt động vai trò không? * Trong đó: <Role ID> lấy theo thông tin của vai trò được khôi phục * Không cho thao tác |
|  | Cancel | Button |  | * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì |
|  | Save | Button |  | Click:   * Đóng popup xác nhận * FE call API update trạng thái hoạt động của vai trò thành   + TH On Toggle switch button: **Đang hoạt động**   + Ngược lại: **Ngừng hoạt động** * Xử lý Response API trả về, nếu:   **Status = 200**:   * + Hiển thị toast message thành công   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + Trong đó:     - TH On Toggle switch button: **Bật trạng thái hoạt động**     - Ngược lại: **Tắt trạng thái hoạt động**   + Sau 3s hoặc người dùng bấm X: đóng toast   + Update trạng thái của vai trò trên danh sách thành     - TH On Toggle switch button: **Đang hoạt động**     - Ngược lại: **Ngừng hoạt động**   + Update Toggle switch button **Hoạt động** thành **On/Off** tương ứng trạng thái   + Update list icon function theo trạng thái hoạt động   + Khi vai trò **Ngừng hoạt động**: chặn toàn bộ quyền của các user được gán với vai trò này.   + Khi vai trò được **kích hoạt lại**: khôi phục quyền của các user được gán với vai trò.   + Chặn quyền theo vai trò của các user được gán với vai trò bị tắt trạng thái hoạt động và ngược lại   **Status ≠ 200**:   * + Hiển thị toast message lỗi   *(hình ảnh minh họa — xem file gốc/Google Doc)*   * + Sau 3s hoặc người dùng bấm X: đóng toast   + Hệ thống không cần xử lý gì |

---

*Nguồn: tách trung thực từ `sec-12-quan-ly-vai-tro.md`, mục "Bật/tắt hoạt động vai trò" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#21** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
