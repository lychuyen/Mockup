# Multi-Agent Design Patterns — AutoGen (Microsoft)

> **Nguồn:** Microsoft AutoGen — *Core User Guide › Multi-Agent Design Patterns*
> `https://microsoft.github.io/autogen/stable/user-guide/core-user-guide/design-patterns/` — crawl 2026-06-22.
> **Bản curated (rút gọn, không kèm code):** giữ cơ chế / khi nào dùng / lưu ý. Cần nguyên văn code Python `autogen_core` → mở trực tiếp trang nguồn theo URL từng pattern.

Một **multi-agent design pattern** là *cấu trúc nảy sinh từ giao thức truyền message* — mô tả cách các agent tương tác để giải bài toán. Nghiên cứu (AutoGen, MetaGPT, ChatDev) cho thấy hệ multi-agent có thể vượt single-agent ở task phức tạp. Bản thân agent có tool đã là một pattern (**ReAct** — agent ↔ tool).

Nền tảng chung trong AutoGen Core: agent là `RoutedAgent` với các `@message_handler`; giao tiếp theo **publish/subscribe** (theo *topic*) hoặc **direct messaging** (`send_message` theo `AgentId`); **Agent Runtime** quản lý truyền message + vòng đời agent (chạy local hoặc phân tán).

---

## 1. Concurrent Agents
**Cơ chế:** nhiều agent chạy đồng thời theo 3 kiểu:
- *Single message → nhiều processor:* nhiều agent cùng subscribe một topic (`@default_subscription`) xử lý độc lập cùng một message.
- *Nhiều loại message → nhiều processor:* định tuyến từng loại tới agent chuyên trách qua `@type_subscription(topic_type=...)`; gom kết quả bằng `ClosureAgent`.
- *Direct messaging:* gửi trực tiếp theo `AgentId` và nhận response; runtime tự lấy/tạo instance khi gửi.

**Dùng khi:** cần xử lý song song một hoặc nhiều loại tác vụ; là nền cho [Mixture of Agents](#5-mixture-of-agents).

## 2. Sequential Workflow
**Cơ chế:** các agent phản hồi theo **chuỗi xác định (deterministic)** — mỗi agent xử lý message, sinh kết quả rồi publish sang topic của agent kế tiếp. Ví dụ pipeline marketing 4 chặng: ConceptExtractor → Writer → FormatProof → User.

**Dùng khi:** mỗi agent đảm nhiệm một sub-task định trước, trình tự cố định, không cần điều phối động.

## 3. Group Chat
**Cơ chế:** nhiều agent cộng tác trên **một thread chung**, lần lượt phát biểu (sequential — mỗi lúc một agent). Một **Group Chat Manager** dùng LLM (selector prompt) chọn người nói kế tiếp rồi gửi `RequestToSpeak`; lặp tới điều kiện kết thúc (vd User gõ "APPROVE"). Agent có thể mang tool (vd Illustrator gọi DALL-E sinh ảnh).

**Dùng khi:** phân rã task cho các vai chuyên trách (Writer/Editor/Illustrator…) cần thảo luận tuần tự, có điều phối lượt nói.
**Lưu ý:** tài liệu nói bản mẫu *không* dùng cho production; nên tối ưu thuật toán chọn speaker / dùng AgentChat selector group chat.

## 4. Handoffs
**Cơ chế:** agent **uỷ thác (delegate)** task cho đồng nghiệp chuyên trách qua một **tool call đặc biệt** trả về *topic type* của agent đích (phân biệt `tools` chạy trực tiếp vs `delegate_tools` để chuyển việc). Dựa trên ý tưởng OpenAI Swarm, hiện thực event-driven. Ví dụ CSKH: Triage / Sales / Issues&Repairs / Human, người dùng qua UserAgent proxy; có thể `escalate_to_human`.

**Dùng khi:** định tuyến/triage yêu cầu tới agent đúng chuyên môn; cần escalate sang người thật.

## 5. Mixture of Agents
**Cơ chế:** mô phỏng **feed-forward neural network** — nhiều **worker** xếp thành **nhiều lớp** + một **orchestrator**. Orchestrator gửi task cho worker lớp 1 → gom kết quả → đưa làm `previous_results` cho lớp kế (worker được yêu cầu *tổng hợp & đánh giá phê phán* các phản hồi trước) → lặp qua các lớp → tổng hợp cuối thành một output. Dùng direct messaging `send_message`.

**Dùng khi:** muốn tổng hợp nhiều mô hình/nhiều lượt thành một câu trả lời chất lượng, mạch lạc.

## 6. Multi-Agent Debate
**Cơ chế:** tương tác **nhiều vòng** — mỗi vòng các **solver** trao đổi đáp án và **tinh chỉnh** dựa trên phản hồi của hàng xóm; giao tiếp **thưa (sparse topology)**, vd lưới 4 đỉnh A-B-C-D, mỗi solver nối 2 hàng xóm. Sau số vòng tối đa, solver publish đáp án cuối; **aggregator** chọn bằng **majority voting**.

**Dùng khi:** bài toán cần đối chứng/refine để tăng độ chính xác (toán, suy luận); muốn giảm sai lệch của một agent đơn lẻ.

## 7. Reflection
**Cơ chế:** một lần sinh của LLM được nối tiếp bởi một **reflection** (một lần sinh khác, *điều kiện trên output đầu*). Hiện thực bằng cặp **Coder ↔ Reviewer**: Coder sinh code → Reviewer chấm (trả JSON: correctness/efficiency/safety/approval/suggested_changes) → nếu APPROVE thì xuất kết quả, nếu REVISE thì lặp lại với feedback.

**Dùng khi:** cần tăng độ bền & chất lượng output qua tự phê bình lặp (sinh code, soạn văn bản, kiểm chứng).

## 8. Code Execution (Group Chat)
**Cơ chế:** cặp **Assistant** (viết Python trong markdown block) ↔ **Executor** (trích code block, chạy trong **Docker** `DockerCommandLineCodeExecutor`, trả output). Tách *agent logic* khỏi *hạ tầng thực thi*.

**Dùng khi:** tác vụ cần thực sự chạy code để ra kết quả (phân tích dữ liệu, vẽ biểu đồ, tính toán).

---

## Bảng tra nhanh

| Pattern | Cơ chế cốt lõi | Dùng khi |
|---|---|---|
| Concurrent Agents | pub/sub đồng thời + direct messaging | nhiều agent xử lý song song một/đa loại message |
| Sequential Workflow | chuỗi xác định qua pub/sub topic kế tiếp | mỗi agent một sub-task định trước |
| Group Chat | thread chung + Manager chọn speaker (selector LLM) | phân rã cho vai chuyên trách, thảo luận tuần tự |
| Handoffs | delegate qua tool call trả topic đích | định tuyến/uỷ thác (triage, CSKH), escalate human |
| Mixture of Agents | worker nhiều lớp + orchestrator tổng hợp (FFN) | tổng hợp nhiều mô hình thành 1 đáp án chất lượng |
| Multi-Agent Debate | nhiều vòng + sparse topology + majority vote | bài toán cần đối chứng/refine (toán, suy luận) |
| Reflection | cặp generator ↔ reviewer lặp tới approve | tăng độ bền/chất lượng output (code, văn bản) |
| Code Execution | Assistant sinh code ↔ Executor chạy (Docker) | tác vụ cần thực thi code để ra kết quả |

> Đối chiếu với 5 *coordination patterns* của Anthropic (Generator-Verifier, Orchestrator-Subagent, Agent Teams, Message Bus, Shared State): xem [`multi-agent-coordination-patterns-anthropic.md`](multi-agent-coordination-patterns-anthropic.md). Harness engineering nội bộ: [`agent-harness-engineering.md`](agent-harness-engineering.md).

*Crawl 2026-06-22 từ microsoft.github.io/autogen (stable). Bản curated — rút gọn từ nguyên văn, không kèm code.*
