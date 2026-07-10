<#
  export-word-srs-vna.ps1 — Xuất Markdown → Word .docx theo BIẾN THỂ 2: SRS chuẩn VNA/VTIT (QT02.BM.04).
  Khác biến thể QT02 mặc định: dùng reference-doc `word-reference-srs-vna.docx` (bìa BIỂU MẪU + BẢNG GHI NHẬN
  THAY ĐỔI + TRANG KÝ + MỤC LỤC + header/footer + logo). Vì pandoc CHỈ lấy style + header/footer từ reference-doc
  mà KHÔNG chép nội dung TRANG BÌA, script này HẬU XỬ LÝ: chèn phần bìa của template vào đầu body + điền placeholder.

  Đặc tả định dạng: .claude/knowledge/srs-word-format-vna-tit.md
  Quy trình strip văn phong người + QC: dùng chung export-word.ps1 (chạy TRƯỚC để ra bản body sạch), rồi script này chèn bìa.

  VÍ DỤ:
    .\export-word-srs-vna.ps1 `
      -SourceList "@.claude\skills\export-word\manifests\srs.txt" `
      -Title "SRS — Phân hệ Quản trị Hệ thống (TOSS)" `
      -OutBase "SRS-TOSS-System-Admin" -Version "0.1" `
      -DonVi "VTIT" -MaHieuDuAn "VNA.TOSS" -MaHieuTaiLieu "VNA.TOSS_SRS_System-Admin_v0.1" -ThangNam "01/2026" `
      -Pandoc "C:\Users\<user>\AppData\Local\Pandoc\pandoc.exe"
#>
param(
  [Parameter(Mandatory=$true)][string]$SourceList,
  [Parameter(Mandatory=$true)][string]$Title,
  [string]$OutDir = "ba/sync/output/human/exports",
  [Parameter(Mandatory=$true)][string]$OutBase,
  [Parameter(Mandatory=$true)][string]$Version,
  [int]$TocDepth = 3,
  # Placeholder trang bìa
  [string]$DonVi = "VTIT",
  [string]$MaHieuDuAn = "VNA.TOSS",
  [string]$MaHieuTaiLieu = "VNA.TOSS_SRS",
  [string]$ThangNam = "",
  [string]$Template = ".claude\templates\word-reference-srs-vna.docx",
  [string]$Pandoc = "C:\Users\VTIT\AppData\Local\Pandoc\pandoc.exe",
  [switch]$Force
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$utf8 = New-Object System.Text.UTF8Encoding($false)
if ($ThangNam -eq "") { $ThangNam = (Get-Date).ToString('MM/yyyy') }

# ---------- Nguồn ----------
if ($SourceList.StartsWith('@')) { $files = Get-Content -LiteralPath $SourceList.Substring(1) -Encoding UTF8 | Where-Object { $_.Trim() -ne '' -and -not $_.Trim().StartsWith('#') } }
else { $files = $SourceList -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' } }
$missing = $files | Where-Object { -not (Test-Path -LiteralPath $_) }
if ($missing) { throw "Thiếu file nguồn:`n" + ($missing -join "`n") }
if (-not (Test-Path $Template)) { throw "Không thấy template: $Template" }
if (-not (Test-Path $Pandoc))   { throw "Không thấy pandoc: $Pandoc (dùng -Pandoc để chỉ đường dẫn)." }

New-Item -ItemType Directory -Force $OutDir | Out-Null
$today = (Get-Date).ToString('yyyy-MM-dd')
$outDocx = Join-Path $OutDir ("{0}-v{1}-{2}.docx" -f $OutBase,$Version,$today)
if ((Test-Path $outDocx) -and -not $Force) { throw "ĐÃ TỒN TẠI: $outDocx — tăng version hoặc -Force (nháp)." }

# ---------- Biến đổi văn phong người (tái dùng logic export-word.ps1) ----------
$common = Join-Path $PSScriptRoot 'export-word.ps1'
# Nạp các hàm Strip* từ export-word.ps1 bằng dot-source một bản đã cắt param (an toàn: chỉ định nghĩa hàm).
# Đơn giản & an toàn hơn: sao chép các hàm Strip cần thiết tại chỗ.
function StripFrontmatter($p){ $c = Get-Content -LiteralPath $p -Raw -Encoding UTF8; [regex]::Replace($c,'^﻿?---\r?\n.*?\r?\n---\r?\n','',[System.Text.RegularExpressions.RegexOptions]::Singleline) }
function CleanLinks($t){ $rx=[regex]'(?<!\!)\[([^\]]+)\]\(([^)]+)\)'; $rx.Replace($t,{ param($m); if($m.Groups[2].Value -match '^(https?://|mailto:)'){ $m.Value } else { $m.Groups[1].Value } }) }
function StripMdTokens($t){ [regex]::Replace($t,'(?:\.{1,2}/)?(?:[\w.\-]+/)*([\w.\-]+?)\.(?:md|html)\b','$1') }
function Transform($p){ StripMdTokens (CleanLinks (StripFrontmatter $p)) }

# ---------- Ghép Markdown ----------
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine('---'); [void]$sb.AppendLine()
foreach($f in $files){ [void]$sb.AppendLine((Transform $f)); [void]$sb.AppendLine(); [void]$sb.AppendLine('---'); [void]$sb.AppendLine() }
$tmpMd = Join-Path $OutDir ("_combined_srsvna_{0}.md" -f $OutBase)
$combined = ([regex]'(?m)^# [^\r\n]*\r?\n').Replace($sb.ToString(), '', 1)
[System.IO.File]::WriteAllText($tmpMd, $combined, $utf8)

# ---------- Pandoc (style + header/footer từ reference; KHÔNG có bìa) ----------
$pandocArgs = @($tmpMd, "--from=markdown-yaml_metadata_block", "--reference-doc=$Template", "-o", $outDocx, "--metadata", "title=$Title", "--toc", "--toc-depth=$TocDepth", "--resource-path=$((Get-Location).Path)")
& $Pandoc @pandocArgs 2>$null
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $outDocx)) { throw "Pandoc lỗi (exit $LASTEXITCODE)." }
[System.IO.File]::Delete($tmpMd)

# ---------- Trích phần BÌA từ template (từ <w:body> đến trước 'A - THÔNG TIN CHUNG') ----------
$tz=[System.IO.Compression.ZipFile]::OpenRead($Template)
function ReadEntry($zip,$name){ $e=$zip.GetEntry($name); if(-not $e){return $null}; $r=New-Object System.IO.StreamReader($e.Open(),$utf8); $x=$r.ReadToEnd(); $r.Close(); $x }
$tdoc = ReadEntry $tz 'word/document.xml'
$tz.Dispose()
$bodyOpen = $tdoc.IndexOf('<w:body>') + '<w:body>'.Length
$marker = $tdoc.IndexOf('A - THÔNG TIN CHUNG')
if ($marker -lt 0) { throw "Template không có mốc 'A - THÔNG TIN CHUNG' để cắt bìa." }
$pOpen = $tdoc.LastIndexOf('<w:p>', $marker)
$pOpenAttr = $tdoc.LastIndexOf('<w:p ', $marker)
if ($pOpenAttr -gt $pOpen) { $pOpen = $pOpenAttr }
$cover = $tdoc.Substring($bodyOpen, $pOpen - $bodyOpen)
# Điền placeholder trang bìa
$cover = $cover.Replace('{{DON_VI}}', $DonVi).Replace('{{MA_HIEU_DU_AN}}', $MaHieuDuAn).Replace('{{MA_HIEU_TAI_LIEU}}', $MaHieuTaiLieu).Replace('{{THANG_NAM}}', $ThangNam)
# Thêm ngắt trang sau bìa để nội dung bắt đầu trang mới
$pageBreak = '<w:p><w:r><w:br w:type="page"/></w:r></w:p>'

# ---------- Chèn bìa vào đầu body của file xuất ----------
$zip=[System.IO.Compression.ZipFile]::Open($outDocx,'Update')
$de=$zip.GetEntry('word/document.xml'); $dr=New-Object System.IO.StreamReader($de.Open(),$utf8); $odoc=$dr.ReadToEnd(); $dr.Close()
$oBodyOpen = $odoc.IndexOf('<w:body>') + '<w:body>'.Length
$odoc = $odoc.Substring(0,$oBodyOpen) + $cover + $pageBreak + $odoc.Substring($oBodyOpen)
$de.Delete(); $ne=$zip.CreateEntry('word/document.xml'); $sw=New-Object System.IO.StreamWriter($ne.Open(),$utf8); $sw.Write($odoc); $sw.Close()

# ---------- Vá logo (pandoc bỏ ảnh reference) ----------
$lz=[System.IO.Compression.ZipFile]::OpenRead($Template); $le=$lz.GetEntry('word/media/logo.png')
$logo=$null; if($le){ $ms=New-Object System.IO.MemoryStream; $le.Open().CopyTo($ms); $logo=$ms.ToArray() }; $lz.Dispose()
$cte=$zip.GetEntry('[Content_Types].xml'); $sr=New-Object System.IO.StreamReader($cte.Open(),$utf8); $ct=$sr.ReadToEnd(); $sr.Close()
if($ct -notmatch 'Extension="png"'){ $ct=$ct.Replace('</Types>','<Default Extension="png" ContentType="image/png" /></Types>'); $cte.Delete(); $nce=$zip.CreateEntry('[Content_Types].xml'); $csw=New-Object System.IO.StreamWriter($nce.Open(),$utf8); $csw.Write($ct); $csw.Close() }
if($logo -and -not $zip.GetEntry('word/media/logo.png')){ $me=$zip.CreateEntry('word/media/logo.png'); $st=$me.Open(); $st.Write($logo,0,$logo.Length); $st.Close() }
$zip.Dispose()

# ---------- QC theo checklist srs-word-format-vna-tit.md §7 ----------
function Get-Part($zip,$p){ $e=$zip.GetEntry($p); if(-not $e){return ''}; $sr=New-Object System.IO.StreamReader($e.Open(),$utf8); $t=$sr.ReadToEnd(); $sr.Close(); $t }
$z=[System.IO.Compression.ZipFile]::OpenRead($outDocx); $names=$z.Entries.FullName
$xml=Get-Part $z 'word/document.xml'; $styles=Get-Part $z 'word/styles.xml'; $theme=Get-Part $z 'word/theme/theme1.xml'; $ctx=Get-Part $z '[Content_Types].xml'
$txt=[System.Net.WebUtility]::HtmlDecode(([regex]::Replace(([regex]::Replace($xml,'</w:p>',"`n")),'<[^>]+>','')))
$qc=[ordered]@{
  'A4 portrait'                    = ([regex]'w:w="11906"[^>]*w:h="16838"|w:h="16838"[^>]*w:w="11906"').Matches($xml).Count -ge 1
  'lề left=1797/right=1440'        = (($xml -match 'w:left="1797"') -and ($xml -match 'w:right="1440"'))
  'đủ 5 part header/footer'        = (('word/header1.xml','word/header2.xml','word/footer1.xml','word/footer2.xml','word/footer3.xml') | ForEach-Object { $names -contains $_ }) -notcontains $false
  'footer có PAGE/NUMPAGES'        = ((Get-Part $z 'word/footer1.xml') -match 'PAGE') -and ((Get-Part $z 'word/footer1.xml') -match 'NUMPAGES')
  'sectPr tham chiếu HF'           = (([regex]'headerReference').Matches($xml).Count -ge 1) -and (([regex]'footerReference').Matches($xml).Count -ge 1)
  'Content-Types khai HF + png'    = ($ctx -match 'header\+xml') -and ($ctx -match 'footer\+xml') -and ($ctx -match 'Extension="png"')
  'FONT = Times New Roman'         = ($theme -match 'minorFont[\s\S]*?Times New Roman') -and (([regex]'Calibri|Cambria|Aptos').Matches($theme).Count -eq 0)
  'body 12pt / 1.5 line'           = ($styles -match '<w:sz w:val="24"') -and ($styles -match 'w:line="360"')
  'bảng viền đen 1pt (style Table)'= ($styles -match '(?s)styleId="Table".*?tblBorders.*?w:sz="8"') -or ($xml -match 'w:sz="8"[^>]*w:val="single"|w:val="single"[^>]*w:sz="8"')
  'bìa đủ khối'                    = ('BIỂU MẪU','TÀI LIỆU THIẾT KẾ CHI TIẾT','BẢNG GHI NHẬN THAY ĐỔI','TRANG KÝ','MỤC LỤC' | ForEach-Object { $txt -match [regex]::Escape($_) }) -notcontains $false
  'placeholder đã điền'            = (([regex]'\{\{(?:DON_VI|MA_HIEU_DU_AN|MA_HIEU_TAI_LIEU|THANG_NAM)\}\}').Matches($xml).Count -eq 0)
  'TOC field'                      = (([regex]'TOC \\o').Matches($xml).Count -ge 1)
  'OPC forward-slash'             = (-not ($names -match '\\'))
  'no .md leak'                    = (([regex]'\.md\b').Matches($txt).Count -eq 0)
  'no markdown link ]('           = (([regex]'\]\(').Matches($txt).Count -eq 0)
  'XML well-formed'                = $true
}
foreach($p in 'word/document.xml','word/header1.xml','word/footer1.xml','[Content_Types].xml'){ try{ [xml](Get-Part $z $p) | Out-Null }catch{ $qc['XML well-formed']=$false } }
$z.Dispose()
Write-Host ""
Write-Host ("XUẤT: " + $outDocx + ("  ({0} KB)" -f [math]::Round((Get-Item $outDocx).Length/1KB,1)))
Write-Host "----- QC (srs-word-format-vna-tit §7) -----"
$fail=0
foreach($k in $qc.Keys){ $ok=$qc[$k]; if(-not $ok){$fail++}; Write-Host ("  [{0}] {1}" -f $(if($ok){'PASS'}else{'FAIL'}),$k) }
Write-Host ""
Write-Host "LƯU Ý THỦ CÔNG (giới hạn pandoc — xem knowledge §7):"
Write-Host "  1) Đánh số heading 1/1.1/1.1.1: viết sẵn số trong tiêu đề .md, HOẶC gán trong Word rồi F9."
Write-Host "  2) Cập nhật MỤC LỤC: mở Word, Ctrl+A, F9."
Write-Host "  3) Section landscape: pandoc chỉ giữ 1 sectPr (portrait); nếu cần trang ngang cho bảng/sơ đồ lớn, chèn section break trong Word."
Write-Host ("----- KẾT QUẢ: " + $(if($fail -eq 0){'PASS toàn bộ (tự động)'}else{"$fail mục FAIL — sửa & xuất lại"}) + " -----")
if($fail -gt 0){ exit 1 }
