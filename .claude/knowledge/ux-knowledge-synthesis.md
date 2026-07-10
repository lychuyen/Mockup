# UX Knowledge — Tổng hợp 4 sách + Áp dụng cho harness TOSS

> Tài liệu tham khảo nội bộ (AGENTS scope). Tổng hợp 4 sách UX (prototyping, định luật UX, nghiên cứu người dùng) mới bổ sung vào `knowledge/`, rút nguyên lý, và đối chiếu để nâng các agent/skill UX + discovery của TOSS. Không có mirror VI bắt buộc (`.claude/knowledge/` — CLAUDE.md §9).

**Nguồn (bản trích `.extracted.md` trong [`_books-extracted/`](_books-extracted/)):**

- **[U1] Designing UX: Prototyping** — Ben Coleman & Dan Goodwin (SitePoint, 2017)
- **[U2] Laws of UX** — Jon Yablonski (O'Reilly, 2nd ed. 2024)
- **[U3] UX Research: Practical Techniques** — Brad Nunnally & David Farkas (O'Reilly, 2017)
- **[U4] Prototyping for Product Managers** — UXPin (G. Satia, 2016)

> Đây là lớp **curated** (đọc trước). Cần nguyên văn một chương → dùng bản đồ mục + số dòng tại [`_books-extracted/SECTION-MAPS.md`](_books-extracted/SECTION-MAPS.md) rồi `Read(file, offset, limit)`.

---

## Phần A — Tinh chất từng sách

### A1. Designing UX: Prototyping [U1]
- **Mục đích prototype:** test / explore / communicate ý tưởng — mặc định **low-fidelity**; "prototype early and often", quick-and-dirty, sẵn sàng vứt bỏ.
- **Khung 3 trục chọn công cụ** (Ch.3): Design Fidelity · Tool Complexity/Speed · Aim. Đừng nhầm fidelity với độ phức tạp/tốc độ.
- **"Wide but shallow"** (Ch.2): dựng rộng khắp điều hướng ở fidelity thấp, chỉ tăng chi tiết ở vùng cần test.
- **Xử lý biên (boundaries)** (Ch.2): link ra ngoài phạm vi phải có placeholder gắn nhãn rõ ("[… chưa dựng]") — không để dead-end làm "vỡ" prototype.
- **Prototype KHÔNG dùng để** kết luận: định lượng, conversion, accessibility, tác động visual (nếu fidelity thấp); và không nên là tài liệu duy nhất (Ch.1).
- **Tách content/presentation** + dùng **dữ liệu thật** → thuyết phục hơn, đổi layout nhanh.
- **HTML prototype** (Ch.7): cách duy nhất test responsive thật + tương tác phức tạp + có Git; nhược điểm: cần plan trước, phụ thuộc kỹ năng dev; throwaway ≠ production-ready.
- **Test với user** (Ch.4/8): vai trò Facilitator/Operator/User/Observer; task độc lập, think-aloud, tập trung ghi vấn đề, không sửa lỗi tại chỗ; gắn version+ngày vào tên bản chia sẻ.

### A2. Laws of UX [U2] — 10 định luật
| Định luật | Một câu | Ví dụ UI |
|---|---|---|
| Jakob's | Người dùng kỳ vọng app của bạn vận hành giống cái họ đã quen | Theo quy ước OCC/màn hình điều hành quen thuộc |
| Fitts's | Thời gian chạm tỉ lệ thuận khoảng cách, nghịch kích thước | Nút quan trọng to/gần; destructive tách xa |
| Miller's | Trí nhớ làm việc ~7±2 → **chunk** | Nhóm cột/divider/khoảng trắng; không cắt mục vô lý |
| Hick's | Càng nhiều lựa chọn càng chậm quyết định | Giảm/nhóm lựa chọn; làm nổi mặc định khuyến nghị |
| Postel's | Bảo thủ đầu ra, rộng rãi đầu vào | Form hỏi tối thiểu, chấp nhận định dạng linh hoạt |
| Peak–End | Nhớ trải nghiệm qua đỉnh + kết thúc | Xử lý lỗi/timeout/kết thúc tác vụ nhẹ nhàng |
| Aesthetic–Usability | Đẹp → *cảm giác* dễ dùng hơn thực tế | **Cảnh báo:** đừng để đẹp che lỗi → quan sát hành vi |
| Von Restorff | Cái khác biệt được nhớ/chú ý nhất | Cảnh báo nguy cấp nổi bằng màu+icon+hình (dùng tiết kiệm) |
| Tesler's | Độ phức tạp cố hữu chỉ chuyển được, không mất | Hệ thống gánh thay (pre-fill, gợi ý); progressive disclosure |
| Doherty | <400ms thì giữ được flow | Skeleton/spinner/progress cho realtime & tác vụ chậm |
- **Đạo đức (Ch.12):** tránh dark patterns, intermittent variable rewards; thiết kế phục vụ mục tiêu người dùng.

### A3. UX Research [U3]
- "Nghiên cứu tốt bắt đầu từ **câu hỏi tốt**"; chọn phương pháp theo 6 yếu tố (câu hỏi/stakeholder/cỡ mẫu/vị trí/ngân sách/timeline).
- **Phân loại:** định tính ↔ định lượng (song hành); insight-driven / generative / evaluative (theo giai đoạn). Behavioral (analytics, A/B) ↔ attitudinal (survey, interview).
- **Phương pháp định tính chính:** contextual inquiry, heuristic review, landscape analysis, diary study, stakeholder workshop, participatory design, open-ended interview.
- **Phỏng vấn:** Setup → Area of Inquiry → **laddering ("Why")** → segue. Tránh: câu dẫn dắt, yes/no, câu kép (double-barreled), thiên kiến. Kỹ thuật **"handles"** (neo câu hỏi trừu tượng vào sự kiện gần nhất); active listening; "Yes, and…".
- **Quy tắc dừng:** khi nghe lặp lại cùng thông tin = đủ.
- **Phân tích:** tách thành **"data point"** rời rạc (1 ý/khái niệm) → code → affinity/quadrant/spectrum. Tối thiểu ~3 giờ phân tích / 1 giờ nghiên cứu.
- **Báo cáo:** Exec Summary + Full Report (Intro/Highlights/Methods/Users/Logistics/Findings/Recommendations/Next Steps); trích nguyên văn ẩn danh; mỗi insight trả lời **"So what?"** (Dan Brown).

### A4. Prototyping for Product Managers [U4]
- Prototype để **làm rõ yêu cầu** (không phải làm đẹp UI): phát lộ phụ thuộc ẩn + yêu cầu bị sót; "fail fast" rẻ.
- **Ưu tiên prototype theo RỦI RO**, không theo độ phủ: màn hình **nhập/xử lý dữ liệu** trước; màn hình chỉ-đọc/tĩnh rủi ro thấp.
- Fidelity **low/medium** khi làm rõ yêu cầu; chỉ hi-fi khi validate cuối (tránh stakeholder nhầm là sản phẩm thật).
- **Annotation 3 nhóm:** (a) ràng buộc không thương lượng (pháp lý/vùng miền), (b) nice-to-have để version sau, (c) hạng mục tốn kém/rủi ro kỹ thuật.
- **Chia sẻ review độc lập** (link live, không "set context" hộ) → phản hồi ít thiên kiến; hỏi đúng nhóm: vision / feature completeness / flow.
- Mockup làm lộ dữ liệu backend (mỗi field → kiểu/ràng buộc) → cầu nối sang mô hình dữ liệu.
- **Checklist tiền-prototype:** nhận diện đủ stakeholder → phỏng vấn → trao đổi đội tiếp xúc khách hàng → rõ user vs buyer (persona).

---

## Phần B — Áp dụng cho TOSS (đã triển khai)

Bối cảnh TOSS: dashboard điều hành **mật độ cao, realtime**, người dùng (Dispatcher/OCC/Crew/Maintenance) làm việc dưới áp lực thời gian → áp dụng UX có chọn lọc (enterprise dày, không phải app tiêu dùng).

| # | Cải tiến | Nguồn | Áp vào |
|---|---|---|---|
| B1 | "Wide-but-shallow" + xử lý biên (placeholder gắn nhãn + cờ `[cần xác nhận]`) | U1 | `skills/gen-mockup` |
| B2 | Ưu tiên dựng theo **rủi ro** (màn nhập/xử lý dữ liệu trước) | U4 | `skills/gen-mockup` |
| B3 | Dữ liệu mẫu **thực tế** domain hàng không (số hiệu/ICAO/UTC) | U1 | `skills/gen-mockup` |
| B4 | Doherty (<400ms: skeleton/spinner) + Tesler (progressive disclosure) + Von Restorff (cảnh báo nổi) cho dashboard | U2 | `skills/gen-mockup` |
| B5 | Annotation 3 nhóm (ràng buộc/nice-to-have/tốn kém) | U4 | `skills/gen-mockup` |
| B6 | Tiêu chí review theo 10 định luật UX + boundary handling + task-completability + cảnh báo Aesthetic-Usability | U1,U2 | `agents/ui-reviewer` |
| B7 | "Handles" (neo sự kiện gần nhất) + process opener + quy tắc dừng + tránh câu kép | U3 | `agents/ba-interviewer` |
| B8 | "Data point" rời rạc + "So what?" + trích nguyên văn ẩn danh | U3 | `skills/survey-report` |

> Ranh giới §0 (CLAUDE.md): 4 sách là **tài liệu phương pháp (reference)** — áp ở mức quy trình/skill. Mọi nội dung mockup/báo cáo vẫn phải truy vết về nguồn khảo sát/YCKT, không suy diễn từ ví dụ trong sách. Khi nguồn chưa đủ để dựng một flow → placeholder + cờ `[cần xác nhận]`, không tự "hoàn thiện" hành vi.

---

*v1.0 — 2026-06-17 — tổng hợp U1–U4 + áp dụng harness TOSS. Bản trích đầy đủ: 4 file `*.extracted.md` trong `_books-extracted/`.*
