---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.12"
date: "2026-06-17"
status: "Draft"
document_type: "BRD"
document_id: "BRD-TOSS-001"
---

# Tài liệu Yêu cầu Nghiệp vụ (BRD) — Khung top-down (v0.11)

> **Trạng thái:** Khung (skeleton) phục vụ thẩm định nội bộ trước khi đi vào chi tiết. **Toàn bộ nội dung được phân rã trung thực từ nguồn đã trích dẫn** (báo cáo khảo sát 08–15/06/2026, sheet YCKT-VTIT, FDOP §3.1–3.5, Customer Docs đã extract). Mọi điểm chưa rõ được đẩy về sổ cái duy nhất **OID-TOSS-001** dưới dạng chú thích `*(xem OID: <mã>)*`. Các yêu cầu nghiệp vụ chi tiết (BR) được tách thành **5 file BRD-TOSS-PHn** theo phân hệ; tài liệu khung này giữ §1–§6 (chung), §7.6 (tổng kết BR), §8–§10.
>
> **Phạm vi mức:** Khung BRD chỉ mô tả ở mức **mục tiêu nghiệp vụ + phạm vi + quy trình chính + nguyên tắc**, KHÔNG bóc xuống chức năng cụ thể, trường dữ liệu hay use case. Bóc tách tới Yêu cầu chức năng (FR), Trường hợp sử dụng (UC), Câu chuyện người dùng (US) sẽ được thực hiện ở các tài liệu SRS/FRD kế tiếp.

## Mục lục

1. [Thông tin tài liệu (Document Control)](#1-thông-tin-tài-liệu-document-control)
2. [Tóm tắt điều hành (Executive Summary)](#2-tóm-tắt-điều-hành-executive-summary)
3. [Bối cảnh & Vấn đề hiện tại (Business Context)](#3-bối-cảnh--vấn-đề-hiện-tại-business-context)
4. [Mục tiêu nghiệp vụ (Business Objectives)](#4-mục-tiêu-nghiệp-vụ-business-objectives)
5. [Phạm vi (Scope)](#5-phạm-vi-scope)
6. [Các bên liên quan (Stakeholders)](#6-các-bên-liên-quan-stakeholders)
7. [Yêu cầu nghiệp vụ theo phân hệ (Detailed BR per subsystem)](#7-yêu-cầu-nghiệp-vụ-theo-phân-hệ)
8. [Quy trình nghiệp vụ (Business Process)](#8-quy-trình-nghiệp-vụ-business-process)
9. [Giả định & Ràng buộc (Assumptions & Constraints)](#9-giả-định--ràng-buộc-assumptions--constraints)
10. [Tài liệu nguồn (References)](#10-tài-liệu-nguồn-references)

---

## 1. Thông tin tài liệu (Document Control)

| Trường | Giá trị |
|---|---|
| Tên dự án | TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không (Airline Operations Management System) |
| Mã dự án | TOSS |
| Mã tài liệu | BRD-TOSS-001 |
| Phiên bản | 0.11 |
| Ngày phát hành | 2026-06-17 |
| Trạng thái | Draft (Khung — chưa có người duyệt) |
| Người soạn | BA Lead |
| Người duyệt | *(xem OID: DEC-06 — chờ phân công)* |
| Phạm vi tài liệu | Khung top-down toàn dự án; chi tiết BR/FR tách riêng |

---

## 2. Tóm tắt điều hành (Executive Summary)

Hệ thống Tối ưu Điều hành Khai thác (TOSS) được Tổng công ty Hàng không Việt Nam (VNA) đặt ra với hai mục đích cốt lõi. Thứ nhất là **thay thế hệ thống FMS hiện hành** đang vận hành chậm và phủ chưa đủ dữ liệu chuyển động chuyến bay (Khảo sát 08/06/2026 §II.4 và §II.7). Thứ hai là **hợp nhất các luồng dữ liệu khai thác** (lịch bay, tổ bay, kỹ thuật, tài liệu chuyến bay, thời tiết, NOTAM, hành khách nối chuyến…) về một nền tảng duy nhất, đóng vai trò **nguồn dữ liệu tập trung và lớp giám sát — cảnh báo** cho Trung tâm Kiểm soát Khai thác (OCC — Operational Control Center). Các thao tác nghiệp vụ chuyên dụng (Lido lập kế hoạch bay, MO Plus xác nhận tài liệu phi công, AMOS bảo dưỡng, Netline lịch bay…) tiếp tục diễn ra ở hệ thống chuyên dụng tương ứng và TOSS **không trùng lặp chức năng** với các hệ thống này (Khảo sát 11/06/2026 buổi sáng §II.4; Khảo sát 09/06/2026 §II.10).

Đóng góp nghiệp vụ chính của TOSS bao gồm: (a) bổ sung thao tác chủ động **Dispatch Release** trên TOSS để xác nhận bản kế hoạch bay (OFP — Operational Flight Plan) chính thức, làm tiền đề bắt buộc cho **Captain's Release** trên MO Plus (Khảo sát 11/06/2026 buổi sáng §II.1, §II.2); (b) cung cấp **màn hình tập trung kiểm tra đầu ca** cho điều phái viên (Dispatcher) thay vì phải mở 5–7 ứng dụng rời rạc (Khảo sát 11/06/2026 buổi sáng §II.4); (c) **số hóa Báo cáo Điều hành ngày Khai thác (BCAO)** đang được soạn thủ công bằng Word (Khảo sát 08/06/2026 §II.3, Khảo sát 09/06/2026 §II.7); (d) **chuẩn hóa nguồn dữ liệu danh mục (Master Data)** cho tàu bay, sân bay, chặng bay và cung cấp ngược cho các hệ thống vệ tinh; (e) **quản lý phiên bản OFP** trên TOSS (Release / Unrelease) và đẩy đúng phiên bản đang sử dụng sang MO Plus, kể cả khi cần quay về phiên bản OFP cũ (Khảo sát 11/06/2026 buổi chiều §II.4).

Giải pháp được quy hoạch thành **năm phân hệ nghiệp vụ**: (i) Thông tin điều hành chuyến bay; (ii) Quản lý tài liệu chuyến bay; (iii) Quản lý báo cáo, đánh giá tối ưu khai thác; (iv) Quản lý danh mục (Master Data); (v) Quản trị hệ thống (IAM/RBAC, Tích hợp, Hạ tầng) (sheet-07 MENU YCKT; Đề xuất giải pháp kỹ thuật §II).

Mức kỳ vọng vận hành: dịch vụ 24/7/365 cho OCC, độ sẵn sàng SLA tối thiểu 99%, hỗ trợ quy mô khoảng 4.000 người dùng (đồng thời 200), tích hợp với ~40 hệ thống nguồn, tuân thủ Nghị định 53/2022/NĐ-CP về lưu trữ dữ liệu tại Việt Nam và Nghị định 13/2023/NĐ-CP về bảo vệ dữ liệu cá nhân (Đề xuất giải pháp kỹ thuật §I; sheet YCKT V3).

---

## 3. Bối cảnh & Vấn đề hiện tại (Business Context)

### 3.1 Hiện trạng (As-Is)

**Về dữ liệu và hệ thống tổng thể:**
- Hệ thống FMS đang vận hành chậm; dữ liệu chuyển động chuyến bay (Movement) hiện chỉ phủ khoảng **90%** số chuyến của hãng (các hãng khác đạt khoảng 99%), độ chính xác khoảng **79%**; quy mô khoảng **11.000 chuyến/tháng** (Khảo sát 08/06/2026 §II.4).
- Hệ thống web tiền thân (MMS) chỉ chạy được trên Internet Explorer, phát triển từ khoảng năm 2019, phạm vi hẹp hơn nhiều so với TOSS dự kiến (Khảo sát 08/06/2026 §II.4 và §V).
- Giao diện báo cáo hiện hành dùng Oracle Form chỉ xuất được một báo cáo tổng hợp chi tiết khoảng 190 trường mà không được phép chọn trường, sau đó xuất Excel và xử lý thủ công bằng công thức để dựng pivot (Khảo sát 08/06/2026 §II.3).

**Về tài liệu chuyến bay và phát hành OFP:**
- Hệ thống Lido **tự sinh OFP và tự đẩy lên MO Plus** mà không có bước review/action của điều phái trước khi tài liệu được phát hành cho phi công; phi công và chính điều phái **không phân biệt được đâu là bản OFP đã được chốt** và đâu là bản hệ thống tự sinh khi tải/dầu thay đổi (Khảo sát 11/06/2026 buổi sáng §II.1).
- Mốc upload OFP hiện hành: chuyến nội địa trước **60 phút**, chuyến quốc tế trước **90 phút** so với STD; các mốc 130/180/200/240/270 phút còn được nhắc tới cho các giai đoạn khác *(xem OID: SME-08)* (Khảo sát 11/06/2026 buổi sáng §II.1; Khảo sát 15/06/2026 §II.2).
- Khi cần quay về phiên bản OFP cũ (vì tổ quay đã đổi, dầu phải xả…), quy trình hiện hành buộc làm lại OFP trên Lido — phức tạp và tốn thời gian (Khảo sát 11/06/2026 buổi chiều §II.4).

**Về kiểm tra đầu ca của điều phái:**
- Điều phái viên đang phải **mở 5–7 ứng dụng/tab riêng** để hoàn tất kiểm tra đầu ca gồm 9 nhóm nội dung: lịch bay, loại tàu, tàu quay, cứu hỏa sân bay (RFFS), thời tiết, tải, MEL/CDL, hạn chế khai thác và chứng chỉ tổ bay (Khảo sát 11/06/2026 buổi sáng §II.4).
- NOTAM phải tra cứu thủ công trên trang quản lý của Tổng công ty Quản lý bay Việt Nam (VATM); không thể đọc và đánh giá tự động hàng trăm loại NOTAM mỗi ngày (Khảo sát 11/06/2026 buổi sáng §II.6).
- Bảng dầu (AHM) đang được quản lý ở phần mềm IFV; điều phái tra cứu thủ công, không tự cảnh báo khi bảng dầu thay đổi *(xem OID: SME-16)* (Khảo sát 11/06/2026 buổi sáng §II.9).
- Phép bay được nhập thủ công, chưa có phần mềm chuyên dụng; đội SkyCheck đang triển khai module phép bay nhưng vướng khâu input *(xem OID: KS-15)* (Khảo sát 11/06/2026 buổi sáng §II.11).
- Bảng đối chiếu tải/cân bằng giữa OFP (điều phái) và số liệu thực tế (CLC trên Lido) chưa được tự động cảnh báo khi vượt ngưỡng (Khảo sát 11/06/2026 buổi sáng §II.8).

**Về báo cáo điều hành và BCAO:**
- BCAO hiện được trợ lý trực ban trưởng soạn thủ công bằng tệp Word từ đầu ca trực, ghi nhận sự vụ dần theo thời gian, đóng tệp cuối ca và tạo tệp mới cho ngày tiếp theo; phát hành qua thư điện tử và phải được phê duyệt trước khi phát hành (Khảo sát 08/06/2026 §II.3; Khảo sát 09/06/2026 §II.7).
- Cùng một chỉ số đúng giờ nhưng các báo cáo khác nhau cho ra các con số khác nhau, không rõ con số nào đúng và không sửa được logic do hệ thống hiện tại bị giới hạn (Khảo sát 08/06/2026 §II.3).
- Mục tiêu (target) OTP/OSP chưa được hệ thống quản lý song song với giá trị thực tế (Khảo sát 09/06/2026 §II.8).

**Về danh mục và tàu bay:**
- Danh mục dịch vụ sân bay (ví dụ sân bay không hỗ trợ tàu hỏng APU) đang được quản lý thủ công, khó trích xuất và tổng hợp *(xem OID: KS-06)* (Khảo sát 09/06/2026 §II.7 và §IV.6).
- Quản lý tàu bay chỉ dựa trên trạng thái hiện hành, **chưa lưu lịch sử** hình thức sở hữu (sở hữu, Dry Lease, Wet Lease, biến thể Damp Lease), cấu hình ghế (reconfig) hay các thuộc tính kỹ thuật theo giai đoạn hiệu lực (Khảo sát 09/06/2026 §II.6).

**Về hạ tầng:**
- Cấp phát hạ tầng đám mây còn chậm; môi trường kiểm thử đã được dựng, có hai mốc ràng buộc: hạ tầng sẵn sàng trước **giữa tháng 06/2026** và thông kết nối trước **30/06/2026** (Khảo sát 08/06/2026 §II.6).

### 3.2 Vấn đề chính (Pain Points)

- **Dữ liệu khai thác phân tán, không hợp nhất**; ra quyết định hiệp đồng (CDM — Collaborative Decision Making) và nhận diện tình huống (Situational Awareness) gặp khó khăn (Đề xuất giải pháp kỹ thuật §I).
- **Báo cáo thiếu nhất quán**; tổng hợp thủ công gây tốn thời gian và rủi ro sai số (Khảo sát 08/06/2026 §II.3).
- **Thiếu cơ chế xác nhận "bản OFP chính thức"** giữa điều phái và phi công (Khảo sát 11/06/2026 buổi sáng §II.1).
- **Thiếu màn hình giám sát tập trung** cho điều phái viên và trực ban trưởng; phải tự đối chiếu nhiều ứng dụng (Khảo sát 11/06/2026 buổi sáng §II.4; Khảo sát 12/06/2026 buổi sáng §II.4).
- **Thiếu nguồn sự thật duy nhất (Single Source of Truth)** cho dữ liệu danh mục (tàu bay, sân bay, chặng bay, tổ bay…) (Khảo sát 09/06/2026 §II.1).
- **Không có cảnh báo tự động** cho các tình huống nghiệp vụ quan trọng: thay đổi tải vượt ngưỡng, lệch ZFW giữa OFP và CLC, NAIL/CDL ảnh hưởng chuyến đang chuẩn bị, NOTAM cứu hỏa (RFFS), thời tiết tiến gần ngưỡng tối thiểu (VMA), thay đổi tổ bay không đủ chứng chỉ theo sân bay đặc biệt… (Khảo sát 11/06/2026 buổi sáng §II.5–§II.13).

### 3.3 Cơ hội nghiệp vụ (Opportunities)

- **Số hóa toàn bộ chu trình điều hành khai thác** trong một nền tảng hội tụ; hợp nhất luồng dữ liệu từ lập kế hoạch → dispatch → giám sát thực hiện → đóng chuyến → báo cáo (Đề xuất giải pháp kỹ thuật §II tổng quan).
- **Bổ sung lớp giám sát — cảnh báo** tự động hóa các kiểm tra đầu ca, các thay đổi vượt ngưỡng OSP ±15 phút, NOTAM/thời tiết ảnh hưởng đến chuyến cụ thể, NAIL/CDL trong khoảng hiệu lực (Khảo sát 11/06/2026 buổi sáng §II.4 đến §II.13).
- **Tạo nguồn dữ liệu danh mục chuẩn hóa**, đồng bộ chủ động cho các hệ thống vệ tinh thông qua API/Webhook (Đề xuất giải pháp kỹ thuật §II.4; Khảo sát 09/06/2026 §II.1).
- **Cải tiến trải nghiệm vận hành**: màn Monitoring cập nhật gần thời gian thực (real-time) qua webhook/SSE, cảnh báo bằng màu (đỏ/vàng/xanh/không màu) gắn với mốc ACARS OOOI; bộ lọc/cột lưu theo profile cá nhân; giờ UTC + chuẩn 24h + ưu tiên dark mode (Khảo sát 11/06/2026 buổi chiều §II.6; Khảo sát 12/06/2026 buổi sáng §II.5, §II.6, §II.7).

---

## 4. Mục tiêu nghiệp vụ (Business Objectives)

| Mã | Mục tiêu | Chỉ số (KPI) | Chỉ tiêu định lượng | Nguồn |
|---|---|---|---|---|
| OBJ-001 | Thay thế hệ thống FMS hiện hành | Tỷ lệ phủ dữ liệu chuyển động chuyến bay (Movement) | Hiện ~90% → mục tiêu cụ thể *(xem OID: DEC-06)* | Khảo sát 08/06/2026 §II.4 |
| OBJ-002 | Nâng cao độ chính xác dữ liệu chuyển động chuyến bay | Tỷ lệ độ chính xác Movement | Hiện ~79% → mục tiêu cụ thể *(xem OID: DEC-06)* | Khảo sát 08/06/2026 §II.4 |
| OBJ-003 | Duy trì tỷ lệ đúng giờ (OTP) và hiệu quả thực hiện lịch khai thác (OSP) | OTP đi/đến và OSP đi/đến (4 nhóm KPI) | Mục tiêu được nêu ví dụ 80%; ngưỡng cảnh báo OSP ±15 phút áp dụng cả sớm và muộn; định nghĩa/công thức chi tiết 4 nhóm *(xem OID: KS-48)* | Khảo sát 09/06/2026 §II.8; Khảo sát 11/06/2026 buổi sáng §II.5 |
| OBJ-004 | Bảo đảm tính sẵn sàng dịch vụ điều hành 24/7/365 | SLA độ sẵn sàng | ≥ 99% (HA active-active / active-standby; chuyển đổi < 1h) | Đề xuất giải pháp kỹ thuật §I; YCKT TOSS-001…057 |
| OBJ-005 | Đáp ứng quy mô người dùng OCC | Số người dùng / số đồng thời | ≥ 4.000 người dùng, đồng thời 200 | YCKT TOSS-001…057 |
| OBJ-006 | Tuân thủ pháp lý dữ liệu | Mức tuân thủ | Tuân thủ tuyệt đối Nghị định 53/2022/NĐ-CP (lưu trữ dữ liệu tại Việt Nam) và Nghị định 13/2023/NĐ-CP (bảo vệ dữ liệu cá nhân) | Đề xuất giải pháp kỹ thuật §I; YCKT NFR |
| OBJ-007 | Vận hành liên tục theo cam kết hợp đồng | Thời hạn vận hành / bàn giao mã nguồn | 60 tháng kể từ go-live; bàn giao mã nguồn cho VNA sau khi hết thuê | YCKT TOSS-001…057 |
| OBJ-008 | Hợp nhất nguồn dữ liệu danh mục (Single Source of Truth) | Số hệ thống vệ tinh nhận dữ liệu danh mục từ TOSS | Mục tiêu cụ thể *(xem OID: DEC-06)* | Đề xuất giải pháp kỹ thuật §II.4; Khảo sát 09/06/2026 §II.1 |
| OBJ-009 | Giảm thời gian kiểm tra đầu ca của điều phái viên | Số ứng dụng/tab phải mở; thời gian hoàn tất kiểm tra đầu ca | Hiện 5–7 ứng dụng/tab → mục tiêu định lượng cụ thể *(xem OID: DEC-06)* | Khảo sát 11/06/2026 buổi sáng §II.4 |
| OBJ-010 | Số hóa Báo cáo Điều hành ngày Khai thác (BCAO) | Mức độ tự động hóa BCAO (tự sinh / nhập tay) | TOSS tự tổng hợp các chỉ số khả thi (số chuyến, tổ bay, khách, OTP, OSP); các bộ phận nhập tab nguồn riêng theo cấu trúc chuẩn; tỷ lệ tự sinh cụ thể *(xem OID: KS-07)* | Khảo sát 08/06/2026 §II.3; Khảo sát 09/06/2026 §II.7 |
| OBJ-011 | Thiết lập cơ chế Dispatch Release ↔ Captain's Release rõ ràng | Tỷ lệ chuyến có Dispatch Release trước Captain's Release; số lần Captain's Release sai thời điểm | TOSS gắn trạng thái "đã Dispatch Release" cho từng phiên bản OFP; MO Plus chặn Captain's Release khi chưa có Dispatch Release; mức cảnh báo cụ thể *(xem OID: KS-08)* | Khảo sát 11/06/2026 buổi sáng §II.1, §II.2 |
| OBJ-012 | Cung cấp màn giám sát chuyến bay tổng quan (Monitoring overview) cập nhật gần thời gian thực | Độ trễ refresh; số chuyến phục vụ song song | Cập nhật qua webhook/SSE thay vì refresh thủ công; chỉ refresh phần thay đổi; phục vụ lịch bay ~500–700 chuyến/ngày | Khảo sát 11/06/2026 buổi chiều §II.6; Khảo sát 12/06/2026 buổi sáng §II.4, §II.5, §II.8 |

> **Ghi chú:** Nhiều mục tiêu định lượng cụ thể (tỷ lệ phủ Movement mục tiêu, công thức 4 KPI OTP/OSP, thời gian hoàn tất kiểm tra đầu ca, RACI…) chưa được nguồn chốt; BA Lead/SME bổ sung qua các buổi khảo sát kế tiếp và cập nhật OID-TOSS-001 nhóm A (Quyết định BA Lead).

---

## 5. Phạm vi (Scope)

### 5.1 Trong phạm vi (In-scope)

1. **Phân hệ 1 — Thông tin điều hành chuyến bay** (Live Operations + Flight Dispatch): Màn Monitoring overview hợp nhất (kế hoạch / dự kiến / thực tế); cảnh báo thời gian thực theo chuyến; Flight Detail; cảnh báo NOTAM, thời tiết (METAR/SPECI/TSRA), lệch tải, MEL/CDL/NAIL, đổi tàu, đổi tổ bay, sân bay đặc biệt, Dispatch Release sát hạn; A-CDM 16 mốc; đa Carrier (VN, 0V, BL). → Chi tiết: [TOSS.FD.ALL.BRD.v0.8.md](FD-flight-dispatch/brd/TOSS.FD.ALL.BRD.v0.8.md). (Nguồn: Khảo sát 08–15/06/2026; FDOP §3.1–3.5; YCKT sheet-07 MENU + sheet-08 cảnh báo + sheet-09 FOS.)
2. **Phân hệ 2 — Quản lý tài liệu chuyến bay** (Flight Load Control + NOTOC/Manifest): OFP/NOTAM/WX/Briefing Package; cơ chế Dispatch Release / Unrelease và quản lý phiên bản OFP giữa TOSS — MO Plus — Lido; upload Weather Multi-Flight theo khoảng hiệu lực; backup khi Lido lỗi (download 3 định dạng PDF/TXT/HTML); cảnh báo "thiếu tài liệu" và "tổ bay chưa tải bản mới nhất"; STS/HEAD cho chuyến không thường lệ; NOTOC số hóa (mục tiêu cover được tình huống 2 NOTOC/chuyến tại Sài Gòn); Cargo Manifest; phiếu cân bằng tải. → Chi tiết: [TOSS.FLC.ALL.BRD.v0.8.md](FLC-flight-load-control/brd/TOSS.FLC.ALL.BRD.v0.8.md). (Nguồn: Khảo sát 09/06/2026 §II.3, §II.4; Khảo sát 11/06/2026 buổi sáng §II.1–§II.3; Khảo sát 11/06/2026 buổi chiều §II.1, §II.2, §II.4, §II.9, §II.13; Khảo sát 11/06/2026 KTKTB §6 (NOTOC).)
3. **Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác** (Report): BCAO số hóa theo cấu trúc chuẩn (tab tổng quan của trực ban trưởng + tab nhập của trực kỹ thuật, trực dịch vụ); quản lý mục tiêu (target) song song với giá trị thực tế cho 4 nhóm KPI OTP/OSP; báo cáo Pallet Relief + cột Payload Extra (delta = Actual − OFP); cơ chế "báo cáo nặng → tab kết quả + link tải 7 ngày"; nhận diện chuyến VIP/chuyên cơ qua nguồn ANABS hoặc tích chọn thủ công; danh mục nguyên nhân bất thường chuẩn hóa; Data Monitoring (giám sát tỷ lệ phủ và độ chính xác nguồn ACARS/Lido…). → Chi tiết: [TOSS.RPT.ALL.BRD.v0.5.md](RPT-report/brd/TOSS.RPT.ALL.BRD.v0.5.md). (Nguồn: Khảo sát 08/06/2026 §II.3; Khảo sát 09/06/2026 §II.7, §II.8, §II.11, §II.12; Khảo sát 11/06/2026 buổi chiều §II.10.)
4. **Phân hệ 4 — Quản lý danh mục (Master Data)** (Data Maintenance): Danh mục tàu bay (hợp nhất từ FIMS + Netline) kèm lịch sử theo giai đoạn hiệu lực — hình thức sở hữu (sở hữu, Dry Lease, Wet Lease, Damp Lease), cấu hình ghế, Fuel Tank Capacity, Cargo Capacity, dung lượng nước/dầu; danh mục sân bay (import từ LIDO Chart PDF, checkbox đủ tài liệu, Obstacle Data, EOSID); danh mục chặng bay; nhiều Category (Fleet Grouping) phục vụ báo cáo; hệ số quy đổi đơn vị nhiên liệu ACARS theo giai đoạn (đơn vị nội bộ là kilogram); Standard Taxi Time theo sân bay + giai đoạn hiệu lực; phép bay (quốc gia × loại tàu × đường bay × thời gian hiệu lực); chứng chỉ cơ trưởng theo sân bay đặc biệt (Điện Biên, Đồng Hới…); đồng bộ chủ động API/Webhook ra các hệ thống vệ tinh; phân quyền dữ liệu theo carrier/khu vực. → Chi tiết: [TOSS.DM.ALL.BRD.v0.6.md](DM-data-maintenance/brd/TOSS.DM.ALL.BRD.v0.6.md). (Nguồn: Khảo sát 09/06/2026 §II.6, §II.11, §II.15; Khảo sát 11/06/2026 buổi sáng §II.11, §II.12, §II.14; Khảo sát 11/06/2026 KTKTB §3, §5; Customer Docs Aircraft_FIMS + Aircraft_Netline; sheet-10 Aircraft YCKT.)
5. **Phân hệ 5 — Quản trị hệ thống** (System Admin + Data Source Monitoring): IAM/RBAC; MFA/2FA/SSO/LDAP; phân quyền hai lớp (chức năng + dữ liệu theo carrier/khu vực/role); switch view giữa nhiều role; sub-admin phân chia view theo nhiệm vụ; cấu hình cá nhân (cột hiển thị + bộ lọc + trạng thái gần nhất) lưu ở profile user; cấu hình Time window màn Monitoring (look-back + look-ahead); admin cấp quyền Dispatch Release theo từng user; cổng API Gateway và tích hợp với ~40 hệ thống; hạ tầng cloud (Prod / Dev-Test / Standby-Backup, định cỡ 18TB data, 311 vCPU, 27 VM); thông báo email cảnh báo OFP và báo cáo định kỳ; bot tài khoản đặt tên theo vai trò (ví dụ "Dispatch_Auto"); tuân thủ pháp lý. → Chi tiết: [TOSS.SA.ALL.BRD.v0.6.md](SA-system-admin/brd/TOSS.SA.ALL.BRD.v0.6.md). (Nguồn: Khảo sát 09/06/2026 §II.2, §II.5; Khảo sát 12/06/2026 buổi sáng §II.5, §II.6; Khảo sát 15/06/2026 §II.3; sheet-11 yêu cầu chung YCKT; sheet-08 cảnh báo & tham số.)
6. **Tích hợp với ~40 hệ thống/nguồn dữ liệu**: Lido (OFP/NOTAM/WX qua adapter — 3 định dạng PDF/TXT/HTML), MO Plus (Captain's Release, log tổ bay đã tải tài liệu), AMOS (MEL/CDL/NAIL, defect, AOG, techlog uplift FOB), Amadeus PSS, DCS, AVES (tổ bay), A-CDM (16 mốc tại HAN/TSN), VIAGS (parking stand), ACARS (OOOI + nhiên liệu), AFTN/AMHS (điện văn hàng không), Netline (Master tàu bay, leg history, Flight Number 3 cột Carrier + FN + suffix D/Z), FIMS (Master tàu bay), Flight Watch / Flight Status, DWH/Lakehouse, LDAP/AD, VATM (NOTAM nội địa), cơ quan khí tượng hàng không Việt Nam (METAR/SPECI nội địa), SkyOffice + VNA Library (thư viện tài liệu khai thác), IFV (bảng dầu — tích hợp giai đoạn sau)… Phương thức tích hợp cụ thể *(xem OID: KS-04, DL-05)*.
7. **Số hóa quy trình điều phái theo FDOP §3.1–§3.5**: 5 quy trình chính từ Quy trình Điều phái viên do VNA cung cấp (BP-001 đến BP-005, xem §8).
8. **Triển khai trên Cloud VNA**: 3 môi trường Prod / Dev-Test / Standby-Backup; mốc ràng buộc hạ tầng sẵn sàng giữa tháng 06/2026, thông kết nối trước 30/06/2026 *(xem OID: HC-02, KS-45)*.

### 5.2 Ngoài phạm vi (Out-of-scope)

1. **Lập kế hoạch bay (Flight Planning) tự động** — vẫn do Lido thực hiện; TOSS chỉ thu nạp OFP từ Lido, không thay thế chức năng tạo OFP (Khảo sát 11/06/2026 buổi sáng §II.1).
2. **Xác nhận tài liệu chuyến bay bởi phi công (Captain's Release / Confirm Release)** — vẫn diễn ra trên MO Plus; TOSS chỉ phát hành trạng thái "đã Dispatch Release" để MO Plus tiêu thụ và reset Confirm Release khi Unrelease (Khảo sát 11/06/2026 buổi sáng §II.2; Khảo sát 11/06/2026 buổi chiều §II.4).
3. **Hệ thống bảo dưỡng kỹ thuật (MEL/CDL, defect, AOG, NAIL)** — vẫn do AMOS quản lý; TOSS chỉ đồng bộ dữ liệu để hiển thị và cảnh báo (Khảo sát 11/06/2026 buổi sáng §II.10).
4. **Hệ thống đặt chỗ và bán vé (PSS — Passenger Service System)** — vẫn do Amadeus PSS quản lý; TOSS chỉ tiêu thụ dữ liệu hành khách (Khảo sát 08/06/2026 §II.13).
5. **Hệ thống làm thủ tục khách (DCS — Departure Control System)** — không thuộc TOSS; TOSS chỉ tiêu thụ dữ liệu khách thực tế (Khảo sát 08/06/2026 §II.13).
6. **Lưu trữ tài liệu dài hạn từ hệ thống ngoài** — tài liệu từ hệ thống ngoài (OFP, OSP từ MO Plus…) chỉ kéo về khi người dùng tải xuống và lưu tối đa **3 ngày sau khi chuyến bay hạ cánh** rồi tự động xóa; chỉ tài liệu do chính TOSS sinh ra (Loadsheet CDPM, NOTOC, BCAO…) mới lưu trong hệ thống (Khảo sát 09/06/2026 §II.4).
7. **Ký số phát hành báo cáo** — báo cáo phát hành qua thư điện tử, không yêu cầu ký số (Khảo sát 08/06/2026 §II.3).
8. **Quản lý tiêu chuẩn cấp cứu hỏa sân bay (RFFS) hiện hành** — không cần duy trì danh sách tiêu chuẩn RFFS hiện hành cho mục đích cảnh báo cơ bản; TOSS chỉ phát hiện NOTAM cứu hỏa là cảnh báo (Khảo sát 11/06/2026 buổi sáng §II.6).
9. **Cảnh báo Cost Index (CI)** — ngoài phạm vi giai đoạn này do Lido hiện chỉ trả một giá trị CI (Cruise) thay vì 3 CI (Climb/Cruise/Descend) mà nghiệp vụ VNA cần để đối chiếu đầy đủ; sẽ xem xét lại khi Lido hỗ trợ đủ 3 CI *(xem OID: KS-17)* (Khảo sát 11/06/2026 buổi sáng §II.15).
10. **Cảnh báo APU Time** — OFP của Lido không thể hiện APU time và điện báo tổ bay cũng không có thông tin này; TOSS chỉ cảnh báo PAX time và lịch PAX dựa trên dữ liệu có sẵn (Khảo sát 11/06/2026 buổi sáng §II.13).
11. **Bước ký A350 (Airbus FODM)** — vẫn giữ thủ công bằng FODM, KHÔNG tích hợp vào tool MEL mới (khách hàng đồng ý — Khảo sát 11/06/2026 KTKTB §1).
12. **Cơ chế đa phiên (Multi-session) tham chiếu từ hệ thống nước ngoài** — TOSS chưa quyết định triển khai trong giai đoạn này *(xem OID: KS-52)* (Khảo sát 09/06/2026 §II.13).
13. **Phân quyền dữ liệu nhỏ hơn cấp căn cứ bay / cấp carrier** — phân quyền chức năng cho thao tác và phân quyền dữ liệu theo carrier/căn cứ bay/khu vực; KHÔNG phân quyền theo chuyến cụ thể hay phòng ban nhỏ hơn căn cứ bay (Khảo sát 08/06/2026 §II.9; Khảo sát 09/06/2026 §II.2 và §II.5).

### 5.3 Các phạm vi cần làm rõ thêm

- Phương án khi Lido không cho phép tích hợp trực tiếp (boost) — ảnh hưởng MEL active và Performance Factor *(xem OID: KS-04, KS-13)*.
- Phạm vi tích hợp Dispatch Release ↔ Captain's Release giữa TOSS và MO Plus (giao diện trạng thái, thời điểm đồng bộ, cơ chế thông báo, fail-safe, reset Confirm Release khi Unrelease) *(xem OID: KS-08, KS-20)*.
- Phạm vi tích hợp A-CDM đợt đầu (ngoài HAN và TSN); sân bay ngoài phạm vi A-CDM dùng nguồn nào (Amadeus / Flight Status) *(xem OID: KS-39)*.
- Phạm vi xử lý phần nhiên liệu VNA tự cấp cho tàu thuê ướt kết hợp (Damp Lease) *(xem OID: SME-10)*.
- Phạm vi bài toán 2 NOTOC trên cùng chuyến bay nội địa tại Sài Gòn — phương án triển khai chính thức (gộp 2 form xuất file 2 trang vs gắn nhãn quốc tế/quốc nội vs part 1/part 2) *(xem OID liên quan; Khảo sát 11/06/2026 KTKTB §6)*.

---

## 6. Các bên liên quan (Stakeholders)

| Bên liên quan | Vai trò chính | Mức quan tâm | Mức ảnh hưởng | Kỳ vọng chính | Nguồn |
|---|---|---|---|---|---|
| Trực ban trưởng (OCC Duty Manager) | Giám sát trạng thái khai thác, khách nối chuyến; lập BCAO; phê duyệt báo cáo | Cao | Cao | Giám sát đồng thời nhiều chuyến; BCAO số hóa với cấu trúc chuẩn; tự sinh tối đa các chỉ số khả thi | Khảo sát 08/06/2026 §II.2; Khảo sát 09/06/2026 §II.7 |
| Điều phái viên (Dispatcher) | Lập/phát hành OFP; Dispatch Release / Unrelease; kiểm tra đầu ca; xử lý cảnh báo; xử lý Pallet Relief; backup khi Lido lỗi | Rất cao | Rất cao | Màn tập trung kiểm tra đầu ca; cảnh báo NOTAM/thời tiết/MEL/NAIL theo chuyến phụ trách; thao tác Dispatch Release rõ ràng; Monitoring overview real-time | Khảo sát 11/06/2026 buổi sáng §II.1, §II.4, §II.6, §II.7; Khảo sát 11/06/2026 buổi chiều §II.1, §II.4, §II.6; Khảo sát 12/06/2026 buổi sáng; Khảo sát 15/06/2026 |
| Cán bộ tài liệu chuyến bay | Theo dõi trạng thái tài liệu (đã được tổ bay xác nhận/tải xuống chưa) | Cao | Trung bình | Dashboard tài liệu riêng cho nhóm này; cảnh báo "tổ bay chưa tải tài liệu mới nhất" | Khảo sát 08/06/2026 §II.2; Khảo sát 11/06/2026 buổi chiều §II.1 |
| Phi công (PIC — Pilot-in-Command) / Tổ bay | Captain's Release; xác nhận tài liệu trên MO Plus | Cao | Cao | MO Plus chặn Captain's Release khi điều phái chưa Dispatch Release; hiển thị thông báo rõ ràng; reset Confirm Release khi TOSS Unrelease | Khảo sát 11/06/2026 buổi sáng §II.2; Khảo sát 11/06/2026 buổi chiều §II.4 |
| Phòng Kỹ thuật khai thác bay (KTKTB) — VNA | Soạn tài liệu MEL (Boeing+Airbus); tính W&B (DOW/DOI/DOCG); lập phương án đường bay (LIDO Chart); quản lý Obstacle Data + EOSID; quản lý Service Order | Cao | Cao | Một công cụ soạn MEL duy nhất hỗ trợ cả Boeing & Airbus + hiển thị compare version; tool W&B có template VNA 5–6 trang PDF; quét PDF LIDO Chart và CFP; đăng tải tài liệu 1 lần tại SkyOffice tự đẩy sang MO/MO Plus/VNA Library | Khảo sát 11/06/2026 KTKTB Buổi 2 + Buổi 3 |
| Khối kỹ thuật / Trực kỹ thuật | Cung cấp dữ liệu MEL/CDL, AOG, APU/PACK; nhập tab kỹ thuật trong BCAO | Trung bình | Cao | Tab nhập riêng trong BCAO; đồng bộ AMOS | Khảo sát 09/06/2026 §II.7; YCKT TOSS-122… |
| Đơn vị dịch vụ mặt đất (VIAGS) | Nhập tab dịch vụ trong BCAO; phục vụ mặt đất, turnaround; cấp parking stand qua API | Trung bình | Trung bình | Tab nhập riêng cho dịch vụ; API VIAGS làm nguồn dự phòng parking stand khi A-CDM thiếu | Khảo sát 09/06/2026 §II.7; Khảo sát 15/06/2026 §II.1 |
| Bộ phận tải & cân bằng (CLC — Control Load Center) | Nhập trọng tải ước tính → Final Weigh Manifest; phục vụ Loadsheet | Cao | Cao | TOSS so sánh OFP với số liệu thực tế CLC trên ZFW, payload, take-off weight; ngưỡng cảnh báo theo ma trận loại tàu × dải giờ bay × ngưỡng trên/dưới | Khảo sát 08/06/2026 §II.6; Khảo sát 11/06/2026 buổi sáng §II.8 |
| Phục vụ hàng hóa / phục vụ mặt đất (PVHH/PVMĐ) tại sân bay khởi hành | Lập NOTOC; submit NOTOC cho phi công | Cao | Cao | TOSS hỗ trợ NOTOC số hóa; cho phép tạo revision mới kể cả khi phi công đã confirm; xử lý được tình huống 2 NOTOC/chuyến tại Sài Gòn | Khảo sát 11/06/2026 KTKTB §6 (Webex NOTOC) |
| Đại diện sân bay | Lập phiếu cân bằng tải; điều phối nạp dầu | Trung bình | Trung bình | Tài khoản theo từng cá nhân; hệ thống tự lọc theo sân bay phụ trách | Khảo sát 08/06/2026 §II.6, §II.9 |
| Lãnh đạo Tổng công ty Hàng không Việt Nam | Phê duyệt BCAO; theo dõi KPI khai thác, an toàn, chi phí | Cao | Cao | Trang đầu BCAO + phần bất thường trực quan; báo cáo phải được phê duyệt trước phát hành | Khảo sát 09/06/2026 §II.7 |
| Cơ quan quản lý: Cục Hàng không Việt Nam (CAAV) | Phê chuẩn điều phái viên VIP hằng năm; quy chế khai thác | Trung bình | Cao | Tuân thủ AOC và quy định CAAV | FDOP §3.2, §3.3 |
| VTIT (đơn vị phát triển) | Triển khai TOSS; tích hợp; đào tạo | Cao | Cao | Khảo sát song song số liệu/nghiệp vụ; tổng quan trước, chi tiết sau | Khảo sát 08/06/2026 §II.1 |
| Khối Chuyển đổi số — Công nghệ (CĐS-CN) VNA | Cấp hạ tầng đám mây; phối hợp tích hợp; cung cấp dữ liệu DWH | Cao | Cao | Cấp hạ tầng đúng tiến độ; thông kết nối trước 30/06/2026 | Khảo sát 08/06/2026 §II.5; Khảo sát 11/06/2026 KTKTB §4 |
| VATM — Tổng công ty Quản lý bay Việt Nam | Cung cấp NOTAM nội địa | Trung bình | Trung bình | Cung cấp nguồn NOTAM chính thức (nội địa) để TOSS tích hợp | Khảo sát 11/06/2026 buổi sáng §II.6 |
| Cơ quan khí tượng hàng không Việt Nam | Cung cấp METAR/SPECI nội địa | Trung bình | Trung bình | Cung cấp nguồn thời tiết chính thức cho nội địa *(tên đơn vị cụ thể — xem OID: SME-04)* | Khảo sát 11/06/2026 buổi sáng §II.7 |
| Đối tác Lido | Adapter sinh OFP 3 định dạng PDF/TXT/HTML; nguồn bảng dầu, METAR quốc tế (gói Lido); push Standard Taxi Time | Cao | Cao | Phối hợp định nghĩa giao diện trạng thái; xử lý các giới hạn boost dữ liệu | Khảo sát 11/06/2026 buổi sáng §II.9, §II.14; Khảo sát 11/06/2026 buổi chiều §II.13 |
| Đối tác MO Plus | Tiêu thụ Dispatch Release; chặn Captain's Release; reset Confirm Release khi nhận revision mới; xử lý hiển thị file đa định dạng | Cao | Cao | Phối hợp điều chỉnh quy tắc "latest by name"; cơ chế notification trên app cho phi công | Khảo sát 11/06/2026 buổi sáng §II.2; Khảo sát 11/06/2026 buổi chiều §II.4, §II.9 |
| Đội SkyCheck (cùng tổng công ty) | Triển khai module phép bay | Trung bình | Trung bình | TOSS không phụ thuộc SkyCheck; tận dụng phân tích nghiệp vụ qua anh Hùng nếu sẵn có | Khảo sát 11/06/2026 buổi sáng §II.11 |
| Bên cho thuê tàu bay (lessor) | Cung cấp tàu Wet Lease / Dry Lease / Damp Lease | Trung bình | Trung bình | Quản lý đa hình thức sở hữu trong cùng nền tảng | Khảo sát 09/06/2026 §II.6 |

### 6.1 Ma trận RACI

*(xem OID: DEC-06 — chưa có nguồn ma trận RACI chính thức; BA Lead bổ sung sau khi xác nhận với các đầu mối CQĐV trên sheet "Nhân sự" của YCKT.)*

---

## 7. Yêu cầu nghiệp vụ theo phân hệ

> **Phạm vi mức:** Mỗi BR là một câu yêu cầu nghiệp vụ tổng quát; KHÔNG bóc xuống chức năng cụ thể, trường dữ liệu hay use case. Việc phân rã chi tiết tới Yêu cầu chức năng (FR), Trường hợp sử dụng (UC), Câu chuyện người dùng (US) thực hiện ở các tài liệu SRS/FRD kế tiếp.
>
> **Quy ước MoSCoW:** Must = bắt buộc, Should = nên có, Could = có thể có, Won't = không trong phạm vi đợt này.
>
> Danh sách BR chi tiết được tách thành **5 file BRD-TOSS-PHn** theo phân hệ:

| Phân hệ | File BR chi tiết | Số BR | Dải mã |
|---|---|---|---|
| Phân hệ 1 — Thông tin điều hành chuyến bay | [TOSS.FD.ALL.BRD.v0.8.md](FD-flight-dispatch/brd/TOSS.FD.ALL.BRD.v0.8.md) | 75 | BR-101…192 |
| Phân hệ 2 — Quản lý tài liệu chuyến bay | [TOSS.FLC.ALL.BRD.v0.8.md](FLC-flight-load-control/brd/TOSS.FLC.ALL.BRD.v0.8.md) | 59 | BR-201…261 |
| Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác | [TOSS.RPT.ALL.BRD.v0.5.md](RPT-report/brd/TOSS.RPT.ALL.BRD.v0.5.md) | 66 | BR-301…366 |
| Phân hệ 4 — Quản lý danh mục (Master Data) | [TOSS.DM.ALL.BRD.v0.6.md](DM-data-maintenance/brd/TOSS.DM.ALL.BRD.v0.6.md) | 69 | BR-401…469 |
| Phân hệ 5 — Quản trị hệ thống (IAM/RBAC, Tích hợp, Hạ tầng) | [TOSS.SA.ALL.BRD.v0.6.md](SA-system-admin/brd/TOSS.SA.ALL.BRD.v0.6.md) | 68 | BR-501…555 + BR-528a…h + BR-530a…g |

### 7.6 Tổng kết số lượng BR theo phân hệ

| Phân hệ | Số BR | Ghi chú |
|---|---|---|
| Phân hệ 1 — Thông tin điều hành chuyến bay | 75 | v0.7: G1 hạ ưu tiên 7 BR (BR-127 Must→Could; BR-149/166/167/176/181/192 Must→Should); G3 M5/M6 + G5 bổ sung tham chiếu kế thừa PH5; G8 đồng bộ parent v0.10. |
| Phân hệ 2 — Quản lý tài liệu chuyến bay | 59 | v0.6: G1 hạ ưu tiên BR-215, BR-234 Must→Should; G3 M1/M7/m5 thêm tham chiếu PH4 và PH5; G6 xóa BR-256 placeholder theo OID BA-04 (60→59). |
| Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác | 66 | v0.5: G1 hạ ưu tiên BR-308, BR-336 Must→Should; G3+G5 thêm tham chiếu PH5 BR-507/531/537 cho BR-308/309/310. |
| Phân hệ 4 — Quản lý danh mục (Master Data) | 69 | v0.5: G3 m7 BR-465 thêm tham chiếu PH5 BR-537; G8 đồng bộ parent v0.10. |
| Phân hệ 5 — Quản trị hệ thống | 68 | v0.5: G8 sửa parent reference; PH5 = kênh tích hợp (BR-528a…h + BR-530a…g atomic). |
| **Tổng** | **337** | 75+59+66+69+68 |

---

## 8. Quy trình nghiệp vụ (Business Process)

> **Phạm vi mức:** Chỉ liệt kê tên các quy trình chính đã có nguồn cùng một dòng mô tả ngắn. KHÔNG vẽ BPMN chi tiết ở khung này; chi tiết hóa BPMN As-Is / To-Be sẽ thực hiện ở các tài liệu phân tích quy trình theo Workflow P4.

| Mã | Tên quy trình | Mô tả ngắn | Nguồn | Phân hệ | To-Be model |
|---|---|---|---|---|---|
| BP-001 | Quy trình điều phái end-to-end (End-to-end Flight Dispatch) | Luồng đầu-cuối từ chuẩn bị kế hoạch bay và đánh giá rủi ro tới phát hành OFP, dispatch, theo dõi thực hiện và đóng chuyến. | FDOP §3.1 | Xuyên suốt (PH1+PH2+PH5) | PH1: `TOBE-PH1-OCC-DISPATCH-v0.1.md` · PH2: `TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` *(đang tạo)* · PH5: `TOBE-PH5-quan-tri-he-thong-v0.1.md` *(đang tạo)* |
| BP-002 | Vai trò điều phái viên theo ca trực (Duty-based Dispatcher Roles) | Phân vai chức danh điều phái viên (FD — Flight Dispatcher) theo ca trực 24/7 tại OCC; tuân thủ quy định CAAV/AOC. | FDOP §3.2 | Xuyên suốt (PH1+PH5) | PH1: `TOBE-PH1-OCC-DISPATCH-v0.1.md` · PH5: `TOBE-PH5-quan-tri-he-thong-v0.1.md` *(đang tạo)* |
| BP-003 | Quy trình chuyến bay VIP (VIP Flight Procedure) | Áp dụng cho chuyến VIP với nhân viên điều phái được CAAV phê chuẩn hằng năm; phân vai giám sát chuyên trách cho chuyến dài (≥ 8 giờ) hoặc phức tạp về khai thác. | FDOP §3.3 | Xuyên suốt (PH1+PH5) | PH1: `TOBE-PH1-OCC-DISPATCH-v0.1.md` · PH5: `TOBE-PH5-quan-tri-he-thong-v0.1.md` *(đang tạo)* |
| BP-004 | Quy trình chuyến bay qua vùng trời không kiểm soát (Uncontrolled Airspace Flights) | Áp dụng cho chuyến qua vùng trời không kiểm soát (ví dụ Afghanistan); quy định bổ sung về waypoint, callsign, hoạt động bay. | FDOP §3.4 | Xuyên suốt (PH1) | `TOBE-PH1-OCC-DISPATCH-v0.1.md` |
| BP-005 | Quy trình nhận tàu bay (Aircraft Delivery Procedure) | Tiếp nhận tàu bay mới hoặc tàu được chuyển từ nguồn khác; bao gồm chuyến Ferry, payload, DOW, OFP, briefing. | FDOP §3.5 | PH4 (nhận tàu → master data) + PH1 | PH4: `TOBE-PH4-quan-ly-danh-muc-v0.1.md` *(đang tạo)* · PH1: `TOBE-PH1-OCC-DISPATCH-v0.1.md` |
| BP-006 | Quy trình Dispatch Release → Captain's Release | Điều phái thực hiện Dispatch Release trên TOSS → trạng thái đồng bộ sang MO Plus → phi công mới được thực hiện Captain's Release; chặn Captain's Release khi chưa có Dispatch Release. | Khảo sát 11/06/2026 buổi sáng §II.1, §II.2 | PH1 + PH2 | PH1: `TOBE-PH1-OCC-DISPATCH-v0.1.md` · PH2: `TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` *(đang tạo)* |
| BP-007 | Quy trình Unrelease và quay về phiên bản OFP cũ | Điều phái bấm Unrelease trên TOSS → TOSS lấy phiên bản OFP cũ được chọn từ danh sách OFP của MO Plus → sinh revision mới mang dữ liệu cũ → đẩy sang MO Plus; reset Confirm Release của phi công; điều phái phải Dispatch Release lại bản mới để chính thức; toàn bộ xử lý trên TOSS, không thao tác Lido. | Khảo sát 11/06/2026 buổi chiều §II.4 | PH2 + PH5 | PH2: `TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` *(đang tạo)* · PH5: `TOBE-PH5-quan-tri-he-thong-v0.1.md` *(đang tạo)* |
| BP-008 | Quy trình 6 giai đoạn của module Dispatch trên TOSS | (1) Chuẩn bị đầu ca → (2) Chuẩn bị OFP → (3) Post-Release Transition (TOSS quét cảnh báo, Lido cập nhật OFP mới) → (4) Theo dõi chuẩn bị khởi hành → (5) Theo dõi trong khi bay → (6) Sau chuyến bay & bàn giao ca. | Khảo sát 11/06/2026 buổi chiều §II.3, §II.5, §II.6, §II.7 | PH1 + PH2 | PH1: `TOBE-PH1-OCC-DISPATCH-v0.1.md` · PH2: `TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` *(đang tạo)* |
| BP-009 | Quy trình kiểm tra đầu ca (Start-of-Shift Check) | Điều phái kiểm tra 9 nhóm nội dung đầu ca trên màn hình tập trung; TOSS tự đối chiếu nguồn và sinh cảnh báo; điều phái sang hệ thống chuyên dụng để xử lý cảnh báo. | Khảo sát 11/06/2026 buổi sáng §II.4 | PH1 | `TOBE-PH1-OCC-DISPATCH-v0.1.md` |
| BP-010 | Quy trình lập và phát hành BCAO | Các bộ phận nghiệp vụ nhập tab nguồn của mình (kỹ thuật / dịch vụ); trực ban trưởng tổng hợp tab tổng quan; phê duyệt; phát hành qua email đến danh sách đầu mối. | Khảo sát 08/06/2026 §II.3; Khảo sát 09/06/2026 §II.7 | PH3 | `TOBE-PH3-bao-cao-toi-uu-v0.1.md` *(đang tạo)* |
| BP-011 | Quy trình quản lý tải hàng loạt tài liệu chuyến (Bulk Document Upload) + Weather Multi-Flight | Khu vực tải hàng loạt riêng; hệ thống tự gắn tài liệu vào đúng chuyến theo quy ước đặt tên tệp; vẫn giữ tải thủ công. Weather Multi-Flight: chọn khoảng thời gian hiệu lực → tự gắn vào toàn bộ chuyến nằm trong khoảng (mặc định ~3 tiếng). | Khảo sát 09/06/2026 §II.3; Khảo sát 11/06/2026 buổi chiều §II.9 | PH2 | `TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` *(đang tạo)* |
| BP-012 | Quy trình quản lý vòng đời tài liệu chuyến (Document Lifecycle) | Tài liệu do TOSS sinh ra lưu trong hệ thống; tài liệu từ hệ thống ngoài kéo về khi tải xuống, lưu tối đa 3 ngày sau hạ cánh rồi tự xóa. | Khảo sát 09/06/2026 §II.4 | PH2 | `TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` *(đang tạo)* |
| BP-013 | Quy trình lập phiếu cân bằng tải (Load Balance) — 4 bước | (1) CLC nhập trọng tải ước tính → (2) Điều phái lập OFP từ thông tin bước 1 + Lido → (3) OFP lên MO Plus, phi công Fly Release → (4a) Đại diện sân bay lập phiếu cân bằng từ Fly Release / (4b) Điều phối nạp dầu từ Fuel Order. | Khảo sát 08/06/2026 §II.6 | PH2 | `TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` *(đang tạo)* |
| BP-014 | Quy trình NOTOC số hóa (Notification to Captain) | Bóc tách điện FM từ Cita/email → đẩy PDF lên trang phim cargo → submit lên MO Plus → phi công confirm; cho phép tạo revision mới kể cả khi phi công đã confirm; phương án 2 NOTOC/chuyến tại Sài Gòn (đang đề xuất 3 phương án — chưa chốt). | Khảo sát 11/06/2026 KTKTB §6 (Webex NOTOC) | PH2 | `TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` *(đang tạo)* |
| BP-015 | Quy trình backup khi Lido lỗi | TOSS cung cấp link download file raw 3 định dạng (PDF/TXT/HTML) của chuyến tương tự ngày trước làm template → điều phái sửa tay các trường cần thiết (giờ, Brady, dầu mỡ, ADC) → upload lại lên TOSS → TOSS đẩy đủ 3 định dạng lên MO Plus theo luật bốc tách. | Khảo sát 11/06/2026 buổi chiều §II.13 | PH2 | `TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` *(đang tạo)* |

> **Ghi chú:** BP-006…BP-015 là quy trình phân hệ-cụ thể, được giữ tại đây để tra cứu tổng thể; mô tả chi tiết và BPMN As-Is/To-Be sẽ thuộc tài liệu phân tích quy trình của PHn tương ứng. Các quy trình chuyên đề khác (vd vòng đời người dùng IAM, đồng bộ danh mục qua Webhook, tích hợp ACARS/AFTN/AMHS, Service Order tự động từ email LIDO, lập phương án đường bay từ LIDO Chart…) sẽ được khảo sát chuyên đề theo TASK trong YCKT.

---

## 9. Giả định & Ràng buộc (Assumptions & Constraints)

### 9.1 Giả định nghiệp vụ (Business Assumptions)

- Hãng (VNA) vừa **sở hữu vừa đi thuê** tàu bay (lessee); TOSS hỗ trợ cả hai nguồn tàu bay với 3 hình thức chính (sở hữu, Dry Lease, Wet Lease) và biến thể **Damp Lease** *(xem OID: SME-10)* (Khảo sát 09/06/2026 §II.6).
- **Lido tiếp tục giữ vai trò sinh OFP tự động** và đẩy lên MO Plus; TOSS chỉ bổ sung trạng thái "đã Dispatch Release" và quản lý phiên bản OFP do TOSS gán (Lido chỉ có số OFP, không có khái niệm version) (Khảo sát 11/06/2026 buổi sáng §II.1; Khảo sát 11/06/2026 buổi chiều §II.4).
- **Phi công và điều phái không thao tác Lido** trong tình huống quay lui phiên bản OFP — toàn bộ xử lý qua TOSS (Khảo sát 11/06/2026 buổi chiều §II.4).
- **Báo cáo BCAO phát hành qua email và không yêu cầu ký số** (Khảo sát 08/06/2026 §II.3).
- Việc phỏng vấn các đơn vị (CQĐV) cần **công văn đề nghị và thông báo trước khoảng một tuần** (Khảo sát 08/06/2026 §II.1).
- **Các chuẩn quốc tế (ICAO, IATA, FAA) chỉ tham khảo và giải thích khi cần**; deliverable bám sát yêu cầu thực tế của hãng VNA (Khảo sát 09/06/2026 §II.10).
- **TOSS không lưu trực tiếp các tệp do hệ ngoài sinh ra**, chỉ kéo về để hiển thị khi cần và tuân thủ hạn lưu 3 ngày sau khi chuyến bay hạ cánh; **chỉ lưu các trường dữ liệu thực sự cần dùng** để tránh phình bộ nhớ (Khảo sát 09/06/2026 §II.4; Khảo sát 08/06/2026 §II.11).
- **Phân quyền theo chức năng cho thao tác** và **phân quyền theo carrier/căn cứ bay cho dữ liệu chuyến bay** — KHÔNG phân quyền theo chuyến cụ thể hay phòng ban nhỏ hơn căn cứ bay (Khảo sát 08/06/2026 §II.9; Khảo sát 09/06/2026 §II.2).
- **Standard Taxi Time bình thường ít thay đổi**, chỉ thay đổi trong kỳ cao điểm (Tết, dịp đặc biệt); cần được monitor và thông báo *(xem OID: SME-15, KS-16)* (Khảo sát 11/06/2026 buổi sáng §II.14).
- **Bảng dầu (AHM) sẽ tích hợp dài hạn với IFV** khi sẵn sàng; giai đoạn đầu cho điều phái khai báo thủ công và TOSS cảnh báo khi thay đổi (Khảo sát 11/06/2026 buổi sáng §II.9).
- **Cộng dồn hiệu ứng dây chuyền A-CDM**: khi chuyến trước bị trễ, tất cả mốc thời gian của chuyến sau bị dịch lùi cộng dồn (Khảo sát 15/06/2026 §II.1).

### 9.2 Ràng buộc kỹ thuật & UI/UX (Constraints)

- **Ngôn ngữ giao diện 100% tiếng Anh** (không dùng tiếng Việt), giờ **UTC**, định dạng **24 giờ**, ưu tiên **dark mode** trong giai đoạn đầu (Khảo sát 12/06/2026 buổi sáng §II.6).
- **Bộ mã màu cảnh báo 4 trạng thái** áp dụng thống nhất mọi cột trên màn Monitoring: Đỏ (cần action ngay), Vàng (cần lưu ý), Xanh (đã xử lý — chỉ xuất hiện sau khi đã có Đỏ), Không màu (bình thường). Tổng số màu giới hạn 4–5 (Khảo sát 12/06/2026 buổi sáng §II.7).
- **Cell-level coloring** thay vì bo box hay chỉ đổi màu chữ; ký hiệu trạng thái đơn giản (Khảo sát 12/06/2026 buổi sáng §II.4).
- **Refresh real-time** qua webhook hoặc cơ chế tương đương; chỉ refresh phần dữ liệu thay đổi, không reload toàn trang; KHÔNG dùng nút refresh thủ công (Khảo sát 11/06/2026 buổi chiều §II.6; Khảo sát 12/06/2026 buổi sáng §II.8).
- **Quy ước Phase Trigger cảnh báo gắn với mốc ACARS OOOI riêng cho mỗi loại** (cảnh báo loại A tắt khi OFF, B tắt khi ON, C tắt khi IN) (Khảo sát 11/06/2026 buổi chiều §II.6).
- **Time window cấu hình được** gồm look-back và look-ahead (look-ahead ≥ 240 phút để bao phủ mốc upload OFP quốc tế); admin set mặc định, user override và lưu vào profile cá nhân (Khảo sát 12/06/2026 buổi sáng §II.8).
- **Lưu cấu hình cá nhân (cột hiển thị + bộ lọc + trạng thái gần nhất) ở profile user** thay vì theo máy (Khảo sát 09/06/2026 §II.2; Khảo sát 12/06/2026 buổi sáng §II.5).
- **Cấu hình mặc định nhập liệu chữ hoa** cho tất cả tìm kiếm/filter/nhập liệu (sheet-11 yêu cầu chung YCKT #2).
- **Không có dropdown box load thêm gây quay chờ** (sheet-11 yêu cầu chung YCKT #3).
- **Cho phép điều chỉnh độ rộng cột trên web** và giữ độ rộng khi refresh (sheet-11 yêu cầu chung YCKT #14).
- **Hiển thị bảng nhỏ dạng tile** (title bên trái — value bên phải) cho dễ quan sát (sheet-11 yêu cầu chung YCKT #7).
- **Phiên bản web mobile chạy được trên cả điện thoại và iPad** (sheet-11 yêu cầu chung YCKT #9).
- **Migrate hoàn toàn dữ liệu Netline hiện hành** (sheet-11 yêu cầu chung YCKT #5).
- **Cơ chế đồng bộ TEST ↔ PROD** cho phép TEST lấy dữ liệu PROD (sheet-11 yêu cầu chung YCKT #1).
- **Logic tính toán nhiên liệu chuẩn**: Actual Remaining Fuel ưu tiên ACARS ON FUEL → QAR ON FUEL; Actual Trip Fuel = ACARS OFF FUEL − ACARS ON FUEL (hoặc QAR); Standard OFP Remaining Fuel = Cont Fuel + Dest Alt Fuel + Final Reserve; Techlog uplift FOB lấy từ AMOS (remaining after uplift) (sheet-12 logic tính toán YCKT).

### 9.3 Điểm cần xác nhận

> Toàn bộ điểm cần xác nhận (cờ `[cần xác nhận]` trước đây) được hợp nhất về sổ cái duy nhất **OID-TOSS-001** (`ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md`). Trong BRD này không giữ danh sách cờ song song. Mỗi BR có điểm chưa rõ đều có chú thích trỏ về OID dưới dạng `*(xem OID: <mã>)*` ngay trong file BRD-TOSS-PHn tương ứng. Tại thời điểm phát hành v0.11, OID có **112 điểm** (105 Mở / 5 Đang xử lý / 1 Đã chốt, đã bổ sung SME-44 vào v0.13) phân theo 5 nhóm A–E.

---

## 10. Tài liệu nguồn (References)

### 10.1 Báo cáo khảo sát (Discovery — 08/06 đến 15/06/2026)

| # | Tài liệu | Đường dẫn |
|---|---|---|
| 1 | Báo cáo Khảo sát TOSS — 08/06/2026 (Tổng quan, lộ trình, tích hợp dữ liệu, hai nhóm giám sát, BCAO, MEL/CDL/Performance Factor, khách nối chuyến Amadeus) | `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.2.md` |
| 2 | Báo cáo Khảo sát TOSS — 09/06/2026 (Cây menu, phân quyền 2 lớp, Flight Load Control, lưu trữ tài liệu, Station Manager, quản lý tàu bay & lịch sử thuộc tính, BCAO, OTP/OSP target, Category, Data Monitoring) | `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-09062026-v0.3.md` |
| 3a | Báo cáo Khảo sát TOSS — 11/06/2026 buổi sáng (Dispatcher: OFP/Dispatch Release, Captain's Release, kiểm tra đầu ca, cảnh báo lịch bay, NOTAM, thời tiết, lệch tải, AHM, NAIL/CDL, phép bay, chứng chỉ tổ bay, taxi time, Cost Index) | `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md` |
| 3b | Báo cáo Khảo sát TOSS — 11/06/2026 buổi chiều (Dispatcher: cảnh báo bổ sung, STS/HEAD, 6 giai đoạn Dispatch, Release/Unrelease & phiên bản OFP, Monitoring real-time, Weather Multi-Flight, Payload Extra/Pallet Relief, sửa OFP, backup Lido) | `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-chieu-v0.1.md` |
| 3c | Báo cáo Khảo sát TOSS — 11/06/2026 KTKTB (MEL Boeing FrameMaker+IXP + Airbus FODM, W&B DOW/DOI/DOCG, Lập phương án đường bay LIDO Chart, Thư viện khai thác SkyOffice/MO/VNA Library, Service Order, Obstacle Data + EOSID, Demo Webex NOTOC — bài toán 2 NOTOC/chuyến tại Sài Gòn) | `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md` |
| 3d | Báo cáo Khảo sát TOSS — 12/06/2026 buổi sáng (Flight Detail tab mới + tab phụ, cấu trúc Flight Number Netline 3 cột, thiết kế Monitoring trên POC, phân quyền view, UI conventions tiếng Anh/UTC/24h/dark mode, Color Scheme 4 trạng thái, Time Window, cột REG/DR/FN/ETA, history timeline) | `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md` |
| 3e | Báo cáo Khảo sát TOSS — 15/06/2026 (Tích hợp A-CDM 16 mốc, parking stand VIAGS, ITT, OFP Release + ngưỡng phút 210/75/60 nội địa và 270/90/75 quốc tế, Un-Release, PIC Confirm, phân quyền release, email cảnh báo từ tháng 7, lịch sử phiên bản OFP + xóa hàng loạt) | `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-15062026-v0.1.md` |

### 10.2 Yêu cầu kỹ thuật (YCKT-VTIT, Google Sheet 12 sheet)

| # | Sheet | Đường dẫn |
|---|---|---|
| 4a | INDEX 12 sheet | `ba/workspace/drafts/phan-tich/03-yckt/INDEX.md` |
| 4b | Sheet 04 — YCKT V3 (danh sách 478 dòng yêu cầu chi tiết) | `ba/workspace/drafts/phan-tich/03-yckt/sheet-04-yckt-v3.md` |
| 4c | Sheet 07 — MENU (cây menu 9 nhóm: Live Operations / Flight Dispatch / Flight Load Control / Station Manager / NOTOC-Manifest / Report / Data Maintenance / Data Source Monitoring / System Admin) | `ba/workspace/drafts/phan-tich/03-yckt/sheet-07-menu.md` |
| 4d | Sheet 08 — Cảnh báo & Tham số (27 mục) | `ba/workspace/drafts/phan-tich/03-yckt/sheet-08-cảnh-báo-tham-số.md` |
| 4e | Sheet 09 — FOS Report (178 trường) | `ba/workspace/drafts/phan-tich/03-yckt/sheet-09-fos.md` |
| 4f | Sheet 10 — Aircraft | `ba/workspace/drafts/phan-tich/03-yckt/sheet-10-aircraft.md` |
| 4g | Sheet 11 — Yêu cầu chung (14 dòng — UI/UX, đồng bộ TEST↔PROD, web mobile…) | `ba/workspace/drafts/phan-tich/03-yckt/sheet-11-yêu-cầu-chung.md` |
| 4h | Sheet 12 — Logic tính toán nhiên liệu | `ba/workspace/drafts/phan-tich/03-yckt/sheet-12-logic-tính-toán.md` |
| 4i | Sheet 05 — DSP, Sheet 06 — Tích hợp 42 dòng, Sheet 03 — Nhân sự, Sheet 02 — Lịch khảo sát, Sheet 01 — TASK | (xem INDEX) |

### 10.3 Tài liệu nguồn Customer Docs đã extract

| # | Tài liệu | Đường dẫn |
|---|---|---|
| 5 | Quy trình Điều phái viên FDOP (đầy đủ) — Procedure | `ba/workspace/drafts/phan-tich/01-nguon/main-flight-dispatcher-operating-procedure.md` |
| 6 | FDOP §3.1 — Luồng quy trình đầu-cuối | `ba/workspace/drafts/phan-tich/04-quy-trinh/3.1-end-to-end-process-flow-vi.md` |
| 7 | FDOP §3.2 — Vai trò điều phái viên theo ca trực | `ba/workspace/drafts/phan-tich/04-quy-trinh/3.2-duty-based-dispatcher-roles-vi.md` |
| 8 | FDOP §3.3 — Quy trình chuyến bay VIP | `ba/workspace/drafts/phan-tich/04-quy-trinh/3.3-vip-flight-procedure-vi.md` |
| 9 | FDOP §3.4 — Quy trình chuyến bay qua vùng trời không kiểm soát | `ba/workspace/drafts/phan-tich/04-quy-trinh/3.4-uncontrolled-airspace-flights-vi.md` |
| 10 | FDOP §3.5 — Quy trình nhận tàu bay | `ba/workspace/drafts/phan-tich/04-quy-trinh/3.5-aircraft-delivery-procedure-vi.md` |
| 11 | VNA-TOSS Function list v1.0 (3 tab: Tổng Quan / Function list / Màn hình Flight Dispatch) | `ba/workspace/drafts/phan-tich/01-nguon/VNA-TOSS-Function-list-v1.0.extracted.md` |
| 12 | TOSS — Total Operations Steering System v0.1 (xlsx, gồm tab "giải thích thuật ngữ") | `ba/workspace/drafts/phan-tich/01-nguon/TOSS-Total-Operations-Steering-System-v0.1.extracted.md` |
| 13 | Master tàu bay nguồn Netline (39 cột, 697 dòng) | `ba/workspace/drafts/phan-tich/01-nguon/Aircraft_Netline.extracted.md` |
| 14 | Master tàu bay nguồn FIMS (21 cột, 146 dòng) | `ba/workspace/drafts/phan-tich/01-nguon/Aircraft_FIMS.extracted.md` |
| 15 | Báo cáo Điều hành ngày Khai thác (BCAO) 10–11/Jun (docx mẫu) | `ba/workspace/drafts/phan-tich/01-nguon/BCAO_10Jun2025_11Jun2025-v2.extracted.md` |
| 16 | Sizing hạ tầng (xlsx) — căn cứ BR-516 | `ba/workspace/drafts/phan-tich/01-nguon/Sizing-update-260609-4T.extracted.md` |
| 17 | Diversion Report HVN678 KUL→SGN 11/06/2026 (bằng chứng cảnh báo Divert) | `ba/workspace/drafts/phan-tich/01-nguon/DIVERSION_REPORT-HVN678-KULSGN-11JUN2026.extracted.md` |
| 18 | Tổng hợp điện ACARS cần phân tích (xlsx) | `ba/workspace/drafts/phan-tich/01-nguon/tong-hop-dien-acars.extracted.md` |
| 19 | Khảo sát buổi 2 — Phòng KTKTB: MEL Boeing FrameMaker+IXP + Airbus FODM, W&B | `ba/workspace/drafts/phan-tich/01-nguon/VNA-KTKTB-Buoi2.extracted.md` |
| 20 | Khảo sát buổi 3 — Phòng KTKTB: Lập phương án đường bay LIDO, Thư viện khai thác SkyOffice | `ba/workspace/drafts/phan-tich/01-nguon/VNA-KTKTB-Buoi3.extracted.md` |
| 21 | Kế hoạch khảo sát 4 tuần / 20 ngày (xlsx) — module M1–M10, mốc freeze Batch 1–3, giả định A1–A6 | `ba/workspace/drafts/phan-tich/01-nguon/Ke-hoach-khao-sat-TOSS.extracted.md` |
| 22 | INDEX nguồn Customer Docs | `ba/workspace/drafts/phan-tich/01-nguon/INDEX.md` |

### 10.4 Đề xuất giải pháp kỹ thuật (Phân rã decomposed)

| # | Tài liệu | Đường dẫn |
|---|---|---|
| 23 | §I — Tổng quan giải pháp | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/01-tong-quan-giai-phap/01-tong-quan-giai-phap.md` |
| 24 | §II tổng quan nghiệp vụ | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/00-tong-quan-nghiep-vu.md` |
| 25 | §II.1 PH1 Thông tin điều hành chuyến bay | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/01-phan-he-thong-tin-dieu-hanh-chuyen-bay.md` |
| 26 | §II.2 PH2 Quản lý tài liệu chuyến bay | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/02-phan-he-quan-ly-tai-lieu-chuyen-bay.md` |
| 27 | §II.3 PH3 Quản lý báo cáo | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/03-phan-he-quan-ly-bao-cao-danh-gia-toi-uu-khai-thac.md` |
| 28 | §II.4 PH4 Quản lý danh mục | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/04-phan-he-quan-ly-danh-muc.md` |
| 29 | §II.5 PH5 Quản trị hệ thống | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/05-phan-he-quan-tri-he-thong.md` |

### 10.5 Tài liệu tham chiếu nội bộ BA

| # | Tài liệu | Đường dẫn |
|---|---|---|
| 30 | Sổ theo dõi Điểm cần chốt OID-TOSS-001 | `ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md` |
| 31 | Từ điển Thuật ngữ TOSS (Glossary v0.13) | `ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md` |
| 32 | Nhật ký version tài liệu BA | `ba/workspace/drafts/quy-trinh/BA-VERSION-LOG.md` |
| 33 | Phân tách phạm vi + workflow | `ba/workspace/drafts/quy-trinh/PHAN-TACH-PHAM-VI-WORKFLOW-v0.4.md` |

---

*BRD-TOSS-001-khung v0.11 — 2026-06-17. v0.11: đồng bộ link PHn mới nhất (v0.7/v0.6/v0.5/v0.5/v0.5); tổng BR 338→337 (PH2 xóa BR-256); G1/G3/G5/G6/G8 từ VALIDATION Agent 3 đã thực hiện. OID-TOSS-001 hiện 112 điểm. Mọi điểm cần xác nhận trỏ về OID-TOSS-001. Lịch sử version: xem `BA-VERSION-LOG.md`.*
