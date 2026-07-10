> **Bản trích agent-đọc (chỉ text)** — Nguồn gốc: file `VNA.TOSS_SRS_Data Maintenance_v0.1.docx` cùng thư mục; bản trích không kèm hình ảnh (~356 hình minh họa màn hình — xem file .docx gốc). Trích bằng markitdown ngày 2026-07-02, nội dung giữ nguyên trung thực, không chỉnh sửa.

![D:\Picture\Logo\Viettel_logo_2021.svg.png](data:image/png;base64...)

**TẬP ĐOÀN CÔNG NGHIỆP - VIỄN THÔNG QUÂN ĐỘI VIETTEL**

**<VTIT>**

**BIỂU MẪU**

**TÀI LIỆU THIẾT KẾ CHI TIẾT**

Mã hiệu dự án: **VNA.FIMS**

Mã hiệu tài liệu: **VNA.FIMS\_SRS\_Data Maintenance\_v1.0**

<Hà Nội, 01/2026>

**BẢNG GHI NHẬN THAY ĐỔI TÀI LIỆU**

\*A – Tạo mới, M – Sửa đổi, D – Xóa bỏ

| Ngày  thay đổi | Vị trí  thay đổi | A\*  M, D | Nguồn gốc | Phiên  bản cũ | Mô tả thay đổi | Phiên  bản mới |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |

**TRANG KÝ**

Người lập: <Ngày>

<Chức danh>

Người xem xét: <Ngày>

<Chức danh>

Người xem xét: <Ngày>

<Chức danh>

Người phê duyệt: <Ngày>

<Chức danh>

**MỤC LỤC**

[**A - THÔNG TIN CHUNG 1**](#_heading=h.qfrorb2f7iq3)

[**1. GIỚI THIỆU 1**](#_heading=h.d6dp3icfd51v)

[1.1. Mục đích 1](#_heading=h.68o9myz7ea66)

[1.2. Phạm vi tài liệu 1](#_heading=h.rhoskemr3vc)

[1.3. Khái niệm, thuật ngữ 1](#_heading=h.hfs3rgqmtkap)

[**2. TỔNG QUAN GIẢI PHÁP 1**](#_heading=h.cjuxvoqmzp9b)

[2.1. Tổng quan chức năng 1](#_heading=h.3rm0k6b5a1h1)

[2.2. Mô hình giao tiếp với hệ thống/Module chức năng khác 1](#_heading=h.xu9661m7r3d9)

[**B - THIẾT KẾ CHI TIẾT 1**](#_heading=h.2vcn812ojh9f)

[**I - PHÂN HỆ QUẢN LÝ ĐIỀU HÀNH BAY\_FIMS 1**](#_heading=h.9lbkjwqojjnv)

[**1. FLIGHT PLAN 1**](#_heading=h.o7odefqj4378)

[1.1. Danh sách chuyến bay 1](#_heading=h.xowu2xd1mke1)

[1.2. Quản lý tài liệu CFP, NOTAM, WX, briefing package 1](#_heading=h.g2u76ds4rzof)

[1.3. Quản lý tài liệu LS, GD, PM, NOTOC Cargo, NOCTOC Baggage, Cargo Manifest, Mail Manifest 1](#_heading=h.g3cvtakkbgr2)

[1.4. Quản lý tải trọng 1](#_heading=h.96lco1dbvi1e)

[1.5. Quản lý Performance Factor 1](#_heading=h.f25ij6d2zaal)

[**II - PHÂN HỆ QUẢN LÝ DANH MỤC DÙNG CHUNG 1**](#_heading=h.gvd2685xm3yo)

[**1. QUẢN LÝ TÀU BAY 1**](#_heading=h.pmcaqyt4h5ff)

[1.1. Quản lý thông tin tàu bay 1](#_heading=h.31u4cjg38d1f)

[1.2. Quản lý AOC 1](#_heading=h.a5q57wh4unm9)

[1.3. Quản lý MEL/CDL 1](#_heading=h.cvc37qlg80o)

[**2. QUẢN LÝ SÂN BAY 1**](#_heading=h.ynt29shz92j0)

[2.1. Danh sách sân bay 1](#_heading=h.24o24fg)

[2.1.1. Sơ đồ luồng hệ thống 1](#_heading=h.jtcen9)

[2.1.2. Mô tả luồng xử lý 1](#_heading=h.33szxb2)

[2.1.3. Màn hình chức năng 1](#_heading=h.1iya7iv)

[2.1.4. Mô tả chi tiết màn hình danh sách 1](#_heading=h.42xxq6o)

[2.2. Xem chi tiết sân bay 1](#_heading=h.2i380eh)

[2.2.1. Sơ đồ luồng hệ thống 1](#_heading=h.x8iama)

[2.2.2. Mô tả luồng xử lý 1](#_heading=h.3h85ta3)

[2.2.3. Màn hình chức năng 1](#_heading=h.1wdg3hw)

[2.2.4. Mô tả chi tiết màn hình danh sách 1](#_heading=h.4gd3m5p)

[2.3. Thêm mới sân bay 1](#_heading=h.k16penfd7wif)

[2.3.1. Sơ đồ luồng hệ thống 1](#_heading=h.liujb1qy3u66)

[2.3.2. Mô tả luồng xử lý 1](#_heading=h.mvwko5yabd20)

[2.3.3. Màn hình chức năng 1](#_heading=h.nkfeler9ellf)

[2.3.4. Mô tả chi tiết màn hình 1](#_heading=h.j5lwan3y6cyj)

[2.4. Sửa thông tin sân bay 1](#_heading=h.2vidwdi)

[2.4.1. Sơ đồ luồng hệ thống 1](#_heading=h.1ano6lb)

[2.4.2. Mô tả luồng xử lý 1](#_heading=h.3unbp94)

[2.4.3. Màn hình chức năng 1](#_heading=h.29slzgx)

[2.4.4. Mô tả chi tiết màn hình danh sách 1](#_heading=h.oxw9oq)

[2.5. Xóa sân bay 1](#_heading=h.7gzlf0azvncu)

[2.5.1. Sơ đồ luồng hệ thống 1](#_heading=h.c4rvkrq759w)

[2.5.2. Mô tả luồng xử lý 1](#_heading=h.4f7npyz6j37j)

[2.5.3. Màn hình chức năng 1](#_heading=h.8h7gjrwyoxkn)

[2.5.4. Mô tả chi tiết màn hình 1](#_heading=h.tpugke40zhfg)

[2.6. Xem lịch sử sân bay 1](#_heading=h.38xjscj)

[2.6.1. Sơ đồ luồng hệ thống 1](#_heading=h.1o2u2kc)

[2.6.2. Mô tả luồng xử lý 1](#_heading=h.482hl85)

[2.6.3. Màn hình chức năng 1](#_heading=h.2n7rvfy)

[2.6.4. Mô tả chi tiết màn hình 1](#_heading=h.12d25nr)

[**3. QUẢN LÝ CHẶNG BAY 1**](#_heading=h.8gb5afbzokog)

[3.1. Quản lý chặng bay 1](#_heading=h.z1y5erej4cc9)

[3.2. Quản lý Tankering 1](#_heading=h.uj4h3f8svpsu)

[**4. BÁO CÁO 1**](#_heading=h.glull6fbbqvn)

[**5. DANH MỤC DÙNG CHUNG 1**](#_heading=h.copx7n208dwv)

[5.1. Quản lý danh mục Phi công 1](#_heading=h.qk3j7ybizmut)

[5.1.1. Danh sách phi công 1](#_heading=h.2nof3ry)

[5.1.2. Xem chi tiết Phi công\_Thông tin Phi công 1](#_heading=h.x0r6jxnisxbn)

[5.1.3. Xem chi tiết Phi công\_Lịch sử 1](#_heading=h.8ezlv2s0vrbj)

[5.1.4. Sửa thông tin Phi công thủ công 1](#_heading=h.lcnuztu2u3nz)

[5.1.5. Sửa thông tin Phi công bằng excel 1](#_heading=h.t1d23gidgsfn)

[5.2. Quản lý danh mục Tiếp viên 1](#_heading=h.e8qvqpvuxkh6)

[5.2.1. Xem danh sách Tiếp viên 1](#_heading=h.g80gi2ymlzxc)

[5.2.2. Xem chi tiết Tiếp viên\_Thông tin Tiếp viên 1](#_heading=h.wog7ccz2ydjv)

[5.2.3. Xem chi tiết Tiếp viên\_Lịch sử 1](#_heading=h.r7enfjoet7id)

[5.2.4. Sửa thông tin Tiếp viên thủ công 1](#_heading=h.jxmclfcm4zz4)

[5.2.5. Sửa thông tin Tiếp viên bằng excel 1](#_heading=h.80j4l3uuqpfk)

[5.3. Quản lý danh mục Carrier 1](#_heading=h.588ipmgsq6w7)

[5.3.1. Xem danh sách Carrier 1](#_heading=h.3abhhcj)

[5.3.2. Thêm mới/Sửa Carrier 1](#_heading=h.5awp0vq4vijo)

[5.3.3. Xem chi tiết Carrier 1](#_heading=h.2gldjl3)

[5.3.4. Xóa Carrier 1](#_heading=h.37fpbj5)

[5.3.5. Xem lịch sử Carrier 1](#_heading=h.3kuv7i6)

[5.4. Quản lý danh mục Quốc gia 1](#_heading=h.vcrzkd30idup)

[5.4.1. Xem danh sách Quốc gia 1](#_heading=h.ii6rqzlq7hju)

[5.4.2. Thêm mới Quốc gia 1](#_heading=h.fnsv6wwkiz0b)

[5.4.3. Sửa Quốc gia 1](#_heading=h.jpmq6enmw4i)

[5.4.4. Xóa Quốc gia 1](#_heading=h.n4cspz7j7nir)

[5.4.5. Xem chi tiết Quốc gia 1](#_heading=h.9p3lycf331bk)

[5.5. Quản lý danh mục FIR 1](#_heading=h.1hxvlq6w9u0e)

[5.5.1. Xem danh sách FIR 1](#_heading=h.ellbem2iqfav)

[5.5.3. Mô tả luồng xử lý 1](#_heading=h.va0bwwjfdzz6)

[5.5.4. Màn hình chức năng 1](#_heading=h.4g9fuvdwnvxv)

[5.5.5. Mô tả chi tiết màn hình 1](#_heading=h.1a78938ldpez)

[5.6. Thêm mới FIR 1](#_heading=h.n4pu8oi3344k)

[5.6.1. Sơ đồ luồng hệ thống 1](#_heading=h.boa2eyr2kss0)

[5.6.2. Mô tả luồng xử lý 1](#_heading=h.7kxw17hrjvm8)

[5.6.3. Màn hình chức năng 1](#_heading=h.tzxcx0yb11qu)

[5.6.4. Mô tả chi tiết màn hình 1](#_heading=h.rkylkcjxidy3)

[5.7. Sửa FIR 1](#_heading=h.xymigcnf0ima)

[5.7.1. Sơ đồ luồng hệ thống 1](#_heading=h.pozgh8fqgkhy)

[5.7.2. Mô tả luồng xử lý 1](#_heading=h.iu5n5yb139r1)

[5.7.3. Màn hình chức năng 1](#_heading=h.9gt5c5xcuzxb)

[5.7.4. Mô tả chi tiết màn hình 1](#_heading=h.s57nhzc1lgay)

[5.8. Xóa FIR 1](#_heading=h.6keikajj4769)

[5.8.1. Sơ đồ luồng hệ thống 1](#_heading=h.irt3ot44o9mc)

[5.8.2. Mô tả luồng xử lý 1](#_heading=h.81oq5l9j5adj)

[5.8.3. Màn hình chức năng 1](#_heading=h.1b4c723sr6yc)

[5.8.4. Mô tả chi tiết màn hình 1](#_heading=h.9zl7ksrdea7x)

[5.9. Xem chi tiết FIR 1](#_heading=h.irg5jo3azg11)

[5.9.1. Sơ đồ luồng hệ thống 1](#_heading=h.lt9b1w9izbz)

[5.9.2. Mô tả luồng xử lý 1](#_heading=h.9c7rdyoglfwf)

[5.9.3. Màn hình chức năng 1](#_heading=h.xcwkayqcoj89)

[5.9.4. Mô tả chi tiết màn hình 1](#_heading=h.oxx0l3vwx172)

[5.10. Quản lý danh sách email 1](#_heading=h.ibawn6z5ifxn)

[5.10.1. Xem danh sách Email 1](#_heading=h.8sm2dmbo4ag0)

[5.10.2. Xem chi tiết Email 1](#_heading=h.x8izeibbptw9)

[5.10.3. Thêm mới/Sửa Email 1](#_heading=h.rby1tqbem5iz)

[5.10.4. Xem lịch sử Email 1](#_heading=h.bq0kf2lwoyd3)

[5.11. Quản lý danh mục loại ULD 1](#_heading=h.65m8f1tnbtap)

[5.11.1. Xem danh sách loại ULD 1](#_heading=h.9etvfg2xi57t)

[5.11.2. Thêm mới ULD type 1](#_heading=h.yrl3vynht1sf)

[5.11.3. Sửa ULD Type 1](#_heading=h.1rkebhx8ciwi)

[5.11.4. Xóa ULD Type 1](#_heading=h.xniw283g3neu)

[5.11.5. Xem chi tiết ULD Type 1](#_heading=h.c2d2iotl5m70)

[5.12. Quản lý danh mục ULD 1](#_heading=h.2pl9nmb3bpk8)

[5.12.1. Xem danh sách ULD 1](#_heading=h.z1daxz6tpx45)

[5.12.2. Thêm mới ULD 1](#_heading=h.4zizm1xky4qu)

[5.12.3. Sửa ULD 1](#_heading=h.nasrc390bc38)

[5.12.4. Xóa ULD 1](#_heading=h.xkwnv3yjpvm3)

[5.12.5. Xem chi tiết ULD 1](#_heading=h.yqaavjobzli6)

[5.13. Quản lý danh mục chặng bay 1](#_heading=h.inv6ohehsfmh)

[5.13.1. Xem danh sách chặng bay 1](#_heading=h.wmwh2w6qvt5w)

[5.13.2. Thêm mới/sửa chặng bay 1](#_heading=h.w6k0yrxjucyd)

[5.13.3. Xóa chặng bay 1](#_heading=h.x6wzclz4xw3p)

[5.14. Quản lý danh mục đội bay 1](#_heading=h.k5mmlb998t3x)

[5.14.1. Xem danh sách Đội bay 1](#_heading=h.67gvi0xf1c82)

[5.14.2. Xem chi tiết Đội bay 1](#_heading=h.2s92ax7b0fta)

[5.14.3. Thêm/Sửa Đội bay 1](#_heading=h.shodkvy17imw)

[5.14.4. Xoá Đội bay 1](#_heading=h.nybcffb2cq7p)

[5.14.5. Xem lịch sử Đội bay 1](#_heading=h.wenpfhs05ke9)

[5.14.6. Thêm/Sửa Tàu bay 1](#_heading=h.bwz9z1y6agf5)

[5.14.7. Xoá Tàu bay 1](#_heading=h.ke4ex76kg9zc)

[5.15. Quản lý danh mục AC Subtype 1](#_heading=h.rc78cf3y44nz)

[5.15.1. Xem danh sách AC Subtype 1](#_heading=h.q301q8tf90ee)

[5.15.2. Thêm mới / Sửa AC Subtype 1](#_heading=h.4jd52y1mbeqn)

[5.15.3. Xóa AC Subtype 1](#_heading=h.7khd4ngkhql4)

[5.16. Quản lý Tàu bay 1](#_heading=h.uil7kql6ktha)

[5.16.1. Danh sách tàu bay 1](#_heading=h.8mxtgddci6tj)

[5.16.2. Xem chi tiết tàu bay - tab General Information 1](#_heading=h.tdtrk15hmuji)

[5.16.3. Xem chi tiết tàu bay - tab Aircraft Configuration 1](#_heading=h.wvpdlsk8ixh7)

[5.16.4. Xem chi tiết tàu bay - tab Group Attributes 1](#_heading=h.3goyunync91l)

[5.16.5. Sửa chi tiết tàu bay - tab General Information 1](#_heading=h.bxsu4wm99fbi)

[5.16.6. Sửa chi tiết tàu bay - tab Aircraft Configuration 1](#_heading=h.uo9ojn691h74)

[5.16.7. Thêm mới ACARS Fuel Limit & Fuel Multiplier - tab Aircraft Configuration 1](#_heading=h.dd43fnxzc6ia)

[5.16.8. Xóa ACARS Fuel Limit & Fuel Multiplier - tab Aircraft Configuration 1](#_heading=h.wt8xkiprmsv1)

[5.16.9. Sửa chi tiết tàu bay - tab Group Attributes 1](#_heading=h.35uuh5i2d3jg)

[5.16.10. Change History 1](#_heading=h.gar75u38fkv1)

[5.16.11. Tìm kiếm tàu bay 1](#_heading=h.6htl0v60vjj2)

#

#

#

#

#

# A - THÔNG TIN CHUNG

# GIỚI THIỆU

Tài liệu mô tả chi tiết các quy trình nghiệp vụ và đặc tả chức năng yêu cầu của hệ thống FIMS
