# Agent Harness Engineering — Tổng hợp 4 bài + Đề xuất cải tiến harness TOSS

> Tài liệu tham khảo nội bộ (AGENTS scope). Tổng hợp 4 bài viết nền tảng về *agent
> harness engineering*, rút ra nguyên lý, rồi đối chiếu với harness hiện tại của TOSS
> để đề xuất + theo dõi cải tiến. Không có mirror VI bắt buộc (`.claude/knowledge/` —
> xem CLAUDE.md §9).

**Nguồn:**

- **[N1] Addy Osmani — "Agent Harness Engineering"** · <https://addyosmani.com/blog/agent-harness-engineering/>
- **[N2] Anthropic — "Harness design for long-running apps"** · <https://www.anthropic.com/engineering/harness-design-long-running-apps>
- **[N3] Anthropic — "Managed Agents" (scaling)** · <https://www.anthropic.com/engineering/managed-agents>
- **[N4] Anthropic — "Effective harnesses for long-running agents"** · <https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents>

---

## Phần A — Tổng hợp nội dung 4 bài

### A1. Khái niệm nền: Agent = Model + Harness [N1]

- **Harness** = mọi thứ xây quanh model (system prompt, filesystem, git, bash, sandbox,
  memory, hook, tool, subagent…), *trừ* bản thân model.
- Nguyên lý trung tâm: **"một model khá với harness tốt thắng một model giỏi với harness tồi."**
  Khoảng cách giữa "model làm được trên lý thuyết" và "thực tế giao được" phần lớn do
  chất lượng harness → coi lỗi agent là **vấn đề cấu hình giải được**, không phải "model dốt".
- **Thiết kế ngược từ hành vi mong muốn**, không từ tool có sẵn: việc bền → filesystem+git;
  chạy code → bash; task dài → planning + verification…
- **Ratcheting principle (bánh cóc):** mỗi lỗi của agent là tín hiệu siết harness để lỗi đó
  *không thể lặp lại*. Ví dụ agent comment-out test → (a) rule cấm trong AGENTS.md, (b) hook
  grep `.skip(`/`xit(`, (c) reviewer subagent chặn. Harness đúng được định hình bởi *lịch sử
  lỗi của chính codebase* — không tải về nguyên khối được.
- **"Success is silent, failures are verbose":** hook khi pass thì im lặng, khi fail thì bơm
  chi tiết lỗi ngược vào loop để agent tự sửa.
- **Knowledge file ngắn (<60 dòng), mỗi rule truy về một lỗi/ràng buộc cụ thể.**
- **Tool tập trung (~10) thay vì 50 tool chồng chéo.**
- Model–harness *co-training*: model được post-train trong harness cụ thể → overfit; nhu cầu
  harness *dịch chuyển* chứ không co lại (xóa lỗi cũ, mở năng lực mới cần scaffolding mới).
- Xu hướng: Harness-as-a-Service (Agent SDK); các agent code (Claude Code, Cursor, Codex,
  Aider, Cline) hội tụ về cùng pattern. Tương lai: điều phối song song, agent tự phân tích lỗi,
  lắp tool/context động (harness như compiler).

### A2. Generator–Evaluator & quản lý context [N2]

- Hai failure mode: **context degradation / "context anxiety"** (model gói việc sớm khi gần đầy
  context) và **self-evaluation bias** (agent tự khen bài mình).
- **Generator–Evaluator pattern (cảm hứng GAN):** tách *tạo* khỏi *chấm*. "Tinh chỉnh một
  evaluator độc lập để hoài nghi **dễ hơn nhiều** so với bắt generator tự phê bình mình."
- **"Out of the box, Claude is a poor QA agent"** — evaluator đời đầu tìm ra lỗi rồi tự thuyết
  phục mình duyệt. Phải **calibrate bằng few-shot scorecard** (ví dụ chấm điểm chi tiết) để kéo
  phán đoán về sát chuẩn con người, giảm score drift.
- **Sprint contract:** generator + evaluator **chốt định nghĩa "done" trước khi làm** (vd Sprint 3
  = 27 tiêu chí kiểm thử) — bắc cầu spec mức cao ↔ tiêu chí test được.
- **Context reset** (clean slate qua handoff artifact) cần cho Sonnet 4.5; **Opus 4.6 gần như
  hết** context anxiety → build liền mạch 2h, bớt cần reset/sprint.
- Kiến trúc 3 agent: **Planner** (mở rộng brief → spec mức cao, không over-spec), **Generator**
  (làm theo feature, tự đánh giá, dùng git), **Evaluator** (test bằng Playwright MCP, đối chiếu
  tiêu chí). Trao đổi **qua file**, không hội thoại tốn token.
- **Kỷ luật bảo trì harness:** "mỗi thành phần mã hóa một giả định về việc model *không tự làm
  được* — và những giả định đó cần được stress-test." Khi lên model mới: **gỡ từng thành phần,
  đo tác động trước khi bỏ**; giữ phần còn "load-bearing".
- Chi phí–lợi ích: solo 20'/$9 → hỏng lõi; full harness 6h/$200 → chạy tốt (×20 đắt nhưng vượt
  trội). Harness nặng chỉ xứng khi task **ở rìa năng lực** model.

### A3. Managed Agents — decouple brain/hands/session [N3]

- *Tầng hạ tầng dịch vụ hosted* — phần lớn KHÔNG áp dụng cho dự án local như TOSS.
- **Decouple "brain" (Claude+harness, stateless, cattle) / "hands" (sandbox/tool/MCP, thay thế
  được) / "session" (event log append-only, bền vững, nằm NGOÀI context, query + `wake()`
  phục hồi).** Triết lý "cattle, not pets".
- **Session log = context object ngoài:** thay vì trim/compact mất thông tin, lấy lát cắt sự kiện
  tùy ý, transform trước khi đưa vào context.
- **Bảo mật credential:** code/agent *không tin cậy* KHÔNG được thấy secret. Hai pattern:
  *resource-bundled* (token gắn lúc init sandbox, code sinh ra không thấy) và *vault + MCP proxy*.
  Mục tiêu: chặn prompt-injection leo thang thành đánh cắp credential.
- **Interface ổn định vượt giả định về model** (ví như trừu tượng OS process/file sống lâu hơn
  phần cứng) → củng cố nguyên lý "rà bỏ harness mỗi đời model" của [N2].

### A4. Effective harnesses — handoff qua nhiều context window [N4]

- Ẩn dụ: **"kỹ sư làm ca, bị mất trí nhớ"** — mỗi phiên mới không nhớ phiên trước → tiến độ vỡ vụn.
- Giải pháp 2 phần, **cùng harness, chỉ khác prompt khởi tạo:**
  - **Initializer agent:** dựng **feature list JSON** (liệt kê toàn bộ yêu cầu, mỗi mục
    `passes: false`), `init.sh`, `claude-progress.txt`, commit git baseline.
    **JSON thay vì Markdown vì "model ít sửa/ghi đè sai file JSON hơn."** Rule cứng: **cấm xóa/
    sửa test để lách** ("unacceptable to remove or edit tests").
  - **Coding agent ("Getting bearings protocol"):** `pwd` → đọc git log + progress file → chọn
    mục *ưu tiên cao nhất chưa xong* → chạy `init.sh` → **verify end-to-end TRƯỚC khi** làm tiếp →
    commit + cập nhật progress.
- Phát hiện cốt lõi: *"Claude sửa code, test bằng unit test/curl, nhưng không nhận ra tính năng
  không chạy end-to-end."* → bắt buộc **verify end-to-end trước khi đánh dấu xong**; browser
  automation (Puppeteer MCP) để test như người dùng.
- **Git làm cơ chế phục hồi** (commit mô tả rõ + revert); **progress file** = handoff cô đọng
  (khác transcript thô), thay phỏng đoán bằng bàn giao tường minh.
- **Incremental:** một feature mỗi phiên → giảm cạn context, dễ revert.

### A5. Nguyên lý xuyên suốt (đúc kết 4 bài)

1. **Tách tạo khỏi chấm** (generator/evaluator) — và **calibrate evaluator** [N1,N2,N4].
2. **Verify trước khi tuyên bố xong**, "success silent / fail verbose" [N1,N2,N4].
3. **Ratcheting** — mỗi lỗi → siết harness để không lặp lại [N1].
4. **State bền ngoài context** (git + progress/feature file + session log) để handoff/resume
   [N3,N4].
5. **Stress-test giả định mỗi đời model** — gỡ phần không còn load-bearing [N2,N3].
6. **Bảo vệ credential khỏi code/agent không tin cậy** [N3].
7. **Harness nặng chỉ xứng khi task ở rìa năng lực** model; việc dễ thì để model/người làm
   [N2] (đồng pha CLAUDE.md §0.3 Human-First).

---

## Phần B — Đối chiếu hiện trạng harness TOSS

**Đã có sẵn (đúng nguyên lý):** Ratcheting (45 rule Angular + exact-phrase §0.3) · Hook cơ bản
(`check-vietnamese` PreToolUse, `format-markdown` PostToolUse, `save-transcript` Stop,
`sync-check`, `check-input-timeline`) · Skills progressive disclosure (`gen-*`, `export-word`) ·
Evaluator subagents (`ba-reviewer`, `requirement-validator`, `code-reviewer`) · Filesystem-as-state
(workspace↔sync, INDEX) · Memory + web search · Tool set tập trung · Git commit kỷ luật ·
Trao đổi qua file · Sổ OID-TOSS-001 + subagent `project-coordinator`.

**Bảng gap hợp nhất (sau 4 bài):**

| # | Gap | Ưu tiên | Nguồn |
|---|---|---|---|
| G1 | Quality Gate hook (success silent / fail verbose) — cưỡng chế §0.3 vốn mới trên giấy | **Cao** | N1, N4 |
| G2 | Hook chặn lệnh phá hủy (`rm -rf` gốc bảo vệ, `git push --force`) — TOSS đang allow-list ngược | **Cao** | N1 |
| G3 | Chặn agent đọc/echo `.secrets/*` (credential isolation) | **Cao** | N3 |
| G4 | Calibrate evaluator bằng few-shot scorecard (reviewer hiện chưa có ví dụ chấm điểm) | **Cao** | N2 |
| G5 | Tracker pass/fail deliverable + "getting bearings" đầu phiên (tái dùng project-coordinator) | **Cao** | N4 |
| G6 | SOP rà-bỏ harness mỗi đời model (stress-test assumptions) | **Trung-cao** | N2, N3 |
| G7 | Progress/handoff file cô đọng (≠ transcript thô) | **Trung bình** | N3, N4 |
| G8 | JSON cho RTM/tracker (chống agent sửa lén) | **Trung bình** | N4 |
| G9 | Sprint contract / checklist nghiệm thu trước khi soạn | **Trung bình** | N2 |
| G10 | Ralph loop / context reset / 1-task-per-session | **Thấp** (Opus 4.8 1M giảm nhu cầu) | N2, N4 |
| G11 | Sandbox / decouple brain-hands | **Thấp** (không hợp dự án BA local) | N1, N3 |

---

## Phần C — Đề xuất cải tiến (kèm trạng thái triển khai)

| # | Cải tiến | Hiện thực | Trạng thái |
|---|---|---|---|
| C1 (G2,G3) | `guard-safety.ps1` — PreToolUse chặn `git push --force`, `rm -rf` vào root bảo vệ, đọc `.secrets/*` | `.claude/sync/guard-safety.ps1` + `settings.json` | ✅ Đã làm |
| C2 (G1) | `quality-gate.ps1` — PostToolUse cảnh báo (non-blocking, verbose) khi deliverable .md thiếu YAML frontmatter bắt buộc | `.claude/sync/quality-gate.ps1` + `settings.json` | ✅ Đã làm |
| C3 (G4) | Few-shot scorecard cho `ba-reviewer` + `requirement-validator` | `.claude/agents/*` (+ mirror VI) | ✅ Đã làm |
| C4 (G6) | SOP rà-bỏ harness mỗi đời model | Phần D dưới đây | ✅ Đã làm |
| C5 (G5,G7) | Tracker pass/fail + "getting bearings" + progress handoff | `deliverable-status.json`; PC v1.3 (Mode B + maintain tracker + handoff); CLAUDE.md §0.5; business-analyst v2.1 done-discipline | ✅ Đã làm |
| C6 (G8) | RTM canonical JSON + convention "tracker máy đọc = JSON/TSV" | `ba/sync/models/RTM-template-v0.1.json` + ghi chú trong RTM .md + CLAUDE.md §8 | ✅ Đã làm |

> C5–C6 đã được BA Lead duyệt triển khai (2026-06-17). Lưu ý §0: tracker do PC **suy ra từ
> nguồn**, không bịa; bản JSON khởi tạo rỗng/placeholder, không chứa dữ liệu bịa.

---

## Phần D — SOP: Rà soát harness mỗi khi đổi model (G6 / C4) [N2,N3]

> "Mỗi thành phần trong harness mã hóa một giả định về việc model *không tự làm được*; những giả
> định đó đáng được stress-test." Khi nâng model nền (vd Opus 4.6 → 4.8 → kế tiếp), chạy quy trình:

1. **Liệt kê giả định.** Với mỗi thành phần harness (rule trong CLAUDE.md/angular-guidelines,
   hook, subagent, skill, scaffolding chống cạn-context) → ghi *nó bù cho việc model không làm
   được gì*.
2. **Gỡ thử từng cái một, đo tác động.** Không gỡ hàng loạt. Tạm vô hiệu một thành phần → chạy
   vài task đại diện → so sánh chất lượng. Giữ nếu còn "load-bearing", bỏ nếu thừa.
3. **Ứng viên gỡ điển hình khi model mạnh lên:** scaffolding chống "context anxiety" (Ralph loop,
   chia nhỏ bắt buộc, context reset), rule dài lặp lại điều model đã tự làm đúng.
4. **Cái thường GIỮ:** planner (tránh under-scope), evaluator (bắt lỗi ở rìa độ phức tạp),
   hook bảo vệ (G2/G3 — bảo mật/an toàn không phụ thuộc năng lực model), traceability.
5. **Ghi nhật ký.** Log thay đổi `old → new + lý do + ngày` vào `.claude/sync/SYNC-LOG.md`; nếu
   sửa rule trong CLAUDE.md thì bump version + cập nhật changelog cuối file.
6. **Thời điểm chạy:** mỗi lần đổi model nền, hoặc khi thấy một rule liên tục thừa/cản trở.

---

## Phần E — Profile harness theo cấp độ model (heavy ↔ light) [N1,N2,N3]

> **Vận hành hóa nguyên lý A5.7 + SOP Phần D.** Phần D nói *cách* rà bỏ; Phần E nói *cái gì*
> bỏ và *khi nào* — gắn mức "nặng/nhẹ" của harness với **năng lực model nền**.
> **Quy tắc vàng:** *"Harness nặng chỉ xứng khi task ở rìa năng lực model"* [N2]. Model càng
> mạnh, rìa năng lực càng xa → scaffolding bù năng lực càng dư → gỡ bớt. Model càng yếu →
> giữ/đắp thêm.

### E1. Hai lớp thành phần — chỉ MỘT lớp được phép scale

Phân loại MỌI thành phần harness trước khi chỉnh:

| Lớp | Bản chất | Có scale theo model? | Thành phần TOSS |
|---|---|---|---|
| **Bất biến (Invariant)** | Mã hóa *chính sách / an toàn / toàn vẹn dữ liệu* — KHÔNG bù cho năng lực model | **KHÔNG** — luôn bật mọi tier | `guard-safety.ps1` (G2/G3 destructive+credential), `check-vietnamese.ps1` (§7), governance §0/§0.1/§0.3/§0.4, truy vết BR→FR→FUNC→US→TC + RTM, INDEX completeness §8, versioning §8, dual-scope sync §9, `save-transcript` |
| **Bù năng lực (Capability-compensating)** | Mã hóa giả định *"model không tự làm được X"* — đắp cho điểm yếu | **CÓ** — nặng cho model yếu, nhẹ cho model mạnh | Bắt buộc 2-pass evaluator, độ chi tiết few-shot scorecard, độ sâu getting-bearings §0.5, nhắc done-discipline lặp lại, exact-phrase §0.3, nudge `quality-gate`, restate 45 rule Angular, context-reset / sprint-contract / 1-task-per-session / Ralph loop, ép fan-out orchestration cho artifact lớn |

> **CẢNH BÁO (§0 + Phần D.4):** KHÔNG BAO GIỜ gỡ lớp Bất biến để "làm nhẹ" — an toàn và toàn
> vẹn dữ liệu độc lập với việc model giỏi đến đâu. Một model mạnh vẫn có thể bị prompt-injection
> hay ghi sai file; hook bảo vệ vẫn cần. "Nhẹ" = chỉ rút **lớp Bù năng lực**.

### E2. Ba profile harness ↔ cấp độ model

| Cấp độ | Model (tham chiếu, 2026-06) | Profile | Lớp Bù năng lực |
|---|---|---|---|
| **Mạnh** | **Opus 4.8/4.7/4.6 (gồm [1m])**, Fable 5 | **NHẸ (Light)** | Evaluator theo rủi ro (chỉ deliverable rủi-ro-cao/giao khách); getting-bearings rút gọn (đọc tracker + INDEX, bỏ re-derive); bỏ context-reset/sprint-contract/1-task-per-session bắt buộc; rule nêu 1 lần, không restate; fan-out chỉ khi thực sự cần |
| **Trung bình** | Sonnet 4.6, Sonnet 4.5 | **CHUẨN (Standard)** | Evaluator cho deliverable rủi-ro trung-bình trở lên; getting-bearings đầy đủ §0.5; context-reset khi gần đầy context; few-shot scorecard giữ; fan-out cho artifact ≥3 màn/800 dòng |
| **Yếu** | Haiku 4.5, model nhỏ/cũ hơn | **NẶNG (Heavy)** | Evaluator 2-pass BẮT BUỘC mọi deliverable; getting-bearings đầy đủ + verify end-to-end; context-reset + 1-task-per-session + sprint-contract; exact-phrase §0.3; restate rule trọng yếu; fan-out + assembly cho mọi artifact lớn |

**Cách model tự định vị (ở getting-bearings, §0.5):** đọc tên model ở khối *Environment* → tra cấp
độ ở bảng E2 → áp profile tương ứng. Khi không chắc model thuộc đâu → mặc định **CHUẨN** (an toàn).

### E3. Model hiện tại

> **Fable 5 (Claude 5, `claude-fable-5`) → cấp Mạnh → profile NHẸ.** Chuyển từ Opus 4.8 ngày
> 2026-07-02 — cùng cấp Mạnh nên **không đổi profile**; đồng thời cập nhật model pin trong 10
> agent definition (opus-4-7/4-8 → `claude-fable-5`; sonnet-4-6 → `claude-sonnet-5`).
> Ba điều chỉnh profile Nhẹ đã áp từ đời Opus 4.8 (BA Lead duyệt 2026-06-24) giữ nguyên:
> - ✅ **Evaluator theo rủi ro** — đã sửa CLAUDE.md §0.5.2: 2-pass BẮT BUỘC chỉ với deliverable
>   rủi-ro (đẩy `ba/sync/`, giao khách/stakeholder, quyết định scope/yêu cầu); nháp nội bộ
>   `workspace/drafts/` rủi-ro-thấp được tự rà. Integrity giữ nguyên (không tự nâng Approved khi
>   Quality Gate chưa sạch).
> - ✅ **Getting-bearings rút gọn** — đã sửa CLAUDE.md §0.5.1: đường rút gọn (tracker + INDEX) là
>   đủ; chỉ dùng `project-coordinator` Mode-B đầy đủ khi Chuẩn/Nặng hoặc trạng thái mơ hồ.
> - ✅ **Context-reset / sprint-contract / 1-task-per-session** — vốn KHÔNG hard-mandate trong
>   CLAUDE.md (chỉ là G10, ưu tiên thấp); ở profile Nhẹ giữ tắt, không cần gỡ gì thêm. Opus 4.8
>   gần như hết context-anxiety [N2] + cửa sổ 1M.
> - **Giữ nguyên toàn bộ lớp Bất biến** (guard-safety, language, traceability, INDEX, versioning).

### E4. Quy trình chuyển profile (kết hợp Phần D)

1. Đổi model nền → tra E2 → xác định profile đích.
2. **Chỉ đụng lớp Bù năng lực.** Gỡ/đắp **từng thành phần một**, đo tác động (Phần D.2) — không
   bulk.
3. Log `old profile → new profile + model + lý do + ngày` vào [`SYNC-LOG.md`](../sync/SYNC-LOG.md);
   nếu sửa rule trong CLAUDE.md thì bump version.
4. Chuyển sang model **yếu hơn** → đắp lại scaffolding *trước* khi giao task ở rìa năng lực (đừng
   chờ lỗi xảy ra).
5. **Human quyết định** (§0) — agent đề xuất profile + thành phần cần gỡ/đắp, BA Lead duyệt.

---

*v1.2 — 2026-07-02 — E3: model hiện tại Opus 4.8 → **Fable 5** (Claude 5, cùng cấp Mạnh, profile Nhẹ
không đổi); ghi nhận re-pin model 10 agent definition (fable-5 / sonnet-5). Theo yêu cầu BA Lead.*
*v1.1 — 2026-06-24 — thêm Phần E: profile harness theo cấp độ model (heavy↔light) — phân lớp
Bất biến vs Bù năng lực, bảng 3 profile ↔ cấp model, định vị Opus 4.8 → profile Nhẹ. Theo yêu cầu BA Lead.*
*v1.0 — 2026-06-17 — tác giả: agent (theo yêu cầu BA Lead). Tổng hợp N1–N4 + đề xuất cải tiến harness TOSS.*
