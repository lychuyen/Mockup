---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Front Matter (bản trích, gộp sec-00→sec-03)"
subsystem: "Flight Dispatch"
feature_id: "TOSS.FD.THONG_TIN_CHUNG"
feature_name: "Thông tin chung (trang bìa, mục đích, phạm vi, khái niệm)"
source_gdrive: "https://docs.google.com/spreadsheets/d/1gk6cOzlZoU_jTd8nFlIziasify7EVdDu0sEH6aQKOZM"
source_version: "1577"
source_modified: "2026-07-10T08:30:51.957Z"
last_modifying_user: "tohuonggiang02"
---

> **Nguồn (Google Drive, live):** VNA.TOSS_SRS_Flight Dispatch_v0.1 — https://drive.google.com/file/d/1gk6cOzlZoU_jTd8nFlIziasify7EVdDu0sEH6aQKOZM  
> Pull 2026-07-10 (version 1577, sửa 2026-07-10T08:30:51.957Z bởi tohuonggiang02).

*(hình ảnh minh họa — xem file gốc/Google Doc)*

**TẬP ĐOÀN CÔNG NGHIỆP - VIỄN THÔNG QUÂN ĐỘI VIETTEL**

**<VTIT>**

**BIỂU MẪU**

**TÀI LIỆU THIẾT KẾ CHI TIẾT**

Mã hiệu dự án: **VNA.FIMS**

Mã hiệu tài liệu: **VNA.FIMS_SRS_Flight Dispatch_v0.1**

<Hà Nội, 01/2026>

**BẢNG GHI NHẬN THAY ĐỔI TÀI LIỆU**

*A – Tạo mới, M – Sửa đổi, D – Xóa bỏ

| Ngày  thay đổi | Vị trí  thay đổi | A*  M, D | Nguồn gốc | Phiên  bản cũ | Mô tả thay đổi | Phiên  bản mới |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |

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

**A - THÔNG TIN CHUNG 10**

**1. GIỚI THIỆU 10**

1.1. Mục đích 10

1.2. Phạm vi tài liệu 10

1.3. Khái niệm, thuật ngữ 12

# **A - THÔNG TIN CHUNG**

# **GIỚI THIỆU**

Tài liệu mô tả chi tiết các quy trình nghiệp vụ và đặc tả chức năng yêu cầu của hệ thống TOSS

---

## **Mục đích**

Tài liệu **Đặc tả Yêu cầu Phần mềm (SRS)** này có các mục đích sau:

* **Xác định rõ phạm vi hệ thống**: Mô tả đầy đủ những gì hệ thống TOSS cần thực hiện trong Phase 1, bao gồm các chức năng được triển khai và các chức năng nằm ngoài phạm vi.
* **Làm cơ sở thống nhất giữa các bên**: Là tài liệu giao kèo giữa Bên đặt hàng (VNA), Bên phát triển (VTIT) và các bên liên quan về những gì hệ thống sẽ cung cấp.
* **Định hướng thiết kế và phát triển**: Cung cấp đặc tả đủ chi tiết để đội ngũ kỹ thuật (Dev, QA, DevOps) có thể thiết kế, xây dựng và kiểm thử hệ thống mà không cần diễn giải thêm.
* **Là cơ sở kiểm thử và nghiệm thu**: Mỗi yêu cầu trong tài liệu này là một tiêu chí có thể kiểm tra được (testable requirement), làm nền tảng cho kế hoạch kiểm thử và tiêu chí nghiệm thu hệ thống.

Tài liệu này **không** mô tả kiến trúc hệ thống chi tiết, không bao gồm kế hoạch triển khai hay vận hành.

---

## **Phạm vi tài liệu**

### ***1.2.1*****Đối tượng đọc tài liệu**

Tài liệu này phục vụ cho các đối tượng sau:

| **STT** | **Đối tượng** | **Vai trò sử dụng tài liệu** |
| --- | --- | --- |
| 1 | Business Analyst | Xác nhận yêu cầu nghiệp vụ đã được ghi nhận đầy đủ và chính xác |
| 2 | Nhân viên thiết kế & phát triển (Dev) | Thiết kế hệ thống, viết code theo đúng yêu cầu chức năng |
| 3 | Nhân viên kiểm thử (QA/Tester) | Xây dựng kịch bản kiểm thử, kiểm tra hệ thống đáp ứng yêu cầu |
| 4 | Quản trị dự án (PM | Theo dõi phạm vi và kiểm soát thay đổi yêu cầu |
| 5 | Đơn vị vận hành | Nắm bắt quy trình và chức năng để vận hành, hỗ trợ người dùng |
| 6 | Đại diện Vietnam Airlines (Khách hàng) | Xem xét, phê duyệt yêu cầu trước khi phát triển |

***1.2.2*****Phạm vi hệ thống (Phase 1)**

Hệ thống TOSS Phase 1 bao gồm các phân hệ sau:

| **Phân hệ** | **Mô tả** | **Trạng thái Phase 1** |
| --- | --- | --- |
| I. HOME — Đăng nhập & Quản lý phiên | Đăng nhập (Local/LDAP), quản lý phiên, đổi mật khẩu | ✅ Trong phạm vi |
| II. Phân hệ Quản lý Điều hành Bay (TOSS) | Flight Plan, CFP/NOTAM/WX, tải trọng, Performance Factor | ✅ Trong phạm vi |
| III. Phân hệ Danh mục dùng chung | Tàu bay, Sân bay, Chặng bay, Phi công, Tiếp viên, Carrier, Quốc gia, FIR, ULD, Đội bay | ✅ Trong phạm vi |
| Quản trị hệ thống | Quản lý người dùng, vai trò, nhóm người dùng, phân quyền, email, tham số hệ thống | ✅ Trong phạm vi |
| Báo cáo | Các báo cáo thống kê, xuất dữ liệu | ✅ Trong phạm vi |

---

## **Khái niệm, thuật ngữ**

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

> **Nguồn gốc (truy vết):** Gộp trung thực từ `sec-00-front-matter.md` + `sec-01-muc-dich.md` + `sec-02-pham-vi-tai-lieu.md` + `sec-03-khai-niem-thuat-ngu.md` (bản trích SRS Flight Dispatch v0.1, người soạn VNA/VTIT) thành 1 file theo quy ước đặt tên `TOSS.<PhanHe>.<TenChucNang>.FD.v<x>.md` — xem §0 [CATALOG.md](CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0).
>
> **Ghi chú ranh giới:** 4 dòng tiêu đề cuối `sec-03` gốc (THIẾT KẾ CHI TIẾT → I - PHÂN HỆ QUẢN LÝ ĐIỀU HÀNH BAY_TOSS → FLIGHT PLAN) là tiêu đề nhóm mở đầu phần "Thiết kế chi tiết" tiếp theo (không có nội dung riêng) — đã có ở dạng nhóm chức năng trong bảng §1 CATALOG.md, không lặp lại ở đây để tránh trùng.
>
> **Đồng bộ lại 2026-07-10** theo bản pull Google Doc **phiên bản 1577** (sửa 2026-07-10 bởi tohuonggiang02; bản phân rã trước theo phiên bản 1450): nội dung phần Thông tin chung **không thay đổi** — chỉ cập nhật metadata truy vết nguồn (phiên bản, thời điểm sửa, người sửa).
