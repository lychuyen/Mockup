---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.FLEET_DELETE"
feature_name: "Xoá Đội bay"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xoá Đội bay

| **Tên chức năng: Xóa Đội bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Xóa Đội bay |
| **Trigger** | Người dùng truy cập vào web Fims => nhấn phân hệ Danh mục => Đội bay => nhấn icon Xóa |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền trên phân hệ Đội bay |
| **Hậu điều kiện** | Màn hình xác nhận **Xóa Đội bay** được hiển thị |

#### Sơ đồ luồng hệ thống

**![Ảnh minh họa](../_images/TOSS.DM.FLEET_DELETE.img01.png)**

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | User truy cập vào web Fims => mở đến module Danh mục => Chọn Đội bay => hiển thị màn hình Đội bay |
| 2 | User click **icon “ Xóa”** |
| 3 | * Mở màn hình xác nhận **Xóa** Đội bay |
| 4 | * Người dùng nhập Lý do & nhấn button **Lưu lại** |
| 5 | * Hệ thống kiểm tra dữ liệu, nếu:   + Dữ liệu không hợp lệ: chuyển sang bước 6   + Dữ liệu xóa hợp lệ: Đội bay chưa được gắn vào bất kỳ user nào  + Dữ liệu không hợp lệ: Đội bay đã được gán thông tin   * + Ngược lại: chuyển sang bước 7 |
| 6 | * Hiển thị toast message lỗi đến người dùng |
| 7 | * Update dữ liệu vào DB |
| 8 | * Hiển thị toast message Xóa thành công |

#### Màn hình chức năng

**![Ảnh minh họa](../_images/TOSS.DM.FLEET_DELETE.img02.png)**

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **1.** | **![Ảnh minh họa](../_images/TOSS.DM.FLEET_DELETE.img03.png)** | Icon |  | * Fix cứng, không cho thao tác |
| **2.** | **![Ảnh minh họa](../_images/TOSS.DM.FLEET_DELETE.img04.png)** | Icon |  | * Icon đóng popup * Click: Đóng popup, hệ thống không cần xử lý gì, trở ra màn hình [Danh sách Đội bay](TOSS.DM.FLEET_LIST.FD.v0.1.md) |
| **3.** | Title | Textview |  | * Xóa Đội bay * Không cho thao tác |
| **4.** | Content | Textview |  | * Hiển thị [Bạn có chắc chắn muốn xóa Đội bay:< Mã Đội bay >- <Tên Đội bay > không?] * Trong đó: < Mã Đội bay > và < Tên Đội bay > lấy theo thông tin của Đội bay bị xóa * Không cho thao tác |
|  | Reason | Textbox |  | * Bắt buộc nhập * Mặc định: Để trống và cho nhập thông tin * Placeholder: “Please enter reason.....” * Tối đa: 1000 ký tự bao gồm chữ, số và ký tự đặc biệt * Chặn nếu nhập quá 1000 ký tự * Nếu paste đoạn văn > 1000 ký tự, chỉ nhận 1000 ký tự đầu tiên * Bắt buộc nhập * Tự động TRIM Spaces đầu cuối khi out focus box * **Action**: Nhấn Enter/out focus/click button **Lưu lại**, hệ thống validate, nếu   + Để trống ⇒ Hiển thị thông báo inline:” Không được để trống” |
|  | **![Ảnh minh họa](../_images/TOSS.DM.FLEET_DELETE.img05.png)** | Button |  | * Click: Đóng popup xác nhận, hệ thống không cần xử lý gì, đóng popup Xác nhận xóa và trở ra màn hình Đội bay |
|  | **![Ảnh minh họa](../_images/TOSS.DM.FLEET_DELETE.img06.png)** | Button |  | Click:   * Đóng popup xác nhận   + Hiển thị toast message thành công   ![Ảnh minh họa](../_images/TOSS.DM.FLEET_DELETE.img07.png)   * + Sau 3s hoặc người dùng bấm X: đóng toast   + Đóng popup xác nhận xóa Đội bay, tự động refresh màn danh sách và hiển thị [danh sách Đội bay](TOSS.DM.FLEET_LIST.FD.v0.1.md) mới nhất   + Nếu Flight Fleet Code đang được gắn với Ac subtype => Không cho phép xóa và hiển thị toast cảnh báo: The Flight Fleet Code cannot be deleted because it is currently associated with [n] AC Subtype     - [n] là số AC subtype được gắn bởi Flight Fleet code |

---

*Nguồn: tách trung thực từ `sec-31-quan-ly-danh-muc-doi-bay.md`, mục "Xoá Đội bay" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#52** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
