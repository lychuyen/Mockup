---
name: dev-philosophies
description: Danh mục các triết lý phát triển phần mềm TÙY CHỌN mà dự án có thể áp dụng (vd. Mô-đun hóa & Tích hợp / "Khắc nhập – Khắc xuất"). CHỈ áp dụng khi con người chủ động chọn — xem CLAUDE.md §0.2. Mở rộng được: thêm option mới dạng DPn.
source: Tổng hợp phương pháp + đánh giá, 2026-06-03
version: "1.0"
date: "2026-06-03"
---

> Bản gốc (AGENTS scope, tiếng Anh): `.claude/knowledge/dev-philosophies.md`. Đồng bộ theo [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md). Liên quan: [`ba-workflow-patterns.md`](ba-workflow-patterns.md).

# Danh mục Triết lý Phát triển Phần mềm (bản tiếng Việt)

**TÙY CHỌN.** Khác với luồng tài liệu (CLAUDE.md §0.1, bắt buộc), triết lý phát triển **chỉ được áp dụng khi con người chủ động chọn** (CLAUDE.md §0.2). Mặc định mọi dự án = **không áp dụng**. Agent hỏi khi khởi động dự án; **không bao giờ tự ý** áp dụng.

| Mã | Triết lý | Một dòng |
|---|---|---|
| DP1 | Mô-đun hóa & Tích hợp ("Khắc nhập – Khắc xuất") | Chia để trị: phân rã thành module độc lập, tích hợp qua contract rõ ràng |

> *Thêm option mới:* nối thêm `## DPn — <tên>` với cùng cấu trúc con (bản chất, khi nào dùng, quy trình, tiêu chí, ghi chú quản trị), thêm dòng vào bảng, bump version, đồng bộ mirror + SYNC-LOG.

---

## DP1 — Mô-đun hóa & Tích hợp ("Khắc nhập – Khắc xuất")

Phân rã + tích hợp dựa trên triết lý *Chia để trị*. "Khắc xuất" = chia hệ thống/SRS lớn thành module độc lập; "Khắc nhập" = gom các mảnh nhỏ thành luồng nghiệp vụ thống nhất.

### Bản chất

| | Khắc xuất (Decomposition) | Khắc nhập (Integration) |
|---|---|---|
| Hành động | Chia hệ thống/tài liệu lớn thành phần nhỏ độc lập | Gom phần nhỏ rời rạc thành luồng thống nhất |
| Mục tiêu | Để *hiểu, làm song song, bảo trì* | Để *vận hành như một thể thống nhất* |
| Tiêu chí cốt lõi | High Cohesion (trong 1 module) | Loose Coupling + contract rõ (giữa các module) |

> **Nghịch lý cần nhớ:** "xuất" và "nhập" là *hai mặt của một quyết định* — cắt ranh giới module ở đâu được quyết định bởi *chúng sẽ ghép lại thế nào*.

### Bước 0 — Contract-first (trước khi phân rã)

```
SAI:  Phân rã hết module → rồi mới nghĩ cách tích hợp
      (ranh giới cắt sai → phá đi làm lại)
ĐÚNG: Xác định Integration Contract trước (API / event / data interface)
      → rồi phân rã phần bên trong mỗi contract
```
Contract = đường kẻ; module = vùng bên trong đường kẻ.

### Giai đoạn 1 — Khắc xuất (Phân rã)

**Chọn TRỤC phân rã** (sai trục = module rác):

| Trục | Dùng khi | Chủ sở hữu |
|---|---|---|
| Theo chức năng (feature) | UI rõ, hành động người dùng cụ thể | BA |
| Theo miền dữ liệu (entity) | Data-centric, nhiều báo cáo | BA + DEV |
| Theo vai trò (RBAC) | Phân quyền phức tạp | BA |
| Theo bounded context (DDD) | Microservice, team độc lập | Architect |

> Cảnh báo: "gom mọi màn hình có nút Lưu" = cohesion *kỹ thuật* cao nhưng vô nghĩa nghiệp vụ. Trục phải neo vào **mục tiêu người dùng**.

**Tách góc nhìn** (BA và DEV phân rã khác nhau):

```
[Hệ thống] → [Phân hệ] → [Module] → [Chức năng / User Story]
   └──── BA sở hữu ────┘  └ overlap ┘  └─── DEV sở hữu ──┘
                         (API contract,   (class, function)
                          data model)
```

| Góc nhìn | Đơn vị | Tiêu chí "chuẩn" |
|---|---|---|
| BA phân rã tài liệu | User Story / Use Case | **INVEST** + **vertical slice** (đủ business value) |
| DEV phân rã code | Module / class / function | **High Cohesion + Loose Coupling** (SOLID) |

**Separation of Concerns:** mỗi mảnh tách rõ Business Logic ⟂ UI/UX ⟂ Data.

### Giai đoạn 2 — Khắc nhập (Tích hợp)

1. **Tích hợp dữ liệu** — khớp trường từ nhiều nguồn về một mô hình nhất quán (ERD trung tâm).
2. **API/Interface theo contract ở Bước 0** — module giao tiếp đúng hợp đồng, không xung đột.
3. **Kiểm thử tích hợp** — đảm bảo Data Flow module→module đúng thiết kế tổng thể (≠ unit test).

### Tiêu chí đánh giá

| Tiêu chí | ❌ Xuất lỗi | ✅ Xuất chuẩn |
|---|---|---|
| Coupling | Đổi 1 module → sập cả hệ thống | Module độc lập; hỏng phần này phần khác vẫn chạy |
| Cohesion | 1 module ôm đồm nhiều việc | Mỗi module giải quyết triệt để 1 bài toán |
| Reusability | Hardcode, không tái dùng | Thành shared library dùng nhiều dự án |
| Maintenance | Dò lỗi mất nhiều tuần | Định vị module lỗi trong vài phút |
| Testability ★ | Không viết test độc lập được | Unit-test từng module riêng |
| User-goal alignment ★ | Chia theo kỹ thuật, lạc mục tiêu | Mỗi mảnh phục vụ 1 mục tiêu người dùng rõ |

> Kiểm tra nhanh nhất: *"Tôi có viết được test độc lập cho module này không?"* — nếu không, coupling quá cao hoặc cohesion quá thấp.

### Ghi chú quản trị (CLAUDE.md §0)
Chọn trục phân rã và ranh giới To-Be là **quyết định thiết kế của con người**. Agent phân rã yêu cầu đã ghi nhận một cách trung thực và đề xuất ranh giới, nhưng không tự bịa logic module hay hành vi tích hợp.
