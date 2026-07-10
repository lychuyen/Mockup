# Định dạng Word SRS chuẩn VNA/VTIT (QT02.BM.04 — Tài liệu thiết kế chi tiết)

> **Mục đích.** Đặc tả chính xác (đến pt · hex · twips · tên style) định dạng trình bày của bộ tài liệu SRS mà đội BA (con người) đang bàn giao — để agent xuất `.md → .docx` khớp **100% trình bày**. Nguồn phân tích forensic: `ba/workspace/drafts/srs/VNA.TOSS_SRS_System Admin_V0.1.docx` (bản gốc nhỏ, dùng làm mẫu) và đối chiếu `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`.
>
> **Tài sản đi kèm:** mẫu tham chiếu `.claude/templates/word-reference-srs-vna.docx` (dùng qua `--reference-doc`); quy trình xuất trong skill `export-word` (SKILL.md — "Biến thể 2 — SRS VNA/TIT").
>
> **Lưu ý bản chất nguồn:** bản SRS gốc là **file xuất từ Google Docs** theo biểu mẫu Viettel QT02.BM.04. Vì là Google Docs nên nó dùng nhiều font lẫn lộn (Arial, Times New Roman, Cardo, Caudex, Cambria…) và **đánh số heading bằng `numPr` trực tiếp trên từng đoạn** (không gắn ở cấp style). Mẫu tham chiếu đã **chuẩn hoá về Times New Roman** (đúng chuẩn QT02.BM.04, CLAUDE.md §8) để bản xuất đồng nhất — đây là điểm khác biệt có chủ đích so với bản gốc lẫn font.

---

## 1. Thiết lập trang (page setup) — từ `w:sectPr`

| Thuộc tính | Giá trị (twips) | Quy đổi |
|---|---|---|
| Khổ giấy (portrait) | `w:w=11906` × `w:h=16838` | **A4** (210 × 297 mm) |
| Lề trên (`w:top`) | 1440 | 2,54 cm (1 inch) |
| Lề dưới (`w:bottom`) | 1440 | 2,54 cm |
| Lề trái (`w:left`) | **1797** | ~3,17 cm (lề đóng gáy rộng hơn) |
| Lề phải (`w:right`) | 1440 | 2,54 cm |
| Khoảng header (`w:header`) | 567 | ~1,0 cm |
| Khoảng footer (`w:footer`) | 567 | ~1,0 cm |
| Đánh số trang | `w:pgNumType w:start=1` | bắt đầu từ 1 |
| Trang bìa khác | `w:titlePg w:val=1` | trang đầu (bìa) dùng header/footer riêng |

- Có **section thứ 2 nằm ngang (landscape)**: `w:w=16838 × w:h=11906`, lề trái 1276, còn lại như trên — dùng cho bảng/sơ đồ khổ ngang. Mẫu tham chiếu giữ nguyên section landscape này.

---

## 2. Header / Footer (letterhead)

Bản gốc Google Docs dùng letterhead **tối giản** (không logo trong header, không dòng mã hiệu ở footer — chỉ số trang). Mẫu tham chiếu sao chép **nguyên văn** 5 part này từ bản gốc:

| Part | Loại (`w:type`) | Nội dung |
|---|---|---|
| `header1.xml` | `first` | Trống (chỉ 1 đoạn rỗng, `firstLine=270`) |
| `header2.xml` | `even` | Trống, có **viền dưới** đơn đen (`pBdr/bottom sz=4 color=000000`), font Times New Roman 11pt in nghiêng |
| `footer1.xml` | `default` | **`PAGE` / `NUMPAGES`** căn giữa (tab center 4320, right 9000); Times New Roman 11pt (`sz=22`) in nghiêng, màu `000000` |
| `footer2.xml` | `first` | Trống (bìa không có số trang) |
| `footer3.xml` | `even` | Chỉ trường **`PAGE`** |

- Trường số trang dùng `w:fldChar begin/separate/end` bao `w:instrText` = `PAGE` và `NUMPAGES`, hiển thị dạng **`trang / tổng`**.
- Wiring trong `sectPr` (portrait) của mẫu: `rId20→header1(first)`, `rId21→header2(even)`, `rId22→footer1(default)`, `rId23→footer2(first)`, `rId24→footer3(even)`.
- `[Content_Types].xml` có Override cho cả 5 part (content-type `...wordprocessingml.header+xml` / `...footer+xml`).

> Nếu về sau BA Lead muốn letterhead đầy đủ QT02 (logo header + "BM.04 · QT.TKKDL.QTDL" ở footer) như biến thể QT02 mặc định của skill, đó là **thay đổi có chủ đích** khỏi bản gốc — phải được BA Lead duyệt và ghi log.

---

## 3. Style — font · cỡ · màu · đậm (từ `word/styles.xml`)

**`docDefaults` (áp cho mọi đoạn không override):**
- Font: **Times New Roman** (mẫu tham chiếu đã ép `rFonts` + theme major/minor = TNR).
- Cỡ chữ: `w:sz=24` half-point = **12pt** body.
- Giãn dòng: `w:line=360` `lineRule=auto` = **1,5 line**.
- Khoảng cách trước đoạn: `w:before=120` twips.
- Căn lề: `w:jc=both` (căn đều 2 lề).
- Thụt trái: `w:ind w:left=270` twips (~0,48 cm).

| Style | Font | Cỡ | Màu | Đậm | pPr chính |
|---|---|---|---|---|---|
| `Normal` (heading `normal`) | kế thừa (TNR) | 12pt | đen | không | như docDefaults |
| `Heading1` (`heading 1`) | kế thừa TNR | kế thừa 12pt | đen | **có** + `smallCaps` | `keepNext`, before 360 / after 240, `ind hanging=360` |
| `Heading2` (`heading 2`) | kế thừa TNR | kế thừa 12pt | đen | **có** | `keepNext`, after 120, `ind hanging=576` |
| `Heading3` (`heading 3`) | kế thừa TNR | **22 = 11pt** | đen | **có** (không nghiêng) | `keepNext`, before 180, `ind hanging=720` |
| `Heading4` (`heading 4`) | kế thừa TNR | kế thừa | đen | **có** | — |
| `Title` | **Arial** (bản gốc; mẫu giữ Arial cho tiêu đề bìa) | kế thừa | đen | **có** | căn giữa (`jc=center`), before 240 |
| `Subtitle` | Georgia | 48 = 24pt | `666666` (xám) | không | — |

> **Chú ý ánh xạ cấp:** bản SRS này đánh số **A/B (phần lớn) rồi 1 · 1.1 · 1.1.1**. Trong Word/markdown, "1." là **Heading1**, "1.1" là **Heading2**, "1.1.1" là **Heading3**. Phần "A - THÔNG TIN CHUNG" / "B - THIẾT KẾ CHI TIẾT" là **tiêu đề phần** (heading in đậm, không nằm trong dãy số 1/1.1).

---

## 4. Đánh số heading nhiều cấp (`word/numbering.xml`)

Mẫu tham chiếu có 1 `abstractNum` (map `numId=15`) kiểu **decimal chồng cấp**:

| ilvl | numFmt | lvlText | Hiển thị |
|---|---|---|---|
| 0 | decimal | `%1.` | `1.` |
| 1 | decimal | `%1.%2` | `1.1` |
| 2 | decimal | `%1.%2.%3` | `1.1.1` |
| 3 | decimal | `%1.%2.%3.%4` | `1.1.1.1` |
| … | decimal | … | tới 9 cấp |

- Trong **bản gốc Google Docs**, mỗi heading được đánh số bằng `w:numPr` (numId + ilvl) **đặt trực tiếp trên đoạn**, KHÔNG gắn `numPr` vào định nghĩa style.
- **HỆ QUẢ QUAN TRỌNG (giới hạn pandoc):** pandoc sinh heading chỉ gắn `pStyle=Heading1/2/3`, **không chèn `numPr`** → **bản xuất sẽ KHÔNG tự đánh số 1 / 1.1 / 1.1.1**. Số phải đã có sẵn trong text tiêu đề `.md` (vd `## 1. GIỚI THIỆU`) hoặc gắn thủ công trong Word. Xem §7 (giới hạn).

---

## 5. Bảng · caption · hình

**Bảng nội dung (viền):**
- Viền tất cả cạnh: đơn (`single`), màu **`000000`**, `w:sz=8` (= **1pt**), gồm `top/left/bottom/right/insideH/insideV`.
- Hàng tiêu đề: nền **xám** (mẫu tham chiếu dùng `w:shd fill="F2F2F2"`; bản gốc/QT02 chuẩn dùng `D9D9D9`), chữ **đậm đen**.
- Có bảng "trạng thái/tổng quan" dùng **viền `nil`** (không kẻ) — kiểu bảng bố cục, không phải bảng dữ liệu.

**Caption hình:** đoạn căn giữa, dạng "Hình 1. <mô tả>".

**Bảng bìa BẢNG GHI NHẬN THAY ĐỔI (change-log)** — 7 cột:
`Ngày thay đổi | Vị trí thay đổi | A*, M, D | Nguồn gốc | Phiên bản cũ | Mô tả thay đổi | Phiên bản mới` + ghi chú `*A – Tạo mới, M – Sửa đổi, D – Xóa bỏ`.

**Bảng bìa TRANG KÝ (sign-off)** — 4 khối dọc:
`Người lập: <Ngày> <Chức danh>` · `Người xem xét: …` (×2) · `Người phê duyệt: …`.

---

## 6. Bố cục trang bìa (cover) — đoạn theo đoạn

Thứ tự các dòng bìa (đã dựng sẵn trong mẫu, có placeholder điền qua manifest):

1. `TẬP ĐOÀN CÔNG NGHIỆP - VIỄN THÔNG QUÂN ĐỘI VIETTEL` (căn giữa, đậm)
2. `{{DON_VI}}` — đơn vị (bản gốc: `<VTIT>`) + logo Viettel (`word/media/logo.png`)
3. `BIỂU MẪU`
4. `TÀI LIỆU THIẾT KẾ CHI TIẾT` (tiêu đề lớn)
5. `Mã hiệu dự án: {{MA_HIEU_DU_AN}}` (bản gốc: `VNA.FIMS`)
6. `Mã hiệu tài liệu: {{MA_HIEU_TAI_LIEU}}` (bản gốc: `VNA.FIMS_SRS_System Admin _v1.0`)
7. `<Hà Nội, {{THANG_NAM}}>` (bản gốc: `01/2026`)
8. Bảng **BẢNG GHI NHẬN THAY ĐỔI TÀI LIỆU** (§5)
9. Bảng **TRANG KÝ** (§5)
10. `MỤC LỤC` + trường TOC (`(Chọn toàn bộ tài liệu và nhấn F9 để cập nhật mục lục)`)
11. Thân bài: `A - THÔNG TIN CHUNG` → `1. GIỚI THIỆU` → `1.1 Mục đích` → … → `B - THIẾT KẾ CHI TIẾT` → …

**Placeholder điền khi xuất** (thay chuỗi trong `document.xml`):
`{{DON_VI}}` · `{{MA_HIEU_DU_AN}}` · `{{MA_HIEU_TAI_LIEU}}` · `{{THANG_NAM}}`.

**Mục lục:** TOC field auto (`TOC \o`), cập nhật bằng **F9** trong Word (pandoc chèn `--toc`).

---

## 7. CHECKLIST QC ĐỘ TRUNG THỰC (để tuyên bố "khớp 100%")

Đọc `word/document.xml` · `styles.xml` · `theme1.xml` · `[Content_Types].xml` của file xuất, kiểm:

| # | Hạng mục | PASS khi |
|---|---|---|
| 1 | Khổ giấy A4 | `sectPr` portrait có `w:w=11906 w:h=16838` |
| 2 | Lề đúng | top/bottom/right=1440, **left=1797**, header/footer=567 |
| 3 | Có section landscape | tồn tại `sectPr` với `w:w=16838` |
| 4 | Header/footer đủ 5 part | zip chứa `word/header1,header2,footer1,footer2,footer3.xml` |
| 5 | Footer có số trang | `footer1.xml` chứa `instrText` `PAGE` và `NUMPAGES` |
| 6 | sectPr tham chiếu HF | portrait `sectPr` có `headerReference`×2 + `footerReference`×3 và mọi rId phân giải được |
| 7 | Content-Types khai HF + png | có Override header/footer + `Default Extension="png"` |
| 8 | Font đồng bộ TNR | theme major+minor = **Times New Roman**; docDefaults `rFonts`=TNR; không lọt `Calibri/Cambria/Aptos` (trừ `Consolas` cho code) |
| 9 | Body 12pt / 1.5 line | docDefaults `sz=24`, `line=360` |
| 10 | Heading đậm | Heading1/2/3 có `<w:b/>`; Heading3 `sz=22` (11pt) |
| 11 | Bảng viền đen 1pt | `tblBorders` `sz=8 color=000000 single`; header row có `w:shd` |
| 12 | Bìa đủ khối | có `BIỂU MẪU`, `TÀI LIỆU THIẾT KẾ CHI TIẾT`, `BẢNG GHI NHẬN THAY ĐỔI`, `TRANG KÝ`, `MỤC LỤC` |
| 13 | Placeholder đã điền | KHÔNG còn `{{DON_VI}}/{{MA_HIEU_DU_AN}}/{{MA_HIEU_TAI_LIEU}}/{{THANG_NAM}}` |
| 14 | TOC field | `document.xml` có `TOC \o` |
| 15 | OPC hợp lệ | `zip.testzip()==None`, mọi entry dùng `/` (không `\`), `python-docx` mở được, XML well-formed |
| 16 | Sạch dấu vết nội bộ | (áp quy tắc strip của export-word §0.0) không lọt link `.md`, YAML, ASR, OID, glossary… |

**Giới hạn đã biết (không đạt tự động bằng pandoc — cần bước thủ công):**
- **Tự đánh số heading (1 / 1.1 / 1.1.1):** pandoc không chèn `numPr` → bản xuất không tự đánh số. **Cách xử lý:** viết số sẵn trong tiêu đề `.md` (khuyến nghị), HOẶC sau khi mở Word gán "List Number" cho heading và F9. Đây là giới hạn cố hữu của luồng pandoc, không phải lỗi mẫu.
- **Cập nhật TOC:** phải nhấn **F9** trong Word (pandoc chỉ chèn field rỗng).
- **Font hỗn hợp của bản gốc** (Cardo/Caudex/Arial…) **không** được tái tạo — đây là chuẩn hoá có chủ đích về TNR (đúng QT02, nhất quán hơn bản gốc lẫn font).

---

*Nguồn forensic: phân tích `word/{document,styles,numbering,theme1,header*,footer*}.xml` + `[Content_Types].xml` + `_rels/document.xml.rels` của 2 file SRS gốc (System Admin v0.1, Data Maintenance v0.1) — 2026-07-02.*
