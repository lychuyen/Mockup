# format-markdown.ps1 — PostToolUse hook for Write.
# Auto-formats .md files written under .claude/templates/ or deliverables/
# using markdownlint-cli if it's installed. Silently skips if not available.
#
# Reads hook JSON from stdin. Exits 0 always.

param()

try {
    $payload = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $filePath = $payload.tool_input.file_path
    if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }

    if (-not (Test-Path $filePath)) { exit 0 }

    # Normalize path separators for matching
    $normalized = $filePath.Replace('\', '/')

    # Filter: only .md files in templates/ or deliverables/
    $isMarkdown      = $normalized -match '\.md$'
    $inTrackedFolder = ($normalized -match '\.claude/templates/') -or ($normalized -match '/deliverables/')
    if (-not ($isMarkdown -and $inTrackedFolder)) { exit 0 }

    # Check markdownlint-cli availability
    $mdl = Get-Command markdownlint -ErrorAction SilentlyContinue
    if ($null -eq $mdl) {
        # Tool not installed — silent skip. This is intentional fallback behavior.
        exit 0
    }

    # Run markdownlint --fix on the file. Suppress errors; never break the workflow.
    try {
        & $mdl.Source --fix $filePath 2>&1 | Out-Null
    } catch {
        # Even if markdownlint errors (e.g., config not found), do not propagate.
    }
}
catch {
    # Silent on parse failures
}

exit 0
