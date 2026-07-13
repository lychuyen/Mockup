---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.AIRPORT_DETAIL"
feature_name: "Xem chi tiết sân bay"
---

## Xem chi tiết sân bay

| **Tên chức năng: View detail sân bay** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem chi tiết sân bay |
| **Trigger** | Người dùng truy cập vào web FIMS => mở đến module sân bay => click vào 1 bản ghi bất kỳ |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Danh mục sân bay |
| **Hậu điều kiện** | Mở màn hình Xem chi tiết sân bay trên giao diện người dùng |

### *Sơ đồ luồng hệ thống*

![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img01.png)

```mermaid
flowchart TD
    subgraph SG1["User"]
        S0(("●"))
        A1["1. Người dùng truy cập ODP, chọn Danh mục =&gt; Sân bay"]
        A4["4. Chọn 1 bản ghi trên danh sách"]
    end
    subgraph SG2["Hệ thống"]
        A2["2. Gọi API để lấy dữ liệu sân bay"]
        A3["3. Hiển thị danh sách sân bay"]
        A5["5. Hiển thị màn hình view chi tiết sân bay"]
        E0((("●")))
    end
    S0 --> A1
    A1 --> A2
    A2 --> A3
    A3 --> A4
    A4 --> A5
    A5 --> E0
```

1. Sơ đồ luồng nghiệp vụ

### *Mô tả luồng xử lý*

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
|  | Bước 1 | Truy cập web FIMS => mở đến Danh mục sân bay |
|  | Bước 2 | Hệ thống call API xuống BE lấy [danh sách sân bay](TOSS.DM.AIRPORT_LIST.FD.v0.1.md) |
|  | Bước 3 | Hiển thị [danh sách sân bay](TOSS.DM.AIRPORT_LIST.FD.v0.1.md) trên giao diện người dùng |
|  | Bước 4 | User click vào 1 bản ghi trên danh sách |
|  | Bước 5 | Hiển thị màn hình Xem chi tiết sân bay |

### *Màn hình chức năng*

![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img02.png)

1. Giao diện Thông tin chi tiết sân bay

### *Mô tả chi tiết màn hình danh sách*

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| 1. ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img03.png) | ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img04.png) | Button |  | * Click button=> Hiển thị popup Edit sân bay |
|  | ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img05.png) | Button |  | * Click button=> Hiển thị popup History of sân bay |
|  | ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img06.png) | Button |  | * Click button=> Hiển thị popup Delete sân bay |
|  | IATA Code | Textview |  | * Hiển thị [IATA Code] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | ICAO Code | Textview |  | * Hiển thị [ICAO Code] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Airport Name | Textview |  | * Hiển thị [Airport Name] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Region | Textview |  | * Hiển thị [Region] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Country name | Textview |  | * Hiển thị [Country name] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Fleets | Textview |  | * Hiển thị [Fleets] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Main Base | Textview |  | * Hiển thị [Base] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Note | Textview |  | * Hiển thị [Note] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Status | Textview |  | * Hiển thị thông tin [Trạng thái hoạt động] dưới dạng tag status theo dữ liệu API trả về   + Status=Active: Tag màu xanh lá   + Status=Is active: Tag màu xám |
|  | Tag chức năng | Toggle |  | * Màn hình hiển thị danh sách các phân hệ nghiệp vụ dưới dạng tab gồm: * Meteorology and Environment * Minima * CHC infrastructure * Flight procedures, …. * Cho phép người dùng chuyển đổi giữa các phân hệ để cấu hình quyền tương ứng * Khi chuyển tab, hệ thống hiển thị danh sách quyền của phân hệ được chọn |
|  | Time | Date |  | * Cho phép chọn khoảng ngày để xem dữ liệu * Hiển thị định dạng dd-mm-yyyy -> dd-mm-yyyy |
|  | ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img07.png) | Button | btn_search | * Click vào ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img08.png):   + Gửi yêu cầu tìm kiếm tới hệ thống.   + Gọi API lấy dữ liệu theo khoảng time * Hiển thị danh sách kết quả phù hợp trong bảng dữ liệu.   Khi người dùng **nhấn phím Enter trên bàn phím** khi lọc ngày :   * Hệ thống PHẢI thực hiện tìm kiếm tương đương với hành động click nút “Search”. * Kết quả tìm kiếm, logic xử lý và dữ liệu trả vềgiống hoàn toàn với nút Search |
|  | ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img09.png) | Button | btn_refresh | * Click ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img10.png): làm mới dữ liệu đang hiển thị |
|  | ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img11.png) | String |  | * Hiển thị thông tin thời tiết theo dữ liệu API trả về:   + Icon hiển thị theo điều kiện thời tiết ( nắng, mưa, nhiều mây,..)   + Hiển thị nhiệt độ theo đơn vị **°C** * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | ![Ảnh minh họa](../_images/TOSS.DM.AIRPORT_DETAIL.img12.png) | String |  | * Hiển thị thông tin môi trường theo dữ liệu API trả về:   + Icon hiển thị theo điều kiện thời tiết ( nắng, mưa, nhiều mây,..)   + Hiển thị tổng lượng mưa theo thời gian xác định đơn vị **mm** * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  |  |  |  |  |
|  |  |  |  |  |

---

*Nguồn: tách trung thực từ `sec-15-xem-chi-tiet-san-bay.md` (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, mục `Xem chi tiết sân bay`) — tương ứng dòng **#2** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
