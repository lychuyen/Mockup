# Provenance UX — Đặc tả "Tại sao tôi nên tin điều này?" thành yêu cầu kiểm thử được

> Tài liệu tham khảo nội bộ (AGENTS scope). Tóm lược **trung thực** từ bài gốc *"Provenance UX:
> How to Specify 'Why Should I Believe This?' in Product Requirements"* — Morgan Masters,
> ModernAnalyst.com, 08/02/2026. Nguồn PDF: `Provenance UX — Modern Analyst.pdf` (cùng thư mục) ·
> [URL](https://www.modernanalyst.com/Resources/Articles/tabid/115/ID/7146/Provenance-UX-How-to-Specify-Why-Should-I-Believe-This-in-Product-Requirements.aspx).
> Không có mirror VI bắt buộc (`.claude/knowledge/` — CLAUDE.md §9).
>
> **Liên hệ §0:** đây chính là "UX hóa" nguyên tắc traceability của framework — mọi khẳng định
> phải truy được về nguồn. Đặc biệt hữu ích cho tính năng **có AI đưa ra khẳng định** ảnh hưởng
> quyết định (vd BTTM — hệ mua sắm tích hợp AI).

---

## 1. Provenance UX là gì
**Trải nghiệm GIẢI THÍCH một câu trả lời, không chỉ trình bày nó** — biến *"đây là kết luận"* thành
*"đây là lý do kết luận này đáng tin"*. *"Confidence ≠ correctness"*: nếu sản phẩm không trả lời
được "tại sao nên tin" một cách nhất quán thì đó không phải "AI" mà chỉ là "bộ sinh chữ rất tự tin".

Provenance trả lời 6 câu hỏi người dùng luôn hỏi (ra tiếng hoặc thầm):
1. **Where did this come from?** — nguồn (sources)
2. **How current is it?** — độ mới (freshness)
3. **How sure are we?** — độ tin/bất định (confidence/uncertainty)
4. **What if sources disagree?** — xung đột (conflicts)
5. **Why is it different than yesterday?** — "what changed"
6. **Can we prove it later?** — kiểm toán/xuất bằng chứng (audit/export)

**Provenance là HÀNH VI SẢN PHẨM, không phải trang trí.** Khi khẳng định ảnh hưởng **tiền/tuân
thủ/an toàn/phê duyệt** → provenance không phải tùy chọn, là "phí vào cửa".

## 2. Failure mode phổ biến — "answers without receipts"
Đội ngũ không cố ý ship câu trả lời thiếu tin cậy; họ ship vì coi provenance là *chi tiết UI* thay vì
*chủ đề yêu cầu*. "Danh sách tội" thường gặp:
- Hiện nguồn nhưng **không gắn vào từng claim** → vô dụng ("không phải provenance, đó là *vibes*").
- Trích nguồn **cũ mà không thừa nhận**.
- Hai nguồn mâu thuẫn, AI tự chọn **không giải thích**.
- Câu trả lời đổi giữa các lần chạy, người dùng nhận **0 lời giải thích**.

→ Cách sửa **không** phải "thêm yêu cầu", mà **đặc tả provenance như mọi hành vi khác: quy tắc +
ca biên + tiêu chí chấp nhận kiểm thử được**.

## 3. Provenance Requirements Template (one-pager / tính năng hoặc / loại câu trả lời)
Điền **trước khi** viết user story. *"We should show sources" không phải là một yêu cầu.*

| Mục | Nội dung cần chốt |
|---|---|
| **A) Claim types** | Liệt kê loại khẳng định (fact, calculation, recommendation, summary, policy interpretation) + **đánh dấu high-risk** |
| **B) Allowed sources** | Nguồn được phép (systems of record, tài liệu nội bộ đã duyệt, file người dùng, nguồn ngoài đã duyệt) + **nguồn loại trừ (ghi rõ)** |
| **C) Citation rules** | Khi nào bắt buộc nguồn & hiển thị ra sao (inline per-claim, "Sources" drawer, footnote, hoặc kết hợp) |
| **D) Freshness SLA** | Tuổi tối đa theo từng loại claim + freshness hiện ở đâu (dấu thời gian trên dữ liệu/nguồn) |
| **E) Confidence/uncertainty** | Định nghĩa High/Medium/Low + khi nào hệ thống phải nói **"I don't know"** hoặc hỏi làm rõ |
| **F) Conflict handling** | Khi claim mâu thuẫn: hiện cả hai? giải thích lựa chọn? gắn cờ review? |
| **G) "What changed?"** | Trigger sinh giải thích thay đổi (nguồn mới/refresh/đổi version) + người dùng thấy gì |
| **H) Audit export** | Định dạng xuất, ai được xuất, quy tắc lưu trữ/truy cập |
| **I) Validation** | Vài test-case bắt buộc-đậu: stale source, missing source, conflict, low confidence, export đầy đủ |

## 4. Khi nào HIỆN nguồn (và khi nào không)
**Hiện mặc định** khi câu trả lời mang tính quyết định: hướng dẫn chính sách/tuân thủ · tiền/tổng/giá/
điều kiện · "recommendation" hàm ý rủi ro · tóm tắt tài liệu/hồ sơ.
**Để tùy chọn ("Show sources")** khi rủi ro thấp: bước điều hướng cơ bản, phép tính đơn giản tái lập được.

## 5. Conflict handling — protocol khi nguồn mâu thuẫn (làm cho NHÌN THẤY ĐƯỢC)
Thứ tự tie-breaker (flowchart bài gốc): **Authority** (system of record/chủ sở hữu chính sách thắng
commentary) → nếu ngang nhau thì **Recency** (mới hơn / khớp ngữ cảnh người dùng) → **Specificity**
(cụ thể với ngữ cảnh hơn) → còn lại **Flag for User Review**.
UX tốt phải *nói ra*: *"Hai nguồn mâu thuẫn. Tôi dùng Nguồn A vì là system of record và mới hơn.
Đây là nội dung Nguồn B."*

## 6. Freshness SLA — đòn bẩy niềm tin đơn giản nhất
*"Users forgive uncertainty faster than they forgive stale answers delivered with confidence."*
**Không chọn một con số — chọn một bảng nhỏ** (ví dụ): policy ≤ 30 ngày · rates/pricing ≤ 24h ·
availability/inventory ≤ 15 phút · general info ≤ 180 ngày · file người dùng = "tuổi = lúc upload".
Khi quá hạn → 3 lựa chọn: **Refuse** (rủi ro cao) · **Warn + proceed** (trung bình) · **Proceed
silently** (dùng dè dặt). Luôn kèm **next step** (refresh/nguồn thay thế/escalate).

## 7. Trust Triad (Venn "User Trust") — đủ 3 mới "dính"
**Confidence** (uncertainty behavior) + **Transparency** ("what changed") + **Auditability**
(export/verification).
- **Confidence:** chọn lược đồ bảo vệ được (High/Med/Low, hoặc Verified/Unverified, hoặc rule-based:
  high chỉ khi *có nguồn + mới + không xung đột*). Vạch rõ khi nào phải nói **"I don't know"** (thiếu
  nguồn cho claim bắt buộc / xung đột không có tie-breaker / freshness fail với claim rủi ro cao).
- **"What changed?":** trigger + (các) hạng mục bị ảnh hưởng + giải thích ngắn + link bản trả lời trước.
- **Audit export:** ai xuất (role-based) · format (CSV/JSON/PDF) · trường tối thiểu (answer, citations,
  timestamps, confidence, version IDs).

## 8. Câu chữ requirement có thể "mượn" (per-claim là từ khóa)
- **REQ-PROV-001:** phản hồi chứa factual claim/policy guidance → citation **per-claim** (mỗi claim ≥1 nguồn).
- **REQ-PROV-002:** có "Sources view" gồm source name, section/title, date, timestamp.
- **REQ-PROV-101:** khi mâu thuẫn → hiện (a) giá trị chọn, (b) giá trị cạnh tranh, (c) lý do chọn theo tie-breaker.
- **REQ-PROV-201:** hiện freshness indicator cho nguồn nhạy thời gian ("Updated 3 hours ago").
- **REQ-PROV-202:** nguồn quá freshness SLA → refuse/warn + next step (refresh/alternate/escalate).
- **REQ-PROV-402:** khi tạo câu trả lời khác biệt đáng kể cùng ngữ cảnh → "What changed?" (trigger + claim ảnh hưởng).
- **REQ-PROV-403:** user có quyền xuất audit record (response + sources + timestamps + confidence + version IDs).

**Acceptance criteria mẫu:** *Given* một claim nhạy thời gian · *When* nguồn cũ hơn SLA · *Then* hệ
thống warn/refuse theo copy đã cấu hình · *And* đề xuất next step.

## 9. Figure trong bài (4 hình nội dung)
1. **Banner (tr.2):** 4 icon — *Data Origin · Verification · Secure Transfer · User Trust Interface*.
2. **Mockup thẻ trả lời (tr.4):** ví dụ chính sách PTO với citation `[1] [2]`, chỉ báo *High Confidence*,
   *"Data updated: 2 hours ago"*, panel *Source: Employee Handbook 2024, p.10 · Date · Status: Verified*.
3. **Flowchart xung đột (tr.5):** Authority? → Recency? → Specificity? → Flag for User Review.
4. **Venn "User Trust" (tr.6):** giao của Confidence × Transparency × Auditability.

*v1.0 — tóm lược trung thực từ bài ModernAnalyst (PDF gốc kèm trong thư mục). Generic — áp được cho mọi dự án có tính năng AI/khẳng định cần truy nguồn.*
