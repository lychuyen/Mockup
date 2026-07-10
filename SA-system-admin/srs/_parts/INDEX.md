# SRS System Admin v0.1 (human-authored, VNA.FIMS template) — bản trích text

> **Tra cứu nhanh: bắt đầu từ [CATALOG.md](CATALOG.md)** — danh mục 30 chức năng + từ điển 49 trường (mapping DB/API) + nhóm chức năng + điểm cần xác nhận; mỗi mục trỏ về section nguồn bên dưới.
>
> **🖼 Hình ảnh màn hình:** xem trực tiếp trong file `.docx` gốc (bản trích text bỏ ảnh).
>
> Phân rã từ `VNA.TOSS_SRS_System-Admin_v0.1.extracted.md` để tra theo section (token-economy). CHỈ tách trung thực — không sửa nội dung (§0). Chế độ cắt: **h2**.

| Section | Nội dung | File | Dòng |
|---|---|---|---|
| 00 | Front matter (tiêu đề / mục lục / danh sách) | [sec-00-front-matter.md](sec-00-front-matter.md) | 183 |
| 01 | Mục đích | [sec-01-muc-dich.md](sec-01-muc-dich.md) | 10 |
| 02 | Phạm vi tài liệu | [sec-02-pham-vi-tai-lieu.md](sec-02-pham-vi-tai-lieu.md) | 26 |
| 03 | Khái niệm, thuật ngữ | [sec-03-khai-niem-thuat-ngu.md](sec-03-khai-niem-thuat-ngu.md) | 15 |
| 04 | Tổng quan chức năng | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc; Figma: https://www.figma.com/board/3fo7ZwJNhK3QE3mcN25pEl/FIMS?node-id=0-1&p=f&t=PmqI6zMQ3F8QXrcN-0)* | — |
| 05 | Mô hình giao tiếp với hệ thống/Module chức năng khác | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| LOGIN | Đăng nhập (Login) | [TOSS.SA.LOGIN.FD.v0.1.md](TOSS.SA.LOGIN.FD.v0.1.md) | 70 |
| SESSION_TIMEOUT | Hết phiên đăng nhập | [TOSS.SA.SESSION_TIMEOUT.FD.v0.1.md](TOSS.SA.SESSION_TIMEOUT.FD.v0.1.md) | 52 |
| LOGOUT | Đăng xuất (Logout) | [TOSS.SA.LOGOUT.FD.v0.1.md](TOSS.SA.LOGOUT.FD.v0.1.md) | 59 |
| USER_PROFILE | Xem thông tin user đăng nhập | [TOSS.SA.USER_PROFILE.FD.v0.1.md](TOSS.SA.USER_PROFILE.FD.v0.1.md) | 67 |
| CHANGE_PASSWORD | Thay đổi mật khẩu (Change password) | [TOSS.SA.CHANGE_PASSWORD.FD.v0.1.md](TOSS.SA.CHANGE_PASSWORD.FD.v0.1.md) | 69 |
| USER_LIST | Danh sách Người dùng | [TOSS.SA.USER_LIST.FD.v0.1.md](TOSS.SA.USER_LIST.FD.v0.1.md) | 83 |
| USER_DETAIL | Xem chi tiết Người dùng | [TOSS.SA.USER_DETAIL.FD.v0.1.md](TOSS.SA.USER_DETAIL.FD.v0.1.md) | 71 |
| ADD_USER_LDAP | Thêm mới User/Đồng bộ LDAP | [TOSS.SA.ADD_USER_LDAP.FD.v0.1.md](TOSS.SA.ADD_USER_LDAP.FD.v0.1.md) | 82 |
| ADD_USER_MANUAL | Thêm mới User/Tự khai báo | [TOSS.SA.ADD_USER_MANUAL.FD.v0.1.md](TOSS.SA.ADD_USER_MANUAL.FD.v0.1.md) | 72 |
| EDIT_USER | Sửa Người dùng | [TOSS.SA.EDIT_USER.FD.v0.1.md](TOSS.SA.EDIT_USER.FD.v0.1.md) | 55 |
| TOGGLE_USER | Bật/tắt hoạt động người dùng | [TOSS.SA.TOGGLE_USER.FD.v0.1.md](TOSS.SA.TOGGLE_USER.FD.v0.1.md) | 57 |
| DELETE_USER | Xóa người dùng | [TOSS.SA.DELETE_USER.FD.v0.1.md](TOSS.SA.DELETE_USER.FD.v0.1.md) | 58 |
| USER_HISTORY | Xem lịch sử Người dùng | [TOSS.SA.USER_HISTORY.FD.v0.1.md](TOSS.SA.USER_HISTORY.FD.v0.1.md) | 78 |
| RESET_PASSWORD | Lấy lại mật khẩu | [TOSS.SA.RESET_PASSWORD.FD.v0.1.md](TOSS.SA.RESET_PASSWORD.FD.v0.1.md) | 63 |
| ROLE_LIST | Danh sách vai trò | [TOSS.SA.ROLE_LIST.FD.v0.1.md](TOSS.SA.ROLE_LIST.FD.v0.1.md) | 85 |
| ROLE_DETAIL | Xem vai trò | [TOSS.SA.ROLE_DETAIL.FD.v0.1.md](TOSS.SA.ROLE_DETAIL.FD.v0.1.md) | 43 |
| ADD_EDIT_ROLE | Thêm/Sửa vai trò | [TOSS.SA.ADD_EDIT_ROLE.FD.v0.1.md](TOSS.SA.ADD_EDIT_ROLE.FD.v0.1.md) | 82 |
| ASSIGN_ROLE | Phân quyền người dùng (theo vai trò) | [TOSS.SA.ASSIGN_ROLE.FD.v0.1.md](TOSS.SA.ASSIGN_ROLE.FD.v0.1.md) | 44 |
| DELETE_ROLE | Xóa vai trò | [TOSS.SA.DELETE_ROLE.FD.v0.1.md](TOSS.SA.DELETE_ROLE.FD.v0.1.md) | 66 |
| RESTORE_ROLE | Khôi phục vai trò | [TOSS.SA.RESTORE_ROLE.FD.v0.1.md](TOSS.SA.RESTORE_ROLE.FD.v0.1.md) | 64 |
| TOGGLE_ROLE | Bật/tắt hoạt động vai trò | [TOSS.SA.TOGGLE_ROLE.FD.v0.1.md](TOSS.SA.TOGGLE_ROLE.FD.v0.1.md) | 66 |
| ADMIN_LOG | Danh sách nhật ký quản trị hệ thống | [TOSS.SA.ADMIN_LOG.FD.v0.1.md](TOSS.SA.ADMIN_LOG.FD.v0.1.md) | 68 |
| 13 | Phân quyền | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| GROUP_LIST | Danh sách Nhóm Người dùng | [TOSS.SA.GROUP_LIST.FD.v0.1.md](TOSS.SA.GROUP_LIST.FD.v0.1.md) | 71 |
| ADD_GROUP | Thêm mới Nhóm người dùng | [TOSS.SA.ADD_GROUP.FD.v0.1.md](TOSS.SA.ADD_GROUP.FD.v0.1.md) | 63 |
| EDIT_GROUP | Sửa nhóm Người dùng | [TOSS.SA.EDIT_GROUP.FD.v0.1.md](TOSS.SA.EDIT_GROUP.FD.v0.1.md) | 57 |
| DELETE_GROUP | Xóa nhóm người dùng | [TOSS.SA.DELETE_GROUP.FD.v0.1.md](TOSS.SA.DELETE_GROUP.FD.v0.1.md) | 64 |
| GROUP_DETAIL | Xem chi tiết Nhóm Người dùng | [TOSS.SA.GROUP_DETAIL.FD.v0.1.md](TOSS.SA.GROUP_DETAIL.FD.v0.1.md) | 72 |
| GROUP_HISTORY | Xem lịch sử nhóm Người dùng | [TOSS.SA.GROUP_HISTORY.FD.v0.1.md](TOSS.SA.GROUP_HISTORY.FD.v0.1.md) | 68 |
| 15 | Quản lý tham số hệ thống | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
