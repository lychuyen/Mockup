<#
  export-word.ps1 — Xuất bộ file Markdown của dự án thành 1 file Word (.docx)
  TỰ MÔ TẢ (không link .md nội bộ) + TRÌNH BÀY theo biểu mẫu Viettel QT02.BM.04.
  Đã gói các bài học/sai sót (xem SKILL.md). Chạy bằng Windows PowerShell 5.1.

  VÍ DỤ:
    .\export-word.ps1 -SourceList "@.claude\skills\export-word\manifests\srs.txt" `
        -Title "SRS — Hệ thống MES Nhà máy S5 (TOSS)" `
        -Subtitle "Đặc tả Yêu cầu Phần mềm · trình bày theo QT02.BM.04" `
        -OutDir "ba/process/exports" -OutBase "SRS-TOSS-MES-S5" -Version "2.1" -TocDepth 3

  -SourceList: danh sách file .md THEO THỨ TỰ — hoặc "@<đường-dẫn-tệp>" (mỗi dòng 1 path),
               hoặc chuỗi nhiều path ngăn cách bởi dấu phẩy.
  Tên file ra: <OutBase>-v<Version>-<yyyy-MM-dd>.docx  (KHÔNG ghi đè; muốn ghi đè dùng -Force).
#>
param(
  [Parameter(Mandatory=$true)][string]$SourceList,
  [Parameter(Mandatory=$true)][string]$Title,
  [string]$Subtitle = "",
  [string]$OutDir = "ba/process/exports",
  [Parameter(Mandatory=$true)][string]$OutBase,
  [Parameter(Mandatory=$true)][string]$Version,
  [int]$TocDepth = 3,
  [switch]$NoToc,
  [switch]$Formal,
  [string]$Font = "Times New Roman",
  [int]$FontSize = 0,
  [int]$TitleSize = 0,
  [string]$TitleAlign = "",
  [string]$H1Font = "",
  [int]$H1Size = 0,
  [switch]$H1Bold,
  [string]$H1Align = "",
  [string]$H2Font = "",
  [int]$H2Size = 0,
  [switch]$H2Bold,
  [string]$H2Align = "",
  [string]$H3Font = "",
  [int]$H3Size = 0,
  [switch]$H3Bold,
  [string]$H3Align = "",
  [string]$Template = ".claude\templates\word-reference.docx",
  [string]$Pandoc = "C:\Users\VTIT\AppData\Local\Pandoc\pandoc.exe",
  [switch]$Force
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$utf8 = New-Object System.Text.UTF8Encoding($false)

# ---------- Phân giải danh sách nguồn ----------
if ($SourceList.StartsWith('@')) { $files = Get-Content -LiteralPath $SourceList.Substring(1) -Encoding UTF8 | Where-Object { $_.Trim() -ne '' -and -not $_.Trim().StartsWith('#') } }
else { $files = $SourceList -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' } }
$missing = $files | Where-Object { -not (Test-Path -LiteralPath $_) }
if ($missing) { throw "Thiếu file nguồn:`n" + ($missing -join "`n") }
if (-not (Test-Path $Template)) { throw "Không thấy template: $Template (chạy build-reference-template.ps1 trước)." }
if (-not (Test-Path $Pandoc))   { throw "Không thấy pandoc: $Pandoc" }

# ---------- Tên file ra theo version (chống ghi đè) ----------
New-Item -ItemType Directory -Force $OutDir | Out-Null
$today = (Get-Date).ToString('yyyy-MM-dd')
$outDocx = Join-Path $OutDir ("{0}-v{1}-{2}.docx" -f $OutBase,$Version,$today)
if ((Test-Path $outDocx) -and -not $Force) { throw "ĐÃ TỒN TẠI: $outDocx`nNội dung đã chốt thì TĂNG version; chỉ dùng -Force khi đang nháp cùng version." }

# ---------- Hàm biến đổi (chỉ áp dụng KHI XUẤT; .md nguồn giữ nguyên link) ----------
function StripFrontmatter($p){ $c = Get-Content -LiteralPath $p -Raw -Encoding UTF8; [regex]::Replace($c,'^﻿?---\r?\n.*?\r?\n---\r?\n','',[System.Text.RegularExpressions.RegexOptions]::Singleline) }
# (a) bỏ đích link nội bộ, giữ nhãn; giữ http(s)/mailto
function CleanLinks($t){ $rx=[regex]'(?<!\!)\[([^\]]+)\]\(([^)]+)\)'; $rx.Replace($t,{ param($m); if($m.Groups[2].Value -match '^(https?://|mailto:)'){ $m.Value } else { $m.Groups[1].Value } }) }
# (b) bỏ path + đuôi .md/.html (giữ basename); KHÔNG đụng .xlsx/.docx (nguồn thật)
function StripMdTokens($t){ [regex]::Replace($t,'(?:\.{1,2}/)?(?:[\w.\-]+/)*([\w.\-]+?)\.(?:md|html)\b','$1') }
# (c) bỏ stem tên-file còn sót (slug dẫn đầu bằng số mục hoặc 'wf-') — KHÔNG đụng end-to-end / MO-2026-012
function StripSlugs($t){ [regex]::Replace($t,'(?<![A-Za-z0-9./-])(?:(?:wf-)?\d+(?:\.\d+)*-[a-z][a-z0-9-]*|wf-[a-z][a-z0-9-]*)(?![A-Za-z])','') }
# (d) bỏ chú thích/cảnh báo lỗi nhận dạng giọng nói (ASR) — CHỈ ở .md nội bộ, KHÔNG vào bản giao khách (SKILL §0.0)
function StripAsr($t){
  $kw='ASR|đính chính|chép nhầm (?:là|thành)|lỗi nhận dạng'
  # d1: bỏ TRỌN dòng "Cảnh báo chất lượng ghi âm/nguồn/ASR" / "Cảnh báo ASR" (bullet/blockquote/heading/table row)
  $t=[regex]::Replace($t,'(?im)^[ \t]*(?:>[ \t]*)?[-*>#]*[ \t]*\**Cảnh báo (?:chất lượng (?:ghi âm|nguồn|ASR)|ASR)[^\r\n]*\r?\n?','')
  # d1b: bỏ TRỌN hàng bảng (| ... |) chứa "Cảnh báo ... ASR" hoặc ký hiệu ⚠ kèm ASR hoặc "ASR đọc/phiên"
  $t=[regex]::Replace($t,'(?im)^[ \t]*\|[^\r\n]*(?:Cảnh báo (?:chất lượng ghi âm|ASR)|⚠[^\r\n]*ASR|ASR (?:đọc|phiên|đôi))[^\r\n]*\r?\n?','')
  # d2: bỏ TRỌN dòng chỉ chứa ghi chú *(...)* có từ khoá ASR (vd dòng đính chính độc lập)
  $t=[regex]::Replace($t,"(?im)^[ \t]*(?:>[ \t]*)?[-*][ \t]*\*\([^)]*(?:$kw)[^)]*\)\*[ \t]*\r?\n?",'')
  # d3: bỏ redirect strikethrough '~~...~~ → X' (giữ thuật ngữ đúng X)
  $t=[regex]::Replace($t,'~~[^~]+~~[ \t]*(?:→|⟶|->)[ \t]*','')
  # d4: bỏ ghi chú *(...)* chứa từ khoá ASR GIỮA dòng
  $t=[regex]::Replace($t,"\*\([^)]*(?:$kw)[^)]*\)\*",'')
  # d5: bỏ ngoặc đơn (...) chứa từ khoá ASR
  $t=[regex]::Replace($t,"[ \t]*\((?:[^()]*?)(?:$kw)(?:[^()]*?)\)",'')
  # d6: bỏ ngoặc vuông [...] chứa 'ASR' (cờ cần-xác-nhận liên quan ASR)
  $t=[regex]::Replace($t,'[ \t]*\[[^\]]*ASR[^\]]*\]','')
  # d7: bỏ ghi chú ASR dạng văn bản thuần — 'lỗi nhận dạng' hoặc 'đính chính ASR/ghi âm' (KHÔNG đụng 'đính chính' nghiệp vụ, vd "anh Hùng đính chính DIV…")
  $t=[regex]::Replace($t,'(?:[ \t]*[—–-])?[ \t]*(?:lỗi nhận dạng|đính chính (?:ASR|ghi âm|nhận dạng))[^|\r\n]*','')
  # d8: bỏ cụm ASR inline trong câu chạy — "phỏng âm ASR là ...", "ASR phiên/đọc/đôi/ghi ..."
  $t=[regex]::Replace($t,'[ \t]*(?:phỏng âm ASR[^,.\|\r\n]*|ASR (?:phiên|đọc|đôi|ghi)[^,.\|\r\n]*)','')
  # d8b: bỏ ghi chú "(do )?(bản ghi )?ASR không rõ/không nghe rõ/nghe nhầm…" tới hết mệnh đề (dấu , ; . | hoặc xuống dòng)
  $t=[regex]::Replace($t,'[ \t]*(?:do[ \t]+)?(?:bản ghi[ \t]+)?ASR (?:không rõ|không nghe rõ|nghe nhầm|nhầm|đọc nhầm)[^,;.\|\r\n]*','')
  # d9: bỏ TRỌN dòng italic (*...*) là changelog/footer chứa từ khoá quy trình nội bộ
  $t=[regex]::Replace($t,'(?im)^[ \t]*\*[^\r\n]*(?:transcript ASR|Option B|regenerate from|lập trực tiếp từ transcript|SKILL \.claude)[^\r\n]*\*[ \t]*\r?\n?','')
  # d10: bỏ TRỌN dòng (bullet/blockquote/numbered/table-row) đồng thời chứa 'ASR' VÀ từ chỉ chất lượng nguồn (nhiễu/chất lượng/giải mã/ghi nhầm/đọc nhầm) — ghi chú/danh sách đoạn ASR nội bộ
  $t=[regex]::Replace($t,'(?im)^(?=[^\r\n]*\bASR\b)(?=[^\r\n]*(?:nhiễu|chất lượng|giải mã|ghi nhầm|đọc nhầm|hiệu đính))[^\r\n]*\r?\n?','')
  # d11: bỏ TRỌN dòng đánh dấu "chỉ dùng nội bộ" / "KHÔNG xuất hiện trong bản Word" (marker mục nội bộ §V)
  $t=[regex]::Replace($t,'(?im)^[ \t]*(?:>[ \t]*)?[-*>#]*[ \t]*\**[^\r\n]*(?:Chỉ dùng nội bộ|KHÔNG xuất hiện trong bản Word)[^\r\n]*\r?\n?','')
  $t
}
# (e) bỏ dấu vết NỘI BỘ khác (suy diễn/đối chiếu/truy vết) — CHỈ ở .md, KHÔNG vào bản giao khách (SKILL §0.0)
function StripInternal($t){
  # e1: bỏ TRỌN dòng "Lưu ý nội bộ" (cảnh báo chất lượng ghi âm / ghi chú quy trình)
  $t=[regex]::Replace($t,'(?im)^[^\r\n]*Lưu ý nội bộ[^\r\n]*\r?\n?','')
  # e2: bỏ TRỌN dòng khung nội bộ: "CHỈ đề xuất" (đề xuất glossary), trỏ OID/sổ theo dõi
  $t=[regex]::Replace($t,'(?im)^[^\r\n]*(?:CHỈ đề xuất|sổ theo dõi điểm chốt|tổng hợp vào sổ|Chờ BA Lead confirm theo quy ước)[^\r\n]*\r?\n?','')
  # e2b: bỏ TRỌN dòng blockquote trỏ OID-TOSS hoặc sổ theo dõi
  $t=[regex]::Replace($t,'(?im)^[ \t]*>[ \t]*[^\r\n]*(?:OID-TOSS|sổ theo dõi)[^\r\n]*\r?\n?','')
  # e3: bỏ ghi chú đối chiếu nội bộ trong ngoặc/in nghiêng có 'domain-knowledge'/'glossary'
  $t=[regex]::Replace($t,'\*\([^)]*(?:domain-knowledge|glossary)[^)]*\)\*','')
  $t=[regex]::Replace($t,'[ \t]*\([^()]*(?:domain-knowledge|glossary)[^()]*\)','')
  # e3b: bỏ TRỌN dòng blockquote chứa 'glossary'/'toss-glossary' (vd intro §V)
  $t=[regex]::Replace($t,'(?im)^[ \t]*>[ \t]*[^\r\n]*(?:glossary|toss-glossary)[^\r\n]*\r?\n?','')
  # e4: bỏ từ khoá nội bộ còn sót ('domain-knowledge', OID-TOSS)
  $t=[regex]::Replace($t,'[ \t]*domain-knowledge','')
  $t=[regex]::Replace($t,';?[ \t]*[Đđ]iểm cần chốt theo dõi tại OID-TOSS-001\.?','')
  $t=[regex]::Replace($t,'[ \t]*\(?OID-TOSS[-\w]*\)?','')
  # e5: bỏ trích dẫn dòng transcript — dạng ngoặc "(P# d.x)" rồi dạng trần trong ô bảng
  $t=[regex]::Replace($t,'[ \t]*\([ \t]*P\d+[ \t]*d\.[^)]*\)','')
  $t=[regex]::Replace($t,'P\d+[ \t]*d\.[~\s0-9.,–\t-]+(?:;[ \t]*P\d+[ \t]*d\.[~\s0-9.,–\t-]+)*','')
  # e6: bỏ §V Thuật ngữ đề xuất toàn bộ — đây là metadata nội bộ BA, không thuộc bản giao khách
  $t=[regex]::Replace($t,'(?ms)(?<=\r?\n|^)## V\..*?(?=\r?\n## |\Z)','')
  # e7: bỏ TRỌN dòng italic (*...*) là footer changelog chứa keyword quy trình nội bộ
  $t=[regex]::Replace($t,'(?im)^[ \t]*\*[^\r\n]*(?:glossary|toss-glossary|OID-TOSS|SKILL \.claude|kế hoạch buổi tiếp theo)[^\r\n]*\*[ \t]*\r?\n?','')
  # e8: bỏ mã OID tracking inline — [cần xác nhận/khảo sát — KS-xx], [SME-xx — ...], [KS-57 Đang xử lý], [Boeing...]
  $t=[regex]::Replace($t,'[ \t]*\[cần (?:xác nhận|khảo sát)[^\]]*\]','')
  $t=[regex]::Replace($t,'[ \t]*\[(?:SME|KS|HC|QĐ|DL)-\d+[^\]]*\]','')
  $t=[regex]::Replace($t,'[ \t]*\[Boeing[^\]]*KS[^\]]*\]','')
  # e16: bỏ MỌI chú thích trỏ OID dạng ngoặc (in nghiêng/thường) — "*(xem OID: KS-17)*", "*(Định nghĩa… — xem OID: KS-XX.)*", "(OID: KS-11)", và "OID SME-09" trần
  $t=[regex]::Replace($t,'[ \t]*\*\([^)]*\bOID\b[^)]*\)\*','')
  $t=[regex]::Replace($t,'[ \t]*\([^)]*\bxem OID:[^)]*\)','')
  $t=[regex]::Replace($t,'[ \t]*\(?(?:tham chiếu[ \t]+)?OID[ :]+(?:KS|SME|HC|QĐ|DL)-\d+[^)\r\n]*\)?','')
  # e17: bỏ đường dẫn/tên file nội bộ trong backtick — `ba/workspace/…`, `.claude/…`, `toss-glossary-v0.1.md`…
  $t=[regex]::Replace($t,'`[^`]*(?:ba/workspace|ba/sync|\.claude|domain-knowledge)[^`]*`','')
  $t=[regex]::Replace($t,'[ \t]*\(?`[^`]*\.md`\)?','')   # backtick tên file .md (nội bộ) + ngoặc bao quanh nếu có
  # e18: bỏ TRỌN phụ lục truy vết nguồn nội bộ — "## NN. Tài liệu nguồn (References)" (khung) và "## §x — Nguồn tài liệu đã đọc" (PH) — bảng/danh sách file nội bộ, không thuộc bản giao khách
  $t=[regex]::Replace($t,'(?ms)^## [^\r\n]*(?:Tài liệu nguồn \(References\)|Nguồn tài liệu(?:[ \t]+đã đọc)?)[^\r\n]*\r?\n.*?(?=^## |\Z)','')
  # e19: bỏ TRỌN dòng tóm tắt trạng thái liệt kê NHIỀU mã OID (≥4) — sau khi e16 đã gỡ ref đơn, chỉ còn dòng tóm tắt điểm mở mới có cụm dày mã KS/SME; (bắt theo cấu trúc, tránh lệ thuộc normalize tiếng Việt)
  $t=[regex]::Replace($t,'(?im)^[^\r\n]*(?:\b(?:KS|SME|HC|BA)-\d+\b[^\r\n]*){4,}\r?\n?','')
  # e20: bỏ TRỌN dòng tham chiếu plain-text trỏ TÊN FILE nội bộ (không backtick, không heading) — "Glossary: toss-glossary-v0.1", "…: SO-THEO-DOI-DIEM-CHOT-v0.1", "BAO-CAO-KHAO-SAT-…"
  $t=[regex]::Replace($t,'(?im)^[^\r\n]*(?:toss-glossary|SO-THEO-DOI|BAO-CAO-KHAO-SAT|BA-VERSION-LOG|PHAN-TACH-PHAM-VI|BRD-TOSS-\d)[^\r\n]*\r?\n?','')
  # e9: bỏ ghi chú quy trình về transcript trong ngoặc đơn — "(... trong transcript)", "(khoảng xx:xx theo timestamp transcript)"
  $t=[regex]::Replace($t,'[ \t]*\([^)]{0,120}trong transcript[^)]{0,120}\)','')
  $t=[regex]::Replace($t,'[ \t]*\([^)]{0,80}theo timestamp transcript[^)]{0,80}\)','')
  # e9b: bỏ ghi chú xác nhận nội bộ trong ngoặc — "(X = Y đã xác nhận.)", "(Airbus = FODM đã xác nhận.)"
  $t=[regex]::Replace($t,'[ \t]*\([^()]{0,80}(?:đã xác nhận|còn mở|còn chờ)[^()]{0,80}\)','')
  # e9c: bỏ cụm "tên trong transcript" inline — "chị X tên trong transcript được nhắc đến"
  $t=[regex]::Replace($t,'[ \t]*tên trong transcript(?:[ \t]+được nhắc đến)?','')
  # e10: bỏ TRỌN dòng §IV đã được chốt — "1. (**) Đã xác nhận: ...[SME-xx — Đã chốt...]"
  $t=[regex]::Replace($t,'(?im)^[ \t]*\d+\.[ \t]*(?:~~[^~\r\n]*~~\s*)?(?:\*\*)?Đã xác nhận:[^\r\n]*\r?\n?','')
  # e14: bỏ thẻ trích nguồn khảo sát inline — [DDMMYYYY §...], [DDMMYYYY-sáng/chiều §...], [MEL ...csv...], [YCKT ...] (truy vết nội bộ MD, KHÔNG vào bản giao khách §0.0)
  $t=[regex]::Replace($t,'[ \t]*\[\d{8}[^\]]*\]','')
  $t=[regex]::Replace($t,'[ \t]*\[MEL [^\]]*\]','')
  $t=[regex]::Replace($t,'[ \t]*\[YCKT [^\]]*\]','')
  $t=[regex]::Replace($t,'[ \t]*\[Function list [^\]]*\]','')
  # e15: bỏ trích dẫn ghi âm dạng NGOẶC ĐƠN — "(sáng 00:46–01:13)", "(chiều 53:42–54:15)" (vị trí phút:giây trong bản ghi; truy vết nội bộ MD, KHÔNG vào bản giao khách §0.0)
  $t=[regex]::Replace($t,'[ \t]*\((?:(?:sáng|chiều|trưa|tối)\s+\d{1,2}:\d{2}(?::\d{2})?(?:\s*[–\-—]\s*\d{1,2}:\d{2}(?::\d{2})?)?\s*,?\s*)+\)','')
  # e11: bỏ backtick pair rỗng còn sót sau khi e8 strip nội dung bên trong `[...]` — "`  `", "` `"
  $t=[regex]::Replace($t,'`[ \t]*`','')
  # e11b: bỏ backtick đơn lẻ (không có cặp) còn sót cuối dòng/sau strip
  $t=[regex]::Replace($t,'[ \t]*`[ \t]*(?=\r?\n|$)','')
  # e12: bỏ double/triple period do strip để lại — ".." hoặc ". ." → "."
  $t=[regex]::Replace($t,'\.[ \t]*\.','.')
  # e13: bỏ orphan "**" còn lại sau khi e8/e9 strip nội dung giữa bold markers
  $t=[regex]::Replace($t,'\*\*[ \t]*\*\*','')
  $t
}
function Transform($p){
  # Luôn áp: xử lý cấu trúc + gỡ ASR + gỡ dấu vết nội bộ (OID/cờ/glossary…) — văn phong người cho MỌI bản giao
  StripInternal (StripAsr (StripSlugs (StripMdTokens (CleanLinks (StripFrontmatter $p)))))
}

# ---------- Ghép Markdown ----------
$sb = New-Object System.Text.StringBuilder
# Tiêu đề render qua title block của pandoc (style "Title" sẵn có) — KHÔNG dùng "# $Title" (Heading 1) nữa
if ($Subtitle) { [void]$sb.AppendLine("*$Subtitle · v$Version · $today*"); [void]$sb.AppendLine() }
[void]$sb.AppendLine('---'); [void]$sb.AppendLine()
foreach($f in $files){ [void]$sb.AppendLine((Transform $f)); [void]$sb.AppendLine(); [void]$sb.AppendLine('---'); [void]$sb.AppendLine() }
$tmpMd = Join-Path $OutDir ("_combined_{0}.md" -f $OutBase)
# Bỏ dòng tiêu đề H1 ĐẦU TIÊN trong nguồn (đã render qua title block của pandoc → tránh tiêu đề lặp; '##' không bị đụng)
$combined = ([regex]'(?m)^# [^\r\n]*\r?\n').Replace($sb.ToString(), '', 1)
[System.IO.File]::WriteAllText($tmpMd, $combined, $utf8)

# ---------- Pandoc (áp template QT02 + mục lục) ----------
$pandocArgs = @($tmpMd, "--from=markdown-yaml_metadata_block", "--reference-doc=$Template", "-o", $outDocx, "--metadata", "title=$Title", "--resource-path=$((Get-Location).Path)")
if (-not $NoToc) { $pandocArgs += @("--toc", "--toc-depth=$TocDepth") }
& $Pandoc @pandocArgs 2>$null
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $outDocx)) { throw "Pandoc lỗi (exit $LASTEXITCODE)." }
[System.IO.File]::Delete($tmpMd)

# ---------- Vá logo header (pandoc bỏ ảnh của reference) ----------
$lz=[System.IO.Compression.ZipFile]::OpenRead($Template); $le=$lz.GetEntry('word/media/logo.png')
$logo=$null; if($le){ $ms=New-Object System.IO.MemoryStream; $le.Open().CopyTo($ms); $logo=$ms.ToArray() }; $lz.Dispose()
$zip=[System.IO.Compression.ZipFile]::Open($outDocx,'Update')
$cte=$zip.GetEntry('[Content_Types].xml'); $sr=New-Object System.IO.StreamReader($cte.Open()); $ct=$sr.ReadToEnd(); $sr.Close()
if($ct -notmatch 'Extension="png"'){ $ct=$ct.Replace('</Types>','<Default Extension="png" ContentType="image/png" /></Types>'); $cte.Delete(); $ne=$zip.CreateEntry('[Content_Types].xml'); $sw=New-Object System.IO.StreamWriter($ne.Open(),$utf8); $sw.Write($ct); $sw.Close() }
if(-not $zip.GetEntry('word/_rels/header1.xml.rels')){ $he=$zip.CreateEntry('word/_rels/header1.xml.rels'); $sw2=New-Object System.IO.StreamWriter($he.Open(),$utf8); $sw2.Write('<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/logo.png"/></Relationships>'); $sw2.Close() }
if($logo -and -not $zip.GetEntry('word/media/logo.png')){ $me=$zip.CreateEntry('word/media/logo.png'); $st=$me.Open(); $st.Write($logo,0,$logo.Length); $st.Close() }
# ---------- Căn chỉnh font (override template QT02 khi -Font/-FontSize/-HxFont/-HxSize) ----------
function Set-HeadingStyle([string]$xml,[string]$styleId,[string]$hfont,[int]$hsize,[bool]$bold,[string]$align){   # vá riêng 1 style (cỡ/font/bold/căn lề), không đụng style khác
  $rx=[regex]("(?s)<w:style [^>]*w:styleId=`"$styleId`".*?</w:style>")
  return $rx.Replace($xml,{ param($m)
    $blk=$m.Value
    if($hsize -gt 0){ $hp=$hsize*2
      $blk=[regex]::Replace($blk,'<w:sz w:val="\d+"',('<w:sz w:val="'+$hp+'"'))
      $blk=[regex]::Replace($blk,'<w:szCs w:val="\d+"',('<w:szCs w:val="'+$hp+'"')) }
    if($hfont -ne ''){ $blk=[regex]::Replace($blk,'(w:(?:ascii|eastAsia|hAnsi|cs)=")[^"]*"',('${1}'+$hfont+'"')) }
    if($bold -and ($blk -notmatch '<w:b\s*/>')){   # thêm bold ĐÚNG thứ tự schema CT_RPr (sau rFonts; nếu không có rFonts thì ngay sau <w:rPr>)
      if($blk -match '<w:rFonts[^>]*/>'){ $blk=[regex]::Replace($blk,'(<w:rFonts[^>]*/>)','${1}<w:b/><w:bCs/>',1) }
      else { $blk=[regex]::Replace($blk,'(<w:rPr>)','${1}<w:b/><w:bCs/>',1) }
    }
    if($align -ne ''){                                                                                              # đặt căn lề trong pPr
      if($blk -match '<w:jc [^>]*/>'){ $blk=[regex]::Replace($blk,'<w:jc w:val="[^"]*"',('<w:jc w:val="'+$align+'"')) }
      else { $blk=[regex]::Replace($blk,'(<w:pPr>)',('${1}<w:jc w:val="'+$align+'"/>'),1) }
    }
    $blk
  },1)
}
if(($Font -ne 'Times New Roman') -or ($FontSize -gt 0) -or ($TitleSize -gt 0) -or ($TitleAlign -ne '') -or ($H1Size -gt 0) -or ($H2Size -gt 0) -or ($H3Size -gt 0) -or ($H1Font -ne '') -or ($H2Font -ne '') -or ($H3Font -ne '') -or $H1Bold -or $H2Bold -or $H3Bold -or ($H1Align -ne '') -or ($H2Align -ne '') -or ($H3Align -ne '')){
  foreach($part in 'word/styles.xml','word/theme/theme1.xml'){
    $pe=$zip.GetEntry($part); if(-not $pe){ continue }
    $psr=New-Object System.IO.StreamReader($pe.Open()); $pc=$psr.ReadToEnd(); $psr.Close()
    if($Font -ne 'Times New Roman'){ $pc=$pc.Replace('Times New Roman',$Font) }   # đổi font family toàn cục (giữ Consolas cho code)
    if($part -eq 'word/styles.xml'){
      if($FontSize -gt 0){                                                         # cỡ body trong docDefaults (half-point)
        $hp=$FontSize*2
        $pc=[regex]::Replace($pc,'(<w:rPrDefault>[\s\S]*?<w:sz w:val=")\d+("[\s\S]*?</w:rPrDefault>)',('${1}'+$hp+'${2}'))
        $pc=[regex]::Replace($pc,'(<w:rPrDefault>[\s\S]*?<w:szCs w:val=")\d+("[\s\S]*?</w:rPrDefault>)',('${1}'+$hp+'${2}'))
      }
      if(($TitleSize -gt 0) -or ($TitleAlign -ne '')){ $pc=Set-HeadingStyle $pc 'Title' '' $TitleSize $false $TitleAlign }   # style Title (tiêu đề tài liệu qua title block pandoc)
      if(($H1Size -gt 0) -or ($H1Font -ne '') -or $H1Bold -or ($H1Align -ne '')){ $pc=Set-HeadingStyle $pc 'Heading1' $H1Font $H1Size ([bool]$H1Bold) $H1Align }   # Heading 1 (nội dung cấp 1 thật)
      if(($H2Size -gt 0) -or ($H2Font -ne '') -or $H2Bold -or ($H2Align -ne '')){ $pc=Set-HeadingStyle $pc 'Heading2' $H2Font $H2Size ([bool]$H2Bold) $H2Align }   # Word Heading2 (= mục lớn I, II)
      if(($H3Size -gt 0) -or ($H3Font -ne '') -or $H3Bold -or ($H3Align -ne '')){ $pc=Set-HeadingStyle $pc 'Heading3' $H3Font $H3Size ([bool]$H3Bold) $H3Align }   # Word Heading3 (= mục con I.1, I.2)
    }
    $pe.Delete(); $ne2=$zip.CreateEntry($part); $psw=New-Object System.IO.StreamWriter($ne2.Open(),$utf8); $psw.Write($pc); $psw.Close()
  }
}
$zip.Dispose()

# ---------- QC ----------
function Get-Part($zip,$p){ $e=$zip.GetEntry($p); if(-not $e){return ''}; $sr=New-Object System.IO.StreamReader($e.Open()); $t=$sr.ReadToEnd(); $sr.Close(); $t }
$z=[System.IO.Compression.ZipFile]::OpenRead($outDocx); $names=$z.Entries.FullName
$xml=Get-Part $z 'word/document.xml'; $styles=Get-Part $z 'word/styles.xml'; $theme=Get-Part $z 'word/theme/theme1.xml'
$txt=[System.Net.WebUtility]::HtmlDecode(([regex]::Replace(([regex]::Replace($xml,'</w:p>',"`n")),'<[^>]+>','')))
$allowedFonts = @($Font,$H1Font,$H2Font,'Consolas') | Where-Object { $_ -ne '' }
$badFonts = ([regex]::Matches($styles,'w:ascii="([^"]+)"') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique) | Where-Object { $allowedFonts -notcontains $_ }
$qc=[ordered]@{
  'OPC forward-slash (no backslash)' = (-not ($names -match '\\'))
  'logo + header + footer present'   = (($names -contains 'word/media/logo.png') -and ($names -contains 'word/header1.xml') -and ($names -contains 'word/footer1.xml'))
  'PNG content-type'                 = ((Get-Part $z '[Content_Types].xml') -match 'Extension="png"')
  'TOC field'                        = ($(if($NoToc){-not (([regex]'TOC \\o').Matches($xml).Count -ge 1)}else{(([regex]'TOC \\o').Matches($xml).Count -ge 1)}))
  'title style present'              = (([regex]'<w:pStyle w:val="Title"').Matches($xml).Count -ge 1)
  'no .md leak'                      = (([regex]'\.md\b').Matches($txt).Count -eq 0)
  'no markdown link ]('             = (([regex]'\]\(').Matches($txt).Count -eq 0)
  'no filename slug'                 = (([regex]'phan-he|wireframe-overview|tien-do-ncc|thiet-bi-iot').Matches($txt).Count -eq 0)
  'no YAML key leak'                 = (([regex]'document_type:|source_template:|^project:\s*"').Matches($txt).Count -eq 0)
  'no ASR note leak (§0.0)'          = (([regex]'\bASR\b|đính chính (?:ASR|ghi âm|nhận dạng)|chép nhầm (?:là|thành|→)|lỗi nhận dạng').Matches($txt).Count -eq 0)
  'no internal note leak (§0.0)'     = (([regex]'Lưu ý nội bộ|domain-knowledge|glossary|OID-TOSS|sổ theo dõi điểm chốt|P\d+\s*d\.').Matches($txt).Count -eq 0)
  'no OID code leak (§0.0)'          = (([regex]'\[cần (?:xác nhận|khảo sát)|\b(?:KS|SME|HC)-\d+\b').Matches($txt).Count -eq 0)
  'no transcript process note (§0.0)'= (([regex]'trong transcript|theo timestamp transcript').Matches($txt).Count -eq 0)
  'no survey source citation (§0.0)' = (([regex]'\[\d{8}[^\]]*\]|\[MEL [^\]]*\]|\[YCKT [^\]]*\]|\[Function list [^\]]*\]').Matches($txt).Count -eq 0)
  'no recording timestamp (§0.0)'    = (([regex]'\((?:sáng|chiều|trưa|tối)\s+\d{1,2}:\d{2}').Matches($txt).Count -eq 0)
  'no residual backtick (§0.0)'      = (([regex]'`').Matches($txt).Count -eq 0)
  'no AI phrase: Hai phía (§0.0)'    = (([regex]'Hai phía\s+(?:thảo luận|làm rõ|chia sẻ|nhận định|đề xuất|cho biết)').Matches($txt).Count -eq 0)
  'no AI phrase: arrow in prose (§0.0)' = (([regex]'(?<!\bAMOS\b|\bTOSS\b|OPS\+\+)\s+→\s+(?!\bTOSS\b|\bAMOS\b|OPS\+\+|\bLido\b)').Matches($txt).Count -eq 0)
  'no AI phrase: clichés (§0.0)'     = (([regex]'Cũng được đề cập|Logic kết nối|Định hướng thống nhất là|Điều này giúp').Matches($txt).Count -eq 0)
  'no non-technical EN: team (§0.0)' = (([regex]'\bteam\b').Matches($txt).Count -eq 0)
  'no non-technical EN: decode/parse/highlight/review (§0.0)' = (([regex]'\b(?:decode|parse|highlight)\b|\breview\b(?!ed\b)').Matches($txt).Count -eq 0)
  'no non-technical EN: raw/edited content (§0.0)' = (([regex]'\braw content\b|\bedited content\b').Matches($txt).Count -eq 0)
  'no non-technical EN: realtime/batch (§0.0)' = (([regex]'\brealtime\b|\bbatch\b(?!\s+export\s+format)').Matches($txt).Count -eq 0)
  'no non-technical EN: data sample/sub-level (§0.0)' = (([regex]'\bdata sample\b|\bsub-level\b').Matches($txt).Count -eq 0)
  "FONT = $Font only (+Consolas code)" = ($(
      $forbidden = @('Aptos','Calibri','Cambria','Times New Roman') | Where-Object { $allowedFonts -notcontains $_ }
      ($theme -match ('minorFont[\s\S]*?'+[regex]::Escape($Font))) -and (((-not $forbidden) -or (([regex]($forbidden -join '|')).Matches($styles+$theme).Count -eq 0))) -and (-not $badFonts)
    ))
  'heading bold đúng thứ tự schema'  = ($(
      $ok=$true
      foreach($pair in @(@($H1Bold,'Heading1'),@($H2Bold,'Heading2'),@($H3Bold,'Heading3'))){
        if($pair[0]){ $h=[regex]::Match($styles,"(?s)styleId=`"$($pair[1])`".*?</w:style>").Value
          if($h -and ($h -notmatch '(?s)<w:rFonts[^>]*/>\s*<w:b\s*/>')){ $ok=$false } }
      }
      $ok
    ))
  'XML well-formed'                  = $true
}
if($Formal){ foreach($k in @($qc.Keys)){ if($k -match 'arrow in prose|non-technical EN|residual backtick'){ $qc.Remove($k) } } }   # tài liệu yêu cầu: chỉ nới QC mũi tên/tiếng Anh/backtick (mã BR, ví dụ "VNA893 → A893" là nội dung hợp lệ); VẪN giữ QC gỡ OID/nội bộ/ASR
foreach($p in 'word/document.xml','word/header1.xml','word/footer1.xml','[Content_Types].xml'){ try{ [xml](Get-Part $z $p) | Out-Null }catch{ $qc['XML well-formed']=$false } }
$z.Dispose()
Write-Host ""
Write-Host ("XUẤT: " + $outDocx + ("  ({0} KB)" -f [math]::Round((Get-Item $outDocx).Length/1KB,1)))
Write-Host "----- QC -----"
$fail=0
foreach($k in $qc.Keys){ $ok=$qc[$k]; if(-not $ok){$fail++}; Write-Host ("  [{0}] {1}" -f $(if($ok){'PASS'}else{'FAIL'}),$k) }
if($badFonts){ Write-Host ("  ! Font lạ: " + ($badFonts -join ', ')) }
Write-Host ("----- KẾT QUẢ: " + $(if($fail -eq 0){'✅ PASS toàn bộ'}else{"❌ $fail mục FAIL — sửa & xuất lại"}) + " -----")
if($fail -gt 0){ exit 1 }
