---
name: term-check
description: Tra cứu / kiểm tra thuật ngữ chuyên ngành hàng không trong domain-knowledge + glossary của TOSS. Báo có/không định nghĩa, trỏ nguồn (file:line); hoặc audit độ phủ thuật ngữ của một tài liệu. Dùng khi người dùng hỏi "X là gì", "kiểm tra từ vựng/thuật ngữ", "thuật ngữ này có trong glossary chưa", hoặc cần soát thuật ngữ một tài liệu.
metadata:
  version: "1.0.0"
---

# Skill: Kiểm tra / tra cứu thuật ngữ chuyên ngành

> **Bám domain-knowledge (theo feedback đã thống nhất):** tra thuật ngữ **chỉ dựa** `ba/workspace/input/domain-knowledge/` + glossary. Trả lời **ngắn gọn**; **không có thì báo "không tìm thấy"** — KHÔNG bịa định nghĩa từ kiến thức ngoài. Nguồn FAA/ICAO/IATA chỉ là **tham khảo gợi ý ở mức overview** khi được hỏi.

## 1. Khi nào dùng
- Người dùng hỏi **"X là gì"**, "thuật ngữ Y nghĩa gì".
- "Kiểm tra từ vựng/thuật ngữ", "Y có trong glossary chưa".
- Soát **độ phủ thuật ngữ** của một tài liệu (BRD/SRS…) so với glossary.

## 2. Quy trình
1. **Chạy script tra cứu** (gộp glossary + toàn bộ domain-knowledge):
   ```powershell
   # Tra 1 hoặc nhiều thuật ngữ
   .\.claude\skills\term-check\scripts\find-term.ps1 -Term "AOG","loadsheet","briefing"
   # Audit độ phủ thuật ngữ của 1 tài liệu (trích viết tắt [A-Z]{2,6} → từ nào THIẾU trong glossary)
   .\.claude\skills\term-check\scripts\find-term.ps1 -AuditFile ba/workspace/drafts/srs/.../quan-ly-tau-bay.md
   ```
   Script báo: **có/chưa có trong glossary** + **số lần xuất hiện** + **file:line** (tối đa 5 dòng/từ).
2. **Trả lời người dùng (ngắn gọn, tiếng Việt) — theo 3 LỚP:**
   - **Lớp 1 — Có định nghĩa (glossary)** → trích đúng nội dung glossary + trỏ `toss-glossary-v0.1.md:<line>`.
   - **Lớp 1b — Chưa định nghĩa nhưng có xuất hiện trong nội dung** → nêu cách dùng theo ngữ cảnh + trỏ file nguồn (FAA/ICAO/IATA doc) ở mức overview; gắn cờ "chưa có entry riêng".
   - **Lớp 2 — Không có trong knowledge base → TÌM TRONG DANH MỤC LINK.** Script tự động tra `*-links.md` (ffac/eufalda/iata…) và liệt kê **tài liệu liên quan** (tên + URL). Báo: "Không có trong KB, nhưng có N tài liệu liên quan trong danh mục link: …".
   - **Lớp 3 — Không đâu có** → **"Không tìm thấy trong domain-knowledge lẫn danh mục link"** và dừng.
3. **Đề xuất bổ sung glossary** nếu thuật ngữ quan trọng mà chưa có entry (hỏi người dùng trước khi thêm).
4. **Audit mode:** liệt kê viết tắt **THIẾU** trong glossary → đề xuất bổ sung để đảm bảo "mọi thuật ngữ trong SRS/BRD phải có entry" (quy tắc glossary).

## 3. Lưu ý
- Khớp **đúng từ (word-boundary)**; viết tắt khớp **phân biệt hoa/thường** (chế độ audit) để tránh nhiễu chuỗi con trong tài liệu tiếng Anh (vd "EA" không còn khớp trong "create").
- **Knowledge base vs Danh mục link** là 2 lớp tách biệt: file `*-links.md` (ffac/eufalda/iata) **không** tính vào "mentions" knowledge base, mà là **lớp tra cứu dự phòng (Lớp 2)** khi KB không có.
- Audit mode in thêm cột **Link** = số tài liệu liên quan trong danh mục link → gợi ý có thể tải về (skill `crawl-pdf`) khi cần định nghĩa đầy đủ.
- Quyết định thêm/sửa glossary là **của người dùng** (CLAUDE.md §0) — agent đề xuất, không tự ý.

## 4. Cấu trúc Knowledge Base (đọc/truy xuất tiết kiệm token)
- **`domain-knowledge/INDEX.md`** = master index — đọc TRƯỚC để biết tài liệu/mục cần, rồi mở đúng file.
- **Tài liệu lớn đã chia theo nội dung:** `<ten>.md` (mục lục) + `<ten>_parts/sec-NN-*.md` (từng mục) + `_parts/_full.md` (bản đầy đủ, dự phòng). Grep/term-check trỏ thẳng file mục nhỏ → đọc ít token.
  - ICAO Annex chia theo **CHAPTER/APPENDIX** (sạch); FOCA/DG theo **mục đánh số** (sạch); CFR 14 (Part 91/121/65) chia theo **Subpart** nhưng **thô** (layout 2 cột làm lẫn TOC/thứ tự) — khi cần bản chuẩn đọc `_parts/_full.md`.
- `find-term.ps1` bỏ qua `_full.md` + `INDEX.md` để khỏi trùng kết quả.

## 5. Tài sản
- `scripts/find-term.ps1` — tra cứu thuật ngữ (glossary + domain-knowledge, bỏ `_full`/`INDEX`/`-links`) + audit độ phủ + lớp link. (BOM cho PS 5.1.)
- `scripts/split-kb-by-content.ps1` — **chia tài liệu lớn theo nội dung** (CFR Subpart / Annex Chapter / mục đánh số) + sinh index từng tài liệu; giữ `_full.md`.
- Master index: `domain-knowledge/INDEX.md` (chạy lại generator khi thêm/chia tài liệu).
- Glossary chính: `domain-knowledge/toss-glossary-v0.1.md`; thuật ngữ BA song ngữ: `.claude/glossary/ba-terms-vi-en.md`.
