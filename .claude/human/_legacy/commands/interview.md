---
description: Sinh bộ 15-20 câu hỏi phỏng vấn stakeholder theo role chỉ định, dùng nguyên tắc 5W1H và câu hỏi mở.
argument-hint: <role — vd: PO, end user, dev lead, sponsor, accountant>
allowed-tools: Read, Grep, Glob, Write, Edit, AskUserQuestion, Agent
---

# /interview — Sinh Bộ Câu Hỏi Phỏng Vấn Stakeholder

**Vai trò cần phỏng vấn:** `$ARGUMENTS`

## Quy trình thực hiện

### Bước 1 — Làm rõ ngữ cảnh phỏng vấn (nếu cần)

Nếu role mơ hồ hoặc cần chi tiết hơn, dùng `AskUserQuestion` hỏi (tối đa 3 câu):

1. **Mục tiêu phỏng vấn:** Khảo sát ban đầu (discovery) / Xác minh yêu cầu / Đánh giá quy trình hiện tại / Khác?
2. **Phạm vi nghiệp vụ tập trung:** Module nào của VCM? (Hợp đồng / Nhà cung cấp / Thanh toán / Đấu thầu)
3. **Thời lượng phỏng vấn dự kiến:** 30 / 60 / 90 phút? (ảnh hưởng số lượng câu hỏi)

### Bước 2 — Đọc tham chiếu

- [CLAUDE.md §3](CLAUDE.md#3-end-user-personas) — đặc điểm persona VCM.
- [.claude/glossary/ba-terms-vi-en.md](.claude/glossary/ba-terms-vi-en.md) — đảm bảo thuật ngữ trong câu hỏi nhất quán.

### Bước 3 — Sinh bộ câu hỏi theo nguyên tắc

Yêu cầu **15–20 câu hỏi** cho role `$ARGUMENTS`, tuân thủ:

#### Nguyên tắc câu hỏi
- **Câu hỏi mở (Open-ended):** bắt đầu bằng "Anh/Chị có thể mô tả...", "Theo Anh/Chị...", "Điều gì khiến...". **Tránh** câu hỏi đóng (Có/Không).
- **5W1H:** bao phủ đủ **Who, What, When, Where, Why, How** cho mỗi chủ đề chính.
- **Không dẫn dắt (Non-leading):** không gợi ý câu trả lời mong muốn.
- **Trung lập:** tránh thuật ngữ chuyên môn nội bộ nếu phỏng vấn end user.

#### Cấu trúc bộ câu hỏi (phân theo phần)

| Phần | Số câu | Mục tiêu |
|---|---|---|
| **1. Khởi động (Warm-up)** | 2–3 | Tạo không khí, tìm hiểu vai trò người được phỏng vấn |
| **2. Quy trình hiện tại (As-Is)** | 4–6 | Mô tả công việc hằng ngày, công cụ, biểu mẫu đang dùng |
| **3. Vấn đề & Điểm đau (Pain Points)** | 3–5 | Khó khăn, thời gian lãng phí, sai sót thường gặp |
| **4. Kỳ vọng & Mong muốn (Wishlist)** | 3–4 | Nếu có "đũa thần", muốn cải thiện gì? |
| **5. Đo lường & Tiêu chí thành công** | 2–3 | KPI cá nhân, định nghĩa "thành công" |
| **6. Kết thúc & Mở rộng** | 1–2 | Ai khác nên phỏng vấn? Tài liệu nào cần xem? |

### Bước 4 — Định dạng đầu ra

```markdown
# Bộ Câu Hỏi Phỏng Vấn — Vai trò: <ROLE>

## Thông tin chung
- **Vai trò:** <ROLE>
- **Mục tiêu phỏng vấn:** ...
- **Thời lượng dự kiến:** ... phút
- **Người phỏng vấn:** ...
- **Ngày dự kiến:** ...

## 1. Khởi động (Warm-up) — 5 phút

**Q1.** Anh/Chị có thể giới thiệu ngắn về vai trò hiện tại và công việc chính trong một ngày làm việc điển hình?
*Mục đích: tạo không khí + hiểu phạm vi vai trò.*

**Q2.** Anh/Chị đã làm vị trí này được bao lâu? Trước đây có làm vai trò nào liên quan không?
*Mục đích: đánh giá kinh nghiệm và mức am hiểu nghiệp vụ.*

## 2. Quy trình hiện tại (As-Is) — 15 phút

**Q3.** Anh/Chị có thể mô tả tuần tự các bước Anh/Chị thường làm khi <hoạt động chính theo role>?
*Mục đích: thu thập As-Is.*

... (tiếp tục Q4–Qn)

## 3. Vấn đề & Điểm đau ...
## 4. Kỳ vọng & Mong muốn ...
## 5. Đo lường ...
## 6. Kết thúc & Mở rộng ...

## Phụ lục — Câu hỏi dự phòng (Follow-up Prompts)
- "Anh/Chị có thể cho một ví dụ cụ thể gần đây không?"
- "Điều gì khiến vấn đề này quan trọng với Anh/Chị?"
- "Nếu phải xếp 3 ưu tiên cao nhất, Anh/Chị chọn gì?"
```

### Bước 5 — Ví dụ minh họa cho 5 role phổ biến

Agent cần điều chỉnh câu hỏi theo đặc thù role:

| Role | Trọng tâm câu hỏi |
|---|---|
| **Sponsor / BGĐ** | Mục tiêu chiến lược, KPI, ngân sách, rủi ro chấp nhận được, định nghĩa thành công |
| **Product Owner (PO)** | Roadmap, ưu tiên, đánh đổi, phản hồi từ thị trường/người dùng |
| **End User** (cán bộ mua sắm, kế toán...) | Công việc hằng ngày, công cụ, biểu mẫu, điểm đau, kỳ vọng |
| **Dev Lead / Architect** | Ràng buộc kỹ thuật, hệ thống tích hợp, nợ kỹ thuật, hiệu năng |
| **Pháp chế / Compliance** | Yêu cầu pháp lý, audit, lưu vết, dữ liệu cá nhân |

### Bước 6 — Lưu kết quả

- File: `ba/process/interview-guides/Interview-<role-slug>-v1.0-<YYYY-MM-DD>.md`
- Frontmatter YAML chuẩn.

## Quy tắc bắt buộc

- **Toàn bộ câu hỏi bằng tiếng Việt**, xưng hô "Anh/Chị" trang trọng.
- Không dùng thuật ngữ chuyên môn khó hiểu nếu role là end user — diễn đạt đời thường.
- Mỗi câu hỏi đi kèm chú thích **mục đích** (in nghiêng) để người phỏng vấn hiểu why.
- Phụ lục câu hỏi dự phòng (follow-up) bắt buộc — giúp đào sâu khi cần.

## Sau khi hoàn thành

Báo cáo:
1. Đường dẫn file câu hỏi.
2. Tổng số câu hỏi và phân bổ theo 6 phần.
3. Đề xuất các tài liệu/dữ liệu nên chuẩn bị trước phỏng vấn (biểu mẫu hiện tại, screenshot màn hình...).
