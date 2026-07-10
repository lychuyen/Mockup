# Workflow Orchestration — Hướng dẫn chọn pattern (TOSS)

> **Phạm vi:** hướng dẫn khi dùng **Workflow tool** (đa-agent orchestration) hoặc khi spawn nhiều subagent cho một tác vụ TOSS. DEV-toolkit config — không cần mirror VI (CLAUDE.md §9).
> **Nguồn:** rút từ [`.claude/knowledge/multi-agent-patterns-applied-toss.md`](../knowledge/multi-agent-patterns-applied-toss.md) §4 (selection framework Anthropic + đối chiếu harness) và [`agent-harness-engineering.md`](../knowledge/agent-harness-engineering.md).
>
> ⚠️ Chỉ chạy Workflow/đa-agent khi người dùng **opt-in rõ ràng** (CLAUDE.md §0.3 — việc dễ/GUI để người làm; harness nặng chỉ xứng khi task ở rìa năng lực).

## Mặc định: Orchestrator-Subagent
Khi không chắc, dùng **Orchestrator-Subagent** — một lead lập kế hoạch → giao subtask **bounded context** cho subagent → tổng hợp. Xử lý dải bài toán rộng nhất với chi phí điều phối thấp nhất. Khớp `gen-feature` / `integrate-api` và vai `project-coordinator`.

## Chọn theo loại việc

| Loại việc | Pattern | Ghi chú áp dụng TOSS |
|---|---|---|
| Phân rã rõ, subtask ít phụ thuộc | **Orchestrator-Subagent** (mặc định) | Review nhiều chiều, scaffold feature, tổng hợp đa nguồn |
| Discovery kích cỡ chưa biết (quét toàn bộ Customer_docs, tìm gap/OID) | **loop-until-dry** + completeness critic | Lặp spawn finder tới khi K vòng liên tiếp không ra mới; `log()` rõ phần bị bỏ |
| Cần chất lượng cao, tiêu chí tường minh (soát SRS/mockup/code) | **Generator-Verifier** / Reflection | Tách *tạo* khỏi *chấm*; verifier có few-shot scorecard (ba-reviewer/requirement-validator/code-reviewer/ui-reviewer); lặp có giới hạn vòng |
| Mỗi chặng một sub-task định trước | **Sequential / pipeline** | Pipeline BA (P1–P6) + chuỗi DEV 02-sa→…→code-reviewer |
| Tổng hợp nhiều lượt thành 1 bản | **Mixture of Agents** | CHỈ cho văn phong/định dạng — KHÔNG để "đoán" logic nghiệp vụ (§0) |

## KHÔNG dùng (vi phạm §0 — máy không quyết nghiệp vụ)
- **Multi-Agent Debate + majority-vote để chốt một đáp án/khẳng định nghiệp vụ**, phê duyệt, chọn scope, chọn Document Workflow. Quyết định nghiệp vụ là việc của BA Lead (CLAUDE.md §0/§0.3). Debate chỉ được dùng (hạn chế) cho đối chứng kỹ thuật thuần (vd kiểm một phép tính), kết quả vẫn trình người duyệt.
- **Shared State để nhiều agent tự chủ ghi cùng deliverable/sync không điều phối** — rủi ro trùng việc, mâu thuẫn, đốt token, silent failure. Luôn: nguồn truy vết được, có điều kiện kết thúc, không tự promote `Approved`.

## Nguyên tắc chung (mọi pattern)
1. Trao đổi giữa agent qua **artifact có cấu trúc** (file/JSON), không hội thoại dài tốn token.
2. **Verify trước khi tuyên bố xong** (§0.5); state bền NGOÀI agent (git + tracker JSON + progress file).
3. Mọi đầu ra **truy vết về nguồn**; không suy diễn — thiếu thì gắn cờ `[cần xác nhận]` cho người.

## Bài học từ luồng đã chạy (case study 23–24/06/2026)

**Các luồng đã thực hiện:**
1. **Rà soát nguồn → BRD/SRS** — fan-out **3 business-analyst song song** (PH1/PH2, PH4, PH5), mỗi agent rà cụm nguồn riêng ↔ BR/FUNC, ghi **file rà-soát độc lập** → không tranh chấp.
2. **Sửa phạm vi "Trực tiếp"** — 1 agent hẹp rà lại sau **đính chính của người** (correction loop), không chạy lại cả vòng.
3. **Fold "đã clear" → BRD/SRS** — fan-out 3 agent **chỉ Edit nội dung + bump frontmatter**; **orchestrator** làm `git mv` đổi version + cập nhật INDEX/BA-VERSION-LOG/cross-ref (file dùng chung).
4. **Migrate điểm mở → OID** và **sinh bảng yêu cầu làm rõ VNA** — `project-coordinator` đọc nguồn → xuất artifact (OID, TSV).
5. **Việc cơ học** (phân rã file 15k dòng, phân loại 168 dòng TSV, ghi Google Sheet) — **script xác định, KHÔNG agent**.

**Rút kinh nghiệm:**
- **L1 — Agent không xóa/đổi tên file** (business-analyst/PC không có Bash): agent chỉ Edit nội dung file độc lập; **orchestrator** lo `git mv`/`rm` + file dùng chung.
- **L2 — Song song chỉ an toàn trên file ĐỘC LẬP.** File dùng chung (INDEX, BA-VERSION-LOG, OID, PROPOSAL) → một mình orchestrator (hoặc 1 agent tuần tự) chạm, tránh race/ghi đè.
- **L3 — Việc cơ học lớn → script, không agent.** Phân loại 168 dòng bằng agent → **timeout, 0 token**; bằng heuristic script → vài giây, kiểm được. Tương tự split file, I/O sheet.
- **L4 — Kiểm trùng nguồn trước khi re-ingest.** OFP "NEW LAYOUT" byte-identical bản đã có → không tạo trùng, chỉ đăng ký provenance.
- **L5 — Ranh giới §0 khi fold:** chỉ fold "Bổ nghĩa" (làm giàu BR/FUNC ĐÃ CÓ, dẫn nguồn); "Gap" (tạo BR MỚI) = quyết định phạm vi của người → **OID, không tự tạo**.
- **L6 — Correction loop rẻ:** khung nhị phân sai ("Trực tiếp = ngoài phạm vi") → 1 agent hẹp sửa, không tốn cả vòng.

**Tối ưu (áp cho lần sau):**
- **O1 — Chia vai:** agent = nội dung file độc lập; **orchestrator = file dùng chung + thao tác git/file**. Giảm race, dễ verify.
- **O2 — Pipeline có checkpoint:** rà-soát → fold → OID → cleanup; mỗi chặng commit; **giữ điểm mở vào OID trước khi xóa artifact trung gian** (rà-soát).
- **O3 — Định tuyến việc:** phán đoán nội dung → agent; cơ học (split/classify/sheet) → script.
- **O4 — Artifact trung gian** (rà-soát) dùng xong → fold + migrate OID → xóa (git giữ lịch sử).

---

*Tạo 2026-06-22 — áp đề xuất §4 [`multi-agent-patterns-applied-toss.md`](../knowledge/multi-agent-patterns-applied-toss.md). Cập nhật 24/06/2026: thêm case-study + L1–L6 + O1–O4 từ luồng rà-soát/fold/OID/VNA. Advisory; thay đổi cách điều phối lớn cần BA Lead duyệt + ghi SYNC-LOG.*
