# AGENTS.md — Entry Point for Non-Claude Agents (OpenAI Codex, etc.)

> **Auto-loaded by OpenAI Codex** (and any agent following the AGENTS.md convention). This file is a **thin adapter** — the canonical project context lives in [CLAUDE.md](CLAUDE.md). Do NOT duplicate content here; fix drift by pointing to CLAUDE.md.

---

## 1. FIRST ACTION — Read the canonical context

**Read [CLAUDE.md](CLAUDE.md) in full before doing anything else.** Every rule in it binds you exactly as it binds Claude Code agents, in particular:

- **§0 — Human vs Agent responsibility:** humans decide/infer; agents decompose and faithfully assemble what humans recorded. NO speculative inference; every statement must cite its source.
- **§0.3 — Human-first execution:** if a task is faster done manually by the human, give step-by-step instructions instead of attempting it.
- **§0.1 — Document workflow:** currently **P4 — Co-evolution Hybrid** (see CLAUDE.md §1 field).
- **§0.4 — First-session identity & role setup** (adapted for Codex — see §2 below).
- **§7 — Language rules:** internal reasoning in English; ALL human-facing output in professional Vietnamese.
- **§8 — Output conventions:** file locations, YAML frontmatter, document IDs, traceability, Word-export standard.
- **§9 — Dual-scope sync** (adapted for Codex — see §3.2 below).

The Vietnamese mirror for humans is [HUMAN.md](HUMAN.md).

---

## 2. Identity & role — Codex adaptation of §0.4 (MANDATORY)

Claude Code stores the user's identity in per-machine agent memory. **Codex has no persistent memory**, so this project uses a local identity file instead:

1. At session start, read **`identity.local.md`** at the project root.
2. **If it exists** — trust it as the established identity/role; proceed under that role's permissions.
3. **If it does NOT exist** — before any role-gated action (approve, scope decisions, workflow selection, editing `ba/sync/*`), ask the user (in Vietnamese):
   - Họ tên / cách xưng hô;
   - Vai trò BA: BA Lead / Senior BA / Mid BA / Junior BA / Intern;
   - Phân hệ được phân công (nếu có).
   Cross-check against §3 of [`PHAN-CONG-ROLE-BA-v0.1.md`](ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md); flag conflicts to the BA Lead. Then **create `identity.local.md`**:

   ```markdown
   # Identity — local only, never commit/share
   name: <tên>
   role: <BA Lead | Senior BA | Mid BA | Junior BA | Intern>
   subsystem: <phân hệ hoặc "(chưa phân công)">
   confirmed: <YYYY-MM-DD>
   ```

4. `identity.local.md` is **git-ignored and excluded from handover zips** — it must never travel to another machine/person.
5. Until identity is established: read/analysis tasks only; no approval, no publishing to `ba/sync/`, no workflow changes.

---

## 3. Codex-specific adaptations (no runtime parity with Claude Code)

### 3.1 Skills / slash commands → follow the procedure docs manually

Claude Code skills (`/brd`, `/interview`, `/userstory`, `/meeting-notes`, export-word, gen-mockup…) do not run in Codex. The **procedures are plain markdown** — read and follow them manually when the user requests that capability:

| User asks for | Follow |
|---|---|
| BRD, user story, interview questions, stakeholder matrix… | `.claude/commands/<name>.md` |
| "Xuất Word" / đóng gói tài liệu giao khách hàng | `.claude/skills/export-word/SKILL.md` → run `scripts/export-word.ps1` with a manifest |
| Mockup / prototype HTML | `.claude/skills/gen-mockup/SKILL.md` |
| Tổng hợp biên bản họp từ transcript | `.claude/skills/meeting-synthesize/SKILL.md` (if present) or `.claude/commands/meeting-notes.md` |
| Angular feature code-gen | `.claude/skills/gen-*/SKILL.md` + `.claude/rules/angular-guidelines.md` |
| Phân rã PDF / tài liệu Office (DOCX/PPTX/XLSX/HTML) sang Markdown | `.claude/skills/crawl-pdf/SKILL.md` **§0** — định tuyến engine + cài đặt (markitdown cho Office; **pymupdf4llm** cho PDF giữ cấu trúc, fallback pdftotext -layout). Lệnh python/wsl/apk chạy được cho MỌI loại agent |

### 3.2 Sync hook → manual discipline

Claude Code fires a `PostToolUse` hook reminding about dual-scope mirrors. Codex has no hooks, so **you must self-enforce CLAUDE.md §9**: after editing any tracked file under `.claude/{agents,commands,templates,glossary}/` or root `CLAUDE.md`/`HUMAN.md`, update the mirror in the same task, bump versions, and append to [`.claude/sync/SYNC-LOG.md`](.claude/sync/SYNC-LOG.md). You can run `.claude/sync/sync-check.ps1` manually to identify the mirror path.

### 3.3 Sub-agents → role prompts

`.claude/agents/*.md` define Claude sub-agent personas (business-analyst, 02-sa…07-qa, code-reviewer). In Codex, treat each as a **role prompt**: when doing that type of task, read the file and adopt its persona, constraints, and output format.

### 3.4 Tooling notes

- Platform: Windows; prefer PowerShell syntax in shell commands.
- `ba/workspace/input/` is **read-only** — never write there.
- Respect `.aiignore` (token-heavy paths: logs, exports, binaries).
- **Phân rã tài liệu → Markdown** (đỡ token: convert chạy ở máy, 0 token mô hình; sau đó đọc/Grep chọn lọc bản `.md`). Định tuyến engine theo định dạng — **lệnh tool-neutral, mọi agent chạy được**:
  - **Office** (DOCX/PPTX/XLSX/HTML/CSV) → `python -m markitdown "<file>" -o "<out.md>"`. Cài: `python -m pip install --user "markitdown[all]"` (đã cài v0.1.6).
  - **PDF (mặc định, giữ cấu trúc → .md)** → `python .claude/skills/crawl-pdf/scripts/pdf-to-md.py "<file|dir>" "<out-dir>"` (pymupdf4llm: heading/bảng/bold; pure Python). Cài: `python -m pip install --user pymupdf4llm`. **Fallback text thô/tốc độ** → `pdftotext -layout` (WSL `docker-desktop` Alpine: `wsl -d docker-desktop -- apk add --no-cache poppler-utils`; ephemeral, chạy lại khi `pdftotext: not found`).
  - Bản trích là **raw extract** (CLAUDE.md §0). Chi tiết + script: `.claude/skills/crawl-pdf/SKILL.md` §0.
- **Pull Google Drive / Sheets (LIVE)** → Markdown: `python .claude/skills/crawl-pdf/scripts/gsheet-to-md.py <id|url> <out.md>` (Sheet native, sạch) hoặc `gdrive-to-md.py` (file Office trên Drive). Cài `pip install --user gspread google-auth`; bật Sheets API + Drive API. **Auth = việc HUMAN (§0.3):** Service Account key JSON ở `.secrets/` (gitignore, KHÔNG commit/chia sẻ), Share file cho `client_email` của SA. Chi tiết: skill crawl-pdf §0.1.

---

## 4. Quick project facts

| Field | Value |
|---|---|
| Project | TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không (Airline Operations Management System) |
| Phase | Discovery & Requirements Analysis |
| Active workflow | P4 — Co-evolution Hybrid (CLAUDE.md §0.1/§1) |
| Primary sources | `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` · `VNA_TOSS.pptx` |
| Output language | Vietnamese (100% of human-facing deliverables) |
| Onboarding (human) | `ba/workspace/drafts/quy-trinh/ONBOARDING-GUIDE-v0.1.md` · handover guide: `HUONG-DAN-BAN-GIAO-CODEX.md` |

---

*AGENTS.md version 1.2 — 2026-06-16. Thin adapter for non-Claude agents; canonical context = [CLAUDE.md](CLAUDE.md). No HUMAN mirror required (content lives in CLAUDE.md/HUMAN.md).*
*v1.2: §3.4 — bổ sung kết nối **Google Drive/Sheets LIVE** (gsheet-to-md.py / gdrive-to-md.py qua Service Account; key JSON ở `.secrets/` gitignore, auth = việc human §0.3) cho mọi loại agent.*
*v1.1: §3.1 + §3.4 — bổ sung engine phân rã tài liệu (markitdown cho Office, pdftotext -layout cho PDF + cài poppler-utils trong docker-desktop) để MỌI loại agent (không chỉ Claude) đều dùng được; trỏ chi tiết về skill crawl-pdf §0.*
