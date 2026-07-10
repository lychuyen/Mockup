---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "VNA/VTIT (nguồn SRS) — trích tách bởi agent BA"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Load Control"
feature_id: "TOSS.FLC.CUSTOMIZE_FUEL_TABLE"
feature_name: "Customize bảng biểu (Fuel order)"
group: "Fuel order"
---

> **Phạm vi file:** Feature F10 (nhóm Fuel order) — trích trung thực 100% từ nguồn SRS Flight Load Control do người soạn (CLAUDE.md §0), không suy diễn, không bổ sung. Cờ điểm cần xác nhận: xem CATALOG.md dòng #10 và mục 2.1 — Title/Trigger/Bước 1–2/mô tả trường 1–6 đã nhất quán nói về "Fuel Order"/"Flight Monitoring table setting", NHƯNG **dòng mô tả trường 7 (nút Save) vẫn còn sót cụm "Đóng Popup 'Document table setting'"** [Cần làm rõ: dấu vết sao chép chéo chưa dọn hết — giữ nguyên trạng, không tự sửa].

## **Customize bảng biểu**

| **Tên chức năng: Table Setting** | |
| --- | --- |
| **Mục đích** | Cho phép user Customize bảng biểu |
| **Trigger** | Người dùng truy cập vào web TOSS => nhấn module TOSS => Chọn phân hệ Flight load control => Chọn tab Fuel Order => Chọn ![](data:image/png;base64...) |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight load control |
| **Hậu điều kiện** | Hiển thị màn hình danh sách chuyến bay và thông tin Fuel Order khi user Customize |

### **Sơ đồ luồng hệ thống**

![](data:image/png;base64...)

### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| --- | --- |
| 1 | Người dùng truy cập hệ thống TOSS => Click module TOSS, chọn phân hệ Flight Load Control, sau đó chọn tab Fuel Order |
| 2 | Hệ thống gọi API và hiển thị danh sách chuyến bay và thông tin Fuel Order lên màn hình |
| 3 | Người dùng click button ![](data:image/png;base64...) |
| 4 | Hệ thống hiển thị Popup **Flight Monitoring table setting** (Hiển thị list toàn bộ các cột dữ liệu hiện có) |
| 5 | Người dùng thực hiện các thao tác thay đổi tham số cấu hình bảng: Kéo thả vị trí cột, bật/tắt hiển thị (Check/Uncheck) |
| 6 | Trường hợp người dùng nhấn nút [Cancel]: hệ thống đóng Popup, không lưu dữ liệu và giữ nguyên giao diện bảng hiện tại |
| 7 | Trường hợp người dùng nhấn nút [Save] => Hệ thống lưu thông tin cấu hình bảng (Table view) vào DB |
| 8 | Hệ thống đóng Popup và áp dụng cấu hình vừa lưu để render lại danh sách chuyến bay và thông tin Fuel Order trên giao diện |

### **Màn hình chức năng**

![](data:image/png;base64...)

### **Mô tả chi tiết màn hình**

| **STT** | **Tên** | **Kiểu dữ liệu [Độ dài]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| **QUY TẮC LƯU CẤU HÌNH BẢNG**   * Nếu User đang trong phiên đăng nhập hợp lệ (96h kể từ lúc login) và đã có cấu hình bảng được lưu (Customize view), hệ thống tự động hiển thị danh sách theo cấu hình đã lưu (Lưu ý: Thao tác Logout/Login lại trong 96h sẽ không làm mất cấu hình) * Trường hợp quá 96h hoặc chưa từng cấu hình, hệ thống hiển thị danh sách theo giao diện mặc định   **QUY TẮC CÁC CỘT LUÔN HIỂN THỊ**   * Phạm vi áp dụng: 7 cột dữ liệu (EDD, FLT NO, ACREG, ACTYPE, ETD, DEP, ARR) * Tại danh sách chuyến bay: Các cột này luôn được sắp xếp cố định ở đầu bảng (từ trái sang phải) và không bị ghim, cho phép cuộn ngang cùng bảng dữ liệu * Tại giao diện cấu hình cột (Table setting Popup): Không hiển thị 7 cột cố định trong list “*Data column name”* | | | | |
| 1 | Title | Textview |  | * Fix cứng text “Flight Monitoring table setting” * Không cho thao tác |
| 2 | ![](data:image/png;base64...) | Icon |  | * Click Button => Đóng Popup, trở lại màn hình danh sách chuyến bay và thông tin Fuel Order |
| 3 | Data column name | Textview |  | * Hiển thị tên danh sách tên các cột dữ liệu khả dụng của của bảng * Fix cứng text, không cho thao tác |
| ![](data:image/png;base64...) | | | | |
| 4 | ![](data:image/png;base64...) | Icon |  | * Cho phép người dùng nhấn giữ (hold) và kéo thả để thay đổi vị trí sắp xếp của các cột   (Từ trên xuống tương đương Từ trái sang Phải) |
| 5 | ![](data:image/png;base64...) | Checkbox |  | * Trạng thái mặc định:   + Chưa có cấu hình hoặc lần đầu Login: Tick chọn toàn bộ theo cấu hình gốc của hệ thống   + Đã có cấu hình tùy chinh: Load trạng thái đồng bộ với cấu hình hiện tại của bảng (Cột đang hiển thị -> [Check], cột đang bị ẩn -> [Uncheck] ) * Action   + Tick chọn: Hiển thị cột dữ liệu tương ứng trong bảng danh sách   + Bỏ tick: Ẩn cột dữ liệu tương ứng trong bảng danh sách |
| 6 | ![](data:image/png;base64...) | Button |  | * Click [Cancel] =>Đóng Popup, trở lại màn hình danh sách chuyến bay và thông tin Fuel Order |
| 7 | ![](data:image/png;base64...) | Button |  | Click [Button] ![](data:image/png;base64...) =>   * Đóng Popup “Document table setting” * Reload màn hình danh chuyến bay áp dụng theo cấu hình mới |

###

---

**Nguồn trích:** `sec-13-customize-bang-bieu.md` (mảnh phân rã h2 từ `TOSS.FLC.ALL.FD.v0.1.md`, đã xóa sau khi tách theo Feature — git giữ lịch sử) · CATALOG.md dòng #10.
