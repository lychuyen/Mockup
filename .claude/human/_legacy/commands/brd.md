---
description: Sinh Tài liệu Yêu cầu Nghiệp vụ (BRD) đầy đủ cho dự án, delegate sang agent business-analyst.
argument-hint: <tên dự án hoặc module>
allowed-tools: Read, Grep, Glob, Write, Edit, AskUserQuestion, Agent
---

# /brd — Sinh Tài liệu Yêu cầu Nghiệp vụ (BRD)

**Đối tượng cần sinh BRD:** `$ARGUMENTS`

## Quy trình thực hiện

### Bước 1 — Thu thập thông tin đầu vào (BẮT BUỘC)

Trước khi sinh BRD, **dùng `AskUserQuestion`** để hỏi người dùng các thông tin sau (gộp tối đa 4 câu hỏi trong một lần gọi):

1. **Phạm vi (Scope):** Những hạng mục nào trong phạm vi? Hạng mục nào ngoài phạm vi?
2. **Các bên liên quan chính (Key Stakeholders):** Ai là sponsor, end user, đơn vị bị ảnh hưởng?
3. **Mục tiêu kinh doanh (Business Objectives):** Mục tiêu định lượng (KPI, ROI, thời gian xử lý...)?
4. **Bối cảnh & vấn đề hiện tại:** Vấn đề/cơ hội nào thúc đẩy dự án?

### Bước 2 — Đọc tài liệu nguồn

- Đọc [.claude/templates/ba/BRD-template.md](.claude/templates/ba/BRD-template.md) — template chuẩn.
- Đọc [.claude/glossary/ba-terms-vi-en.md](.claude/glossary/ba-terms-vi-en.md) — đảm bảo dùng đúng thuật ngữ.
- Đọc [CLAUDE.md](CLAUDE.md) — nắm bối cảnh dự án VCM.
- Quét [ba/input/](ba/input/) nếu có tài liệu nghiệp vụ liên quan.

### Bước 3 — Delegate sang agent business-analyst

Gọi agent `business-analyst` với prompt rõ ràng bao gồm:
- Tên dự án/module: `$ARGUMENTS`
- Câu trả lời của người dùng từ Bước 1
- Yêu cầu sinh BRD đầy đủ theo template BRD chuẩn (Mục 1–10 + Checklist)
- Yêu cầu ưu tiên MoSCoW cho yêu cầu nghiệp vụ
- Yêu cầu vẽ sơ đồ As-Is / To-Be bằng Mermaid nếu có thông tin quy trình

### Bước 4 — Lưu kết quả

- Đặt tên file: `ba/process/BRD/BRD-VCM-<slug-kebab-case>-v1.0-<YYYY-MM-DD>.md`
- Tạo thư mục `ba/process/BRD/` nếu chưa tồn tại.
- Đảm bảo file có frontmatter YAML theo chuẩn ở [CLAUDE.md §8](CLAUDE.md#8-output-conventions).

## Quy tắc bắt buộc

- **Toàn bộ nội dung BRD bằng tiếng Việt nghiệp vụ chuẩn.**
- Thuật ngữ tiếng Anh đặt trong ngoặc đơn ở lần xuất hiện đầu: *Tiêu chí chấp nhận (Acceptance Criteria)*.
- Không bỏ qua các mục bắt buộc trong template. Nếu thiếu thông tin, ghi chú `{{CẦN_LÀM_RÕ}}` thay vì bịa đặt.
- Mỗi yêu cầu nghiệp vụ phải có mã `BR-VCM-NNN` và mức ưu tiên MoSCoW.
- Cuối tài liệu phải có **Checklist hoàn thiện** đầy đủ từ template.

## Sau khi hoàn thành

Báo cáo lại cho người dùng (bằng tiếng Việt):
1. Đường dẫn file BRD đã sinh.
2. Tóm tắt: số yêu cầu nghiệp vụ, số rủi ro, số giả định.
3. Các điểm `{{CẦN_LÀM_RÕ}}` cần stakeholder xác nhận trước khi chuyển sang `Review`.
