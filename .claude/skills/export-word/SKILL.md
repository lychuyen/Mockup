---
name: export-word
description: Xuất bộ tài liệu Markdown của dự án TOSS (SRS, Wireframe, BRD…) thành file Word .docx TỰ MÔ TẢ (không link .md nội bộ) và TRÌNH BÀY theo biểu mẫu chính thức Viettel QT02.BM.04 (Times New Roman, heading đen, bảng viền đen + header xám, logo + footer mã hiệu/số trang, mục lục tự động). Dùng khi người dùng muốn "xuất file Word", "đóng gói tài liệu giao khách hàng", "export docx", hoặc cần bản giao người (human-facing) từ các file .md nội bộ.
metadata:
  version: "1.1.0"
---

# Skill: Xuất Word chuẩn Viettel QT02.BM.04

> **Nguyên tắc cốt lõi:** Markdown là kênh **nội bộ giữa các agent**; file Word giao **người ↔ người** phải **tự mô tả đầy đủ** (không tham chiếu tệp `.md`) và **trình bày đúng biểu mẫu Viettel QT02.BM.04**. File `.md` nguồn **giữ nguyên link** (cho agent điều hướng); mọi biến đổi/định dạng chỉ áp **khi xuất**.

## 0.0. NỘI DUNG BẢN GIAO NGƯỜI — VĂN PHONG NGƯỜI (BẮT BUỘC)
Tài liệu giao người (báo cáo khảo sát, BRD, biên bản giao khách…) phải **đọc như do người viết**, không lộ dấu vết quy trình nội bộ/AI:
- **KHÔNG đối chiếu nội bộ:** bỏ mọi câu kiểu "đối chiếu glossary…", "khớp glossary/domain-knowledge", "→ glossary X", "xem `domain-knowledge/…`", trỏ memory `[[...]]`. Truy vết nội bộ chỉ để ở bản nháp/làm việc, KHÔNG đưa vào bản giao người.
- **KHÔNG ký hiệu kiểu AI:** không dùng mũi tên `→` thay câu, không emoji, không "✅/⚠", không gắn cờ `[cần xác nhận]` rải khắp — nếu cần lưu ý thì viết thành câu tự nhiên ("một số nội dung cần đối chiếu lại với người dự họp").
- **KHÔNG ghi nhận lỗi/đính chính ASR trong bản giao khách (CHỈ ở MD):** mọi chú thích về lỗi nhận dạng giọng nói (ASR) — kiểu *"(Đính chính ASR…)"*, *"trước đây chép nhầm là …"*, *"lỗi ASR của …"*, *"có thể là …"*, danh sách "Cảnh báo chất lượng ghi âm (ASR)" — là **dấu vết quy trình nội bộ**, chỉ tồn tại trong file `.md` (kênh agent). **Bản Word official gửi khách hàng phải trình bày thuật ngữ ĐÚNG ngay trong câu, không kèm đính chính** (vd viết thẳng "cảnh báo **NOTAM** mới phát sinh", KHÔNG viết "Lotang → NOTAM" hay "(đính chính ASR…)"). Toàn bộ chú thích đính chính/cảnh báo ASR phải được **gỡ khi xuất** (xem bước strip §2). Lý do: tài liệu official không được lộ rằng nội dung từng bị nhận dạng sai.
- **Văn phong người, cấu trúc theo loại tài liệu:** giọng BA tự tin, không lan man, không "mô tả theo hướng AI". Gạch đầu dòng/bảng ĐƯỢC dùng khi nội dung là liệt kê. **Báo cáo khảo sát TOSS dùng cấu trúc chuẩn theo từng chủ đề: "Yêu cầu" / "Thảo luận – Đề xuất" / "Kết luận"** (xem `SOP-BAO-CAO-KHAO-SAT` + skill `survey-report`); KHÔNG dùng kiểu liệt kê theo bên "Bên VTIT/VNA trao đổi" nữa (chuẩn cũ 08/06–09/06 đã được thay). Điều cần tránh là **ký hiệu AI + đối chiếu nội bộ + cờ rải khắp**, KHÔNG phải tránh mọi gạch đầu dòng.
- Mã yêu cầu/hệ thống (TOSS-001, tên hệ thống) được nêu tự nhiên trong câu khi cần, không kèm chú thích trỏ nguồn nội bộ.

## 0. Quy tắc VERSION (BẮT BUỘC)
- Tên file ra **luôn kèm version + ngày**: `<Base>-v<Version>-<yyyy-MM-dd>.docx` (vd `SRS-TOSS-MES-S5-v2.1-2026-06-02.docx`).
- **KHÔNG ghi đè file cũ.** Khi **nội dung đã chốt** → **tăng version** (file mới); file cũ giữ làm lịch sử.
- Script `export-word.ps1` **từ chối ghi đè** nếu trùng tên (chỉ cho `-Force` khi đang nháp cùng version trong ngày).
- *(File hiện trong `ba/process/exports/` tên không có ngày là bản nháp cũ — bản chốt phải theo quy ước version trên.)*

## 1. Khi nào dùng
Khi cần tạo bản Word giao người từ ≥1 file `.md` (SRS, Wireframe, BRD, FRD…). Yêu cầu môi trường: **pandoc** (`C:\Users\VTIT\AppData\Local\Pandoc\pandoc.exe`) — nếu chưa có: `winget install --id JohnMacFarlane.Pandoc -e --scope user`.

## 2. Quy trình (5 bước — đã đóng gói vào script)
1. **Bỏ link nội bộ:** (a) đích link không phải `http(s)`/`mailto` → giữ nhãn; (b) bỏ path+đuôi `.md`/`.html` (giữ `.xlsx`/`.docx` nguồn thật); (c) bỏ **stem tên-file** còn sót (slug dẫn đầu bằng số mục hoặc `wf-`). Bỏ YAML frontmatter từng file.
   - **(d) Gỡ chú thích đính chính/cảnh báo ASR (§0.0):** xóa các câu/chú thích trong ngoặc `*(…)*` chứa "ASR", "đính chính", "chép nhầm", "lỗi nhận dạng"; xóa cả mục "Cảnh báo chất lượng ghi âm (ASR)". Giữ lại thuật ngữ ĐÚNG đã được sửa trong câu (không giữ vế sai). *(Đã tự động hoá trong `StripAsr` của script — chạy trên bản copy, KHÔNG sửa `.md` gốc.)*
   - **(e) Gỡ dấu vết NỘI BỘ khác (§0.0) — `StripInternal`:** bỏ dòng "Lưu ý nội bộ"; bỏ chú thích đối chiếu chứa "domain-knowledge"/"glossary"; bỏ khung đề xuất glossary ("CHỈ đề xuất"); bỏ trỏ "OID-TOSS-001"/"sổ theo dõi điểm chốt"; bỏ **trích dẫn dòng transcript** "(P1 d.x)"/"(P2 d.x)" (kể cả dạng trần trong ô bảng). Lý do: bản giao khách không lộ truy vết nội bộ/AI.
   - **(f) Gỡ THẺ TRÍCH NGUỒN khảo sát (§0.0) — `StripInternal` e14:** bỏ thẻ truy vết inline dạng `[DDMMYYYY §...]` (vd `[17062026 §5–§7]`, kể cả hậu tố `-sáng`/`-chiều`), `[MEL ...csv...]`, `[YCKT ...]`. Đây là truy vết nội bộ giữ trong `.md` cho agent, KHÔNG đưa vào bản Word giao khách. Lý do: khách chỉ đọc nội dung nghiệp vụ, không đọc mã trích § của transcript.
2. **Áp template** `.claude/templates/word-reference.docx` qua `--reference-doc` (style QT02 + letterhead) + mục lục `--toc`.
3. **(Template đã dựng sẵn)** — nếu cần dựng lại: `build-reference-template.ps1` (font/theme/bảng + header logo + footer mã hiệu/số trang).
4. **Vá logo header** vào docx (pandoc bỏ ảnh của reference): chèn `media/logo.png` + `header1.xml.rels` + `Default png` bằng `ZipArchive` 'Update'.
5. **QC** (đọc `document.xml`/`styles.xml`/`theme1.xml`) — phải PASS hết (xem §4).

## 3. Cách chạy
```powershell
# SRS
.\.claude\skills\export-word\scripts\export-word.ps1 `
  -SourceList "@.claude\skills\export-word\manifests\srs.txt" `
  -Title "SRS — Hệ thống MES Nhà máy S5 (TOSS)" `
  -Subtitle "Đặc tả Yêu cầu Phần mềm · trình bày theo QT02.BM.04" `
  -OutBase "SRS-TOSS-MES-S5" -Version "2.1" -TocDepth 3

# Wireframe
.\.claude\skills\export-word\scripts\export-word.ps1 `
  -SourceList "@.claude\skills\export-word\manifests\wireframe.txt" `
  -Title "WIREFRAME — Hệ thống MES Nhà máy S5 (TOSS)" `
  -Subtitle "Wireframe theo phân hệ · trình bày theo QT02.BM.04" `
  -OutBase "WIREFRAME-TOSS-MES-S5" -Version "1.0" -TocDepth 2
```
`-SourceList` nhận `@<tệp manifest>` (mỗi dòng 1 path, `#` = chú thích) hoặc chuỗi path ngăn cách dấu phẩy. Cập nhật manifest khi thêm/bớt/đổi thứ tự file.

**Tham số tùy chọn căn chỉnh đầu ra:**
- `-Formal` — **tài liệu yêu cầu (BRD/SRS)**: VẪN áp văn phong người (strip ASR + dấu vết nội bộ: ref OID `*(xem OID: KS-xx)*`, đường dẫn/tên file nội bộ, phụ lục "Tài liệu nguồn/Nguồn tài liệu đã đọc", dòng tóm tắt liệt kê ≥4 mã OID — rule e16–e20), nhưng **nới QC** mũi tên/tiếng Anh/backtick vì mã BR, ví dụ "VNA893 → A893", thuật ngữ kỹ thuật là **nội dung hợp lệ** của BRD. Giữ nội dung yêu cầu (mã BR, định nghĩa) nguyên vẹn.
- `-NoToc` — bỏ mục lục (báo cáo khảo sát thường dùng; tài liệu dài như SRS/BRD để mặc định có TOC).
- `-Font "<tên font>"` — đổi font chữ toàn cục (mặc định `Times New Roman` chuẩn QT02). Override cả `styles.xml` + `theme1.xml` lúc xuất, **giữ Consolas cho code**. Đổi font là lệch chuẩn QT02 — cần BA Lead chấp nhận.
- `-FontSize <pt>` — đổi cỡ chữ body trong docDefaults (mặc định 0 = giữ 12pt template).
- `-TitleSize <pt>` / `-TitleAlign "<center|left|right>"` — chỉnh cỡ/căn lề **tiêu đề tài liệu** (style "Title" sẵn có trong template; mặc định 28pt căn giữa). **Tiêu đề render qua title block của pandoc** (`--metadata title`), KHÔNG còn là Heading 1 — dòng `# ` đầu tiên trong nguồn bị bỏ tự động để tránh tiêu đề lặp. Phụ đề là dòng in nghiêng ngay dưới.
- `-H1Font "<tên>"` / `-H1Size <pt>` / `-H1Bold` / `-H1Align "<center|left|right>"` — đổi riêng font/cỡ/in đậm/căn lề **Heading 1** (= tiêu đề tài liệu, do script render `# $Title`). Vá đúng style block `Heading1`, không đụng heading khác.
- `-H2Font` / `-H2Size` / `-H2Bold` / `-H2Align` — **Word Heading2** = mục lớn `## I, II`.
- `-H3Font` / `-H3Size` / `-H3Bold` / `-H3Align` — **Word Heading3** = mục con `### I.1, I.2`.

> **ÁNH XẠ CẤP (quan trọng — dễ nhầm):** Tiêu đề tài liệu = **Title** (`#`). Mục lớn "I, II" = **Word Heading2** (`##`). Mục con "I.1, I.2" = **Word Heading3** (`###`). Người dùng thường gọi "I, II" là *Heading 1* và "I.1, I.2" là *Heading 2* — nhưng trong Word/markdown chúng là **Heading2/Heading3**. Luôn xác nhận cấp trước khi áp định dạng.

- Ví dụ (chuẩn đang dùng cho báo cáo khảo sát): tiêu đề 18pt căn giữa, mục lớn I/II 16pt bold, mục con I.1/I.2 13pt bold, thân 13pt: `... -NoToc -FontSize 13 -TitleSize 18 -H2Size 16 -H2Bold -H3Size 13 -H3Bold`. QC font tự khớp theo các font đã chọn (kèm Consolas); QC "heading bold đúng thứ tự schema" kiểm `<w:b/>` đặt ngay sau `<w:rFonts/>`.

## 4. Checklist QC (script tự kiểm, phải PASS hết)
- `.md` = 0 · `](` (link markdown) = 0 · **slug tên-file = 0** · không lọt khóa YAML · không mojibake.
- **Chú thích ASR = 0:** không còn "ASR", "đính chính", "chép nhầm", "lỗi nhận dạng", mục "Cảnh báo chất lượng ghi âm" trong `document.xml` (§0.0).
- **Dấu vết nội bộ = 0:** không còn "Lưu ý nội bộ", "domain-knowledge", "glossary", "OID-TOSS", "sổ theo dõi điểm chốt", trích dẫn dòng transcript "P1 d./P2 d." (§0.0).
- **Thẻ trích nguồn khảo sát = 0:** không còn thẻ `[DDMMYYYY §...]`, `[MEL ...csv...]`, `[YCKT ...]` trong `document.xml` (giữ trong `.md`, strip ở Word — §0.0).
- Gói OPC: entry dùng `/` (**không `\`**) · có `media/logo.png` + `header1.xml` + `footer1.xml` + field TOC.
- **FONT đồng bộ:** mọi `w:ascii`/theme = **Times New Roman** (`Aptos`/`Calibri`/`Cambria` = 0); chỉ `Consolas` và chỉ ở code/verbatim.
- XML well-formed · đủ các mục/section mong đợi.

## 5. BÀI HỌC — các sai sót đã gặp (đừng lặp lại)
| # | Sai sót | Nguyên nhân | Cách đúng |
|---|---|---|---|
| 1 | Word còn link `.md` chết | md là kênh agent, không strip khi xuất | Strip link nội bộ; verify `.md`=0 |
| 2 | Lọt **stem tên-file** ("3.1-phan-he-quan-ly-kho") | nhãn link chính là tên file (TOC/bảng cấu trúc) | `StripSlugs` chỉ gỡ slug dẫn đầu **số mục/`wf-`** (giữ `end-to-end`, `low-fidelity`, `MO-2026-012`) |
| 3 | Gói docx hỏng, `GetEntry` lỗi | `ZipFile::CreateFromDirectory` (.NET Framework) ghi entry bằng `\` | Đóng gói thủ công `CreateEntry(rel.Replace('\\','/'))` |
| 8 | Word lọt **thẻ trích nguồn** `[17062026 §5–§7]` | báo cáo khảo sát gắn thẻ `[DDMMYYYY §...]`/`[MEL …csv]`/`[YCKT …]` cho truy vết (kênh agent) | `StripInternal` e14 gỡ thẻ trích; giữ trong `.md`. QC "no survey source citation" = 0 (BA Lead 18/06/2026) |
| 9 | QC ASR **false-positive**: "sao **chép nhầm** tệp" (nghiệp vụ) bị rule `chép nhầm` chặn | keyword `chép nhầm` quá rộng — chú thích ASR thật là "chép nhầm **là/thành** X" | Thu hẹp rule: `chép nhầm (?:là\|thành\|→)` ở cả `$kw` (StripAsr) và QC "no ASR note leak" → chỉ bắt đúng chú thích ASR (BA Lead 22/06/2026) |
| 4 | Logo header mất trong file ra | **pandoc bỏ ảnh** khi copy header từ reference | Hậu xử lý: chèn lại `media/logo.png` + `header1.xml.rels` + `png` content-type |
| 5 | **Font không đồng bộ** (Heading3-9/Subtitle/TOC ra Aptos) | theme pandoc = `Aptos`; style tham chiếu theme rơi về Aptos dù docDefaults là TNR | **Sửa `theme1.xml` latin major+minor = Times New Roman** (giữ Consolas cho code) |
| 6 | QC sót | chỉ kiểm rò rỉ, **quên kiểm font** | QC kiểm CẢ font (§4) |
| 7 | Ghi đè file đã chốt | tên file không có version/ngày | Tên `...-v<ver>-<ngày>.docx`, không ghi đè |
| 10 | Lọt **trích dẫn ghi âm dạng ngoặc đơn** "(sáng 00:46–01:13)" | e14 chỉ strip dạng ngoặc vuông `[DDMMYYYY HH:MM]`; báo cáo 18/06 dùng dạng ngoặc đơn `(sáng/chiều HH:MM–HH:MM)` nên 54 trích dẫn lọt vào Word | Thêm `StripInternal` e15 gỡ `(sáng\|chiều\|trưa\|tối HH:MM[:SS][–HH:MM])`; QC "no recording timestamp" = 0 (BA Lead 22/06/2026) |
| 11 | Mục lục không cần cho báo cáo khảo sát | tài liệu ngắn, người đọc không cần TOC | Tham số `-NoToc` bỏ `--toc`; QC "TOC field" thành điều kiện (PASS khi không có TOC nếu `-NoToc`) (BA Lead 22/06/2026) |
| 12 | **Bold heading KHÔNG render** dù `<w:b/>` đã có trong style | chèn `<w:b/>` vào **đầu `<w:rPr>` (trước `<w:rFonts>`)** — sai thứ tự schema CT_RPr (bắt buộc rFonts→b→bCs→color→sz) → Word **lặng lẽ bỏ qua** | Chèn `<w:b/><w:bCs/>` **NGAY SAU `<w:rFonts/>`** (nếu không có rFonts thì sau `<w:rPr>`). Lưu ý chung: mọi phần tử chèn vào `rPr`/`pPr` phải đúng thứ tự schema, nếu không Word âm thầm bỏ qua (BA Lead 22/06/2026) |

## 5b. Biến thể 2 — SRS VNA/TIT (Tài liệu thiết kế chi tiết, có trang bìa QT02.BM.04)

**Khi nào dùng:** khi cần bản Word SRS **khớp 100% trình bày** với bộ SRS con người của đội BA (bản gốc `ba/workspace/drafts/srs/VNA.TOSS_SRS_*.docx`) — tức có **trang bìa BIỂU MẪU** (đơn vị + logo + mã hiệu dự án/tài liệu + tháng năm), **BẢNG GHI NHẬN THAY ĐỔI TÀI LIỆU**, **TRANG KÝ** (Người lập/Xem xét/Phê duyệt), **MỤC LỤC**, header/footer + số trang, đánh số phần A/B rồi 1 · 1.1 · 1.1.1. Khác Biến thể 1 (QT02 mặc định — chỉ letterhead logo, không trang bìa mã hiệu).

**Đặc tả định dạng đầy đủ (pt/hex/twips/style + checklist QC 100%):** [`.claude/knowledge/srs-word-format-vna-tit.md`](../../knowledge/srs-word-format-vna-tit.md). Đọc file này trước khi chỉnh mẫu.

**Cách chạy** (script riêng — KHÔNG đụng `export-word.ps1`):
```powershell
.\.claude\skills\export-word\scripts\export-word-srs-vna.ps1 `
  -SourceList "@.claude\skills\export-word\manifests\srs.txt" `
  -Title "SRS — Phân hệ Quản trị Hệ thống (TOSS)" `
  -OutBase "SRS-TOSS-System-Admin" -Version "0.1" `
  -DonVi "VTIT" -MaHieuDuAn "VNA.TOSS" -MaHieuTaiLieu "VNA.TOSS_SRS_System-Admin_v0.1" -ThangNam "01/2026" `
  -Pandoc "C:\Users\<user>\AppData\Local\Pandoc\pandoc.exe"
```
Tham số bìa: `-DonVi` `-MaHieuDuAn` `-MaHieuTaiLieu` `-ThangNam` (mặc định tháng/năm hiện tại) — thay các placeholder `{{DON_VI}}/{{MA_HIEU_DU_AN}}/{{MA_HIEU_TAI_LIEU}}/{{THANG_NAM}}` trong mẫu. Mặc định `-OutDir` = `ba/sync/output/human/exports`.

**Cơ chế (vì sao cần script riêng):** pandoc `--reference-doc` chỉ lấy **style + header/footer** từ mẫu, **KHÔNG chép nội dung TRANG BÌA**. Script hậu xử lý: (1) pandoc dựng body theo style mẫu `word-reference-srs-vna.docx`; (2) trích phần bìa (từ `<w:body>` tới trước "A - THÔNG TIN CHUNG") trong mẫu, điền placeholder, **chèn vào đầu body** + ngắt trang; (3) vá logo; (4) QC theo checklist §7 của knowledge.

**Giới hạn (cần thao tác tay — pandoc không tự làm):** (a) **đánh số heading 1/1.1/1.1.1**: viết sẵn số trong tiêu đề `.md` hoặc gán trong Word rồi F9 (mẫu gốc đánh số bằng `numPr` trực tiếp trên đoạn, không gắn ở style nên pandoc không kế thừa); (b) **cập nhật MỤC LỤC**: mở Word → Ctrl+A → F9; (c) **section landscape** cho bảng/sơ đồ lớn: chèn section break trong Word.

## 6. Tài sản skill
- `scripts/export-word.ps1` — Biến thể 1 (QT02 mặc định): xuất + transform + pandoc + vá + QC (tên file theo version).
- `scripts/export-word-srs-vna.ps1` — **Biến thể 2 (SRS VNA/TIT)**: pandoc + chèn trang bìa + điền placeholder + QC (§5b).
- `scripts/build-reference-template.ps1` — dựng lại mẫu `.claude/templates/word-reference.docx` (Biến thể 1).
- `.claude/templates/word-reference-srs-vna.docx` — mẫu tham chiếu Biến thể 2 (bìa + header/footer + style TNR + Table style + numbering).
- `assets/viettel-logo.png` — logo Viettel (lấy từ QT02 `image1.png`).
- `manifests/srs.txt`, `manifests/wireframe.txt` — danh sách file theo thứ tự.

> Chuẩn trình bày (phân tích từ QT02.BM.04): Times New Roman 12pt; heading TNR đậm ĐEN 14/13/12pt; bảng viền đen 0.5pt + header nền Xám nhạt `#D9D9D9`; header logo + "Tài liệu thiết kế chi tiết · vx.x"; footer "BM.04 · QT.TKKDL.QTDL" + Trang PAGE/NUMPAGES; mục lục tự động; locale `vi-VN`.
