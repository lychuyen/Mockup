# INDEX — Bản trích nguồn khách hàng (raw extract)

> Bản trích **thô, trung thực** (§0) từ tài liệu trong `input/Customer_docs/`. Là tài liệu tra cứu: **Grep/đọc đúng mục cần, không nạp cả file**. Có thể lệch bảng header rỗng (`NaN`/`Unnamed` với xlsx) — dọn tay khi cần bản chính thức.
>
> **Tổ chức theo nhóm nguồn** (file vẫn phẳng trong thư mục — chỉ nhóm ở INDEX để tra nhanh). Tài liệu lớn phân rã sang `<tên>_parts/` (xem cột Dòng).
>
> 📖 **Thuyết minh nội dung + vai trò từng nguồn:** [THUYET-MINH-NGUON.md](THUYET-MINH-NGUON.md).

<!--
  HƯỚNG DẪN: đặt tên nhóm §1..§N theo BẢN CHẤT nguồn của dự án (không cố định). Ví dụ nhóm phổ biến:
  1. Nguồn LIVE (Google Sheet/Drive — refresh được)   2. Master dữ liệu (→ phân hệ danh mục)
  3. Tài liệu nghiệp vụ chuyên đề                        4. Biểu mẫu / báo cáo mẫu
  5. Biên bản họp / khảo sát                             6. Quy trình / SOP nghiệp vụ
  7. Kế hoạch & hạ tầng                                  8. Khác
  Mỗi dòng: | file | số dòng/đoạn (hoặc trỏ _parts/INDEX.md) | nguồn / nội dung ngắn |
-->

## 1. Nguồn LIVE — Google Sheet/Drive (refresh được)

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `<tên>.extracted.md` | 000 | **LIVE** <mô tả> — refresh `gsheet-to-md.py`/`gdrive-to-md.py` id `<id>` |

## 2. <Nhóm nguồn 2>

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `<tên>.extracted.md` | 000 | <mô tả> |

<!-- ... thêm nhóm khi phát sinh; ≥3 file cùng chủ đề nên gom nhóm ... -->
