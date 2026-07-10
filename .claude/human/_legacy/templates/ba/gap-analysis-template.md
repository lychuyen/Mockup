---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "{{PHIÊN_BẢN}}"
date: "{{NGÀY_PHÁT_HÀNH}}"
status: "{{Draft | Review | Approved}}"
document_type: "Gap Analysis Report"
---

# Báo cáo Phân tích Khoảng cách (Gap Analysis Report)

## Mục lục (Table of Contents)

1. [Thông tin tài liệu](#1-thông-tin-tài-liệu)
2. [Tóm tắt điều hành (Executive Summary)](#2-tóm-tắt-điều-hành-executive-summary)
3. [Phạm vi & Phương pháp (Scope & Methodology)](#3-phạm-vi--phương-pháp-scope--methodology)
4. [Hiện trạng (As-Is)](#4-hiện-trạng-as-is)
5. [Trạng thái mục tiêu (To-Be)](#5-trạng-thái-mục-tiêu-to-be)
6. [Phân tích khoảng cách (Gap Analysis)](#6-phân-tích-khoảng-cách-gap-analysis)
7. [Khuyến nghị (Recommendations)](#7-khuyến-nghị-recommendations)
8. [Lộ trình triển khai (Roadmap) — *tùy chọn*](#8-lộ-trình-triển-khai-roadmap--tùy-chọn)
9. [Phụ lục (Appendix) — *tùy chọn*](#9-phụ-lục-appendix--tùy-chọn)
10. [Checklist hoàn thiện](#checklist-hoàn-thiện)

---

## 1. Thông tin tài liệu

**[Bắt buộc]**

| Trường | Giá trị |
|---|---|
| Tên dự án | {{TÊN_DỰ_ÁN}} |
| Phạm vi phân tích | {{PHÂN_HỆ_HOẶC_QUY_TRÌNH}} |
| Phiên bản | {{PHIÊN_BẢN}} |
| Người soạn | {{TÊN_BA}} |
| Trạng thái | {{Draft / Review / Approved}} |

---

## 2. Tóm tắt điều hành (Executive Summary)

**[Bắt buộc]** — Tối đa 250 từ.

Tóm tắt 3 nội dung: (1) lý do thực hiện phân tích, (2) phát hiện chính, (3) khuyến nghị tổng thể.

> **Ví dụ:** Quy trình duyệt đơn hàng hiện tại có 6 điểm thủ công, trung bình mất 48 giờ. Khoảng cách lớn nhất nằm ở khâu phê duyệt nhiều cấp. Đề xuất tự động hóa 4/6 điểm, dự kiến giảm thời gian xuống 4 giờ và tiết kiệm 1,2 tỷ VND/năm.

---

## 3. Phạm vi & Phương pháp (Scope & Methodology)

**[Bắt buộc]**

### 3.1 Phạm vi (Scope)
- Quy trình / phân hệ phân tích: {{...}}
- Thời gian khảo sát: {{TỪ}} – {{ĐẾN}}
- Đơn vị / bộ phận liên quan: {{...}}

### 3.2 Phương pháp (Methodology)
- Phỏng vấn cấu trúc với {{N}} stakeholder
- Quan sát quy trình trực tiếp
- Phân tích tài liệu hiện có
- Đối chiếu với chuẩn ngành / best practice

---

## 4. Hiện trạng (As-Is)

**[Bắt buộc]**

### 4.1 Mô tả quy trình hiện tại
{{SƠ_ĐỒ_BPMN_HOẶC_MÔ_TẢ_TUẦN_TỰ}}

### 4.2 Năng lực hiện có (Current Capabilities)
| Hạng mục | Mô tả | Đánh giá |
|---|---|---|
| Con người (People) | {{...}} | {{Mạnh/TB/Yếu}} |
| Quy trình (Process) | {{...}} | {{...}} |
| Công nghệ (Technology) | {{...}} | {{...}} |
| Dữ liệu (Data) | {{...}} | {{...}} |

### 4.3 Chỉ số đo lường hiện tại (Current KPIs)
| Chỉ số | Giá trị hiện tại |
|---|---|
| Thời gian xử lý trung bình | 48 giờ |
| Tỷ lệ sai sót | 7% |
| {{KPI}} | {{GIÁ_TRỊ}} |

---

## 5. Trạng thái mục tiêu (To-Be)

**[Bắt buộc]**

### 5.1 Mô tả quy trình mục tiêu
{{SƠ_ĐỒ_BPMN_HOẶC_MÔ_TẢ_TUẦN_TỰ}}

### 5.2 Năng lực mục tiêu (Target Capabilities)
| Hạng mục | Mô tả mục tiêu |
|---|---|
| Con người | {{...}} |
| Quy trình | {{...}} |
| Công nghệ | {{...}} |
| Dữ liệu | {{...}} |

### 5.3 Chỉ số đo lường mục tiêu (Target KPIs)
| Chỉ số | Giá trị mục tiêu | Thời hạn đạt được |
|---|---|---|
| Thời gian xử lý trung bình | ≤ 4 giờ | Q4/2026 |
| Tỷ lệ sai sót | ≤ 1% | Q4/2026 |

---

## 6. Phân tích khoảng cách (Gap Analysis)

**[Bắt buộc]** — Bảng đối chiếu chi tiết.

| Mã | Hạng mục | Hiện trạng (As-Is) | Mục tiêu (To-Be) | Khoảng cách (Gap) | Mức độ | Loại |
|---|---|---|---|---|---|---|
| GAP-001 | Phê duyệt đơn hàng | Thủ công 4 cấp, email | Tự động theo rule + 1 cấp ngoại lệ | Cần engine workflow | Cao | Công nghệ |
| GAP-002 | Báo cáo doanh số | Export Excel hàng tuần | Dashboard realtime | Thiếu BI platform | Trung | Công nghệ |
| GAP-003 | Kỹ năng phân tích dữ liệu | Hạn chế | Có đội Data Analyst | Tuyển dụng + đào tạo | Trung | Con người |
| GAP-{{NNN}} | {{HẠNG_MỤC}} | {{AS_IS}} | {{TO_BE}} | {{GAP}} | {{Cao/TB/Thấp}} | {{People/Process/Technology/Data}} |

### 6.1 Phân loại khoảng cách (Gap Classification)
- **Khoảng cách năng lực (Capability gap):** {{N}} điểm
- **Khoảng cách quy trình (Process gap):** {{N}} điểm
- **Khoảng cách công nghệ (Technology gap):** {{N}} điểm
- **Khoảng cách dữ liệu (Data gap):** {{N}} điểm

---

## 7. Khuyến nghị (Recommendations)

**[Bắt buộc]**

| Mã GAP | Khuyến nghị | Ưu tiên (MoSCoW) | Nỗ lực ước lượng | Lợi ích kỳ vọng |
|---|---|---|---|---|
| GAP-001 | Triển khai workflow engine (Camunda hoặc tương đương) | Must | 60 người-ngày | Giảm 90% thời gian phê duyệt |
| GAP-002 | Xây dựng dashboard BI trên Power BI | Should | 30 người-ngày | Báo cáo realtime |
| GAP-{{NNN}} | {{KHUYẾN_NGHỊ}} | {{Must/Should/Could}} | {{...}} | {{...}} |

---

## 8. Lộ trình triển khai (Roadmap) — *tùy chọn*

| Giai đoạn | Thời gian | Hạng mục chính | Phụ thuộc |
|---|---|---|---|
| Pha 1 — Nền tảng | Q3/2026 | Workflow engine | Không |
| Pha 2 — Tự động hóa | Q4/2026 | Migrate quy trình duyệt đơn | Pha 1 |
| Pha 3 — Tối ưu | Q1/2027 | BI dashboard, đào tạo | Pha 2 |

---

## 9. Phụ lục (Appendix) — *tùy chọn*

- Biên bản phỏng vấn
- Kết quả khảo sát định lượng
- Tham chiếu best practice ngành

---

## Checklist hoàn thiện

- [ ] Phạm vi phân tích được giới hạn rõ ràng
- [ ] Phương pháp khảo sát ghi rõ nguồn dữ liệu và số mẫu
- [ ] As-Is mô tả đầy đủ con người, quy trình, công nghệ, dữ liệu
- [ ] To-Be có chỉ số mục tiêu định lượng và thời hạn
- [ ] Mỗi khoảng cách có mã GAP-xxx, mức độ và phân loại
- [ ] Khuyến nghị gắn với mã GAP cụ thể, có ưu tiên MoSCoW
- [ ] Đã ước lượng nỗ lực và lợi ích kỳ vọng
- [ ] Lộ trình triển khai có thứ tự phụ thuộc rõ ràng
- [ ] Đã rà soát với stakeholder nghiệp vụ
- [ ] Đã được phê duyệt trước khi chuyển sang giai đoạn lập kế hoạch
