---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-02"
status: "Draft"
document_type: "SRS Content Catalog"
subsystem: "System Admin (Quản trị hệ thống)"
---

# CATALOG — Danh mục tra cứu nội dung SRS System Admin v0.1

> **Mục đích:** phân rã tra cứu (retrieval decomposition) trên bản trích text của tài liệu SRS System Admin do người soạn (template VNA.FIMS). **Chỉ tổ chức lại nội dung đã ghi trong nguồn — không suy diễn, không bổ sung** (CLAUDE.md §0). Mỗi dòng đều trỏ về file section nguồn `sec-NN-*.md` trong cùng thư mục. Nội dung dạng ảnh không trích được ghi rõ **[cần xác nhận — nội dung dạng ảnh, xem .docx]**.
>
> Quy ước đếm: **Số trường** = số dòng có tên trong bảng "Mô tả (chi tiết) màn hình" (không tính dòng bị gạch bỏ trong nguồn); **Số bước luồng** = số dòng của bảng "Mô tả luồng xử lý/nghiệp vụ" (một dòng có thể gộp nhiều bước, ví dụ "Bước 2, 3.1, 3.2").

---

## 1. Catalog chức năng

| # | Chức năng | Loại | Section | Mục đích (rút gọn) | Trigger (rút gọn) | Số trường | Số bước luồng | Cờ |
|---|---|---|---|---|---|---|---|---|
| 1 | Đăng nhập (Login) | Auth | [TOSS.SA.LOGIN.FD.v0.1.md](TOSS.SA.LOGIN.FD.v0.1.md) | Cho phép người dùng được phân quyền đăng nhập hệ thống (Local/LDAP/VIAGS/Vasco) | Truy cập đường link website quản trị | 9 | 9 (Bước 1–14) | Tham chiếu TB/VL trên Google Docs; màn hình gắn cứng "TOSS" |
| 2 | Hết phiên đăng nhập | Auth | [TOSS.SA.SESSION_TIMEOUT.FD.v0.1.md](TOSS.SA.SESSION_TIMEOUT.FD.v0.1.md) | Tự động kết thúc phiên khi quá thời gian (TT=96h; remember login=30 ngày) | Truy cập web sau thời gian dài không hoạt động | 0 (màn hình N/A) | 5 | — |
| 3 | Đăng xuất (Logout) | Auth | [TOSS.SA.LOGOUT.FD.v0.1.md](TOSS.SA.LOGOUT.FD.v0.1.md) | Kết thúc phiên làm việc, thu hồi token | Click nút "Đăng xuất" trên giao diện xem thông tin user | 1 | 2 (Bước 1–5) | — |
| 4 | Xem thông tin user đăng nhập | Xem | [TOSS.SA.USER_PROFILE.FD.v0.1.md](TOSS.SA.USER_PROFILE.FD.v0.1.md) | Xem thông tin tài khoản trên popup Personal information | Click icon user góc phải màn Home | 11 | 2 (Bước 1–3) | Trường Phone, Department không có mapping |
| 5 | Thay đổi mật khẩu (Change password) | Action/Auth | [TOSS.SA.CHANGE_PASSWORD.FD.v0.1.md](TOSS.SA.CHANGE_PASSWORD.FD.v0.1.md) | Cho phép người dùng đổi mật khẩu đăng nhập | Xem thông tin user → chọn Change password (chỉ local user) | 7 | 8 | ⚠ Regex mật khẩu: luồng ghi 8–30 ký tự, màn hình ghi 8–100 ký tự |
| 6 | Danh sách Người dùng | Danh sách | [TOSS.SA.USER_LIST.FD.v0.1.md](TOSS.SA.USER_LIST.FD.v0.1.md) | Xem danh sách người dùng (is_delete=false; Admin tổng dòng đầu) | Nhấn phân hệ Quản lý người dùng | 24 (+2 mục menu tạo mới; 2 dòng gạch bỏ) | 3 | Cột "Aves Code" có mapping không chuẩn |
| 7 | Xem chi tiết Người dùng | Xem | [TOSS.SA.USER_DETAIL.FD.v0.1.md](TOSS.SA.USER_DETAIL.FD.v0.1.md) | Xem chi tiết người dùng ở panel phải danh sách | Click 1 dòng người dùng bất kỳ (có quyền Xem) | 19 | 5 | — |
| 8 | Thêm mới User/Đồng bộ LDAP | Tạo mới | [TOSS.SA.ADD_USER_LDAP.FD.v0.1.md](TOSS.SA.ADD_USER_LDAP.FD.v0.1.md) | Tìm và thêm người dùng từ LDAP vào hệ thống | Nhấn Thêm mới User → Đồng bộ LDAP | 25 | 9 | — |
| 9 | Thêm mới User/Tự khai báo | Tạo mới | [TOSS.SA.ADD_USER_MANUAL.FD.v0.1.md](TOSS.SA.ADD_USER_MANUAL.FD.v0.1.md) | Tạo tài khoản tự khai báo (kèm tùy chọn VIAGS); gửi email thông tin tài khoản | Nhấn Thêm mới User → Tự khai báo | 18 (kế thừa màn LDAP) | 8 | ⚠ User Group mapping ghi `user_code/userCode` |
| 10 | Sửa Người dùng | Sửa | [TOSS.SA.EDIT_USER.FD.v0.1.md](TOSS.SA.EDIT_USER.FD.v0.1.md) | Sửa thông tin người dùng (fill sẵn dữ liệu; LDAP có icon đồng bộ lại) | Nhấn Sửa Người dùng | Kế thừa 2 màn Thêm mới (1 dòng mô tả gộp) | 8 | — |
| 11 | Bật/tắt hoạt động người dùng | Bật/tắt | [TOSS.SA.TOGGLE_USER.FD.v0.1.md](TOSS.SA.TOGGLE_USER.FD.v0.1.md) | On/Off trạng thái hoạt động; tài khoản đang đăng nhập bị logout ngay | Click toggle Active trên danh sách | 5 | 8 | ⚠ Bảng màn hình không có dòng nút Save dù luồng B6 nói "nhấn button Lưu lại" |
| 12 | Xóa người dùng | Xóa | [TOSS.SA.DELETE_USER.FD.v0.1.md](TOSS.SA.DELETE_USER.FD.v0.1.md) | Xóa mềm (is_delete=true) kèm lý do; chặn xóa nếu user đã có lịch sử cập nhật (TB022) | Nhấn Xóa người dùng | 7 | 7 | — |
| 13 | Xem lịch sử Người dùng | Xem | [TOSS.SA.USER_HISTORY.FD.v0.1.md](TOSS.SA.USER_HISTORY.FD.v0.1.md) | Xem lịch sử cập nhật + lịch sử truy cập (2 bảng log) | Nhấn Xem lịch sử Người dùng | 21 | 4 | ⚠ `device_type/deviceType` gán cho 2 cột khác nhau |
| 14 | Lấy lại mật khẩu | Action | [TOSS.SA.RESET_PASSWORD.FD.v0.1.md](TOSS.SA.RESET_PASSWORD.FD.v0.1.md) | Admin được phân quyền đặt lại mật khẩu cho user; tự gửi email; phiên cũ bị logout | Xem chi tiết user → chọn Lấy lại mật khẩu | 9 | 6 (Bước 1–7) | ⚠ Trường Re-enter new password mapping ghi `old_password/oldPassword` |
| 15 | Danh sách vai trò | Danh sách | [TOSS.SA.ROLE_LIST.FD.v0.1.md](TOSS.SA.ROLE_LIST.FD.v0.1.md) | Quản lý danh sách vai trò (Admin tổng + Admin_[hệ thống con] mặc định, không cho xóa) | Menu Quản lý vai trò | 18 (1 dòng gạch bỏ) | 9 | ⚠ Toàn bộ cột Mapping DB/API để trống |
| 16 | Xem vai trò | Xem | [TOSS.SA.ROLE_DETAIL.FD.v0.1.md](TOSS.SA.ROLE_DETAIL.FD.v0.1.md) | Xem chi tiết vai trò: thông tin, tab User Permissions (chỉ xem), tab User list | (nguồn không ghi — thiếu bảng header) | 14 | (không có bảng luồng) | ⚠ Thiếu bảng header Mục đích/Trigger/Tiền-Hậu điều kiện; Mapping trống |
| 17 | Thêm/Sửa vai trò | Tạo mới + Sửa | [TOSS.SA.ADD_EDIT_ROLE.FD.v0.1.md](TOSS.SA.ADD_EDIT_ROLE.FD.v0.1.md) | Thêm/sửa vai trò: Role Code, Roles name, System, cấu hình quyền, gán người dùng | Nút "Khởi tạo" hoặc icon "Sửa" | 15 | 8 | Mapping trống; danh sách quyền tham chiếu file xlsx ngoài |
| 18 | Phân quyền người dùng (theo vai trò) | Action | [TOSS.SA.ASSIGN_ROLE.FD.v0.1.md](TOSS.SA.ASSIGN_ROLE.FD.v0.1.md) | Cấu hình chi tiết quyền (Full Permissions + checkbox action theo function/phân hệ) cho vai trò | Tạo mới/Sửa vai trò → chọn hệ thống | 3 | (không có bảng luồng) | ⚠ Danh sách quyền check theo Google Sheet "VNA.MO_Danh sách role các hệ thống.xlsx" |
| 19 | Xóa vai trò | Xóa | [TOSS.SA.DELETE_ROLE.FD.v0.1.md](TOSS.SA.DELETE_ROLE.FD.v0.1.md) | Chuyển vai trò sang trạng thái "Đã xóa" kèm lý do; thu hồi toàn bộ quyền user được gán | Icon Xóa tại danh sách hoặc nút Xóa màn Sửa | 8 | 8 | Mapping trống |
| 20 | Khôi phục vai trò | Action | [TOSS.SA.RESTORE_ROLE.FD.v0.1.md](TOSS.SA.RESTORE_ROLE.FD.v0.1.md) | Khôi phục vai trò đã xóa kèm lý do; user được gán khôi phục quyền | Chọn Khôi phục vai trò | 8 | 8 | Mapping trống |
| 21 | Bật/tắt hoạt động vai trò | Bật/tắt | [TOSS.SA.TOGGLE_ROLE.FD.v0.1.md](TOSS.SA.TOGGLE_ROLE.FD.v0.1.md) | On/Off trạng thái vai trò; Ngừng hoạt động → chặn quyền các user được gán | Click toggle Hoạt động trên danh sách | 6 | 8 | Mapping trống; chặn thao tác với vai trò mặc định |
| 22 | Danh sách nhật ký quản trị hệ thống | Danh sách | [TOSS.SA.ADMIN_LOG.FD.v0.1.md](TOSS.SA.ADMIN_LOG.FD.v0.1.md) | Xem nhật ký quản trị (log theo hệ thống/chức năng/IP), xuất xlsx | System Admin → "System Management History" | 11 | 2 | ⚠ Dropdown System = EDM / System Admin / EDOC PILOT (khác danh mục hệ thống ở nơi khác) |
| 23 | Danh sách Nhóm Người dùng | Danh sách | [TOSS.SA.GROUP_LIST.FD.v0.1.md](TOSS.SA.GROUP_LIST.FD.v0.1.md) | Xem danh sách nhóm (fix cứng nhóm mặc định PC, TV, DSP, Vasco, OCC — ẩn chức năng Xóa) | Nhấn phân hệ Quản lý nhóm người dùng | 12 | 3 | — |
| 24 | Thêm mới Nhóm người dùng | Tạo mới | [TOSS.SA.ADD_GROUP.FD.v0.1.md](TOSS.SA.ADD_GROUP.FD.v0.1.md) | Tạo nhóm: mã + tên nhóm, phân quyền nhóm theo hệ thống (System Admin, Toss) | Nhấn Thêm mới Nhóm người dùng | 6 | 8 | — |
| 25 | Sửa nhóm Người dùng | Sửa | [TOSS.SA.EDIT_GROUP.FD.v0.1.md](TOSS.SA.EDIT_GROUP.FD.v0.1.md) | Sửa nhóm (disable Mã nhóm; nhóm mặc định chỉ cho sửa bảng Vai trò) | Nhấn Sửa nhóm Người dùng | Kế thừa màn Thêm mới (1 dòng mô tả gộp) | 8 | ⚠ Nhóm mặc định liệt kê khác mục 23: "Phi công, Tiếp viên, Học viên, Vasco, Thợ máy" |
| 26 | Xóa nhóm người dùng | Xóa | [TOSS.SA.DELETE_GROUP.FD.v0.1.md](TOSS.SA.DELETE_GROUP.FD.v0.1.md) | Xóa mềm nhóm (is_delete=true) kèm lý do | Nhấn Xóa nhóm người dùng | 7 | 7 | — |
| 27 | Xem chi tiết Nhóm Người dùng | Xem | [TOSS.SA.GROUP_DETAIL.FD.v0.1.md](TOSS.SA.GROUP_DETAIL.FD.v0.1.md) | Xem chi tiết nhóm + tag vai trò theo hệ thống + bảng user thuộc nhóm | Click 1 dòng nhóm bất kỳ (có quyền Xem) | 16 | 5 | — |
| 28 | Xem lịch sử nhóm Người dùng | Xem | [TOSS.SA.GROUP_HISTORY.FD.v0.1.md](TOSS.SA.GROUP_HISTORY.FD.v0.1.md) | Xem lịch sử cập nhật nhóm người dùng (bảng log + bộ lọc) | Nhấn Xem lịch sử nhóm Người dùng | 12 | 4 | — |
| 29 | Phân quyền (chương riêng, sec 13) | Action/Auth | *(không có file — đã dọn)* | [cần xác nhận — nội dung dạng ảnh, xem .docx] | [cần xác nhận — nội dung dạng ảnh, xem .docx] | — | — | 🔎 Chỉ có ảnh/sơ đồ; text phân quyền hiện nằm rải ở mục 17–18 |
| 30 | Quản lý tham số hệ thống (sec 15) | — | *(không có file — đã dọn)* | [cần xác nhận — nội dung dạng ảnh, xem .docx] | [cần xác nhận — nội dung dạng ảnh, xem .docx] | — | — | 🔎 Chỉ có ảnh/sơ đồ |

**Tổng: 28 chức năng có nội dung text + 2 mục chỉ có ảnh.**

---

## 2. Từ điển trường (Data Dictionary)

> Gộp trùng theo cột **Mapping DB/API** trên toàn phân hệ. Chỉ liệt kê trường có **tên + mapping thật** trong nguồn. Cột "Xuất hiện ở" dùng số **#** theo bảng §1. Biến thể mapping của cùng một trường (snake_case/camelCase) ghi chung một dòng đúng như nguồn.
>
> *Ghi chú:* các mapping thuần điều khiển UI (`btn_refresh`, `btn_init`, `btn_export_excel`, `btn_save`, `btn_cancel`, `btn_close`, `btn_exit`, `btn_logout`, `btn_changePassword`, `btn_forgotPassword`, `forgotPw`) không đưa vào từ điển dữ liệu — hành vi của chúng đã mô tả tại từng chức năng §1.

| Trường (Tên trong nguồn) | Mapping DB/API | Kiểu dữ liệu | Bắt buộc? | Xuất hiện ở |
|---|---|---|---|---|
| Tài khoản | `username` | TextBox [0;255] | Bắt buộc (trống → VL004) | #1 |
| Mật khẩu | `password_hash/password` · `password` | TextBox [8;100] | Bắt buộc | #1, #9 |
| Ghi nhớ đăng nhập | `remember (true/fail)` | CheckBox | Nguồn không ghi | #1 |
| Loại đăng nhập (nút Đăng nhập) | `type_login` (Local=1, VNA=2, VIAGS=3, Vasco=4) | Button | — | #1 |
| Captcha | `captcha_token` | Google reCAPTCHA | Bắt buộc khi `requireCaptcha=true` | #1 |
| Image (ảnh đại diện popup) | `image/userImage` | Image | — | #4 |
| Name | `name/userName` | Text (chỉ hiển thị) | — | #4 |
| Email | `email/userEmail` · `email` | Text / Mailbox [0;100] / TextBox [0;100] | Bắt buộc ở #9 (kèm check trùng, check domain) | #4, #6, #7, #8, #9, #27 |
| Role / Roles | `role` · `Role` | Text / Tagview / DDL | Nguồn không ghi | #4, #7, #8, #27 |
| Code (mã nhân viên popup) | `code/userCode` | Text (chỉ hiển thị) | — | #4 ⚠ (chuỗi `user_code/userCode` cũng bị gán cho User Group ở #9 — xem §4) |
| Status (lọc/trạng thái) | `status` · `Status` | Dropdown / TagStatus / text | — | #4, #6, #27 |
| Status (trạng thái hoạt động) | `active_status` | Textview / TagStatus | — | #7, #13, #14 |
| Old Password | `OldPassword` | TextBox [8;100] | Sai → VL001 (nguồn không ghi chữ "bắt buộc") | #5 |
| New password | `newPassword` · `new_password/newPassword` | TextBox [8;100] | Bắt buộc (#14); validate regex độ mạnh | #5, #14 |
| Confirm new password | `confirmPassword` | TextBox [8;100] | Phải trùng mật khẩu mới | #5 |
| Re-enter new password (Lấy lại MK) | `old_password/oldPassword` | Textbox | Bắt buộc | #14 ⚠ mapping nghi sai — xem §4 |
| Account | `account` | Textview / Searchbox / Textbox [0;100] | Bắt buộc ở #9 (check trùng VL007) | #6, #8, #9 |
| Active (toggle danh sách) | `is_active/isActive` | Toggle switch | — | #6 |
| Avatar | `avatar` | Ảnh / Image (max 5MB; .JPG/.JPEG/.PNG) | Không bắt buộc | #7, #8, #13, #14 |
| Full name | `full_name/fullName` | Textview / Textbox [0;100] / TextBox [0;100] | Bắt buộc ở #9 | #6, #7, #8, #9, #13, #14, #27 |
| Employee code (SkyHr) | `employee_code/employeeCode` | Textview / Textbox [0;50] | Không bắt buộc; không được trùng | #7, #8, #9, #13, #14 |
| Birth Date | `date_of_birth/dateOfBirth` | Textview / Datepicker (dd/mm/yyyy) | Không bắt buộc; chỉ chọn ≤ [hiện tại − 17 năm] | #8, #9 |
| Department | `department` | Textview / Dropdownlist / Combobox / TextBox [0;100] | Không bắt buộc | #6, #7, #8, #9, #27 |
| Phone number | `phone_number/phoneNumber` | Textview / Numberbox [0;11] / TextBox [0;20] | Bắt buộc ở #9 | #6, #7, #8, #9, #27 |
| Address | `address` | Textview / Textbox [0;500] | Không bắt buộc | #7, #8, #9 |
| User Group (chọn nhóm) | `user_group/userGroup` | Multi select drop list | Không bắt buộc | #8 |
| User Group / Name (nhóm) | `user_group_name/userGroupName` | Textview / Textbox [0;100] | Bắt buộc ở #24 (check trùng VL007) | #6, #7, #23, #24, #27, #28 |
| Group ID / User group code | `user_group_code/userGroupCode` | Textview / Textbox [0;50] | Bắt buộc ở #24 (check trùng VL007) | #23, #24, #27, #28 |
| Position (Chức vụ) | `position` | Textview / Textbox [0;100] | Không bắt buộc | #7, #8, #9 |
| HRMS code (mã nhân viên cũ) | `hrms_code/hrmsCode` | Textview / TextBox [0;50] | Không bắt buộc | #6, #7, #8, #9 |
| Crew code (mã AVES) | `crew_code/crewCode` | TextBox (maxlength 10 ở #8; 20 ở #9) | Không bắt buộc | #6 (cột chi tiết), #7, #8, #9 |
| Aves Code (cột danh sách) | `Aves Code` | Text View | — | #6 ⚠ mapping không chuẩn, trùng khái niệm với `crew_code` — xem §4 |
| Industry Card Number (Số thẻ ngành) | `industry_card_number/industryCardNumber` | Textview / TextBox [0;100] hoặc [0;50] | Không bắt buộc | #6, #7, #8, #9 ⚠ header ghi [0;100] nhưng validate maxlength 50 |
| Carrier Authorization | `carrier` | Textview / Multi-dropdown list (All hoặc nhiều) | Không bắt buộc | #6, #7, #8, #9 |
| Main Base | `main_base/mainBase` | Textview / Multi-dropdown list | Không bắt buộc | #6, #7, #8, #9 |
| Fleet (Đội bay) | `fleet/rank` | Textview / Multi-dropdown list | Không bắt buộc | #6, #7, #8, #9 |
| Last Access Time | `last_access_time/lastAccessTime` | Textview (dd/mm/yyyy - hh:mm) | — | #7 |
| All System / Tất cả hệ thống | `is_all_systems_enabled` | Toggle switch | — | #8, #24 |
| VIAGS | `is_viags_account` | Checkbox | — | #9 |
| Reason (lý do xóa người dùng) | `reason` | Textbox [0;1000] | Bắt buộc | #12 |
| Reason (lý do xóa nhóm) | `reason_delete/reasonDelete` | Textbox [0;1000] | Bắt buộc | #26 |
| Update Time | `updated_at/updateAt` | Datepicker / Textview (dd/mm/yyyy hh:mm) | — | #13, #28 |
| Action / Nghiệp vụ ghi nhận | `operation_type/operationType` | Dropdown list / Textview | — | #13, #28 |
| Update Details | `update_detail/updateDetail` | Textbox / Textview (maxlength 255) | — | #13, #28 |
| Updated by | `updated_by/updateBy` | Dropdown list / Textview | — | #13, #28 |
| Update details / Action (lịch sử truy cập) | `device_type/deviceType` | Textbox / Textview | — | #13 ⚠ cùng mapping gán cho 2 cột khác nhau |
| Created by | `created_by/createBy` | Textview | — | #23 |
| Created date | `created_at/createAt` | Textview (dd/mm/yyyy) | — | #23 |
| (Cờ xóa mềm — điều kiện hiển thị) | `is_delete` | Cờ DB (true/false) | — | #6, #12, #23, #26 (điều kiện hiển thị `is_delete=false`; xóa → `true`) |

**Tổng: 49 dòng trường (đã gộp trùng theo mapping).**

---

## 3. Nhóm chức năng

| Nhóm | Section nguồn | Chức năng (# theo §1) | Trạng thái nội dung |
|---|---|---|---|
| Xác thực & phiên làm việc (Login / Logout / hết phiên / thông tin user / đổi mật khẩu) | sec-06 → sec-10 | #1–#5 | ✅ Có nội dung text đầy đủ (luồng + màn hình) |
| Quản lý Người dùng | [TOSS.SA.USER_LIST.FD.v0.1.md](TOSS.SA.USER_LIST.FD.v0.1.md) | #6–#14 (9 chức năng con) | ✅ Có nội dung text đầy đủ |
| Quản lý vai trò (kèm Phân quyền theo vai trò + Nhật ký quản trị) | [TOSS.SA.ROLE_LIST.FD.v0.1.md](TOSS.SA.ROLE_LIST.FD.v0.1.md) | #15–#22 (8 chức năng con) | ✅ Có nội dung text; ⚠ cột Mapping DB/API trống toàn bộ |
| Phân quyền (chương riêng, sec 13) | *(đã dọn — không có file)* | #29 | 🔎 [cần xác nhận — nội dung dạng ảnh, xem .docx] |
| Quản lý Nhóm người dùng | [TOSS.SA.GROUP_LIST.FD.v0.1.md](TOSS.SA.GROUP_LIST.FD.v0.1.md) | #23–#28 (6 chức năng con) | ✅ Có nội dung text đầy đủ |
| Quản lý tham số hệ thống (sec 15) | *(đã dọn — không có file)* | #30 | 🔎 [cần xác nhận — nội dung dạng ảnh, xem .docx] |
| Phần dẫn nhập: Mục đích / Phạm vi / Thuật ngữ | sec-01, sec-02, sec-03 | — | ✅ Có text; ⚠ thuật ngữ **OFP** để trống định nghĩa |
| Tổng quan chức năng (sec 04) & Mô hình giao tiếp hệ thống (sec 05) | *(đã dọn — không có file)* | — | 🔎 [cần xác nhận — nội dung dạng ảnh, xem .docx]; sec 04 có link Figma board FIMS |

---

## 4. Điểm cần xác nhận

| # | Nội dung cần xác nhận | Vị trí nguồn |
|---|---|---|
| 1 | **4 section chỉ có ảnh/sơ đồ, không trích được text:** Tổng quan chức năng (04), Mô hình giao tiếp với hệ thống/module khác (05), Phân quyền (13), Quản lý tham số hệ thống (15) → tra cứu phải mở file `.docx` gốc `VNA.TOSS_SRS_System-Admin_v0.1` | INDEX.md (dòng 04, 05, 13, 15) |
| 2 | **Định danh (không phải cờ — đã rõ):** tài liệu dùng lẫn "FIMS" (template/mã hiệu VNA.FIMS; sec-03: FIMS = "OPERATION DATA LAKE/PLATFORM") và "TOSS" (màn Login: "TOSS — Total Operations Steering System", sec-06). **FIMS = TOSS — cùng một hệ thống** (BA Lead xác nhận 2026-07-02); không cần chốt thêm | sec-01, sec-03, sec-06, sec-11, sec-12, sec-14 |
| 3 | **Quan hệ với PHAN-RA-BRD-PH5 (Quản trị hệ thống — IAM/RBAC):** phạm vi Quản lý người dùng/vai trò/nhóm/phân quyền ở tài liệu này chồng lấn nội dung PH5 trong `srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH5-quan-tri-he-thong-*.md`; chưa có bảng đối chiếu FUNC ↔ chức năng #1–#30 — cần rà và chốt tài liệu nào là chuẩn | Toàn bộ module; đối chiếu thư mục `03-dac-ta-chuc-nang/` |
| 4 | **Tham chiếu ngoài chưa nội bộ hóa:** mã thông báo/cảnh báo TB001–TB022, VL001–VL009 + kịch bản title hệ thống/chân trang/xuất Excel đều trỏ Google Docs; danh sách quyền trỏ Google Sheet "VNA.MO_Danh sách role các hệ thống.xlsx"; template "DS Nhật ký truy cập hệ thống" trỏ Google Sheet; sơ đồ tổng quan trỏ Figma. Ngoài mạng nội bộ/khi mất quyền truy cập sẽ không tra được nội dung thông báo | sec-06 → sec-14 (rải rác); sec-12 mục Phân quyền & Nhật ký |
| 5 | **Trường không có Mapping DB/API:** toàn bộ bảng màn hình của Quản lý vai trò (5 màn: danh sách, xem, thêm/sửa, xóa, khôi phục, bật/tắt) và Nhật ký quản trị hệ thống; trường Phone, Department ở Thông tin user (sec-09); các searchbox bộ lọc Danh sách người dùng (sec-11) | sec-09, sec-11, sec-12 |
| 6 | **Mapping nghi vấn (cần dev/BA xác nhận):** (a) User Group ở Thêm mới Tự khai báo ghi `user_code/userCode` trong khi màn LDAP ghi `user_group/userGroup`; (b) Re-enter new password ở Lấy lại mật khẩu ghi `old_password/oldPassword`; (c) cột "Aves Code" mapping ghi nguyên văn "Aves Code" (không chuẩn snake_case) và trùng khái niệm với `crew_code/crewCode` (mã AVES); (d) `device_type/deviceType` gán đồng thời cho cột Update details và cột Action ở Lịch sử truy cập | sec-11 |
| 7 | **Mâu thuẫn nội dung trong nguồn:** (a) regex mật khẩu mới: luồng Change password ghi `.{8,30}`, bảng màn hình ghi `.{8,100}`; (b) nhóm người dùng mặc định: Danh sách ghi PC/TV/DSP/Vasco/OCC nhưng Sửa nhóm ghi "Phi công, Tiếp viên, Học viên, Vasco, Thợ máy"; (c) Industry Card Number khai báo độ dài [0;100] nhưng mô tả validate maxlength 50; (d) màn Bật/tắt hoạt động người dùng: luồng yêu cầu "nhấn button Lưu lại" nhưng bảng màn hình không có dòng nút Save | sec-10, sec-11, sec-14 |
| 8 | **Thiếu cấu trúc chuẩn:** "Xem vai trò" không có bảng header (Mục đích/Trigger/Tiền-Hậu điều kiện) và không có bảng luồng; "Phân quyền người dùng" (mục 17 của sec-12) không có bảng luồng | sec-12 |
| 9 | **Thuật ngữ OFP để trống định nghĩa** trong bảng Khái niệm, thuật ngữ | sec-03 |
| 10 | **Nhật ký quản trị hệ thống:** dropdown System gồm EDM / System Admin / EDOC PILOT — khác danh mục hệ thống (System Admin/Toss) dùng ở các màn còn lại; nghi là sót từ template hệ thống khác | sec-12 (mục Nhật ký) |

---

*Nguồn duy nhất: các file `sec-NN-*.md` trong thư mục này (bản trích text của `VNA.TOSS_SRS_System-Admin_v0.1.docx`). Catalog không bổ sung nội dung ngoài nguồn; mọi khoảng trống giữ nguyên và gắn cờ tại §4.*
