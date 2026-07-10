---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_THƯ_KÝ}}"
version: "{{PHIÊN_BẢN}}"
date: "{{NGÀY_HỌP}}"
status: "{{Draft | Final}}"
document_type: "Meeting Minutes"
---

# Biên bản họp (Meeting Minutes) — MM-{{YYYYMMDD-NNN}}

## Mục lục (Table of Contents)

1. [Thông tin cuộc họp](#1-thông-tin-cuộc-họp)
2. [Người tham dự (Attendees)](#2-người-tham-dự-attendees)
3. [Chương trình nghị sự (Agenda)](#3-chương-trình-nghị-sự-agenda)
4. [Nội dung thảo luận (Discussion)](#4-nội-dung-thảo-luận-discussion)
5. [Quyết định (Decisions)](#5-quyết-định-decisions)
6. [Hạng mục công việc (Action Items)](#6-hạng-mục-công-việc-action-items)
7. [Vấn đề tồn đọng (Open Issues / Parking Lot)](#7-vấn-đề-tồn-đọng-open-issues--parking-lot)
8. [Cuộc họp tiếp theo (Next Meeting) — *tùy chọn*](#8-cuộc-họp-tiếp-theo-next-meeting--tùy-chọn)
9. [Phụ lục (Appendix) — *tùy chọn*](#9-phụ-lục-appendix--tùy-chọn)
10. [Checklist hoàn thiện](#checklist-hoàn-thiện)

---

## 1. Thông tin cuộc họp

**[Bắt buộc]**

| Trường | Giá trị |
|---|---|
| Tiêu đề cuộc họp | {{TIÊU_ĐỀ}} |
| Ngày họp | {{YYYY-MM-DD}} |
| Thời gian | {{HH:MM}} – {{HH:MM}} (GMT+7) |
| Địa điểm / Nền tảng | {{PHÒNG_HOẶC_LINK_ZOOM_GMEET}} |
| Loại cuộc họp | {{Kickoff / Workshop / Review / Daily / Retrospective}} |
| Người chủ trì (Chair) | {{TÊN}} |
| Thư ký (Scribe) | {{TÊN_THƯ_KÝ}} |
| Mã dự án | {{MÃ_DỰ_ÁN}} |

---

## 2. Người tham dự (Attendees)

**[Bắt buộc]**

| Họ tên | Vai trò | Đơn vị | Có mặt | Email |
|---|---|---|---|---|
| {{HỌ_TÊN}} | {{VAI_TRÒ}} | {{ĐƠN_VỊ}} | ✅ Có / ❌ Vắng | {{EMAIL}} |

### Vắng mặt có lý do (Apologies)
- {{TÊN}} — {{LÝ_DO}}

---

## 3. Chương trình nghị sự (Agenda)

**[Bắt buộc]**

| # | Nội dung | Người phụ trách | Thời lượng |
|---|---|---|---|
| 1 | Cập nhật tiến độ tuần | PM | 10 phút |
| 2 | Rà soát yêu cầu module Đặt hàng | BA | 30 phút |
| 3 | Demo prototype | Dev Lead | 15 phút |
| 4 | Q&A | Tất cả | 10 phút |

---

## 4. Nội dung thảo luận (Discussion)

**[Bắt buộc]** — Ghi chép theo từng mục agenda.

### 4.1 {{TÊN_MỤC_1}}
- **Người trình bày:** {{TÊN}}
- **Tóm tắt nội dung:**
  - {{Ý_1}}
  - {{Ý_2}}
- **Phản hồi / Thảo luận:**
  - {{TÊN}}: {{Ý_KIẾN}}
  - {{TÊN}}: {{Ý_KIẾN}}

### 4.2 {{TÊN_MỤC_2}}
{{...}}

> **Ví dụ — Mục 2: Rà soát module Đặt hàng**
> - BA Nguyễn Thị B trình bày 12 yêu cầu chức năng. Stakeholder nghiệp vụ xác nhận 10/12, đề nghị làm rõ FUNC-007 (chính sách hoàn tiền) và FUNC-009 (tích hợp ERP).

---

## 5. Quyết định (Decisions)

**[Bắt buộc]**

| Mã | Nội dung quyết định | Người quyết định | Cơ sở |
|---|---|---|---|
| DEC-001 | Sử dụng VNPay làm cổng thanh toán mặc định cho giai đoạn 1 | Sponsor Trần C | Chi phí thấp nhất, tỷ lệ thành công 99,2% |
| DEC-{{NNN}} | {{QUYẾT_ĐỊNH}} | {{NGƯỜI}} | {{CƠ_SỞ}} |

---

## 6. Hạng mục công việc (Action Items)

**[Bắt buộc]**

| Mã | Công việc | Người phụ trách | Hạn chót | Trạng thái |
|---|---|---|---|---|
| AI-001 | Cập nhật FRD module Đặt hàng theo phản hồi | Nguyễn Thị B (BA) | 2026-05-30 | Mới |
| AI-{{NNN}} | {{CÔNG_VIỆC}} | {{PHỤ_TRÁCH}} | {{YYYY-MM-DD}} | {{Mới/Đang làm/Xong}} |

---

## 7. Vấn đề tồn đọng (Open Issues / Parking Lot)

**[Bắt buộc nếu có]**

| Mã | Vấn đề | Lý do chưa giải quyết | Dự kiến xử lý |
|---|---|---|---|
| ISS-001 | Chưa thống nhất chính sách hoàn tiền | Cần ý kiến phòng Pháp chế | Cuộc họp ngày 2026-05-28 |

---

## 8. Cuộc họp tiếp theo (Next Meeting) — *tùy chọn*

- **Thời gian:** {{YYYY-MM-DD HH:MM}}
- **Địa điểm / Link:** {{...}}
- **Chương trình dự kiến:** {{...}}

---

## 9. Phụ lục (Appendix) — *tùy chọn*

- Slide trình bày
- Bản ghi cuộc họp (recording)
- Tài liệu tham chiếu

---

## Checklist hoàn thiện

- [ ] Đầy đủ thông tin cuộc họp (ngày, giờ, địa điểm, chủ trì, thư ký)
- [ ] Danh sách người tham dự có đánh dấu Có / Vắng
- [ ] Mỗi mục agenda có người phụ trách và thời lượng
- [ ] Nội dung thảo luận ghi rõ ai phát biểu ý gì
- [ ] Quyết định có mã DEC-xxx và cơ sở rõ ràng
- [ ] Mỗi action item có người phụ trách, hạn chót cụ thể và trạng thái
- [ ] Vấn đề tồn đọng được chuyển sang Parking Lot có kế hoạch xử lý
- [ ] Biên bản đã gửi cho toàn bộ tham dự viên trong 24 giờ
- [ ] Đã thu thập phản hồi/đính chính từ người tham dự
- [ ] Đã chốt phiên bản "Final" sau khi được người chủ trì xác nhận
