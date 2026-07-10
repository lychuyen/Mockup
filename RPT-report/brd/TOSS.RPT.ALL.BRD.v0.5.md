---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.5"
date: "2026-06-17"
status: "Draft"
document_type: "BRD"
document_id: "BRD-TOSS-PH3"
parent: "BRD-TOSS-001-khung-v0.12.md"
---

# Yêu cầu Nghiệp vụ — Phân hệ 3: Báo cáo & Tối ưu khai thác (v0.5)

> **Tài liệu con của [BRD-TOSS-001-khung-v0.12.md](../../BRD-TOSS-001-khung-v0.12.md).** Viết lại từ tài liệu nguồn gốc — KHÔNG kế thừa v0.2.
>
> **Phạm vi PH3:** BCAO (Báo cáo điều hành ngày + chậm/hủy chuyến) số hóa, mục tiêu & giá trị thực tế OTP/OSP, báo cáo nhiên liệu (Fuel/Tankering/Overfueling), báo cáo thời gian khai thác (Taxi/BH/Phase/Holding/Ground Time), báo cáo OFP & dữ liệu bay thực tế (Payload Accuracy, Cost Index, Route, SID/STAR), báo cáo tải/dịch vụ/tổ bay, báo cáo môi trường & thời tiết, báo cáo Schedule Robustness, FOS Report (nền dữ liệu chuyến bay), dashboard KPI, Standard Filter & Standard Layout cho mọi báo cáo, scheduled report (định kỳ tự động), export PDF/Excel/Docx, lưu trữ & tra cứu lịch sử, Data Monitoring (độ phủ/độ chính xác dữ liệu tích hợp), báo cáo theo mẫu nhà chức trách.
>
> **Ngoài phạm vi PH3:** sinh OFP (PH1), upload tài liệu chuyến bay (PH2), quản trị danh mục tham số tankering/đội tàu (PH4), quản trị tích hợp (PH5).
>
> **Quản lý điểm cần xác nhận:** mọi cờ `[cần xác nhận]` chuyển về sổ cái duy nhất **OID-TOSS-001** (`ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md`). Trong tài liệu này chỉ giữ chú thích `*(xem OID: <mã>)*` ở cuối mô tả BR liên quan.

---

## §7.3 Phân hệ 3 — Báo cáo & Tối ưu khai thác

### §7.3.1 — Nền tảng báo cáo dùng chung (FOS, Standard Filter, Layout, Scheduled)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-301 | Hệ thống phải cung cấp **FOS Report** (Flight Operations Summary / Flight Integrated) là báo cáo nền tích hợp toàn bộ dữ liệu chuyến bay theo 14 nhóm thông tin chuẩn (FLIGHT INFO, AIRCRAFT, TIME, FUEL UPLIFT, LOAD & WEIGHT, OFP, FLIGHT RELEASE, DOCUMENT STATUS, EOFP, QAR, CREW, AIRPORT, ACARS, COST & REVENUE); cho phép báo cáo khác chọn thêm cột từ FOS để bổ sung dữ liệu chi tiết. | Functional | Must | YCKT sheet-09 (FOS); YCKT sheet-11 #10 |
| BR-302 | Hệ thống phải áp dụng bộ **Standard Filter** thống nhất cho mọi báo cáo, gồm: From Date, To Date, Local/UTC, Plan/Actual Time, Carrier; ngoài Standard Filter mỗi báo cáo có bộ lọc riêng tùy nghiệp vụ. | Functional | Must | YCKT sheet-09 dòng 2–3 |
| BR-303 | Hệ thống phải áp dụng **Standard Layout** cho mọi báo cáo theo bố cục: (1) Standard Filter — (2) bộ lọc riêng của báo cáo — (3) khu vực biểu đồ — (4) khu vực bảng dữ liệu chi tiết với khả năng chọn thêm cột từ FOS; các dữ liệu cơ sở đặt tại FOS Report. | Functional | Must | YCKT sheet-11 #10 |
| BR-304 | Hệ thống phải hiển thị **cảnh báo hiệu năng** khi người dùng chọn khoảng thời gian dài hoặc số lượng trường lớn có thể làm giảm hiệu năng truy vấn. | Functional | Must | YCKT sheet-09 dòng 7; sheet-11 #10 |
| BR-305 | Hệ thống phải cho phép chọn cột theo nhóm (toàn bộ trường của một nhóm) hoặc theo từng trường riêng lẻ; các trường mặc định được đánh dấu (theo quy ước "trường màu xanh lá cây" trên YCKT). | Functional | Must | YCKT sheet-09 dòng 6 |
| BR-306 | Hệ thống phải hỗ trợ **xuất báo cáo** ra các định dạng chuẩn: PDF, Excel, Docx; với báo cáo nặng, áp dụng cơ chế trả kết quả ra tab riêng, lưu link tải trong 7 ngày và cho phép tải lại (tương tự luồng gửi báo cáo qua thư điện tử). | Functional | Must | Đề xuất §II.3; Khảo sát 11/06 chiều §II.10 |
| BR-307 | Hệ thống phải hỗ trợ **gửi báo cáo định kỳ tự động** (scheduled report) tới danh sách đầu mối; trạng thái chạy ngầm phải hiển thị trên màn hình người dùng đang thao tác để không chặn nghiệp vụ khác. | Functional | Must | YCKT sheet-11 #11 |
| BR-308 | Hệ thống phải cho phép quản lý **danh sách email nhận báo cáo** linh hoạt theo từng loại báo cáo (Email list for Data Coverage Report, Email list for Daily Operations Report, …); admin có thể thêm/bớt email cho mỗi loại. *(danh sách email được quản trị tập trung tại PH5 BR-537; PH3 tiêu thụ theo loại báo cáo.)* | Functional | Should | YCKT V3 TOSS-168 (dòng 229–231) |
| BR-309 | Hệ thống phải hỗ trợ **lưu cấu hình hiển thị cột cá nhân** cho từng người dùng (lựa chọn cột nào hiển thị, độ rộng cột), áp dụng cho các phiên đăng nhập sau, không ảnh hưởng cấu hình của người dùng khác. *(kế thừa cơ chế lưu cấu hình cá nhân từ PH5 BR-507; áp dụng cho màn báo cáo PH3.)* | Functional | Must | Khảo sát 09/06 §II.2; YCKT sheet-11 #4, #14 |
| BR-310 | Hệ thống phải cung cấp **API thông tin báo cáo FOS** cho các hệ thống khác: cho phép truyền danh sách trường cần lấy và trả ra dữ liệu tương ứng. *(API FOS kế thừa từ PH5 BR-531 — PH5 quản lý catalog API; PH3 đặc tả tham số trả về cho nhu cầu báo cáo.)* | Functional | Must | YCKT V3 dòng 137 (TOSS-109) |

### §7.3.2 — Báo cáo điều hành ngày khai thác (BCAO)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-311 | Hệ thống phải số hóa **Báo cáo điều hành ngày khai thác (BCAO)** thay thế cách soạn thủ công trên Word hiện nay; cấu trúc gồm hai phần — (a) tổng kết ca trực vừa kết thúc / ngày khai thác hôm trước (số liệu thực hiện); (b) kế hoạch ngày hôm nay (kèm APU/PACK, AOG, TAF, NOTAM, phụ lục kỹ thuật). | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-312 | Hệ thống phải **tự động thu thập** tối đa dữ liệu BCAO từ lịch bay và các nguồn tích hợp (số chuyến khai thác, số tổ bay khai thác/dự bị, số khách, OTP, OSP, …); các bộ phận chuyên môn chỉ nhập phần thuộc trách nhiệm chuyên môn của mình. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-313 | Hệ thống phải dùng **chung một màn hình BCAO** với phân quyền theo tab nguồn: tab tổng quan dành cho trực ban trưởng, tab kỹ thuật do khối kỹ thuật nhập, tab dịch vụ do đơn vị dịch vụ nhập; mỗi vai trò chỉ thao tác trên tab của mình. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-314 | Hệ thống phải hỗ trợ luồng **phê duyệt BCAO** trước khi phát hành; phát hành qua thư điện tử (không yêu cầu ký số) tới danh sách đầu mối nhận báo cáo đã cấu hình sẵn. | Functional | Must | Khảo sát 08/06 §II.4; Khảo sát 09/06 §II.7 |
| BR-315 | Hệ thống phải hỗ trợ **nhập sự kiện bất thường theo cách đa chiều, hạn chế free text**: người nhập chọn tàu → hệ thống liệt kê các chuyến của tàu đó → tích chọn chuyến bị ảnh hưởng; nguyên nhân chọn từ danh mục mã nguyên nhân chuẩn; chỉ phần ghi chú chi tiết là free text; hỗ trợ lọc theo khoảng thời gian và sân bay đi/đến; dữ liệu nhập phải dùng được cho cả báo cáo ngày và thống kê dài hạn. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-316 | Hệ thống phải **nhận biết tự động yếu nhân và chuyên cơ** khi nguồn tích hợp có dữ liệu mác phân loại; trường hợp nguồn không trả mác thì cho phép trợ lý trực ban trưởng tích chọn thủ công từ danh sách chuyến đã lọc. *(Tên hệ thống nguồn — xem OID: SME-09. Định dạng dữ liệu nhập tay VIP — xem OID: KS-51. Luồng thủ công khi nguồn thiếu mác — xem OID: KS-50.)* | Functional | Must | Khảo sát 09/06 §II.7, §IV.7, §IV.9 |
| BR-317 | Hệ thống phải trình bày BCAO **trực quan bằng biểu đồ**, xếp đẹp, dễ đọc, thay thế tệp Word soạn thủ công; lãnh đạo Tổng công ty chỉ cần xem trang đầu (chỉ tiêu chính + bất thường), các trang chi tiết phía sau dành cho bộ phận chuyên môn. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-318 | Dữ liệu sự kiện bất thường trong BCAO phải có **liên kết tới tàu bay, chuyến bay, sân bay và mã nguyên nhân chuẩn** để truy xuất, thống kê dài hạn được. *(Danh mục mã nguyên nhân chuẩn — xem OID: KS-07.)* | Functional | Must | Khảo sát 09/06 §II.7 |

### §7.3.3 — Báo cáo lịch bay, hiệu suất khai thác và mục tiêu KPI

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-319 | Hệ thống phải cung cấp **báo cáo lịch bay & biến động**: thống kê biến động (đổi giờ/đổi tàu/đổi cấu hình/đổi code/hủy), phân loại tính chất chuyến (thường lệ, Charter, Ferry, VIP, khách/hàng). | Functional | Must | Đề xuất §II.3 |
| BR-320 | Hệ thống phải cung cấp **báo cáo OTP/OSP** chi tiết theo sân bay (chậm cất cánh / chậm hạ cánh); chuẩn nghiệp vụ: chuyến bay được coi là đúng giờ khi cất cánh chậm không quá 14 phút so với giờ dự kiến; chậm hơn 1 phút là tính chậm. | Functional | Must | Khảo sát 09/06 §II.8 |
| BR-321 | Hệ thống phải quản lý **mục tiêu (target) và giá trị thực tế** của 4 nhóm KPI gồm 2 mục tiêu OTP và 2 mục tiêu OSP; các chỉ số được tính tự động khi đủ nguồn dữ liệu (dữ liệu sẵn có + dữ liệu nhập bổ sung); cảnh báo khi tỷ lệ thực hiện thấp hơn mục tiêu. *(Định nghĩa + công thức chi tiết 4 KPI + tiêu chí 80% áp dụng nhóm nào — xem OID: KS-48.)* | Functional | Must | Khảo sát 09/06 §II.8, §IV.4 |
| BR-322 | Hệ thống phải cung cấp **báo cáo sử dụng đội tàu**: số cất hạ cánh, Block Hour (BH), thời gian dừng/nằm sân, Aircraft Utilization, tỷ lệ FH/FC. | Functional | Must | Đề xuất §II.3; YCKT V3 dòng 368–369 |
| BR-323 | Hệ thống phải cung cấp **báo cáo Schedule Robustness** — đo độ ổn định lịch, khả năng chống delay dây chuyền. | Functional | Should | YCKT V3 dòng 373 |
| BR-324 | Hệ thống phải **tiêu thụ danh sách Category (Fleet Grouping)** được quản lý tại PH4 BR-422 (Master Data Owner); mỗi báo cáo cho phép người dùng **chọn một Category** để phân nhóm dữ liệu theo đội tàu bay (theo loại, theo thân rộng/hẹp, theo subfleet, …); mỗi chiều thông tin trong báo cáo chỉ chọn một Category. | Functional | Must | Khảo sát 09/06 §II.11 |

### §7.3.4 — Báo cáo nhiên liệu (Fuel)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-325 | Hệ thống phải cung cấp **báo cáo Fuel/FH** theo loại tàu và chặng: thống kê Median/Mean/Max/Min kèm độ tin cậy (%); đối soát kế hoạch ↔ thực tế. | Functional | Must | Đề xuất §II.3 |
| BR-326 | Hệ thống phải cung cấp **báo cáo giám sát Pilot Extra Fuel** và các chỉ số kinh tế nhiên liệu (Fuel Burn/RTK, Fuel Burn/BH). | Functional | Must | Đề xuất §II.3 |
| BR-327 | Hệ thống phải cung cấp **báo cáo Overfueling** và **Planned FH Fuel Flow**; chuẩn hóa nhóm Fuel Uplift chi tiết theo các trường FOS (FUEL RECEIPT COUNT, INVOICE UNIT/UPLIFT/DENSITY/UPLIFT KG, FUEL SUPPLIER, DEFUEL QTY, TECHLOG UPLIFT, TECHLOG FOB). | Functional | Must | YCKT V3 dòng 389, 393; YCKT sheet-09 nhóm FUEL UPLIFT |
| BR-328 | Hệ thống phải cung cấp **báo cáo Fuel Invoice Summary** theo AC Group, theo tháng, có tổng phụ theo Group và tổng toàn bộ. | Functional | Must | YCKT V3 dòng 396 |
| BR-329 | Hệ thống phải cung cấp **khuyến nghị tối ưu chính sách mang dầu bổ sung (Tankering Strategy)** với tính chất khuyến nghị; nguồn dữ liệu tính toán lấy từ giá nhiên liệu (PH4) và dữ liệu bay thực tế. | Functional | Should | Đề xuất §I |
| BR-330 | Hệ thống phải cung cấp **báo cáo hiệu quả tankering** theo nhiều chiều: theo chặng bay/sân bay/giai đoạn; báo cáo tankering tổng hợp (tỷ lệ chuyến tankering, tổng lượng nhiên liệu, tổng chi phí hiệu quả); báo cáo tankering chi tiết (từng chuyến, lượng tankering, chi phí hiệu quả). | Functional | Must | YCKT V3 TOSS-160/161/162 (dòng 220–222) |
| BR-331 | Hệ thống phải cung cấp **báo cáo Pallet Relief (Payload Extra)** liệt kê các chuyến bay và lượng dầu/nhiên liệu tổ bay tự đề nghị lấy thêm so với OFP của điều phái (thường ~30 phút trước khởi hành); báo cáo phải có cột Payload Extra và/hoặc cột Delta (= Actual − OFP); lọc theo ngày, đường bay, khung giờ cất cánh, loại tàu bay. | Functional | Must | Khảo sát 11/06 chiều §II.10 |
| BR-332 | Hệ thống phải áp dụng **công thức tính nhiên liệu thực tế** theo Logic tính toán YCKT sheet-12: Actual Remaining Fuel = ưu tiên ACARS ON FUEL → QAR ON FUEL; Standard OFP Remaining Fuel = Cont Fuel + Dest Alt Fuel + Final Reserve; Actual Trip Fuel = ưu tiên ACARS OFF−ON → QAR OFF−ON; Techlog uplift FOB lấy từ AMOS (remaining after uplift). | Functional | Must | YCKT sheet-12 |

### §7.3.5 — Báo cáo thời gian thực hiện chuyến bay (Time)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-333 | Hệ thống phải cung cấp **báo cáo Taxi Time** kèm khuyến nghị; bổ sung báo cáo **Taxi Out Time by Hour** (phân tích theo khung giờ trong ngày). | Functional | Must | Đề xuất §II.3; YCKT V3 dòng 402 |
| BR-334 | Hệ thống phải cung cấp **báo cáo Block Hour (BH)**: xu hướng, trung bình, theo mùa; bổ sung **BH By Periods** và **BH Trend**. | Functional | Must | Đề xuất §II.3; YCKT V3 dòng 404, 408 |
| BR-335 | Hệ thống phải cung cấp **báo cáo phân tích Phase** (Taxi-out, Takeoff, Climb, Cruise, Descent, Taxi-in), **Holding** và **Ground Time / Turnaround Time**. | Functional | Must | Đề xuất §II.3 |
| BR-336 | Hệ thống phải cung cấp **báo cáo FH Plan vs Actual Daily Comparison** — so sánh theo chặng × nhóm thân rộng/thân hẹp × ngày, cặp đi/về. | Functional | Should | YCKT V3 dòng 413 |
| BR-337 | Hệ thống phải cung cấp **báo cáo Ground Service Gantt** (mốc dịch vụ linh hoạt) và so sánh **Standard Gantt vs Actual** để theo dõi dịch vụ mặt đất. | Functional | Must | YCKT V3 dòng 415–416 |

### §7.3.6 — Báo cáo kế hoạch bay (OFP) và dữ liệu bay thực tế

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-338 | Hệ thống phải cung cấp **báo cáo thời gian làm OFP** so với quy định (ngưỡng release: nội địa 210/75/60 phút, quốc tế 270/90/75 phút trước ETD); thống kê chuyến không đạt ngưỡng. | Functional | Must | Khảo sát 15/06 §II.2 |
| BR-339 | Hệ thống phải cung cấp **báo cáo độ chính xác tải trọng (Payload Accuracy)** đối chiếu kế hoạch OFP ↔ thực tế. | Functional | Must | Đề xuất §II.3 |
| BR-340 | Hệ thống phải cung cấp **báo cáo tối ưu hóa đường bay**: sân bay dự bị (TAKEOFF ALTN, ENROUTE ALTN, DEST ALTN 1/2/3), Flight Level, Cost Index (FMS CI, FMS CLB/CRS/DSC CI), Route, Runway, SID, STAR. | Functional | Must | Đề xuất §II.3; YCKT sheet-09 nhóm OFP |

### §7.3.7 — Báo cáo tải trọng, dịch vụ và tổ bay

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-341 | Hệ thống phải cung cấp **báo cáo tải trọng & dịch vụ**: Load Factor, VIP/CIP, hành lý/offload, NOTOC, Cargo Manifest, thay đổi tải sát giờ. | Functional | Must | Đề xuất §II.3 |
| BR-342 | Hệ thống phải cung cấp **báo cáo tổ bay**: mục tiêu giờ bay tổ bay, giờ bay/giờ làm việc, tổ bay dự bị, khai thác không đúng quy định (vi phạm FTL hoặc chứng chỉ). | Functional | Must | Đề xuất §II.3 |
| BR-343 | Hệ thống phải cung cấp **báo cáo ZFW/Payload Diff Summary** với Diff Range bước 1000 kg, chia theo đội tàu × Quốc tế/Quốc nội (QT/QN). | Functional | Must | YCKT V3 dòng 453 |
| BR-344 | Hệ thống phải cung cấp **báo cáo MTOW Exceed** — liệt kê các chuyến vượt giới hạn MTOW. | Functional | Must | YCKT V3 dòng 454 |
| BR-345 | Hệ thống phải cung cấp **nhóm báo cáo sai lệch tải / thời gian**: sai lệch tải EST của CLC vs thực tế; hàng hóa thực tế (LS) vs OFP đầu/cuối; chênh BlockFuel OFP vs LS; chênh DOW/EPLD ba bên (CLC × OFP × LS); chênh thời gian nhập tải / Lido up OFP / upload MO. *(Chi tiết đối soát với SME — xem OID: KS-31.)* | Functional | Should | YCKT V3 dòng 439–446 |
| BR-346 | Hệ thống phải cung cấp **báo cáo sử dụng nước sạch** (upload điện nước Boeing/Airbus + bổ sung chuyến không nhận được điện). | Functional | Should | YCKT V3 TOSS-317/332 (dòng 450) |

### §7.3.8 — Báo cáo môi trường, thời tiết và bất thường khai thác

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-347 | Hệ thống phải cung cấp **báo cáo bất thường khai thác** phân loại theo nhóm nguyên nhân (thời tiết / kỹ thuật / khác). | Functional | Must | Đề xuất §II.3 |
| BR-348 | Hệ thống phải cung cấp **phân tích thời tiết chuyên sâu**: quan trắc vs Minima; dự báo vs thực tế. | Functional | Must | Đề xuất §II.3 |
| BR-349 | Hệ thống phải cung cấp **báo cáo Observed Weather** (TAF/METAR) và **TAF/METAR vs Minima**. | Functional | Must | YCKT V3 dòng 473–475 |
| BR-350 | Hệ thống phải cung cấp **báo cáo hiệu quả tổng thể (Profitability)** dựa trên dữ liệu COST & REVENUE từ FOS. | Functional | Should | Đề xuất §II.3 |

### §7.3.9 — Performance Factor (PF) — báo cáo kỹ thuật khai thác

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-351 | Hệ thống phải cung cấp **báo cáo PF Comparison** — so sánh PF từng tàu bay theo từng AC Type giữa Previous Data Period và Current Data Period (format gửi OCD, copy làm CV dùng). | Functional | Must | YCKT V3 TOSS-141 (dòng 188) |
| BR-352 | Hệ thống phải cung cấp **báo cáo PF Trend by AC Type** — bảng AC Category × Data Period × AVG PF + biểu đồ dây mỗi Cate một dây kèm đường xu hướng. | Functional | Must | YCKT V3 dòng 189 |
| BR-353 | Hệ thống phải cung cấp **báo cáo PF Trend by AC Reg** — bảng AC Reg × Data Period × PF; khi chọn 1 Reg thì hiển thị biểu đồ dây PF qua các Data Period. | Functional | Must | YCKT V3 dòng 190 |
| BR-354 | Hệ thống phải cung cấp **báo cáo PF Data Coverage** theo Region/Category — tỷ lệ số CB có message PF (qua ACARS) / tổng số CB tàu đó khai thác của kỳ. | Functional | Must | YCKT V3 dòng 191 |
| BR-355 | Hệ thống phải cung cấp **báo cáo PF Messages From AC** — tích hợp với email nhận điện ACARS, tập hợp thành file message; cho phép view và download; đảm bảo input vào PEP/PET/FOS chạy đúng. | Functional | Must | YCKT V3 TOSS-136 (dòng 180) |
| BR-356 | Hệ thống phải cảnh báo các **tàu bay không có dữ liệu tính toán PF** (sẽ lấy PF của kỳ trước). | Functional | Must | YCKT V3 TOSS-138 (dòng 184) |

### §7.3.10 — Data Monitoring (giám sát độ phủ & độ chính xác dữ liệu tích hợp)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-357 | Hệ thống phải tách màn hình **Data Monitoring** độc lập, không trộn lẫn với báo cáo nghiệp vụ điều hành; mục đích đo độ phủ (data completeness) và độ chính xác (data accuracy) của dữ liệu tích hợp theo ngày/tuần/tháng. | Functional | Must | Khảo sát 09/06 §II.8, §II.12 |
| BR-358 | Hệ thống phải cung cấp báo cáo **tỷ lệ độ phủ cho TẤT CẢ nguồn dữ liệu tích hợp** (mở rộng từ ví dụ "tỷ lệ chuyến có điện văn theo từng đội tàu"); ví dụ chuẩn cho ACARS: A321 ~50%, B787 70–80%, A350 ~90%. | Functional | Must | Khảo sát 09/06 §II.8, §II.12; YCKT sheet-11 #8 |
| BR-359 | Hệ thống phải cung cấp **báo cáo ACARS Fuel Integration Coverage** theo AC Type và theo AC Reg: kết quả mỗi loại/đăng ký theo từng tháng trong khoảng chọn, gồm Fls by Month, ACARS Time Data Coverage, ACARS Block Fuel Data Coverage, ACARS Trip Fuel Data Coverage. | Functional | Must | YCKT V3 TOSS-095 (dòng 115–116) |
| BR-360 | Hệ thống phải cung cấp **báo cáo ACARS Fuel Reliability** (All AC và by AC Reg) với cấu hình **Min Difference** (mặc định 10% sai lệch giữa ACARS OUT FUEL và Fuel Order); bảng kết quả gồm: AC Type, AC Reg, FLS, ACARS Block Fuel Coverage, ACARS Trip Fuel Coverage, ACARS OUT vs Fuel Order > Min, Illogical Taxi Out Fuel, Illogical Trip Fuel, Illogical Taxi In Fuel; áp quy tắc highlight fill color (≤50% màu đỏ dịu càng nhỏ càng đậm; >50% màu xanh lá càng lớn càng đậm; các tỷ lệ bất hợp lý dùng màu đỏ dịu càng lớn càng đậm). | Functional | Must | YCKT V3 dòng 117–118 |
| BR-361 | Hệ thống phải **email báo cáo tỷ lệ độ phủ dữ liệu hàng tuần** theo từng tàu (Performance email) với danh sách tỷ lệ: CB nhận email Performance, ACARS OUT/OFF/ON/IN, OFP, QAR, booking, pax thực, tổ bay, Load Sheet. | Functional | Must | YCKT V3 dòng 151 |
| BR-362 | Hệ thống phải cung cấp **cơ chế đồng bộ hệ thống TEST lấy các dữ liệu PROD** để phục vụ Data Monitoring đối chiếu. | Functional | Should | YCKT sheet-11 #1 |

### §7.3.11 — Báo cáo theo mẫu nhà chức trách & các báo cáo đặc thù khác

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-363 | Hệ thống phải cung cấp **báo cáo theo mẫu nhà chức trách FORM D và FORM E**. *(Tên mẫu FORM D/E — xem OID: SME-32.)* | Functional | Should | YCKT V3 dòng 478 |
| BR-364 | Hệ thống phải cung cấp **báo cáo Flight List for Backup Tool** — export lịch bay cập nhật nhất theo format chuẩn, định kỳ xuất ra SFTP độc lập với TOSS để import phần mềm backup Netline khi Ops++/TOSS lỗi. | Functional | Must | YCKT V3 TOSS-269 (dòng 358) |

### §7.3.12 — Lưu trữ & tra cứu lịch sử báo cáo

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-365 | Hệ thống phải **lưu trữ lịch sử các báo cáo** đã sinh ra (BCAO theo ngày, báo cáo định kỳ, báo cáo theo yêu cầu) phục vụ tra cứu lại; thời gian lưu trữ tuân theo cấu hình theo từng loại tài liệu. *(Cấu hình thời gian lưu trữ theo từng loại — xem OID: KS-49.)* | Functional | Must | Khảo sát 09/06 §II.4, §IV.6 |
| BR-366 | Hệ thống phải cho phép **tra cứu các kỳ Data Period của PF** và lịch sử cập nhật PF (xem audit trail thay đổi). | Functional | Must | YCKT V3 TOSS-140 (dòng 186); TOSS-137 (dòng 181) |

---

## §7.3.13 — Tổng kết phân hệ 3

- **Tổng số BR PH3 v0.5:** 66 BR (BR-301 … BR-366).
- **Phân bố ưu tiên:** Must = 55; Should = 11; Could/Won't = 0.
- **Phân bố loại:** 100% Functional (NFR liên quan hiệu năng/lưu trữ/tích hợp đã gom về §9 BRD Khung và PH5).
- **Cấu trúc 12 nhóm:** (1) Nền tảng báo cáo dùng chung — (2) BCAO — (3) Lịch bay & KPI OTP/OSP — (4) Nhiên liệu — (5) Thời gian khai thác — (6) OFP & dữ liệu bay thực tế — (7) Tải/dịch vụ/tổ bay — (8) Môi trường & thời tiết — (9) Performance Factor — (10) Data Monitoring — (11) Báo cáo nhà chức trách & đặc thù — (12) Lưu trữ & tra cứu lịch sử.

---

## §7.3.14 — Nguồn tài liệu đã đọc

1. **Khảo sát 09/06/2026** (`BAO-CAO-KHAO-SAT-09062026-v0.3.md`): §II.7 (BCAO), §II.8 (OTP/OSP, 4 KPI), §II.11 (Category Fleet Grouping), §II.12 (Data Monitoring), §IV.4 (định nghĩa 4 KPI — chưa rõ), §IV.6 (retention theo loại tài liệu), §IV.7 (luồng thủ công ANABS), §IV.9 (định dạng VIP/yếu nhân).
2. **Khảo sát 11/06/2026 chiều** (`BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md`): §II.10 (Pallet Relief / Payload Extra).
3. **Khảo sát 11/06/2026 KTKTB** (`BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md`): tham chiếu các báo cáo phụ trợ liên quan KTKTB (không có BR thuần PH3 mới sinh ra).
4. **Khảo sát 15/06/2026** (`BAO-CAO-KHAO-SAT-15062026-v0.1.md`): §II.2 (ngưỡng release OFP nội địa 210/75/60′ — quốc tế 270/90/75′ → căn cứ BR-338).
5. **YCKT-VTIT** (`03-yckt/`): sheet-04 YCKT V3 (PF TOSS-136–141; ACARS TOSS-095 dòng 115–118; Performance email dòng 151; Schedule Robustness dòng 373; Aircraft Utilization dòng 368–369; Fuel reports dòng 389/393/396; Time reports dòng 402/404/408/413/415–416; Tankering TOSS-155–162 dòng 215–222; ZFW/MTOW dòng 453–454; sai lệch tải dòng 439–446; nước sạch dòng 450; FORM D/E dòng 478; Flight List for Backup Tool TOSS-269; API FOS TOSS-109 dòng 137; Email list TOSS-168 dòng 229–231); sheet-09 FOS (14 nhóm thông tin, Standard Filter, danh sách trường); sheet-11 Yêu cầu chung (cấu hình bảng biểu, Standard Layout, scheduled report, cảnh báo hiệu năng, đồng bộ TEST↔PROD); sheet-12 Logic tính toán (Actual Remaining Fuel, Standard OFP Remaining Fuel, Actual Trip Fuel, Techlog uplift FOB).
6. **Đề xuất giải pháp kỹ thuật** (`VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`): §I (Tankering Strategy khuyến nghị), §II.3 (nền tảng báo cáo + bộ lọc + định dạng xuất + báo cáo lịch bay/OTP/OSP/Fuel/Time/OFP/Tải/Môi trường/Profitability).
7. **Khảo sát 08/06/2026** (`BAO-CAO-KHAO-SAT-08062026-v0.2.md`): §II.4 (phát hành báo cáo qua thư điện tử).
8. **Sổ điểm cần chốt** (`SO-THEO-DOI-DIEM-CHOT-v0.1.md` v0.12): tham chiếu OID SME-09 (yếu nhân/chuyên cơ), SME-32 (FORM D/E), KS-07 (mã nguyên nhân chuẩn), KS-31 (sai lệch tải), KS-48 (4 KPI OTP/OSP), KS-49 (retention theo loại tài liệu), KS-50 (luồng thủ công ANABS), KS-51 (định dạng VIP).
9. **Glossary** (`toss-glossary-v0.1.md`): tham chiếu BCAO, OTP, OSP, Tankering, Performance Factor (PF), FOS, ACARS, AMOS, Block Hour, Cost Index, MTOW, ZFW, DOW, NOTOC, Cargo Manifest, EDTO, RCL — không thêm BR nội dung mới.

---

*BRD-TOSS-PH3 v0.5 — 2026-06-17. Tổng 66 BR (BR-301 … BR-366). Lịch sử version: xem `BA-VERSION-LOG.md`. Phân rã FUNC: `../../../../workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH3-quan-ly-bao-cao-toi-uu-khai-thac-v0.3.md` (cần cập nhật lại theo v0.5 BRD).*
