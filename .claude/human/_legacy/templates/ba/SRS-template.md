---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_NGƯỜI_LẬP}}"
version: "{{x.y}}"
date: "{{YYYY-MM-DD}}"
status: "{{Draft | Review | Approved}}"
document_type: "SRS — Đặc tả Yêu cầu Hệ thống"
source_template: "QT02.BM.04_Thiet ke chi tiet.docx"
---

# Hướng dẫn sử dụng Mẫu SRS (Dành cho người đọc)

> Tài liệu này là **bản gương tiếng Việt** của mẫu Agents-scope tại `.claude/templates/ba/SRS-template.md`.
> Cấu trúc và nội dung phải được giữ đồng bộ với bản gốc.
> **Tuân thủ 100% cấu trúc, văn phong và định dạng biểu mẫu QT02.BM.04_Thiet ke chi tiet.docx.**

---

## Cấu trúc tài liệu SRS (6 phần chính)

| Phần | Tiêu đề | Mô tả |
|---|---|---|
| **Phần 1** | Giới thiệu | Mục đích, phạm vi, thuật ngữ, tài liệu tham khảo, bố cục |
| **Phần 2** | Tổng quan hệ thống | Tổng quan chức năng, mô hình tích hợp, danh sách tác nhân |
| **Phần 3** | Đặc tả yêu cầu chức năng | Chi tiết theo từng phân hệ và chức năng |
| **Phần 4** | Yêu cầu dùng chung và tái sử dụng | Các thành phần UI/logic chia sẻ |
| **Phần 5** | Yêu cầu phi chức năng và quản trị dữ liệu | NFR, bảo mật, chất lượng, metadata, lưu trữ |
| **Phần 6** | Phụ lục | Wireframe, RTM, tài liệu đính kèm |

---

## Quy tắc sử dụng mẫu

### Về trang bìa
Trang bìa gồm:
- Tiêu đề tổ chức: **TẬP ĐOÀN CÔNG NGHIỆP - VIỄN THÔNG QUÂN ĐỘI VIETTEL** và tên đơn vị
- Tiêu đề tài liệu: **ĐẶC TẢ YÊU CẦU HỆ THỐNG (SRS)**
- Mã hiệu dự án và mã hiệu tài liệu
- Địa điểm, thời gian

### Về bảng ghi nhận thay đổi
Sử dụng ký hiệu:
- **A** — Tạo mới
- **M** — Sửa đổi
- **D** — Xóa bỏ

Bảng có 8 cột: Ngày thay đổi | Vị trí thay đổi | A*/M/D | Nguồn gốc | Phiên bản cũ | Mô tả thay đổi | Phiên bản mới | Trang ký

### Về ký duyệt
4 vai trò bắt buộc: Người lập — Người xem xét (×2) — Người phê duyệt.
Mỗi vai trò ghi: Họ tên | Ngày | Chức danh.

---

## Cấu trúc chi tiết từng chức năng (Phần 3)

Mỗi chức năng trong một phân hệ bắt buộc có **đúng 4 mục con**:

### 1. Thông tin chung chức năng
Mô tả: ai sử dụng, mục đích, phạm vi xử lý.

### 2. Màn hình
Ảnh chụp màn hình hoặc wireframe. Ghi "*(Placeholder)*" nếu chưa có.

### 3. Mô tả chi tiết các thành phần
Bảng chuẩn với các cột:

| STT | Tên | Kiểu dữ liệu [Độ dài dữ liệu] | Input/Output | Giá trị khởi tạo | Mô tả (Mapping với CSDL nếu có) |
|---|---|---|---|---|---|

**Quy tắc điền bảng:**
- **Kiểu dữ liệu:** Textbox, Combobox, Button, Label, Grid, Popup, Datapicker, Checkbox...
- **Input/Output:** Viết hoa — INPUT hoặc OUTPUT
- **Giá trị khởi tạo:** Giá trị mặc định hoặc NULL
- **Mapping CSDL:** Định dạng `tên_bảng.TÊN_CỘT`

### 4. Luồng nghiệp vụ
Các bước đánh số thứ tự. Mỗi bước mô tả:
- Sự kiện kích hoạt: *(Khi người dùng click vào...)*
- Xử lý hệ thống
- Kết quả đầu ra
- Điều kiện rẽ nhánh: **"Nếu [điều kiện] thì [xử lý]. Ngược lại [xử lý khác]."**

---

## Ký hiệu và văn phong

| Ký hiệu | Ý nghĩa |
|---|---|
| `[Văn bản trong ngoặc vuông]` | Hướng dẫn cho người điền — KHÔNG phải nội dung tài liệu |
| `*(Cập nhật)*` | Placeholder — cần điền trong buổi làm việc tiếp theo |
| `N/A` | Không áp dụng cho dự án này |
| **Nếu...thì...Ngược lại** | Cú pháp chuẩn cho điều kiện rẽ nhánh trong luồng nghiệp vụ |

---

## Quy trình tạo tài liệu SRS mới

1. **Copy** mẫu từ `.claude/templates/ba/SRS-template.md` (bản agents-scope)
2. **Điền** thông tin trang bìa: tên dự án, mã hiệu, ngày tháng
3. **Điền** Phần 1 (Giới thiệu) từ tài liệu PTYC/BRD đã có
4. **Điền** Phần 2 (Tổng quan) bao gồm sơ đồ chức năng và danh sách tác nhân
5. **Điền** Phần 3 (Yêu cầu chức năng) theo từng phân hệ — mỗi chức năng theo 4 mục chuẩn
6. **Xuất Word** bằng cách chạy script `_gen_srs_docx.py` hoặc dùng lệnh `/brd`
7. **Lưu** vào `ba/process/` với naming: `SRS-VTX-NNN-<tên-ngắn>-vX.Y-YYYY-MM-DD.docx`

---

*Bản gương HUMAN — phiên bản 2.0 — 2026-05-28. Agents-scope: `.claude/templates/ba/SRS-template.md`.*
