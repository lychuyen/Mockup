---
name: agile-scrum-vn
description: Tham chiếu mở rộng cho Agile/Scrum — ceremony, role, artifact và các khái niệm chính, giải thích bằng tiếng Việt cho đội VCM. Liên kết với glossary ba-terms-vi-en.md.
source: Scrum Guide 2020, Agile Manifesto, kinh nghiệm thực tế đội Việt Nam
version: "1.0"
date: "2026-05-26"
---

> Bản canonical (AGENTS scope) tại `.claude/knowledge/agile-scrum-vn.md`. Đồng bộ theo [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md). Glossary đối chiếu: [`.claude/human/glossary/ba-terms-vi-en.md`](../glossary/ba-terms-vi-en.md) — Nhóm 3.

# Agile / Scrum cho đội VCM (HUMAN scope)

Tài liệu này là **bản giải thích chi tiết bằng tiếng Việt** về Agile/Scrum cho đội VCM. Mục tiêu: chuẩn hóa cách hiểu và sử dụng các khái niệm Scrum khi viết user story, lập kế hoạch sprint, và đánh giá tiến độ.

---

## 1. Tuyên ngôn Agile (Agile Manifesto)

**4 giá trị cốt lõi** (bên trái được ưu tiên hơn bên phải, nhưng cả hai đều có giá trị):

1. **Cá nhân và tương tác** hơn là quy trình và công cụ.
2. **Phần mềm chạy được** hơn là tài liệu đầy đủ.
3. **Hợp tác với khách hàng** hơn là đàm phán hợp đồng.
4. **Phản hồi với thay đổi** hơn là tuân theo kế hoạch.

> **Lưu ý cho BA:** "Working software" không có nghĩa là **không cần** tài liệu BRD/SRS/FRD. Tài liệu vẫn cần — nhưng vừa đủ để hỗ trợ phần mềm hoạt động, không quá nhiều để cản trở giao hàng.

---

## 2. Khung Scrum — 3 trụ cột, 3 vai trò, 5 sự kiện, 3 artifact

### 2.1 Ba trụ cột (Kiểm soát quy trình thực nghiệm)

- **Minh bạch (Transparency)** — công việc và tiến độ ai cũng thấy được.
- **Kiểm tra (Inspection)** — rà soát artifact và tiến độ thường xuyên.
- **Thích nghi (Adaptation)** — điều chỉnh dựa trên kết quả kiểm tra.

### 2.2 Ba vai trò

| Vai trò (EN) | Vai trò (VI) | Trách nhiệm chính |
|---|---|---|
| **Product Owner (PO)** | Chủ sản phẩm | Tối đa hóa giá trị sản phẩm. Sở hữu Product Backlog, ưu tiên các hạng mục, đại diện cho stakeholder/khách hàng. **Chỉ 1 PO duy nhất** cho mỗi product. |
| **Scrum Master (SM)** | Người dẫn dắt Scrum | Phục vụ đội như "servant-leader". Gỡ rào cản, đào tạo về Scrum, bảo vệ đội khỏi nhiễu loạn. **Không** phải project manager truyền thống. |
| **Developers** | Đội phát triển | Đa năng (cross-functional). Tự tổ chức công việc trong sprint. Cùng cam kết Sprint Goal. 3–9 người là kích thước khuyến nghị. |

> **Trong VCM:** PO có thể là **Trưởng phòng Mua sắm** (đại diện nghiệp vụ); SM thường là một thành viên BA hoặc PM được đào tạo Scrum.

### 2.3 Năm sự kiện (Ceremonies)

| Sự kiện | Thời lượng (sprint 2 tuần) | Mục đích |
|---|---|---|
| **Sprint** | 2 tuần (1–4 tuần) | Hộp chứa mọi sự kiện khác. Mỗi sprint sinh ra một Increment dùng được. |
| **Sprint Planning** | ≤ 4 giờ | Lập kế hoạch sprint: **LÀM GÌ** (Sprint Goal + hạng mục) và **LÀM THẾ NÀO** (kế hoạch chi tiết). |
| **Daily Scrum** | 15 phút | Họp đứng hằng ngày. Kiểm tra tiến độ hướng tới Sprint Goal, lộ ra rào cản. KHÔNG phải báo cáo trạng thái. |
| **Sprint Review** | ≤ 2 giờ | Trình bày Increment với stakeholder. Thu thập phản hồi. Điều chỉnh Product Backlog. |
| **Sprint Retrospective** | ≤ 1.5 giờ | Đội phản ánh về **cách làm việc** (con người, quy trình, công cụ). Đưa ra 1–3 hành động cải tiến cho sprint sau. |

Bổ sung: **Backlog Refinement** (~10% công suất sprint) — hoạt động liên tục để làm rõ và ước lượng các hạng mục backlog.

### 2.4 Ba artifact (+ cam kết tương ứng)

| Artifact | Cam kết (Commitment) | Mục đích |
|---|---|---|
| **Product Backlog** | Product Goal (Mục tiêu Sản phẩm) | Danh sách có thứ tự mọi thứ có thể cần làm cho sản phẩm. Sống động, thay đổi liên tục. |
| **Sprint Backlog** | Sprint Goal (Mục tiêu Sprint) | Tập hợp hạng mục PBI đã chọn cho sprint + kế hoạch giao Increment. |
| **Increment** | Definition of Done (DoD — Định nghĩa Hoàn thành) | Bước cụ thể tiến gần Product Goal. **Dùng được**, **đáp ứng DoD**. |

---

## 3. Ước lượng và đo lường

- **Story Point** — ước lượng tương đối về **độ phức tạp + nỗ lực + bất định** (KHÔNG phải giờ).
- **Planning Poker** — đội ước lượng đồng thời bằng dãy Fibonacci (1, 2, 3, 5, 8, 13, 21).
- **Velocity** — trung bình story point hoàn thành mỗi sprint trong vài sprint gần nhất. Dùng để **dự báo**, KHÔNG dùng để **đánh giá hiệu suất cá nhân/đội**.
- **T-Shirt Sizing** — XS/S/M/L/XL cho ước lượng thô ở giai đoạn sớm.

> **Cảnh báo:** So sánh velocity giữa các đội là **anti-pattern** (đi ngược triết lý Scrum). Velocity là tương đối theo từng đội.

---

## 4. Định dạng User Story

```
Là một <persona>,
tôi muốn <hành động hoặc tính năng>,
để <giá trị nghiệp vụ>.
```

> **Ví dụ:** Là một **Cán bộ Mua sắm**, tôi muốn **được thông báo khi đơn của tôi đã được duyệt**, để **kịp thời chuyển sang bước tiếp theo và không phải tự kiểm tra thủ công**.

**Acceptance Criteria** dùng định dạng **Given-When-Then** (Cho trước – Khi – Thì).

**Kiểm tra INVEST** cho mỗi story:
- **I**ndependent — Độc lập, không bị chặn bởi story khác.
- **N**egotiable — Thương lượng được, chi tiết chưa cố định.
- **V**aluable — Có giá trị rõ ràng cho người dùng.
- **E**stimable — Ước lượng được.
- **S**mall — Đủ nhỏ để hoàn thành trong 1 sprint.
- **T**estable — Kiểm thử được.

---

## 5. Các kỹ thuật ưu tiên (Prioritization)

| Kỹ thuật | Khi nào dùng |
|---|---|
| **MoSCoW** (Must/Should/Could/Won't) | Thống nhất stakeholder nhanh; dùng cho BRD/SRS |
| **WSJF** (Weighted Shortest Job First) | Môi trường SAFe; tập trung vào "chi phí trễ" |
| **Kano** | Phân biệt tính năng cơ bản vs. tạo bất ngờ |
| **RICE** (Reach, Impact, Confidence, Effort) | Sản phẩm growth, có dữ liệu định lượng |

---

## 6. Definition of Done (DoD) — Ví dụ áp dụng cho VCM

Một hạng mục (PBI) được coi là "Done" khi:

- [ ] Code đã review và merge vào nhánh chính (main).
- [ ] Unit test pass; coverage ≥ 80%.
- [ ] Integration test pass trên môi trường staging.
- [ ] Acceptance Criteria được QA xác thực.
- [ ] Tài liệu cập nhật (FRD / API docs).
- [ ] Product Owner chấp nhận trong Sprint Review.

DoD phải **được áp dụng thực tế** — không phải là wishlist.

---

## 7. Definition of Ready (DoR) — Ví dụ áp dụng cho VCM

Một story được coi là "Ready" để đưa vào sprint khi:

- [ ] Đúng định dạng "Là một / tôi muốn / để".
- [ ] Có ≥ 2 Acceptance Criteria theo "Cho trước – Khi – Thì".
- [ ] Đã qua INVEST check.
- [ ] Story Point đã được ước lượng.
- [ ] Không có phụ thuộc chặn (blocking dependency).
- [ ] PO đã chấp nhận là next-up trong backlog.

---

## 8. Kanban (bổ trợ Scrum)

- **Pull-based** — công việc được **kéo** khi có năng lực, không bị **đẩy** theo deadline.
- **WIP limit** — giới hạn số hạng mục trong mỗi cột; phơi bày nút thắt cổ chai.
- **Cycle time** — thời gian từ start đến done; chỉ số chính của dòng chảy.
- **Cumulative Flow Diagram (CFD)** — biểu đồ trực quan hóa dòng chảy theo thời gian.

Kết hợp với Scrum → **Scrumban**, phổ biến cho đội maintenance hoặc support.

---

## 9. Cạm bẫy thường gặp

- **Daily Scrum biến thành báo cáo trạng thái** thay vì lộ rào cản.
- **Velocity dùng để so sánh các đội** — đi ngược triết lý.
- **Sprint không có Sprint Goal** — chỉ là danh sách task rời rạc.
- **PO chia thời gian cho 5+ đội** — quyết định chậm, ưu tiên không nhất quán.
- **"Mini-waterfall" bên trong sprint** — phân tích → thiết kế → code → test tuần tự, không lặp.
- **DoD là wishlist** — đẹp trên giấy, không enforce thực tế.

---

## 10. Liên kết với hệ sinh thái VCM

| Khái niệm Scrum | Tài nguyên VCM tương ứng |
|---|---|
| User Story format | [Template User Story](../templates/ba/user-story-template.md) |
| Acceptance Criteria | Định dạng Cho trước-Khi-Thì trong template |
| Definition of Done | Sẽ được công ty bổ sung trong [company-process-standards.md](company-process-standards.md) |
| Backlog Refinement | Slash command `/userstory <feature>` để phân rã feature thành story |

Tra cứu thuật ngữ chi tiết: [`.claude/human/glossary/ba-terms-vi-en.md`](../glossary/ba-terms-vi-en.md) — **Nhóm 3 Agile/Scrum** có 28 thuật ngữ song ngữ.
