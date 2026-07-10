# Multi-Agent Patterns — Đối chiếu & áp dụng cho TOSS

> **Mục đích:** hợp nhất 3 nguồn — 8 *design pattern* AutoGen ([`multi-agent-design-patterns-autogen.md`](multi-agent-design-patterns-autogen.md)), 5 *coordination pattern* Anthropic ([`multi-agent-coordination-patterns-anthropic.md`](multi-agent-coordination-patterns-anthropic.md)), và harness/nguyên lý nội bộ ([`agent-harness-engineering.md`](agent-harness-engineering.md)) — rồi **trích xuất phần phù hợp cho các agent TOSS** và **đánh giá bổ trợ / xung đột để tránh áp sai**.
>
> ⚠️ **Tài liệu phân tích (advisory).** Đây là *gợi ý áp dụng*, không phải lệnh thay đổi cấu hình. Mọi thay đổi agent/hook/harness phải do BA Lead quyết (CLAUDE.md §0, §0.3) và ghi `SYNC-LOG.md`.

---

## 1. Bản đồ tương ứng 3 nguồn

| Anthropic (coordination) | AutoGen (design pattern) | Nguyên lý harness TOSS | Đã hiện diện trong TOSS? |
|---|---|---|---|
| **Generator-Verifier** | **Reflection** (Coder↔Reviewer) | A5.1 tách tạo/chấm + calibrate evaluator; A5.2 verify trước khi xong | ✅ `ba-reviewer`, `requirement-validator`, `code-reviewer` + Quality Gate |
| **Orchestrator-Subagent** | **Mixture of Agents**; **Group Chat** (manager chọn speaker) | Planner/Generator/Evaluator; điều phối qua file | ✅ Workflow `gen-feature`/`integrate-api`; `project-coordinator` (điều phối nhắc việc) |
| **Agent Teams** (worker bền, hàng đợi) | (≈) **Concurrent Agents** | "cattle not pets"; 1-task/phiên | 🟡 Một phần — pipeline song song Stage 3 (srs/data/process-modeler) |
| **Message Bus** (pub/sub, event-driven) | **Concurrent Agents**, **Sequential Workflow** (topic kế tiếp) | State qua file; INDEX/traceability | 🟡 Tương tự ở mức *file events* (workspace→sync, OID), không có bus runtime |
| **Shared State** (kho chung, không điều phối TT) | (nền) **Topic/Subscription**, filesystem | Filesystem-as-state (workspace↔sync, INDEX, deliverable-status.json) | ✅ Về lưu trữ; ❌ về "agent tự chủ ghi không điều phối" |
| — | **Handoffs** (delegate qua tool call) | Handoff artifact (SRS+entity map+mockup) giữa pipeline | ✅ Bàn giao BA→DEV bằng artifact, không phải tool-call runtime |
| — | **Multi-Agent Debate** (majority vote) | (không có) | ❌ Chưa dùng — *xem xung đột §3* |
| — | **Code Execution** (Docker) | bash/sandbox; verify end-to-end | 🟡 DEV verify; chưa có executor cô lập Docker |

> Quy ước: AutoGen = *cách hiện thực kỹ thuật* (runtime, message, topic); Anthropic = *khi nào chọn pattern nào*; harness TOSS = *kỷ luật vận hành an toàn*. Ba lớp **bổ trợ**, không thay thế nhau.

---

## 2. Trích xuất phần phù hợp cho từng agent TOSS

### 2.1 BA Pipeline

| Agent TOSS | Pattern áp được | Lấy gì từ nguồn (cụ thể) |
|---|---|---|
| **ba-interviewer** | (đầu vào discovery) | Không cần pattern multi-agent; giữ vai sinh bộ câu hỏi. |
| **business-analyst** | *Orchestrator* nhẹ | Là "lead" phân rã yêu cầu → gọi srs/data/process-modeler. Lưu ý §0: phân rã, **không suy diễn**. |
| **srs-writer / data-modeler / process-modeler** | **Concurrent Agents** / *Mixture* lớp-1 | Đã chạy **song song Stage 3** (CLAUDE.md §5). Mỗi agent đọc cùng báo cáo khảo sát độc lập → *bổ trợ* nhau trước handoff. Cơ chế AutoGen tương ứng: nhiều agent subscribe cùng "topic" (báo cáo nguồn), gom kết quả như `ClosureAgent`. |
| **gen-mockup** | (Design) | Nhận handoff artifact; có thể là chặng *Sequential* sau SRS. |
| **ui-reviewer / ba-reviewer / requirement-validator** | **Generator-Verifier** / **Reflection** | Tách *chấm* khỏi *tạo*. Lấy từ AutoGen Reflection: reviewer trả **kết quả có cấu trúc** (correctness/efficiency/safety/approval) + cờ APPROVE/REVISE → lặp tới đạt. Đã củng cố bằng **few-shot scorecard** (chống self-evaluation bias, A5.1). |
| **project-coordinator** | **Orchestrator-Subagent** (điều phối) + **Shared State** (đọc tracker) | Lấy ý "lead tổng hợp findings"; nhưng **chỉ suy ra từ nguồn** (§0.5), không tự quyết. Tracker `deliverable-status.json` = shared state có **điều kiện kết thúc rõ** (≠ Shared State tự chủ của Anthropic). |

### 2.2 DEV Pipeline (Angular/ESB-FE)

| Agent TOSS | Pattern áp được | Lấy gì |
|---|---|---|
| **02-sa → 03-coder → 04-mock → 05-i18n → 06-runtime-verifier → 07-qa → code-reviewer** | **Sequential Workflow** (chuỗi xác định) | Đúng tinh thần AutoGen Sequential: mỗi chặng xử lý → chuyển chặng kế. Handoff bằng file/artifact. |
| **03-coder ↔ code-reviewer** | **Reflection** / **Generator-Verifier** | Vòng sinh code ↔ review tới khi đạt FE_Checklist (44 mục). |
| **06-runtime-verifier** | **Code Execution** + "verify end-to-end" (A4) | Lấy nguyên tắc: *không đánh dấu xong khi chưa chạy thật end-to-end*. AutoGen Code Execution gợi ý cô lập Docker (chưa bắt buộc cho TOSS). |
| **Workflow `gen-feature` / `integrate-api`** | **Orchestrator-Subagent** | Lead điều phối các bước scaffold; subtask bounded, ít phụ thuộc — đúng "default" của Anthropic. |

### 2.3 Workflow tool (orchestration) — gợi ý từ Anthropic selection framework
- Việc **review/audit nhiều chiều** → *Orchestrator-Subagent* (dimensions → verify), khớp pattern review trong Workflow tool.
- Việc **discovery quy mô lớn không rõ kích cỡ** (vd quét toàn bộ Customer_docs) → *loop-until-dry* + *completeness critic*.
- **Tổng hợp đa nguồn** (nhiều tài liệu khảo sát) → *Mixture of Agents* (tổng hợp nhiều lượt thành 1 bản chất lượng).

---

## 3. Bổ trợ vs Xung đột — ĐỂ TRÁNH áp sai

### 3.1 ✅ Bổ trợ (an toàn để mượn ý)
1. **Reflection / Generator-Verifier ↔ evaluator subagents TOSS.** Củng cố A5.1 (tách tạo/chấm). Mượn được: yêu cầu reviewer trả **JSON có cấu trúc** + cờ APPROVE/REVISE; lặp có **giới hạn vòng** (chống loop vô tận — đúng hạn chế Anthropic nêu).
2. **Sequential Workflow ↔ pipeline P-workflows & DEV chain.** Cùng mô hình chuỗi xác định; bổ trợ ba-workflow-patterns (P1–P6).
3. **Orchestrator-Subagent là "default".** Khớp Workflow tool + `project-coordinator`. Mượn: subtask **bounded context**, gom kết quả ở lead.
4. **Topic/Subscription & "behavior contract" ↔ message-typed.** Cách AutoGen định nghĩa *kiểu message = giao thức* củng cố kỷ luật: trao đổi giữa agent qua **artifact có cấu trúc** (file/JSON), không hội thoại tốn token (A2).
5. **Verify-before-done (AutoGen Code Execution / A4) ↔ §0.5 done-discipline.** Hoàn toàn đồng pha: file tồn tại ≠ xong; chỉ Approved sau khi evaluator pass + Quality Gate sạch.
6. **Model Context (BufferedChatCompletionContext) ↔ token optimization.** Bổ trợ `ai-agent-token-optimization.md`: giữ cửa sổ history, tránh tràn context.

### 3.2 ⚠️ Xung đột / cần tránh (KHÔNG bê nguyên xi)
1. **Tự chủ "invent/improve" của agent ↔ CLAUDE.md §0.** Các pattern Anthropic/AutoGen giả định agent **tự suy luận, tự lấp khoảng trống, tự cải tiến yêu cầu**. TOSS **cấm** điều này — agent chỉ **phân rã + tái dựng trung thực**, gặp thiếu/mơ hồ thì **giữ nguyên + gắn cờ** cho người. → *Tránh* mọi pattern khuyến khích agent "refine/synthesize" **nội dung nghiệp vụ** thành kết luận mới (đặc biệt **Mixture of Agents** khi đầu ra là *yêu cầu/khẳđịnh nghiệp vụ*: chỉ dùng để tổng hợp *văn phong/định dạng*, không để "đoán" logic nghiệp vụ).
2. **Multi-Agent Debate + majority vote quyết đáp án ↔ §0 "human decides".** Để máy bỏ phiếu chốt một **đáp án nghiệp vụ** mâu thuẫn nguyên tắc *con người quyết, suy luận là việc của người*. → *Tránh* dùng debate/vote để **quyết định scope, phê duyệt, chọn workflow**. Có thể dùng (hạn chế) để **đối chứng kỹ thuật thuần** (vd kiểm tra một phép tính), kết quả vẫn trình người duyệt.
3. **Shared State "agent tự chủ ghi, không điều phối trung tâm" ↔ §0.3 Human-First + gating quyền.** Anthropic chính nó cảnh báo: trùng việc, hướng mâu thuẫn, **đốt token vô ích**, **silent failure**. TOSS đã chặn bằng: ghi vào `ba/sync/` cần vai có quyền; **không tự promote Approved** (§0.5); INDEX là *contract* (file vắng INDEX = không tồn tại). → *Tránh* để nhiều agent ghi đồng thời vào cùng deliverable/sync mà không có điều kiện kết thúc + chủ sở hữu rõ.
4. **Message Bus "workflow nảy sinh từ event" ↔ kỷ luật truy vết.** Anthropic cảnh báo *khó truy vết + định tuyến sai = lỗi âm thầm*. Với BA, **mọi artifact phải truy nguồn** (BR→FR→FUNC→US/UC→TC). → *Tránh* kiến trúc event ẩn làm mất dấu vết nguồn; giữ traceability tường minh.
5. **Agent Teams "worker bền giữ state dài" ↔ "cattle not pets" + 1-task/phiên (A3/A4).** Worker tự chủ nhiều bước dễ tích lũy state mờ, khó handoff. → Ưu tiên **state bền NGOÀI agent** (git + progress file + tracker JSON), agent stateless.
6. **Harness nặng vô điều kiện ↔ A5.7 + §0.3.** Pattern multi-agent phức tạp chỉ xứng khi task **ở rìa năng lực** model. Việc đơn giản/GUI → để người làm (§0.3), đừng dựng fleet agent. *Tránh* over-engineering điều phối cho task nhỏ.

### 3.3 Quy tắc rút gọn để "tránh"
> **Máy phân rã & tái dựng; người suy luận & quyết.** Mọi pattern multi-agent chỉ được dùng cho **decomposition, song song hoá, kiểm chứng kỹ thuật** — *không* cho **suy diễn nghiệp vụ, phê duyệt, hay quyết định scope**. Luôn: nguồn truy vết được, có điều kiện kết thúc, không tự promote Approved, đổi harness phải stress-test theo SOP §D của harness doc.

---

## 4. Việc nên cân nhắc (đề xuất cho BA Lead)
- ✅ **Đã làm (2026-06-22, BA Lead duyệt):** bổ sung *few-shot scorecard* chống thiên kiến tự duyệt cho `ui-reviewer` (v1.2) — đồng bộ với ba-reviewer/requirement-validator/code-reviewer.
- ✅ **Đã làm (2026-06-22):** guidance chọn pattern khi dùng Workflow tool tại [`.claude/workflows/orchestration-patterns.md`](../workflows/orchestration-patterns.md) — mặc định *Orchestrator-Subagent*; *loop-until-dry* cho discovery; *Generator-Verifier* cho review (theo selection framework Anthropic).
- ❌ **Không thực hiện (không khuyến nghị):** Multi-Agent Debate cho quyết định nghiệp vụ — vi phạm §0 (máy không quyết nghiệp vụ).

*Biên soạn 2026-06-22 từ 3 nguồn đã crawl + harness nội bộ. Advisory — không thay đổi cấu hình. Bám §0: phân tích/đối chiếu, không suy diễn thay người.*
