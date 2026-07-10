# AutoGen Core — Concepts · Framework · Components (curated)

> **Nguồn:** Microsoft AutoGen — *Core User Guide* (Core Concepts / Framework Guide / Components Guide)
> `https://microsoft.github.io/autogen/stable/user-guide/core-user-guide/` — crawl 2026-06-22. Bản curated, không kèm code.
> Bổ trợ cho [`multi-agent-design-patterns-autogen.md`](multi-agent-design-patterns-autogen.md): đây là nền tảng (runtime, message, component) để hiện thực 8 design pattern.

---

## A. Core Concepts

### A1. Agent & Multi-Agent Application
- **Agent** = thực thể phần mềm: giao tiếp **bằng message**, **giữ state riêng**, **phản ứng** với message/đổi state, và **hành động** (gọi API, chạy code, gửi message).
- **Multi-agent application** = hệ nhiều agent tương tác hướng tới mục tiêu chung.
- Nguyên tắc thiết kế: **modularity & composability** (mỗi agent độc lập, dev/test/deploy riêng), **flexibility** (cùng tiến trình hoặc khác máy/tổ chức, khác ngôn ngữ/mô hình), ghép các agent đơn giản thành hệ phức tạp.

### A2. Agent Runtime Environments (architecture)
Runtime là tầng nền: định tuyến message, quản identity & lifecycle, ranh giới bảo mật, hỗ trợ giám sát/debug. Hai loại, **chung API** (đổi qua lại không cần sửa agent):
- **Standalone** — đơn tiến trình, cùng ngôn ngữ (vd `SingleThreadedAgentRuntime`).
- **Distributed** — đa tiến trình/đa máy/đa ngôn ngữ: **host servicer** (quản kết nối + định tuyến) + **workers** (chạy agent, kết nối host qua gateway).

### A3. Application Stack
Framework **unopinionated** (không áp khuôn cứng). Ba tầng:
- **Foundation** — hạ tầng messaging/routing do runtime quản.
- **Developer interface** — API cấp cao, giấu chi tiết định tuyến.
- **Application** — **kiểu message do dev định nghĩa** = *behavior contract* (giao thức) quy định cách agent xử lý/đáp. Pattern multi-agent **nảy sinh** từ các contract này (vd 3 agent Coder/Executor/Reviewer + 5 loại message → pattern *reflection*).

### A4. Agent Identity & Lifecycle
- **AgentId = `Agent_Type / Agent_Key`** (chỉ chữ-số-gạch dưới, không bắt đầu bằng số).
  - *Type* gắn với một **factory** sinh instance (cùng class, khác tham số → khác type).
  - *Key* định danh instance trong một type, thường lấy từ dữ liệu ứng dụng (vd `("code_reviewer", review_request_id)`).
- **Lifecycle:** khi runtime nhận message cho một agent → nếu instance chưa có thì **tạo bằng factory**, rồi xử lý. App **đăng ký type + factory**, không tạo agent trực tiếp.

### A5. Topic & Subscription (pub/sub)
- **Topic = `Topic_Type / Topic_Source`** — *type* phân loại message, *source* định danh trong type.
- **Subscription** ánh xạ topic → agent; topic không có subscription thì message rơi vào hư không; nhiều subscription vẫn giao **đúng một lần** mỗi recipient.
- **Type-based subscription** ánh xạ *topic type → agent type* (không hard-code AgentId) → **portable, độc lập dữ liệu**; runtime tự ghép agent key = topic source.
- Kịch bản định tuyến: *single-tenant 1 topic* (mọi agent dùng chung topic type), *single-tenant nhiều topic* (cô lập theo topic type), *multi-tenant* (topic source theo dữ liệu, vd mỗi phiên user → nhiều instance cùng type).

---

## B. Framework Guide

### B1. Agent & Agent Runtime
- Kế thừa **`RoutedAgent`** + decorator **`@message_handler`**; **type hint** trên tham số message quyết định handler nào nhận; nhiều handler cho nhiều loại (hoặc dùng Union).
- Đăng ký type bằng **`register()`** với **factory** (tạo instance on-demand). Cùng class Python có thể đăng ký nhiều type với tham số khác nhau.
- `SingleThreadedAgentRuntime`: **`start()`** chạy nền · **`stop()`** dừng ngay (không hủy handler đang chạy) · **`stop_when_idle()`** chờ hết message + không handler nào chạy (hợp batch) · **`close()`** giải phóng tài nguyên. App giao tiếp qua **AgentId**, không tham chiếu agent trực tiếp.

### B2. Message & Communication
- **Message** = data serializable (Pydantic model / dataclass), **không chứa logic** — kênh giao tiếp duy nhất giữa agent. Handler xử lý qua `on_message()`; không xử lý được → raise `CantHandleException`.
- **Direct messaging `send_message`** — điểm-tới-điểm, **request/response** (chờ giá trị trả về), coupling chặt; lỗi **propagate** về người gửi. Hợp tool execution, vòng action-observation.
- **Broadcast `publish_message`** — pub/sub theo topic, **một chiều** (response bị bỏ), coupling lỏng, nhiều agent subscribe; agent **không nhận lại message do chính nó publish** (chống loop); lỗi chỉ **log**, không propagate.
- **Routing:** theo *type* (`@message_handler`) hoặc theo *điều kiện* (`match` = predicate). Dùng `DefaultTopicId` + `@default_subscription` khi mọi agent dùng chung phạm vi.

### B3. Distributed Agent Runtime (experimental)
- gRPC: **`GrpcWorkerAgentRuntimeHost`** (host) + **`GrpcWorkerAgentRuntime`** (worker, quảng bá agent type lên host). Cài `pip install "autogen-ext[grpc]"`; worker nối host theo cổng (vd `localhost:50051`).
- Publish/subscribe xuyên tiến trình; định tuyến tự động theo đăng ký. **Cross-language** đòi mọi message dùng **protobuf** dùng chung. Lưu ý: API có thể đổi (experimental). Có `stop()` / `stop_when_signal()`.

### B4. Component Config (declarative)
- *Config = bản thiết kế (blueprint)* của object (≠ *state* = toàn bộ dữ liệu runtime để tái dựng chính xác). Phục vụ trải nghiệm cấu hình (AutoGen Studio, extension).
- **`dump_component()`** trích config từ component · **`load_component()`** dựng instance từ config.
- Component cấu hình được: kế thừa `Component`, cài `_to_config()` / `_from_config()`, định nghĩa schema Pydantic `BaseModel`. Trường nhạy cảm dùng `SecretStr`.

### B5. Logging
- Dùng `logging` chuẩn của Python, 2 nhóm: **Trace** (`TRACE_LOGGER_NAME`, debug human-readable, format không đảm bảo qua version) và **Structured/Event** (`EVENT_LOGGER_NAME`, event có schema, máy đọc được — handler có thể đọc thẳng dataclass từ `LogRecord.msg`). `ROOT_LOGGER_NAME` quản toàn cục. Tạo child logger theo module.

### B6. OpenTelemetry (tracing)
- Tích hợp sẵn OpenTelemetry, export tới backend tùy chọn. Trace 3 mảng: **Runtime** (cả single-thread & gRPC), **Tools** (`BaseTool` → span `execute_tool`), **Agents** (`BaseChatAgent` → `create_agent`/`invoke_agent`, theo GenAI semantic conventions).
- Cấu hình `TracerProvider` rồi truyền vào runtime; hoặc lấy global provider sẵn có. Tắt: `NoOpTracerProvider` hoặc env `AUTOGEN_DISABLE_RUNTIME_TRACING`.

---

## C. Components Guide

### C1. Model Clients
- Triển khai protocol **`ChatCompletionClient`**. Client sẵn: `OpenAIChatCompletionClient` (OpenAI & tương thích, vd Gemini), `AzureOpenAIChatCompletionClient`, `AzureAIChatCompletionClient`, `AnthropicChatCompletionClient` (exp), `OllamaChatCompletionClient` (exp), `SKChatCompletionAdapter` (Semantic Kernel).
- **`create()`** gửi message nhận đáp · **`create_stream()`** stream token. **Structured output** (OpenAI/Azure) qua schema Pydantic, đặt per-request bằng `extra_create_args`.
- **Caching:** `ChatCompletionCache` bọc client (DiskCacheStore / RedisStore) — hit theo *đúng* argument. **Usage:** `total_usage()`; log qua `EVENT_LOGGER_NAME`. API key tự nạp từ env (`OPENAI_API_KEY`, `AZURE_OPENAI_API_KEY`, `GEMINI_API_KEY`).

### C2. Model Context (quản history)
- **`ChatCompletionContext`** lưu/truy xuất message để sinh đáp. **`BufferedChatCompletionContext`** giữ `buffer_size` message gần nhất (MRU) tránh tràn context; (biến thể head-and-tail giữ cả đầu lẫn cuối). Hữu ích hội thoại nhiều lượt cần nhớ ngữ cảnh mà không vượt token limit.

### C3. Tools
- **Tool** = code chạy được agent dùng để hành động (hàm đơn giản → gọi API phức tạp). **`FunctionTool`** bọc hàm Python, dùng *description + type annotation* để LLM biết khi nào/cách dùng. Mọi tool kế thừa `BaseTool` → tự sinh **JSON schema** (tên, mục đích, tham số, kiểu trả).
- Chạy bằng `run_json(args, cancellation_token)`; kết quả → string qua `return_value_as_string()`. **Pattern agent-có-tool:** model sinh function call → agent chạy tool → bọc `FunctionExecutionResult` → gửi lại model để reflect/đáp (multi-turn action-observation). Có sẵn tool built-in (code execution, HTTP, GraphRAG).

### C4. Workbench (+ MCP)
- **Workbench** = *tập tool chia sẻ state & tài nguyên* (khác từng `Tool` đơn lẻ), cho giao diện gọi nhiều tool thống nhất, kiểu kết quả đồng nhất. Hợp khi nhiều tool liên quan cần state chung (browser, file system).
- **`McpWorkbench`** = client **MCP (Model Context Protocol)**: agent dùng tool host trên **MCP server** ngoài (vd Playwright cho web automation). MCP gồm *server* (host tool + state) ↔ *client* (phía model).

---

## Liên kết
- 8 design pattern dựng trên nền này: [`multi-agent-design-patterns-autogen.md`](multi-agent-design-patterns-autogen.md).
- Đối chiếu & áp cho agent TOSS: [`multi-agent-patterns-applied-toss.md`](multi-agent-patterns-applied-toss.md).

*Crawl 2026-06-22 từ microsoft.github.io/autogen (stable). Bản curated — rút gọn trung thực, không kèm code.*
