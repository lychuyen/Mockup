---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.AIRCRAFT_LIST"
feature_name: "Danh sách tàu bay"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

## Quản lý Tàu bay

### Danh sách tàu bay

| **Tên chức năng**: Xem danh sách Tàu bay | |
| --- | --- |
| Mục đích | Cho phép user xem, tìm kiếm và lọc, xuất excel danh sách tàu bay hiện có trong hệ thống |
| Trigger | Người dùng truy cập vào web =>Chọn Data Maintenance => mở đến module Danh mục tàu bay |
| Tiền điều kiện | Người dùng đăng nhập thành công và được phân quyền xem Danh mục tàu bay |
| Hậu điều kiện | Màn hình danh sách tàu bay được hiển thị |

#### Sơ đồ luồng

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng đăng nhập vào hệ thống TOSS. |
| 2 | Người dùng truy cập module Data Maintenance và chọn chức năng Quản lý tàu bay (Aircraft Fleet) trên menu sidebar. |
| 3 | Hệ thống gọi API lấy danh sách Aircraft Type và hiển thị dữ liệu trên màn hình Quản lý tàu bay. |

####

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| Danh sách tàu bay:   * FE call API lấy lại danh sách Aircraft Type List mới nhất hiện tại để hiển thị trên giao diện người dùng bao gồm những thông tin sau:   + Aircraft Type Name   + Status * Các thông tin đồng bộ từ lịch bay (Netline ops++) về làm danh mục bao gồm:   + AC Registration   + AC Subtype | | | | |
| 1 | Aircraft Type List | Title |  | Fix cứng text “ Aircraft Type List “ |
| 2 | ![](data:image/png;base64...) | Button |  | Click: refresh màn hình => FE call API lấy lại DS tàu bay mới nhất hiện tại để hiển thị trên giao diện người dùng, nếu có bộ lọc thì giữ nguyên điều kiện lọc   * Trường hợp response API trả về thành công và có dữ liệu: hiển thị danh sách tàu bay vào bảng bên dưới * Ngược lại: (API trả về rỗng hoặc lỗi) Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0** |
| 3 | ![](data:image/png;base64...) | Button |  | * Tên file tải về: TOSS[\_Aircraft Type List\_ddmmyyhhss](https://docs.google.com/spreadsheets/d/1htVzBzmkNyh0f7PXmugySx0KOOecKaoT/edit?usp=drive_link&ouid=115403346570548127295&rtpof=true&sd=true) * Nội dung file tải về: tải theo cột dữ liệu view từ bảng danh sách tàu bay |
| 4 | No | Textview |  | * Số thứ tự cho từng bản ghi |
| 5 | AC Registration | Textview |  | * Hiển thị AC Registration * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
|  | ICAO Designator | Textview |  | * Hiển thị ICAO Designator * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
|  | IATA Designator | Textview |  | * Hiển thị IATA Designator * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 6 | AC Subtype | Textview |  | * Hiển thị tên AC Subtype * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 7 | Aircraft Type Name | Textview |  | * Hiển thị tên Aircraft Type Name * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 8 | Status | Tag | status | * Active: Tag màu xanh lá * Inactive: Tag màu xám |
| 9 | Chân trang | Pagination |  | [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.5b0ejgezpbny) |

---

*Nguồn: tách trung thực từ `sec-33-quan-ly-tau-bay.md`, mục "Danh sách tàu bay" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#59** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
