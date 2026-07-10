# guard-safety.ps1 — PreToolUse hook (BLOCKING) — cluster G2 + G3.
# Nguon: knowledge/agent-harness-engineering.md (N1 ratcheting/destructive-guard, N3 credential isolation).
#
# Chan 3 nhom hanh dong nguy hiem:
#   G2a  git push --force / -f        (cho phep --force-with-lease)
#   G2b  rm -rf / Remove-Item -Recurse vao ROOT BAO VE (repo root, .git, .claude, ba/sync, /, ~, o dia)
#   G3   doc/echo noi dung .secrets/* (Read tool hoac cat|type|gc|Get-Content... trong shell)
#
# Quy uoc Claude Code: exit 2 = CHAN tool-call, stderr duoc dua nguoc cho model.
#                      exit 0 = cho phep.
# Triet ly: success silent (khong in gi khi pass), failure verbose (in ly do khi chan).

param()

[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Block($msg) {
    [Console]::Error.WriteLine("[GUARD-SAFETY] CHAN: $msg")
    exit 2
}

try {
    $payload  = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $toolName = $payload.tool_name

    # --- G3: Read/Glob/Grep nham vao .secrets ---
    if ($toolName -in @('Read', 'Glob', 'Grep')) {
        $p = "$($payload.tool_input.file_path) $($payload.tool_input.path) $($payload.tool_input.pattern)"
        if ($p -match '\.secrets') {
            Block "Cam doc/duyet noi dung .secrets/* (credential isolation - N3). Neu chi can metadata, hoi BA Lead."
        }
        exit 0
    }

    # --- Bash / PowerShell: soi command string ---
    if ($toolName -in @('Bash', 'PowerShell')) {
        $cmd = "$($payload.tool_input.command)"
        if ([string]::IsNullOrWhiteSpace($cmd)) { exit 0 }

        # G3: doc noi dung secret qua shell.
        # CHI chan khi mot dong tu DOC dung sat path .secrets (trong cung 1 doan lenh,
        # <=40 ky tu, khong vuot ; | & xuong dong). Tranh false-positive khi van ban tai
        # lieu chi tinh co nhac ".secrets" o cho khac.
        if ($cmd -match '(?i)\b(cat|type|more|less|head|tail|gc|Get-Content|Read-Content|Format-List|Select-String|findstr|grep|jq)\b[^\n;|&]{0,40}\.secrets') {
            Block "Cam doc noi dung .secrets/* qua shell (credential isolation - N3)."
        }

        # G2a: git push --force / -f  (cho phep --force-with-lease)
        if ($cmd -match '(?i)git\s+push') {
            if ($cmd -match '(?i)--force-with-lease') {
                # an toan hon — cho phep
            }
            elseif ($cmd -match '(?i)(--force(\b|=)|(^|\s)-[a-zA-Z]*f[a-zA-Z]*(\s|$))') {
                Block "git push --force bi chan (N1). Dung --force-with-lease, hoac human tu chay neu thuc su can."
            }
        }

        # G2b: xoa de quy vao ROOT BAO VE
        $isRecursiveDelete = ($cmd -match '(?i)\brm\s+(-[a-zA-Z]*r[a-zA-Z]*\s|-[a-zA-Z]*\s+.*-[a-zA-Z]*r)') `
                          -or ($cmd -match '(?i)\brm\s+-[a-zA-Z]*f[a-zA-Z]*r') `
                          -or ($cmd -match '(?i)\brm\s+-[a-zA-Z]*r[a-zA-Z]*f') `
                          -or ($cmd -match '(?i)Remove-Item\b.*-Recurse')
        if ($isRecursiveDelete) {
            # Cac muc tieu KHONG duoc xoa de quy (du allow-list co the cho phep xoa file draft cu the)
            $protected = @(
                '(?i)rm\s+-[a-zA-Z]*\s+(/|~|[a-zA-Z]:[\\/]?)(\s|$)',   # / ~ C:\ D:\ tran lan
                '(?i)(^|[\s''"/\\])\.git([\s''"/\\]|$)',                # .git
                '(?i)(^|[\s''"/\\])\.claude([\s''"/\\]|$)',             # .claude
                '(?i)ba[\\/]sync',                                       # ba/sync (source of truth)
                '(?i)Remove-Item\b.*-Recurse.*[\s"''][A-Za-z]:[\\/]?(\s|"|''|$)'   # chi GOC o dia (D:\ ), khong chan D:\subfolder
            )
            foreach ($pat in $protected) {
                if ($cmd -match $pat) {
                    Block "Xoa de quy vao thu muc/root bao ve bi chan (N1): khop '$pat'. Xoa file draft cu the thi OK; KHONG xoa .git/.claude/ba/sync/o dia."
                }
            }
        }
    }
}
catch {
    # Loi parse -> khong chan (fail-open de khong ket workflow), nhung ghi nhe.
}

exit 0
