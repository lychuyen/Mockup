---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Dispatch"
feature_id: "TOSS.FD.BRIEFING_DETAIL"
feature_name: "Xem chi tiết Briefings sheet"
group: "Flight Plan"
---

## **Xem chi tiết Briefings sheet**

### **Sơ đồ nghiệp vụ**

*(hình ảnh minh họa — xem file gốc/Google Doc)*

### **Mô tả sơ đồ nghiệp vụ**

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng đăng nhập vào hệ thống TOSS, truy cập module TOSS và chọn tab Flight Plan |
| Bước 2 | Hệ thống gọi API lấy [danh sách Flight Plan](TOSS.FD.FLIGHT_PLAN_LIST.FD.v0.1.md) và hiển thị dữ liệu trên màn hình |
| Bước 3 | Người dùng chọn một Flight Plan trong danh sách để xem thông tin chi tiết |
| Bước 4 | Hệ thống gọi API lấy thông tin chi tiết của Flight Plan được chọn và hiển thị dữ liệu trên màn hình |

### **Màn hình chức năng(chưa chốt)**

### **Mô tả màn hình chức năng**

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| 1 |  |  |  |  |
| 2 |  |  |  |  |
| 3 |  |  |  |  |
| 4 |  |  |  |  |

---

> **Nguồn gốc (truy vết):** Tách trung thực từ `sec-05-xem-chi-tiet-briefings-sheet.md` — mảnh phân rã `VNA.TOSS_SRS_Flight Dispatch_v0.1.md` (SRS Flight Dispatch v0.1, người soạn VNA/VTIT, nguồn Google Drive live pull 2026-07-10) — ứng với dòng **#2** bảng §1 trong [CATALOG.md](../CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0).
>
> **Cờ [Cần làm rõ] (giữ nguyên từ nguồn — CHƯA CHỐT):** Tiêu đề mục "Màn hình chức năng" trong nguồn vẫn ghi **"(chưa chốt)"**; bảng "Mô tả màn hình chức năng" có đủ 4 dòng STT (1-4) nhưng toàn bộ các cột Tên / Kiểu dữ liệu / Mapping DB/API / Mô tả nghiệp vụ đều **để trống**. Nguồn cũng không có bảng đầu mục Mục đích / Trigger / Tiền điều kiện / Hậu điều kiện riêng (khác chuẩn F01, F04→F08). Chờ VNA/VTIT chốt — xem CATALOG.md §2.2 và §2.5.
