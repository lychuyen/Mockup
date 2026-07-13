---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.COUNTRY_DETAIL"
feature_name: "Xem chi tiết Quốc gia"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xem chi tiết Quốc gia

| **Tên chức năng: Xem chi tiết quốc gia** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem chi tiết Quốc gia |
| **Trigger** | Người dùng truy cập vào web FIMS => mở đến module Quốc gia => click vào 1 bản ghi bất kỳ |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Danh mục Quốc gia |
| **Hậu điều kiện** | Mở màn hình Xem chi tiết Quốc gia-Thông tin Quốc gia trên giao diện người dùng |

#### Sơ đồ luồng hệ thống

![Ảnh minh họa](../_images/TOSS.DM.COUNTRY_DETAIL.img01.png)

```mermaid
flowchart TD
    subgraph LANE_USER["User"]
        START(("●"))
        U1["1. Người dùng truy cập ODP, chọn Danh mục =&gt; quốc gia"]
        U4["4. Chọn 1 bản ghi trên danh sách"]
    end
    subgraph LANE_SYS["Hệ thống"]
        S2["2. Gọi API để lấy dữ liệu quốc gia"]
        S3["3. Hiển thị danh sách quốc gia"]
        S5["5. Hiển thị màn hình view chi tiết quốc gia"]
        END_NODE((("●")))
    end
    START --> U1
    U1 --> S2
    S2 --> S3
    S3 --> U4
    U4 --> S5
    S5 --> END_NODE
```

1. Sơ đồ luồng xem chi tiết quốc gia

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | Bước 1 | Truy cập web FIMS => mở đến Danh mục quốc gia |
|  | Bước 2 | Hệ thống call API xuống BE lấy [danh sách quốc gia](TOSS.DM.COUNTRY_LIST.FD.v0.1.md) |
|  | Bước 3 | Hiển thị [danh sách quốc gia](TOSS.DM.COUNTRY_LIST.FD.v0.1.md) trên giao diện người dùng |
|  | Bước 4 | User click vào 1 bản ghi trên danh sách |
|  | Bước 5 | Hiển thị màn hình Xem chi tiết quốc gia |

#### Màn hình chức năng

![Ảnh minh họa](../_images/TOSS.DM.COUNTRY_DETAIL.img02.png)

1. Giao diện xem chi tiết quốc gia

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | Title | Textview |  | * Text cứng “Country Information” |
|  | Icon X | Icon |  | * Click icon → Đóng popup. Điều hướng về màn trước đó |
|  | ![Ảnh minh họa](../_images/TOSS.DM.COUNTRY_DETAIL.img03.png) | Button | btn_edit | * Click button=> Hiển thị popup [Sửa quốc gia](TOSS.DM.COUNTRY_EDIT.FD.v0.1.md) |
|  | ![Ảnh minh họa](../_images/TOSS.DM.COUNTRY_DETAIL.img04.png) | Button | btn_delete | * Click button=> Hiển thị popup [Xóa quốc gia](TOSS.DM.COUNTRY_DELETE.FD.v0.1.md) |
| Thông tin chi tiết | | | | |
|  | Country code | Textview | country_code/countryCode | Hiển thị [countryCode] theo dữ liệu API trả về  Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Country name | Textview | country_name/countryName | Hiển thị [countryName] theo dữ liệu API trả về  Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Abbreviation | Textview | abbreviation_name/abbreviationName | Hiển thị [abbreviationName] theo dữ liệu API trả về  Trường hợp API trả về rỗng/lỗi: để trống trường |

---

*Nguồn: tách trung thực từ `sec-25-quan-ly-danh-muc-quoc-gia.md`, mục "Xem chi tiết Quốc gia" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#26** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
