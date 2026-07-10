---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
role: "Mid BA"
version: "0.1"
date: "2026-07-02"
status: "Draft"
document_type: "Chân dung vai trò con người"
---

# Chân dung Vai trò — Mid BA

> **Người đang giữ vai trò:** *(chưa điền — chờ BA Lead phân công vào ma trận §3 của PHAN-CONG-ROLE-BA-v0.1.md)*.

## a) Chân dung & Phạm vi trách nhiệm

Theo PHAN-CONG-ROLE-BA-v0.1.md (v0.2), Mid BA có 2 mức skill tùy nhóm:

- **Mức "Đ — Độc lập"** (tự làm, BA Lead review trước khi publish): `/userstory`, `/meeting-notes`, `gen-mockup`, wireframe (viết tay `.md`), `export-word`, nghiên cứu miền (`domain-knowledge/`), ghi biên bản họp (§2.1–2.3).
- **Mức "H — Có hỗ trợ"** (làm dưới hướng dẫn Senior/Lead, output review trực tiếp): `/interview`, `/stakeholder`, `/asis-tobe`, `/brd`, `/gap-analysis`, `/trace`, `/data-model`, review tài liệu (§2.1–2.3).
- Trong quy trình phối hợp (§6): **Phân tích As-Is/To-Be, Wireframe nháp, Mockup (gen-mockup)** — nhận biên bản từ Intern/Junior, chuyển kết quả lên Senior BA.
- **Quyền workspace** (§4): W trên `input/{meeting-notes,domain-knowledge}`, `drafts/phan-tich/`, `drafts/wireframe/`, `drafts/mockup/`; W (H — có hướng dẫn) trên `drafts/brd/`, `drafts/srs/`, `sync/models/`; RO trên `sync/requirements/`, `sync/output/`, `drafts/quy-trinh/`.
- Peer review theo REVIEW-APPROVAL-FLOW §2: tham gia review **Wireframe** (Mid/Senior BA + 1 BA khác) và SRS đặc tả phân hệ (BA cùng nhóm + BA phân hệ khác).

## b) Thẩm quyền quyết định

- **Không có quyền Approve, không có quyền publish vào `sync/`** — mọi output qua BA Lead (REVIEW-APPROVAL §1; PHAN-CONG §4).
- Nguyên tắc leo thang (§1): Mid → Senior theo thời gian và sản phẩm được nghiệm thu; BA Lead xác nhận nâng cấp.

## c) Phân hệ phụ trách

- *(chưa điền — chờ BA Lead phân công)*. Khuyến nghị đã ghi trong nguồn: **Mid BA chủ trì ≤ 1 phân hệ** (PHAN-CONG §3, lưu ý).

## d) Làm việc với agent nào (map CLAUDE.md §5)

| Agent | Quan hệ với Mid BA |
|---|---|
| **gen-mockup** | Dựng mockup/prototype mức Đ — mảng thực thi chính của Mid BA (§6) |
| **process-modeler** | Vẽ luồng As-Is/To-Be (nhiệm vụ §6) — dùng dưới hướng dẫn (mức H cho `/asis-tobe`) |
| **business-analyst** | Dùng cho phân tích/BRD ở mức H — có Senior/Lead hướng dẫn, review trực tiếp |
| **srs-writer / data-modeler** | Mức H (`/data-model` H; SRS drafts W-có-hướng-dẫn §4) |
| **ba-interviewer** (`/interview`) | Mức H — tạo bộ câu hỏi dưới hướng dẫn; dẫn dắt phỏng vấn là việc của con người (PHAN-CONG §0.1) |
| **export-word** (skill) | Xuất Word mức Đ — bản giao khách cần BA Lead ký duyệt (§6) |

## e) Tình huống agent phải trả việc về người (CLAUDE.md §0.3)

- Phỏng vấn stakeholder: *"Phỏng vấn cần quan hệ tin tưởng trực tiếp — bạn tiến hành, tôi hỗ trợ bằng `/interview` để tạo bộ câu hỏi trước."*
- Khi gặp quyết định phạm vi/nghiệp vụ trong lúc phân tích: agent trả lời *"Đây là quyết định nghiệp vụ — BA Lead cần xem xét và quyết định…"* — Mid BA chuyển câu hỏi lên BA Lead, không tự quyết.

## f) Nguồn trích

1. `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` (v0.2, 2026-06-04) — §1, §2.1–2.3, §3, §4, §6.
2. `CLAUDE.md` (v2.14) — §0.3, §5.
3. `ba/workspace/drafts/quy-trinh/REVIEW-APPROVAL-FLOW-v0.1.md` (v0.1) — §1, §2.
