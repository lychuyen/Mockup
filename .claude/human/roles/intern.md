---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
role: "Intern"
version: "0.1"
date: "2026-07-02"
status: "Draft"
document_type: "Chân dung vai trò con người"
---

# Chân dung Vai trò — Intern

> **Người đang giữ vai trò:** *(chưa điền — chờ BA Lead phân công vào ma trận §3 của PHAN-CONG-ROLE-BA-v0.1.md)*.

## a) Chân dung & Phạm vi trách nhiệm

Theo PHAN-CONG-ROLE-BA-v0.1.md (v0.2):

- **Mức "H — Có hỗ trợ":** `/meeting-notes`, nghiên cứu miền (`domain-knowledge/`), ghi biên bản họp (§2.1, §2.3).
- **Mức "Q — Quan sát"** (xem và học trong phiên làm việc): `/interview`, `/userstory`, `gen-mockup`, wireframe (§2.1–2.2).
- **Không áp dụng (—):** `/stakeholder`, `/asis-tobe`, `/brd`, `/gap-analysis`, `/trace`, `/data-model`, `export-word`, quản lý NKLR, review tài liệu (§2.1–2.3).
- Trong quy trình phối hợp (§6): cùng Junior BA đảm nhận **Ghi biên bản, Domain research** — điểm khởi đầu chuỗi phối hợp.
- **Quyền workspace** (§4): W trên `input/meeting-notes/`; `input/domain-knowledge/` ghi W (RO) theo ma trận; RO trên `drafts/phan-tich/`, `drafts/wireframe/`, `drafts/mockup/`; không truy cập `drafts/brd/`, `drafts/srs/`, `drafts/quy-trinh/` và toàn bộ `sync/`.

## b) Thẩm quyền quyết định

- **Không có thẩm quyền quyết định nào** trong các ma trận nguồn.
- **Câu hỏi mở đã ghi trong nguồn (PHAN-CONG §7, mục 4):** *"Intern có được dùng Claude Code CLI tự do hay cần giám sát?"* — người quyết định: BA Lead — trạng thái: *(chưa có)*.

## c) Phân hệ phụ trách

- *(chưa điền — chờ BA Lead phân công)*. Nguồn không ghi Intern chủ trì phân hệ nào.

## d) Làm việc với agent nào (map CLAUDE.md §5)

| Agent / skill | Quan hệ với Intern |
|---|---|
| **/meeting-notes** (skill) | Mức H — format biên bản họp dưới hướng dẫn |
| **ba-interviewer / business-analyst / gen-mockup** | Mức Q — quan sát người khác dùng trong phiên làm việc, chưa tự thực hiện |

## e) Tình huống agent phải trả việc về người (CLAUDE.md §0.3)

- Mọi tác vụ ngoài phạm vi H/Q của Intern (BRD, SRS, review, approve, xuất bản…): agent không thực hiện theo yêu cầu của Intern mà trả về đúng cấp có thẩm quyền — tối thượng là BA Lead (*"Approve tài liệu là thẩm quyền của BA Lead…"*; CLAUDE.md §0.4.4: khi chưa xác lập vai trò, chỉ tác vụ đọc/phân tích được phép).

## f) Nguồn trích

1. `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` (v0.2, 2026-06-04) — §1, §2.1–2.3, §3, §4, §6, §7 (mục 4).
2. `CLAUDE.md` (v2.14) — §0.3, §0.4, §5.
