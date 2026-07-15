---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Tracking — kéo & đánh giá nội dung từ nhánh GitLab BA-Review"
version: "0.1"
date: "2026-07-15"
status: "Active"
---

# Theo dõi kéo & đánh giá nội dung từ nhánh GitLab `BA-Review`

> **Mục đích:** nhánh `BA-Review` trên GitLab (`toss-document.git`) là nơi tiếp nhận nội dung `ba/sync/` mới/cập nhật để **đánh giá trước khi công bố chính thức**. Nhánh `main` chỉ nhận nội dung đã đánh giá và được BA Lead xác nhận "ổn". File này là sổ theo dõi từng đợt kéo — nguồn, kết quả đánh giá, trạng thái, và khi nào đẩy lên `main`.

## Quy trình (BA Lead xác nhận 2026-07-15)

1. **Kéo:** `git fetch gitlab BA-Review`, so `gitlab/BA-Review` với `gitlab/main` (hoặc `main` local qua nhánh mirror `fix-structure`) để xác định file mới/thay đổi.
2. **Đánh giá — 2 lớp:**
   - **QA hình thức** (nhanh, luôn chạy): link `.md`/ảnh hỏng, frontmatter thiếu/sai, `INDEX.md`/`CATALOG.md` không khớp file thực tế trong thư mục, fence Mermaid chưa đóng, mojibake.
   - **Đánh giá nội dung sâu** (spawn 2 agent chuyên trách): `ba-reviewer` (logic gap, thuật ngữ lệch, AC thiếu, giả định ẩn, văn phong) + `requirement-validator` (SMART/INVEST/MoSCoW, xung đột, trùng lặp, khoảng trống coverage).
3. **Ghi vào bảng theo dõi bên dưới** — 1 dòng / đợt kéo, liệt kê file thay đổi + trạng thái từng file (hoặc trạng thái chung nếu cả đợt đồng nhất).
4. **Trạng thái:** `Ổn` (qua cả 2 lớp đánh giá, không có finding nghiêm trọng) / `Cần sửa` (có finding, đã/đang sửa) / `Chờ BA Lead quyết định` (finding cần phán đoán nghiệp vụ, không phải agent tự quyết — CLAUDE.md §0).
5. **Đẩy lên `main`:** CHỈ với nội dung `Ổn`. **Luôn hỏi xác nhận BA Lead qua AskUserQuestion trước khi push** — không tự động hóa bước này (quyết định BA Lead 2026-07-15, khác với đánh giá có thể chạy tự động). Sau khi đẩy, cập nhật cột "Đẩy main".
6. **Cơ chế push** giống hệt cơ chế `fix-structure` đã dùng từ 2026-07-13 (xem `.claude/sync/SYNC-LOG.md`): GitLab là repo mirror riêng, gốc `ba/sync/` không tiền tố — không rebase/merge trực tiếp theo lịch sử `main` (monorepo) với lịch sử GitLab (khác gốc hoàn toàn).

## Bảng theo dõi

| Đợt | Ngày | Nguồn (commit `BA-Review`) | File/module thay đổi | QA hình thức | Đánh giá sâu | Trạng thái | Đẩy main (commit) |
|---|---|---|---|---|---|---|---|
| 1 | 2026-07-15 | Khởi tạo — `BA-Review` fast-forward khớp `main` (`d5909c6`→`6436b89`) | *(không có nội dung mới — nhánh vừa được đồng bộ ngang `main` lúc thiết lập quy trình này)* | — | — | Baseline | — |

## Ghi chú phạm vi

- Đây là quy trình cho nội dung `ba/sync/` (bàn giao GitLab) — không áp dụng cho `ba/workspace/` (nháp cá nhân, không qua review GitLab).
- Chưa rõ ai là người commit vào `BA-Review` trên GitLab (BA team member khác, hay chính BA Lead) — khi có đợt kéo đầu tiên thực sự có nội dung mới, cần xác nhận lại nguồn để ghi chính xác vào cột "Nguồn".
- Kế thừa đề xuất bỏ ngỏ từ `.claude/sync/SYNC-LOG.md` 2026-07-13 ("BA Lead reviews human-authored sync/ docs → publish to GitLab" workflow) — file này là bước hiện thực hóa đầu tiên của đề xuất đó.

---

*v0.1 — 2026-07-15: khởi tạo quy trình + file theo dõi, theo yêu cầu BA Lead.*
