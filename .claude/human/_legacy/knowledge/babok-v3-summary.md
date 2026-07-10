---
name: babok-v3-summary
description: Tóm tắt 6 Knowledge Area chính của BABOK Guide v3 — mục tiêu, đầu vào, kỹ thuật, đầu ra. Tài liệu tham chiếu cho hệ sinh thái agent BA.
source: IIBA, BABOK® Guide v3 (2015)
version: "1.0"
date: "2026-05-26"
---

> Bản canonical (AGENTS scope) tại `.claude/knowledge/babok-v3-summary.md`. Đồng bộ theo [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md).

# BABOK v3 — Tóm tắt 6 Knowledge Area

**BABOK Guide v3** (do IIBA xuất bản, 2015) là chuẩn nghề nghiệp toàn cầu cho Business Analysis. Tài liệu định nghĩa **6 Knowledge Area (KA — vùng kiến thức)** bao trùm mọi công việc của một BA.

Mỗi KA gồm: **Mục tiêu (Purpose)**, **Đầu vào (Inputs)**, **Kỹ thuật chính (Techniques)**, **Đầu ra (Outputs)**.

---

## 1. Business Analysis Planning & Monitoring (BAPM)
**Lập kế hoạch & Giám sát công việc BA**

| Hạng mục | Nội dung |
|---|---|
| **Mục tiêu** | Lập kế hoạch cách thức thực hiện công việc BA — ai làm, làm thế nào, đo lường ra sao. Xác định stakeholder, mô hình quản trị, và phương pháp đánh giá hiệu quả công việc BA. |
| **Đầu vào** | Nhu cầu nghiệp vụ (business need), mục tiêu hiệu suất BA. |
| **Kỹ thuật chính** | Phân tích stakeholder (Stakeholder Analysis), Ma trận RACI, Ước lượng (Estimation), Đánh giá rủi ro (Risk Assessment), Họp review. |
| **Đầu ra** | BA Approach (cách tiếp cận BA), Stakeholder Engagement Approach (kế hoạch tương tác stakeholder), Governance Approach (mô hình quản trị), Information Management Approach (cách quản lý thông tin), BA Performance Assessment (đánh giá hiệu suất BA). |

> **Ví dụ ứng dụng cho VCM:** Trước khi bắt đầu module Quản lý Hợp đồng, BA phải lập "BA Approach" mô tả cách phỏng vấn, cách quản lý yêu cầu, và lịch trình các milestone phê duyệt.

---

## 2. Elicitation & Collaboration
**Khai thác Yêu cầu & Hợp tác**

| Hạng mục | Nội dung |
|---|---|
| **Mục tiêu** | Khai thác (elicit) thông tin từ stakeholder và đảm bảo hiểu chung. KHÔNG chỉ là "thu thập" — BA chủ động dẫn dắt cuộc đối thoại để lộ ra thông tin tiềm ẩn. |
| **Đầu vào** | Nhu cầu nghiệp vụ, danh sách stakeholder. |
| **Kỹ thuật chính** | Phỏng vấn (Interview), Hội thảo (Workshop), Phân tích tài liệu (Document Analysis), Quan sát (Observation), Khảo sát (Survey), Brainstorming, Focus group, Prototyping. |
| **Đầu ra** | Kết quả khai thác đã xác nhận / chưa xác nhận, vấn đề mà stakeholder quan tâm (Stakeholder Concerns). |

> **Ví dụ ứng dụng cho VCM:** Phỏng vấn kế toán bằng kỹ thuật 5 Whys để hiểu vì sao đối soát thanh toán hiện mất 3 ngày → phát hiện nguyên nhân gốc là biểu mẫu Excel không có template chuẩn.

---

## 3. Requirements Life Cycle Management (RLCM)
**Quản lý Vòng đời Yêu cầu**

| Hạng mục | Nội dung |
|---|---|
| **Mục tiêu** | Quản lý yêu cầu xuyên suốt từ lúc phát sinh đến lúc loại bỏ: truy vết, duy trì, sắp xếp ưu tiên, đánh giá thay đổi, phê duyệt. |
| **Đầu vào** | Kết quả khai thác, các thiết kế (design). |
| **Kỹ thuật chính** | Truy vết yêu cầu (Traceability), Sắp xếp ưu tiên (MoSCoW / Kano), Phân tích tác động (Impact Analysis), Theo dõi vấn đề (Item Tracking), Họp review. |
| **Đầu ra** | Yêu cầu đã được truy vết / duy trì / sắp xếp / phê duyệt; Đánh giá thay đổi yêu cầu (Requirements Change Assessment). |

> **Ví dụ ứng dụng cho VCM:** Khi stakeholder yêu cầu bổ sung "tự động duyệt đơn < 5 triệu", BA dùng Impact Analysis xác định ảnh hưởng đến FR-005, FR-008 và 3 user story đã trong sprint.

---

## 4. Strategy Analysis
**Phân tích Chiến lược**

| Hạng mục | Nội dung |
|---|---|
| **Mục tiêu** | Xác định nhu cầu cấp doanh nghiệp có tầm quan trọng chiến lược và phát triển chiến lược giải quyết. Trả lời "Tại sao làm dự án này?" trước "Làm cái gì?". |
| **Đầu vào** | Nhu cầu nghiệp vụ ở mức cao, bối cảnh doanh nghiệp. |
| **Kỹ thuật chính** | SWOT, PESTLE, Business Capability Analysis, Business Model Canvas, Phân tích nguyên nhân gốc (Root Cause Analysis), Phân tích quyết định (Decision Analysis). |
| **Đầu ra** | Mô tả trạng thái hiện tại (Current State Description), Mô tả trạng thái tương lai (Future State Description), Đánh giá rủi ro chuyển đổi, Chiến lược thay đổi (Change Strategy). |

> **Ví dụ ứng dụng cho VCM:** Trước khi quyết định số hóa quy trình đấu thầu, BA chạy SWOT để cân nhắc lợi ích (minh bạch, nhanh) vs. rủi ro (kháng cự thay đổi, chi phí ban đầu).

---

## 5. Requirements Analysis & Design Definition (RADD)
**Phân tích Yêu cầu & Định nghĩa Thiết kế**

| Hạng mục | Nội dung |
|---|---|
| **Mục tiêu** | Cấu trúc hóa thông tin đã khai thác thành yêu cầu và thiết kế mô tả một giải pháp mang lại giá trị. Là KA "nặng" nhất về mặt sản phẩm tài liệu. |
| **Đầu vào** | Kết quả khai thác, chiến lược thay đổi, mô hình quản trị. |
| **Kỹ thuật chính** | Mô hình hóa (BPMN, UML, ERD), Use Case, User Story, Decision Modeling, Data Modeling, Scope Modeling, Định nghĩa Acceptance Criteria. |
| **Đầu ra** | Yêu cầu (đã verify & validate), Designs, Kiến trúc yêu cầu (Requirements Architecture), Khuyến nghị giải pháp. |

> **Ví dụ ứng dụng cho VCM:** Sau khi phỏng vấn 5 cán bộ mua sắm, BA chuyển kết quả thành 12 user story trong BRD, vẽ BPMN cho quy trình duyệt đơn, và soạn ERD cho dữ liệu hợp đồng.

---

## 6. Solution Evaluation
**Đánh giá Giải pháp**

| Hạng mục | Nội dung |
|---|---|
| **Mục tiêu** | Đo lường giá trị mà giải pháp đã triển khai mang lại; khuyến nghị cải tiến hoặc thay thế. |
| **Đầu vào** | Giải pháp đã triển khai, mục tiêu nghiệp vụ, yêu cầu. |
| **Kỹ thuật chính** | Phân tích KPI/Metrics, Root Cause Analysis, Khảo sát, Focus group, Phân tích rủi ro. |
| **Đầu ra** | Phân tích hiệu quả giải pháp, Hành động khuyến nghị (cải tiến/loại bỏ/thay thế). |

> **Ví dụ ứng dụng cho VCM:** 6 tháng sau khi go-live module Hợp đồng, BA đo KPI "thời gian xử lý trung bình" → từ 48h xuống 6h, đạt 80% mục tiêu → khuyến nghị tự động hóa thêm 2 bước thủ công còn lại.

---

## Năng lực nền tảng (Underlying Competencies)

Áp dụng xuyên suốt cả 6 KA — không chỉ là "kiến thức" mà còn là "cách hành xử":

- **Tư duy phân tích & giải quyết vấn đề** (Analytical Thinking & Problem Solving)
- **Đặc điểm hành vi** — đạo đức, trách nhiệm cá nhân, đáng tin cậy
- **Kiến thức nghiệp vụ** — ngành, tổ chức, giải pháp, phương pháp luận
- **Kỹ năng giao tiếp** — nói, không lời, viết, lắng nghe
- **Kỹ năng tương tác** — điều phối, lãnh đạo & ảnh hưởng, làm việc nhóm, đàm phán
- **Công cụ & công nghệ** — Jira, Confluence, Mermaid, Figma, v.v.

## Perspectives (Góc nhìn) — mới trong BABOK v3

5 góc nhìn áp dụng các KA cho ngữ cảnh khác nhau:

- **Agile** — BA trong môi trường Agile/Scrum
- **Business Intelligence** — BA cho dữ liệu, báo cáo, phân tích
- **Information Technology** — BA cho dự án CNTT thuần
- **Business Architecture** — BA ở cấp kiến trúc doanh nghiệp
- **Business Process Management** — BA tập trung vào quy trình

---

## Liên hệ với hệ sinh thái VCM

| BABOK KA | Agent VCM tương ứng | Template/Command |
|---|---|---|
| BAPM | `business-analyst` | Stakeholder analysis (`/stakeholder`) |
| Elicitation | `ba-interviewer` | Interview guide (`/interview`) |
| RLCM | `requirement-validator` | Traceability audit |
| Strategy Analysis | `business-analyst` | Gap Analysis (`/asis-tobe`) |
| RADD | `business-analyst`, `process-modeler` | BRD/SRS/FRD/User Story templates |
| Solution Evaluation | `ba-reviewer`, `requirement-validator` | Review reports |

Tra cứu thuật ngữ chi tiết: [`.claude/human/glossary/ba-terms-vi-en.md`](../glossary/ba-terms-vi-en.md).
