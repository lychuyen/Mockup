<#
.SYNOPSIS
  Xuất file .drawio → PNG bằng draw.io CLI (desktop app).
  Mỗi page trong file → 1 PNG riêng, tên file dựa vào tên page trong drawio.

.PARAMETER Source
  Đường dẫn đến 1 file .drawio HOẶC thư mục chứa nhiều file .drawio.

.PARAMETER Pattern
  (Khi Source là thư mục) glob pattern để lọc file. Mặc định: *.drawio

.PARAMETER OutDir
  Thư mục chứa PNG ra. Mặc định: cùng thư mục với file .drawio nguồn.

.PARAMETER PageIndex
  Xuất 1 page cụ thể (0-based). Bỏ qua = xuất tất cả pages.

.PARAMETER Scale
  Hệ số phóng to (>1 = độ phân giải cao hơn). Mặc định: 2 (150 DPI equiv).

.EXAMPLE
  # Export 1 file, tất cả pages
  .\export-drawio-png.ps1 -Source "ba/sync/models/quy-trinh-tobe/TOBE-PH1.drawio"

  # Export toàn bộ thư mục
  .\export-drawio-png.ps1 -Source "ba/sync/models/quy-trinh-tobe" -Pattern "*.drawio"

  # Chỉ page 0, scale cao
  .\export-drawio-png.ps1 -Source "file.drawio" -PageIndex 0 -Scale 3
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Source,
    [string]$Pattern   = "*.drawio",
    [string]$OutDir    = "",
    [int]   $PageIndex = -1,
    [double]$Scale     = 2
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ─── Tìm draw.io executable ────────────────────────────────────────────────
function Find-DrawioExe {
    $candidates = @(
        "$env:LOCALAPPDATA\Programs\draw.io\draw.io.exe",
        "$env:ProgramFiles\draw.io\draw.io.exe",
        "${env:ProgramFiles(x86)}\draw.io\draw.io.exe",
        "C:\Users\$env:USERNAME\AppData\Local\Programs\draw.io\draw.io.exe"
    )
    foreach ($p in $candidates) {
        if (Test-Path $p) { return $p }
    }
    # PATH lookup
    $found = Get-Command "draw.io" -ErrorAction SilentlyContinue
    if ($found) { return $found.Source }
    return $null
}

$drawio = Find-DrawioExe
if (-not $drawio) {
    Write-Host ""
    Write-Host "❌  draw.io desktop chưa cài — script cần draw.io CLI để xuất PNG." -ForegroundColor Red
    Write-Host ""
    Write-Host "  Cài bằng winget (chạy 1 lần, không cần quyền admin):" -ForegroundColor Yellow
    Write-Host "    winget install --id JGraph.drawio -e --scope user" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Sau khi cài xong, chạy lại script này." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Hoặc xuất tay: mở draw.io → File → Export As → PNG (tích 'All pages')." -ForegroundColor Gray
    exit 1
}
Write-Host "draw.io: $drawio" -ForegroundColor Green

# ─── Thu thập danh sách file .drawio ───────────────────────────────────────
$src = Resolve-Path $Source -ErrorAction SilentlyContinue
if (-not $src) { Write-Error "Không tìm thấy: $Source"; exit 1 }

$files = @()
if (Test-Path $src -PathType Container) {
    $files = Get-ChildItem $src -Filter $Pattern -File | Select-Object -ExpandProperty FullName
} else {
    $files = @($src.Path)
}

if ($files.Count -eq 0) {
    Write-Host "Không có file .drawio nào thoả điều kiện tại: $Source" -ForegroundColor Yellow
    exit 0
}

Write-Host "Sẽ xuất $($files.Count) file(s)..." -ForegroundColor Cyan

# ─── Hàm đọc tên page từ XML .drawio ──────────────────────────────────────
function Get-PageNames([string]$drawioPath) {
    [xml]$xml = Get-Content $drawioPath -Encoding UTF8
    $pages = $xml.mxfile.diagram
    if (-not $pages) { return @("p0") }
    $names = @()
    $i = 0
    foreach ($pg in $pages) {
        $raw = $pg.name
        if ($raw) {
            # Sanitise: giữ chữ, số, dấu gạch; bỏ ký tự đặc biệt
            $safe = ($raw -replace '[^\w\-]', '_').Trim('_')
            if (-not $safe) { $safe = "p$i" }
            $names += $safe
        } else {
            $names += "p$i"
        }
        $i++
    }
    return $names
}

# ─── Xuất từng file ────────────────────────────────────────────────────────
$totalOk = 0; $totalFail = 0

foreach ($file in $files) {
    $stem  = [System.IO.Path]::GetFileNameWithoutExtension($file)
    $dir   = if ($OutDir) { $OutDir } else { [System.IO.Path]::GetDirectoryName($file) }
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }

    $pageNames = @(Get-PageNames $file)
    $totalPages = $pageNames.Count

    Write-Host "`n  [$stem] — $totalPages page(s)"

    $pageList = if ($PageIndex -ge 0) { @($PageIndex) } else { 0..($totalPages-1) }

    foreach ($idx in $pageList) {
        if ($idx -ge $totalPages) {
            Write-Host "    page $idx vượt quá tổng số trang ($totalPages)" -ForegroundColor Yellow
            continue
        }
        $pageName = $pageNames[$idx]
        $outFile  = Join-Path $dir "$stem-$pageName.png"

        # draw.io CLI: --export --format png --page-index N --scale S --output out.png file.drawio
        $args = @(
            "--export",
            "--format", "png",
            "--page-index", "$idx",
            "--scale", "$Scale",
            "--output", $outFile,
            $file
        )

        Write-Host "    page $idx ($pageName) → $([System.IO.Path]::GetFileName($outFile))" -NoNewline

        try {
            $proc = Start-Process -FilePath $drawio -ArgumentList $args -Wait -PassThru -NoNewWindow
            if ($proc.ExitCode -eq 0 -and (Test-Path $outFile)) {
                $kb = [Math]::Round((Get-Item $outFile).Length / 1024, 1)
                Write-Host "  ✓ $($kb) KB" -ForegroundColor Green
                $totalOk++
            } else {
                Write-Host "  ✗ (exit $($proc.ExitCode))" -ForegroundColor Red
                $totalFail++
            }
        } catch {
            Write-Host "  ✗ $_" -ForegroundColor Red
            $totalFail++
        }
    }
}

# ─── Tổng kết ──────────────────────────────────────────────────────────────
Write-Host ""
if ($totalFail -eq 0) {
    Write-Host "✅  Xong: $totalOk PNG xuất thành công." -ForegroundColor Green
} else {
    Write-Host "⚠   Xong: $totalOk OK, $totalFail lỗi." -ForegroundColor Yellow
}
