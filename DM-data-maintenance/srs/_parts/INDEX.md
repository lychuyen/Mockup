# SRS Data Maintenance v0.1 (human-authored, VNA.FIMS template) — bản trích text

> **🔎 Điểm vào tra cứu: [CATALOG.md](CATALOG.md)** — catalog 74 chức năng + từ điển 118 trường (dedup theo Mapping DB/API) + trạng thái 16 danh mục con + điểm cần xác nhận. Tra CATALOG trước, chỉ mở `sec-NN-*.md` khi cần nguyên văn. *(Nhóm APU INOP — 5 chức năng, nguồn BR-420 — đăng ký bổ sung 2026-07-15, trước đó bị bỏ sót khỏi CATALOG/INDEX; cùng ngày bổ sung state machine 4 trạng thái + 2 mã định danh theo chỉ đạo trực tiếp BA Lead, xem CATALOG.md §4.7.)*
>
> **🖼 Hình ảnh màn hình:** xem trực tiếp trong file `.docx` gốc (bản trích text bỏ ảnh).
>
> Phân rã từ `VNA.TOSS_SRS_Data-Maintenance_v0.1.extracted.md` để tra theo section (token-economy). CHỈ tách trung thực — không sửa nội dung (§0). Chế độ cắt: **h2**.

| Section | Nội dung | File | Dòng |
|---|---|---|---|
| THONG_TIN_CHUNG | Thông tin chung (trang bìa, mục đích, phạm vi, khái niệm — gộp sec-00→sec-03) | [TOSS.DM.THONG_TIN_CHUNG.FD.v0.1.md](TOSS.DM.THONG_TIN_CHUNG.FD.v0.1.md) | gộp |
| 04 | Tổng quan chức năng | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc; Figma: https://www.figma.com/board/3fo7ZwJNhK3QE3mcN25pEl/FIMS?node-id=0-1&p=f&t=PmqI6zMQ3F8QXrcN-0)* | — |
| 05 | Mô hình giao tiếp với hệ thống/Module chức năng khác | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| 06 | Danh sách chuyến bay | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| 07 | Quản lý tài liệu CFP, NOTAM, WX, briefing package | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| 08 | Quản lý tài liệu LS, GD, PM, NOTOC Cargo, NOCTOC Baggage, Cargo Manifest, Mail Manifest | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| 09 | Quản lý tải trọng | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| 10 | Quản lý Performance Factor | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| 11 | Quản lý thông tin tàu bay | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| 12 | Quản lý AOC | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| 13 | Quản lý MEL/CDL | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| AIRPORT_LIST | Danh sách sân bay | [TOSS.DM.AIRPORT_LIST.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_LIST.FD.v0.1.md) | 76 |
| AIRPORT_DETAIL | Xem chi tiết sân bay | [TOSS.DM.AIRPORT_DETAIL.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_DETAIL.FD.v0.1.md) | 73 |
| AIRPORT_CREATE | Thêm mới sân bay | [TOSS.DM.AIRPORT_CREATE.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_CREATE.FD.v0.1.md) | 76 |
| AIRPORT_UPDATE | Sửa thông tin sân bay | [TOSS.DM.AIRPORT_UPDATE.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_UPDATE.FD.v0.1.md) | 71 |
| AIRPORT_DELETE | Xóa sân bay | [TOSS.DM.AIRPORT_DELETE.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_DELETE.FD.v0.1.md) | 55 |
| AIRPORT_HISTORY | Xem lịch sử sân bay | [TOSS.DM.AIRPORT_HISTORY.FD.v0.1.md](TOSS.DM.AIRPORT/TOSS.DM.AIRPORT_HISTORY.FD.v0.1.md) | 67 |
| 20 | Quản lý chặng bay | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| 21 | Quản lý Tankering | *(nội dung dạng ảnh/sơ đồ — xem .docx gốc)* | — |
| PILOT_LIST | Xem danh sách Phi công | [TOSS.DM.PILOT_LIST.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_LIST.FD.v0.1.md) | 92 |
| PILOT_DETAIL | Xem chi tiết Phi công — Thông tin Phi công | [TOSS.DM.PILOT_DETAIL.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_DETAIL.FD.v0.1.md) | 89 |
| PILOT_HISTORY | Xem chi tiết Phi công — Lịch sử | [TOSS.DM.PILOT_HISTORY.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_HISTORY.FD.v0.1.md) | 65 |
| PILOT_EDIT_MANUAL | Sửa thông tin Phi công thủ công | [TOSS.DM.PILOT_EDIT_MANUAL.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_EDIT_MANUAL.FD.v0.1.md) | 62 |
| PILOT_EDIT_EXCEL | Sửa thông tin Phi công bằng excel | [TOSS.DM.PILOT_EDIT_EXCEL.FD.v0.1.md](TOSS.DM.PILOT/TOSS.DM.PILOT_EDIT_EXCEL.FD.v0.1.md) | 60 |
| ATTENDANT_LIST | Xem danh sách Tiếp viên | [TOSS.DM.ATTENDANT_LIST.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_LIST.FD.v0.1.md) | 88 |
| ATTENDANT_DETAIL | Xem chi tiết Tiếp viên — Thông tin Tiếp viên | [TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_DETAIL.FD.v0.1.md) | 88 |
| ATTENDANT_HISTORY | Xem chi tiết Tiếp viên — Lịch sử | [TOSS.DM.ATTENDANT_HISTORY.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_HISTORY.FD.v0.1.md) | 65 |
| ATTENDANT_EDIT_MANUAL | Sửa thông tin Tiếp viên thủ công | [TOSS.DM.ATTENDANT_EDIT_MANUAL.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_EDIT_MANUAL.FD.v0.1.md) | 62 |
| ATTENDANT_EDIT_EXCEL | Sửa thông tin Tiếp viên bằng excel | [TOSS.DM.ATTENDANT_EDIT_EXCEL.FD.v0.1.md](TOSS.DM.ATTENDANT/TOSS.DM.ATTENDANT_EDIT_EXCEL.FD.v0.1.md) | 55 |
| CARRIER_LIST | Xem danh sách Carrier | [TOSS.DM.CARRIER_LIST.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_LIST.FD.v0.1.md) | 74 |
| CARRIER_ADD_EDIT | Thêm mới/Sửa Carrier | [TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_ADD_EDIT.FD.v0.1.md) | 67 |
| CARRIER_DETAIL | Xem chi tiết Carrier | [TOSS.DM.CARRIER_DETAIL.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_DETAIL.FD.v0.1.md) | 62 |
| CARRIER_DELETE | Xóa Carrier | [TOSS.DM.CARRIER_DELETE.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_DELETE.FD.v0.1.md) | 62 |
| CARRIER_HISTORY | Xem lịch sử Carrier | [TOSS.DM.CARRIER_HISTORY.FD.v0.1.md](TOSS.DM.CARRIER/TOSS.DM.CARRIER_HISTORY.FD.v0.1.md) | 67 |
| COUNTRY_LIST | Xem danh sách Quốc gia | [TOSS.DM.COUNTRY_LIST.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_LIST.FD.v0.1.md) | 76 |
| COUNTRY_CREATE | Thêm mới Quốc gia | [TOSS.DM.COUNTRY_CREATE.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_CREATE.FD.v0.1.md) | 64 |
| COUNTRY_EDIT | Sửa Quốc gia | [TOSS.DM.COUNTRY_EDIT.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_EDIT.FD.v0.1.md) | 63 |
| COUNTRY_DELETE | Xóa Quốc gia | [TOSS.DM.COUNTRY_DELETE.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_DELETE.FD.v0.1.md) | 61 |
| COUNTRY_DETAIL | Xem chi tiết Quốc gia | [TOSS.DM.COUNTRY_DETAIL.FD.v0.1.md](TOSS.DM.COUNTRY/TOSS.DM.COUNTRY_DETAIL.FD.v0.1.md) | 61 |
| FIR_LIST | Xem danh sách FIR | [TOSS.DM.FIR_LIST.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_LIST.FD.v0.1.md) | 79 |
| FIR_CREATE | Thêm mới FIR | [TOSS.DM.FIR_CREATE.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_CREATE.FD.v0.1.md) | 70 |
| FIR_EDIT | Sửa FIR | [TOSS.DM.FIR_EDIT.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_EDIT.FD.v0.1.md) | 72 |
| FIR_DELETE | Xóa FIR | [TOSS.DM.FIR_DELETE.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_DELETE.FD.v0.1.md) | 61 |
| FIR_DETAIL | Xem chi tiết FIR | [TOSS.DM.FIR_DETAIL.FD.v0.1.md](TOSS.DM.FIR/TOSS.DM.FIR_DETAIL.FD.v0.1.md) | 68 |
| EMAIL_LIST | Xem danh sách Email | [TOSS.DM.EMAIL_LIST.FD.v0.1.md](TOSS.DM.EMAIL/TOSS.DM.EMAIL_LIST.FD.v0.1.md) | 69 |
| EMAIL_DETAIL | Xem chi tiết Email | [TOSS.DM.EMAIL_DETAIL.FD.v0.1.md](TOSS.DM.EMAIL/TOSS.DM.EMAIL_DETAIL.FD.v0.1.md) | 59 |
| EMAIL_ADD_EDIT | Thêm mới/Sửa Email | [TOSS.DM.EMAIL_ADD_EDIT.FD.v0.1.md](TOSS.DM.EMAIL/TOSS.DM.EMAIL_ADD_EDIT.FD.v0.1.md) | 67 |
| EMAIL_HISTORY | Xem lịch sử Email | [TOSS.DM.EMAIL_HISTORY.FD.v0.1.md](TOSS.DM.EMAIL/TOSS.DM.EMAIL_HISTORY.FD.v0.1.md) | 67 |
| ULD_TYPE_LIST | Xem danh sách loại ULD | [TOSS.DM.ULD_TYPE_LIST.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_LIST.FD.v0.1.md) | 73 |
| ULD_TYPE_CREATE | Thêm mới ULD Type | [TOSS.DM.ULD_TYPE_CREATE.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_CREATE.FD.v0.1.md) | 68 |
| ULD_TYPE_EDIT | Sửa ULD Type | [TOSS.DM.ULD_TYPE_EDIT.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_EDIT.FD.v0.1.md) | 66 |
| ULD_TYPE_DELETE | Xóa ULD Type | [TOSS.DM.ULD_TYPE_DELETE.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_DELETE.FD.v0.1.md) | 61 |
| ULD_TYPE_DETAIL | Xem chi tiết ULD Type | [TOSS.DM.ULD_TYPE_DETAIL.FD.v0.1.md](TOSS.DM.ULD_TYPE/TOSS.DM.ULD_TYPE_DETAIL.FD.v0.1.md) | 64 |
| ULD_LIST | Xem danh sách ULD | [TOSS.DM.ULD_LIST.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_LIST.FD.v0.1.md) | 75 |
| ULD_CREATE | Thêm mới ULD | [TOSS.DM.ULD_CREATE.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_CREATE.FD.v0.1.md) | 71 |
| ULD_EDIT | Sửa ULD | [TOSS.DM.ULD_EDIT.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_EDIT.FD.v0.1.md) | 67 |
| ULD_DELETE | Xóa ULD | [TOSS.DM.ULD_DELETE.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_DELETE.FD.v0.1.md) | 59 |
| ULD_DETAIL | Xem chi tiết ULD | [TOSS.DM.ULD_DETAIL.FD.v0.1.md](TOSS.DM.ULD/TOSS.DM.ULD_DETAIL.FD.v0.1.md) | 63 |
| SECTOR_LIST | Xem danh sách chặng bay | [TOSS.DM.SECTOR_LIST.FD.v0.1.md](TOSS.DM.SECTOR/TOSS.DM.SECTOR_LIST.FD.v0.1.md) | 79 |
| SECTOR_ADD_EDIT | Thêm mới/sửa chặng bay | [TOSS.DM.SECTOR_ADD_EDIT.FD.v0.1.md](TOSS.DM.SECTOR/TOSS.DM.SECTOR_ADD_EDIT.FD.v0.1.md) | 69 |
| SECTOR_DELETE | Xóa chặng bay | [TOSS.DM.SECTOR_DELETE.FD.v0.1.md](TOSS.DM.SECTOR/TOSS.DM.SECTOR_DELETE.FD.v0.1.md) | 62 |
| FLEET_LIST | Xem danh sách Đội bay | [TOSS.DM.FLEET_LIST.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_LIST.FD.v0.1.md) | 73 |
| FLEET_DETAIL | Xem chi tiết Đội bay | [TOSS.DM.FLEET_DETAIL.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_DETAIL.FD.v0.1.md) | 68 |
| FLEET_ADD_EDIT | Thêm/Sửa Đội bay | [TOSS.DM.FLEET_ADD_EDIT.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_ADD_EDIT.FD.v0.1.md) | 61 |
| FLEET_DELETE | Xoá Đội bay | [TOSS.DM.FLEET_DELETE.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_DELETE.FD.v0.1.md) | 61 |
| FLEET_HISTORY | Xem lịch sử Đội bay | [TOSS.DM.FLEET_HISTORY.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.FLEET_HISTORY.FD.v0.1.md) | 65 |
| AIRCRAFT_IN_FLEET_ADD_EDIT | Thêm/Sửa Tàu bay (trong Đội bay) | [TOSS.DM.AIRCRAFT_IN_FLEET_ADD_EDIT.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.AIRCRAFT_IN_FLEET_ADD_EDIT.FD.v0.1.md) | 63 |
| AIRCRAFT_IN_FLEET_DELETE | Xoá Tàu bay (trong Đội bay) | [TOSS.DM.AIRCRAFT_IN_FLEET_DELETE.FD.v0.1.md](TOSS.DM.FLEET/TOSS.DM.AIRCRAFT_IN_FLEET_DELETE.FD.v0.1.md) | 60 |
| AC_SUBTYPE (tổng quan nhóm) | Cấu trúc chung + quan hệ + mô tả dữ liệu tương tác giữa 3 Function Document nhóm AC Subtype | [TOSS.DM.AC_SUBTYPE.MD.v0.1.md](TOSS.DM.AC_SUBTYPE/TOSS.DM.AC_SUBTYPE.MD.v0.1.md) | 105 |
| AC_SUBTYPE_LIST | Xem danh sách AC Subtype | [TOSS.DM.AC_SUBTYPE_LIST.FD.v0.1.md](TOSS.DM.AC_SUBTYPE/TOSS.DM.AC_SUBTYPE_LIST.FD.v0.1.md) | 73 |
| AC_SUBTYPE_ADD_EDIT | Thêm mới/Sửa AC Subtype | [TOSS.DM.AC_SUBTYPE_ADD_EDIT.FD.v0.1.md](TOSS.DM.AC_SUBTYPE/TOSS.DM.AC_SUBTYPE_ADD_EDIT.FD.v0.1.md) | 64 |
| AC_SUBTYPE_DELETE | Xóa AC Subtype | [TOSS.DM.AC_SUBTYPE_DELETE.FD.v0.1.md](TOSS.DM.AC_SUBTYPE/TOSS.DM.AC_SUBTYPE_DELETE.FD.v0.1.md) | 57 |
| AIRCRAFT_LIST | Danh sách tàu bay | [TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_LIST.FD.v0.1.md) | 63 |
| AIRCRAFT_DETAIL_GENERAL | Xem chi tiết tàu bay — tab General Information | [TOSS.DM.AIRCRAFT_DETAIL_GENERAL.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_DETAIL_GENERAL.FD.v0.1.md) | 65 |
| AIRCRAFT_DETAIL_CONFIG | Xem chi tiết tàu bay — tab Aircraft Configuration | [TOSS.DM.AIRCRAFT_DETAIL_CONFIG.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_DETAIL_CONFIG.FD.v0.1.md) | 75 |
| AIRCRAFT_DETAIL_ATTRIBUTES | Xem chi tiết tàu bay — tab Group Attributes | [TOSS.DM.AIRCRAFT_DETAIL_ATTRIBUTES.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_DETAIL_ATTRIBUTES.FD.v0.1.md) | 60 |
| AIRCRAFT_EDIT_GENERAL | Sửa tàu bay — tab General Information | [TOSS.DM.AIRCRAFT_EDIT_GENERAL.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_EDIT_GENERAL.FD.v0.1.md) | 71 |
| AIRCRAFT_EDIT_CONFIG | Sửa tàu bay — tab Aircraft Configuration | [TOSS.DM.AIRCRAFT_EDIT_CONFIG.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_EDIT_CONFIG.FD.v0.1.md) | 91 |
| ACARS_FUEL_LIMIT_CREATE | Thêm mới ACARS Fuel Limit & Fuel Multiplier | [TOSS.DM.ACARS_FUEL_LIMIT_CREATE.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.ACARS_FUEL_LIMIT_CREATE.FD.v0.1.md) | 71 |
| ACARS_FUEL_LIMIT_DELETE | Xóa ACARS Fuel Limit & Fuel Multiplier | [TOSS.DM.ACARS_FUEL_LIMIT_DELETE.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.ACARS_FUEL_LIMIT_DELETE.FD.v0.1.md) | 69 |
| AIRCRAFT_EDIT_ATTRIBUTES | Sửa tàu bay — tab Group Attributes | [TOSS.DM.AIRCRAFT_EDIT_ATTRIBUTES.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_EDIT_ATTRIBUTES.FD.v0.1.md) | 72 |
| AIRCRAFT_HISTORY | Change History (Tàu bay) | [TOSS.DM.AIRCRAFT_HISTORY.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_HISTORY.FD.v0.1.md) | 79 |
| AIRCRAFT_SEARCH | Tìm kiếm tàu bay | [TOSS.DM.AIRCRAFT_SEARCH.FD.v0.1.md](TOSS.DM.AIRCRAFT/TOSS.DM.AIRCRAFT_SEARCH.FD.v0.1.md) | 67 |
| APU (tổng quan nhóm) | Cấu trúc chung + quan hệ + mô tả dữ liệu tương tác (state machine 4 trạng thái + 2 mã định danh) + prototype (Figma, để trống) giữa 5 Function Document nhóm APU INOP | [TOSS.DM.APU.MD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU.MD.v0.1.md) | 156 |
| APU_INOP_LIST | Danh sách khai báo APU INOP | [TOSS.DM.APU_INOP_LIST.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_LIST.FD.v0.1.md) | 115 |
| APU_INOP_CREATE | Tạo khai báo APU INOP | [TOSS.DM.APU_INOP_CREATE.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_CREATE.FD.v0.1.md) | 100 |
| APU_INOP_EDIT | Sửa khai báo APU INOP | [TOSS.DM.APU_INOP_EDIT.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_EDIT.FD.v0.1.md) | 101 |
| APU_INOP_DELETE | Xóa khai báo APU INOP | [TOSS.DM.APU_INOP_DELETE.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_DELETE.FD.v0.1.md) | 76 |
| APU_INOP_EXPORT | Xuất Excel danh sách APU INOP | [TOSS.DM.APU_INOP_EXPORT.FD.v0.1.md](TOSS.DM.APU/TOSS.DM.APU_INOP_EXPORT.FD.v0.1.md) | 97 |
