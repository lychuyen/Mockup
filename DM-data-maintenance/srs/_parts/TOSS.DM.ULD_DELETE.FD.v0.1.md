---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature (bản trích)"
subsystem: "Data Maintenance (Danh mục dùng chung)"
feature_id: "TOSS.DM.ULD_DELETE"
feature_name: "Xóa ULD"
---

> **Ngữ cảnh chương (giữ nguyên từ nguồn):** mục `Data Maintenance (Danh mục dùng chung)`.

### Xóa ULD

| **Tên chức năng: Xoá ULD** | |
| --- | --- |
| **Mục đích** | Cho phép user xóa ULD |
| **Trigger** | Người dùng truy cập vào web FIMS => nhấn phân hệ Danh mục => Nhấn chọn ULD => Xem chi tiết => Chọn icon Xóa |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xóa ULD |
| **Hậu điều kiện** | Xóa thành công ULD |

#### Sơ đồ luồng hệ thống

![](data:image/png;base64...)

1. Sơ đồ luồng xóa ULD

#### Mô tả luồng xử lý

| **STT** | **Bước** | **Chi tiết** |
| --- | --- | --- |
| 1 | Bước 1 | User truy cập vào web FIMS => mở đến Danh mục => ULD => hiển thị màn hình [Danh sách ULD](TOSS.DM.ULD_LIST.FD.v0.1.md) trên giao diện |
| 2 | Bước 2 | User click **Xóa** trên một bản ghi ULD |
| 3 | Bước 3 | Mở màn hình xác nhận **Xóa ULD** |
| 4 | Bước 4 | Người dùng nhập Lý do & nhấn button **Lưu lại** |
| 5 | Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:   * Dữ liệu không hợp lệ: chuyển sang bước 6 * Ngược lại: chuyển sang bước 7&8 |
| 6 | Bước 6 | * TH chưa nhập lý do => hiện IM [VL007](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.s6302mi8qdnp): “**<Field name>** already exists. Please check again.” * TH ULD đã có gán với bản ghi FlightPlan trên Danh sách chuyến bay/Module FlightPlan / phân hệ FIMS ⇒ không cho xóa và hiển thị thông báo lỗi [TB022](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.ditg2fh3llv7)   ![](data:image/png;base64...)   * TH API trả về có messages lỗi khác [TB020](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.zi1hm3rguphh)   ![](data:image/png;base64...)   * Hoặc: [TB021](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.3pbjinevz4c0)   ![](data:image/png;base64...) |
| 7 | Bước 7,8 | Trường hợp thành công: BE Lưu và cập nhật [danh sách ULD](TOSS.DM.ULD_LIST.FD.v0.1.md) , trường **is\_delete=true**  Trả API thành công cho FE  FE Hiển thị toast thành công cho người dùng [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)  ![](data:image/png;base64...)  Đóng popup xác nhận Xóa ULD , tự động refresh màn danh sách và hiển thị [Danh sách ULD](TOSS.DM.ULD_LIST.FD.v0.1.md) mới nhất |

#### Màn hình chức năng

![](data:image/png;base64...)

1. Giao diện xóa ULD

#### Mô tả chi tiết màn hình

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả** |
| --- | --- | --- | --- | --- |
| **1** | Title | Textview |  | * Text “Delete ULD ” * Text “Are you sure you want to remove the uld: [ULD Code ]?” |
| **2** | Lý do | Text Area | reason | * Mặc định để trống * Bắt buộc nhập * Placeholder = “Vui lòng nhập lý do…” * Maxlength = 1000 ký tự, nếu paste chỉ nhận 1000 ký tự đầu tiên |
| **3** | Hủy bỏ | Button | btn\_cancel | * Click vào → Đóng popup. Điều hướng về màn danh sách |
| **4** | Xóa | Button | btn\_delete | * Click vào → Hệ thống kiểm tra trường [reason] không nhập thông tin hiển thị toast message [TB023](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.d8xa5fwytpwe)   ![](data:image/png;base64...)   * Hệ thống xóa thành công tài liệu khỏi danh sách. Hiển thị toast message [TB019](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#bookmark=kix.spmzvpry3i7f)   ![](data:image/png;base64...)   * Xóa thành công → Đóng popup. Điều hướng về màn danh sách |

---

*Nguồn: tách trung thực từ `sec-29-quan-ly-danh-muc-uld.md`, mục "Xóa ULD" (bản trích text của `VNA.TOSS_SRS_Data Maintenance_v0.1.docx`, chương Data Maintenance (Danh mục dùng chung)) — tương ứng dòng **#44** bảng §1 của [CATALOG.md](CATALOG.md). Không chỉnh sửa nội dung nguồn (CLAUDE.md §0). 🖼 Hình ảnh màn hình: xem file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` gốc.*
