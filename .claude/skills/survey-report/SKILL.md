---
name: survey-report
description: Lập BÁO CÁO KHẢO SÁT (Discovery) cho TOSS từ transcript phỏng vấn/khảo sát stakeholder (file trong Customer_docs/meeting-notes/[ngày]/). Cấu trúc Yêu cầu / Thảo luận–Đề xuất / Kết luận; sửa lỗi ASR bằng domain-knowledge; hậu xử lý cập nhật sổ OID + đề xuất glossary. Dùng khi người dùng nói "tạo báo cáo khảo sát cho [ngày]", "lập báo cáo discovery", "tổng hợp buổi khảo sát".
metadata:
  version: "1.1.0"
---

# Skill: Lập Báo cáo Khảo sát (Discovery)

> Biến **transcript phỏng vấn/khảo sát (ASR)** → **Báo cáo Khảo sát** chuẩn, nhất quán. Đầy đủ quy trình tại [`SOP-BAO-CAO-KHAO-SAT-v0.1.md`](../../../ba/workspace/drafts/quy-trinh/SOP-BAO-CAO-KHAO-SAT-v0.1.md). Skill này là bản hành động cho agent.
>
> **Khác `meeting-synthesize`:** skill đó xử lý kỹ thuật ASR (sửa lỗi/đọc transcript). Skill này tạo **đầu ra nghiệp vụ = Báo cáo Khảo sát** + hậu xử lý OID/glossary. Có thể dùng `meeting-synthesize` cho bước sửa ASR nếu cần.

## 0. Nguyên tắc (CLAUDE.md §0 + memory)
- **Transcript là nguồn gốc tuyệt đối; KHÔNG suy diễn.** Đoạn nhiễu/viết tắt chưa rõ → giữ + gắn cờ `[cần xác nhận]`.
- **domain-knowledge chỉ để làm rõ + sửa ASR**, không thêm nội dung ngoài transcript.
- Output 100% tiếng Việt; thuật ngữ kỹ thuật giữ tiếng Anh trong ngoặc lần đầu.
- Khách hàng trước, glossary sau; viết tắt nội bộ chưa rõ → gắn cờ.
- **Tách "data point" rời rạc** (kỹ thuật UX Research [U3] — [`ux-knowledge-synthesis.md`](../../knowledge/ux-knowledge-synthesis.md)): khi rã transcript, mỗi **ý/khái niệm độc lập** là một đơn vị riêng trước khi gom theo chủ đề. Câu ghép phải tách ("upload OFP thủ công" + "muốn tự động đồng bộ" = 2 data point) để truy vết chính xác, không gộp nhầm.
- **Mỗi kết luận trả lời "So what?"** [U3]: phần Kết luận của mỗi chủ đề nêu rõ *hệ quả cho thiết kế/quyết định* (ảnh hưởng FUNC/luồng/dữ liệu nào), không chỉ mô tả lại.
- **Trích nguyên văn ẩn danh** [U3]: khi minh họa một yêu cầu, dùng trích nguyên văn từ transcript (kèm dẫn dòng nguồn) thay vì diễn giải — củng cố "trích dẫn nguồn" của §0.

## 0.1 Văn phong tiếng Việt (BẮT BUỘC khi soạn §II)

Nội dung §II (Yêu cầu / Thảo luận và Đề xuất / Kết luận) phải viết bằng **văn xuôi tiếng Việt hoàn chỉnh**, không dùng văn phong liệt kê máy móc theo kiểu AI.

**Quy tắc bắt buộc:**

| Không dùng | Thay bằng |
|---|---|
| Dấu `;` phân tách trong câu | Tách thành câu mới hoặc dùng liên từ "và", "trong khi", "ngoài ra", "tuy nhiên" |
| Dấu `-` hay `·` phân tách trong câu | Tách thành câu mới hoặc dùng liên từ phù hợp |
| Ký hiệu `→` trong câu văn | "dẫn đến", "sau đó", "từ đó", "kết quả là" |
| Ký hiệu `+` nối cụm | "cùng với", "và", "kết hợp với" |
| Bullet **bold** + dấu hai chấm cho mọi ý | Đoạn văn có chủ từ, vị từ và liên kết ý |
| Câu thiếu chủ vị ("Phân quyền release: chỉ admin…") | Câu đầy đủ ("Quyền thực hiện Release OFP được cấp theo từng người dùng do admin kích hoạt.") |
| In đậm mọi từ kỹ thuật trong câu chạy | In đậm chỉ khi cần nhấn trọng điểm thực sự |

**Khi nào vẫn được dùng danh sách (bullet/table):**
- Bốn trạng thái tuần tự (có số thứ tự) — viết thành 4 câu liên tiếp trong đoạn hoặc danh sách đánh số, mỗi mục là câu hoàn chỉnh.
- Bảng đối soát §VI — giữ dạng bảng, nội dung ô là câu hoặc cụm danh từ ngắn gọn rõ nghĩa.
- §III Thống nhất — giữ bảng, mỗi hàng là câu hoàn chỉnh không có dấu `;`.
- §IV Cần làm rõ — danh sách đánh số, mỗi mục là câu hỏi hoàn chỉnh.

**Ví dụ sai — đúng:**

> ❌ *"- **Phân quyền release:** chỉ admin enable quyền "Release" cho từng user; mặc định "Allow"; cần ghi nhận ai đã release (audit)"*
>
> ✅ *"Quyền thực hiện Release OFP được cấp theo từng người dùng do admin kích hoạt. Hệ thống ghi lại thông tin người đã thực hiện release để phục vụ kiểm tra về sau."*

## 1. Khi nào dùng
Người dùng đưa (hoặc đã có) transcript một buổi khảo sát trong `ba/workspace/input/Customer_docs/meeting-notes/<DDMMYYYY>/` và muốn báo cáo. Một buổi có thể nhiều part → **gộp thành 1 báo cáo buổi** (sáng/chiều).

## 2. Quy trình (các bước)
1. **Liệt kê & đọc HẾT transcript** của buổi (mọi part, theo trang). Ưu tiên bản `_fixed`.
2. **Sửa lỗi ASR bằng domain-knowledge**: đối chiếu `ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md` + thư mục `domain-knowledge/`; map cụm sai → thuật ngữ đúng; cụm nhập nhằng để cờ.
3. **KIỂM TRA DOMAIN** (bắt buộc): nếu nội dung thuộc dự án/domain khác (không phải khai thác hàng không TOSS) → DỪNG, gắn cờ, báo BA Lead (bài học BBKS/BBLV-UBCKNN, "Quy trình sửa chữa tàu" = tàu thủy).
4. **Phân loại theo CHỦ ĐỀ**; mỗi chủ đề viết 3 phần: **Yêu cầu / Thảo luận–Đề xuất / Kết luận**.
5. **Soạn báo cáo** theo cấu trúc §3. Gộp nhiều part: ghi rõ chủ đề nào thuộc Part1, Part2.
6. **Lưu file** theo §4.
7. **HẬU XỬ LÝ** (bắt buộc) theo §5.

## 3. Cấu trúc báo cáo
- **Frontmatter YAML**: project, author "BA Lead", version "0.1", date (ngày lập), survey_date, status "Draft", document_type "Báo cáo Khảo sát (Discovery) — <đối tượng> <buổi> <ngày>".
- **I. Thông tin chung** (thời gian, mục đích, đối tượng, phía khảo sát, phạm vi + **cảnh báo chất lượng ASR**).
- **II. Nội dung trao đổi** — theo chủ đề, mỗi chủ đề **Yêu cầu / Thảo luận–Đề xuất / Kết luận**.
- **III. Các nội dung đã thống nhất** (bảng đánh số).
- **IV. Vấn đề cần làm rõ** (điểm mở / `[cần xác nhận]`).
- **V. Thuật ngữ đề xuất bổ sung domain-knowledge** (bảng: Thuật ngữ | Mô tả từ ngữ cảnh | Nguồn dòng) — **CHỈ đề xuất, chưa ghi glossary**.

## 4. Lưu trữ & đặt tên
- Thư mục: `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/`.
- Tên: `BAO-CAO-KHAO-SAT-<DDMMYYYY>-<buoi>-v0.1.md` (vd `…-12062026-buoi-sang-v0.1.md`).
- Nhiều part/buổi → **1 file gộp** (xóa part lẻ sau khi gộp + cập nhật tham chiếu, như 11/06).

## 5. Hậu xử lý (BẮT BUỘC sau mỗi báo cáo)
1. **Cập nhật sổ OID** `ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md`:
   - Đối chiếu §IV với OID → điểm đã trả lời đổi 🟢 + kết quả/ngày; thêm điểm mở mới (ID kế tiếp theo nhóm QĐ/SME/KS/DL/HC); ghi rõ điểm mở buổi trước có được làm rõ không.
   - Cập nhật bảng tổng hợp §G; bump version OID + changelog.
2. **Đề xuất glossary**: trình bảng §V cho BA Lead → **chờ confirm** → mới ghi `toss-glossary-v0.1.md` (1 file chung; bump version + changelog).
3. **Báo cáo nhanh BA Lead**: thống kê (chủ đề/thống nhất/điểm cần làm rõ/thuật ngữ) + điểm mở buổi trước được/không được làm rõ.

## 6. Checklist
- [ ] Đọc hết các part; gộp 1 báo cáo buổi.
- [ ] Mỗi chủ đề đủ 3 phần (Yêu cầu/Thảo luận–Đề xuất/Kết luận).
- [ ] Đoạn nhiễu/viết tắt chưa rõ đã gắn `[cần xác nhận]`.
- [ ] §III, §IV, §V đầy đủ; đã kiểm tra domain.
- [ ] Đã cập nhật OID + trình thuật ngữ glossary chờ confirm.

## 7. Tài sản liên quan
- SOP đầy đủ: `ba/workspace/drafts/quy-trinh/SOP-BAO-CAO-KHAO-SAT-v0.1.md`.
- Skill ASR: `.claude/skills/meeting-synthesize/`.
- Sổ điểm chốt: `SO-THEO-DOI-DIEM-CHOT-v0.1.md` · Glossary: `domain-knowledge/toss-glossary-v0.1.md`.
- Báo cáo mẫu: `bao-cao-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md`, `…-12062026-buoi-sang-v0.1.md`.
