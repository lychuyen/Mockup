---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.ATTENDANT_HISTORY"
feature_name: "[Xem chi tiết Tiếp viên](TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md) — Lịch sử"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### [Xem chi tiết Tiếp viên](TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md)_Lịch sử

| **Tên chức năng: [Xem chi tiết Tiếp viên](TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md)_Lịch sử** | |
| --- | --- |
| **Mục đích** | Cho phép user [Xem chi tiết Tiếp viên](TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md)_Lịch sử |
| **Trigger** | Người dùng truy cập vào web FIMS => mở đến module Danh mục/Danh mục Tiếp viên => click vào 1 bản ghi bất kỳ => chọn tab Lịch sử |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Danh mục Tiếp viên |
| **Hậu điều kiện** | Mở màn hình [Xem chi tiết Tiếp viên](TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md)_Lịch sử trên giao diện người dùng |

#### Sơ đồ luồng hệ thống

![Ảnh minh họa](../_images/TOSS.DM.ATTENDANT_HISTORY.img01.png)

```mermaid
flowchart TD
    subgraph SG1["User"]
        S0(("●"))
        A1["(1) Truy cập web ODP =&gt; chọn Danh mục Tiếp viên"]
        A4["(4) Click vào 1 bản ghi trên danh sách"]
        A6["(6) User chọn tab Lịch sử"]
    end
    subgraph SG2["ODP_Danh mục Tiếp viên"]
        A2["(2) Hệ thống call API lấy dữ liệu"]
        A3["(3) Hiển thị màn hình danh sách Tiếp viên"]
        A5["(5) Hiển thị màn hình Xem chi tiết Tiếp viên_Thông tin Tiếp viên"]
        A7["(7) Hiển thị màn hình Lịch sử cập nhật Tiếp viên"]
        E0((("●")))
    end
    S0 --> A1
    A1 --> A2
    A2 --> A3
    A3 --> A4
    A4 --> A5
    A5 --> A6
    A6 --> A7
    A7 --> E0
```

1. Sơ đồ luồng nghiệp vụ

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
|  | Truy cập web FIMS => mở đến module Danh mục/Danh mục Tiếp viên |
|  | Hệ thống call API xuống BE lấy [danh sách Tiếp viên](TOSS.DM.ATTENDANT_LIST.FD.v0.1.md) |
|  | Hiển thị [danh sách Tiếp viên](TOSS.DM.ATTENDANT_LIST.FD.v0.1.md) trên giao diện người dùng |
|  | User click vào 1 bản ghi trên danh sách |
|  | Hiển thị màn hình [Xem chi tiết Tiếp viên](TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md), focus tab Thông tin Tiếp viên |
|  | Chọn tab Lịch sử |
|  | Hiển thị màn hình Lịch sử cập nhật Tiếp viên |

#### Màn hình chức năng

![Ảnh minh họa](../_images/TOSS.DM.ATTENDANT_HISTORY.img02.png)

1. Giao diện Thông tin chi tiết_Lịch sử

#### Mô tả chi tiết màn hình danh sách

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
|  | History Updated | Title |  | * Fix cứng text “Thông tin chi tiết” * Hệ thống call API lấy dữ liệu và hiển thị lịch sử cập nhật thông tin Tiếp viên * Danh sách sắp xếp theo thứ tự **Thời gian** từ mới nhất - cũ |
|  | TT | Textview |  | * Hiển thị số thứ tự, bắt đầu từ 1, tăng 1 đơn vị từ dòng tiếp theo * Danh sách hiển thị tối đa 10 dòng dữ liệu |
|  | System | Textview | system_name/systemName | * Hiển thị [systemNam] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Time | Textview | action_time/actionTime | * Hiển thị thời gian cập nhật dữ liệu * Định dạng dd/mm/yyyy hh:mm * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Executor | Textview | executor | * Hiển thị [Tên + Mã Người thực hiện] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Device IP | Textview | ip_address/ipAddress | * Hiển thị [ipAddress] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Module Actions | Textview | module_name/moduleName | * Hiển thị [moduleName] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Action | Textview | action_type/actionType | * Hiển thị [actionType] theo dữ liệu API trả về * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Update Details | Textview | update_detail/updateDetail | * Hiển thị chi tiết cập nhật TV * Hiện tối đa 2 dòng dữ liệu, nếu nội dung vượt quá 2 dòng, hiện dấu ba chấm […] tại cuối dòng thứ 2. Di chuột vào hiện tooltips full nội dung * Cách ghi nhận log:   + Thêm TV: [fullName + flighAttendantCode]   + Sửa TV: [Tên trường]: [Nội dung sau cập nhật]   TH cập nhật vai trò: [Tên hệ thống] [[Danh sách vai trò](../../../../SA-system-admin/srs/_parts/TOSS.SA.ROLE/TOSS.SA.ROLE_LIST.FD.v0.1.md), mỗi vai trò cách nhau bởi **dấu phẩy**} => list các hệ thống được cập nhật vai trò, mỗi hệ thống cách nhau bởi **dấu chấm phẩy**   * + Bật/Tắt hoạt động: [TT sau]   + Đồng bộ AVES: Đồng bộ thông tin Tiếp viên [fullName + flighAttendantCode] từ AVES * Trường hợp API trả về rỗng/lỗi: để trống trường |
|  | Chân trang | Pagination |  | * [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.abyqd0hrl467) |

---

*Nguồn: tách trung thực từ `sec-23-quan-ly-danh-muc-tiep-vien.md`, mục "[Xem chi tiết Tiếp viên](TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md) — Lịch sử" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#14** bảng §1 của [CATALOG.md](../CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
