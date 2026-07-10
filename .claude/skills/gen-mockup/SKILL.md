---
name: gen-mockup
description: Dựng MOCKUP (blueprint tĩnh) hoặc PROTOTYPE (bản tương tác clickable) giao diện HTML TỰ CHỨA (offline), TUÂN THỦ Angular Material (mỗi element map 1:1 sang component trong catalog angular-material-components.md) + chú thích component để DEV implement trung thực. Dùng khi người dùng muốn "tạo mockup", "dựng mockup", "prototype", "demo màn hình", "bản tương tác", "gen mockup".
metadata:
  version: "1.1.0"
---

# Skill: Gen Mockup (giao diện tuân thủ Angular Material)

Sinh **mockup HTML tự chứa** (mở bằng trình duyệt, không cần internet/build) để validate giao diện sớm với khách/BA — **trình bày theo Material 3** và **chú thích component Material** cho mỗi vùng, để DEV implement đúng thư viện.

> **Phân biệt với code:** mockup/prototype = bản mẫu *trực quan để duyệt* (đặt ở `ba/process/mockup/`). KHÁC với code thật (skill `gen-*` sinh Angular vào `dev/`). Không phải code chạy được, là *bản thiết kế có chú thích*.

## Hai mức độ (fidelity) — chọn theo nhu cầu

| Mức | Là gì | Khi nào | File |
|---|---|---|---|
| **Mockup** (tĩnh) | Blueprint: bố cục + thành phần + chú thích component. Tương tác tối thiểu (đổi màn, mở popup). | Duyệt bố cục/đủ trường, làm nhanh nhiều màn. | `<màn>-mockup.html` |
| **Prototype** (tương tác) | Clickable: **mô phỏng luồng nghiệp vụ** — chuyển trạng thái, điều kiện ẩn/hiện, validation, list↔chi tiết, mô phỏng hệ ngoài (vd Voffice duyệt). | Demo end-to-end cho khách, kiểm chứng UX luồng trước khi code. | `<màn>-prototype.html` |

> Prototype = mockup **+ hành vi luồng**. Cùng tuân thủ §0 + map Material; chỉ khác: prototype hiện **thêm tương tác mô phỏng**.

### Quy tắc riêng cho PROTOTYPE
- **Chỉ mô phỏng luồng CÓ TRONG NGUỒN** (mục "Luồng nghiệp vụ" của SRS + ký hiệu trạng thái trong wireframe). Không tự nghĩ ra bước/nhánh mới (§0).
- **State machine = đúng tập trạng thái nguồn** (vd Lệnh: Chờ duyệt→Đang duyệt→Đã duyệt/Từ chối; Phiếu nhập: Chờ kiểm định→Đã nhập kho/Đã hủy).
- **Hệ thống ngoài** (Voffice duyệt, đọc QR…) → **mô phỏng** bằng nút "(giả lập)" có nhãn rõ + ghi chú "demo — thực tế do <hệ> xử lý". Không giả vờ là thật.
- **Điều kiện ẩn/hiện & validation** lấy đúng từ rule nguồn (vd Loại nhập=Thành phẩm → disable NCC `[UI:I.1]`).
- JS thuần, tự chứa; mỗi bước luồng vẫn gắn `data-src`. Banner ghi rõ "PROTOTYPE — tương tác mô phỏng, dữ liệu mẫu".

## Tuân thủ (BẮT BUỘC — CLAUDE.md §0)

- **Chỉ vẽ element có trong nguồn** (SRS `ba/process/srs/`, wireframe `ba/process/wireframe/`, `[MT]/[PR]/[UI]/[BB]`). Trường/nhãn/trạng thái/nút **lấy từ nguồn**, có dẫn chiếu.
- **Bố cục/màu là đề xuất cần con người (BA/UI) duyệt** — ghi rõ trong header.
- **Số liệu là dữ liệu mẫu** — đánh dấu rõ.
- Element không có component Material tương ứng → ghi `(custom / cần bổ sung)` + flag, **không bịa**.

## Đầu vào

1. Đặc tả màn: `ba/process/srs/<phân hệ>` (mục Màn hình + Mô tả thành phần + Luồng).
2. Wireframe: `ba/process/wireframe/<wf>` (bố cục low-fidelity đã duyệt).
3. **Catalog component:** [`.claude/knowledge/angular-material-components.md`](../../knowledge/angular-material-components.md) — chọn đúng component cho mỗi element (bảng "UI need → Material component").
4. Design system: `ba/process/srs/08-design-system.md` (palette, typography, density). Nếu chưa có giá trị → dùng token mặc định của template, đánh dấu `TBD`.

## Quy trình

1. **Đọc nguồn** → liệt kê các màn cần dựng + các element mỗi màn (kèm dẫn nguồn).
2. **Map mỗi element → component Material** (tra catalog). Lập "component map" (element → `mat-*` + nguồn).
3. **Copy template** `assets/material3-base.html` làm khung (đã có M3 tokens + Material Symbols + sẵn các pattern: toolbar, sidenav, card, form-field, table, button, dialog, chip…).
4. **Dựng từng màn** trong khung: dùng các pattern Material 3 có sẵn; **mỗi vùng gắn `data-mat="<mat-component>"`** (chú thích map) + `data-src="[nguồn]"`.
5. **Áp design-system:** primary seed = màu thương hiệu (Viettel đỏ `#EE0033` mặc định) đưa vào M3 color-role; density + typography theo design-system.
6. **Chèn header comment** (theo mẫu mockup hiện có): nêu §0, nguồn, "số liệu mẫu", "bố cục cần duyệt".
7. **Legend cuối trang:** bảng liệt kê mọi `data-mat` đã dùng → tên component Material + link docs, để DEV tra nhanh.

## Đầu ra

- File: `ba/process/mockup/<phân-hệ-hoặc-màn>-mockup.html` (kebab-case, không dấu).
- **Tự chứa:** CSS inline; icon dùng Material Symbols (CDN + ghi chú offline: nếu mạng nội bộ chặn, nhúng font hoặc dùng SVG inline) — phù hợp ràng buộc mạng local `[BB14 mục 6]`.
- **Tiếng Việt** cho mọi nhãn (ngôn ngữ end-user).
- **Responsive** tối thiểu: desktop + 1 breakpoint (theo CDK Layout note trong catalog).

## Quy ước chú thích (điểm cốt lõi)

```html
<!-- mỗi vùng UI: data-mat = component Material, data-src = nguồn -->
<div data-mat="mat-form-field(outline)+matInput" data-src="[MT II.2] SRS 3.2">
  <label>Số lệnh sản xuất</label><input ... />
</div>
```

→ Mockup vừa để khách duyệt *trực quan*, vừa là *blueprint* chỉ rõ DEV phải dùng component nào (khớp `gen-*`).

## Nguyên tắc UX (tham khảo — [`ux-knowledge-synthesis.md`](../../knowledge/ux-knowledge-synthesis.md))

Áp dụng có chọn lọc cho dashboard điều hành mật độ cao của TOSS. KHÔNG ghi đè §0: mọi element vẫn phải có nguồn.

- **Wide-but-shallow** [U1]: ưu tiên dựng **rộng** toàn bộ điều hướng chính ở fidelity thấp (placeholder), chỉ tăng chi tiết ở màn/feature mà nguồn yêu cầu test. Đừng dồn công 1 màn mà bỏ trống bối cảnh.
- **Xử lý biên (boundary)** [U1]: mọi nút/link trỏ ra ngoài phạm vi đã dựng phải có **placeholder gắn nhãn rõ** (vd "[Màn Phân công tổ bay — chưa dựng]") + cờ `[cần xác nhận]` nếu nguồn thiếu. Không để dead-end làm "vỡ" prototype.
- **Ưu tiên theo RỦI RO** [U4]: dựng trước các màn **nhập/xử lý dữ liệu nghiệp vụ** (dispatch release, nhập MEL, lập roster, ghi BCAO/diversion); màn chỉ-đọc/tra cứu tĩnh ưu tiên thấp.
- **Dữ liệu mẫu thực tế** [U1]: dùng dữ liệu đúng domain (số hiệu chuyến VN###, mã ICAO sân bay, registration tàu bay, mốc giờ UTC) thay vì lorem ipsum — tăng độ thuyết phục khi demo với VNA. Vẫn đánh dấu "dữ liệu mẫu".
- **Dashboard realtime** [U2]: **Doherty (<400ms)** — mọi tải bảng/realtime có skeleton/spinner/progress, tránh nhảy layout; **Tesler** — progressive disclosure (accordion/drawer/hover) cho chi tiết phụ, hệ thống pre-fill thay người; **Von Restorff** — cảnh báo nguy cấp (AOG, conflict, MEL hết hạn) nổi bằng **màu + icon + hình** (không chỉ màu; đạt tương phản WCAG), dùng tiết kiệm; **Fitts** — nút release/confirm đủ lớn, destructive tách xa; **Miller** — chunk bảng dày bằng nhóm cột/divider/header, không cắt mục vô lý.
- **Annotation 3 nhóm** [U4]: ngoài `data-mat`/`data-src`, chú thích thêm khi liên quan — (a) ràng buộc không thương lượng (CAAV/ICAO/FTL), (b) nice-to-have để version sau, (c) hạng mục tốn kém/rủi ro kỹ thuật cần bàn effort. Đây là cách neo `[cần xác nhận]` của OID lên đúng phần UI.
- **Fidelity theo mục đích** [U1,U4]: giai đoạn làm rõ yêu cầu (P4 discovery) giữ **low/medium**; chỉ hi-fi khi validate cuối — tránh stakeholder nhầm prototype là sản phẩm thật. Mockup KHÔNG dùng để kết luận accessibility/hiệu năng/tác động visual định lượng.

## QC trước khi bàn giao

- [ ] Mở được bằng trình duyệt, không lỗi console, không cần internet (hoặc đã ghi chú font).
- [ ] Mọi element có `data-mat` map về catalog (không có component "lạ" ngoài catalog; nếu có → `(custom)` + flag).
- [ ] Mọi trường/nhãn có `data-src` dẫn nguồn; số liệu đánh dấu mẫu.
- [ ] Header comment đủ: §0 + nguồn + "bố cục cần duyệt".
- [ ] Legend liệt kê đủ component đã dùng.

## Liên kết
- Catalog: [`angular-material-components.md`](../../knowledge/angular-material-components.md)
- Wireframe nguồn: `ba/process/wireframe/`
- Sau khi duyệt → DEV dùng `gen-feature`/`gen-component` sinh code Angular tương ứng vào `dev/`.
