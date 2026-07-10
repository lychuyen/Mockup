# check-vietnamese.ps1 — PreToolUse hook for Write|Edit.
# Warns (non-blocking) when content being written to a .md file under
# docs/, deliverables/, or reports/ is predominantly English.
#
# Reads hook JSON from stdin. Exits 0 always (non-blocking).

param()

# Force UTF-8 for stdin so Vietnamese diacritics survive (Claude Code emits UTF-8 JSON)
[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

try {
    $payload = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $filePath = $payload.tool_input.file_path
    if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }

    # Normalize path separators for matching
    $normalized = $filePath.Replace('\', '/')

    # Filter: only .md files in tracked deliverable folders
    $isMarkdown      = $normalized -match '\.md$'
    $inTrackedFolder = $normalized -match '/(docs|deliverables|reports)/'
    if (-not ($isMarkdown -and $inTrackedFolder)) { exit 0 }

    # Resolve the content being written (Write supplies content; Edit supplies new_string)
    $content = $null
    if ($payload.tool_name -eq 'Write') {
        $content = $payload.tool_input.content
    }
    elseif ($payload.tool_name -eq 'Edit') {
        $content = $payload.tool_input.new_string
    }
    if ([string]::IsNullOrWhiteSpace($content)) { exit 0 }

    # Strip markdown noise that would skew the English ratio:
    $stripped = $content
    $stripped = $stripped -replace '(?ms)^---\s*\r?\n.*?\r?\n---\s*\r?\n', ''   # YAML frontmatter
    $stripped = $stripped -replace '(?ms)```[\s\S]*?```', ''                      # fenced code
    $stripped = $stripped -replace '`[^`]*`', ''                                  # inline code
    $stripped = $stripped -replace '\[([^\]]*)\]\([^\)]*\)', '$1'                 # links → text
    $stripped = $stripped -replace '<[^>]+>', ' '                                 # HTML/Markdown tags
    $stripped = $stripped -replace '[#*_>|=`~\-]', ' '                            # MD punctuation

    # Tokenize: any run of letters (Unicode-aware — Vietnamese diacritics included)
    $tokens = [regex]::Matches($stripped, '[\p{L}]+') | ForEach-Object { $_.Value }
    if ($tokens.Count -lt 10) { exit 0 }    # too short to assess reliably

    # An "English word" here = letters are all in ASCII A-Z/a-z (no diacritics).
    # Vietnamese words like "tiếng", "Việt", "phê" will fail this test → counted as Vietnamese.
    $englishWords = 0
    $totalWords   = 0
    foreach ($t in $tokens) {
        # Skip very short tokens that might be acronyms or noise
        if ($t.Length -lt 2) { continue }
        $totalWords++
        if ($t -match '^[A-Za-z]+$') { $englishWords++ }
    }

    if ($totalWords -eq 0) { exit 0 }

    $ratio = $englishWords / $totalWords
    if ($ratio -gt 0.5) {
        $pct = [math]::Round($ratio * 100, 1)
        [Console]::Error.WriteLine("[BA-LANG] WARNING - Deliverable phai viet bang tieng Viet (Vietnamese-only). File: $filePath - English-word ratio: $pct% over $totalWords words.")
    }
}
catch {
    # Silent on parse failures — never block the user's workflow.
}

exit 0
