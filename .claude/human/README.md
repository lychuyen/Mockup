# .claude/human/ — Chân dung Vai trò Con người trong Dự án TOSS

> **Mục đích mới (từ 2026-07-02, quyết định BA Lead):** thư mục này KHÔNG còn là mirror tiếng Việt của agent definitions. Nay nó chứa **chân dung vai trò của CON NGƯỜI** trong dự án — ai quyết định gì, phụ trách phân hệ nào, làm việc với agent nào, và khi nào agent phải trả việc về cho người.
>
> Mirror cũ được giữ tạm tại [`_legacy/`](_legacy/README.md) — ngưng cập nhật, chờ BA Lead duyệt xóa.

---

## 1. Cấu trúc

```
.claude/human/
├── README.md                        # File này — mục đích + quy tắc cập nhật
├── BANG-PHAN-VAI-NGUOI-AGENT.md     # Bảng tổng: hoạt động × Người (R/A) × Agent (hỗ trợ)
├── roles/                           # Mỗi vai trò người = 1 file chân dung
│   ├── ba-lead.md                   # BA Lead — thẩm quyền approve/quyết định cao nhất
│   ├── senior-ba.md                 # Senior BA — thực hiện độc lập, peer reviewer chính
│   ├── mid-ba.md                    # Mid BA — độc lập một phần, có hướng dẫn
│   ├── junior-ba.md                 # Junior BA — làm dưới hướng dẫn trực tiếp
│   └── intern.md                    # Intern — quan sát + tác vụ hỗ trợ
└── _legacy/                         # Mirror VI cũ (ngưng cập nhật 2026-07-02)
```

## 2. Nguồn của nội dung (truy vết — CLAUDE.md §0)

Mọi câu trong `roles/` và `BANG-PHAN-VAI-NGUOI-AGENT.md` đều trích từ nguồn ĐÃ GHI:

| Nguồn | Cung cấp |
|---|---|
| `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` (v0.2) | Ma trận Role × Skill (§2), Phân hệ × Nhân sự (§3), Workspace × Role (§4), ranh giới Human vs Agent (§0), quy trình phối hợp (§6) |
| `CLAUDE.md` §0 / §0.1 / §0.3 / §0.4 | Trách nhiệm suy diễn thuộc con người; chọn workflow; các câu agent phải trả việc; thiết lập danh tính |
| `CLAUDE.md` §5 | Hai pipeline agent (BA + DEV) — để map vai trò người ↔ agent |
| `ba/workspace/drafts/quy-trinh/REVIEW-APPROVAL-FLOW-v0.1.md` | Ai review loại tài liệu nào; tiêu chí approve; escalation khi BA Lead vắng |

## 3. Quy tắc cập nhật (MANDATORY)

1. **Khi ma trận role đổi** (`PHAN-CONG-ROLE-BA` bump version, phân công nhân sự §3 được điền, hoặc REVIEW-APPROVAL-FLOW đổi) → cập nhật file role tương ứng ở đây **trong cùng task**, cite phiên bản nguồn mới.
2. **Agent KHÔNG tự thêm người, thêm quyền, hay suy diễn trách nhiệm** (CLAUDE.md §0). Tên nhân sự chưa được BA Lead điền vào ma trận thì ghi rõ *(chưa điền — chờ BA Lead)*. Không bịa thẩm quyền không có trong nguồn.
3. **Thay đổi thẩm quyền / phân công là quyết định của BA Lead** — agent chỉ ghi nhận sau khi có quyết định, và log vào `.claude/sync/SYNC-LOG.md`.
4. Thư mục này **không còn thuộc cơ chế mirror** của SYNC-PROTOCOL (chỉ cặp `CLAUDE.md ↔ HUMAN.md` còn mirror). Nội dung ở đây là tiếng Việt đơn ngữ, cho người đọc.
