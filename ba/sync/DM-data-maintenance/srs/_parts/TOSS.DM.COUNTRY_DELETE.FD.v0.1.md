---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.COUNTRY_DELETE"
feature_name: "Xóa Quốc gia"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xóa Quốc gia

| **Tên chức năng: Xoá Quốc gia** | |
| --- | --- |
| **Mục đích** | Cho phép user xóa quốc gia |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Danh mục => Nhấn chọn quốc gia => Xem chi tiết => Chọn icon Xóa |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xóa quốc gia |
| **Hậu điều kiện** | Xóa thành công quốc gia |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng xóa quốc gia

#### Mô tả luồng xử lý

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | User truy cập vào web FIMS => mở đến Danh mục => Quốc gia => hiển thị màn hình [Danh sách Quốc gia](TOSS.DM.COUNTRY_LIST.FD.v0.1.md) trên giao diện |
| Bước 2 | User click **Xóa** trên một bản ghi quốc gia |
| Bước 3 | Mở màn hình xác nhận **Xóa quốc gia** |
| Bước 4 | Người dùng nhập Lý do & nhấn button **Lưu lại** |
| Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Dữ liệu không hợp lệ: chuyển sang bước 6 * Ngược lại: chuyển sang bước 7&8 |
| Bước 6 | * TH chưa nhập lý do => hiện IM [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp) * TH Country đã có gán với bản ghi FIR tại Danh mục FIR ⇒ không cho xóa và hiển thị thông báo lỗi [TB022](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.ditg2fh3llv7) * TH API trả về có messages lỗi khác [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh) * Hoặc: [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0) |
| Bước 7,8 | Trường hợp thành công: BE Lưu và cập nhật [danh sách quốc gia](TOSS.DM.COUNTRY_LIST.FD.v0.1.md), trường **is\_delete=true**  Trả API thành công cho FE  FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  Đóng popup xác nhận Xóa quốc gia, tự động refresh màn danh sách và hiển thị [Danh sách quốc gia](TOSS.DM.COUNTRY_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện xóa Quốc gia

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
|  | Title | Textview |  | * Text “Delete Country” * Text “Bạn có chắc chắn muốn xóa Quốc gia: [countryCode] - [countryName] |
|  | Reason | Text Area | reason | * Mặc định để trống * Bắt buộc nhập * Placeholder = “Vui lòng nhập lý do…” * Maxlength = 1000 ký tự, nếu paste chỉ nhận 1000 ký tự đầu tiên |
|  | Cancel | Button | btn\_cancel | * Click vào → Đóng popup. Điều hướng về màn danh sách |
|  | Delete | Button | btn\_delete | * Click vào → Hệ thống kiểm tra trường [reason] không nhập thông tin hiển thị toast message [TB023](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.d8xa5fwytpwe) * Hệ thống xóa thành công tài liệu khỏi danh sách. Hiển thị toast message [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f) * Xóa thành công → Đóng popup. Điều hướng về màn danh sách |

##

---

*Nguồn: tách trung thực từ `sec-25-quan-ly-danh-muc-quoc-gia.md`, mục "Xóa Quốc gia" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#25** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
