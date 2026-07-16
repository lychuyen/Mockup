---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "VNA/VTIT (nguồn Google Docs) — phân rã bởi agent BA"
version: "0.1"
date: "2026-07-16"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Load Control"
feature_id: "TOSS.FLC.FUEL_ORDER_SEARCH"
feature_name: "Tìm kiếm chuyến bay và thông tin fuel order"
group: "Fuel order"
source_url: "https://docs.google.com/document/d/1h5wsfTtU6sKJDIqZod2MKWhhjQTNB-BVEn5252n1ALs/edit"
source_revision: "ALtnJHw752QgcvhVUuNEE-hu5IMGBpSkN00WjYskJ9yEU_jTAh4oi9SCaz9AkZwFdMFX2SE4iKFybLDiZBdqCPcZtK6ptnEqmoPzVAMPTkU"
source_range: "Google Docs index 59946–65114"
---

> **Phạm vi file:** Nội dung chức năng “Tìm kiếm chuyến bay và thông tin fuel order” được phân rã nguyên nghĩa từ Google Docs nguồn tại phạm vi chỉ mục 59946–65114. Không bổ sung hoặc suy diễn nghiệp vụ ngoài nguồn.

## **Tìm kiếm chuyến bay và thông tin fuel order**

| Tên chức năng: Tìm kiếm chuyến bay và thông tin fuel order |  |
| :---- | :---- |
| **Mục đích** | Cho phép user xem tìm kiếm chuyến bay và thông tin fuel order |
| **Trigger** | Người dùng truy cập vào web TOSS \=\> nhấn module TOSS \=\> Chọn phân hệ Flight load control \=\> Chọn tab Fuel Order |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền phân hệ Flight Load Control |
| **Hậu điều kiện** | Mở màn hình danh sách chuyến bay và thông tin Fuel Order với từng chuyến bay |
### **Sơ đồ luồng hệ thống**

![Hình ảnh image97 từ Google Docs](../_images/google-docs/image97.png)
### **Mô tả luồng xử lý**

| Bước | Chi tiết |
| :---: | :---- |
| 1 | Người dùng truy cập hệ thống TOSS \=\> Click module TOSS, chọn  phân hệ  Flight Load Control, sau đó chọn tab Fuel Order |
| 2 | Hệ thống gọi API và hiển thị danh sách chuyến bay và thông tin Fuel Order lên màn hình |
| 3 | Người dùng nhập một hoặc nhiều điều kiện tìm kiếm trên bộ lọc. |
| 4 | **Trường hợp Tìm kiếm (Search):** \- User click button **Search**. \- Hệ thống xử lý, gọi API theo điều kiện lọc và hiển thị danh sách chuyến bay và thông tin Fuel Order tương ứng với kết quả tìm kiếm.  |
| 5 | **Trường hợp Xóa bộ lọc (Clear Filter):** \- User click button **Clear Filter**. \- Hệ thống xóa toàn bộ thông tin/điều kiện đã nhập trên bộ lọc (Đồng thời tự động lấy lại danh sách mặc định như bước  2).  |

   ###
### **Màn hình chức năng**

[![Hình ảnh image98 từ Google Docs](../_images/google-docs/image98.png)](https://www.figma.com/design/HNvApgVP8uqBD4eQOnW6K7/VNA_TOSS_H%E1%BB%87-th%E1%BB%91ng-qu%E1%BA%A3n-l%C3%BD-t%C3%A0i-li%E1%BB%87u---th%C3%B4ng-tin-%C4%91i%E1%BB%81u-h%C3%A0nh-chuy%E1%BA%BFn-bay?node-id=13309-218521&t=hJfgyU8SyTvD318l-4)
### **Mô tả chi tiết màn hình**

   ###

| STT | Tên | Kiểu dữ liệu\[Độ dài\] | Mapping DB/API | Mô tả nghiệp vụ |
| ----- | ----- | ----- | ----- | ----- |
| Tìm kiếm: ![Hình ảnh image99 từ Google Docs](../_images/google-docs/image99.png) Cơ chế Thu gọn/Mở rộng bộ lọc (Collapsible Filter): ![Hình ảnh image45 từ Google Docs](../_images/google-docs/image45.png)[Tham chiếu kịch bản chức năng ẩn hiện filter](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.bzejlqwncqtz) Trường hợp Searchbox không có dữ liệu: Mặc định tìm kiếm all dữ liệu tại cột đó  Người dùng thao tác thay đổi giá trị trường dữ liệu \=\> click Enter/button **![Hình ảnh image46 từ Google Docs](../_images/google-docs/image46.png)** \=\> hệ thống thực hiện: Reload dữ liệu table phù hợp với bộ lọc Set current page=1 Hiển thị kết quả tìm kiếm:  Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về. Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang \= Tất cả danh sách : 0**.   |  |  |  |  |
|  | EDD |  |  | EDD là ngày dep\_scheldt ( ngày cất cánh dự kiến) Placeholder: DDMMMYY Mặc định chọn ngày hiện tại  Trường để lọc: Tìm kiếm chính xác theo \[FLT NO\] |
| 1 | FLT NO | Textbox |  | Mặc định: Để trống Placeholder: FLT NO Trường để lọc: Tìm kiếm gần đúng theo \[FLT NO\]  Maxlength 10 ký tự  Validate cho phép nhập chữ, số, và ký tự đặc biệt  Nếu dữ liệu nhập vượt quá độ dài ô \=\> thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập  Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu  Không cho phép nhận space Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 2 | ACREG | Textbox |  | Mặc định: Để trống Placeholder: ACREG Trường để lọc: Tìm kiếm gần đúng theo \[ACREG\]  Maxlength 10 ký tự  Validate cho phép nhập chữ, số, và ký tự đặc biệt  Nếu dữ liệu nhập vượt quá độ dài ô \=\> thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập  Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu  Không cho phép nhận space  Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 3 | ACTYPE | DDL |  | Mặc định: Để trống Placeholder: ACTYPE Trường để lọc: Tìm kiếm chính xác theo \[ACTYPE\] Chỉ được chọn duy nhất 1 giá trị User click vào ô tìm kiếm \=\> Hiển thị các giá trị ACTYPE trong DDL Searchbox trong DDL Placeholder “Search” Cho phép nhận và tìm kiếm gần đúng theo \[ACTYPE\] Maxlength 10 ký tự Validate cho phép nhập chữ, số và ký tự đặc biệt Nếu dữ liệu nhập vượt quá độ dài ô \=\> Nội dung sẽ cuộn ngang sang trái và khuất khỏi tầm nhìn. User có thể di chuột để xem lại nội dung trước đó Nếu paste đoạn văn \>10 kí tự thì ghi nhận 10 ký tự đầu, \<10 kí tự thì ghi nhận all  Tự động TRIM Spaces đầu cuối khi tìm kiếm  Trường hợp Searchbox không có dữ liệu: Mặc định hiển thị full danh sách Action: User nhấn enter/icon search \=\> Hệ thống trả ra kết quả phù hợp với từ khóa, nếu không có kết quả tìm kiếm hiển thi: “No records found” |
| 4 | ETD | Time picker |  | ETD giờ cất cánh dự kiến Mặc định: Để trống Place holder: ETD Trường để lọc: Tìm kiếm các chuyến bay trùng khớp theo \[ETD\]  Cho phép chọn thời gian cất cánh dự kiến (Estimated Time of Departure) theo múi giờ UTC.  Định dạng  HH:mm.  |
| 5 | DEP | Textbox |  | Mặc định: Để trống Placeholder: DEP Trường để lọc: Tìm kiếm gần đúng theo \[DEP\]  Maxlength 10 ký tự  Validate cho phép nhập chữ, số, và ký tự đặc biệt  Nếu dữ liệu nhập vượt quá độ dài ô \=\> thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập  Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu  Không cho phép nhận space  Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 6 | ARR | Textbox  |  | Mặc định: Để trống Placeholder: ARR Trường để lọc: Tìm kiếm gần đúng theo \[ARR\]  Maxlength 10 ký tự  Validate cho phép nhập chữ, số, và ký tự đặc biệt  Nếu dữ liệu nhập vượt quá độ dài ô \=\> thay thế phần vượt quá bằng ký tự “...” và có tooltip hiển thị toàn bộ nội dung nhập  Nếu paste đoạn văn thì ghi nhận 10 ký tự đầu  Không cho phép nhận space  Tự động TRIM Spaces đầu cuối khi tìm kiếm |
| 7 | ![Hình ảnh image47 từ Google Docs](../_images/google-docs/image47.png) | Button |  |   Click vào ![Hình ảnh image48 từ Google Docs](../_images/google-docs/image48.png) Hệ thống thực hiện lọc dữ liệu dựa trên từ khoá Hệ thống trả về danh sách dữ liệ u phù hợp với từ khoá tìm kiếm  |
| 8 | ![Hình ảnh image49 từ Google Docs](../_images/google-docs/image49.png) | Button |  | Click vào ![Hình ảnh image50 từ Google Docs](../_images/google-docs/image50.png) Hệ thống: Xoá nội dung search Reset toàn trường lọc đã chọn Reset phân trang về trang đầu Hiển thị lại danh sách ban đầu  |

---

**Nguồn trích:** [VNA.TOSS_SRS_Flight Load Control_v0.1](https://docs.google.com/document/d/1h5wsfTtU6sKJDIqZod2MKWhhjQTNB-BVEn5252n1ALs/edit) · Revision `ALtnJHw752QgcvhVUuNEE-hu5IMGBpSkN00WjYskJ9yEU_jTAh4oi9SCaz9AkZwFdMFX2SE4iKFybLDiZBdqCPcZtK6ptnEqmoPzVAMPTkU` · Google Docs index 59946–65114.
