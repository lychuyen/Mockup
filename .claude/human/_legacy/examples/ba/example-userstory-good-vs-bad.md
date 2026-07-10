---
example_type: "User Story comparison — good vs bad with INVEST analysis"
based_on_template: ".claude/templates/ba/user-story-template.md"
domain: "Internal Meeting Room Booking System"
purpose: "Few-shot reference for business-analyst agent — teach style by contrast"
version: "1.0"
date: "2026-05-26"
---

> **Ví dụ few-shot dành cho agent `business-analyst`.** 5 cặp user story tốt/xấu cho cùng một feature, mỗi cặp kèm phân tích INVEST chỉ rõ vì sao tốt và vì sao xấu. Bản canonical (AGENTS scope) tại `.claude/examples/ba/example-userstory-good-vs-bad.md`. Đồng bộ theo [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md).

# 5 Cặp User Story Tốt vs. Xấu — Hệ thống Đặt phòng họp VCM

Feature: **Đặt phòng họp (Meeting Room Booking)**

Mỗi cặp dưới đây cho thấy cách viết SAI và cách viết ĐÚNG cho cùng một yêu cầu, kèm phân tích theo **INVEST** (Independent, Negotiable, Valuable, Estimable, Small, Testable).

---

## Cặp 1 — Persona chung chung vs. cụ thể

### ❌ Bad — US-VCM-MRB-101a

> **Là một** người dùng,
> tôi muốn đặt phòng họp,
> để có chỗ họp.

**Vấn đề (INVEST):**
- **V — Valuable:** "Có chỗ họp" là kết quả hiển nhiên, không phải giá trị nghiệp vụ.
- **T — Testable:** Không có tiêu chí chấp nhận; không biết kiểm thử gì.
- **Persona "người dùng"** quá chung — không biết nhu cầu cụ thể của ai (lễ tân? nhân viên? quản lý?).

### ✅ Good — US-VCM-MRB-101b

> **Là một** Nhân viên Phòng Marketing,
> tôi muốn đặt phòng họp ≥ 10 chỗ cho cuộc họp với agency vào sáng thứ Hai hằng tuần,
> để **không phải gửi email tới lễ tân và chờ xác nhận, tiết kiệm 15 phút mỗi tuần**.

**Tiêu chí chấp nhận:**
- **AC-1:** Cho trước nhân viên đã đăng nhập, khi chọn "Đặt định kỳ", chọn phòng ≥ 10 chỗ, thứ Hai 9:00–10:00, lặp 12 tuần, thì hệ thống tạo 12 booking và đồng bộ Outlook trong < 30 giây.
- **AC-2:** Cho trước có xung đột ở 2/12 tuần, khi nhân viên submit, thì hệ thống cảnh báo trước, gợi ý 3 slot thay thế cho mỗi tuần xung đột.

**Điểm mạnh INVEST:** Persona rõ → giá trị đo lường được (15 phút/tuần) → AC kiểm thử được.

---

## Cặp 2 — Mô tả giải pháp kỹ thuật vs. nhu cầu nghiệp vụ

### ❌ Bad — US-VCM-MRB-102a

> **Là một** developer,
> tôi muốn dùng REST API endpoint POST `/api/v1/bookings` với JSON body chứa `room_id` và `time_slot`,
> để tạo booking trong database.

**Vấn đề (INVEST):**
- **V — Valuable:** Đây là **thiết kế kỹ thuật**, không phải user story. Developer không phải end user của hệ thống.
- **N — Negotiable:** Đã bị khóa cứng vào REST + JSON. Mất chỗ thương lượng cho FE/BE thảo luận giải pháp.

### ✅ Good — US-VCM-MRB-102b

> **Là một** Trợ lý hành chính,
> tôi muốn tạo nhanh booking lặp lại cho Giám đốc bằng cách click 1 lần "Sao chép từ lần trước",
> để **không phải nhập lại 8 trường thông tin mỗi lần Giám đốc cần họp với khách hàng tương tự**.

**Tiêu chí chấp nhận:**
- **AC-1:** Cho trước trợ lý đã có ít nhất 1 booking trong 30 ngày qua, khi vào trang "Đặt nhanh", thì hệ thống hiển thị 5 booking gần nhất kèm nút "Sao chép".
- **AC-2:** Khi click "Sao chép từ lần trước", thì form đặt phòng được điền sẵn 8 trường (phòng, thời lượng, người tham gia, agenda, ghi chú, dịch vụ kèm theo) — chỉ cần chỉnh ngày/giờ mới.

**Điểm mạnh INVEST:** Mô tả **nhu cầu** (giảm thao tác), không khóa giải pháp. FE/BE tự do chọn kỹ thuật.

---

## Cặp 3 — Quá lớn vs. nhỏ vừa đủ

### ❌ Bad — US-VCM-MRB-103a

> **Là một** Trưởng phòng,
> tôi muốn có **dashboard quản lý đặt phòng** với báo cáo theo phòng, theo phòng ban, theo người, theo khung giờ, theo loại cuộc họp, xuất Excel, gửi email tự động hằng tuần, drill-down từng booking, so sánh tuần này vs. tuần trước…
> để theo dõi hiệu quả sử dụng phòng họp.

**Vấn đề (INVEST):**
- **S — Small:** Cuộc tích hợp 1 sprint không xong. Ít nhất 4–6 story con.
- **E — Estimable:** Đội phát triển không thể ước lượng vì phạm vi quá rộng.

### ✅ Good — US-VCM-MRB-103b (đã tách)

> **Là một** Trưởng phòng,
> tôi muốn xem biểu đồ tỷ lệ sử dụng (utilization %) của từng phòng theo tháng,
> để **xác định 3 phòng ít sử dụng nhất nhằm cân nhắc tái cấu trúc không gian**.

**Tiêu chí chấp nhận:**
- **AC-1:** Cho trước có ≥ 1 booking trong tháng đó, khi truy cập dashboard, thì hiển thị biểu đồ cột cho 18 phòng, sắp xếp theo utilization tăng dần.
- **AC-2:** Khi hover lên cột phòng bất kỳ, thì tooltip hiển thị số giờ sử dụng + tổng giờ khả dụng + % tương ứng.

**Điểm mạnh INVEST:** Đủ nhỏ cho 1 sprint, ước lượng được, có đầy đủ AC. Các tính năng khác (drill-down, xuất Excel…) tách thành story riêng.

---

## Cặp 4 — Tiêu chí chấp nhận mơ hồ vs. định lượng

### ❌ Bad — US-VCM-MRB-104a

> **Là một** Nhân viên,
> tôi muốn nhận thông báo nhắc giờ họp,
> để không quên cuộc họp.

**Tiêu chí chấp nhận (mơ hồ):**
- Hệ thống gửi thông báo trước cuộc họp.
- Thông báo phải kịp thời và đẹp.

**Vấn đề (INVEST):**
- **T — Testable:** "Trước cuộc họp" là bao nhiêu? "Kịp thời" là khi nào? "Đẹp" là tiêu chuẩn gì? QA sẽ không biết phải kiểm thử cái gì.

### ✅ Good — US-VCM-MRB-104b

> **Là một** Nhân viên,
> tôi muốn nhận thông báo qua Microsoft Teams trước cuộc họp 15 phút,
> để **có đủ thời gian chuẩn bị tài liệu và di chuyển tới phòng họp**.

**Tiêu chí chấp nhận:**
- **AC-1:** Cho trước nhân viên có 1 booking sắp diễn ra, khi đến mốc 15 phút trước giờ bắt đầu, thì hệ thống gửi thông báo Teams chứa: tên cuộc họp, phòng, giờ bắt đầu, link "Mở chi tiết".
- **AC-2:** Cho trước nhân viên đã tắt thông báo Teams cho ứng dụng MRB, khi đến mốc 15 phút, thì hệ thống KHÔNG gửi thông báo Teams nhưng vẫn gửi email backup.
- **AC-3:** Thông báo phải đến được người dùng trong ±30 giây so với mốc 15 phút (kiểm chứng qua log).

**Điểm mạnh INVEST:** Mọi yếu tố định lượng (15 phút, ±30 giây), có happy path + edge case, kiểm thử được.

---

## Cặp 5 — Phụ thuộc ngầm vs. độc lập

### ❌ Bad — US-VCM-MRB-105a

> **Là một** Lễ tân,
> tôi muốn **xem báo cáo no-show từ chức năng auto-cancel**,
> để theo dõi nhân viên hay quên check-in.

**Vấn đề (INVEST):**
- **I — Independent:** Story này phụ thuộc ngầm vào chức năng auto-cancel (US khác) — nếu auto-cancel chưa làm xong thì story này bị block.
- **V — Valuable:** "Theo dõi nhân viên hay quên" có thể bị hiểu là giám sát cá nhân — không phải giá trị nghiệp vụ minh bạch.

### ✅ Good — US-VCM-MRB-105b

> **Là một** Lễ tân,
> tôi muốn xem **danh sách 10 booking bị hủy tự động trong 7 ngày qua** với thời gian, phòng, và người đặt,
> để **liên hệ nhắc nhở và đề xuất đào tạo nếu cần**.

**Tiêu chí chấp nhận:**
- **AC-1:** Cho trước có ≥ 1 booking bị auto-cancel trong 7 ngày, khi lễ tân vào trang "Báo cáo no-show", thì hiển thị bảng 10 dòng gần nhất với 4 cột: thời gian booking, phòng, người đặt, lý do hủy.
- **AC-2:** Cho trước chưa có booking nào bị hủy, thì trang hiển thị empty state với thông báo "Tuyệt vời — chưa có no-show nào trong 7 ngày qua!".

**Điểm mạnh INVEST:**
- **Independent:** Story đọc dữ liệu từ bảng log, không phụ thuộc chức năng auto-cancel đang chạy. Nếu test, có thể seed dữ liệu trực tiếp.
- **Valuable:** Mục đích minh bạch (đào tạo, không phải giám sát).

---

## Tóm tắt nhanh — Checklist khi viết User Story

| Câu hỏi | Trả lời nên là... |
|---|---|
| Persona có cụ thể không? | Tên vai trò rõ ràng, không phải "user" chung chung |
| Mục đích đo lường được không? | Có con số (15 phút, 3 click) hoặc kết quả nghiệp vụ cụ thể |
| Có khóa cứng giải pháp kỹ thuật? | KHÔNG — chỉ mô tả nhu cầu |
| Có đủ nhỏ cho 1 sprint? | Có — nếu lớn thì tách |
| AC theo Cho-Khi-Thì? | Đủ ≥ 2 AC (happy path + edge/negative) |
| AC có định lượng được kiểm thử không? | Mọi số liệu (thời gian, ngưỡng) đều cụ thể |
| Có phụ thuộc story khác không? | Tránh phụ thuộc; nếu có thì khai báo rõ |
