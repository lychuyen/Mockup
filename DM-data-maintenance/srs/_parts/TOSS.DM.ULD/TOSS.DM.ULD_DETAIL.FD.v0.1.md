---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.ULD_DETAIL"
feature_name: "Xem chi tiết ULD"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xem chi tiết ULD

| **Tên chức năng: Xem chi tiết ULD** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem chi tiết ULD |
| **Trigger** | Người dùng truy cập vào web FIMS => mở đến module ULD => click vào 1 bản ghi bất kỳ |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Danh mục ULD |
| **Hậu điều kiện** | Mở màn hình Xem chi tiết ULD -Thông tin ULD trên giao diện người dùng |

#### Sơ đồ luồng hệ thống

![Ảnh minh họa](../_images/TOSS.DM.ULD_DETAIL.img01.png)

```mermaid
flowchart TD
    subgraph SG1["User"]
        S0(("●"))
        A1["1. Người dùng truy cập ODP, chọn danh mục quản trị =&gt; Danh mục ULD"]
        A4["4. Chọn 1 bản ghi trên danh sách"]
    end
    subgraph SG2["Hệ thống"]
        A2["2. Gọi API để lấy dữ liệu ULD"]
        A3["3. Hiển thị danh sách ULD"]
        A5["5. Hiển thị màn hình view chi tiết ULD"]
        E0((("●")))
    end
    S0 --> A1
    A1 --> A2
    A2 --> A3
    A3 --> A4
    A4 --> A5
    A5 --> E0
```

1. Sơ đồ luồng xem chi tiết ULD

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
| **1** | Bước 1 | Truy cập web FIMS => mở đến Danh mục ULD |
| **2** | Bước 2 | Hệ thống call API xuống BE lấy [danh sách ULD](TOSS.DM.ULD_LIST.FD.v0.1.md) |
| **3** | Bước 3 | Hiển thị [danh sách ULD](TOSS.DM.ULD_LIST.FD.v0.1.md) trên giao diện người dùng |
| **4** | Bước 4 | User click vào 1 bản ghi trên danh sách |
| **5** | Bước 5 | Hiển thị màn hình Xem chi tiết ULD |

#### Màn hình chức năng

![Ảnh minh họa](../_images/TOSS.DM.ULD_DETAIL.img02.png)

1. Giao diện xem chi tiết ULD

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **1** | Sửa thông tin | Button |  | * Click button=> Hiển thị popup [Sửa ULD](TOSS.DM.ULD_EDIT.FD.v0.1.md) |
| **2** | Xóa | Button |  | * Click button=> Hiển thị popup [Xóa ULD](TOSS.DM.ULD_DELETE.FD.v0.1.md) |
| Thông tin chi tiết | | | | |
| **3** | ULD | Textview |  | * Hiển thị [ULD] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **4** | ULD Type | Textview |  | * Hiển thị [ULD Type] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **5** | Trạng thái | Textview |  | * Hiển thị thông tin [status] dưới dạng tag status theo dữ liệu API trả về   + Status=Active: Tag màu xanh lá   + Status=Inactive: Tag màu xám |
| **6** | Tare Weight (kg) | Number |  | * Hiển thị [Tare Weight (kg)] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **7** | Owner | Textview |  | * Hiển thị [Owner] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **8** | Current Location | Textview |  | * Hiển thị [Current Location] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
| **9** | Serial list | Textview |  | * Hiển thị [bảng Serial list] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |

---

*Nguồn: tách trung thực từ `sec-29-quan-ly-danh-muc-uld.md`, mục "Xem chi tiết ULD" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#45** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
