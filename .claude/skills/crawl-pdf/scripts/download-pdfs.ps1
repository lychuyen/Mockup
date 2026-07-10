<#
.SYNOPSIS
  Tải danh sách PDF về một thư mục, kiểm tra header %PDF-, báo cáo OK/lỗi.
.DESCRIPTION
  Đọc ListFile: mỗi dòng là 'url' hoặc 'url|ten-file' (không kèm .pdf). Nếu chỉ có url thì
  tên file suy từ phần cuối URL. Dùng Invoke-WebRequest với User-Agent trình duyệt + Referer
  (tránh 403). KHÔNG cần WSL. Sau tải, xác thực 4 byte đầu = '%PDF'.
.EXAMPLE
  .\download-pdfs.ps1 -ListFile dl.txt -OutDir .\_pdf
.NOTES
  Định dạng ListFile khuyến nghị (để tên file gọn, tránh trùng): 'url|ten-kebab'
#>
param(
  [Parameter(Mandatory=$true)][string]$ListFile,
  [Parameter(Mandatory=$true)][string]$OutDir,
  [string]$Referer = '',
  [int]$TimeoutSec = 120,
  [int]$SleepMs = 400
)
$ProgressPreference='SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol='Tls12,Tls13'
$ua='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124 Safari/537.36'
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

$rows = Get-Content $ListFile | Where-Object { $_ -match '\.pdf' -or $_ -match '\|' } | Where-Object { $_.Trim() -ne '' }
$results=@()
foreach($line in $rows){
  if($line -match '\|'){ $p=$line -split '\|',2; $url=$p[0].Trim(); $name=$p[1].Trim() }
  else { $url=$line.Trim(); $name=(($url -split '/')[-1] -replace '\.pdf$','') }
  if($Referer -eq ''){ try{ $Referer = ([System.Uri]$url).GetLeftPart([System.UriPartial]::Authority) + '/' }catch{} }
  $out=Join-Path $OutDir "$name.pdf"
  $ok=$false; $kb=0
  try{
    Invoke-WebRequest -Uri $url -OutFile $out -UserAgent $ua -TimeoutSec $TimeoutSec -Headers @{Referer=$Referer}
    $b=[System.IO.File]::ReadAllBytes($out)
    if($b.Length -ge 4 -and $b[0]-eq37 -and $b[1]-eq80 -and $b[2]-eq68 -and $b[3]-eq70){ $ok=$true; $kb=[math]::Round($b.Length/1KB,0) }
    elseif(Test-Path $out){ Remove-Item $out -Force }   # không phải PDF (HTML lỗi) -> xoá
  }catch{}
  $results += [pscustomobject]@{Name=$name; OK=$ok; KB=$kb}
  Start-Sleep -Milliseconds $SleepMs
}
$results | Format-Table -AutoSize
Write-Output ("OK: {0}/{1}  -> {2}" -f ($results | Where-Object OK).Count, $results.Count, $OutDir)
