# INDEX — Kho tri thức `.claude/knowledge/`

> **Router để AI đọc/truy suất nhanh.** Đọc bảng này TRƯỚC, mở đúng file cần, rồi **Grep/đọc chọn lọc** thay vì nạp cả file (tiết kiệm token — xem [`ai-agent-token-optimization.md`](ai-agent-token-optimization.md)).
>
> **Hai loại:** **Curated** (đã biên tập, súc tích → đọc cả file) ở thư mục gốc; **Raw extract** (bản trích sách thô, rất lớn → CHỈ Grep/đọc đúng mục) trong [`_books-extracted/`](_books-extracted/).
> Phần lớn file curated có **mirror tiếng Việt** tại `.claude/human/knowledge/`.

---

## 1. Harness & Agent engineering

| File | Mục đích | Tra khi cần (từ khóa) | Đọc |
|---|---|---|---|
| [agent-harness-engineering.md](agent-harness-engineering.md) | Tổng hợp 4 bài về *agent harness* (N1–N4) + đối chiếu + đề xuất + **SOP rà harness mỗi đời model** + **Phần E: profile harness theo cấp độ model (nặng↔nhẹ)** | harness, hook, ratcheting, generator-evaluator, getting-bearings, stress-test giả định, guard/quality-gate, profile theo model, heavy/light, model mạnh/yếu, invariant vs bù năng lực | Cả file (~250 dòng) |
| [ai-agent-token-optimization.md](ai-agent-token-optimization.md) | Tối ưu token cho agent: caching, RAG, đọc chọn lọc, session hygiene | token, caching, RAG, context, đọc chọn lọc | Cả file |
| [multi-agent-design-patterns-autogen.md](multi-agent-design-patterns-autogen.md) | 8 design pattern multi-agent của Microsoft AutoGen (curated, không code) | multi-agent, AutoGen, concurrent, sequential, group chat, handoffs, mixture of agents, debate, reflection, code execution, orchestrator | Cả file |
| [multi-agent-coordination-patterns-anthropic.md](multi-agent-coordination-patterns-anthropic.md) | 5 coordination pattern multi-agent của Anthropic + khung lựa chọn | multi-agent, coordination, generator-verifier, orchestrator-subagent, agent teams, message bus, shared state | Cả file |
| [autogen-core-guide.md](autogen-core-guide.md) | Nền tảng AutoGen Core (curated): Core Concepts + Framework + Components — runtime, AgentId/lifecycle, topic/subscription, message (send/publish), model client/context, tools, workbench/MCP | AutoGen, runtime, RoutedAgent, AgentId, topic, subscription, send_message, publish_message, model client, tool, MCP, workbench, telemetry | Cả file |
| [multi-agent-patterns-applied-toss.md](multi-agent-patterns-applied-toss.md) | Đối chiếu 8 AutoGen ↔ 5 Anthropic ↔ harness; trích xuất pattern cho từng agent TOSS; **bổ trợ vs xung đột để tránh áp sai (§0)** | áp dụng pattern, ánh xạ agent, bổ trợ, xung đột, tránh, generator-verifier, orchestrator, reflection, debate cấm | Cả file |

## 2. Phương pháp BA (Business Analysis)

| File | Mục đích | Tra khi cần | Đọc |
|---|---|---|---|
| [ba-workflow-patterns.md](ba-workflow-patterns.md) | 6 luồng làm tài liệu BA **P1–P6** + so sánh + cách chọn (CLAUDE.md §0.1) | chọn workflow, P1–P6, co-evolution, P4 | Cả file |
| [babok-v3-summary.md](babok-v3-summary.md) | Tóm tắt BABOK v3 (6 knowledge areas, kỹ thuật BA) | BABOK, knowledge area, elicitation, requirement lifecycle | Cả file |
| [provenance-ux-requirements.md](provenance-ux-requirements.md) | Đặc tả "tại sao tôi nên tin điều này?" thành yêu cầu kiểm thử được cho tính năng AI: template provenance (claim types/sources/citation/freshness/confidence/conflict/audit) + REQ-PROV mẫu | provenance, trust, AI feature, citation per-claim, freshness SLA, confidence, conflict handling, audit export, "why should I believe", REQ-PROV | Cả file |
| [bpmn-2.0-cheatsheet.md](bpmn-2.0-cheatsheet.md) | Cheat-sheet ký hiệu BPMN 2.0 (event/gateway/task/lane) | BPMN, sơ đồ quy trình, gateway, swimlane, As-Is/To-Be | Grep ký hiệu |
| [agile-scrum-vn.md](agile-scrum-vn.md) | Thuật ngữ & nhịp Agile/Scrum (VI) | scrum, sprint, backlog, user story, INVEST | Cả file |
| [company-process-standards.md](company-process-standards.md) | Chuẩn quy trình nội bộ (Viettel QT…) | QT02, biểu mẫu, chuẩn tài liệu công ty | Grep |
| [erd-la-gi-thinhnotes.md](erd-la-gi-thinhnotes.md) | ERD (Entity Relationship Diagram) — Entity/Attribute/Relationship, quan hệ 1-1/1-nhiều/nhiều-nhiều *(tham khảo ngoài: Thinh Notes, crawl 24/06)* | ERD, thực thể, entity, attribute, relationship, mô hình dữ liệu, data model, 1-nhiều, nhiều-nhiều, data-modeler | Cả file |

## 3. UX / Thiết kế giao diện

| File | Mục đích | Tra khi cần | Đọc |
|---|---|---|---|
| [ux-knowledge-synthesis.md](ux-knowledge-synthesis.md) | **Tổng hợp 4 sách UX** (U1–U4): prototyping, 10 định luật UX, UX research + bảng áp dụng cho gen-mockup/ui-reviewer/ba-interviewer | UX, prototyping, fidelity, Laws of UX, Fitts/Hick/Doherty, wide-but-shallow, UX research, laddering | Cả file (80 dòng) — **đọc cái này trước**, chỉ vào raw khi cần chi tiết |
| [angular-material-components.md](angular-material-components.md) | Catalog map "UI need → Angular Material component" cho mockup | mat-*, Material 3, component, mockup, data-mat | Grep component |

## 4. Skill & DEV

| File | Mục đích | Tra khi cần | Đọc |
|---|---|---|---|
| [_books-extracted/The-Complete-Guide-to-Building-Skill-for-Claude.extracted.md](_books-extracted/The-Complete-Guide-to-Building-Skill-for-Claude.extracted.md) | **Hướng dẫn chính thức tạo Skill** (Anthropic) — BẮT BUỘC đọc trước khi tạo/sửa Skill (CLAUDE.md §6) | SKILL.md, frontmatter, description what+when, progressive disclosure, Reference A | Grep mục cần (827 dòng) |
| [phuong-phap-xay-skill-xuat-tai-lieu.md](phuong-phap-xay-skill-xuat-tai-lieu.md) | Phương pháp xây skill xuất tài liệu (Markdown→Word QT02) | export-word, pandoc, QT02, reference-doc | Cả file |
| [srs-word-format-vna-tit.md](srs-word-format-vna-tit.md) | Đặc tả forensic định dạng Word SRS chuẩn VNA/VTIT (QT02.BM.04) — pt/hex/twips/style, bìa, header/footer, numbering + checklist QC 100% trung thực (biến thể 2 của export-word) | SRS VNA, QT02.BM.04, word-reference-srs-vna, template SRS, bìa, TRANG KÝ, BẢNG GHI NHẬN THAY ĐỔI, sectPr, numbering heading, fidelity | Cả file |
| [dev-philosophies.md](dev-philosophies.md) | Catalog triết lý phát triển TÙY CHỌN (DP1…) — CLAUDE.md §0.2 | triết lý, DP1, modular, áp khi human yêu cầu | Cả file |

## 5. Vận hành & Hạ tầng (Ops)

| File | Mục đích | Tra khi cần | Đọc |
|---|---|---|---|
| [ssd-wear-assessment.md](ssd-wear-assessment.md) | Đánh giá hao mòn SSD do workflow agent (hook/log/extract/export/git) — kết luận: không đáng lo, chỉ quản dung lượng. Checklist audit cho mọi dự án clone | SSD, tuổi thọ ổ, TBW, hao mòn, hook write amplification, dọn log, phình .git | Cả file |

## 6. `_books-extracted/` — bản trích sách thô (CHỈ Grep/đọc chọn lọc)

> Rất lớn (823–7843 dòng). **Không nạp cả file.** Để hiểu nhanh → đọc bản *curated* tương ứng ở §1–§5 trước; chỉ vào đây khi cần nguyên văn/chi tiết một mục. Bản trích là **raw extract** (CLAUDE.md §0), có thể có nhiễu OCR/layout.
>
> 🧭 **Điều hướng theo chương:** 3 cuốn lớn có bản đồ mục + số dòng tại [`_books-extracted/SECTION-MAPS.md`](_books-extracted/SECTION-MAPS.md) → `Read(file, offset, limit)` nhảy đúng chương mà không cần tách file.

| File (trong `_books-extracted/`) | Sách | Bản curated tương ứng |
|---|---|---|
| `Designing UX Prototyping … .extracted.md` | Prototyping (Coleman & Goodwin) | ux-knowledge-synthesis §A1 |
| `Laws of UX … .extracted.md` | 10 định luật UX (Yablonski) | ux-knowledge-synthesis §A2 |
| `Ux Research … .extracted.md` | UX Research (Nunnally & Farkas) | ux-knowledge-synthesis §A3 |
| `uxpin_prototyping_for_product_managers.extracted.md` | Prototyping for PMs (UXPin) | ux-knowledge-synthesis §A4 |
| `The-Complete-Guide-to-Building-Skill-for-Claude.extracted.md` | Building Skills for Claude | (không có bản rút gọn — Grep trực tiếp) |

---

## Quy ước phân rã PDF/Office → Markdown (khi bổ sung tài liệu mới vào đây)
- **PDF → .md giữ cấu trúc (mặc định):** `python ../skills/crawl-pdf/scripts/pdf-to-md.py "<file|dir>" "<out>"` (pymupdf4llm). Text thô/tốc độ → `pdftotext -layout` (fallback).
- **Office/HTML:** `python -m markitdown "<file>" -o "<out.md>"`.
- Bản trích lớn → đặt vào `_books-extracted/`, thêm 1 dòng vào bảng §5 + (nếu là sách phương pháp) cân nhắc viết bản *curated* rút gọn ở gốc.

*INDEX cập nhật 2026-06-23 (thêm §5 Vận hành & Hạ tầng — ssd-wear-assessment.md; _books-extracted dời §5→§6). Khi thêm/xóa file knowledge, cập nhật bảng tương ứng.*
