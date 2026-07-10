# quality-gate.ps1 -- PostToolUse hook (NON-BLOCKING, verbose-on-fail) -- G1.
# Nguon: knowledge/agent-harness-engineering.md (N1 success-silent/fail-verbose, N4 verify-truoc-khi-xong).
#
# Khi ghi mot file deliverable .md (BRD/SRS/phan-tich/quy-trinh trong ba/),
# kiem tra YAML frontmatter bat buoc (CLAUDE.md §8). Thieu -> in CANH BAO chi tiet
# (verbose) de agent tu sua o luot sau. PASS -> im lang tuyet doi.
#
# Khong chan (exit 0 luon) -- day la cong chat luong nhac viec, khong phai rao cung.
# Loai tru file khong-phai-deliverable: INDEX.md, *.extracted.md, README.md, MEMORY.md,
# va moi thu duoi ba/workspace/input/ (nguon chi-doc).

param()

[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

try {
    $payload  = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $filePath = $payload.tool_input.file_path
    if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }
    if (-not (Test-Path $filePath)) { exit 0 }

    $norm = $filePath.Replace('\', '/')

    # Chi soat .md la deliverable BA
    if ($norm -notmatch '\.md$') { exit 0 }
    if ($norm -match '/(brd|srs|phan-tich|quy-trinh)/' -eq $false) { exit 0 }

    # Loai tru
    if ($norm -match '/INDEX\.md$')        { exit 0 }
    if ($norm -match '\.extracted\.md$')   { exit 0 }
    if ($norm -match '/README\.md$')       { exit 0 }
    if ($norm -match '/MEMORY\.md$')       { exit 0 }
    if ($norm -match '/ba/workspace/input/') { exit 0 }   # nguon chi-doc

    $content = Get-Content -Raw -Encoding UTF8 $filePath
    if ([string]::IsNullOrWhiteSpace($content)) { exit 0 }

    $issues = New-Object System.Collections.Generic.List[string]

    # 1) Co block YAML frontmatter o dau file?
    $hasFm = $content -match '(?ms)\A---\s*\r?\n.*?\r?\n---\s*\r?\n'
    if (-not $hasFm) {
        $issues.Add("thieu YAML frontmatter o dau file (CLAUDE.md muc 8)")
    }
    else {
        # 2) Du cac key bat buoc?
        $fm = [regex]::Match($content, '(?ms)\A---\s*\r?\n(.*?)\r?\n---\s*\r?\n').Groups[1].Value
        foreach ($key in @('project','author','version','date','status','document_type')) {
            if ($fm -notmatch "(?m)^\s*$key\s*:") {
                $issues.Add("frontmatter thieu key '$key'")
            }
        }
    }

    # 3) Co nhung san chu CHANGELOG/lich su nhung trong file? (CLAUDE.md §8: file chi chua noi dung hien tai)
    if ($content -match '(?im)^\s*#+\s*(changelog|lich su (thay doi|phien ban)|version history)\b') {
        $issues.Add("co section CHANGELOG/lich su nhung trong file -> chuyen sang BA-VERSION-LOG.md (CLAUDE.md muc 8)")
    }

    if ($issues.Count -gt 0) {
        [Console]::Error.WriteLine("[QUALITY-GATE] Deliverable chua dat (file: $filePath):")
        foreach ($i in $issues) { [Console]::Error.WriteLine("  - $i") }
        [Console]::Error.WriteLine("  => Bo sung roi ghi lai. (Canh bao non-blocking - khong chan thao tac.)")
    }
}
catch {
    # Silent on parse failures
}

exit 0
