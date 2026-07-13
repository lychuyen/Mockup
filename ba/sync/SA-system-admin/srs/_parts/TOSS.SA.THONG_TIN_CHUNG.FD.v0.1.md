---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Front Matter (bản trích, gộp sec-00→sec-03)"
subsystem: "System Admin"
feature_id: "TOSS.SA.THONG_TIN_CHUNG"
feature_name: "Thông tin chung (trang bìa, mục đích, phạm vi, khái niệm)"
source_gdrive: ""
source_version: ""
source_modified: ""
last_modifying_user: ""
---

> **Bản trích agent-đọc (chỉ text)** — Nguồn gốc: file `VNA.TOSS_SRS_System Admin_V0.1.docx` cùng thư mục; bản trích không kèm hình ảnh (~171 hình minh họa màn hình — xem file .docx gốc). Trích bằng markitdown ngày 2026-07-02, nội dung giữ nguyên trung thực, không chỉnh sửa.

*(hình ảnh minh họa — xem file gốc/Google Doc)*

**TẬP ĐOÀN CÔNG NGHIỆP - VIỄN THÔNG QUÂN ĐỘI VIETTEL**

**<VTIT>**

**BIỂU MẪU**

**TÀI LIỆU THIẾT KẾ CHI TIẾT**

Mã hiệu dự án: **VNA.FIMS**

Mã hiệu tài liệu: **VNA.FIMS_SRS_System Admin _v1.0**

<Hà Nội, 01/2026>

**BẢNG GHI NHẬN THAY ĐỔI TÀI LIỆU**

*A – Tạo mới, M – Sửa đổi, D – Xóa bỏ

**TRANG KÝ**

Người lập: <Ngày>

<Chức danh>

Người xem xét: <Ngày>

<Chức danh>

Người xem xét: <Ngày>

<Chức danh>

Người phê duyệt: <Ngày>

<Chức danh>

**MỤC LỤC**

[**A - THÔNG TIN CHUNG 7**](#_heading=h.qfrorb2f7iq3)

[**1. GIỚI THIỆU 7**](#_heading=h.d6dp3icfd51v)

[1.1 Mục đích 7](#_heading=h.68o9myz7ea66)

[1.2 Phạm vi tài liệu 7](#_heading=h.rhoskemr3vc)

[1.3 Khái niệm, thuật ngữ 8](#_heading=h.hfs3rgqmtkap)

[**2. TỔNG QUAN GIẢI PHÁP 9**](#_heading=h.cjuxvoqmzp9b)

[2.1 Tổng quan chức năng 9](#_heading=h.3rm0k6b5a1h1)

[2.2 Mô hình giao tiếp với hệ thống/Module chức năng khác 9](#_heading=h.xu9661m7r3d9)

[**B - THIẾT KẾ CHI TIẾT 10**](#_heading=h.2vcn812ojh9f)

[**1. LOGIN 10**](#_heading=h.82dtlhwm1wj4)

[1.1 Login 10](#_heading=h.6usae2ju5mkr)

[1.1.1 Luồng nghiệp vụ 11](#_heading=h.7oclptw7lh5b)

[1.1.2 Mô tả luồng nghiệp vụ 12](#_heading=h.hfi9au7ccssw)

[1.1.3 Màn hình chức năng 17](#_heading=h.fj3pjhb052mp)

[1.1.4 Mô tả màn hình 20](#_heading=h.knf27w827c8p)

[1.2 Hết phiên đăng nhập 28](#_heading=h.6t9o6rfud4ka)

[1.2.1 Luồng nghiệp vụ 29](#_heading=h.3otdl75k39h)

[1.2.2 Mô tả luồng nghiệp vụ 30](#_heading=h.myx8llrnkvjx)

[1.2.3 Màn hình chức năng 31](#_heading=h.e6b3c2qaisa8)

[1.2.4 Mô tả màn hình 31](#_heading=h.3k59lbxhlsyo)

[1.3 Logout 31](#_heading=h.gn8dm6y6i6a1)

[1.3.1 Luồng nghiệp vụ 32](#_heading=h.6uuu37dj2037)

[1.3.2 Mô tả luồng nghiệp vụ 33](#_heading=h.pfdwe34bq11z)

[1.3.3 Màn hình chức năng 34](#_heading=h.3t755tghyon4)

[1.3.4 Mô tả màn hình 35](#_heading=h.fab0vhuggusa)

[1.4 Thông tin user đăng nhập 37](#_heading=h.xwaulnrzgmqg)

[1.4.1 Luồng nghiệp vụ 38](#_heading=h.2mi49g2q3098)

[1.4.2 Mô tả luồng nghiệp vụ 39](#_heading=h.62b626ieqs6r)

[1.4.3 Màn hình chức năng 40](#_heading=h.2m4tbxvxia09)

[1.4.4 Mô tả màn hình 41](#_heading=h.3q37kba9hi9p)

[1.5 Change password 43](#_heading=h.qbqgqf2n0n0f)

[1.5.1 Luồng nghiệp vụ 44](#_heading=h.d64uodf69rbh)

[1.5.2 Mô tả luồng nghiệp vụ 45](#_heading=h.qt4seiklemw6)

[1.5.3 Màn hình chức năng 47](#_heading=h.7ylgo7s94vsh)

[1.5.4 Mô tả màn hình 48](#_heading=h.8p4szhplmb2f)

[**2. QUẢN TRỊ HỆ THỐNG 51**](#_heading=h.dvguh3qnf63j)

[2.1 Quản lý Người dùng 51](#_heading=h.7giy8ocj15ow)

[2.1.1 Danh sách user 51](#_heading=h.shudtdtatv6h)

[2.1.2 Xem chi tiết người dùng 71](#_heading=h.smpw7ugzsr2e)

[2.1.3 Thêm mới User/Đồng bộ LDAP 82](#_heading=h.i7tt4tnhezoz)

[2.1.4 Thêm mới User/Tự khai báo 104](#_heading=h.lfrn0ai42pjo)

[2.1.5 Sửa User 122](#_heading=h.hckuzzijv4f0)

[2.1.6 Bật tắt hoạt động người dùng 130](#_heading=h.91pgz79rx42s)

[2.1.7 Xóa người dùng 136](#_heading=h.j44s1w7cx4t8)

[2.1.8 Xem lịch sử người dùng 144](#_heading=h.jff0l6lrsk05)

[2.1.9 Lấy lại mật khẩu 157](#_heading=h.4vbe7ta3eu5)

[2.2 Quản lý vai trò 168](#_heading=h.3mzq4wv)

[2.2.1 Danh sách vai trò 168](#_heading=h.2250f4o)

[2.2.2 Xem vai trò 184](#_heading=h.2fk6b3p)

[2.2.3 Thêm/Sửa vai trò 189](#_heading=h.upglbi)

[2.2.4 Phân quyền người dùng 204](#_heading=h.184mhaj)

[2.2.5 Xóa vai trò 210](#_heading=h.meukdy)

[2.2.6 Khôi phục vai trò 217](#_heading=h.zu0gcz)

[2.2.7 Bật/tắt hoạt động vai trò 224](#_heading=h.1d96cc0)

[2.2.8 Danh sách nhật ký quản trị hệ thống 232](#_heading=h.1qoc8b1)

[2.3 Phân quyền 243](#_heading=h.8c8xhsycfv6h)

[2.4 Quản lý Nhóm người dùng 243](#_heading=h.ua56qgh1nir2)

[2.4.1 Danh sách nhóm người dùng 243](#_heading=h.5zuz881aek3l)

[2.4.2 Thêm mới nhóm người dùng 254](#_heading=h.dfwxrm77kv9i)

[2.4.3 Sửa nhóm người dùng 264](#_heading=h.38czs75)

[2.4.4 Xóa nhóm người dùng 270](#_heading=h.11si5id)

[2.4.5 Xem chi tiết nhóm người dùng 278](#_heading=h.wnyagw)

[2.4.6 Xem lịch sử nhóm người dùng 288](#_heading=h.302dr9l)

[2.5 Quản lý tham số hệ thống 297](#_heading=h.o6mahyku8b7s)

# A - THÔNG TIN CHUNG

# GIỚI THIỆU

Tài liệu mô tả chi tiết các quy trình nghiệp vụ và đặc tả chức năng yêu cầu của hệ thống FIMS

---

## Mục đích

Tài liệu **Đặc tả Yêu cầu Phần mềm (SRS)** này có các mục đích sau:

* **Xác định rõ phạm vi hệ thống**: Mô tả đầy đủ những gì hệ thống FIMS cần thực hiện trong Phase 1, bao gồm các chức năng được triển khai và các chức năng nằm ngoài phạm vi.
* **Làm cơ sở thống nhất giữa các bên**: Là tài liệu giao kèo giữa Bên đặt hàng (VNA), Bên phát triển (VTIT) và các bên liên quan về những gì hệ thống sẽ cung cấp.
* **Định hướng thiết kế và phát triển**: Cung cấp đặc tả đủ chi tiết để đội ngũ kỹ thuật (Dev, QA, DevOps) có thể thiết kế, xây dựng và kiểm thử hệ thống mà không cần diễn giải thêm.
* **Là cơ sở kiểm thử và nghiệm thu**: Mỗi yêu cầu trong tài liệu này là một tiêu chí có thể kiểm tra được (testable requirement), làm nền tảng cho kế hoạch kiểm thử và tiêu chí nghiệm thu hệ thống.

Tài liệu này **không** mô tả kiến trúc hệ thống chi tiết, không bao gồm kế hoạch triển khai hay vận hành.

---

## Phạm vi tài liệu

**1.2.1** **Đối tượng đọc tài liệu**

Tài liệu này phục vụ cho các đối tượng sau:

| **STT** | **Đối tượng** | **Vai trò sử dụng tài liệu** |
| --- | --- | --- |
| 1 | Business Analyst | Xác nhận yêu cầu nghiệp vụ đã được ghi nhận đầy đủ và chính xác |
| 2 | Nhân viên thiết kế & phát triển (Dev) | Thiết kế hệ thống, viết code theo đúng yêu cầu chức năng |
| 3 | Nhân viên kiểm thử (QA/Tester) | Xây dựng kịch bản kiểm thử, kiểm tra hệ thống đáp ứng yêu cầu |
| 4 | Quản trị dự án (PM | Theo dõi phạm vi và kiểm soát thay đổi yêu cầu |
| 5 | Đơn vị vận hành | Nắm bắt quy trình và chức năng để vận hành, hỗ trợ người dùng |
| 6 | Đại diện Vietnam Airlines (Khách hàng) | Xem xét, phê duyệt yêu cầu trước khi phát triển |

**1.2.2** **Phạm vi hệ thống (Phase 1)**

Hệ thống FIMS Phase 1 bao gồm các phân hệ sau:

| **Phân hệ** | **Mô tả** | **Trạng thái Phase 1** |
| --- | --- | --- |
| I. HOME — Đăng nhập & Quản lý phiên | Đăng nhập (Local/LDAP), quản lý phiên, đổi mật khẩu | ✅ Trong phạm vi |
| II. Phân hệ Quản lý Điều hành Bay (FIMS) | Flight Plan, CFP/NOTAM/WX, tải trọng, Performance Factor | ✅ Trong phạm vi |
| III. Phân hệ Danh mục dùng chung | Tàu bay, Sân bay, Chặng bay, Phi công, Tiếp viên, Carrier, Quốc gia, FIR, ULD, Đội bay | ✅ Trong phạm vi |
| Quản trị hệ thống | Quản lý người dùng, vai trò, nhóm người dùng, phân quyền, email, tham số hệ thống | ✅ Trong phạm vi |
| Báo cáo | Các báo cáo thống kê, xuất dữ liệu | ✅ Trong phạm vi |

---

## Khái niệm, thuật ngữ

[Phần này sẽ cung cấp các định nghĩa của tất cả các khái niệm, thuật ngữ… được sử dụng trong tài liệu Kiến trúc hệ thống.]

| STT | Thuật ngữ | Khái niệm |
| --- | --- | --- |
| 1 | TT/STT | Số thứ tự |
| 2 | VNA | Vietnam airlines |
| 3 | FIMS | OPERATION DATA LAKE/PLATFORM |
| 4 | CFP | Computerized Flight Plan |
| 5 | OFP |  |
| 6 | e-CFP/OFP | Electronic - Computerized Flight Plan |
| 7 | PIC | Pilot in Command |

---

> **Nguồn gốc (truy vết):** Gộp trung thực từ `sec-00-front-matter.md` + `sec-01-muc-dich.md` + `sec-02-pham-vi-tai-lieu.md` + `sec-03-khai-niem-thuat-ngu.md` (bản trích SRS System Admin v0.1, người soạn VNA/VTIT) thành 1 file theo quy ước đặt tên `TOSS.<PhanHe>.<TenChucNang>.FD.v<x>.md` — xem §0 [CATALOG.md](CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0).
>
> **Ghi chú ranh giới:** 4 dòng tiêu đề cuối `sec-03` gốc (TỔNG QUAN GIẢI PHÁP) là tiêu đề nhóm mở đầu phần "Thiết kế chi tiết" tiếp theo (không có nội dung riêng) — đã có ở dạng nhóm chức năng trong bảng §1 CATALOG.md, không lặp lại ở đây để tránh trùng.
