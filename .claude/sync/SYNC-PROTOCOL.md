# SYNC-PROTOCOL.md — Dual-Scope Documentation Sync

> **Auto-loaded into agent context.** This protocol governs how files in the AGENTS scope and HUMAN scope stay synchronized.
>
> **SCOPE CHANGE (2026-07-02, BA Lead decision):** the VI-mirror requirement for `.claude/{agents,commands,templates,glossary}/` is **retired**. The only remaining mirrored pair is **`CLAUDE.md` ↔ `HUMAN.md`**. `.claude/human/` is **no longer a mirror tree** — it now holds **human role portraits** (chân dung vai trò con người trong dự án; see `.claude/human/README.md`). The old mirrors are parked at `.claude/human/_legacy/` (frozen, pending BA Lead deletion).

---

## 1. Architecture

The mirrored pair in this project is:

| Scope | Path | Audience | Language |
|---|---|---|---|
| **AGENTS** (canonical) | `CLAUDE.md` | AI agents — read by Claude Code at runtime | English-optimized (terse, structured) |
| **HUMAN** (mirror) | `HUMAN.md` | Human readers — stakeholders, BAs, new team members | Vietnamese (narrative, explanatory) |

The AGENTS file is **canonical** (Claude Code loads it). The HUMAN file is a **semantic mirror** for human reference.

Other `.claude/{agents,commands,templates,glossary,knowledge,examples}/` files are **single-language (EN or VI-primary) with no mirror obligation** — same regime as the DEV toolkit exception in CLAUDE.md §9.

---

## 2. File Mapping

| AGENTS scope (canonical, EN) | HUMAN scope (mirror, VI) |
|---|---|
| `CLAUDE.md` | `HUMAN.md` |

> **Retired mappings (2026-07-02):** the former per-file mirrors for `.claude/agents/*`, `.claude/commands/*`, `.claude/templates/ba/*`, `.claude/glossary/*` are discontinued. Their last synced VI versions are preserved read-only at `.claude/human/_legacy/` for reference until BA Lead approves deletion. Do NOT update `_legacy/` content.

---

## 3. Sync Rules

1. **When you edit `CLAUDE.md`, you MUST update `HUMAN.md` in the same task** (and vice versa). This is the only pair still under the mirror obligation.
2. The two versions must remain **semantically equivalent** — same rules, same checklists, same examples (with examples localized where natural).
3. **Single source of truth:** AGENTS scope is canonical. On conflict, AGENTS wins; HUMAN is regenerated from AGENTS.
4. **Frontmatter consistency:** `version` and `date` fields must be identical across the pair.
5. **Preserve placeholders:** `{{TÊN_TRƯỜNG}}` style placeholders in templates stay verbatim — they are user-facing in deliverables and must remain Vietnamese.
6. **Cross-references:** internal links must point to the correct scope. AGENTS files link to AGENTS files; HUMAN files link to HUMAN files.

---

## 4. Sync Process

When you edit one file in a pair:

1. **Identify the mirror** via the table in Section 2.
2. **Read both files** to understand current state.
3. **Translate the diff:**
   - AGENTS → HUMAN: rewrite in Vietnamese, expand brief points into clear prose, retain examples (translate or localize).
   - HUMAN → AGENTS: rewrite in English, condense narrative into structured bullets/tables, keep examples.
4. **Update both files' frontmatter:** `version` (bump patch) and `date` (today, ISO 8601).
5. **Log the change** in `.claude/sync/SYNC-LOG.md` with: date, files affected, summary.
6. **Verify cross-references** still resolve correctly.

---

## 5. Automated Reminder (Hook)

A `PostToolUse` hook on `Edit`/`Write` operations (`.claude/sync/sync-check.ps1`) automatically reminds the agent when a tracked file is modified. The hook:

- Fires only for the `CLAUDE.md` ↔ `HUMAN.md` pair (since 2026-07-02; it no longer requests mirrors for `.claude/{agents,commands,templates,glossary}/` or `.claude/human/`).
- Outputs the corresponding mirror path that needs updating.
- Does NOT block the edit — it nudges the agent to follow up.

If the hook fires, the agent must complete the sync before declaring the task done.

---

## 6. Conflict Resolution

If two files in a pair have diverged significantly (different content, different timestamps):

1. **Read both fully.**
2. **Compute a 3-way diff** mentally: AGENTS vs HUMAN vs intended state.
3. **Surface the diff to the user** with a concrete proposal.
4. **Wait for user decision** — do not silently overwrite.
5. After resolution, update both files and log in `SYNC-LOG.md`.

---

## 7. Initial Migration (one-time)

The first-time mirror creation was performed on **2026-05-26**. All HUMAN files were generated from the existing canonical files which were originally written in Vietnamese; the canonical files were subsequently translated/condensed into English to optimize for agent parsing. See `SYNC-LOG.md` entry `MIG-001`.

---

## 8. Exclusions (NOT synced)

These files do NOT have mirrors and are not subject to this protocol:
- `ba/workspace/*`, `ba/sync/*` — BA working area and team-shared deliverables, single-language by design (Vietnamese, per CLAUDE.md §7/§9).
- `.claude/{agents,commands,templates,glossary,knowledge,examples}/` — single-language, mirror obligation retired 2026-07-02.
- `.claude/human/` — human role portraits (VI-only content, not a mirror); `_legacy/` is frozen.
- `.claude/settings.local.json` — runtime configuration, no human mirror needed.
- `.claude/sync/*` — meta-files for the sync system itself.

---

*SYNC-PROTOCOL.md version 1.1 — 2026-07-02. v1.1: retired VI-mirror requirement for `.claude/{agents,commands,templates,glossary}` (BA Lead decision 2026-07-02); `.claude/human/` repurposed as human role portraits; old mirrors parked at `_legacy/`; `CLAUDE.md ↔ HUMAN.md` pair unchanged.*
*v1.0 — 2026-05-26.*
