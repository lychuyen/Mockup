---
name: ba-workflow-patterns
description: Sáu luồng quy trình làm tài liệu BA (Tài liệu dẫn, Giao diện dẫn, Quy trình dẫn, Song song đồng tiến hóa, Câu chuyện dẫn, Use-Case dẫn) — phân tích chi tiết ưu/nhược và hướng dẫn lựa chọn. Tham chiếu để chọn luồng sản xuất tài liệu cho mỗi dự án.
source: Tổng hợp phương pháp — BABOK v3, Scrum Guide 2020, thực hành BPMN 2.0, use-case RUP/ICONIX, phân tích tư vấn 2026-06-03
version: "1.1"
date: "2026-06-03"
---

> Bản gốc (AGENTS scope, tiếng Anh): `.claude/knowledge/ba-workflow-patterns.md`. Đồng bộ theo [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md). Liên quan: [`bpmn-2.0-cheatsheet.md`](bpmn-2.0-cheatsheet.md), [`agile-scrum-vn.md`](agile-scrum-vn.md), [`babok-v3-summary.md`](babok-v3-summary.md).

# CÁC LUỒNG QUY TRÌNH LÀM TÀI LIỆU BA (bản tiếng Việt)

Năm luồng (pattern) dùng lại được để sắp thứ tự sản xuất các tài liệu phân tích/yêu cầu (BRD → phân tích → wireframe/mockup → SRS → kiểm thử). Dùng file này để **chọn và biện minh** luồng làm tài liệu cho từng dự án. Mỗi luồng nêu: trình tự, triết lý, đầu ra, ưu điểm, nhược điểm/rủi ro, điều kiện áp dụng, dấu hiệu nên chuyển luồng, và ghi chú quản trị (rủi ro "suy diễn/sáng tác" so với nguyên tắc *con người quyết định — agent tái hiện*).

| Mã | Luồng | Trình tự cốt lõi |
|---|---|---|
| P1 | Tài liệu dẫn (Spec-first / Waterfall) | BRD → SRS đầy đủ → wireframe → build → kiểm thử |
| P2 | Giao diện dẫn (Prototype-first) | BRD → wireframe/mockup → SRS suy từ prototype đã duyệt |
| P3 | Quy trình dẫn (Process/BPMN-led) | BRD → quy trình As-Is/To-Be → suy ra chức năng/dữ liệu/vai trò/màn → SRS + wireframe |
| P4 | Song song đồng tiến hóa (Co-evolution hybrid) | BRD → (phân rã chức năng + mô hình dữ liệu) ∥ (wireframe/mockup) → SRS + RTM |
| P5 | Câu chuyện dẫn (Story/Backlog-driven, Agile) | Vision → Epic → User Story + AC → wireframe just-in-time → giao tăng dần |
| P6 | Use-Case dẫn (UML / Unified Process) | BRD → Use Case + luồng nghiệp vụ → wireframe → SRS |

---

## P1 — Tài liệu dẫn (Spec-first / Waterfall)

- **Trình tự:** Vision/BRD → SRS/FRD hoàn chỉnh (nguồn chân lý duy nhất) → wireframe → build → kiểm thử.
- **Triết lý:** Chốt và ký duyệt đặc tả văn bản *trước khi* thiết kế/xây dựng; tài liệu chính là hợp đồng.
- **Đầu ra:** BRD, SRS/FRD đầy đủ, RTM.
- **Ưu điểm:** Tài liệu hình thức và cơ sở nghiệm thu/hợp đồng mạnh nhất; phủ tốt logic nghiệp vụ và phần không-giao-diện; truy vết rõ ngay từ đầu; dễ dự đoán khi phạm vi cố định; ít phụ thuộc độ trưởng thành của đội.
- **Nhược điểm:** Phản hồi đến **rất muộn** → thay đổi muộn rất đắt; người dùng khó kiểm chứng qua văn bản dài; giả định yêu cầu biết hết từ đầu; thời gian tới phản hồi dài.
- **Điều kiện áp dụng:** Phạm vi đóng băng; ít biến động; lĩnh vực pháp lý/an toàn; giao hàng theo hợp đồng.
- **Dấu hiệu nên chuyển luồng:** Nhiều yêu cầu thay đổi; người dùng không kiểm chứng được qua chữ; UI bất định cao → chuyển sang P3/P4.
- **Ghi chú quản trị:** Rủi ro "sáng tác" thấp *nếu* mọi dòng đặc tả có nguồn; mối nguy chính là **đặc tả trôi dạt không được kiểm chứng** (văn bản trông đầy đủ nhưng chưa ai xác nhận).

## P2 — Giao diện dẫn (Prototype-first)

- **Trình tự:** BRD → wireframe / mockup tương tác → SRS chép lại từ prototype đã duyệt.
- **Triết lý:** Prototype là công cụ khai thác & kiểm chứng yêu cầu — "cho xem, đừng kể."
- **Đầu ra:** Prototype/mockup bấm được trước; sau đó SRS có bảng thành phần map 1:1 với màn đã chốt.
- **Ưu điểm:** Phản hồi từ stakeholder nhanh nhất; lý tưởng khi UI là điều bất định chính; người dùng thiên hình ảnh dễ tham gia; đặc tả mức thành phần chính xác.
- **Nhược điểm:** **Mù phần không-giao-diện** (job nền, tích hợp, tính toán); **yếu về logic/nhánh ngoại lệ** mà màn hình không thể hiện; "chốt pixel quá sớm"; truy vết yếu; áp lực **sáng tác UI/hành vi** cao.
- **Điều kiện áp dụng:** UI là rủi ro chính; có người (designer/con người) sở hữu quyết định UI; logic phía sau nhẹ *hoặc* được nắm bắt riêng.
- **Dấu hiệu nên chuyển luồng:** Lộ ra luật nghiệp vụ ngầm; phạm vi không-UI phình ra; cần tài liệu nghiệm thu hình thức → nâng lên P4.
- **Ghi chú quản trị:** **Rủi ro sáng tác cao nhất.** Thành phần prototype BẮT BUỘC bám nguồn (tài liệu UI khách, khảo sát, biên bản); bố cục là *đề xuất chờ con người duyệt*, không phải quyết định của agent. Không dựng prototype cho phân hệ **không có nguồn UI**.

## P3 — Quy trình dẫn (Process/BPMN-led)

- **Trình tự:** BRD → mô hình quy trình As-Is và To-Be (BPMN) → suy ra chức năng, thực thể dữ liệu, vai trò, màn hình từ quy trình → SRS + wireframe.
- **Triết lý:** Quy trình nghiệp vụ (dòng tạo giá trị) là gốc; chức năng, dữ liệu, màn hình đều là *dẫn xuất* từ đó.
- **Đầu ra:** Sơ đồ As-Is/To-Be, phân rã chức năng, mô hình dữ liệu, rồi SRS.
- **Ưu điểm:** Phủ logic và **nhánh ngoại lệ** tốt nhất; bao phủ trọn phần không-UI; truy vết mạnh, neo vào quy trình; hợp tài liệu hình thức; về cấu trúc, **chống "hình/chữ trước khi chốt nghĩa."**
- **Nhược điểm:** Phản hồi *trực quan* chậm hơn; đòi kỹ năng mô hình hóa (BPMN) tốt; dễ sa đà mô hình hóa quá mức; kém trực quan với stakeholder thiên UI.
- **Điều kiện áp dụng:** Quy trình phức tạp, nhiều tác nhân, liên thông hệ thống; BA có độ chín về mô hình hóa.
- **Dấu hiệu nên chuyển luồng:** Quy trình đơn giản/chỉ CRUD (mô hình hóa thừa) → P1/P2; sản phẩm cần lặp UI nhanh → trộn với P2 (tức P4).
- **Ghi chú quản trị:** Rủi ro sáng tác thấp cho phần *dẫn xuất*, NHƯNG **thiết kế quy trình To-Be là trách nhiệm con người** — agent mô hình hóa To-Be do con người quyết và đánh dấu chỗ thiếu; không tự bịa quy trình "nên" rẽ nhánh ra sao.

## P4 — Song song đồng tiến hóa (Co-evolution hybrid) — KHUYẾN NGHỊ MẶC ĐỊNH

- **Trình tự:** BRD → (phân rã chức năng + mô hình dữ liệu, trên khung quy trình) **chạy song song với** (wireframe/mockup kiểm chứng sớm) → SRS + RTM + TC, có vòng phản hồi giữa hai nhánh.
- **Triết lý:** Lấy khung "nghĩa trước" của P3 cộng "kiểm chứng trực quan sớm" của P2, chạy đồng thời để không nhánh nào bị nhánh kia chặn.
- **Đầu ra:** Bản đồ quy trình/chức năng + mô hình dữ liệu + prototype sớm + SRS + RTM sống + kịch bản kiểm thử.
- **Ưu điểm:** **Chống rework tốt nhất**; vừa phản hồi sớm vừa phủ đủ; cân bằng mọi tiêu chí; vẫn ra được tài liệu hình thức cho nghiệm thu.
- **Nhược điểm:** Đòi phối hợp/kỷ luật; hai nhánh có thể lệch nhau nếu không đối chiếu; cần độ trưởng thành đội ở mức vừa.
- **Điều kiện áp dụng:** Có cơ chế đối chiếu (RTM / tài liệu đối chiếu); rõ người sở hữu từng nhánh; có quy tắc **nhánh trực quan không chạy trước nhánh phân rã** ở vùng thiếu nguồn.
- **Dấu hiệu nên chuyển luồng:** Phạm vi rất nhỏ/đơn giản (hybrid thành gánh nặng) → P1/P2; giao hàng lặp thuần túy → P5.
- **Ghi chú quản trị:** Rủi ro thấp khi thành phần có nguồn và vùng thiếu nguồn giữ spec-led; rào chắn then chốt là **ngăn nhánh trực quan sáng tác vượt trước phần phân rã có nguồn**.

## P5 — Câu chuyện dẫn (Story/Backlog-driven, Agile)

- **Trình tự:** Vision → Epic → User Story + Tiêu chí chấp nhận (Acceptance Criteria) → wireframe just-in-time → giao tăng dần.
- **Triết lý:** Tài liệu *vừa đủ, đúng lúc*; bản chạy được hơn là đặc tả toàn diện.
- **Đầu ra:** Product backlog; story kèm AC kiểm thử được; tài liệu sống mỏng; các bản phát hành tăng dần.
- **Ưu điểm:** Thời gian tới giá trị và khả năng thích ứng thay đổi tốt nhất; phản hồi liên tục; tính kiểm thử gắn sẵn trong AC.
- **Nhược điểm:** Yếu cho hợp đồng phạm vi cố định / nghiệm thu trọn gói trước; tài liệu hình thức rời rạc; phần xuyên suốt và phi chức năng dễ bị bỏ sót; cần đội Agile chín và Product Owner gắn kết.
- **Điều kiện áp dụng:** Mô hình giao hàng lặp; Product Owner có quyền; đội trưởng thành.
- **Dấu hiệu nên chuyển luồng:** Hợp đồng đòi SRS đầy đủ trước; nghiệm thu có kiểm soát pháp lý → P1/P3.
- **Ghi chú quản trị:** Story phải bám nguồn; AC phải kiểm thử được và do con người xác nhận; tránh sáng tác hành vi để "hoàn thiện" một story.

## P6 — Use-Case dẫn (UML / Unified Process)

- **Trình tự:** BRD → Use Case (actor–mục tiêu, kèm luồng chính/phụ/ngoại lệ) + luồng nghiệp vụ (activity/BPMN) → wireframe (suy từ use case) → SRS → kịch bản kiểm thử theo use case.
- **Triết lý:** "Hành vi trước" — mô hình hóa *hệ thống làm gì, cho ai* (use case) và *quy trình chảy ra sao* trước khi làm UI và đặc tả chi tiết; UI và SRS là dẫn xuất của hành vi đã chốt. Gốc rễ RUP / ICONIX / Unified Process.
- **Đầu ra:** Sơ đồ use case + đặc tả UC (luồng chính/phụ/ngoại lệ), sơ đồ luồng nghiệp vụ, rồi wireframe, rồi SRS, rồi TC theo use case.
- **Ưu điểm:** Phủ logic và **nhánh ngoại lệ** tốt nhất nhóm (luồng phụ/ngoại lệ là *nội dung bản chất* của use case); **truy vết đầu-cuối sạch nhất** (UC → wireframe → SRS chức năng → TC, RTM gần như tự nhiên); wireframe có căn cứ (suy từ hành vi UC đã xác nhận → không vẽ chay → tôn trọng Mục 0); rất hợp SRS hình thức (UC + luồng là nội dung chuẩn của SRS).
- **Nhược điểm:** Tuần tự (mô hình UC → wireframe → SRS) → phản hồi trực quan tới chậm hơn P2/P4; chi phí mô hình hóa và đòi kỹ năng UML/use-case (nặng với CRUD đơn giản; dễ "analysis paralysis"); **phần không có actor rõ ràng** (job nền, lịch chạy tự động, ingest IoT) gượng ép khi ép thành use case.
- **Điều kiện áp dụng:** Hệ nhiều hành vi, nhiều tác nhân, nhiều nhánh ngoại lệ; đội quen UML/use-case; cần SRS hình thức + nền tảng kiểm thử.
- **Dấu hiệu nên chuyển luồng:** CRUD đơn giản (thừa) → P1/P2; cần phản hồi UI cực nhanh → P2/P4; nhiều xử lý nền không-actor → P3 (process-led).
- **Ghi chú quản trị:** Use case chính là nơi chứa *"điều gì xảy ra khi một bước lỗi / luồng rẽ nhánh ra sao"* — mà Mục 0 giao cho **con người**. Luồng phụ/ngoại lệ BẮT BUỘC do con người quyết; agent chỉ phân rã kịch bản *đã ghi nhận* thành cấu trúc use case, không tự bịa nhánh. P6 cũng có thể chạy **trên khung song song của P4** (mô hình UC + luồng song song với wireframe) để lấy lại phản hồi trực quan sớm.

---

## So sánh có trọng số (best-practice tổng quát, thang 1–5; 5 = tốt nhất)

| Tiêu chí (trọng số) | P1 | P2 | P3 | P4 | P5 | P6 |
|---|:--:|:--:|:--:|:--:|:--:|:--:|
| Phát hiện yêu cầu sớm (×2) | 2 | 4 | 4 | 5 | 4 | 4 |
| Validate stakeholder trực quan (×2) | 2 | 5 | 3 | 5 | 4 | 4 |
| Phủ logic & nhánh ngoại lệ (×3) | 4 | 2 | 5 | 4 | 3 | 5 |
| Phủ phần không-UI (×2) | 4 | 1 | 5 | 4 | 3 | 4 |
| Chất lượng truy vết (×2) | 4 | 2 | 4 | 4 | 4 | 5 |
| Chống rework / chi phí thay đổi muộn (×3) | 2 | 3 | 4 | 5 | 5 | 4 |
| Thời gian tới phản hồi/demo (×2) | 1 | 5 | 3 | 4 | 5 | 3 |
| Phù hợp tài liệu hình thức (SRS/hợp đồng) (×2) | 5 | 2 | 5 | 4 | 2 | 5 |
| Chống "hình/chữ trước khi chốt nghĩa" (×2) | 3 | 1 | 5 | 4 | 3 | 5 |
| Ít phụ thuộc độ trưởng thành đội (×1) | 4 | 3 | 2 | 3 | 2 | 2 |
| **Điểm có trọng số (/105)** | **63** | **62** | **86** | **92** | **76** | **89** |

## Hướng dẫn lựa chọn

| Bối cảnh | Luồng nên dùng |
|---|---|
| Phạm vi cố định/hợp đồng, ít thay đổi, pháp lý chặt | P1 hoặc P3 |
| Sản phẩm mới, UI bất định, cần thử nghiệm UX | P2 (rồi nâng lên P4) |
| Nghiệp vụ phức tạp, nhiều tác nhân/liên thông hệ thống | **P3 / P4** |
| Nhiều hành vi & nhánh ngoại lệ, nghiệm thu theo use case | **P6** (có thể chạy trên khung song song P4) |
| Giao hàng lặp, đội Agile trưởng thành, PO gắn kết | P5 (+ RTM nhẹ) |
| Mặc định cho dự án BA doanh nghiệp có SRS hình thức | **P4 (với khung quy trình P3)** |

## Nguyên tắc bất biến (đúng cho mọi luồng)

1. **Mọi artefact truy vết về nguồn**; phân biệt *sự thật* với *suy luận cần xác nhận*.
2. **Validate sớm, validate thường** — không dồn toàn bộ phản hồi về cuối.
3. **Tách "cái gì/tại sao" (nghiệp vụ) khỏi "trông ra sao" (giao diện)** — chốt nghĩa trước khi chốt hình.
4. **Giữ RTM sống** xuyên suốt BR → FR → màn → TC.
5. **Con người quyết định và suy diễn; agent phân rã và tái hiện** (thiết kế To-Be, hành vi UI, lấp chỗ trống là trách nhiệm con người).
