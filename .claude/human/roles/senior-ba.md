---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
role: "Senior BA"
version: "0.1"
date: "2026-07-02"
status: "Draft"
document_type: "Chân dung vai trò con người"
---

# Chân dung Vai trò — Senior BA

> **Người đang giữ vai trò:** *(chưa điền — chờ BA Lead phân công vào ma trận §3 của PHAN-CONG-ROLE-BA-v0.1.md)*.

## a) Chân dung & Phạm vi trách nhiệm

Theo PHAN-CONG-ROLE-BA-v0.1.md (v0.2):

- **Mức skill "Đ — Độc lập" trên gần như toàn bộ ma trận** (§2.1–2.3): tự thực hiện; output cần BA Lead review trước khi publish vào `sync/`. Áp dụng cho: `/interview`, `/stakeholder`, `/asis-tobe`, `/brd`, `/userstory`, `/meeting-notes`, `gen-mockup`, wireframe, `/data-model`, `export-word`, quản lý NKLR, review tài liệu (`ba-reviewer`), nghiên cứu miền, ghi biên bản họp.
- Trong quy trình phối hợp (§6): **Soạn SRS nháp, Wireframe final, BRD nháp, Userstory** — nhận đầu vào từ Mid BA, chuyển lên BA Lead review & approve.
- **Peer reviewer chính** theo REVIEW-APPROVAL-FLOW-v0.1.md §2: peer review BRD (không phải tác giả), SRS chương chung (01, 02, 04, 05), Mockup, Quy trình nội bộ (`quy-trinh/`).
- **Quyền workspace** (§4): W trên hầu hết `workspace/drafts/` (phan-tich, brd, srs, wireframe, mockup) + `workspace/input/` (meeting-notes, domain-knowledge) + `sync/requirements/quan-ly-yeu-cau/`, `sync/models/`, `sync/output/`; R trên `sync/requirements/{brd,srs}` và `drafts/quy-trinh/` (không có quyền Approve).

## b) Thẩm quyền quyết định

- **Không có quyền Approve chính thức** — BA Lead là người duy nhất Approve và promote vào `sync/` (REVIEW-APPROVAL §1).
- **Khi BA Lead vắng:** Senior BA quyết định tạm thời, ghi `[TEMP-APPROVED]` (REVIEW-APPROVAL §6). Quy trình phê duyệt thay thế đầy đủ vẫn là câu hỏi mở — §7 mục 3 PHAN-CONG: *(chưa có — chờ BA Lead quyết)*.
- Quản lý NKLR ở mức Đ (PHAN-CONG §2.3) — cần BA Lead review trước khi chốt.

## c) Phân hệ phụ trách

- *(chưa điền — chờ BA Lead phân công)*. Khuyến nghị đã ghi trong nguồn: **Senior BA chủ trì ≤ 2 phân hệ** (PHAN-CONG §3, lưu ý).

## d) Làm việc với agent nào (map CLAUDE.md §5)

| Agent | Quan hệ với Senior BA |
|---|---|
| **business-analyst** | Công cụ mặc định cho BRD/SRS/gap analysis/CR — Senior BA dùng độc lập (mức Đ), tự chịu trách nhiệm nội dung trước khi trình BA Lead |
| **srs-writer** | Soạn SRS nháp / đặc tả chức năng FUNC-xxx (§6: "Soạn SRS nháp" thuộc Senior BA) |
| **data-modeler / process-modeler** | `/data-model` mức Đ; phác thảo As-Is/To-Be, BPMN — dùng độc lập |
| **gen-mockup** | Dựng mockup/prototype mức Đ; wireframe final (§6) |
| **ba-reviewer / requirement-validator** | Chạy khi thực hiện peer review tài liệu của BA khác (mức Đ, §2.3) — agent tìm lỗi hình thức, Senior BA phán xét chuyên môn (PHAN-CONG §0.3) |
| **ba-interviewer** (`/interview`) | Tạo bộ câu hỏi mức Đ; việc **dẫn dắt phỏng vấn** vẫn là của con người (PHAN-CONG §0.1) |
| **export-word** (skill) | Xuất Word mức Đ — bản giao khách vẫn cần BA Lead ký duyệt (§6) |

## e) Tình huống agent phải trả việc về người (CLAUDE.md §0.3)

- Phỏng vấn stakeholder: *"Phỏng vấn cần quan hệ tin tưởng trực tiếp — bạn tiến hành, tôi hỗ trợ bằng `/interview` để tạo bộ câu hỏi trước."*
- Khi output cần lên `sync/`: agent nhắc rằng Approve là thẩm quyền BA Lead (*"Approve tài liệu là thẩm quyền của BA Lead…"*) — Senior BA chuyển tài liệu lên BA Lead, không tự promote.

## f) Nguồn trích

1. `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` (v0.2, 2026-06-04) — §1, §2.1–2.3, §3, §4, §6, §7.
2. `CLAUDE.md` (v2.14) — §0.3, §5.
3. `ba/workspace/drafts/quy-trinh/REVIEW-APPROVAL-FLOW-v0.1.md` (v0.1) — §1, §2, §6.
