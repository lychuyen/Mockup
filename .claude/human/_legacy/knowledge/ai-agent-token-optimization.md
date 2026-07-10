---
name: ai-agent-token-optimization
description: Chiến lược tối ưu token cho Claude Agent trong VS Code (Roo Code, Continue, agent tự viết) — prompt caching, RAG/chọn context, session hygiene, quy tắc context theo vai trò. Bao gồm bảng đánh giá mức độ phù hợp và kế hoạch triển khai 4 tầng.
source: Tổng hợp phương pháp + đánh giá thực tế cho agentic coding workflow, 2026-06-03
version: "1.0"
date: "2026-06-03"
---

> Bản gốc (AGENTS scope, tiếng Anh): `.claude/knowledge/ai-agent-token-optimization.md`. Đồng bộ theo [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md).

# Tối ưu Token cho AI Agent — VS Code Agentic Coding (bản tiếng Việt)

Tài liệu tham chiếu cho người xây dựng hoặc vận hành Claude agent trong VS Code (Roo Code, Continue, agent tự viết). Luồng dữ liệu cốt lõi: agent đọc codebase (input lớn) → suy nghĩ Chain-of-Thought (output dài) → sửa file. Mọi chiến lược đều được đánh giá theo đặc thù này.

---

## Bảng đánh giá mức độ phù hợp

| Phương pháp | Mức độ | Đánh giá cho VS Code agent | Cách triển khai thực tế |
|---|---|---|---|
| **Prompt Caching** | 🟢 Bắt buộc | Cực kỳ quan trọng. Cùng codebase hỏi đi hỏi lại nhiều lần. Không có cache → mỗi tin nhắn đọc lại toàn bộ file → chi phí tăng theo cấp số nhân. | Dùng extension hỗ trợ Anthropic cache (vd Roo Code). System prompt tự chèn điểm đánh dấu cache ở cấu trúc thư mục. |
| **RAG / Chọn context** | 🟢 Bắt buộc | Agent không thể và không nên nạp cả nghìn file. Cần lọc thông minh để chỉ gửi file liên quan đến tính năng đang làm. | Dùng `@filename` / `@codebase` trong extension. Tạo `.aiignore` để chặn thư mục rác (node_modules, build). |
| **Prompt tiếng Anh** | 🟢 Rất nên dùng | Code, thư viện, log lỗi đều tiếng Anh. Lệnh tiếng Anh giúp phân tích code mượt hơn, tiết kiệm 30–50% token so với tiếng Việt. | Ra lệnh cho agent bằng tiếng Anh ("Refactor this function to follow DRY principles"). |
| **Ép định dạng đầu ra (JSON/XML)** | 🟡 Chọn lọc | Agent cần trả ra code thô hoặc patch XML có cấu trúc. Ép JSON thuần có thể làm giảm khả năng viết code tự nhiên. | Để extension tự xử lý định dạng. Roo Code đã tối ưu XML để Claude chỉ xuất phần cần sửa, không viết lại cả file. |
| **Summary Anchoring** | 🟡 Chọn lọc | Trong phiên dài, lịch sử chat phình to. Tóm tắt giúp giảm token nhưng có nguy cơ agent "quên" ràng buộc logic được dặn từ đầu. | Chủ động Clear Chat + mở cửa sổ mới khi chuyển tính năng. Không dùng 1 cửa sổ chat cho cả ngày. |
| **LLMLingua / Nén prompt** | 🔴 Không dùng | Thuật toán nén tỉa từ theo ngôn ngữ tự nhiên. Áp vào code → có thể xóa nhầm ký tự đặc biệt, cú pháp, làm hỏng logic trước khi gửi cho Claude. | Không dùng cho tác vụ code / đọc hiểu codebase. |

---

## Tầng 1 — Nền tảng bắt buộc (Ngày 1)

### Đặt điểm neo cache đúng chỗ

Thứ tự context trong mỗi request quyết định tỉ lệ cache hit:

```
[SYSTEM — cache_control: ephemeral]
  └─ Role + rules + project conventions   ← tái dùng nhiều nhất
[TOOLS — cache_control: ephemeral]
  └─ Tool definitions                      ← ít thay đổi
[HUMAN — cache_control: ephemeral]
  └─ Codebase snapshot (file tree + file chính)
[HUMAN — KHÔNG cache]
  └─ Câu hỏi/yêu cầu cụ thể của lượt hiện tại
```

> Điểm neo phải đặt ở **ranh giới "ít thay đổi / hay thay đổi"**. Đặt sai (vd. cache cả phần user message) → cache miss 100%.

### Thiết lập `.aiignore` từ ngày đầu

```
node_modules/   dist/   build/   .git/
*.lock   *.map   *.min.js   coverage/
logs/
```

**Riêng VTX:** thêm `ba/input/pms-quan-tri-san-xuat/` (~122 bài tham khảo — đã đánh dấu "không phải yêu cầu" trong SRS index; là context thừa thuần túy với tác vụ code).

**Riêng TOSS:** hiện không có tập tham khảo lớn tương tự.

---

## Tầng 2 — Chiến lược theo loại tác vụ

| Loại tác vụ | Chiến lược context | Lý do |
|---|---|---|
| **Viết tính năng mới** | Spec + interface liên quan + 1–2 file ví dụ | Tính năng mới ít phụ thuộc ngược |
| **Debug / fix bug** | Error log + file lỗi + file gọi nó + test | Stack trace là context tốt nhất |
| **Refactor** | Toàn bộ module cần refactor + public interface | Agent cần thấy "cái toàn thể" |
| **Review / audit** | Gửi diff/patch thay vì toàn file | `git diff HEAD` thường < 5% kích thước file |

---

## Tầng 3 — Vòng đời phiên làm việc (Session hygiene)

```
Bắt đầu tính năng mới
  → Mở chat mới  (không kéo lịch sử cũ)
  → Anchor: paste CLAUDE.md / CONTRIBUTING.md ngắn vào system
  → @mention chỉ file liên quan tính năng đó

Trong phiên (~1–2 tiếng)
  → Giữ 1 chat cho 1 tính năng
  → Khi context > ~50 turn: Clear và paste lại summary ngắn

Kết thúc phiên
  → Commit + ghi commit message rõ ràng
  → Để git history làm "memory" thay vì chat history
```

> **Nguyên tắc:** git history = bộ nhớ dài hạn; chat window = working memory. Không dùng chat window như git log.

---

## Tầng 4 — Quy tắc context theo vai trò (monorepo)

Cấu trúc `ba/dev/qc/shared` tạo ra ranh giới context tự nhiên:

```python
CONTEXT_RULES = {
    "ba_task":  ["ba/process/srs/**", ".claude/knowledge/**", "CLAUDE.md"],
    "dev_task": ["dev/src/**", "shared/**", "ba/process/srs/*/3.*.md"],
    "qc_task":  ["qc/**", "dev/src/**", "ba/process/srs/*/3.*.md"],
}
# LOẠI TRỪ: ba/input/pms-*, logs/, exports/*.docx
```

---

## Thứ tự ưu tiên triển khai

```
NGAY LẬP TỨC (cost ↓↓)
  ✓ .aiignore đúng nội dung    → loại context rác
  ✓ Cache anchor đúng vị trí  → cache hit > 80%

TUẦN 1 (quality ↑)
  ✓ Quy tắc: 1 tính năng = 1 cửa sổ chat
  ✓ Tiếng Anh cho lệnh; tiếng Việt cho spec/doc

TUẦN 2–4 (scale)
  ✓ CONTEXT_RULES theo thư mục vai trò (ba/dev/qc)
  ✓ Diff-first: gửi patch thay vì full file khi review
```

---

## Điểm mấu chốt

Chi phí thực tế không đến từ *số lượng request* mà từ *kích thước input mỗi request*. Agent đọc lại 500 KB codebase cho mỗi câu hỏi nhỏ tốn hơn 10× so với agent chỉ đọc 3 file liên quan — dù số câu hỏi như nhau. Cache giải quyết lượt 2 trở đi; RAG/context selection giải quyết lượt đầu tiên.
