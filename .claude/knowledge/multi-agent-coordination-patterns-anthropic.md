# Multi-Agent Coordination Patterns — Anthropic

> **Nguồn:** Anthropic blog — *Multi-agent coordination patterns: Five approaches and when to use them*
> `https://claude.com/blog/multi-agent-coordination-patterns` — crawl 2026-06-22. Bản curated.
> **Nguyên tắc chủ đạo:** *bắt đầu với pattern đơn giản nhất còn chạy được, tiến hoá khi nhu cầu rõ dần.* Mặc định khuyến nghị: **Orchestrator-Subagent**.

Năm pattern điều phối multi-agent — kèm cơ chế, điểm mạnh và hạn chế.

## 1. Generator-Verifier
- **Cơ chế:** *generator* sinh output; *verifier* đánh giá theo tiêu chí đã định. Output bị loại quay lại generator kèm feedback cụ thể → lặp tới khi đạt hoặc hết số vòng.
- **Hợp khi:** chất lượng output là tối quan trọng và **tiêu chí đánh giá có thể nêu tường minh** — vd sinh code + test, fact-checking, kiểm tra tuân thủ (compliance).
- **Hạn chế:** chất lượng verify phụ thuộc việc định nghĩa tiêu chí rõ ràng; giả định "sinh" và "kiểm" là hai kỹ năng tách rời được; vòng lặp có thể tắc nếu generator không xử lý nổi feedback.

## 2. Orchestrator-Subagent  *(mặc định khuyến nghị)*
- **Cơ chế:** một *lead agent* lập kế hoạch, giao task cho các subagent, rồi tổng hợp kết quả. Subagent làm trong ngữ cảnh giới hạn (bounded context) và trả phát hiện về orchestrator.
- **Hợp khi:** **phân rã task rõ ràng** và các subtask **ít phụ thuộc lẫn nhau** — vd code review tự động chia cho subagent chuyên: security, coverage, style, architecture.
- **Hạn chế:** orchestrator thành *nút thắt thông tin* khi subagent phát hiện điều phụ thuộc lẫn nhau; chạy tuần tự không song song hoá sẽ hạn chế throughput.

## 3. Agent Teams
- **Cơ chế:** một *coordinator* tạo nhiều *worker agent bền (persistent)* tự lấy task từ **hàng đợi chung**, làm việc tự chủ qua nhiều bước, báo hoàn thành. Worker **giữ state** qua các lần nhận việc.
- **Hợp khi:** subtask **cần làm việc bền, nhiều bước** — vd migration framework, mỗi thành viên độc lập migrate một service và tích luỹ hiểu biết miền.
- **Hạn chế:** đòi hỏi độc lập thật sự — khó chia sẻ phát hiện trung gian; tài nguyên dùng chung dễ xung đột khi nhiều agent thao tác cùng hạ tầng.

## 4. Message Bus
- **Cơ chế:** agent **publish/subscribe** theo *topic* qua một router trung tâm. Agent mới chỉ cần subscribe sự kiện liên quan, **không phải đấu nối lại** kết nối cũ → hỗ trợ pipeline hướng sự kiện.
- **Hợp khi:** **pipeline hướng sự kiện**, workflow *nảy sinh từ sự kiện* thay vì trình tự định sẵn — vd security operations: alert chảy qua các agent triage → investigation → response.
- **Hạn chế:** khó truy vết hành vi hệ thống xuyên nhiều agent; **độ chính xác định tuyến là then chốt** — sự kiện phân loại sai / rớt gây *lỗi âm thầm (silent failure)*.

## 5. Shared State
- **Cơ chế:** agent đọc/ghi vào một *kho lưu bền (persistent store)* **không cần điều phối trung tâm**. Bước khởi tạo nạp việc ban đầu; kết thúc theo giới hạn thời gian, ngưỡng hội tụ, hoặc tín hiệu hoàn thành định sẵn.
- **Hợp khi:** agent **xây dựng dần trên phát hiện tích luỹ** và công việc mang tính cộng tác — vd tổng hợp nghiên cứu: các agent (tài liệu học thuật, báo cáo ngành, sáng chế, tin tức) đóng góp phát hiện soi sáng cho nhau. Cũng hợp khi cần **không có điểm hỏng đơn lẻ (single point of failure)**.
- **Hạn chế:** thiếu điều phối tường minh → agent dễ trùng việc hoặc đi hướng mâu thuẫn; vòng lặp phản ứng tiêu tốn token vô ích → cần **điều kiện kết thúc rõ** (ngân sách thời gian, ngưỡng hội tụ).

---

## Khung lựa chọn (selection framework)

| Tình huống | Pattern khuyến nghị |
|---|---|
| Output trọng chất lượng, tiêu chí đánh giá tường minh | Generator-Verifier |
| Phân rã task rõ, subtask giới hạn | Orchestrator-Subagent |
| Khối lượng song song, subtask độc lập chạy dài | Agent Teams |
| Pipeline hướng sự kiện, hệ agent đang mở rộng | Message Bus |
| Nghiên cứu cộng tác, agent chia sẻ phát hiện | Shared State |
| Yêu cầu không có điểm hỏng đơn lẻ | Shared State |

> **Insight then chốt:** *"Với hầu hết use case, hãy bắt đầu với orchestrator-subagent. Nó xử lý được dải bài toán rộng nhất với chi phí điều phối thấp nhất."*

> Đối chiếu 8 *design patterns* triển khai của AutoGen (Concurrent / Sequential / Group Chat / Handoffs / Mixture / Debate / Reflection / Code Execution): xem [`multi-agent-design-patterns-autogen.md`](multi-agent-design-patterns-autogen.md). Lưu ý ánh xạ gần: Anthropic *Message Bus* ↔ AutoGen *Concurrent/pub-sub*; *Generator-Verifier* ↔ *Reflection*; *Orchestrator-Subagent* ↔ *Mixture of Agents/Group Chat*.

*Crawl 2026-06-22 từ claude.com/blog. Bản curated — rút gọn trung thực theo nội dung gốc.*
