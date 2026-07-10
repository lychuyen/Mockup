---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
version: "0.1"
date: "2026-07-02"
status: "Draft"
document_type: "Bảng phân vai Người × Agent"
---

# Bảng Phân vai: Con người × Agent theo Hoạt động — TOSS

> Suy trực tiếp từ CLAUDE.md §0/§0.3/§5 + PHAN-CONG-ROLE-BA-v0.1.md (v0.2) §0/§2/§6 + REVIEW-APPROVAL-FLOW-v0.1.md. **Nguyên tắc gốc:** Human quyết định *WHAT*, Agent thực thi *HOW* (PHAN-CONG, phần mở đầu); agent phân rã + lắp ráp trung thực theo nguồn, không suy diễn (CLAUDE.md §0).
>
> Ký hiệu Người: **R** = thực hiện (Responsible), **A** = chịu trách nhiệm/phê duyệt (Accountable). Mức skill C/Đ/H/Q theo PHAN-CONG §1.

| Hoạt động | Người (vai trò · mức) | Agent (hỗ trợ) | Nguồn |
|---|---|---|---|
| Dẫn dắt phỏng vấn / khảo sát stakeholder | **R:** BA Lead (C), Senior BA (Đ); Mid (H), Junior/Intern (Q) — quan hệ tin tưởng, không delegate được | `ba-interviewer` (`/interview`): chỉ tạo bộ câu hỏi + khung ghi chép trước buổi | PHAN-CONG §0.1, §2.1; CLAUDE §0.3 |
| Ghi biên bản họp / format biên bản | **R:** Junior/Intern (Đ/H), Mid/Senior (Đ) | skill `/meeting-notes`, `meeting-synthesize`: format từ ghi chú thô/transcript | PHAN-CONG §0.2, §2.3, §6 |
| Phân tích As-Is / To-Be, gap analysis | **R:** Mid BA (H) thực hiện, Senior (Đ); **A:** BA Lead quyết định gap nào ưu tiên | `business-analyst`, `process-modeler` (`/asis-tobe`): phác thảo + diagram; phát hiện khoảng cách dựa trên tài liệu | PHAN-CONG §0.2, §0.3, §6 |
| Soạn BRD | **R:** Senior BA (Đ), Mid (H); **A:** BA Lead approve | `business-analyst` (`/brd`): soạn từ yêu cầu đã thu thập, dẫn nguồn | PHAN-CONG §2.1, §6; CLAUDE §5 |
| Viết SRS / phân rã FUNC-xxx | **R:** Senior BA (soạn SRS nháp §6); **A:** BA Lead approve | `srs-writer`: phân rã yêu cầu đã ghi thành FUNC/UC/AC/RTM — source-only | CLAUDE §5 (3a); PHAN-CONG §6 |
| User Story + Acceptance Criteria | **R:** Senior/Mid (Đ), Junior (H); **A:** BA Lead | `business-analyst` (`/userstory`): sinh story + AC | PHAN-CONG §2.1 |
| Data model / entity map / ERD khái niệm | **R:** Senior BA (Đ), Mid (H); **A:** BA Lead approve vào `sync/models/` | `data-modeler`: entity map + Mermaid ERD + từ điển dữ liệu | CLAUDE §5 (3b); PHAN-CONG §2.2, §4 |
| Vẽ luồng BPMN / sequence / state | **R:** Senior (Đ), Mid (H — nhiệm vụ As-Is/To-Be §6); **A:** BA Lead | `process-modeler`: sinh diagram Mermaid/draw.io theo nguồn | CLAUDE §5 (3c); PHAN-CONG §6 |
| Wireframe | **R:** Senior (Đ, final), Mid (Đ, nháp), Junior (H); **A:** BA Lead + stakeholder phân hệ | (viết tay `.md` — người chủ trì; agent hỗ trợ soạn theo nguồn) | PHAN-CONG §2.2, §6; REVIEW-APPROVAL §2 |
| Mockup / Prototype HTML | **R:** Senior/Mid (Đ), Junior (H); **A:** BA Lead; người **trình bày & đàm phán demo** với stakeholder | `gen-mockup`: dựng prototype tự chứa, `data-mat`/`data-src` | PHAN-CONG §0.3, §2.2, §6; CLAUDE §5 (4) |
| Review tài liệu (BRD/SRS/US) | **R:** peer reviewer theo loại (Senior là chính; Mid tham gia wireframe/SRS phân hệ); **A:** BA Lead phán xét chuyên môn + quyết định cuối | `ba-reviewer`, `requirement-validator`: tìm lỗi hình thức, mâu thuẫn, SMART/INVEST | REVIEW-APPROVAL §2; PHAN-CONG §0.3, §2.3 |
| Review mockup/prototype | **R:** Senior BA + 1 BA khác; **A:** BA Lead | `ui-reviewer`: audit coverage/traceability/component/ngôn ngữ | REVIEW-APPROVAL §2; CLAUDE §5 (5a) |
| **Approve tài liệu + promote vào `sync/`** | **A/R: BA Lead — DUY NHẤT** (Senior chỉ `[TEMP-APPROVED]` khi Lead vắng) | Agent chỉ chạy Quality Gate check trước để báo điều kiện — không bao giờ tự approve | REVIEW-APPROVAL §1, §6; CLAUDE §0.3, §0.5.2 |
| Export Word giao khách hàng | **R:** BA Lead (C), Senior/Mid (Đ), Junior (H); **A:** BA Lead **ký duyệt trước khi giao** | skill `export-word`: xuất docx QT02 tự mô tả | PHAN-CONG §2.3, §6 |
| Nhận sign-off stakeholder | **R/A:** BA Lead (ủy quyền pháp lý) | — (không delegate) | PHAN-CONG §0.1 |
| **Quyết định scope / Approve-Reject CR** | **A/R: BA Lead** (tác động phạm vi + timeline) | `business-analyst`: phân tích tác động CR, cross-ref tài liệu bị ảnh hưởng | PHAN-CONG §0.1, §0.3; CLAUDE §0.3 |
| **Chọn / đổi Document Workflow (P1–P6)** | **A/R: BA Lead** | Agent trình bày so sánh P1–P6 để lựa chọn, ghi nhận + log | CLAUDE §0.1, §0.3 |
| Ưu tiên MoSCoW | **A/R:** BA Lead cùng stakeholder (đánh đổi nghiệp vụ) | `requirement-validator`: audit MoSCoW đã gán | PHAN-CONG §0.1; CLAUDE §5 (5c) |
| Xác nhận thuật ngữ domain / glossary | **A:** BA Lead (domain expert xác nhận); **R:** mọi cấp nghiên cứu miền (Đ/H) | agent đề xuất bảng thuật ngữ, chờ confirm mới ghi | PHAN-CONG §0.1, §2.3 |
| Điền tên nhân sự / ngày roadmap / phân công phân hệ | **A/R: BA Lead** (biết context tổ chức) | Agent chỉ đưa hướng dẫn thao tác (câu §0.3), không tự điền | PHAN-CONG §0.1; CLAUDE §0.3 |
| Quản lý NKLR (nhật ký thay đổi yêu cầu) | **R:** BA Lead (C), Senior (Đ) | Agent hỗ trợ soạn entry theo template | PHAN-CONG §2.3 |
| Tổng hợp tồn đọng / nhắc việc / tracker | **A:** BA Lead tiếp nhận & quyết | `project-coordinator`: tổng hợp OID/action item/cờ từ nguồn đã ghi, duy trì `deliverable-status.json` — không tự tạo task | CLAUDE §5 (cross-cutting), §0.5.3 |
| Đánh giá & nâng level BA | **A/R: BA Lead** | — | PHAN-CONG §0.1, §1 |
| Handoff sang DEV (SRS approved + entity map + mockup) | **A:** BA Lead (chỉ artifact đã Approve mới handoff) | DEV pipeline: `02-sa` → `03-coder` → … → `code-reviewer` tiếp nhận | CLAUDE §5 (Handoff to DEV) |
