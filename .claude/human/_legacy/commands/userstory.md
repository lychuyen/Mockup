---
description: Sinh 3-7 user story cho một feature kèm Acceptance Criteria theo Given-When-Then và INVEST check.
argument-hint: <tên feature>
allowed-tools: Read, Grep, Glob, Write, Edit, AskUserQuestion, Agent
---

# /userstory — Sinh User Stories cho Feature

**Feature cần phân rã:** `$ARGUMENTS`

## Quy trình thực hiện

### Bước 1 — Làm rõ feature (nếu cần)

Nếu tên feature mơ hồ hoặc thiếu ngữ cảnh, dùng `AskUserQuestion` hỏi tối đa 3 câu:

1. **Đối tượng người dùng chính** của feature là ai? (Cán bộ mua sắm / Quản lý / Kế toán / Khác)
2. **Mục tiêu nghiệp vụ:** Feature này giải quyết vấn đề gì hoặc tạo ra giá trị gì?
3. **Phạm vi feature:** Bao gồm chức năng nào? Loại trừ chức năng nào?

Nếu feature đã rõ (đã có BRD/FRD tham chiếu), bỏ qua bước này.

### Bước 2 — Đọc tài nguyên tham chiếu

- [.claude/templates/ba/user-story-template.md](.claude/templates/ba/user-story-template.md) — template chuẩn.
- [.claude/glossary/ba-terms-vi-en.md](.claude/glossary/ba-terms-vi-en.md) — Nhóm 3 (Agile/Scrum).
- BRD/FRD đã có trong `ba/process/` nếu liên quan đến feature.

### Bước 3 — Delegate sang agent business-analyst

Yêu cầu agent sinh **3–7 user story** (số lượng tùy độ phức tạp feature) với cấu trúc:

```
### US-VCM-NNN — <Tiêu đề ngắn>

**Là một** <persona>,
**tôi muốn** <hành động hoặc tính năng>,
**để** <giá trị nghiệp vụ>.

**Tiêu chí chấp nhận (Acceptance Criteria):**

AC-1: <Tên kịch bản>
- **Cho trước (Given)** <bối cảnh>
- **Khi (When)** <hành động>
- **Thì (Then)** <kết quả mong đợi>

AC-2: <Tên kịch bản phủ định / biên>
- Cho trước...
- Khi...
- Thì...

**Mức ưu tiên:** Must / Should / Could
**Ước lượng:** <story points>
```

Yêu cầu agent đảm bảo:
- Mỗi story có **ít nhất 2 Acceptance Criteria** (1 happy path + 1 negative/boundary).
- Bao phủ đầy đủ feature: từ luồng chính → luồng phụ → trường hợp lỗi.
- Mã định danh `US-VCM-NNN` liên tiếp.

### Bước 4 — INVEST Check (BẮT BUỘC)

Sau khi sinh xong, agent phải tự kiểm tra **mỗi story** theo nguyên tắc INVEST:

| Tiêu chí | Câu hỏi kiểm tra |
|---|---|
| **I**ndependent | Story có thể triển khai độc lập, không bị chặn bởi story khác? |
| **N**egotiable | Chi tiết còn có thể thương lượng, không quá cứng nhắc? |
| **V**aluable | Mang lại giá trị rõ ràng cho người dùng? |
| **E**stimable | Đội phát triển có thể ước lượng được? |
| **S**mall | Đủ nhỏ để hoàn thành trong 1 sprint? |
| **T**estable | Mỗi AC có thể kiểm thử được? |

Nếu story **không đạt** ≥ 1 tiêu chí, **tách nhỏ** hoặc **bổ sung chi tiết** rồi kiểm tra lại.

### Bước 5 — Lưu kết quả

- File: `ba/process/user-stories/US-VCM-<feature-slug>-v1.0-<YYYY-MM-DD>.md`
- Frontmatter YAML chuẩn theo [CLAUDE.md §8](CLAUDE.md#8-output-conventions).
- Bảng truy vết về Feature/Epic ở đầu file.

## Quy tắc bắt buộc

- **Toàn bộ user story bằng tiếng Việt.** Định dạng "Là một... tôi muốn... để..." (không dùng "As a...").
- Acceptance Criteria dùng cặp từ Việt-Anh: **Cho trước (Given) – Khi (When) – Thì (Then)**.
- Persona phải cụ thể (vd. "Cán bộ Đấu thầu"), không dùng "người dùng" chung chung.

## Sau khi hoàn thành

Báo cáo cho người dùng:
1. Đường dẫn file user stories đã sinh.
2. Bảng tổng hợp: tổng số story, phân bổ theo MoSCoW.
3. Kết quả INVEST check (story nào cần làm rõ thêm).
