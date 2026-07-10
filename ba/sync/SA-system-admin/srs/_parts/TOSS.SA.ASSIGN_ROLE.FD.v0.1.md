---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích theo chức năng)"
subsystem: "System Admin (Quản trị hệ thống)"
feature_id: "TOSS.SA.ASSIGN_ROLE"
feature_name: "Phân quyền người dùng (theo vai trò)"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `System Admin (Quản trị hệ thống)`.

### Phân quyền người dùng

| **Tên chức năng: Phân quyền người dùng** | |
| --- | --- |
| **Mục đích** | Cho phép user cấu hình chi tiết Phân quyền người dùng cho từng vai trò |
| **Trigger** | Người dùng truy cập vào hệ thống FIMS/Danh mục quản trị chọn menu Quản lý vai trò => Chọn Tạo mới/[Sửa vai trò](TOSS.SA.ADD_EDIT_ROLE.FD.v0.1.md) => Chọn hệ thống (đối với TH Thêm mới) |
| **Tiền điều kiện** | User có quyền Tạo mới/[Sửa vai trò](TOSS.SA.ADD_EDIT_ROLE.FD.v0.1.md) |
| **Hậu điều kiện** | Enable chức năng cập nhật phân quyền người dùng |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Màn hình giao nhận đối tượng khác

####

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| Bảng **Phân quyền người dùng**  Hệ thống hiển thị bảng danh sách quyền theo hệ thống được chọn tại DDL **Hệ thống**  TH **sửa** vai trò là Admin tổng/Admin module sinh mặc định => Dis cả tab, chỉ cho xem | | | | |
|  | Full Permissions | Toggle switch button |  | * Hiển thị On/Off all quyền của vai trò   + On: Vai trò được phân **Full Permissions** (all action của tất cả function trên bảng đều được tick chọn)   + Off:     - Vai trò không được phân toàn quyền     - Hiển thị trạng thái tick/không tick action theo function tương ứng * Tùy từng màn hình, hệ thống Disable/ Enable cho phép user thao tác On/Off Toàn quyền * Action:   + Tại lần đầu tiên cấu hình quyền:     - Default Off button     - Default không tick all action của tất cả function trên bảng     - Cho phép tick/bỏ tick action   + Trường hợp user thao tác chuyển từ Off => On button:     - Tự động tick chọn all action của tất cả function/tab Phân hệ nghiệp vụ trên bảng     - Chặn thao tác tick/bỏ tick action   + Trường hợp user thao tác chuyển từ On => Off button:     - Giữ nguyên trạng thái tick action trước đó     - Cho phép tick/bỏ tick action |
|  | **Tab table Phân quyền người dùng**   * Bảng bao gồm các tab Phân hệ nghiệp vụ, mỗi phân hệ được chia thành các function và action tương ứng * Hiển thị scroll trường hợp nhiều bản ghi | | | |
|  | Function theo Phân hệ nghiệp vụ |  |  | * Hiển thị danh sách các tab Phân hệ nghiệp vụ; function và action tương ứng * Chi tiết check theo bảng Danh sách quyền tại link [VNA.MO\_Danh sách role các hệ thống.xlsx](https://docs.google.com/spreadsheets/d/1cj_UhUSSnmNTBSF0LAmjw_-wHyZlVf5Y/edit?usp=sharing&ouid=100481381661925960730&rtpof=true&sd=true) |
|  | Action ![](data:image/png;base64...) | Checkbox |  | * Cho phép user tick/bỏ tick action theo function:   + Tick action: Phân quyền cho phép user thực hiện quyền trên phân hệ chức năng tương ứng   + Không tick action: Chặn user thao tác quyền trên phân hệ chức năng tương ứng * List action:   + Full Permissions:     - Cho phép tick/bỏ tick     - Khi tick checkbox này, tự động tick các action còn lại của function   + Flight schedule:     - Cho phép tick/bỏ tick     - Trường hợp checkbox Full Permissions được tick, chặn thao tác tại checkbox này   + Assign crew:     - Cho phép tick/bỏ tick     - Trường hợp checkbox Full Permissions được tick, chặn thao tác tại checkbox này   + Create / Edit flight:     - Cho phép tick/bỏ tick     - Trường hợp checkbox Full Permissions được tick, chặn thao tác tại checkbox này   + Update flight status:     - Cho phép tick/bỏ tick     - Trường hợp checkbox Full Permissions được tick, chặn thao tác tại checkbox này   + View operational notes:     - Cho phép tick/bỏ tick     - Trường hợp checkbox Full Permissions được tick, chặn thao tác tại checkbox này   + Lock flight:     - Cho phép tick/bỏ tick     - Trường hợp checkbox Full Permissions được tick, chặn thao tác tại checkbox này   + Export flight report:     - Cho phép tick/bỏ tick     - Trường hợp checkbox Full Permissions được tick, chặn thao tác tại checkbox này |

---

*Nguồn: tách trung thực từ `sec-12-quan-ly-vai-tro.md`, mục "Phân quyền người dùng (theo vai trò)" (bản trích text của `VNA.TOSS_SRS_System Admin_V0.1.docx`, chương System Admin (Quản trị hệ thống)) — tương ứng dòng **#18** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_System Admin_V0.1.docx` gốc.*
