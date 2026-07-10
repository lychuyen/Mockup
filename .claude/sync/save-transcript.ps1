# save-transcript.ps1 — Stop hook.
# When a Claude Code session ends, archive the conversation transcript
# to logs/ba-sessions/YYYY-MM-DD-HHmm.md for later traceability.
#
# Reads hook JSON from stdin. The Stop hook payload includes `transcript_path`
# pointing to the JSONL transcript file. Exits 0 always.

param()

try {
    $payload = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $transcriptPath = $payload.transcript_path
    if ([string]::IsNullOrWhiteSpace($transcriptPath)) { exit 0 }
    if (-not (Test-Path $transcriptPath)) { exit 0 }

    # Determine project root
    $projectDir = $env:CLAUDE_PROJECT_DIR
    if ([string]::IsNullOrWhiteSpace($projectDir)) {
        $projectDir = (Get-Location).Path
    }

    # Ensure logs/ba-sessions/ exists
    $logDir = Join-Path $projectDir 'logs\ba-sessions'
    if (-not (Test-Path $logDir)) {
        New-Item -ItemType Directory -Path $logDir -Force | Out-Null
    }

    # Filename pattern: YYYY-MM-DD-HHmm.md. Append a counter if multiple sessions
    # end within the same minute.
    $timestamp  = Get-Date -Format 'yyyy-MM-dd-HHmm'
    $targetFile = Join-Path $logDir "$timestamp.md"
    $counter = 1
    while (Test-Path $targetFile) {
        $targetFile = Join-Path $logDir "$timestamp-$counter.md"
        $counter++
    }

    # Write a human-readable header, then append the raw transcript.
    # The Claude Code transcript is JSONL — embedded in .md it's still grep-friendly
    # and renderable in any text editor.
    $header = @"
# BA Session Transcript

- **Project:** VCM (Hệ thống Đầu tư & Mua sắm)
- **Ended at:** $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')
- **Source transcript:** ``$transcriptPath``
- **Session ID:** $($payload.session_id)
- **Format below:** JSONL (Claude Code transcript). One JSON object per line.

---

``````jsonl
"@
    $footer = "``````"

    $header | Out-File -FilePath $targetFile -Encoding utf8
    Get-Content $transcriptPath | Add-Content -Path $targetFile -Encoding utf8
    $footer | Add-Content -Path $targetFile -Encoding utf8
}
catch {
    # Silent on failures — never block session end
}

exit 0
