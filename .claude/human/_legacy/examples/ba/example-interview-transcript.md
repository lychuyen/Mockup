---
example_type: "Stakeholder interview transcript — BA × Product Owner"
based_on_template: ".claude/templates/ba/meeting-minutes-template.md"
domain: "Meeting Room Booking — Recurring Booking feature"
purpose: "Few-shot reference for business-analyst agent — open-ended Q&A style + marginal analysis notes"
version: "1.0"
date: "2026-05-26"
---

> **Ví dụ few-shot dành cho agent `business-analyst`.** Biên bản phỏng vấn mô phỏng giữa BA và Product Owner. Minh họa câu hỏi mở (5 Whys, laddering), lắng nghe chủ động, và ghi chú bên lề của BA (italic trong blockquote `>`) suy ra nhu cầu từ câu trả lời thô. Bản canonical (AGENTS scope) tại `.claude/examples/ba/example-interview-transcript.md`. Đồng bộ theo [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md).

# Biên bản Phỏng vấn — Product Owner về Feature "Đặt phòng Định kỳ"

## Thông tin phỏng vấn

| Trường | Giá trị |
|---|---|
| **Mã biên bản** | MM-20260512-001 |
| **Ngày** | 2026-05-12 |
| **Giờ** | 09:00 – 09:55 (55 phút) |
| **Địa điểm** | Phòng họp B3, Tầng 5 |
| **Người phỏng vấn (BA)** | Nguyễn Thị B |
| **Người được phỏng vấn (PO)** | Lê Minh A — Product Owner module MRB |
| **Mục tiêu** | Hiểu rõ yêu cầu cho feature "Đặt phòng định kỳ" (recurring booking) — phạm vi, edge case, ưu tiên |
| **Tài liệu kèm theo** | Phụ lục: bảng câu hỏi chuẩn bị trước |

---

## Nội dung

### Khởi động (Warm-up) — 5 phút

**[BA]** Chào anh Minh, cảm ơn anh đã dành thời gian. Anh có thể giới thiệu một chút về vai trò hiện tại và một ngày làm việc điển hình của anh không?

**[PO]** Tôi là Product Owner module MRB này được khoảng 4 tháng rồi. Trước đó tôi làm PM cho dự án CRM nội bộ. Một ngày bình thường tôi review backlog buổi sáng, họp với đội dev buổi sáng muộn, chiều thì gặp stakeholder — chủ yếu là Trưởng phòng Hành chính và lễ tân — để thu thập feedback và làm rõ requirement.

> *[BA note]* PO có nền tảng PM, hiểu Agile. Có thể đi sâu kỹ thuật mà không cần giải thích cơ bản. Đầu mối chính cho stakeholder là HC + lễ tân.

**[BA]** Trong vòng 1 tuần vừa qua, có vấn đề gì khiến anh thực sự đau đầu không?

**[PO]** Có. Anh Trí — Trưởng phòng Marketing — gửi email phàn nàn vì mỗi tuần phải đặt thủ công cùng một slot phòng họp với agency. Anh ấy hỏi sao chưa có "đặt định kỳ" như Outlook. Tôi cũng đã thấy 2–3 stakeholder khác hỏi việc này từ tháng trước.

> *[BA note]* Pain point được khẳng định bởi ít nhất 3 stakeholder → đủ cường độ để ưu tiên. Mức tham chiếu là Outlook (đã có recurring), tức là kỳ vọng đã có sẵn.

---

### Khai thác nhu cầu (Discovery) — 25 phút

**[BA]** Anh có thể mô tả chi tiết hơn về case của anh Trí — cụ thể anh ấy đặt định kỳ như thế nào trong Outlook hiện tại, và vì sao chưa hài lòng với cách đó?

**[PO]** Anh Trí đặt qua Outlook calendar cuộc họp hằng tuần với agency: thứ Hai, 9:00–10:00, lặp 12 tuần. Outlook tạo 12 entry nhưng không "giữ" phòng họp — vì hệ thống đặt phòng MRB của mình chỉ nhận đặt từng lần qua giao diện web/mobile. Nên anh ấy phải vào MRB đặt thủ công 12 lần, một-một.

**[BA]** Tại sao anh ấy không thể đặt 12 lần một lượt qua công cụ hiện tại?

**[PO]** Vì MRB hiện tại chỉ có form đặt 1 lần. Mỗi lần đặt mất khoảng 90 giây.

**[BA]** *(5 Whys — Why #2)* Vì sao 90 giây × 12 lần = 18 phút lại là vấn đề lớn? Anh ấy có thể làm 1 lần đầu quý, đỡ phải lo cả quý.

**[PO]** Đúng là 18 phút không quá nhiều. Nhưng vấn đề là nếu anh Trí quên không đặt trước, thì phòng yêu thích sẽ bị người khác đặt mất. Đã có 2 lần cuộc họp với agency phải đổi sang phòng nhỏ hơn vì anh Trí quên.

> *[BA note]* Vấn đề thực không phải là "tốn thời gian" mà là "rủi ro mất slot". Đào sâu hướng này.

**[BA]** *(Why #3 — laddering up)* Vậy nếu mình giải quyết được rủi ro mất slot, thì giá trị thực sự mang lại cho anh Trí là gì?

**[PO]** Anh Trí có thể yên tâm rằng các cuộc họp định kỳ luôn diễn ra tại phòng quen thuộc, không bị xáo trộn. Agency cũng quen với địa điểm và setup phòng đó. Giảm stress và không phải báo lại agency mỗi lần phải đổi phòng.

> *[BA note]* Giá trị thực: **predictability + reputation với đối tác bên ngoài**. Không chỉ là tiết kiệm thời gian. Đây là material cho phần "Why" của user story.

**[BA]** Câu hỏi tiếp — anh hình dung "đặt định kỳ" trong MRB sẽ trông như thế nào? Có giống Outlook không, hay khác?

**[PO]** Tôi nghĩ giống Outlook về mặt chu kỳ — hằng tuần, hằng tháng, hằng năm — nhưng phải xử lý được trường hợp xung đột. Trong Outlook, nếu có 1 cuộc đã đặt vào slot đó từ trước, thì Outlook vẫn tạo entry nhưng không cảnh báo. Mình thì phải khác.

**[BA]** Anh có thể cho ví dụ cụ thể về trường hợp xung đột?

**[PO]** Giả sử anh Trí đặt 12 thứ Hai, 9:00–10:00, phòng B5. Nhưng tuần thứ 5 trùng với "Ngày Quốc khánh" — hôm đó không họp. Hoặc tuần thứ 8 phòng B5 đã có người đặt rồi. Hệ thống phải xử lý 2 case này khác nhau.

**[BA]** *(Hỏi tiếp về thiết kế UX)* Anh nghĩ khi xảy ra xung đột thì hệ thống nên làm gì? Hủy bỏ toàn bộ, hay tạo những entry không xung đột?

**[PO]** Tạo entry không xung đột thôi, rồi báo cho anh Trí biết các tuần bị bỏ qua. Để anh ấy tự đặt lại sau hoặc chọn phòng khác cho tuần đó.

> *[BA note]* Đây sẽ là một AC quan trọng: partial success + transparent reporting. Tạo lưu ý để viết riêng AC này khi soạn user story.

**[BA]** Anh có chắc về "12 tuần" không? Vì sao không phải là 4, 26, hay vô hạn?

**[PO]** Câu hỏi hay. Tôi đoán là 12 vì agency hợp đồng theo quý. Nhưng anh Trí chưa nói rõ tới mức đó. Có thể có người muốn 26 tuần, có người chỉ 4 tuần.

**[BA]** *(Probing assumption)* Vậy mình nên cho phép người dùng chọn số lần lặp tự do, hay giới hạn cứng?

**[PO]** Cho chọn tự do từ 2 đến 52 lần thì hợp lý. Hơn 52 cảnh báo người dùng và yêu cầu xác nhận.

> *[BA note]* "2–52 + cảnh báo ngưỡng" — viết vào yêu cầu chức năng. Nhưng cần verify giới hạn 52 này với anh Trí trong phỏng vấn tiếp theo.

---

### Pain Points & Edge Cases — 15 phút

**[BA]** Trong 4 tháng làm PO module này, đâu là pain point lớn nhất của người dùng mà chúng ta CHƯA giải quyết?

**[PO]** Hai pain point lớn:
1. Không có recurring (đang nói tới).
2. Khi cancel 1 booking, người tham gia (attendees) không được thông báo. Đây là phản hồi từ 7 phòng ban riêng biệt.

**[BA]** Tại sao pain point #2 không được đưa vào sprint này?

**[PO]** Vì đội đang tập trung vào tích hợp Outlook calendar. Chúng tôi sợ làm thêm việc sẽ trễ go-live tháng 9.

> *[BA note]* Có ràng buộc thời gian — go-live tháng 9. Phải cân nhắc khi đề xuất scope cho recurring booking. Đề xuất MVP nhỏ trước.

**[BA]** Quay lại recurring booking — anh đã nghĩ tới các edge case nào? Tôi muốn nghe trước khi đề xuất tự gợi thêm.

**[PO]**
- Người tổ chức nghỉ phép một tuần → có nên tự hủy entry tuần đó không?
- Người tổ chức rời công ty → series booking xử lý sao?
- Đổi giờ chỉ cho 1 entry trong series → có ảnh hưởng các entry khác?
- Đổi phòng cho toàn bộ series → có ảnh hưởng entries đã diễn ra (lịch sử)?

> *[BA note]* PO đã suy nghĩ kỹ — 4 edge case này đều quan trọng. Tổng hợp thành bảng AC để rà soát ở phỏng vấn tiếp. Cần tham vấn HR cho case "rời công ty".

**[BA]** Trong 4 case anh vừa nêu, anh ưu tiên giải quyết case nào trước?

**[PO]** Đổi giờ/phòng cho 1 entry — vì đó là use case phổ biến nhất. Hai case còn lại (nghỉ phép, rời công ty) ít xảy ra hơn.

**[BA]** *(Laddering down)* Anh đo "phổ biến" như thế nào? Có dữ liệu không?

**[PO]** Tôi quan sát từ log hệ thống cũ: trung bình 1 booking bị edit (đổi giờ hoặc phòng) trong 5 booking. Tỷ lệ 20%.

> *[BA note]* Dữ liệu định lượng đẹp. Có thể dùng làm bằng chứng trong BRD để justify ưu tiên.

---

### Success Metrics & Closing — 10 phút

**[BA]** Sau khi feature này go-live, anh đo "thành công" bằng cách nào?

**[PO]** Hai chỉ số:
1. Tỷ lệ booking được tạo qua giao diện "định kỳ" so với tổng booking — kỳ vọng ≥ 25% trong 3 tháng đầu.
2. Số phàn nàn về "không có recurring" — kỳ vọng về 0.

**[BA]** Có ai khác trong tổ chức mà tôi nên phỏng vấn để làm rõ thêm về feature này không?

**[PO]** Anh nên gặp:
- Anh Trí (Trưởng phòng Marketing) — case use chính.
- Chị Hoa (Lễ tân trưởng) — vì lễ tân sẽ phải xử lý các xung đột partial-cancel.
- Anh Hùng (Lead Developer) — để check kỹ thuật về Outlook recurring API.

**[BA]** Cảm ơn anh Minh. Em sẽ soạn bản thảo user story trong 2 ngày tới rồi gửi anh review. Anh có còn điều gì muốn bổ sung không?

**[PO]** Một điểm nữa: ở UI nên cho preview tất cả entries trước khi xác nhận. Người dùng cần nhìn rõ "12 thứ Hai sắp tới, slot nào trống, slot nào xung đột" trước khi nhấn nút tạo. Đây là một AC.

> *[BA note]* Preview với báo cáo xung đột → một AC nữa, viết riêng. Total AC sau buổi này: khoảng 6–8 AC.

---

## Tổng hợp ngay sau buổi (Post-interview Summary)

### Findings chính
1. **Pain point chính:** Không có recurring booking; phải đặt 12 lần một-một; rủi ro mất slot quan trọng.
2. **Giá trị thực sự:** Predictability + reputation với đối tác — không chỉ là tiết kiệm thời gian.
3. **Scope đề xuất:** Đặt lặp 2–52 lần, partial success khi xung đột, có preview, cảnh báo trước khi tạo.
4. **Edge case ưu tiên:** Đổi giờ/phòng 1 entry (20% tỷ lệ thực tế). Các edge case khác cho giai đoạn 2.

### Hành động tiếp theo
- [ ] **AI-001** — Soạn 3–5 user story với INVEST check (BA, hạn 2026-05-14).
- [ ] **AI-002** — Phỏng vấn anh Trí (Marketing) để xác nhận giới hạn 52 lần (BA, 2026-05-15).
- [ ] **AI-003** — Tham vấn chị Hoa (Lễ tân) về xử lý xung đột partial (BA, 2026-05-15).
- [ ] **AI-004** — Kiểm tra với anh Hùng về Outlook recurring API capability (BA → Dev Lead, 2026-05-16).
- [ ] **AI-005** — Gửi bản thảo cho anh Minh review (BA, 2026-05-17).

### Câu hỏi mở còn lại
- "Rời công ty" — chính sách xử lý series booking cần tham vấn HR.
- "Nghỉ phép" — có cần tích hợp với module HR/Leave Tracker không?
- Giới hạn cứng 52 hay theo nghiệp vụ (quý/năm)?

### Đánh giá chất lượng phỏng vấn (BA tự đánh giá)

| Khía cạnh | Đánh giá | Ghi chú |
|---|---|---|
| Câu hỏi mở | 9/10 | Đa số câu hỏi mở, ít câu Có/Không. |
| Laddering | 8/10 | Đi sâu được vào "giá trị thực" thay vì dừng ở "tiết kiệm thời gian". |
| 5 Whys | 7/10 | Áp dụng 2–3 lần, có thể đào sâu hơn ở case edge. |
| Active listening | 9/10 | Paraphrase 4 lần, không ngắt lời PO. |
| Bias avoidance | 9/10 | Không gợi ý giải pháp cho PO. |
| **Tổng** | **8.4/10** | **Phỏng vấn chất lượng cao** |
