---
project: "{{TÊN_DỰ_ÁN}}"
author: "BA Lead"
version: "0.1"
date: "{{NGÀY}}"
status: "Active"
document_type: "Timeline tài liệu đầu vào"
---

# Timeline Cung cấp Tài liệu Đầu vào — {{TÊN_DỰ_ÁN}}

> Nhật ký tiếp nhận tài liệu đầu vào. Cập nhật **cùng task** khi có file mới (SOP input-docs §1 bước 4). Sau cập nhật chạy `.claude/sync/check-input-timeline.ps1 -Mode Both`.
> Trạng thái: 🟢 đã xử lý · 🟡 đang xử lý / chưa phân rã · 🔴 chờ / thiếu.

---

## A. TIMELINE THEO THỜI GIAN

### Trước <mốc khởi động> — Khởi động dự án

| Ngày nhận | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| ~00/00 | `<tên file>` | <loại> | `Customer_docs/<...>` | 🟡 |

### <DD/MM/YYYY> — <buổi khảo sát / đợt tài liệu>

| Ngày | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| DD/MM | `<tên>` | <loại> | `Customer_docs/<...>` | 🟢 |

<!-- ... thêm mục theo từng buổi/đợt ... -->

---

## B. TỔNG HỢP THEO LOẠI TÀI LIỆU

| Loại | Số file | Ghi chú |
|---|---|---|
| Nguồn LIVE (Google) | 0 | |
| Master dữ liệu | 0 | |
| Biên bản / khảo sát | 0 | |
| Biểu mẫu / báo cáo mẫu | 0 | |
| Quy trình / SOP | 0 | |
| Domain-knowledge (tham chiếu) | 0 | |

---

## C. THỐNG KÊ

- Tổng buổi khảo sát: 0
- Tổng tài liệu đã tiếp nhận: 0 (🟢 0 · 🟡 0 · 🔴 0)
- Điểm cần xác nhận: —

---

## D. QUY TẮC BẢO TRÌ

1. Thêm file mới → cập nhật **mục A (theo ngày) + mục B (theo loại)** + bump version.
2. Chạy `check-input-timeline.ps1 -Mode Both`: **[MỚI]** = file trong `input/` chưa có trong TIMELINE → thêm; **[THIẾU]** = entry TIMELINE không còn file.
3. **D2 — Entry [THIẾU]: KHÔNG tự xóa.** Báo BA Lead xác nhận trước khi gỡ (có thể là nguồn LIVE không lưu đĩa, hoặc file đã dời chỗ).
