---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
role: "Junior BA"
version: "0.1"
date: "2026-07-02"
status: "Draft"
document_type: "Chân dung vai trò con người"
---

# Chân dung Vai trò — Junior BA

> **Người đang giữ vai trò:** *(chưa điền — chờ BA Lead phân công vào ma trận §3 của PHAN-CONG-ROLE-BA-v0.1.md)*.

## a) Chân dung & Phạm vi trách nhiệm

Theo PHAN-CONG-ROLE-BA-v0.1.md (v0.2):

- **Mức "Đ — Độc lập":** `/meeting-notes` (format biên bản họp), nghiên cứu miền (`domain-knowledge/`), ghi biên bản họp (§2.1, §2.3).
- **Mức "H — Có hỗ trợ":** `/userstory`, `gen-mockup`, wireframe (viết tay `.md`), `export-word` (§2.1–2.3).
- **Mức "Q — Quan sát"** (xem và học, chưa tự thực hiện): `/interview`, `/asis-tobe` (§2.1).
- **Không áp dụng (—):** `/stakeholder`, `/brd`, `/gap-analysis`, `/trace`, `/data-model`, quản lý NKLR, review tài liệu (§2.1–2.3).
- Trong quy trình phối hợp (§6): **Ghi biên bản, Domain research** — điểm khởi đầu của chuỗi, chuyển kết quả cho Mid BA phân tích.
- **Quyền workspace** (§4): W trên `input/{meeting-notes,domain-knowledge}`, `drafts/phan-tich/` (H — có hướng dẫn), `drafts/wireframe/` (H), `drafts/mockup/` (H); RO trên `drafts/brd/`, `drafts/srs/`, `drafts/quy-trinh/`, `sync/models/`; không truy cập `sync/requirements/`, `sync/output/`.

## b) Thẩm quyền quyết định

- **Không có thẩm quyền approve/publish nào** — mọi output cần review trực tiếp của Senior/Lead (định nghĩa mức H, §1).
- Nguyên tắc leo thang (§1): Junior → Mid theo thời gian và sản phẩm được nghiệm thu; BA Lead xác nhận nâng cấp.

## c) Phân hệ phụ trách

- *(chưa điền — chờ BA Lead phân công)*. Ma trận §3 chỉ có cột "BA Chủ trì / BA Hỗ trợ" — Junior BA thường ở vai hỗ trợ, nhưng phân công cụ thể chưa có trong nguồn.

## d) Làm việc với agent nào (map CLAUDE.md §5)

| Agent / skill | Quan hệ với Junior BA |
|---|---|
| **/meeting-notes** (skill) | Công cụ chính mức Đ — format ghi chú họp thô thành biên bản chuẩn (PHAN-CONG §0.2) |
| **gen-mockup** | Mức H — dựng mockup dưới hướng dẫn Senior/Lead |
| **business-analyst** (`/userstory`) | Mức H — tạo user story + AC dưới hướng dẫn, output review trực tiếp |
| **export-word** (skill) | Mức H — xuất Word dưới hướng dẫn |
| **ba-interviewer / process-modeler** | Mức Q — quan sát phiên làm việc, chưa tự thực hiện |

## e) Tình huống agent phải trả việc về người (CLAUDE.md §0.3)

- Phỏng vấn stakeholder: Junior BA ở mức Q (quan sát) — việc dẫn dắt phỏng vấn thuộc con người có thẩm quyền (PHAN-CONG §0.1); agent chỉ hỗ trợ tạo bộ câu hỏi qua `/interview` cho người chủ trì.
- Mọi quyết định nghiệp vụ/approve phát sinh: agent trả về BA Lead (*"Đây là quyết định nghiệp vụ — BA Lead cần xem xét và quyết định…"*).

## f) Nguồn trích

1. `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` (v0.2, 2026-06-04) — §0.2, §1, §2.1–2.3, §3, §4, §6.
2. `CLAUDE.md` (v2.14) — §0.3, §5.
