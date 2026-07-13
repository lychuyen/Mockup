# Đối chiếu Function-list ↔ ba/sync/ — 2026-07-10

> **Tự động, chỉ so khớp chuỗi con + trùng từ khoá (heuristic) — KHÔNG phải kết luận cuối.** Mỗi dòng 'CHƯA THẤY TRONG SRS' cần BA rà tay xác nhận trước khi coi là yêu cầu mới.

Nguồn Function-list: `ba\workspace\drafts\phan-tich\01-nguon\VNA-TOSS-Function-list-v1.0.extracted.md`

## Module 1 — Live Operations (`LO-live-operations/`)
*(Function-list chưa có dòng chức năng nào cho module này)*

## Module 2 — Flight Dispatch (`FD-flight-dispatch/`)
- Tổng chức năng trong Function-list: 15
- Tổng chức năng đã có trong CATALOG.md: 8
- **7 chức năng CHƯA THẤY TRONG SRS** (cần rà tay):
  - `TOSS.2.1` — Màn hình giám sát danh sách tổng quan
  - `TOSS.2.2` — Lọc trên màn hình
  - `TOSS.2.4` — DSP Release OFP
  - `TOSS.2.6` — Customize bảng
  - `TOSS.2.1` — Màn hình thông tin kế hoạch bay chuyến bay
  - `TOSS.2.2` — Lọc trên danh sách
  - `TOSS.2.4` — Kết xuất excel

## Module 3 — Flight Load Control (`FLC-flight-load-control/`)
- Tổng chức năng trong Function-list: 10
- Tổng chức năng đã có trong CATALOG.md: 10
- **2 chức năng CHƯA THẤY TRONG SRS** (cần rà tay):
  - `TOSS.3.2.2` — Lọc trên danh sách
  - `TOSS.3.3.4` — Lọc trên danh sách

## Module 4 — Station Manager (chưa có thư mục sync)
*(Function-list chưa có dòng chức năng nào cho module này)*

## Module 5 — Report (`RPT-report/`)
- Tổng chức năng trong Function-list: 38
- Tổng chức năng đã có trong CATALOG.md: 0
- **38 chức năng CHƯA THẤY TRONG SRS** (cần rà tay):
  - `TOSS.5.1` — Báo cáo tàu dừng
  - `TOSS.5.2` — Báo cáo lịch bay cơ sở
  - `TOSS.5.3` — Lịch bay tuần
  - `TOSS.5.4` — Lịch bay chuyển giao điều hành
  - `TOSS.5.5` — Thống kê chuyến đã bay với giờ bay kế hoạch (tính cả CNL)
  - `TOSS.5.6` — Thống kê chuyến bay thay đổi. Tăng chuyến
  - `TOSS.5.7` — Daily Report Data from MIS
  - `TOSS.5.8` — ALL Daily Report, Data from MIS
  - `TOSS.5.9` — Thống kê hủy chuyến
  - `TOSS.5.10` — Báo cáo cục HK chậm chuyến
  - `TOSS.5.11` — Báo cáo cục HK hủy chuyến
  - `TOSS.5.12` — Tăng chuyến giai đoạn khai thác
  - `TOSS.5.13` — Tổng hợp tăng chuyến
  - `TOSS.5.14` — Tổng hợp hủy chuyến
  - `TOSS.5.15` — Tổng hợp chuyến bay Ferry
  - `TOSS.5.16` — Tổng hợp chuyến bay UpConfig
  - `TOSS.5.17` — Tổng hợp chuyến bay DownConfig
  - `TOSS.5.18` — Báo cáo thời gian tàu làm kỹ thuật
  - `TOSS.5.19` — Báo cáo slot/giờ bay tàu trống
  - `TOSS.5.20` — Báo cáo full lịch sử 1 chuyến bay
  - `TOSS.5.21` — Báo cáo SC chuyến bay (đổi code, đổi giờ, đổi tàu, đổi loại tàu, đổi fleet)
  - `TOSS.5.22` — Thống kê tổng hợp
  - `TOSS.5.23` — Thống kê tổng hợp chậm Hạ cánh
  - `TOSS.5.24` — TK chậm giờ bay cất cánh trên 15'
  - `TOSS.5.25` — TK chậm giờ bay cất cánh trên 15' (T/Ngày)
  - `TOSS.5.26` — Thống kê chậm giờ bay cất cánh
  - `TOSS.5.27` — TK chậm giờ bay hạ cánh trên 15'
  - `TOSS.5.28` — TK chậm giờ bay hạ cánh từ 1 đến 15'
  - `TOSS.5.29` — Thống kê đổi hướng DIV
  - `TOSS.5.30` — Thống kê các chuyến bay thực
  - `TOSS.5.31` — Thống kê các chuyến bay thực
  - `TOSS.5.32` — Thống kê các chuyến bay thực
  - `TOSS.5.33` — Thống kê giờ bay máy bay
  - `TOSS.5.34` — Thống kê giờ bay máy bay
  - `TOSS.5.35` — Thống kê Ground Time
  - `TOSS.5.36` — Thống kê GroundTime\_Min
  - `TOSS.5.37` — Báo cáo OPS Remark
  - `TOSS.5.38` — Thống kê hủy chuyến của OCC

## Module 6 — Data Maintenance (`DM-data-maintenance/`)
- Tổng chức năng trong Function-list: 13
- Tổng chức năng đã có trong CATALOG.md: 69
- **3 chức năng CHƯA THẤY TRONG SRS** (cần rà tay):
  - `TOSS.6.1.5` — Filter trên danh sách
  - `TOSS.6.2.3` — Filter (Base, Tàu, Code, Group, From - to)
  - `TOSS.6.3.3` — Lọc

## Module 7 — Data Source Monitoring (chưa có thư mục sync)
*(Function-list chưa có dòng chức năng nào cho module này)*

## Module 8 — System Admin (`SA-system-admin/`)
- Tổng chức năng trong Function-list: 26
- Tổng chức năng đã có trong CATALOG.md: 30
- **2 chức năng CHƯA THẤY TRONG SRS** (cần rà tay):
  - `TOSS.8.1.1` — Quản lý tham số trần và sàn ZFW
  - `TOSS.8.1.2` — Quản lý tham số thời điểm cảnh báo OFP, Payload, DOW

## Module 9 — Mail cảnh báo (`MCB-mail-canh-bao/`)
*(Function-list chưa có dòng chức năng nào cho module này)*

## Module 10 — Job đồng bộ (`JDB-job-dong-bo/`)
*(Function-list chưa có dòng chức năng nào cho module này)*

## Module 11 — Authentication (`AUTH-authentication/`)
- Tổng chức năng trong Function-list: 6
- Tổng chức năng đã có trong CATALOG.md: 0
- **6 chức năng CHƯA THẤY TRONG SRS** (cần rà tay):
  - `TOSS.11.1` — Màn login
  - `TOSS.11.2` — Màn home
  - `TOSS.11.3` — Logout
  - `TOSS.11.4` — Thông tin user
  - `TOSS.11.5` — Thay đổi pass user
  - `TOSS.11.6` — Giao diện sáng tối

## Module 12 — Home (chưa có thư mục sync)
*(Chưa có thư mục `ba/sync/` — 4 chức năng trong Function-list, toàn bộ coi là CHƯA CÓ SRS)*
- `TOSS.12.1` — Chọn phân hệ System Admin
- `TOSS.12.2` — Chọn phân hệ Data Maintenance
- `TOSS.12.3` — Chọn phân hệ Data Source Monitoring
- `TOSS.12.4` — Chọn phân hệ TOSS

---
**Tổng số dòng cần rà tay: 62**
