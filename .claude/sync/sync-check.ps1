# sync-check.ps1 — PostToolUse hook for dual-scope sync reminder
# Triggered after Edit/Write tool calls. Reads tool input from stdin (JSON),
# checks whether the edited path is in a tracked scope, and prints a reminder.
# 2026-07-02 (BA Lead): mirror obligation retired for .claude/{agents,commands,
# templates,glossary} and .claude/human (now human role portraits, not a mirror).
# Only the CLAUDE.md <-> HUMAN.md pair still triggers a reminder.

param()

try {
    $payload = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $filePath = $payload.tool_input.file_path

    if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }

    # Normalize path separators
    $normalized = $filePath.Replace('\', '/')

    # Map a file path to its mirror counterpart
    $mirror = $null
    $scope = $null

    if ($normalized -match '/CLAUDE\.md$') {
        $mirror = $normalized -replace '/CLAUDE\.md$', '/HUMAN.md'
        $scope = 'AGENTS'
    }
    elseif ($normalized -match '/HUMAN\.md$') {
        $mirror = $normalized -replace '/HUMAN\.md$', '/CLAUDE.md'
        $scope = 'HUMAN'
    }
    # (retired 2026-07-02) .claude/human/ and .claude/{agents,commands,templates,glossary}
    # no longer have mirror pairs — see SYNC-PROTOCOL.md v1.1.

    if ($null -ne $mirror) {
        $target = if ($scope -eq 'AGENTS') { 'HUMAN scope (Vietnamese)' } else { 'AGENTS scope (English)' }
        Write-Output "[SYNC] You edited a file in the $scope scope. Per .claude/sync/SYNC-PROTOCOL.md, you MUST also update its mirror in the $target before completing the task: $mirror"
    }
}
catch {
    # Silent on parse failures — do not block tool execution
    exit 0
}
