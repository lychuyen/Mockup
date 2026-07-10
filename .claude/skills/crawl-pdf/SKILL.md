---
name: crawl-pdf
description: Crawl một website để thu thập liên kết PDF, tải các file PDF về máy, và (tuỳ chọn) phân rã sang Markdown — PDF giữ cấu trúc bằng pymupdf4llm (heading/bảng/bold; fallback pdftotext -layout cho text thô), tài liệu Office (DOCX/PPTX/XLSX/HTML) bằng markitdown. Dùng khi người dùng muốn "crawl PDF", "lấy/tải các link PDF", "tải tài liệu PDF của trang X về", "liệt kê link PDF", hoặc "phân rã/chuyển PDF/DOCX/XLSX sang md" từ một nguồn web hay tài liệu nội bộ (vd ffac.ch, iata.org, govinfo.gov, ccaa.hr, Customer_docs...).
metadata:
  version: "1.1.0"
---

# Skill: Crawl + Tải + Phân rã PDF từ website

> **Mục tiêu:** Lấy tài liệu PDF từ một website về kho `domain-knowledge` của dự án — gồm 3 việc cơ học (crawl link → tải PDF → phân rã MD) do **script PowerShell** lo, và 2 việc **phán đoán** (lọc phạm vi + dịch nhãn song ngữ) do **agent** lo theo yêu cầu người dùng.
>
> **Nguyên tắc (CLAUDE.md §0):** bản .md phân rã là **trích trung thực** (raw extract), không diễn giải. Việc lọc "phạm vi nào" và dịch tiêu đề là quyết định bám yêu cầu người dùng.

## 0. Engine phân rã & cài đặt môi trường (ĐỌC TRƯỚC)

> Cập nhật 2026-06-16. Định tuyến engine theo định dạng nguồn — **đỡ token vì convert chạy ở máy (0 token mô hình)**, sau đó Grep/đọc chọn lọc bản `.md`.

| Định dạng nguồn | Engine | Lệnh | Ghi chú |
|---|---|---|---|
| **PDF → .md giữ cấu trúc** (MẶC ĐỊNH) | **pymupdf4llm** (PyMuPDF) | `python scripts/pdf-to-md.py "<file.pdf hoặc thư mục>" "<out-dir>"` | Suy heading từ cỡ chữ (`#`/`##`), phát hiện **bảng → Markdown table**, giữ `**bold**`/`*italic*`, reading-order tốt. Pure Python, **không cần poppler**. Thêm `--images` để trích ảnh |
| **PDF → text thô / tốc độ tối đa** (fallback) | `pdftotext -layout` | qua `scripts/pdf-to-md.ps1` (WSL, đọc qua `/mnt/host`) | Chỉ khi cần text phẳng nhanh (grep/đếm từ/feed ASR), hoặc khi pymupdf4llm lỗi. Cần poppler trong WSL |
| **Office/HTML** (DOCX, PPTX, XLSX, HTML, CSV) | **markitdown** | `python -m markitdown "<file>" -o "<out.md>"` | pdftotext/pymupdf4llm KHÔNG đọc Office → dùng markitdown |

**Cài đặt (một lần / khi mất):**
- **pymupdf4llm** — pure Python (engine PDF mặc định): `python -m pip install --user pymupdf4llm`. Kiểm tra: `python -c "import pymupdf4llm; print('ok')"`. **Không cần binary ngoài** → hợp Windows/venv hơn pdftotext.
- **markitdown** — pure Python: `python -m pip install --user "markitdown[all]"` (đã cài v0.1.6). Kiểm tra: `python -m markitdown --version`.
- **pdftotext** (fallback) — WSL distro `docker-desktop` (Alpine) mặc định CHƯA có. Cài: `wsl -d docker-desktop -- apk add --no-cache poppler-utils`. Distro ephemeral → chạy lại khi `pdftotext: not found`.

**Chọn engine PDF:** mục tiêu ra `.md` **giữ cấu trúc** (heading/bảng/list — để đọc, đưa vào RAG/LLM, hoặc deliverable) → **pymupdf4llm** (thắng rõ). Chỉ cần text thô + tốc độ tối đa → pdftotext. Cả hai **không OCR** (chỉ đọc text-layer; PDF scan ảnh → cần OCR riêng). Lưu ý license: poppler GPL, PyMuPDF **AGPL** (cân nhắc nếu phân phối thương mại).

**Lưu ý chất lượng:** bản trích là **raw extract** (CLAUDE.md §0). XLSX qua markitdown để ô trống thành `NaN`/cột không tên thành `Unnamed: N` — dọn tay khi cần bản chính thức.

### 0.1 Kết nối Google Drive / Sheets (LIVE, qua Service Account)
Pull tài liệu **đang ở Google Drive/Sheets** về `.md` (re-pull khi nguồn đổi). Chạy ở máy → 0 token.

| Loại nguồn Google | Script | Lệnh |
|---|---|---|
| **Google Sheet native** (đọc cell trực tiếp, **sạch hơn** — không `NaN`/`Unnamed`) | `scripts/gsheet-to-md.py` | `python scripts/gsheet-to-md.py <id\|url> <out.md>` |
| **File Office trên Drive** (xlsx/docx upload) **hoặc** native | `scripts/gdrive-to-md.py` | `python scripts/gdrive-to-md.py <id\|url> <out.md>` |

- **Native sheet → ưu tiên `gsheet-to-md.py`** (mỗi tab = 1 `##`, đọc cell sạch). File Office-trên-Drive (lỗi *"must not be an Office file"* khi gọi Sheets API) → dùng `gdrive-to-md.py` (Drive API tải thô → markitdown).
- **Cài (một lần):** `python -m pip install --user gspread google-auth`. Bật **Google Sheets API** + **Drive API** trong GCP project.
- **Auth (việc của HUMAN — §0.3):** tạo **Service Account** (KHÔNG cần role project) → tạo **key JSON** → đặt ở `.secrets/` (đã gitignore, **không bao giờ commit/chia sẻ**) → **Share** file/sheet cho `client_email` của SA (Viewer). Bàn giao máy khác: người nhận tự tạo SA key riêng.
- Key mặc định script đọc: `.secrets/toss-sa.json` (đổi bằng `--key`).

**Đối soát các lần TIẾP THEO (incremental):** mỗi bản pull ghi `source_version`/`source_modified`/`last_modifying_user` vào frontmatter.
- **Phát hiện đổi (không tải):** `python scripts/gsheet-to-md.py <id> <out.md> --check` (hoặc `gdrive-to-md.py … --check`) → in `[CHƯA ĐỔI]` / `[ĐÃ ĐỔI] local vX → live vY, sửa <time> bởi <user>`.
- **Đối soát + delta:** `python scripts/gdrive-reconcile.py <id> <out.md>` → nếu đổi: tự chọn engine, pull đè, rồi **`git diff`** (working vs bản committed) in **delta cấp dòng/mục** + ai/khi nào.
- **Lưu ý:** Google API KHÔNG expose diff cấp ô; **git là nhật ký thay đổi** — commit mỗi lần pull, lần sau `reconcile`/`git diff` cho đúng phần khác. `revisions` API chỉ cho ai/khi nào (không phải nội dung ô).

## 1. Khi nào dùng
Người dùng muốn: "crawl các link PDF", "tải PDF của trang X", "liệt kê link PDF song ngữ", "chỉ tải PDF phạm vi …", "phân rã PDF/DOCX/XLSX sang md".

## 2. Quy trình 4 bước

### Bước 1 — Crawl liên kết PDF (script)
```powershell
.\.claude\skills\crawl-pdf\scripts\crawl-pdf-links.ps1 `
  -Seeds 'https://ffac.ch/' -PathFilter '/wp-content/' -MaxPages 200 -OutFile "$env:TEMP\pdfs.txt"
# Nhiều seed + path /contentassets/ (vd IATA):
.\...\crawl-pdf-links.ps1 -Seeds 'https://www.iata.org/','https://www.iata.org/en/publications/' `
  -PathFilter '/contentassets/' -MaxPages 350 -OutFile "$env:TEMP\iata.txt"
```
Xuất danh sách URL PDF (unique). `-PathFilter` lọc theo thư mục lưu trữ (`/wp-content/`, `/contentassets/`, `/uploads/`…).

### Bước 2 — Lọc phạm vi + lập danh sách song ngữ (AGENT làm, không script)
- Đọc danh sách URL, **lọc theo phạm vi người dùng yêu cầu** (vd "định nghĩa chung" = glossary/definition/requirements/code/standard; loại marketing/membership/agm/factsheet/whitepaper/report). Dùng grep/regex trên tên file để lọc nhanh.
- **Dịch tiêu đề song ngữ** *Tiếng Việt — Nguyên gốc*; giữ thuật ngữ riêng (ICAO, EASA, IATA, FAA, AOC…).
- Viết file index `*-links.md` trong `ba/workspace/input/domain-knowledge/<bộ>/` + chuẩn bị `dl.txt` (mỗi dòng `url|ten-kebab`) cho bước 3.

### Bước 3 — Tải PDF (script, KHÔNG cần WSL)
```powershell
.\.claude\skills\crawl-pdf\scripts\download-pdfs.ps1 -ListFile "$env:TEMP\dl.txt" -OutDir ".\<bộ>\_pdf"
```
Dùng UA trình duyệt + Referer (tránh 403), xác thực header `%PDF-`, xoá file HTML lỗi, báo OK/lỗi từng file.

### Bước 4 — Phân rã PDF → MD (script, CẦN WSL + poppler-utils)
```powershell
# (tuỳ chọn) map.txt: mỗi dòng  ten-file|source_url|tieu_de
.\.claude\skills\crawl-pdf\scripts\pdf-to-md.ps1 -PdfDir ".\<bộ>\_pdf" -OutDir ".\<bộ>" -MapFile "$env:TEMP\map.txt"
```
Mỗi PDF → một `.md` (frontmatter + link nguồn + text `pdftotext -layout`).

## 3. Bài học (đừng lặp lại)
| # | Vấn đề | Cách đúng |
|---|---|---|
| 1 | Trang JS render (`{{href}}`) | Crawl chỉ lấy link tĩnh; tăng `-MaxPages` + thêm nhiều `-Seeds` (publications/programs/services) để phủ rộng. |
| 2 | Tải bị 403 / trả về HTML | Dùng **User-Agent trình duyệt + Referer** (đã có sẵn trong `download-pdfs.ps1`); xác thực `%PDF-`. |
| 3 | Tải hàng loạt bị rate-limit (file rỗng) | Có `-SleepMs` giữa các lần; thử lại file lỗi với `--retry`/nghỉ lâu hơn. |
| 4 | **Đĩa WSL read-only** ("mounted read-only as a fallback") khiến copy-vào-WSL + ghi output chết | `pdf-to-md.ps1` đã chuyển sang **đọc PDF qua `/mnt/host/<ổ>/...` + `pdftotext ... -` (STDOUT)**, PowerShell ghi `.md` phía Windows → **chạy được KỂ CẢ khi WSL read-only** (không copy, không ghi vào WSL). Nếu vẫn lỗi: thử `/mnt/<ổ>/`, hoặc khởi động lại Docker Desktop. |
| 5 | Sandbox PowerShell chặn pattern `awk '/.../'` (hiểu nhầm là xoá path) | Tránh `awk`/`rm` trong here-string; hoặc chạy với sandbox tắt cho lệnh WSL. |
| 6 | Trùng tên file giữa các thư mục nguồn (vd `specifications_v2b.pdf`) | Thêm hậu tố hash thư mục vào tên: `ten--<6kýtựhash>`. |
| 7 | Regex `ICAO-Annex-1` khớp nhầm `Annex-12..19` | Khi lọc theo số, neo ranh giới (vd `ICAO-Annex-1-` hoặc dùng tên đầy đủ). |
| 8 | Lẫn báo cáo vào tập "định nghĩa" | Loại keyword báo cáo: report/Bericht/Schlussbericht/Urteil/Forum/Präsentation/Programm/Factsheet/Whitepaper/agm/membership. |

## 4. Nguồn PDF chuẩn hay dùng
- **ICAO Annexes / Docs (host công khai):** `ffac.ch/wp-content/uploads/...` (vd `ICAO-Annex-6-...pdf`). Tài liệu ICAO có **bản quyền** — tham khảo nội bộ.
- **FAA 14 CFR (public domain):** govinfo.gov — `https://www.govinfo.gov/content/pkg/CFR-<năm>-title14-vol<N>/pdf/CFR-<năm>-title14-vol<N>-part<NNN>.pdf` (Title 14: vol1=1–59, vol2=60–109, vol3=110–199).
- **IATA:** `iata.org/contentassets/...` (phần lớn tài liệu chuẩn IATA là sản phẩm trả phí, không có công khai).

## 4b. Phân rã tài liệu LỚN sau extract (token-economy)

> Bản trích lớn (**> ~800 dòng**, vd tài liệu kỹ thuật PDF 10k+ dòng) → **phân rã theo section cấp 1** để tra đúng phần, không nạp cả file (CLAUDE.md §0.5/§8). CHỈ tách trung thực, không sửa nội dung (§0).

```bash
# 1 file → <ten>_parts/sec-NN-*.md + INDEX.md (nối nội dung). --delete-original nếu thay monolith.
python .claude/skills/crawl-pdf/scripts/split-md-by-section.py "<file.md>" [--outdir <dir>] [--title "<tiêu đề INDEX>"] [--delete-original]
# cả thư mục: phân rã mọi .md > min-lines
python .claude/skills/crawl-pdf/scripts/split-md-by-section.py "<thư mục>" --all --min-lines 800
```
- Nhận diện ranh giới: heading **đánh số cấp `##`** (số ≤ 99, tránh bắt nhầm model/năm như "787") → fallback `# N` → fallback mọi `##` (khi ≥6 heading). Phần trước section đầu → `sec-00-front-matter.md`.
- Sau khi phân rã: cập nhật INDEX cha (vd `01-nguon/INDEX.md`) trỏ tới `<ten>_parts/INDEX.md` thay vì monolith (rule INDEX completeness §8).
- Áp dụng cho bản trích lớn ở `01-nguon/` (Customer_docs) **và** KB lớn (`domain-knowledge/` — bổ trợ `term-check/split-kb-by-content.ps1` vốn cắt theo MỌI `##`; script này cắt theo SECTION SỐ cấp 1, hợp tài liệu kỹ thuật nhiều mục con).

## 5. Tài sản skill
- `scripts/crawl-pdf-links.ps1` — BFS crawl → danh sách URL PDF.
- `scripts/download-pdfs.ps1` — tải + xác thực PDF (PowerShell thuần, không cần WSL).
- `scripts/pdf-to-md.ps1` — phân rã PDF → MD qua WSL `pdftotext`, đọc PDF qua `/mnt/host/<ổ>/...` + xuất **stdout** (PowerShell ghi `.md`) → **chạy được kể cả khi đĩa WSL read-only**; tự dò mount `/mnt/host` hoặc `/mnt`.
- `scripts/split-md-by-section.py` — **phân rã .md lớn theo section cấp 1** → `<ten>_parts/sec-NN-*.md` + INDEX nối nội dung (§4b). Pure Python, stdout UTF-8.
