# skill-lint.ps1 -- PostToolUse hook (NON-BLOCKING, verbose-on-fail).
# Nguon: knowledge/_books-extracted/The-Complete-Guide-to-Building-Skill-for-Claude.extracted.md (Reference A)
#        + CLAUDE.md §6 SKILL-CREATION RULE.
#
# Khi ghi mot file .claude/skills/<ten>/SKILL.md, kiem checklist toi thieu cua guide.
# PASS -> im lang. FAIL -> in canh bao chi tiet (verbose) de agent tu sua. Khong chan (exit 0).
#
# Quy uoc: string literal chi ASCII (tranh loi encoding khi powershell.exe doc UTF-8).

param()

[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

try {
    $payload  = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $filePath = $payload.tool_input.file_path
    if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }
    if (-not (Test-Path $filePath)) { exit 0 }

    $norm = $filePath.Replace('\', '/')

    # Chi soat file SKILL.md trong .claude/skills/<ten>/
    if ($norm -notmatch '\.claude/skills/[^/]+/SKILL\.md$') { exit 0 }

    $folder     = Split-Path -Parent $filePath
    $folderName = Split-Path -Leaf $folder

    $content = Get-Content -Raw -Encoding UTF8 $filePath
    if ([string]::IsNullOrWhiteSpace($content)) { exit 0 }

    $issues = New-Object System.Collections.Generic.List[string]

    # --- Frontmatter ---
    $fmMatch = [regex]::Match($content, '(?ms)\A---\s*\r?\n(.*?)\r?\n---\s*\r?\n')
    if (-not $fmMatch.Success) {
        $issues.Add("thieu YAML frontmatter (--- ... ---) o dau SKILL.md")
    }
    else {
        $fm = $fmMatch.Groups[1].Value

        # 1) The angle-bracket < > trong frontmatter (cam - bao mat/upload Claude.ai)
        if ($fm -match '[<>]') {
            $issues.Add("frontmatter CHUA the '< >' (cam) -> thay bang [ ] hoac ( )")
        }

        # 2) name
        $nameM = [regex]::Match($fm, '(?m)^\s*name:\s*(.+?)\s*$')
        if (-not $nameM.Success) {
            $issues.Add("frontmatter thieu 'name:'")
        }
        else {
            $nm = $nameM.Groups[1].Value.Trim('"').Trim("'")
            if ($nm -notmatch '^[a-z0-9]+(-[a-z0-9]+)*$') {
                $issues.Add("name '$nm' khong phai kebab-case (chi a-z 0-9 va dau '-', khong hoa/space/_)")
            }
            if ($nm -imatch 'claude|anthropic') {
                $issues.Add("name '$nm' chua tu khoa reserved 'claude'/'anthropic'")
            }
            if ($nm -ne $folderName) {
                $issues.Add("name '$nm' khong khop ten thu muc '$folderName'")
            }
        }

        # 3) description
        $descM = [regex]::Match($fm, '(?ms)^\s*description:\s*(.+?)\s*(?:\r?\n\S|\z)')
        if (-not $descM.Success) {
            $issues.Add("frontmatter thieu 'description:'")
        }
        else {
            $desc = $descM.Groups[1].Value
            $dlen = $desc.Length
            if ($dlen -gt 1024) {
                $issues.Add("description dai $dlen ky tu (gioi han 1024)")
            }
            # Co dau hieu "khi nao dung" (trigger)?
            # Pattern chi dung token ASCII (string literal .ps1 khong giu duoc dau TV):
            # '\bkhi\b' khop "Dung khi"/"khi nguoi dung" (tu "khi" la ASCII); kem cac cum tieng Anh.
            if ($desc -inotmatch '(\bkhi\b|use when|when user|when the user|\btrigger\b)') {
                $issues.Add("description thieu phan 'khi nao dung' (trigger) - them 'Dung khi nguoi dung muon ...'")
            }
        }
    }

    # --- README trong thu muc skill (cam) ---
    if (Test-Path (Join-Path $folder 'README.md')) {
        $issues.Add("co README.md trong thu muc skill (cam) -> doc dat trong SKILL.md hoac references/")
    }

    # --- Kich thuoc than SKILL.md (khuyen nghi < 5000 tu) ---
    $wordCount = ([regex]::Matches($content, '\S+')).Count
    if ($wordCount -gt 5000) {
        $issues.Add("SKILL.md $wordCount tu (>5000) -> day chi tiet sang references/ (progressive disclosure)")
    }

    if ($issues.Count -gt 0) {
        [Console]::Error.WriteLine("[SKILL-LINT] SKILL.md chua dat checklist guide (file: $filePath):")
        foreach ($i in $issues) { [Console]::Error.WriteLine("  - $i") }
        [Console]::Error.WriteLine("  => Sua theo knowledge/_books-extracted/The-Complete-Guide-to-Building-Skill-for-Claude.extracted.md (Reference A). Canh bao non-blocking.")
    }
}
catch {
    # Silent on parse failures
}

exit 0
