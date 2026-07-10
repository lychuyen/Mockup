---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "VNA/VTIT (nguồn SRS) — trích tách bởi agent BA"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Load Control"
feature_id: "TOSS.FLC.FUEL_ORDER_DETAIL"
feature_name: "Xem details fuel chuyến bay"
group: "Fuel order"
---

> **Phạm vi file:** Feature F07 (nhóm Fuel order) — trích trung thực 100% từ nguồn SRS Flight Load Control do người soạn (CLAUDE.md §0), không suy diễn, không bổ sung.
>
> **⚠ NỘI DUNG MỚI CÓ MỘT PHẦN (giữ nguyên trạng nguồn tại thời điểm đồng bộ 2026-07-10 — CATALOG.md dòng #7, mục 2.2):**
> - **Đã có:** bảng header (Mục đích / Trigger / Tiền điều kiện / Hậu điều kiện) và bảng "Mô tả luồng xử lý" đầy đủ 4 bước.
> - **Vẫn trống:** mục "Màn hình chức năng" và "Mô tả chi tiết màn hình" — không có ảnh, không có bảng, không có trường nào được liệt kê. [Cần làm rõ: nội dung màn hình + đặc tả trường còn thiếu, chưa được VNA/VTIT soạn xong]
> - **Mâu thuẫn còn sót trong nguồn:** Trigger ghi "Chọn tab Fuel Order" nhưng Bước 1 của luồng xử lý ghi "chọn tab Document". [Cần làm rõ: dấu vết sao chép chéo/nhầm lẫn tab — giữ nguyên trạng, không tự sửa]

## **Xem details fuel chuyến bay**

| **Tên chức năng: Xem details fuel chuyến bay** | |
| --- | --- |
| **Mục đích** | Cho phép user xem chi tiết fuel chuyến bay |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Fuel Order =>Nhấp chọn vào 1 bản ghi |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight Load Control |
| **Hậu điều kiện** | Mở màn hình xem chi tiết fuel chuyến bay |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1 | * Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Document |
| 2 | * Hệ thống gọi API để lấy dữ liệu và hiển thị danh sách chuyến bay cùng thông tin fuel lên màn hình |
| 3 | * Người dùng nhấn chọn một bản ghi bất ký trên danh sách |
| 4 | * Hệ thống hiển thị view “Chi tiết fuel chuyến bay”, tương ứng với bản ghi người dùng vừa thao tác |

####

### **Màn hình chức năng**

### **Mô tả chi tiết màn hình**

---

**Nguồn trích:** `sec-10-xem-details-fuel-chuyen-bay.md` (mảnh phân rã h2 từ `TOSS.FLC.ALL.FD.v0.1.md`, đã xóa sau khi tách theo Feature — git giữ lịch sử) · CATALOG.md dòng #7.
