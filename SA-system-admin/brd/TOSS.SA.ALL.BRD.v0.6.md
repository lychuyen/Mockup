---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.6"
date: "2026-06-23"
status: "Draft"
document_type: "BRD"
document_id: "BRD-TOSS-PH5"
parent: "BRD-TOSS-001-khung-v0.12.md"
---

# Yêu cầu Nghiệp vụ — Phân hệ 5: Quản trị hệ thống (IAM/RBAC, Tích hợp, Hạ tầng, Chuẩn UI)

> **Tài liệu con của [BRD-TOSS-001-khung-v0.12.md](../../BRD-TOSS-001-khung-v0.12.md).** Phân rã chi tiết §7.5 — Phân hệ 5.
>
> **Phạm vi:** PH5 là phân hệ owner của IAM/RBAC (các phân hệ 1–4 áp dụng từ đây), chuẩn UI toàn hệ thống, cây menu, tích hợp các hệ thống ngoài qua API Gateway, hạ tầng Cloud + định cỡ, audit log, session, notification (email/ACARS push), import/export & migrate dữ liệu.
>
> **PH5 = kênh tích hợp (data contract, transport, retry). PH1–PH4 tiêu thụ dữ liệu đã tích hợp.** Cụ thể: PH5 chịu trách nhiệm về (a) chuẩn API/file/message với từng hệ thống ngoài; (b) ánh xạ trường (field mapping) và phiên bản hợp đồng dữ liệu; (c) cơ chế retry, dead-letter, alert khi link down; (d) giám sát luồng dữ liệu vào/ra. PH1–PH4 chỉ tiêu thụ dữ liệu đã được PH5 tích hợp, không tự kết nối điểm-điểm với hệ thống ngoài.
>
> **Quản lý điểm cần xác nhận:** mọi cờ `[cần xác nhận]` đã được chuyển về sổ cái duy nhất **OID-TOSS-001** (`ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md`). Trong tài liệu này chỉ giữ chú thích trỏ về OID dưới dạng `*(xem OID: <mã>)*` ở cuối mô tả BR liên quan.
>
> **Quy ước MoSCoW, ràng buộc, bên liên quan:** tham chiếu BRD khung §3, §6, §9. Phân rã FUNC: xem [PHAN-RA-BRD-PH5-quan-tri-he-thong-v0.4.md](../../../workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH5-quan-tri-he-thong-v0.4.md) (cập nhật theo v0.4 BR mới — BR-528/BR-530 tách atomic).

---

## §7.5 Phân hệ 5 — Quản trị hệ thống (IAM/RBAC, Tích hợp, Hạ tầng, Chuẩn UI)

### A. Quản trị danh tính & phân quyền (IAM/RBAC)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-501 | Hệ thống phải có một phân hệ Quản trị danh tính (IAM — Identity and Access Management) độc lập, quản lý toàn bộ vòng đời tài khoản người dùng: tạo, sửa, vô hiệu hóa, kích hoạt lại, xóa. | Functional | Must | Đề xuất giải pháp kỹ thuật §II.5; YCKT V3 TOSS-020 (sheet-04 #27) |
| BR-502 | Hệ thống phải áp dụng phân quyền 2 lớp: (a) **lớp chức năng** — phân quyền theo vai trò RBAC chi tiết tới từng phân hệ, dịch vụ, API, tách quyền chỉ xem (read-only) và quyền thao tác (write/action); (b) **lớp dữ liệu** — phân quyền theo căn cứ bay/Carrier/sân bay/tàu bay, mặc định lọc dữ liệu theo phạm vi của vai trò người dùng. | Functional | Must | Khảo sát 09/06/2026 §II.2 (chốt mục 2); Khảo sát 12/06 (BR-141 khung); Đề xuất §II.5; YCKT V3 TOSS-020 (sheet-04 #28) |
| BR-503 | Hệ thống phải cho phép một người dùng được gán nhiều vai trò đồng thời và chuyển đổi vai trò xem (switch view) trên cùng một phiên đăng nhập, ví dụ trên màn Giám sát chuyến bay. | Functional | Must | Khảo sát 12/06 (BR-141 khung); Khảo sát 09/06 §II.2 |
| BR-504 | Hệ thống phải hỗ trợ chính sách truy cập động (Dynamic Policies): hạn chế quyền theo khung giờ làm việc, theo trạng thái phiên; thay đổi phân quyền có hiệu lực theo thời gian thực mà không cần đăng xuất. | Functional | Must | Đề xuất §II.5 |
| BR-505 | Hệ thống phải cho phép quyền truy cập tạm thời có thời hạn (temporary access) và tự thu hồi khi hết hạn. | Functional | Must | Đề xuất §II.5 |
| BR-506 | Hệ thống phải dùng chung một màn hình danh sách chuyến bay cho nhiều vai trò; các cột dữ liệu và nút thao tác (upload/review/confirm…) ẩn/hiện theo quyền của vai trò người dùng đang đăng nhập. | Functional | Must | Khảo sát 09/06 §II.2 (chốt mục 3) |
| BR-507 | Hệ thống phải cho phép người dùng tự lưu cấu hình hiển thị cá nhân (chọn cột, độ rộng cột, bộ lọc đã áp dụng, trạng thái thu/mở của bộ lọc, "trạng thái gần nhất" của màn hình) theo profile cá nhân; cấu hình được khôi phục ở các phiên đăng nhập sau. | Functional | Must | Khảo sát 09/06 §II.2 (chốt mục 4); Khảo sát 12/06 (BR-142 khung); YCKT sheet-11 #14 (giữ độ rộng cột sau refresh); YCKT V3 TOSS-179 (sheet-04 #249) |
| BR-508 | Hệ thống phải có một cấu hình "trường hiển thị mặc định" chung do admin thiết lập cho từng màn hình tổng hợp (TBT, DSP, CLC), áp dụng cho tất cả người dùng; người dùng vẫn được phép tùy chỉnh thêm cho riêng mình (BR-507) mà không ảnh hưởng cấu hình mặc định và không ảnh hưởng cấu hình của người khác. | Functional | Must | YCKT sheet-11 #4 |

### B. Xác thực, phiên làm việc & audit

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-509 | Hệ thống phải áp dụng xác thực đa yếu tố (MFA/2FA) bắt buộc cho quản trị viên và các tài khoản có quyền truy cập dữ liệu nhạy cảm. | Functional | Must | Đề xuất §II.5 |
| BR-510 | Hệ thống phải hỗ trợ Single Sign-On (SSO) và tích hợp xác thực với LDAP/Active Directory của Tổng công ty. | Functional | Must | Đề xuất §II.5; YCKT V3 TOSS-022 (sheet-04 #29); YCKT V3 TOSS-106 (sheet-04 #130); YCKT sheet-06 #41 (AD/LDAP) |
| BR-511 | Hệ thống phải kiểm soát phiên làm việc theo thời gian thực: timeout phiên, danh sách phiên đang hoạt động, hủy phiên từ xa khi cần. | Functional | Must | Đề xuất §II.5 |
| BR-512 | Hệ thống phải ghi nhật ký (audit log) chi tiết các hành vi: đăng nhập/đăng xuất, thay đổi phân quyền, truy cập và thay đổi dữ liệu nghiệp vụ trọng yếu (release/un-release OFP, sửa danh mục, sửa BCAO…); ghi rõ người thực hiện, thời điểm, hành động, đối tượng. | Functional | Must | Đề xuất §II.5; Khảo sát 15/06/2026 §II.3 (admin cấp quyền release kèm audit đầy đủ) |
| BR-513 | Hệ thống phải có cơ chế ghi nhận attribution chính xác cho từng phiên bản OFP khi bàn giao ca, để phản ánh đúng người upload bản gốc và người chỉnh sửa bản kế tiếp. *(xem OID: KS-42)* | Functional | Must | Khảo sát 15/06/2026 §II.3 |

### C. Cây menu & điều hướng

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-514 | Hệ thống phải tổ chức điều hướng theo cây menu chính bao gồm các nhóm nghiệp vụ và các nhóm quản trị: Live Operations, Flight Dispatch, Flight Load Control, Station Manager, NOTOC/Manifest, Report, Data Maintenance, Data Source Monitoring, System Admin. | Functional | Must | YCKT sheet-07 #2 (MENU); Khảo sát 09/06 §II.1 |
| BR-515 | Hệ thống phải gom các chức năng quản trị danh mục (Data Maintenance), giám sát luồng dữ liệu tích hợp (Data Source Monitoring) và quản trị hệ thống (System Admin) vào nhánh quản trị, tách khỏi các nhóm nghiệp vụ tác nghiệp; phương án cụ thể (gộp/tách bao nhiêu menu trong nhánh quản trị) do thiết kế menu kế tiếp đề xuất. | Functional | Must | Khảo sát 09/06 §II.1 (chốt mục 1, mục 16) |
| BR-516 | Hệ thống phải có ứng dụng web chạy trên trình duyệt desktop và phiên bản web-mobile sử dụng được trên điện thoại và iPad. | NFR | Must | YCKT sheet-11 #9 |

### D. Chuẩn UI/UX toàn hệ thống

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-517 | Hệ thống phải dùng **tiếng Anh** làm ngôn ngữ giao diện chuẩn, hiển thị thời gian theo **UTC** và định dạng **24 giờ**, áp dụng cho toàn bộ phân hệ. | NFR | Must | Khảo sát 12/06 (BR-143 khung) |
| BR-518 | Hệ thống phải hỗ trợ chế độ giao diện sáng/tối (Light Mode/Dark Mode), trong đó Dark Mode là chế độ ưu tiên cho người dùng vận hành 24/7. | NFR | Must | Khảo sát 12/06 (BR-143 khung); YCKT sheet-11 #9 |
| BR-519 | Hệ thống phải **chuẩn hóa chữ hoa (uppercase)** khi xử lý và đối sánh dữ liệu cho mọi trường tìm kiếm, bộ lọc và nhập liệu; áp dụng nhất quán toàn hệ thống. | NFR | Must | YCKT sheet-11 #2 |
| BR-520 | Hệ thống phải dùng dropdown tải dữ liệu một lần (preload), không để tình trạng dropdown quay chờ tải thêm khi người dùng mở danh sách. | NFR | Must | YCKT sheet-11 #3 |
| BR-521 | Hệ thống phải hiển thị các bảng dữ liệu nhỏ kiểu tile theo cặp "tiêu đề bên trái — giá trị bên phải" (title–value) để dễ quan sát. | NFR | Should | YCKT sheet-11 #7 |
| BR-522 | Hệ thống phải cho phép điều chỉnh độ rộng cột trên web; độ rộng đã điều chỉnh phải được giữ lại khi refresh trang (gắn với BR-507 — lưu cấu hình hiển thị cá nhân). | Functional | Must | YCKT sheet-11 #14 |
| BR-523 | Hệ thống phải áp dụng bảng màu trạng thái chuẩn 4 trạng thái thống nhất toàn hệ thống cho các cell/badge cảnh báo (ví dụ trắng/vàng/đỏ/xanh hoặc tương đương), kèm bộ legend giải thích trên từng màn hình sử dụng. | NFR | Must | BRD khung §9.2 (cell-level coloring 4 trạng thái) |
| BR-524 | Hệ thống phải bố trí trang báo cáo theo cấu trúc chuẩn: bộ lọc tiêu chuẩn (Standard Filter) + bộ lọc riêng theo báo cáo nếu cần + khu vực biểu đồ + khu vực bảng dữ liệu chi tiết; bảng dữ liệu chi tiết cho phép người dùng chọn thêm cột (lấy từ tập dữ liệu của báo cáo FOS). | Functional | Must | YCKT sheet-11 #10 |

### E. Tích hợp hệ thống ngoài & API Gateway

> **Nguyên tắc PH5 — kênh tích hợp:** Với mọi BR-528a…h và BR-530a…g dưới đây, PH5 phải duy trì **hợp đồng dữ liệu (data contract)** với hệ thống ngoài — bao gồm: (1) chuẩn API/file/message (REST/SOAP/SFTP/MQ/AMHS…); (2) ánh xạ trường (field mapping) và phiên bản hợp đồng; (3) cơ chế retry, dead-letter queue, alert khi link down/timeout; (4) cấu hình tần suất/hình thức thu thập theo từng nguồn. PH1–PH4 chỉ tiêu thụ dữ liệu đã được PH5 chuẩn hóa, không tự kết nối điểm-điểm.

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-525 | Hệ thống phải xây dựng cổng tích hợp API Gateway tập trung thay thế kết nối điểm-điểm; bảo mật điểm cuối, xác thực tập trung, kiểm soát tốc độ (rate-limit), phân phối tải; quản trị vòng đời API (thiết kế, triển khai, versioning, bảo trì, ngừng API). | Functional | Must | Đề xuất §I; YCKT V3 TOSS-058, TOSS-062 (sheet-04 #74, #78) |
| BR-526 | Hệ thống phải hỗ trợ kỹ thuật truyền tải tệp lớn (nén, song song) cho các luồng tích hợp tệp. | NFR | Must | Đề xuất §I |
| BR-527 | Hệ thống phải hỗ trợ cơ chế tích hợp **chủ động theo sự kiện** (event-based / push) ngay khi nguồn phát sinh dữ liệu, kết hợp với cơ chế ảnh chụp dữ liệu định kỳ (poll/snapshot) cho các nguồn không hỗ trợ push. Cấu hình tần suất/hình thức thu thập theo từng nguồn. *(xem OID: KS-01)* | Functional | Must | Đề xuất §I; Khảo sát 09/06/2026 §II.9 (chốt mục 12); YCKT V3 TOSS-107 (sheet-04 #131) |
| BR-528a | Hệ thống phải duy trì data contract với nhóm **Lập lịch & điều phái** — Netline/Flight Ops++ (lịch bay, slot, thay đổi lịch) và Flight Scheduling chuẩn SSIM/ASM/SSM (export lịch bay phát hành ra ngoài, import thay đổi lịch từ thương mại): chuẩn API/file, ánh xạ trường, cơ chế retry và alert khi link down. PH1 tiêu thụ lịch bay đã chuẩn hóa qua PH5. *(xem OID: SME-14)* | Functional | Must | YCKT sheet-06 (Netline, SSIM/ASM/SSM); Đề xuất §I; Khảo sát 08/06/2026 §II.3 |
| BR-528b | Hệ thống phải duy trì data contract với nhóm **Tổ bay & khai thác nội bộ** — AVES (danh sách tổ bay, trip pairing, qualification) và MO Plus (Dispatch Release/Confirm, đẩy tài liệu chuyến bay phiên bản cuối): chuẩn API/message, ánh xạ trường, retry và alert. PH1 (Dispatch Release) và PH2 (tài liệu chuyến bay) tiêu thụ dữ liệu đã chuẩn hóa. *(xem OID: SME-22)* | Functional | Must | YCKT sheet-06 (AVES, MO Plus); Đề xuất §I; Khảo sát 11/06/2026 buổi chiều §II.4 |
| BR-528c | Hệ thống phải duy trì data contract với nhóm **Lập kế hoạch bay** — Lido Flight 4D / Adapter Lido / Lido mPilot (OFP gốc, chart, fuel computation, đường bay đề xuất): chuẩn file/API, ánh xạ trường OFP và metadata, cơ chế retry và alert. PH1 (Dispatch) và PH2 (tài liệu chuyến bay) tiêu thụ OFP đã chuẩn hóa. TOSS kết nối **trực tiếp tới Lido** để lấy OFP phục vụ chức năng nội bộ (Dispatch Release/Un-Release/Confirm — PH1, gán phiên bản R1/R2… và đẩy MO Plus — PH2, báo cáo OFP vs thực tế — PH3), không phụ thuộc đường relay qua OPS++. *(xem OID: SME-23)* | Functional | Must | YCKT sheet-06 (Lido Flight); Đề xuất §I; bảng Thông tin tích hợp OpsPlus v77 [Inbound dòng 19 — OFP] |
| BR-528d | Hệ thống phải duy trì data contract với nhóm **Bảo dưỡng kỹ thuật** — AMOS/MRO (MEL, CDL, AOG, defect, maintenance schedule), TIMS, eTechlog, FOEM/DOW: chuẩn API/file, ánh xạ trường khoảng hiệu lực MEL/NAIL/CDL và DOW theo phiên bản, retry và alert. PH4 (Master Data) và PH1 (Dispatch) tiêu thụ dữ liệu đã chuẩn hóa. *(xem OID: SME-14)* | Functional | Must | YCKT sheet-06 (AMOS, TIMS, eTechlog, FOEM/DOW); Đề xuất §I |
| BR-528e | Hệ thống phải duy trì data contract với nhóm **Thương mại & đặt chỗ** — Amadeus PSS 1A (đặt chỗ hành khách), DCS (check-in, boarding, load data PAX/Bag): chuẩn API/message, ánh xạ trường PAX/Bag/Cargo và trạng thái boarding, retry và alert. PH1 (load) và PH3 (báo cáo PAX) tiêu thụ dữ liệu đã chuẩn hóa. *(xem OID: SME-26)* | Functional | Must | YCKT sheet-06 (Amadeus PSS, DCS); Đề xuất §I |
| BR-528f | Hệ thống phải duy trì data contract với nhóm **Mặt đất & sân đỗ** — VMS/VIAGS (parking, ground service), A-CDM (16 mốc thời gian turnaround), RPS (chi phí ground service): chuẩn API/message, ánh xạ trường 16 mốc A-CDM và parking/ground service request, retry và alert. PH1 (Monitoring real-time) tiêu thụ dữ liệu đã chuẩn hóa. *(xem OID: SME-22)* | Functional | Must | YCKT sheet-06 (VMS/VIAGS, A-CDM, RPS); Đề xuất §I |
| BR-528g | Hệ thống phải duy trì data contract với nhóm **Tuân thủ & môi trường** — ANCM (noise abatement), NetZero/ETS (carbon emission, EU ETS, CORSIA), Cargo Spot (cargo manifest): chuẩn API/file, ánh xạ trường khí thải/cargo, retry và alert. PH3 (báo cáo môi trường, NOTOC) tiêu thụ dữ liệu đã chuẩn hóa. *(xem OID: SME-26)* | Functional | Should | YCKT sheet-06 (ANCM, NetZero, ETS, Cargo Spot); Đề xuất §I |
| BR-528h | Hệ thống phải duy trì data contract với nhóm **Giám sát vị trí** — FlightRadar24 (vị trí tàu bay real-time), ADS-B (surveillance out/in qua vệ tinh/mặt đất): chuẩn API/feed, ánh xạ trường tọa độ/độ cao/tốc độ, retry và alert. PH1 (Monitoring real-time) tiêu thụ dữ liệu đã chuẩn hóa. *(xem OID: SME-23)* | Functional | Should | YCKT sheet-06 (FlightRadar24, Flight Watch); Đề xuất §I |
| BR-529 | Hệ thống phải bảo đảm cam kết phát triển thêm tối thiểu 10 giao tiếp dữ liệu giữa các hệ thống trong thời gian cung cấp dịch vụ mà không phát sinh chi phí. | NFR | Must | YCKT V3 TOSS-064 (sheet-04 #80) |
| BR-530a | Hệ thống phải tích hợp luồng dữ liệu inbound từ **AMOS** đồng bộ hiện trạng MEL, CDL, AOG, defect, NAIL phát sinh kèm khoảng hiệu lực, giá trị Techlog uplift FOB và **lịch ground event / maintenance schedule** (xuống hangar, A/B/C-check) phục vụ PH4 cập nhật trạng thái khả dụng tàu bay vào TOSS: chuẩn API/message, ánh xạ trường, retry và alert khi link down. PH4 (Master Data MEL/CDL, trạng thái khả dụng tàu bay) và PH1 (Dispatch, cảnh báo tàu bay không khả dụng cho chuyến bay được phân) tiêu thụ. *(xem OID: SME-14)* | Functional | Must | Khảo sát 11/06/2026 buổi sáng §II.10; bảng Thông tin tích hợp OpsPlus v77 [Inbound dòng 20 — Ground Event] |
| BR-530b | Hệ thống phải tích hợp luồng dữ liệu inbound từ **QAR/QAI** (Cassiopee Alpha — Analyzed QAR) qua API hoặc Database View của Tổng công ty: chuẩn API/View, ánh xạ trường Standard Taxi Time và phân tích Post-Flight, retry và alert. PH3 (Data Monitoring, Time analytics) tiêu thụ. *(xem OID: SME-22)* | Functional | Should | Khảo sát 11/06/2026 buổi sáng §II.14 |
| BR-530c | Hệ thống phải tích hợp luồng dữ liệu inbound từ **ACARS** trực tiếp làm nguồn mốc thời gian thực tế OUT/OFF/ON/IN, Phase Trigger và điện văn ACARS cho màn Monitoring real-time: chuẩn message AMHS/AFTN/SITA TEXT, ánh xạ trường OOOI events, retry và alert. PH1 (Monitoring real-time, Phase Trigger) tiêu thụ. *(xem OID: SME-23)* | Functional | Must | Khảo sát 11/06/2026 buổi sáng §II.10; Khảo sát 11/06/2026 buổi chiều §II.6 |
| BR-530d | Hệ thống phải tích hợp luồng dữ liệu inbound từ **A-CDM** nhận 16 mốc thời gian turnaround từ sân bay (boarding, đóng cửa, push-back…) để biết chuyến đã phục vụ đến giai đoạn nào tại sân: chuẩn API/message, ánh xạ 16 mốc, retry và alert. PH1 (Monitoring, Flight Detail) tiêu thụ. *(xem OID: SME-22)* | Functional | Must | Khảo sát 11/06/2026 buổi chiều §II.9 |
| BR-530e | Hệ thống phải tích hợp luồng dữ liệu inbound từ **AIJS** (hệ thống trung gian đính file Weather Multi-Flight và dữ liệu cảnh báo an toàn bay): chuẩn API/file, ánh xạ trường, retry và alert. PH2 (Weather Multi-Flight) và PH3 (báo cáo an toàn) tiêu thụ. *(xem OID: SME-26)* | Functional | Should | Khảo sát 11/06/2026 buổi chiều §II.11 |
| BR-530f | Hệ thống phải tích hợp luồng dữ liệu inbound từ **Logitech/GDTN** nhận log download tài liệu của tổ bay từ MO Plus (upload/truy cập tài liệu): chuẩn API/log feed, ánh xạ trường, retry và alert. PH2 (log tổ bay) và PH3 (báo cáo coverage tổ bay) tiêu thụ. *(xem OID: SME-26)* | Functional | Should | Khảo sát 11/06/2026 buổi chiều §II.12 |
| BR-530g | Hệ thống phải tích hợp luồng dữ liệu inbound từ **ICON / Weather provider** nhận dữ liệu thời tiết METAR/TAF/SIGMET/SIGWX và Flight Level: chuẩn API/file, ánh xạ trường thời tiết, retry và alert. PH1 (khuyến nghị nhiên liệu, en-route weather) và PH2 (Weather Multi-Flight) tiêu thụ. *(xem OID: SME-23)* | Functional | Must | Khảo sát 11/06/2026 buổi chiều §II.6 |
| BR-531 | Hệ thống phải cung cấp tập API ra cho các hệ thống vệ tinh tiêu thụ dữ liệu TOSS, tối thiểu bao gồm: API báo cáo FOS (cấu hình tham số trả về theo trường); API Fuel–Weight–Time cho MO Plus; API thời tiết sân bay cho Quản trị EFB; Aircraft API (thuộc tính + Performance Factor mới nhất); API tương tác MO Plus (Dispatch Release / Flight Release / Confirm Document); API cung cấp gói tài liệu chuyến bay phiên bản cuối có phân quyền; API đẩy tài liệu Library/Notices vào Draft cho từng phân hệ tài liệu; API cung cấp lịch bay và dữ liệu khai thác cho hệ thống khác. | Functional | Must | YCKT V3 TOSS-108, TOSS-109 (sheet-04 #136–144) |
| BR-532 | Hệ thống phải mở rộng cơ chế đồng bộ Dispatch Release / Unrelease với MO Plus: bắn revision/version mới khi Unrelease và kích hoạt MO Plus reset trạng thái Confirm Release của phi công về 0; gửi notification trên ứng dụng MO Plus để phi công Confirm lại; quy ước tín hiệu, payload, timing và hành vi notification được phối hợp với đội phát triển MO Plus. *(xem OID: KS-20)* | Functional | Must | Khảo sát 11/06/2026 buổi chiều §II.4 |
| BR-533 | Hệ thống phải có giao diện cho người quản trị giám sát tổng quan các luồng dữ liệu vào/ra: phân theo loại dữ liệu/nguồn, hệ thống nguồn và hệ thống đích, thời điểm cập nhật cuối, trạng thái kết nối; quản lý riêng luồng vào (inbound) và luồng ra (outbound). | Functional | Must | YCKT V3 TOSS-110 (sheet-04 #146); YCKT sheet-07 #3 (Data Source Monitoring) |
| BR-534 | Hệ thống phải cung cấp báo cáo tỷ lệ phủ dữ liệu (data coverage) định kỳ cho mọi nguồn tích hợp; báo cáo này được quản lý độc lập với báo cáo nghiệp vụ điều hành. | Functional | Must | YCKT sheet-11 #8; Khảo sát 09/06/2026 §II.12 (chốt mục 16) |
| BR-535 | Hệ thống phải khảo sát và cấu hình tích hợp với các cơ quan đơn vị (CĐV) của VNA: phương thức kết nối, trường dữ liệu, tần suất và hình thức thu thập cấu hình được theo từng nguồn. | Functional | Must | YCKT sheet-11 #6 |

### F. Notification & email

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-536 | Hệ thống phải gửi email cảnh báo cho danh sách người nhận đã cấu hình khi: OFP có thay đổi (làm nổi bật các thay đổi quan trọng), chuyến bay chưa được Dispatch Release trước ngưỡng quy định. | Functional | Must | Khảo sát 15/06/2026 §II.3 |
| BR-537 | Hệ thống phải cho phép quản trị linh hoạt các danh sách email nhận thông báo: thêm/bớt người nhận cho từng loại thông báo (ví dụ Email list for Data Coverage Report, Email list for Daily Operations Report). | Functional | Must | YCKT V3 TOSS-168 (sheet-04 #229–231) |
| BR-538 | Hệ thống phải tự động gửi định kỳ các báo cáo thường kỳ theo lịch và theo danh sách email người nhận được cấu hình. | Functional | Must | YCKT sheet-11 #11 |
| BR-539 | Hệ thống phải hỗ trợ kênh push notification trong ứng dụng đối tác (MO Plus) cho các sự kiện liên thông (ví dụ phi công cần Confirm lại OFP sau Unrelease — gắn với BR-532). | Functional | Must | Khảo sát 11/06/2026 buổi chiều §II.4 |

### G. Import / Export / Migrate dữ liệu

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-540 | Hệ thống phải di trú (migrate) dữ liệu lịch sử từ hệ thống FIMS và Netline hiện hành sang TOSS, bao gồm cơ sở dữ liệu lịch bay, kế hoạch bay và các dữ liệu FIMS đã tích hợp liên quan đến chuyến bay. | Functional | Must | YCKT V3 TOSS-105 (sheet-04 #129); YCKT sheet-11 #5 |
| BR-541 | Hệ thống phải cho phép download lịch bay cập nhật nhất theo định dạng cho trước (Flight List for Backup Tool) để người dùng nhập vào phần mềm backup của Netline trong tình huống Ops++ gặp sự cố. | Functional | Must | YCKT V3 TOSS-260 (sheet-04 #358); BP-015 (BRD khung) |
| BR-542 | Hệ thống phải có cơ chế đồng bộ dữ liệu từ môi trường PROD sang môi trường TEST để kiểm thử với dữ liệu thực tế. | NFR | Should | YCKT sheet-11 #1 |

### H. Hạ tầng, sizing, môi trường, SLA

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-543 | Hệ thống phải được triển khai trên hạ tầng Cloud của VNA cung cấp, gồm ba môi trường: chính (Prod), phát triển/kiểm thử (Dev/Test) và dự phòng (Standby/Backup). | NFR | Must | YCKT V3 TOSS-046, TOSS-047 (sheet-04 #58, #59); Đề xuất §I |
| BR-544 | Hệ thống phải đáp ứng quy mô tối thiểu **≥ 4.000 người dùng đăng ký** và **200 người dùng đồng thời (CCU)**; tải mục tiêu **500 request/giây** với kích thước trung bình **10 Kb/request**. | NFR | Must | Sizing-update260609-4T.xlsx; Đề xuất §I |
| BR-545 | Hệ thống phải có khả năng lưu trữ dữ liệu quy mô **~18 TB** (gồm ~5.5 TB cơ sở dữ liệu và ~12.5 TB tệp), kèm dung lượng backup ~31.5 TB. | NFR | Must | Sizing-update260609-4T.xlsx |
| BR-546 | Hệ thống phải được định cỡ tài nguyên Cloud tối thiểu: ~311 vCPU, ~964 GB RAM, ~43.6 TB storage, ~27 VM, 3 Public IP; bao gồm Cloud Firewall và Hybrid Connect (vHC 200Mbps + VPN L2). Chi tiết cấu hình từng máy chủ xem phụ lục Sizing. | NFR | Must | Sizing-update260609-4T.xlsx; YCKT V3 TOSS-050 (sheet-04 #62) |
| BR-547 | Hệ thống phải đạt SLA độ sẵn sàng ≥ 99%; hạ tầng triển khai theo High Availability (active-active hoặc active-standby); thời gian chuyển đổi khi sự cố < 1 giờ. | NFR | Must | Đề xuất §I; YCKT NFR |
| BR-548 | Hệ thống phải áp dụng cơ chế kiểm soát lưu lượng (rate-limit/throttling) ở tầng API Gateway và tách biệt tài nguyên giữa các thành phần app/DB/log để hạn chế ảnh hưởng chéo. | NFR | Must | Đề xuất §I |
| BR-549 | Hệ thống phải cho phép restart/cập nhật phiên bản mà không gián đoạn dịch vụ (rolling update / zero-downtime deployment). | NFR | Must | Đề xuất §I; YCKT V3 TOSS-029 |
| BR-550 | Hệ thống phải vận hành liên tục 24/7/365 trong 60 tháng kể từ go-live, kèm dịch vụ vận hành & hỗ trợ 24/7/365 (tiếp nhận sự cố, quản lý change request, báo cáo vận hành định kỳ, báo cáo sự cố bất thường); bàn giao mã nguồn và tài liệu cho VNA sau khi hết thời hạn thuê. | NFR | Must | YCKT NFR; YCKT V3 TOSS-036-045 |
| BR-551 | Hệ thống phải giám sát tập trung hoạt động trên hạ tầng Cloud, phát hiện và cảnh báo bất thường; nhà cung cấp khuyến cáo VNA các vấn đề liên quan đến hạ tầng. | NFR | Must | YCKT V3 TOSS-049 (sheet-04 #61) |
| BR-552 | Hệ thống phải áp dụng quy trình CI/CD cho phát triển, triển khai và nâng cấp (tự động kiểm thử và phát hành). | NFR | Must | YCKT V3 TOSS-029 |
| BR-553 | Hệ thống phải nâng cấp ứng dụng web và mobile để tương thích với phiên bản mới của hệ điều hành/trình duyệt trong vòng 30 ngày kể từ ngày phát hành. | NFR | Must | YCKT V3 TOSS-034 |
| BR-554 | Hệ thống phải tuân thủ Nghị định 53/2022/NĐ-CP (lưu trữ dữ liệu tại Việt Nam) và Nghị định 13/2023/NĐ-CP (bảo vệ dữ liệu cá nhân); tuân thủ ANTT của Tổng công ty Hàng không; không chia sẻ dữ liệu ra ngoài khi chưa được cho phép. | NFR | Must | Đề xuất §I; YCKT NFR |
| BR-555 | Hệ thống phải bàn giao đầy đủ tài liệu (đặc tả yêu cầu, kiến trúc, thiết kế chi tiết, mã nguồn và đặc tả mã nguồn) và tổ chức đào tạo/chuyển giao công nghệ cho đội ngũ quản trị và các đối tượng người dùng khác nhau. | Functional | Must | YCKT V3 TOSS-053-055 (sheet-04 #67) |

---

*BRD-TOSS-PH5 v0.6 — 2026-06-23. Tổng 68 BR, tổ chức thành 8 nhóm A–H. Lịch sử version: BA-VERSION-LOG.md.*
