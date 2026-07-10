<#
.SYNOPSIS
  BFS crawl một website cùng miền để thu thập toàn bộ liên kết PDF.
.DESCRIPTION
  Duyệt rộng (breadth-first) từ các trang seed, chỉ đi trong cùng host, bỏ qua asset
  (ảnh/css/js...), và gom mọi liên kết .pdf. Có thể lọc theo PathFilter (vd '/wp-content/'
  hoặc '/contentassets/'). Xuất danh sách URL (unique, sorted) ra OutFile.
.EXAMPLE
  .\crawl-pdf-links.ps1 -Seeds 'https://ffac.ch/' -PathFilter '/wp-content/' -OutFile pdfs.txt
.EXAMPLE
  .\crawl-pdf-links.ps1 -Seeds 'https://www.iata.org/','https://www.iata.org/en/publications/' `
     -PathFilter '/contentassets/' -MaxPages 350 -OutFile iata_pdfs.txt
#>
param(
  [Parameter(Mandatory=$true)][string[]]$Seeds,
  [string]$PathFilter = '',                 # substring URL PDF phải chứa; '' = không lọc
  [int]$MaxPages = 200,
  [string]$OutFile = "$env:TEMP\crawl_pdfs.txt",
  [int]$TimeoutSec = 20
)
$ProgressPreference='SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol='Tls12,Tls13'
$ua='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124 Safari/537.36'

$domain = ([System.Uri]$Seeds[0]).Host
$visited = New-Object System.Collections.Generic.HashSet[string]
$pdf     = New-Object System.Collections.Generic.HashSet[string]
$q       = New-Object System.Collections.Generic.Queue[string]
foreach($s in $Seeds){ if($visited.Add($s)){ $q.Enqueue($s) } }

function Norm($href,$base){
  if([string]::IsNullOrWhiteSpace($href)){return $null}
  if($href -match '^(mailto:|tel:|javascript:|#)'){return $null}
  if($href -match '{{'){return $null}                       # bỏ template chưa render
  try{ $u=[System.Uri]::new([System.Uri]$base,$href); return $u.GetLeftPart([System.UriPartial]::Path) }catch{return $null}
}

$pages=0
while($q.Count -gt 0 -and $pages -lt $MaxPages){
  $url=$q.Dequeue()
  try{ $r=Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec $TimeoutSec -UserAgent $ua }catch{ continue }
  $pages++
  foreach($lnk in $r.Links){
    $n=Norm $lnk.href $url; if($null -eq $n){continue}
    if($n -match '\.pdf(\?|$)'){ if($PathFilter -eq '' -or $n -like "*$PathFilter*"){ [void]$pdf.Add($n) }; continue }
    try{ $h=([System.Uri]$n).Host }catch{ continue }
    if($h -ne $domain){ continue }
    if($n -match '\.(jpg|jpeg|png|gif|svg|webp|css|js|zip|docx?|xlsx?|pptx?|mp4|mp3|ico|woff2?|ttf|rss|xml)(\?|$)'){ continue }
    if(-not $visited.Contains($n)){ [void]$visited.Add($n); $q.Enqueue($n) }
  }
}
$all = $pdf | Sort-Object -Unique
$all | Out-File $OutFile -Encoding UTF8
Write-Output "Pages crawled: $pages (visited set: $($visited.Count))"
Write-Output "PDF links: $($all.Count)  -> $OutFile"
$all | Select-Object -First 20 | ForEach-Object { $_ }
