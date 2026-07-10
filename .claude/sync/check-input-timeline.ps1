<#
  check-input-timeline.ps1 — Đồng bộ TIMELINE-INPUT-DOCS.md <-> thư mục ba/workspace/input/

  Chế độ:
    -Mode Scan    : Liệt kê file trong input/ chưa có trong TIMELINE -> nhắc agent thêm vào
    -Mode Check   : Liệt kê entry trong TIMELINE không còn file tương ứng -> nhắc human xác nhận xóa
    -Mode Both    : Chạy cả hai (mặc định)

  Phạm vi quét:
    - ba/workspace/input/Customer_docs/        (gốc + Form/, Procedure/, meeting-notes/, …)
    - BỎ QUA: Customer_docs/Aircraft/ACARS/    (31 file zip bulk — chỉ track dòng tổng hợp; khớp mọi cấp)
    - BỎ QUA: Customer_docs/PEP5.16/           (564 file bulk — chỉ track dòng tổng hợp)
    - BỎ QUA: Customer_docs/MEL/#MEL_R10_MMEL-CR-asterisk(DDG)_Complete-efb/ (gói MEL EFB ~700 file — chỉ track dòng tổng hợp)
    - BỎ QUA: ba/workspace/input/domain-knowledge/ (KB tự thu thập — track qua INDEX riêng)

  Quy ước:
    - meeting-notes/<YYYYMMDD>/                chỉ kiểm tra sự tồn tại của thư mục con (ngày họp),
                                               KHÔNG kiểm tra từng file transcript bên trong.
                                               File nằm TRỰC TIẾP dưới meeting-notes/ được coi là file thường.
    - File tạm _combined_*.md (export-word)    bỏ qua.
    - INDEX.md / README.md                     bỏ qua (meta-file, track qua chính nó).
    - Mode Check bỏ qua theo thiết kế:
        * tên đuôi .extracted.md               (bản trích nằm ở drafts/phan-tich/01-nguon/, không phải input/)
        * token chứa wildcard '*'              (dòng tổng hợp, không phải file thật)
        * file thuộc nhánh bulk bị bỏ qua khi quét (AptMgr/APD/in-26xxxx/B787_GBST_CMF…) — có kiểm tra
          tồn tại thật trên toàn cây input/ (kể cả nhánh bulk) trước khi báo THIẾU
        * danh sách ngoại lệ có ghi chú ($checkSkipExact): nguồn LIVE Google Sheet không lưu đĩa,
          artifact nằm ngoài input/ (vd mockup trong ba/workspace/drafts/).

  LƯU Ý: Script CHỈ báo cáo, KHÔNG tự sửa TIMELINE hay file nào.
         Agent/human đọc báo cáo và quyết định thao tác tiếp theo.
#>
param(
    [ValidateSet('Scan','Check','Both')][string]$Mode = 'Both',
    [string]$TimelineFile = 'ba\workspace\drafts\phan-tich\TIMELINE-INPUT-DOCS.md',
    [string]$InputRoot    = 'ba\workspace\input'
)

$ErrorActionPreference = 'Stop'

# Xác định thư mục gốc dự án (thư mục chứa .claude/)
$projectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$timelinePath = Join-Path $projectRoot $TimelineFile
$inputPath    = Join-Path $projectRoot $InputRoot

if (-not (Test-Path $timelinePath)) {
    Write-Output "[LỖI] Không tìm thấy file TIMELINE: $timelinePath"
    exit 1
}
if (-not (Test-Path $inputPath)) {
    Write-Output "[LỖI] Không tìm thấy thư mục input: $inputPath"
    exit 1
}

# --------------------------------------------------------------------------
# 1) Đọc TIMELINE và trích danh sách tên file được đề cập trong backticks
# --------------------------------------------------------------------------
$timelineRaw = Get-Content -Path $timelinePath -Raw -Encoding UTF8

# Pattern: tên file có đuôi mở rộng phổ biến, trong backticks `...`
$fileExtPattern = '\.(xlsx|xls|docx|doc|pdf|pptx|ppt|mdb|html|htm|zip|csv|tsv|md|srt|txt|xml|json|png|jpg)'
$backtickMatches = [regex]::Matches(
    $timelineRaw,
    '`([^`\r\n]+?' + $fileExtPattern + ')`',
    [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
)

$timelineFiles = New-Object System.Collections.Generic.HashSet[string] ([System.StringComparer]::OrdinalIgnoreCase)
foreach ($m in $backtickMatches) {
    $name = $m.Groups[1].Value.Trim()
    # Bỏ pattern dạng "in-260301.zip ... in-260331.zip" (mô tả dải) — chỉ giữ stem rõ ràng
    if ($name -match '\s\.\.\.\s') { continue }
    [void]$timelineFiles.Add($name)
}

# Pattern: thư mục meeting-notes/<YYYYMMDD>/ được đề cập trong TIMELINE
$mtgDirMatches = [regex]::Matches(
    $timelineRaw,
    'meeting-notes/(\d{8}|NOTOC_\d{8})/',
    [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
)
$timelineMtgDirs = New-Object System.Collections.Generic.HashSet[string] ([System.StringComparer]::OrdinalIgnoreCase)
foreach ($m in $mtgDirMatches) {
    [void]$timelineMtgDirs.Add($m.Groups[1].Value)
}

# --------------------------------------------------------------------------
# 2) Quét hệ thống file thực trong ba/workspace/input/
# --------------------------------------------------------------------------
$customerDocs = Join-Path $inputPath 'Customer_docs'
$skipDirNames = @('ACARS', 'PEP5.16', '#MEL_R10_MMEL-CR-asterisk(DDG)_Complete-efb')
$skipFilePatterns = @('^_combined_.*\.md$', '^(INDEX|README)\.md$')

$actualFiles = @()
$actualMtgDirs = New-Object System.Collections.Generic.HashSet[string] ([System.StringComparer]::OrdinalIgnoreCase)

if (Test-Path $customerDocs) {
    # File trực tiếp dưới Customer_docs và các thư mục con (trừ ACARS/PEP5.16)
    $allItems = Get-ChildItem -Path $customerDocs -Recurse -File -ErrorAction SilentlyContinue

    foreach ($item in $allItems) {
        $rel = $item.FullName.Substring($customerDocs.Length).TrimStart('\','/').Replace('\','/')
        $parts = $rel -split '/'
        $topDir = $parts[0]

        # Bỏ qua nhánh ACARS, PEP5.16 — ở BẤT KỲ cấp thư mục nào
        # (ACARS đã dời Customer_docs/ACARS/ -> Customer_docs/Aircraft/ACARS/ 2026-06)
        $inSkipDir = $false
        foreach ($sd in $skipDirNames) {
            if ($parts -contains $sd) { $inSkipDir = $true; break }
        }
        if ($inSkipDir) { continue }

        # Bỏ qua file tạm
        $skip = $false
        foreach ($p in $skipFilePatterns) {
            if ($item.Name -match $p) { $skip = $true; break }
        }
        if ($skip) { continue }

        # Trong meeting-notes: chỉ ghi nhận thư mục con cấp 1 (ngày họp), bỏ qua file bên trong.
        # File nằm TRỰC TIẾP dưới meeting-notes/ (parts.Count -eq 2) là file thường -> track như file.
        if ($topDir -ieq 'meeting-notes' -and $parts.Count -ge 3) {
            [void]$actualMtgDirs.Add($parts[1])
            continue
        }

        $actualFiles += [PSCustomObject]@{
            Name = $item.Name
            Rel  = "Customer_docs/$rel"
        }
    }
}

# --------------------------------------------------------------------------
# 3) MODE SCAN — File có trong input/ nhưng chưa có trong TIMELINE
# --------------------------------------------------------------------------
$newFiles = @()
$newMtgDirs = @()
if ($Mode -eq 'Scan' -or $Mode -eq 'Both') {
    foreach ($f in $actualFiles) {
        if (-not $timelineFiles.Contains($f.Name)) {
            $newFiles += $f
        }
    }
    foreach ($d in $actualMtgDirs) {
        if (-not $timelineMtgDirs.Contains($d)) {
            $newMtgDirs += $d
        }
    }

    Write-Output ''
    Write-Output '================ MODE SCAN — File mới chưa có trong TIMELINE ================'
    if ($newFiles.Count -eq 0 -and $newMtgDirs.Count -eq 0) {
        Write-Output '[OK] Không có file mới — TIMELINE đã cập nhật đầy đủ.'
    }
    else {
        foreach ($f in ($newFiles | Sort-Object Rel)) {
            Write-Output ("[MỚI]  {0} — chưa có trong TIMELINE  (đường dẫn: {1})" -f $f.Name, $f.Rel)
        }
        foreach ($d in ($newMtgDirs | Sort-Object)) {
            Write-Output ("[MỚI]  meeting-notes/{0}/ — buổi họp chưa có trong TIMELINE" -f $d)
        }
    }
}

# --------------------------------------------------------------------------
# 4) MODE CHECK — Entry TIMELINE không có file tương ứng
# --------------------------------------------------------------------------
$missingFiles = @()
$missingMtgDirs = @()
if ($Mode -eq 'Check' -or $Mode -eq 'Both') {
    # Tập tên file thực để so khớp nhanh
    $actualNameSet = New-Object System.Collections.Generic.HashSet[string] ([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($f in $actualFiles) { [void]$actualNameSet.Add($f.Name) }

    # Tập tên TOÀN CÂY input/ (kể cả nhánh bulk bị bỏ qua khi quét: Aircraft/ACARS, PEP5.16,
    # MEL EFB, domain-knowledge) — để entry TIMELINE trỏ vào nhánh bulk không bị báo THIẾU oan.
    $allInputNames = New-Object System.Collections.Generic.HashSet[string] ([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($item in (Get-ChildItem -Path $inputPath -Recurse -File -ErrorAction SilentlyContinue)) {
        [void]$allInputNames.Add($item.Name)
    }

    # Ngoại lệ có chủ đích (KNOWN by design) — mỗi tên kèm lý do:
    $checkSkipExact = @(
        'VNA-TOSS-Function-list-v1.0.xlsx',   # nguồn LIVE Google Sheet — không lưu đĩa; chỉ có bản trích .extracted.md
        'dsp_monitoring_poc_v0.1.html'        # artifact mockup — nằm ở ba/workspace/drafts/mockup/, ngoài input/
    )

    foreach ($name in $timelineFiles) {
        # So khớp theo TÊN FILE (leaf) — token TIMELINE có thể kèm đường dẫn tương đối
        $leaf = ($name -split '[\\/]')[-1].Trim()

        # Bỏ qua token wildcard (dòng tổng hợp, không phải file thật)
        if ($name -match '\*') { continue }
        # Bỏ qua bản trích .extracted.md (nằm ở drafts/phan-tich/01-nguon/, không phải input/)
        if ($leaf -match '\.extracted\.md$') { continue }
        # Bỏ qua meta-file INDEX/README
        if ($leaf -match '^(INDEX|README)\.md$') { continue }
        # Bỏ qua tên file thuộc nhóm bulk ACARS/PEP5.16 (chỉ ghi dòng tổng hợp) — khớp cả khi có path đứng trước
        if ($leaf -match '^(in-26\d{4}|B787_GBST_CMF|AptMgr|APD)') { continue }
        if ($leaf -match '\.(md)$' -and $leaf -match '(combined_)') { continue }
        # Bỏ qua ngoại lệ có ghi chú
        if ($checkSkipExact -contains $leaf) { continue }

        if (-not ($actualNameSet.Contains($leaf) -or $allInputNames.Contains($leaf))) {
            $missingFiles += $name
        }
    }
    foreach ($d in $timelineMtgDirs) {
        if (-not $actualMtgDirs.Contains($d)) {
            $missingMtgDirs += $d
        }
    }

    Write-Output ''
    Write-Output '================ MODE CHECK — Entry TIMELINE không có file tương ứng ================'
    if ($missingFiles.Count -eq 0 -and $missingMtgDirs.Count -eq 0) {
        Write-Output '[OK] Mọi entry trong TIMELINE đều khớp với file/thư mục thực.'
    }
    else {
        foreach ($n in ($missingFiles | Sort-Object)) {
            Write-Output ("[THIẾU] {0} — có trong TIMELINE nhưng không tìm thấy file trong input/" -f $n)
        }
        foreach ($d in ($missingMtgDirs | Sort-Object)) {
            Write-Output ("[THIẾU] meeting-notes/{0}/ — TIMELINE đề cập nhưng thư mục không tồn tại" -f $d)
        }
    }
}

# --------------------------------------------------------------------------
# 5) Summary
# --------------------------------------------------------------------------
Write-Output ''
Write-Output '================ TÓM TẮT ================'
$nNew = $newFiles.Count + $newMtgDirs.Count
$nMissing = $missingFiles.Count + $missingMtgDirs.Count

if ($Mode -eq 'Scan' -or $Mode -eq 'Both') {
    Write-Output ("- File mới cần thêm vào TIMELINE: {0}" -f $nNew)
}
if ($Mode -eq 'Check' -or $Mode -eq 'Both') {
    Write-Output ("- Entry TIMELINE cần BA Lead xác nhận xóa: {0}" -f $nMissing)
}

if ($nNew -gt 0) {
    Write-Output ''
    Write-Output 'HÀNH ĐỘNG: Agent cập nhật TIMELINE (mục A + mục B), bump version, ghi changelog.'
}
if ($nMissing -gt 0) {
    Write-Output ''
    Write-Output 'HÀNH ĐỘNG: Agent THÔNG BÁO BA Lead — KHÔNG tự xóa entry. Chờ xác nhận trước khi gỡ.'
}

Write-Output ''
exit 0
