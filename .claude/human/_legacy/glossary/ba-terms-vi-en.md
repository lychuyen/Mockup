---
name: ba-terms-vi-en
description: Từ điển thuật ngữ Business Analyst song ngữ Anh-Việt, dùng làm chuẩn thống nhất cho mọi deliverable của agent business-analyst.
version: 1.0
date: 2026-05-26
maintainer: business-analyst agent
total_terms: 121
---

# Từ điển Thuật ngữ Business Analyst (BA Glossary — EN ⇄ VI)

## Hướng dẫn sử dụng (Usage Guidelines)

> **BẮT BUỘC** đối với agent `business-analyst`:
>
> 1. **Luôn tra cứu** từ điển này trước khi dịch một thuật ngữ chuyên ngành sang tiếng Việt. Không tự sáng tạo cách dịch mới khi thuật ngữ đã có trong bảng.
> 2. **Dùng đúng cột "Vietnamese"** làm cách dịch chuẩn. Nếu cột "Ghi chú" ghi `Không dịch`, **giữ nguyên tiếng Anh** trong văn bản tiếng Việt (không in nghiêng, không dịch thoát).
> 3. Khi xuất hiện lần đầu trong một tài liệu, viết theo định dạng: `Cách dịch tiếng Việt (English Term)`. Lần sau có thể dùng riêng cách dịch tiếng Việt hoặc tiếng Anh tùy ngữ cảnh.
>    - Ví dụ: `Tiêu chí chấp nhận (Acceptance Criteria)` ở lần đầu, sau đó dùng `Tiêu chí chấp nhận` hoặc `AC` ở lần sau.
> 4. Nếu cột "Ghi chú" ghi `Có nhiều cách dịch`, **ưu tiên cách dịch chính** (đứng đầu trong cột "Vietnamese"); các biến thể chỉ dùng khi ngữ cảnh đặc thù yêu cầu.
> 5. Nếu gặp thuật ngữ **chưa có trong từ điển**, phải:
>    - (a) Đề xuất bản dịch tạm thời ở dạng `Vietnamese tạm dịch (English Term)`.
>    - (b) Ghi chú vào báo cáo để bổ sung vào từ điển ở phiên bản kế tiếp.
> 6. Tên riêng (sản phẩm, công ty, framework, công cụ) **không dịch**: Jira, Confluence, Camunda, Power BI, Figma…
>
> **Mục tiêu:** Nhất quán thuật ngữ xuyên suốt BRD, SRS, FRD, User Story, Use Case, Meeting Minutes và mọi deliverable khác.

---

## Mục lục các nhóm thuật ngữ

1. [Nhóm 1 — Phân tích Yêu cầu (Requirements)](#nhóm-1--phân-tích-yêu-cầu-requirements)
2. [Nhóm 2 — Quy trình & Mô hình hóa (Process & Modeling)](#nhóm-2--quy-trình--mô-hình-hóa-process--modeling)
3. [Nhóm 3 — Agile / Scrum](#nhóm-3--agile--scrum)
4. [Nhóm 4 — Phân tích & Đánh giá (Analysis & Assessment)](#nhóm-4--phân-tích--đánh-giá-analysis--assessment)
5. [Nhóm 5 — Tài liệu & Quản lý (Documentation & Management)](#nhóm-5--tài-liệu--quản-lý-documentation--management)

---

## Nhóm 1 — Phân tích Yêu cầu (Requirements)

| English | Vietnamese | Định nghĩa ngắn (VI) | Ghi chú |
|---|---|---|---|
| Acceptance Criteria | Tiêu chí chấp nhận | Điều kiện cụ thể mà sản phẩm/tính năng phải thỏa mãn để được nghiệm thu. | Viết tắt: AC |
| Actor | Tác nhân | Người, hệ thống hoặc thực thể tương tác với hệ thống đang phân tích. | — |
| Assumption | Giả định | Điều kiện được coi là đúng để phân tích/lập kế hoạch, nhưng chưa được kiểm chứng. | — |
| Business Need | Nhu cầu nghiệp vụ | Vấn đề hoặc cơ hội tổ chức cần giải quyết. | — |
| Business Requirement | Yêu cầu nghiệp vụ | Mục tiêu cấp cao mà giải pháp phải đáp ứng để mang lại giá trị cho tổ chức. | Viết tắt: BR |
| Business Rule | Quy tắc nghiệp vụ | Quy định/điều kiện ràng buộc cách hoạt động nghiệp vụ được thực hiện. | — |
| Constraint | Ràng buộc | Giới hạn áp đặt lên giải pháp (công nghệ, pháp lý, ngân sách…). | — |
| Dependency | Phụ thuộc | Mối quan hệ trong đó một hạng mục cần hạng mục khác hoàn thành trước. | — |
| Elicitation | Khai thác yêu cầu / Thu thập yêu cầu | Quá trình thu thập yêu cầu từ stakeholder qua phỏng vấn, workshop, quan sát… | Có nhiều cách dịch |
| Feasibility | Tính khả thi | Mức độ khả thi của giải pháp về kỹ thuật, kinh tế, vận hành, pháp lý. | — |
| Functional Requirement | Yêu cầu chức năng | Mô tả hành vi cụ thể mà hệ thống phải thực hiện. | Viết tắt: FR |
| Glossary | Bảng thuật ngữ / Từ điển thuật ngữ | Danh sách định nghĩa các thuật ngữ chuyên ngành dùng trong dự án. | Có nhiều cách dịch |
| Goal | Mục tiêu | Kết quả mong muốn ở mức cao mà nỗ lực hướng tới. | — |
| Non-functional Requirement | Yêu cầu phi chức năng | Yêu cầu về chất lượng: hiệu năng, bảo mật, khả dụng, khả năng mở rộng… | Viết tắt: NFR |
| Objective | Mục tiêu cụ thể | Mục tiêu đo lường được, thường tuân theo SMART. | — |
| Persona | Chân dung người dùng | Mô tả hư cấu đại diện cho một nhóm người dùng điển hình. | Thường giữ nguyên `Persona` trong văn cảnh UX |
| Requirement | Yêu cầu | Điều kiện hoặc khả năng mà giải pháp phải có. | — |
| Requirement Prioritization | Sắp xếp ưu tiên yêu cầu | Quá trình xếp hạng yêu cầu theo giá trị/độ khẩn. | — |
| Scope | Phạm vi | Ranh giới của giải pháp/dự án — những gì làm và không làm. | — |
| Scope Creep | Phình phạm vi | Hiện tượng phạm vi mở rộng ngoài kiểm soát so với ban đầu. | Có nhiều cách dịch: "trượt phạm vi" |
| Stakeholder | Bên liên quan | Cá nhân/nhóm có ảnh hưởng hoặc bị ảnh hưởng bởi giải pháp. | — |
| User Need | Nhu cầu người dùng | Điều người dùng thực sự cần (không nhất thiết là điều họ yêu cầu). | — |
| Validation | Thẩm định | Xác nhận giải pháp đáp ứng nhu cầu nghiệp vụ thực sự ("đúng việc"). | — |
| Verification | Kiểm chứng | Xác nhận giải pháp được xây dựng đúng theo đặc tả ("đúng cách"). | — |

---

## Nhóm 2 — Quy trình & Mô hình hóa (Process & Modeling)

| English | Vietnamese | Định nghĩa ngắn (VI) | Ghi chú |
|---|---|---|---|
| Activity Diagram | Sơ đồ hoạt động | Sơ đồ UML mô tả luồng các hoạt động/hành động. | — |
| As-Is | Hiện trạng | Trạng thái/quy trình hiện tại trước khi thay đổi. | Có thể giữ `As-Is` trong tài liệu kỹ thuật |
| BPMN | Mô hình hóa quy trình nghiệp vụ | Chuẩn ký hiệu mô hình hóa quy trình nghiệp vụ (Business Process Model and Notation). | Không dịch (viết tắt chuẩn quốc tế) |
| Business Process | Quy trình nghiệp vụ | Chuỗi hoạt động có thứ tự nhằm đạt mục tiêu nghiệp vụ. | — |
| Class Diagram | Sơ đồ lớp | Sơ đồ UML mô tả các lớp và mối quan hệ giữa chúng. | — |
| Context Diagram | Sơ đồ ngữ cảnh | Sơ đồ thể hiện hệ thống là một hộp đen và tương tác với các thực thể bên ngoài. | — |
| Data Flow Diagram | Sơ đồ luồng dữ liệu | Sơ đồ thể hiện cách dữ liệu chảy giữa các tiến trình, kho dữ liệu và thực thể bên ngoài. | Viết tắt: DFD |
| Entity-Relationship Diagram | Sơ đồ thực thể - mối quan hệ | Sơ đồ mô hình hóa thực thể dữ liệu và quan hệ giữa chúng. | Viết tắt: ERD |
| Event | Sự kiện | Tác nhân kích hoạt một bước trong quy trình. | — |
| Flowchart | Lưu đồ | Sơ đồ luồng các bước trong một quy trình. | Có nhiều cách dịch: "Sơ đồ luồng" |
| Gateway | Cổng quyết định | Ký hiệu BPMN đại diện cho điểm rẽ nhánh/hợp nhánh trong quy trình. | — |
| Pool | Khu vực (Pool) | Trong BPMN, đại diện cho một tổ chức/người tham gia chính. | Không dịch — giữ nguyên `Pool` trong sơ đồ |
| Process Map | Bản đồ quy trình | Biểu diễn trực quan quy trình nghiệp vụ. | — |
| Sequence Diagram | Sơ đồ trình tự | Sơ đồ UML thể hiện trình tự tương tác giữa các đối tượng theo thời gian. | — |
| State Diagram | Sơ đồ trạng thái | Sơ đồ UML mô tả các trạng thái của đối tượng và chuyển đổi giữa chúng. | Còn gọi: State Machine Diagram |
| Sub-process | Quy trình con | Quy trình nằm trong một quy trình lớn hơn. | — |
| Swim Lane | Làn (Swim Lane) | Phân vùng dọc/ngang trong BPMN gán trách nhiệm cho từng vai trò. | Không dịch — phổ biến giữ nguyên |
| To-Be | Trạng thái mục tiêu | Trạng thái/quy trình kỳ vọng sau khi triển khai thay đổi. | Có thể giữ `To-Be` trong tài liệu kỹ thuật |
| UML | Ngôn ngữ mô hình hóa hợp nhất | Unified Modeling Language — chuẩn ký hiệu mô hình hóa phần mềm. | Không dịch (viết tắt chuẩn) |
| Use Case Diagram | Sơ đồ trường hợp sử dụng | Sơ đồ UML mô tả tương tác giữa actor và use case. | — |
| Value Stream Map | Bản đồ chuỗi giá trị | Biểu đồ phân tích luồng vật liệu/thông tin tạo ra giá trị cho khách hàng. | Viết tắt: VSM |
| Workflow | Luồng công việc | Trình tự các bước/nhiệm vụ tự động hoặc thủ công để hoàn thành một công việc. | Có thể giữ `Workflow` |

---

## Nhóm 3 — Agile / Scrum

| English | Vietnamese | Định nghĩa ngắn (VI) | Ghi chú |
|---|---|---|---|
| Acceptance Test | Kiểm thử chấp nhận | Kiểm thử xác nhận tính năng đáp ứng tiêu chí chấp nhận. | — |
| Backlog | Backlog | Danh sách công việc/tính năng có thứ tự ưu tiên cần thực hiện. | Không dịch |
| Backlog Grooming | Tinh chỉnh backlog | Hoạt động rà soát, làm rõ và ước lượng các mục trong backlog. | Còn gọi: Backlog Refinement |
| Burndown Chart | Biểu đồ Burndown | Biểu đồ thể hiện khối lượng công việc còn lại theo thời gian. | Không dịch |
| Daily Standup | Họp đứng hằng ngày | Cuộc họp ngắn (≤ 15 phút) đầu ngày của đội Scrum. | Còn gọi: Daily Scrum |
| Definition of Done | Định nghĩa Hoàn thành | Bộ tiêu chí xác định khi nào một hạng mục được coi là hoàn thành. | Viết tắt: DoD — thường giữ nguyên |
| Definition of Ready | Định nghĩa Sẵn sàng | Bộ tiêu chí xác định khi nào một user story sẵn sàng đưa vào sprint. | Viết tắt: DoR |
| Epic | Epic | Khối công việc lớn, chứa nhiều user story, thường vượt quá một sprint. | Không dịch |
| Feature | Tính năng | Khả năng/chức năng mang lại giá trị cho người dùng. | — |
| Iteration | Vòng lặp | Khoảng thời gian cố định để phát triển một phần sản phẩm. | Trong Scrum đồng nghĩa với Sprint |
| Kanban | Kanban | Phương pháp quản lý công việc dựa trên bảng trực quan và giới hạn WIP. | Không dịch |
| MVP | Sản phẩm khả dụng tối thiểu | Phiên bản tối thiểu của sản phẩm đủ để kiểm chứng giả thuyết với người dùng. | Minimum Viable Product — thường giữ nguyên viết tắt MVP |
| Product Backlog | Backlog sản phẩm | Danh sách tất cả các hạng mục cần thực hiện cho sản phẩm. | — |
| Product Owner | Product Owner | Người chịu trách nhiệm tối đa hóa giá trị sản phẩm và quản lý backlog. | Không dịch — Viết tắt: PO |
| Refinement | Tinh chỉnh | Hoạt động làm rõ, ước lượng và sắp xếp lại các mục backlog. | — |
| Retrospective | Họp cải tiến (Retrospective) | Cuộc họp cuối sprint để đội rút kinh nghiệm và cải tiến. | Có thể giữ `Retro` |
| Scrum | Scrum | Khung làm việc Agile phổ biến với sprint, sự kiện và vai trò chuẩn. | Không dịch |
| Scrum Master | Scrum Master | Người hỗ trợ đội tuân thủ Scrum, gỡ rào cản, đào tạo. | Không dịch |
| Sprint | Sprint | Chu kỳ phát triển cố định (thường 1–4 tuần) trong Scrum. | Không dịch |
| Sprint Backlog | Sprint Backlog | Tập hợp công việc đội cam kết thực hiện trong sprint. | Không dịch |
| Sprint Goal | Mục tiêu sprint | Mục đích chung mà đội hướng đến trong một sprint. | — |
| Sprint Planning | Họp lập kế hoạch sprint | Cuộc họp đầu sprint để chọn và lên kế hoạch các hạng mục. | — |
| Sprint Review | Họp rà soát sprint | Cuộc họp cuối sprint trình bày kết quả với stakeholder. | — |
| Story Point | Điểm story (Story Point) | Đơn vị ước lượng độ phức tạp/nỗ lực tương đối của user story. | Không dịch — phổ biến giữ nguyên |
| Timebox | Khung thời gian cố định | Khoảng thời gian được ấn định cố định cho một hoạt động. | — |
| User Story | Câu chuyện người dùng | Mô tả ngắn một tính năng theo góc nhìn người dùng ("Là một… tôi muốn… để…"). | Viết tắt: US |
| Velocity | Velocity | Tổng story point mà đội hoàn thành trung bình trong một sprint. | Không dịch |
| WIP Limit | Giới hạn công việc đang thực hiện | Số lượng tối đa công việc được phép tồn đọng ở một trạng thái. | Work-In-Progress Limit |

---

## Nhóm 4 — Phân tích & Đánh giá (Analysis & Assessment)

| English | Vietnamese | Định nghĩa ngắn (VI) | Ghi chú |
|---|---|---|---|
| 5 Whys | 5 lần Tại sao | Kỹ thuật đặt câu hỏi "tại sao" liên tiếp để tìm nguyên nhân gốc rễ. | Có nhiều cách dịch: "5 Whys" thường giữ nguyên |
| Benchmarking | Đối sánh chuẩn | So sánh hiệu quả với chuẩn ngành hoặc đối thủ. | Có thể giữ `Benchmarking` |
| Brainstorming | Họp động não | Kỹ thuật tạo ý tưởng nhóm không phán xét. | Có thể giữ `Brainstorming` |
| Cost-Benefit Analysis | Phân tích chi phí - lợi ích | Đánh giá định lượng chi phí so với lợi ích của một phương án. | Viết tắt: CBA |
| Critical Success Factor | Yếu tố thành công then chốt | Điều kiện cần phải có để dự án/sáng kiến thành công. | Viết tắt: CSF |
| Fishbone Diagram | Sơ đồ xương cá | Công cụ Ishikawa phân tích nguyên nhân - kết quả theo nhóm. | Còn gọi: Ishikawa Diagram |
| Gap Analysis | Phân tích khoảng cách | Đối chiếu hiện trạng và mục tiêu để xác định các khoảng cần thu hẹp. | — |
| Heat Map | Bản đồ nhiệt | Biểu đồ trực quan hóa dữ liệu bằng màu sắc thể hiện mức độ. | Có thể giữ `Heat Map` |
| Impact Analysis | Phân tích tác động | Đánh giá ảnh hưởng của một thay đổi đến hệ thống/quy trình/tổ chức. | — |
| KPI | Chỉ số đo lường hiệu quả chính | Key Performance Indicator — chỉ số định lượng đánh giá hiệu quả. | Không dịch (viết tắt phổ biến) |
| Lessons Learned | Bài học kinh nghiệm | Tổng kết kinh nghiệm rút ra sau dự án/giai đoạn. | — |
| MoSCoW | MoSCoW | Phương pháp ưu tiên: Must / Should / Could / Won't have. | Không dịch |
| OKR | Mục tiêu & Kết quả then chốt | Objectives and Key Results — khung quản trị mục tiêu. | Không dịch (viết tắt phổ biến) |
| PESTLE Analysis | Phân tích PESTLE | Phân tích yếu tố Chính trị, Kinh tế, Xã hội, Công nghệ, Pháp lý, Môi trường. | Không dịch tên PESTLE |
| RACI Matrix | Ma trận RACI | Ma trận phân định Responsible / Accountable / Consulted / Informed. | Không dịch |
| Risk Assessment | Đánh giá rủi ro | Quá trình xác định, phân tích và xếp hạng rủi ro. | — |
| Risk Mitigation | Giảm thiểu rủi ro | Hành động giảm xác suất hoặc tác động của rủi ro. | — |
| Root Cause Analysis | Phân tích nguyên nhân gốc rễ | Phương pháp tìm nguyên nhân cốt lõi của vấn đề. | Viết tắt: RCA |
| ROI | Tỷ suất hoàn vốn | Return on Investment — tỷ lệ lợi nhuận so với chi phí đầu tư. | Không dịch (viết tắt phổ biến) |
| SIPOC | SIPOC | Khung tổng quan quy trình: Supplier, Input, Process, Output, Customer. | Không dịch |
| SMART | SMART | Tiêu chí mục tiêu: Specific, Measurable, Achievable, Relevant, Time-bound. | Không dịch |
| Stakeholder Analysis | Phân tích các bên liên quan | Phân loại stakeholder theo mức ảnh hưởng và quan tâm. | — |
| SWOT Analysis | Phân tích SWOT | Phân tích Strengths, Weaknesses, Opportunities, Threats. | Không dịch tên SWOT |
| Trade-off | Đánh đổi | Sự cân nhắc giữa các phương án có lợi ích/chi phí khác nhau. | Có thể giữ `Trade-off` |
| Value Chain | Chuỗi giá trị | Chuỗi hoạt động tạo ra giá trị cho khách hàng. | — |

---

## Nhóm 5 — Tài liệu & Quản lý (Documentation & Management)

| English | Vietnamese | Định nghĩa ngắn (VI) | Ghi chú |
|---|---|---|---|
| Baseline | Baseline (mốc chuẩn) | Phiên bản tài liệu/yêu cầu được phê duyệt làm gốc so sánh. | Không dịch — phổ biến giữ nguyên |
| BRD | Tài liệu yêu cầu nghiệp vụ | Business Requirements Document. | Không dịch (viết tắt) |
| Change Control Board | Hội đồng kiểm soát thay đổi | Nhóm có thẩm quyền phê duyệt/từ chối các change request. | Viết tắt: CCB |
| Change Log | Nhật ký thay đổi | Bản ghi lịch sử các thay đổi đã phê duyệt. | — |
| Change Request | Yêu cầu thay đổi | Đề xuất chính thức để thay đổi phạm vi/yêu cầu/lịch trình. | Viết tắt: CR |
| FRD | Tài liệu yêu cầu chức năng | Functional Requirements Document. | Không dịch (viết tắt) |
| Issue Log | Nhật ký vấn đề | Danh sách các vấn đề phát sinh và trạng thái xử lý. | — |
| Meeting Minutes | Biên bản họp | Bản ghi nội dung, quyết định và action items của cuộc họp. | Viết tắt: MoM |
| Project Charter | Điều lệ dự án | Tài liệu chính thức cho phép dự án khởi động, nêu mục tiêu và phạm vi. | — |
| RACI Chart | Bảng RACI | Bảng phân định trách nhiệm theo RACI. | Không dịch tên RACI |
| Release Notes | Ghi chú phát hành | Tài liệu liệt kê thay đổi trong một phiên bản phát hành. | Có thể giữ `Release Notes` |
| Requirements Specification | Đặc tả yêu cầu | Tài liệu mô tả chi tiết các yêu cầu của hệ thống. | — |
| RFP | Yêu cầu báo giá đề xuất | Request for Proposal — văn bản mời nhà cung cấp gửi đề xuất giải pháp. | Không dịch (viết tắt phổ biến) |
| Sign-off | Ký nghiệm thu / Ký duyệt | Hành động phê duyệt chính thức của stakeholder. | Có nhiều cách dịch |
| SLA | Cam kết mức dịch vụ | Service Level Agreement — thỏa thuận mức dịch vụ. | Không dịch (viết tắt phổ biến) |
| SOW | Phạm vi công việc | Statement of Work — văn bản mô tả phạm vi công việc giao thầu. | Không dịch (viết tắt phổ biến) |
| SRS | Đặc tả yêu cầu phần mềm | Software Requirements Specification. | Không dịch (viết tắt) |
| Status Report | Báo cáo trạng thái | Báo cáo định kỳ về tiến độ, rủi ro và vấn đề của dự án. | — |
| Traceability Matrix | Ma trận truy vết | Ma trận liên kết yêu cầu với thiết kế, mã nguồn và test case. | Viết tắt: RTM (Requirements Traceability Matrix) |
| Use Case | Trường hợp sử dụng | Mô tả tương tác giữa actor và hệ thống để đạt một mục tiêu. | Viết tắt: UC |
| Version Control | Quản lý phiên bản | Hệ thống/quá trình kiểm soát thay đổi của tài liệu/mã nguồn. | — |
| WBS | Cấu trúc phân rã công việc | Work Breakdown Structure — phân rã công việc thành các đơn vị nhỏ hơn. | Không dịch (viết tắt phổ biến) |

---

## Phụ lục — Quy ước viết tắt phổ biến

| Viết tắt | Đầy đủ (EN) | Cách dịch tiếng Việt |
|---|---|---|
| AC | Acceptance Criteria | Tiêu chí chấp nhận |
| BA | Business Analyst | Chuyên viên phân tích nghiệp vụ |
| BR | Business Requirement | Yêu cầu nghiệp vụ |
| BRD | Business Requirements Document | Tài liệu yêu cầu nghiệp vụ |
| CCB | Change Control Board | Hội đồng kiểm soát thay đổi |
| CR | Change Request | Yêu cầu thay đổi |
| DoD | Definition of Done | Định nghĩa Hoàn thành |
| DoR | Definition of Ready | Định nghĩa Sẵn sàng |
| FR | Functional Requirement | Yêu cầu chức năng |
| FRD | Functional Requirements Document | Tài liệu yêu cầu chức năng |
| KPI | Key Performance Indicator | Chỉ số đo lường hiệu quả chính |
| MoM | Minutes of Meeting | Biên bản họp |
| MVP | Minimum Viable Product | Sản phẩm khả dụng tối thiểu |
| NFR | Non-functional Requirement | Yêu cầu phi chức năng |
| OKR | Objectives and Key Results | Mục tiêu & Kết quả then chốt |
| PO | Product Owner | (Không dịch) |
| RACI | Responsible/Accountable/Consulted/Informed | Ma trận RACI |
| RCA | Root Cause Analysis | Phân tích nguyên nhân gốc rễ |
| ROI | Return on Investment | Tỷ suất hoàn vốn |
| RTM | Requirements Traceability Matrix | Ma trận truy vết yêu cầu |
| SLA | Service Level Agreement | Cam kết mức dịch vụ |
| SOW | Statement of Work | Phạm vi công việc |
| SRS | Software Requirements Specification | Đặc tả yêu cầu phần mềm |
| UAT | User Acceptance Testing | Kiểm thử chấp nhận người dùng |
| UC | Use Case | Trường hợp sử dụng |
| US | User Story | Câu chuyện người dùng |
| WBS | Work Breakdown Structure | Cấu trúc phân rã công việc |
| WIP | Work In Progress | Công việc đang thực hiện |

---

## Lịch sử thay đổi (Change Log)

| Phiên bản | Ngày | Người sửa | Nội dung |
|---|---|---|---|
| 1.0 | 2026-05-26 | business-analyst agent | Phát hành lần đầu — 121 thuật ngữ thuộc 5 nhóm |
