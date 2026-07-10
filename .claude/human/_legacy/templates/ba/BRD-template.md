---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "{{PHIÊN_BẢN}}"
date: "{{NGÀY_PHÁT_HÀNH}}"
status: "{{Draft | Review | Approved}}"
document_type: "Business Requirements Document (BRD)"
---

# Tài liệu Yêu cầu Nghiệp vụ (Business Requirements Document — BRD)

## Mục lục (Table of Contents)

1. [Thông tin tài liệu (Document Control)](#1-thông-tin-tài-liệu-document-control)
2. [Tóm tắt điều hành (Executive Summary)](#2-tóm-tắt-điều-hành-executive-summary)
3. [Bối cảnh nghiệp vụ (Business Context)](#3-bối-cảnh-nghiệp-vụ-business-context)
4. [Mục tiêu nghiệp vụ (Business Objectives)](#4-mục-tiêu-nghiệp-vụ-business-objectives)
5. [Phạm vi (Scope)](#5-phạm-vi-scope)
6. [Các bên liên quan (Stakeholders)](#6-các-bên-liên-quan-stakeholders)
7. [Yêu cầu nghiệp vụ chi tiết (Detailed Business Requirements)](#7-yêu-cầu-nghiệp-vụ-chi-tiết-detailed-business-requirements)
8. [Quy trình nghiệp vụ (Business Process)](#8-quy-trình-nghiệp-vụ-business-process)
9. [Rủi ro & Giả định (Risks & Assumptions)](#9-rủi-ro--giả-định-risks--assumptions)
10. [Phụ lục (Appendix) — *tùy chọn*](#10-phụ-lục-appendix--tùy-chọn)
11. [Checklist hoàn thiện](#checklist-hoàn-thiện)

---

## 1. Thông tin tài liệu (Document Control)

**[Bắt buộc]**

| Trường | Giá trị |
|---|---|
| Tên dự án (Project Name) | {{TÊN_DỰ_ÁN}} |
| Mã dự án (Project Code) | {{MÃ_DỰ_ÁN}} |
| Phiên bản (Version) | {{PHIÊN_BẢN}} |
| Ngày phát hành (Release Date) | {{NGÀY_PHÁT_HÀNH}} |
| Trạng thái (Status) | {{Draft / Review / Approved}} |
| Người soạn thảo (Author) | {{TÊN_BA}} |
| Người phê duyệt (Approver) | {{TÊN_NGƯỜI_DUYỆT}} |

### Lịch sử thay đổi (Change History)

| Phiên bản | Ngày | Người thay đổi | Mô tả thay đổi |
|---|---|---|---|
| 1.0 | 2026-01-15 | Nguyễn Văn A | Bản phát hành đầu tiên |
| {{X.Y}} | {{YYYY-MM-DD}} | {{TÊN}} | {{MÔ_TẢ}} |

---

## 2. Tóm tắt điều hành (Executive Summary)

**[Bắt buộc]** — Tối đa 300 từ, dành cho lãnh đạo.

Mô tả ngắn gọn: vấn đề nghiệp vụ, giải pháp đề xuất, giá trị mang lại, và mức đầu tư dự kiến.

> **Ví dụ:** Hệ thống quản lý đơn hàng hiện tại xử lý thủ công gây chậm trễ trung bình 48 giờ. Dự án {{TÊN_DỰ_ÁN}} đề xuất tự động hóa quy trình duyệt đơn nhằm rút ngắn thời gian xuống dưới 4 giờ, dự kiến tiết kiệm 1,2 tỷ đồng/năm.

---

## 3. Bối cảnh nghiệp vụ (Business Context)

**[Bắt buộc]**

- **Tình hình hiện tại (Current Situation):** {{MÔ_TẢ_HIỆN_TRẠNG}}
- **Vấn đề cần giải quyết (Problem Statement):** {{VẤN_ĐỀ}}
- **Cơ hội nghiệp vụ (Business Opportunity):** {{CƠ_HỘI}}
- **Phân tích SWOT — *tùy chọn*:**
  - Điểm mạnh (Strengths): {{...}}
  - Điểm yếu (Weaknesses): {{...}}
  - Cơ hội (Opportunities): {{...}}
  - Thách thức (Threats): {{...}}

---

## 4. Mục tiêu nghiệp vụ (Business Objectives)

**[Bắt buộc]** — Mục tiêu phải đo lường được theo nguyên tắc SMART.

| Mã | Mục tiêu | Chỉ số đo lường (KPI) | Mục tiêu định lượng |
|---|---|---|---|
| OBJ-001 | Rút ngắn thời gian xử lý đơn hàng | Thời gian trung bình (giờ) | Từ 48h xuống ≤ 4h trong Q4/2026 |
| OBJ-{{NNN}} | {{MỤC_TIÊU}} | {{KPI}} | {{ĐỊNH_LƯỢNG}} |

---

## 5. Phạm vi (Scope)

**[Bắt buộc]**

### 5.1 Trong phạm vi (In-scope)
- {{HẠNG_MỤC_1}}
- {{HẠNG_MỤC_2}}

### 5.2 Ngoài phạm vi (Out-of-scope)
- {{HẠNG_MỤC_LOẠI_TRỪ_1}}
- {{HẠNG_MỤC_LOẠI_TRỪ_2}}

> **Ví dụ — Trong phạm vi:** Tích hợp cổng thanh toán nội địa (VNPay, MoMo).
> **Ví dụ — Ngoài phạm vi:** Tích hợp cổng thanh toán quốc tế (giai đoạn sau).

---

## 6. Các bên liên quan (Stakeholders)

**[Bắt buộc]**

| Bên liên quan | Vai trò | Mức quan tâm | Mức ảnh hưởng | Kỳ vọng |
|---|---|---|---|---|
| {{TÊN_BÊN}} | {{VAI_TRÒ}} | Cao / Trung / Thấp | Cao / Trung / Thấp | {{KỲ_VỌNG}} |

### Ma trận RACI — *tùy chọn*

| Hoạt động | Sponsor | PM | BA | Dev Lead | QA |
|---|---|---|---|---|---|
| Phê duyệt yêu cầu | A | C | R | C | I |

(R = Responsible, A = Accountable, C = Consulted, I = Informed)

---

## 7. Yêu cầu nghiệp vụ chi tiết (Detailed Business Requirements)

**[Bắt buộc]** — Áp dụng ưu tiên MoSCoW (Must / Should / Could / Won't).

| Mã | Mô tả yêu cầu | Loại | Ưu tiên | Nguồn |
|---|---|---|---|---|
| BR-001 | Hệ thống phải cho phép khách hàng đặt đơn online 24/7 | Chức năng | Must | Khảo sát KH 12/2025 |
| BR-{{NNN}} | {{MÔ_TẢ}} | {{Chức năng / Phi chức năng}} | {{Must/Should/Could/Won't}} | {{NGUỒN}} |

---

## 8. Quy trình nghiệp vụ (Business Process)

**[Bắt buộc]**

### 8.1 Quy trình hiện tại (As-Is)
{{MÔ_TẢ_HOẶC_SƠ_ĐỒ_BPMN_AS_IS}}

### 8.2 Quy trình đề xuất (To-Be)
{{MÔ_TẢ_HOẶC_SƠ_ĐỒ_BPMN_TO_BE}}

### 8.3 Điểm khác biệt chính (Key Changes)
- {{KHÁC_BIỆT_1}}
- {{KHÁC_BIỆT_2}}

---

## 9. Rủi ro & Giả định (Risks & Assumptions)

**[Bắt buộc]**

### 9.1 Rủi ro (Risks)

| Mã | Mô tả rủi ro | Xác suất | Tác động | Biện pháp giảm thiểu |
|---|---|---|---|---|
| RISK-001 | Thiếu nguồn lực vận hành sau go-live | Trung | Cao | Lập kế hoạch đào tạo trước 1 tháng |

### 9.2 Giả định (Assumptions)
- {{GIẢ_ĐỊNH_1}}
- {{GIẢ_ĐỊNH_2}}

---

## 10. Phụ lục (Appendix) — *tùy chọn*

- Thuật ngữ (Glossary)
- Tài liệu tham chiếu (References)
- Kết quả khảo sát, biên bản phỏng vấn

---

## Checklist hoàn thiện

- [ ] Đã điền đầy đủ thông tin tài liệu và lịch sử thay đổi
- [ ] Tóm tắt điều hành ngắn gọn, không vượt 300 từ
- [ ] Mục tiêu nghiệp vụ đo lường được theo SMART
- [ ] Phạm vi In-scope/Out-of-scope rõ ràng, không mơ hồ
- [ ] Mỗi yêu cầu nghiệp vụ có mã duy nhất (BR-xxx) và mức ưu tiên MoSCoW
- [ ] Đã liệt kê đầy đủ các bên liên quan với mức ảnh hưởng/quan tâm
- [ ] Có sơ đồ hoặc mô tả As-Is và To-Be
- [ ] Rủi ro đã được đánh giá xác suất, tác động và biện pháp giảm thiểu
- [ ] Giả định được nêu rõ và có thể kiểm chứng
- [ ] Đã có chữ ký phê duyệt của Sponsor/Approver
