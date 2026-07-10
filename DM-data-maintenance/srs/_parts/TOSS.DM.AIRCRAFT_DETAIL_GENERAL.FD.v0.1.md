---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.AIRCRAFT_DETAIL_GENERAL"
feature_name: "Xem chi tiết tàu bay — tab General Information"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xem chi tiết tàu bay - tab General Information

| **Tên chức năng: Xem chi tiết tàu bay - tab General Information** | |
| --- | --- |
| **Mục đích** | Cho phép user Xem chi tiết tàu bay - tab General Information |
| **Trigger** | Người dùng truy cập vào web => Chọn Data Maintenance => nhấn Danh mục tàu bay => nhấn vào 1 dòng tàu bay bất kỳ => click General Information |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem phân hệ Tàu bay |
| **Hậu điều kiện** | Màn hình Xem chi tiết tàu bay - tab General Information hiển thị |

####

#### Sơ đồ luồng

![](data:image/png;base64...)

#### Mô tả luồng xử lý

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng đăng nhập vào hệ thống TOSS, truy cập module Data Maintenance và chọn tab Quản lý tàu bay (Aircraft Fleet). |
| 2 | Hệ thống gọi API lấy [danh sách Aircraft](TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md) Type và hiển thị [danh sách tàu bay](TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md). |
| 3 | Người dùng chọn một tàu bay để xem thông tin chi tiết |
| 4 | Hệ thống hiển thị màn hình chi tiết của tàu bay đã chọn. |
| 5 | Người dùng chọn tab General Information |
| 6 | Hệ thống gọi API lấy thông tin General Information của tàu bay và hiển thị dữ liệu trên màn hình. |

#### Màn hình chức năng

![](data:image/png;base64...)

#### Mô tả chi tiết màn hình

####

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| 1 | Tab General Information | Tab |  | User click vào tab => bôi đậm |
| 2 | General Information | Title |  | * Fix cứng không cho thao tác |
| 3 | AC Subtype | Textview |  | * Đồng bộ từ Netline ops ++ * Hiển thị tên AC Subtype * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 4 | Aircraft Type Name | Textview |  | * Hiển thị tên Aircraft Type Name * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung * Trường hợp API trả về rỗng/lỗi: để trống |
| 5 | Valid From | Datetime |  | * Đồng bộ từ Netline ops ++ * Ngày bắt đầu hiệu lực * Hiển thị ngày bắt đầu hiệu lực * Trường hợp API trả về rỗng/lỗi: để trống * Format dd/mm/yyyy |
| 6 | Valid To | Datetime |  | * Đồng bộ từ Netline ops ++ * Ngày kết thúc hiệu lực * Hiển thị ngày kết thúc hiệu lực * Trường hợp API trả về rỗng/lỗi: để trống * Format dd/mm/yyyy |
| 7 | ICAO Code | Textview |  | * Hiển thị thông tin [ICAO Code] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: để trống * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
| 8 | IATA Code | Textview |  | * Hiển thị thông tin [IATA Code ] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: để trống * Nếu độ dài dữ liệu vượt quá 2 dòng, hiển thị ba chấm […] ở cuối dòng thứ 2 và có tooltip hiển thị toàn bộ nội dung |
| 9 | Ownership Status | Textview |  | * Hiển thị thông tin [Ownership Status] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: để trống |
| 10 | Owner | Textview |  | * Hiển thị thông tin [Owner] theo dữ liệu API trả về * Trường hợp API trả về lỗi/rỗng: để trống |
| 11 | Status | Tag | status | * Active: Tag màu xanh lá * Inactive: Tag màu xám |

---

*Nguồn: tách trung thực từ `sec-33-quan-ly-tau-bay.md`, mục "Xem chi tiết tàu bay — tab General Information" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#60** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
