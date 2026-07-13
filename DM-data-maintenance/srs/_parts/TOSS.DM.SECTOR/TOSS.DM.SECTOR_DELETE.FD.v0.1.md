---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.SECTOR_DELETE"
feature_name: "Xóa chặng bay"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xóa chặng bay

| **Tên chức năng: Xóa Chặng bay** | |
| --- | --- |
| **Tên chức năng** | Xóa chặng bay |
| **Mục đích** | Cho phép user xóa chặng bay khỏi danh mục |
| **Trigger** | Người dùng click icon **Xóa** tại bản ghi trong danh sách |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và có phân quyền xóa chặng bay |
| **Hậu điều kiện** | Xóa thành công chặng bay khỏi danh sách |

#### Sơ đồ luồng hệ thống

![Ảnh minh họa](../_images/TOSS.DM.SECTOR_DELETE.img01.png)

```mermaid
flowchart TD
    subgraph LANE_USE["Use"]
        ST(("●"))
        U1["(1) Truy cập web FIMS =&gt; mở đến Danh mục =&gt; Chặng bay"]
        U2["(2) Click icon Xoá tại danh sách hoặc button Xoá tại màn hình Xem chi tiết"]
        U4["(4) Nhập lý do và Lưu lại"]
    end
    subgraph LANE_SYS["Hệ thống"]
        S3["(3) Mở màn hình xác nhận Xoá Chặng bay"]
        S5["(5) Kiểm tra dữ liệu"]
        D1{"?"}
        S6["(6) Hiển thị toast message lỗi"]
        S7["(7) Update dữ liệu vào DB"]
        S8["(8) Hiển thị toast message Thêm mới/Sửa thành công"]
        EN(("●"))
    end
    ST --> U1
    U1 --> U2
    U2 --> S3
    S3 --> U4
    U4 --> S5
    S5 --> D1
    D1 -->|"Không hợp lệ"| S6
    D1 -->|"Hợp lệ"| S7
    S6 --> S3
    S7 --> S8
    S8 --> EN
```

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| 1 | User truy cập vào web Fims => mở đến module Danh mục => Chọn Chặng bay => hiển thị màn hình Chặng bay |
| 2 | User click **icon “ Xóa”** |
| 3 | * Mở màn hình xác nhận **Xóa** Chặng bay |
| 4 | * Người dùng nhập Lý do & nhấn button **Lưu lại** |
| 5 | * Hệ thống kiểm tra dữ liệu, nếu:   + Dữ liệu không hợp lệ: chuyển sang bước 6   + Ngược lại: chuyển sang bước 7 |
| 6 | * Hiển thị toast message lỗi đến người dùng |
| 7 | * Update dữ liệu vào DB |
| 8 | * Hiển thị toast message Xóa thành công |

#### Màn hình chức năng

![Ảnh minh họa](../_images/TOSS.DM.SECTOR_DELETE.img02.png)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu** | **Mô tả** |
| --- | --- | --- | --- |
| 1 | Title | Textview | "Xóa chặng bay" |
| 2 | Nội dung cảnh báo | Textview | "Bạn có chắc chắn muốn xóa chặng bay [DEP IATA/ICAO] – [ARR IATA/ICAO] không? Hành động này không thể hoàn tác." |
| 3 | Lý do xóa | Textarea | Bắt buộc nhập. Placeholder: Enter reason… Maxlength 1000 ký tự. Paste vượt quá chỉ nhận 1000 ký tự đầu |
| 4 | Nút **Huỷ** | Button btn-cancel | Click → đóng popup, không xóa |
| 5 | Nút **Xóa** | Button btn-delete | Click → kiểm tra lý do → call API xóa |

---

*Nguồn: tách trung thực từ `sec-30-quan-ly-danh-muc-chang-bay.md`, mục "Xóa chặng bay" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#48** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
