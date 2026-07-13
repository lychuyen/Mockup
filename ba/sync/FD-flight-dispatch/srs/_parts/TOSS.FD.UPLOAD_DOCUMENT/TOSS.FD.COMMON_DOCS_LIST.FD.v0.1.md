---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-07-10"
status: "Draft"
document_type: "SRS Feature"
subsystem: "Flight Dispatch"
feature_id: "TOSS.FD.COMMON_DOCS_LIST"
feature_name: "Danh sách tài liệu chung chuyến bay"
group: "Upload Document"
---

# **UPLOAD DOCUMENT**

## Danh sách tài liệu chung chuyến bay

| **Tên chức năng: Danh sách tài liệu chung chuyến bay** | |
| --- | --- |
| **Mục đích** | Quản lý danh sách, tìm kiếm, upload và xóa các tài liệu dùng chung chuyến bay theo khoảng hiệu lực. |
| **Trigger** | Click tab Tài liệu chung trong màn hình Upload Document. |
| **Tiền điều kiện** | Đăng nhập thành công và có quyền View Common Documents. |
| **Hậu điều kiện** | Hiển thị bảng danh sách tài liệu chung, các bộ lọc và nút thao tác. |

### Sơ đồ nghiệp vụ

*(hình ảnh minh họa — xem file gốc/Google Doc)*

### Mô tả luồng nghiệp vụ

| **Bước** | **Chi tiết** |
| --- | --- |
| Bước 1 | Người dùng truy cập chức năng Flight Dispatch và chọn tab Tài liệu chung. |
| Bước 2 | Hệ thống gọi API lấy danh sách tài liệu chung mặc định. |
| Bước 3 | Hệ thống hiển thị danh sách tài liệu cùng các bộ lọc tìm kiếm trên màn hình. |
| Bước 4 | Người dùng nhập một hoặc nhiều điều kiện tìm kiếm (ví dụ: Tên, Ngày hiệu lực) và nhấn Tìm kiếm. |
| Bước 5 | Hệ thống kiểm tra kết quả tìm kiếm. Nếu có bản ghi phù hợp, hệ thống hiển thị danh sách tài liệu tương ứng. Nếu không có bản ghi phù hợp, hệ thống hiển thị thông báo "Không có kết quả nào liên quan". Luồng kết thúc. |

### Màn hình chức năng (tạm mockup)

*(hình ảnh minh họa — xem file gốc/Google Doc)*

### Mô tả màn hình chức năng

| **STT** | **Tên** | **Kiểu dữ liệu**  **[Độ dài dữ liệu]** | **Mapping DB/API** | **Mô tả nghiệp vụ** |
| --- | --- | --- | --- | --- |
| Tìm kiếm tài liệu :  *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Chức năng **Tìm kiếm** cho phép người dùng tra cứu nhanh danh sách tài liệu dựa trên các điều kiện lọc được cung cấp. * Người dùng nhập hoặc thay đổi một hoặc nhiều điều kiện tìm kiếm, sau đó nhấn **Enter** hoặc nút **Search**, hệ thống thực hiện:   + Reload dữ liệu table phù hợp với bộ lọc   + Set current page=1 * Hiển thị kết quả tìm kiếm:   + Trường hợp API trả về data có KQ: hiển thị danh sách dữ liệu theo kết quả API trả về.   + Trường hợp API trả về data rỗng hoặc lỗi: Hiển thị bảng danh sách với **chân trang = Tất cả danh sách : 0**. * Hệ thống sử dụng các tiêu chí tìm kiếm để lọc và hiển thị những tài liệu phù hợp, giúp người dùng dễ dàng xác định tài liệu cần tra cứu, giảm thời gian tìm kiếm khi số lượng tài liệu lớn. | | | | |
| 1 | Search | Textbox |  | * Cho phép người dùng nhập toàn bộ hoặc một phần tên tài liệu để tìm kiếm. * Cho phép nhập tối đa 100 ký tự. Khi đạt giới hạn, hệ thống không cho phép người dùng nhập thêm ký tự. * Tự động loại bỏ khoảng trắng thừa ở hai đầu chuỗi (TRIM) khi click tìm kiếm. * Hệ thống thực hiện tìm kiếm theo tên tài liệu phù hợp với giá trị được nhập. * Khi để trống, hệ thống không áp dụng điều kiện lọc theo tên tài liệu. |
| 2 | Hiệu lực tài liệu | Date time picker |  | * Cho phép người dùng lựa chọn khoảng thời gian hiệu lực của tài liệu. * Hệ thống chỉ hiển thị các tài liệu có thời gian hiệu lực thuộc khoảng thời gian được chọn. * Định dạng hiển thị: **dd/MM/yyyy HH:mm** -> **dd/MM/yyyy HH:mm** * Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu. |
| 3 | Search *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Khi người dùng nhấn nút **Search** , hệ thống kiểm tra tính hợp lệ của dữ liệu nhập (nếu có), sau đó thực hiện tìm kiếm theo các điều kiện đã nhập và cập nhật lại danh sách tài liệu. * Nếu không nhập điều kiện nào, hệ thống hiển thị toàn bộ dữ liệu mà người dùng có quyền truy cập |
| 4 | Clear Filter *(hình ảnh minh họa — xem file gốc/Google Doc)* | Button |  | * Cho phép người dùng xóa toàn bộ giá trị đã nhập hoặc đã chọn tại khu vực bộ lọc và đưa các trường tìm kiếm về trạng thái mặc định. * Khi người dùng nhấn nút **Clear Filter**, hệ thống xóa tất cả điều kiện tìm kiếm hiện tại và làm mới danh sách tài liệu theo trạng thái mặc định của màn hình. |
| Bảng danh sách tài liệu chung :  *(hình ảnh minh họa — xem file gốc/Google Doc)*   * Hiển thị danh sách các tài liệu đáp ứng điều kiện tìm kiếm hoặc bộ lọc được thiết lập. * Thông tin của mỗi tài liệu được trình bày dưới dạng bảng nhằm hỗ trợ người dùng theo dõi, tra cứu và quản lý dữ liệu. Bảng đồng thời hỗ trợ lựa chọn một hoặc nhiều bản ghi để thực hiện các thao tác nghiệp vụ được hệ thống cho phép. | | | | |
| 1 | Document name | Textview |  | * Hiển thị tên của tài liệu đã được tải lên hệ thống * Đặt theo định dạng chuẩn: **[Document Name_Version]** * Click vào tên file để xem trực tiếp tài liệu |
| 3 | Valid From | Textview |  | * Cho phép người dùng nhập hoặc chọn thời điểm bắt đầu của khoảng thời gian hiệu lực (ETD) để tìm kiếm tài liệu. * Khi thực hiện tìm kiếm, hệ thống sử dụng giá trị này làm điều kiện lọc và chỉ hiển thị các tài liệu có thời gian **Hiệu lực từ** nằm trong phạm vi tìm kiếm được chỉ định. * Định dạng hiển thị: **dd/MM/yyyy HH:mm**.   + Giá trị được hiển thị theo định dạng **dd/MM/yyyy HH:mm** và được sử dụng để xác định khoảng thời gian tài liệu có hiệu lực.   + Khi để trống, hệ thống không áp dụng điều kiện lọc theo thời gian bắt đầu. |
| 4 | Valid To | Textview |  | * Cho phép người dùng nhập hoặc chọn thời điểm kết thúc của khoảng thời gian hiệu lực để tìm kiếm tài liệu. * Khi thực hiện tìm kiếm, hệ thống sử dụng giá trị này làm điều kiện lọc và chỉ hiển thị các tài liệu có thời gian **Hiệu lực đến** nằm trong phạm vi tìm kiếm được chỉ định. * Định dạng hiển thị: **dd/MM/yyyy HH:mm**.   + Giá trị được hiển thị theo định dạng **dd/MM/yyyy HH:mm** và được sử dụng để xác định khoảng thời gian tài liệu có hiệu lực.   + Khi để trống, hệ thống không áp dụng điều kiện lọc theo thời gian bắt đầu. |
| 5 | Upload by | Textview |  | * Hiển thị tên người dùng đã thực hiện tải tài liệu lên hệ thống. * Giá trị được lấy từ tài khoản đăng nhập tại thời điểm Upload và chỉ có mục đích tra cứu. |
| 6 | Upload date | Datetime |  | * Hiển thị ngày, giờ tài liệu được tải lên hệ thống. * Giá trị được hệ thống tự động ghi nhận khi thao tác Upload hoàn tất. * Định dạng hiển thị **dd/MM/yyyy HH:mm**. |
| 7 | REV | Text |  | * Hiển thị phiên bản (Revision) hiện tại của tài liệu, ví dụ: R01, R02, R03… * Giá trị được quản lý theo cơ chế phiên bản của hệ thống nhằm hỗ trợ theo dõi lịch sử cập nhật tài liệu. |
| 8 | Action | Icon Button |  | * Hiển thị các công cụ thao tác nhanh trực tiếp với tệp tin của dòng tương ứng. * **Icon Tải tài liệu *(hình ảnh minh họa — xem file gốc/Google Doc)*** :   + Tải tệp tin gốc về máy tính cá nhân của người dùng để lưu trữ hoặc xem.   + Nút này **luôn luôn được Enable** và khi click trình duyệt sẽ kích hoạt tiến trình download file từ máy chủ. * **Icon Thùng rác *(hình ảnh minh họa — xem file gốc/Google Doc)*** : * Xóa đơn lẻ tệp tin tài liệu chung khỏi hệ thống. * Luôn khả dụng, click để hiển thị popup xác nhận xóa tài liệu đó. |
| 9 | Phân trang | Pagination |  | [Theo kịch bản phân trang](https://docs.google.com/document/d/1L5y0t4FCWe_vnNI65xNMRC-LM3lvLwYsQRAm_Nokv9A/edit?tab=t.0#heading=h.5b0ejgezpbny) |

---

> **Nguồn gốc (truy vết):** Tách trung thực từ `sec-07-danh-sach-tai-lieu-chung-chuyen-bay.md` — mảnh phân rã `VNA.TOSS_SRS_Flight Dispatch_v0.1.md` (SRS Flight Dispatch v0.1, người soạn VNA/VTIT, nguồn Google Drive live pull 2026-07-10) — ứng với dòng **#4** bảng §1 trong [CATALOG.md](../CATALOG.md). Không sửa nội dung nguồn (CLAUDE.md §0).
>
> **Ghi chú tách file:** Tiêu đề nhóm `# **UPLOAD DOCUMENT**` ở đầu file này vốn nằm cuối `sec-06` (dấu phân nhóm của tài liệu gốc, dính vào sec-06 do chế độ cắt h2) — chuyển về đây vì đây là chức năng đầu tiên của nhóm UPLOAD DOCUMENT (F04 → F08).
