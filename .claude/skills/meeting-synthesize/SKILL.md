---
name: meeting-synthesize
description: Tổng hợp biên bản họp TOSS từ TRANSCRIPT bản ghi âm (ASR — file .txt/.srt, thường chất lượng thấp). Đọc trung thực, map lỗi ASR bằng domain-knowledge, gắn cờ [cần xác nhận], xuất biên bản chuẩn TOSS. Dùng khi người dùng đưa file transcript họp dài và muốn "tổng hợp meeting", "viết lại meeting note từ ghi âm", "biên bản từ transcript".
metadata:
  version: "1.0.0"
---

# Skill: Tổng hợp biên bản họp từ transcript (ASR)

> **Khác `/meeting-notes` (command):** command đó format **ghi chú thô do người ghi**. Skill này xử lý **transcript bản ghi âm tự động (ASR)** — dài, nhiễu, nhiều từ sai — và tổng hợp thành biên bản chuẩn TOSS.
>
> **Nguyên tắc (CLAUDE.md §0):** chỉ **tái tạo trung thực** điều được nói; **không suy diễn**. Chỗ nghe không rõ → giữ + gắn cờ `[cần xác nhận]`.

## 0. Phương án TỐI ƯU (đã đối chiếu — chốt)
- Nếu có **nhiều định dạng cùng một nội dung** (vd `.srt` đầy đủ và các `.txt` chia phần): **ĐỌC THẲNG bản `.txt` dày** (1 dòng/cue). **KHÔNG** chuyển/tiền xử lý `.srt`.
  - Lý do: `.srt` = đúng cùng nội dung nhưng **4 dòng/cue** (số + timestamp + text + dòng trống) → tốn **~3× token** cho **độ chính xác y hệt**. Tiền xử lý SRT cũng tốn công mà không tăng chất lượng.
- Nếu **chỉ có `.srt`**: đọc thẳng `.srt` bằng Read (phân trang); **không** viết script chuyển đổi (không đáng token/công).
- **Giới hạn thật sự là chất lượng ASR**, không phải định dạng. Đổi định dạng KHÔNG cải thiện độ chính xác — chỉ bản ghi âm tốt hơn / transcript người sửa mới cải thiện.

## 1. Khi nào dùng
Người dùng đưa **file transcript họp** (.txt/.srt) và muốn biên bản. (Ghi chú người tự ghi → dùng `/meeting-notes`.)

## 2. Quy trình
0. **(Khuyến nghị) Post-processing cải thiện WER domain — CHẠY TRƯỚC khi đọc.** Áp từ điển sửa lỗi ASR theo thuật ngữ TOSS để giảm lỗi domain agent phải tự map:
   ```powershell
   .\.claude\skills\meeting-synthesize\scripts\fix-asr-domain.ps1 `
     -In part1_00-64min.txt,part2_64min-end.txt -Out "$env:TEMP\meeting_fixed.txt"
   ```
   Script tạo **file transcript đã sửa** + **báo cáo số lỗi sửa từng cụm** (minh bạch, không sửa âm thầm). **`assets/asr-domain-corrections.txt` chỉ đọc — KHÔNG thêm entry mới vào file này nữa** (xem bước 8). Sau đó **đọc file `_fixed`** thay vì transcript gốc.
1. **Đọc transcript theo trang** (Read offset/limit). File lớn → đọc hết các trang (đừng kết luận từ 1 trang). Bản dày ~3.700 dòng/3 giờ họp là bình thường.
2. **Đọc tài liệu tham chiếu để chuẩn hoá thuật ngữ:**
   - `ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md` + thư mục `domain-knowledge/` (FAA/ICAO/IATA, dangerous-goods…).
   - `.claude/glossary/ba-terms-vi-en.md`; `CLAUDE.md §3` (personas).
3. **Map lỗi ASR → thuật ngữ đúng** (suy luận theo ngữ cảnh + glossary), gắn cờ nếu không chắc. Phần lớn lỗi tần suất cao đã được bước 0 tự sửa (dùng `assets/asr-domain-corrections.txt` — chỉ đọc, không thêm mới). Tra thuật ngữ tại `ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md`. Bảng tóm tắt:
   | ASR đọc nhầm | Thực tế |
   |---|---|
   | "tầm phim / tầng phim" | **FMS** (hệ thống cũ thay thế) |
   | "mục mần" | **movement / MVT** |
   | "siêu" | **SITA** |
   | "fly-off" | **Ops++** (hệ thống báo cáo lịch bay) |
   | "load CDDPM", "load and web" | **CPM / load & balance / loadsheet** |
   | "OAP/OSP/OFP", "Lido", "AMOS", "Amadeus", "MO" | giữ nguyên (hệ thống/tài liệu) |
4. **Phân loại nội dung** vào: Mục tiêu · Nội dung thảo luận (nhóm theo chủ đề) · Quyết định (ghi rõ **ai quyết định**) · Action items (**deadline + người**) · Câu hỏi chưa giải quyết · Ghi chú/Rủi ro · Buổi họp tiếp theo.
5. **Quyết định** phải có chủ thể; ASR thường không định danh rõ → ghi `[xác nhận]`. **Action item** phải cụ thể + deadline (`[Chưa có deadline]` nếu thiếu).
6. **Xuất biên bản** theo template `/meeting-notes` (YAML frontmatter đầy đủ). Đầu biên bản thêm **cảnh báo chất lượng ASR**. Lưu `ba/workspace/input/meeting-notes/MM-YYYYMMDD-<chu-de>.md`.
7. **Báo cáo:** đường dẫn + thống kê (thảo luận/quyết định/action/câu hỏi) + danh sách `[cần xác nhận]` để người dự xác nhận.
8. **LÀM GIÀU GLOSSARY (BẮT BUỘC — sau mỗi lần tạo mới, nếu có).** Trong khi tổng hợp, nếu phát hiện **thuật ngữ mới hoặc lỗi ASR đủ chắc chắn** chưa có trong glossary → **bổ sung/cập nhật entry** tại `ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md`. **KHÔNG thêm vào `assets/asr-domain-corrections.txt`** (file đó chỉ đọc, không mở rộng nữa — quy tắc 2026-06-11). Chỉ thêm cụm **rõ ràng, đủ chắc chắn**; cụm nhập nhằng vẫn để gắn cờ `[cần xác nhận]`. Áp dụng quy trình confirm thuật ngữ trước khi ghi glossary (CLAUDE.md §0). Báo cho người dùng các entry vừa thêm/cập nhật.

## 3. Bài học
| # | Vấn đề | Cách đúng |
|---|---|---|
| 1 | Tốn token đọc `.srt` | Đọc thẳng bản `.txt` dày; **không** chuyển SRT (cùng nội dung, ~3× token). |
| 2 | Kết luận thiếu vì file dài bị cắt trang | Đọc **hết** các trang trước khi tổng hợp. |
| 3 | ASR sai thuật ngữ chuyên ngành | Map qua **domain-knowledge/glossary**; gắn cờ `[cần xác nhận]`. |
| 4 | Ghi "nhóm quyết định" | Ghi **tên người quyết định**; ASR không rõ → `[xác nhận]`. |
| 5 | Bịa nội dung cho "mượt" | Chỉ tái tạo điều được nói; thiếu/nhiễu → giữ + gắn cờ (CLAUDE.md §0). |
| 6 | Metadata (ngày/người/địa điểm) ASR không có | Hỏi người dùng hoặc để `[cần xác nhận]`; đổi tên file `MM-YYYYMMDD-...` khi có ngày. |
| 7 | `.ps1` UTF-8 no-BOM → PowerShell 5.1 đọc mojibake, vỡ cú pháp | Script đã thêm **BOM UTF-8**; nếu sửa lại nhớ giữ BOM. |

## 4. Tài sản
- `scripts/fix-asr-domain.ps1` — **post-processing sửa lỗi domain (cải thiện WER)**: tạo file transcript đã sửa + báo cáo số lỗi. Chạy trước bước đọc.
- `assets/asr-domain-corrections.txt` — **từ điển sửa lỗi** `sai ||| đúng` (**chỉ đọc** — không thêm entry mới kể từ 2026-06-11; thay thế bởi `toss-glossary-v0.1.md`).
- Phần **tổng hợp** vẫn là **phán đoán của agent** (không tự động hoá). Template + quy tắc lưu trữ tái dùng từ command `/meeting-notes`.

> **Hiệu quả thực đo (họp 2026-06-08):** từ điển hiện tại tự sửa **89 lỗi domain** trên transcript (~3.700 cue) — vd `tầng phim→FMS` (14), `mục mần→movement` (10), `pháo sát→khảo sát` (9)… Giảm đáng kể lỗi agent phải tự xử lý, nhưng **không thay thế** việc đối chiếu người dự (CLAUDE.md §0).
