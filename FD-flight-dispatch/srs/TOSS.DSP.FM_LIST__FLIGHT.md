# Tài liệu Đặc tả Yêu cầu Phần mềm (SRS) — Giám sát Điều phối Bay (Flight Dispatch Monitoring)
## 1. Bảng theo dõi thay đổi tài liệu

| # | Ngày thay đổi| Mô tả thay đổi | Người thay đổi | Ghi chú |
| --- | -----| --- | --- | --- |
| 1 | 16/07/2026 | Khởi tạo tài liệu SRS màn hình "Xem danh sách chuyến bay và giám sát cảnh báo" từ nội dung nguồn | *(Chưa có trong nguồn — cần bổ sung)* |  |

## 2. Khai báo yêu cầu màn hình tính năng

| Trường | Nội dung |
| --- | --- |
| **Mã chức năng** | TOSS.DSP.FM_LIST FLIGHT |
| **Tên chức năng** | Xem danh sách chuyến bay và giám sát cảnh báo |
| **Mục đích** | Cho phép người dùng xem danh sách chuyến bay và giám sát cảnh báo |
| **Trigger** | • Người dùng truy cập vào đường link website quản trị > Chọn hệ thống TOSS > Hệ thống hiển thị màn hình **Flight Monitoring** trong module **Flight Dispatch** > Hiển thị màn hình **List Flight** <br>• Hoặc tại bất kì module nào thuộc hệ thống TOSS > Người dùng click **Flight Dispatch** > Chọn **Flight Monitoring** > Hệ thống hiển thị mặc định màn **Flight list**|
| **Pre-Condition (Tiền điều kiện)** | • Người dùng có đường link truy cập website<br>• Người dùng đã có tài khoản truy cập vào hệ thống và được phân quyền tương ứng<br>• Người dùng có thể nhập từ khoá hoặc chọn giá trị filter |
| **Post-Condition (Hậu điều kiện)** | • Người dùng đăng nhập thành công<br>• Màn hình hệ thống hiển thị thành công bảng thông tin giám sát các chuyến bay đi kèm cảnh báo theo quy tắc cho từng cột thông tin |
| **Giao diện (Figma)** | [Flight_Dispatch_List](https://www.figma.com/design/gZiz9OhL4D52QTSQYuvEJE/BA-TOSS?node-id=89-26995&t=96NFEnygFbynnSfb-0) |

## 3. Sơ đồ luồng & Mô tả sơ đồ luồng 

- **Sơ đồ luồng (Draw.io / nguồn thiết kế):** [VNA.TOSS_Flight Dispatch monitoring_flow](https://drive.google.com/file/d/15wIo-T4y6bAoRtsyo62pdEPm2fCk2TAO/view?usp=sharing)

- **Mô tả sơ đồ luồng theo từng bước:**

| Bước | Chi tiết luồng |
| --- | --- |
| Bước 1 | Người dùng truy cập hệ thống TOSS và đăng nhập thành công. Tại bảng điều khiển điều hướng bên trái màn hình → chọn **Flight list** trong **Monitoring**. |
| Bước 2 | Hệ thống gọi API xuống BE (Backend) lấy danh sách chuyến bay trong khung ±18h so với thời điểm hiện tại. |
| Bước 3 | Hiển thị bảng danh sách chuyến bay lên màn hình theo dõi. |

## 4. Mô tả màn hình tính năng

Dưới đây là mô tả bảng thông tin hiển thị danh sách chuyến bay trong khung ±18h so với thời điểm hiện tại.

> **Lưu ý:** Các quy tắc hiển thị cảnh báo được mô tả trong *(Bổ sung link dẫn)*.

### 4.1 Phần thông tin bảng theo dõi chuyến bay realtime

Tại đây, điều phái viên (dispatcher) thực hiện: theo dõi các chuyến bay trong ±18h; quản lý cảnh báo, xem thông tin chi tiết của cảnh báo qua tooltip hiển thị khi rê chuột (hover) *(gán link tài liệu hiển thị tooltip)*; xem thông tin chi tiết của một chuyến bay khi nhấp chuột vào một bản ghi bất kỳ trên bảng chuyến bay *(gán link tài liệu mô tả màn detail chuyến bay)*.

| # | Tên | Kiểu dữ liệu [Độ dài] | Mapping DB/API | Mô tả nghiệp vụ |
| --- | --- | --- | --- | --- |
| 1 | REG | TextView | *(chưa map)* | **Registration** — Số đăng ký tàu bay: biển kiểm soát riêng biệt của từng máy bay. Một tàu bay có thể thực hiện nhiều chuyến bay khác nhau trong ngày, nhưng REG luôn cố định theo thân máy bay.<br>• Khi hover → tooltip chi tiết *(gán link)*: Reg cũ → Reg mới; Giờ đổi trên Netline (lấy lần thay đổi gần nhất). |
| 2 | FLTNO | TextView + Màu cảnh báo | *(chưa map)* | **Flight Number** — Số hiệu chuyến bay gắn theo lịch bay, không theo thân máy bay. Quy tắc cảnh báo: *(Bổ sung link dẫn)*. <br>Khi hover → tooltip Lịch sử thay đổi số hiệu chuyến bay. Phân quyền theo Carrier (hãng hàng không). |
| 3 | DEP | TextView | *(chưa map)* | **Departure** — Sân bay khởi hành: mã IATA 3 ký tự của sân bay cất cánh. Ví dụ: HAN (Hà Nội), SGN (Tân Sơn Nhất). |
| 4 | ARR | TextView + Màu cảnh báo | *(chưa map)* | **Arrival** — Sân bay đến: mã IATA 3 ký tự của sân bay hạ cánh. Quy tắc cảnh báo: *(Bổ sung link dẫn)*.<br>• Khi hover → tooltip: ARR divert và giờ thực tế; ARR và giờ theo kế hoạch. Ví dụ: HAN, SGN. |
| 5 | ETD | Date time | *(chưa map)* | **Estimated Time of Departure** — Giờ dự kiến cất cánh (tính theo giờ UTC), cập nhật liên tục khi có thay đổi từ ATC hoặc vận hành mặt đất. Quy tắc cảnh báo: *(Bổ sung link dẫn)*.<br>• Khi hover → tooltip: Giờ dự kiến cất cánh ban đầu (giờ cũ); Giờ cất cánh thực tế (giờ mới). |
| 6 | ETA | Date time | *(chưa map)* | **Estimated Time of Arrival** — Giờ dự kiến hạ cánh (chạm bánh tại sân bay đến), thay đổi theo thực tế bay và các yếu tố như thời tiết, điều hướng không lưu.<br>• Khi hover → tooltip: Giờ dự kiến hạ cánh ban đầu (giờ cũ); Giờ hạ cánh thực tế (giờ mới). |
| 7 | Type | TextView + Màu cảnh báo | *(chưa map)* | **Flight Type** — Loại hình chuyến bay, phân loại để xác định mức độ ưu tiên và quy trình giám sát: <br><ul><li> G (Thương mại quốc tế/quốc nội), <br><li> J (Nội địa chính quy), <br> <li> VIP (có khách đặc biệt — yêu cầu giám sát nghiêm ngặt nhất, ưu tiên xử lý khi phát sinh sự cố). <br><li> Lịch sử thay đổi được lưu lại để quản lý.<br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*.<br>• Khi hover → tooltip lịch sử thay đổi flight type code (code1 → code2 và thời điểm thay đổi). |
| 8 | Status | TextView + Màu cảnh báo | *(chưa map)* | **Real-time flight status** — Trạng thái chuyến bay trong vòng đời khai thác, cập nhật tự động theo tín hiệu từ hệ thống mặt đất và ATC: <br>• GRD (đang ở mặt đất), <br>• BRD (đang đón khách), <br>• OUT (đã rời vị trí đỗ), <br>• ENR (đang bay),<br>• ARR (đã hạ cánh),<br>• IN (đã vào vị trí đỗ). <br> **Quy tắc cảnh báo**: *(Bổ sung link dẫn)*. Khi chuyển trạng thái thì nhấp nháy theo hiệu ứng Animation. |
| 9 | OFP Rev | TextView + Màu cảnh báo | *(chưa map)* |<br>• **OFP (Operation Flight Plan)** — Kế hoạch khai thác chuyến bay (phi công chỉ được bay khi có OFP).<br>• **OFP Revision**: mỗi lần OFP được sửa (đường bay, nhiên liệu,…) tính là 1 Revision — khởi tạo R0, sửa lần thứ n là Rn.<br>• Khi hover → tooltip: thời gian upload, tên DSP, thời gian release.<br>• "No Release" = chuyến bay chưa đủ điều kiện cất cánh về mặt hồ sơ. Quy tắc cảnh báo: *(Bổ sung link dẫn)*. |
| 10 | PILOT CFM | TextView + Màu cảnh báo | *(chưa map)* | Cơ trưởng xác nhận OFP hoặc revision mới nhất của OFP.<br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*.<br>• Khi hover → hiển thị: <br>• Thời gian release;   Nội dung lý do nếu reject. |
| 11 | CREW | Nhãn cảnh báo | *(chưa map)* | Cảnh báo về thay đổi đội bay trước giờ bay (nếu có).<br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*. Dữ liệu đội bay được bóc tách từ OFP và so sánh với thông tin trong AVES.<br>• Khi hover → hiển thị: Mã tổ bay theo kế hoạch; Mã tổ bay mới nhất + thời gian thay đổi. |
| 12 | EPLD | Nhãn cảnh báo | *(chưa map)* |<br>• **Estimated Payload vs CLC (Centralized Load Control)** — Tải trọng ước tính so với thực tế: so sánh Payload OFP với Payload CLC đã nhập.<br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*.<br>• Khi hover → tooltip: Tải trọng trong OFP + thời gian cập nhật; Tải trọng trong CLC + thời gian cập nhật; Tải trọng chênh lệch giữa 2 tài liệu. |
| 13 | EST DOW | Nhãn cảnh báo | *(chưa map)* |<br>• **Estimated Dry Operating Weight vs CLC** — Trọng lượng khô vận hành (không tính nhiên liệu và tải thương mại), so sánh giữa OFP và CLC. Sai lệch DOW ảnh hưởng trực tiếp đến tính toán trọng lượng cất cánh.<br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*.<br>• Khi hover → tooltip: Tải trọng trong OFP + thời gian cập nhật; Tải trọng trong CLC + thời gian cập nhật; Tải trọng chênh lệch giữa 2 tài liệu. |
| 14 | PILOT EXTRA | Float (làm tròn 3 chữ số sau dấu phẩy) | *(chưa map)* |<br>• **Pilot Extra Fuel** — Lượng nhiên liệu cơ trưởng yêu cầu nạp thêm ngoài OFP.<br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*. Khi hover → tooltip: Số lượng nhiên liệu PIC extra; Lý do extra. |
| 15 | FLT DOC | Nhãn cảnh báo | *(chưa map)* | Điều kiện tài liệu bắt buộc gồm: LS, GD, PM.<br>• Tất cả chuyến bay đều cần đủ NOTAM (điện cảnh báo hàng không) và WX (thời tiết). Riêng chuyến EDTO cần bổ sung 100%: Plotting chart, Icing chart. (Cách nhận diện: dựa vào tên file — nếu tên file chứa chuỗi "plotting" hoặc "icing" thì hệ thống ghi nhận là đã có tài liệu).<br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*.<br>• Khi hover → tooltip: Tên tài liệu còn thiếu; Thời gian PIC. |
| 16 | NOTAM | *(chưa xác định)* | *(chưa map)* | **Notice to Air Missions** — Điện văn thông báo hàng không, chứa thông tin khẩn cấp, cần thiết cho phi hành đoàn trước chuyến bay.<br>• Lưu ý đặc biệt các loại NOTAM quan trọng: đóng cửa sân bay; đóng cửa đường bay; hoạt động quân sự; check RFFS (Rescue and Fire Fighting Service) — nếu sân bay đã public cấp cứu hoả mà có NOTAM thay đổi thì đó là dấu hiệu cảnh báo.<br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*.<br>• Khi hover → hiển thị nội dung NOTAM: Tên nhóm NOTAM; Mã NOTAM; Thời gian hiệu lực; Nội dung NOTAM. |
| 17 | WX | Nhãn cảnh báo | *(chưa map)* | **Weather** — **Tình hình thời tiết**: theo dõi điều kiện khí tượng tại DEP và ARR.<br>• C**heck thời tiết WX so với Minima của từng sân bay** (đối với sân cất-hạ cánh); nguồn thời tiết: nội địa lấy từ trang web quản lý bay, quốc tế lấy theo LIDO.<br>• **Minima từng sân bay có tiêu chuẩn quan tâm:** Tầm nhìn; Trần mây; Mưa giông (TSRA, TSRA+); Airport chart (từ Quản lý bay, Weather new); căn cứ bản tin METAR (30 phút/lần).<br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*. Khi hover → hiển thị nội dung *(TBD)*. |
| 18 | MEL/CDL | Nhãn cảnh báo | *(chưa map)* |<br>• **MEL (Minimum Equipment List)** — danh mục thiết bị/hệ thống bên trong máy bay bị hỏng/không hoạt động nhưng máy bay vẫn an toàn để bay.<br>• **CDL (Configuration Deviation List)** — danh mục bộ phận/chi tiết bên ngoài (thường không liên quan cấu trúc chính) bị thiếu/hư hỏng nhưng máy bay vẫn đủ điều kiện khai thác.<br>• Tích hợp dữ liệu từ AMOS (hệ thống bảo dưỡng), đối chiếu với Master MEL.<br>• So sánh MEL/CDL đang áp dụng trên OFP với MEL/CDL thực tế trên AMOS.<br>• Các nội dung cần đánh giá ảnh hưởng: lỗi kỹ thuật cần mang thêm dầu (do MEL/CDL yêu cầu bù hao hụt hiệu suất); ảnh hưởng đến mực bay (flight level) được phép khai thác. <br>• Quy tắc cảnh báo: *(Bổ sung link dẫn)*. Khi hover → hiển thị nội dung *(TBD)*. |
| 19 | ATC | Nhãn cảnh báo | *(chưa map)* | **ATC (Air Traffic Control)** — Tài liệu kế hoạch trước chuyến bay, đồng bộ từ LIDO cập nhật vào OFP.<br>• So sánh kế hoạch bay giữa ATC (LIDO) gửi cho đội giám sát sân bay và OFP cập nhật cho điều phái viên.<br>• "Chưa có clearance" = chưa được phép cất cánh về mặt không lưu. Quy tắc cảnh báo: *(Bổ sung link dẫn)*.<br>• Khi hover → hiển thị nội dung: **điện Normal (có kế hoạch bay)** → toàn bộ nội dung ATC; **điện CHG (Change)** → các trường hiện tại và trường đã thay đổi; **điện CNL (Cancel)** → toàn bộ nội dung điện thông báo. <br>• Khi hover chuột, hiển thị tooltip: là bản ghi của toàn bộ điện cảnh báo.|
| 20 | PIC | Nhãn cảnh báo | *(chưa map)* | Cảnh báo PIC (Pilot In Command) chưa khớp với OFP khi gần tới giờ khởi hành. Quy tắc cảnh báo: *(Bổ sung link dẫn)*. |

### 4.2 Chức năng phụ: Table Setting (tuỳ chỉnh cột hiển thị)

Chức năng **Table Setting** cho phép người dùng tuỳ chỉnh các cột hiển thị trên bảng dữ liệu theo nhu cầu:
<br>•  Hiển thị hoặc ẩn từng cột; 
<br>•  Thay đổi thứ tự hiển thị bằng thao tác kéo thả (Drag & Drop); 
<br>• Lưu cấu hình để áp dụng cho lần sử dụng tiếp theo.
<br>• Việc tuỳ chỉnh chỉ ảnh hưởng đến giao diện hiển thị của người dùng, không làm thay đổi dữ liệu trong hệ thống.

**Cấu trúc bảng danh sách cột cấu hình:**
<br>• Cột tay nắm kéo thả (Drag Handle) — nằm ngoài cùng bên trái mỗi dòng,
<br>• Biểu tượng ba dấu gạch ngang (☰), dùng chuột/cảm ứng để kéo thả đổi vị trí dòng; 
<br>• Cột trạng thái ẩn/hiện (Checkbox) — nằm ở giữa mỗi dòng, 
<br>• Tích chọn (Checked - xanh) để hiển thị cột, 
<br>• Bỏ tích (Unchecked - trắng rỗng) để ẩn; 
<br>• Cột tên cột dữ liệu (Data Column Name) — nằm bên phải, hiển thị nhãn viết tắt của cột dữ liệu tương ứng.

| # | Tên | Kiểu dữ liệu | Mapping DB/API | Mô tả nghiệp vụ |
| --- | --- | --- | --- | --- |
| 1 | DEP | Textview | *(chưa map)* | Cột hiển thị sân bay khởi hành |
| 2 | ARR | Textview | *(chưa map)* | Cột hiển thị sân bay đến |
| 3 | ETD | Textview | *(chưa map)* | Cột hiển thị thời gian cất cánh dự kiến |
| 4 | ETA | Textview | *(chưa map)* | Cột hiển thị thời gian hạ cánh dự kiến |
| 5 | Type | Textview | *(chưa map)* | Cột hiển thị loại tàu bay |
| 6 | Status | Textview | *(chưa map)* | Cột hiển thị trạng thái chuyến bay |
| 7 | OFP REV | Textview | *(chưa map)* | Cột hiển thị phiên bản OFP hiện tại |
| 8 | PILOT CFM | Textview | *(chưa map)* | Cột hiển thị trạng thái xác nhận của phi công |
| 9 | EST PLD | Textview | *(chưa map)* | Cột hiển thị tải trọng dự kiến của chuyến bay |
| 10 | Nút Cancel | Button | *(chưa map)* | Đóng popup và huỷ bỏ mọi thay đổi |
| 11 | Nút Save | Button | *(chưa map)* | Lưu cấu hình hiển thị cột và cập nhật ngay lập tức giao diện bảng dữ liệu giám sát |

## Mục 5. Nội dung cảnh báo (Business rule)

Các quy tắc cảnh báo được mô tả chi tiết trong *(Bổ sung link dẫn)*.

| Code | Business rule | Description |
| --- | --- | --- |
| BR-01 | Quy tắc hiển thị nhãn cảnh báo | Các dạng cảnh báo: <br>• **Normal** — hiển thị gạch xám (hoặc để trống ô);<br>• **Warning** — cảnh báo màu vàng (có trường dùng nhãn, có trường để chữ cảnh báo);<br>• **Critical** — cảnh báo đỏ, có nhấp nháy (hiệu ứng animation). |
| BR-02 | Quy tắc SYNC dữ liệu | Dữ liệu được đẩy và cập nhật realtime. |
| BR-03 | Quy tắc hiển thị bản ghi | Hiển thị theo thứ tự tuân theo ETD (chuyến bay xếp theo ETD gần nhất giờ khởi hành). |
| BR-04 | Quy tắc Customize bảng | • 2 cột FLTNO và REG được fix tại mỗi bảng, người dùng không được customize (Cột pin được hiển thị trong mục customize bảng) <br>• Mặc định khi vào màn hình customize > Tất cả các cột được tick chọn, người dùng tick bỏ chọn để không hiển thị cột. <br>• Người dùng được phép thay đổi thứ tự cột trong bảng <br>• Yêu cầu phải tick chọn tối thiểu <TBD> cột   |


## Mục 6. Giao diện mẫu

*(Chưa có ảnh trong nội dung nguồn — cần bổ sung.)* Nội dung nguồn tham chiếu "Hình 2: Màn hình giao diện xem danh sách chuyến bay và giám sát cảnh báo" nhưng chưa đính kèm hình ảnh/giao diện mẫu.

![Màn hình Flight monitoring](<DSP Monitoring (3)-1.png>)
---

## Phụ lục — Ghi chú truy vết & hạng mục cần bổ sung

- **Mã chức năng đã gán:** `TOSS.DSP.FM_LIST FLIGHT` — Xem danh sách chuyến bay và giám sát cảnh báo.
- **Business rule:** BR-01, BR-02 (theo nguồn); BR-03 (BA gán bổ sung cho quy tắc sắp xếp theo ETD).
- **Danh sách "link dẫn" còn thiếu (cần bổ sung):** quy tắc cảnh báo tổng thể; tài liệu tooltip từng trường; tài liệu màn detail chuyến bay; link Figma prototype.
- **Nội dung *(TBD)* trong nguồn cần làm rõ:** tooltip WX, MEL/CDL, và tooltip chi tiết ATC.

