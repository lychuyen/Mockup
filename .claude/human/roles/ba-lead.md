---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
role: "BA Lead"
version: "0.1"
date: "2026-07-02"
status: "Draft"
document_type: "Chân dung vai trò con người"
---

# Chân dung Vai trò — BA Lead

> **Người đang giữ vai trò:** BA Lead hiện tại của dự án là người dùng đã xác lập danh tính theo CLAUDE.md §0.4 (sonpx@viettel.com.vn — toàn quyền approve/quyết định, đã ghi nhận trong bộ nhớ phiên). Ma trận §3 của PHAN-CONG-ROLE-BA chưa điền tên đầy đủ đội BA — *(chưa điền — chờ BA Lead)*.

## a) Chân dung & Phạm vi trách nhiệm

Theo PHAN-CONG-ROLE-BA-v0.1.md (v0.2):

- **Mức skill "C — Chủ trì" trên toàn bộ ma trận** (§2.1–2.3): tự thực hiện độc lập, quyết định cuối, output là chuẩn tham chiếu cho nhóm — áp dụng cho mọi skill phân tích (`/interview`, `/stakeholder`, `/asis-tobe`, `/brd`, `/userstory`…), thiết kế (`gen-mockup`, wireframe, `/data-model`) và đầu ra (`export-word`, NKLR, review). Ngoại lệ duy nhất: "Ghi biên bản họp" = **—** (không áp dụng — giao cho các cấp dưới, §2.3).
- **Reviewer mặc định cho tất cả 7 phân hệ** (§3): Quản lý Khai thác Bay, Quản lý Tổ bay, Bảo dưỡng & Kỹ thuật Tàu bay, Khai thác Mặt đất, An toàn & Tuân thủ, Báo cáo & Thống kê, Master Data.
- **Quyền workspace** (§4): W (Approve) trên toàn bộ `ba/sync/` (`requirements/brd`, `requirements/srs`, `models/`, `output/human/exports/`, `output/agents/`); W trên `workspace/drafts/brd/` và `workspace/drafts/quy-trinh/`; R (review) các vùng drafts còn lại.
- Trong quy trình phối hợp (§6): **Review & Approve, quản lý NKLR, Export Word, Publish `sync/`** — điểm cuối của chuỗi Intern/Junior → Mid → Senior → **BA Lead**.
- Theo REVIEW-APPROVAL-FLOW-v0.1.md §1: BA Lead là người **duy nhất có quyền Approve** và promote tài liệu vào `sync/`; là người phân xử khi peer và tác giả bất đồng (§6).

## b) Thẩm quyền quyết định

Từ PHAN-CONG-ROLE-BA §0.1 (BA Human) + CLAUDE.md §0/§0.1/§0.4:

| Thẩm quyền | Nguồn |
|---|---|
| Approve BRD / SRS / Wireframe / Mockup | PHAN-CONG §0.1; REVIEW-APPROVAL §2 (BA Lead review "Bắt buộc" mọi loại) |
| Approve / Reject Change Request (tác động phạm vi + timeline) | PHAN-CONG §0.1 |
| Chọn / thay đổi Document Workflow (P1–P6) | CLAUDE.md §0.1; PHAN-CONG §0.1 |
| Ưu tiên MoSCoW với stakeholder | PHAN-CONG §0.1 |
| Đánh giá "đủ" hay "thiếu" yêu cầu; xác nhận thuật ngữ domain | PHAN-CONG §0.1 (Suy diễn nghiệp vụ) |
| Điền tên nhân sự vào ma trận; điền ngày roadmap | PHAN-CONG §0.1 |
| Phân công phân hệ cho BA; đánh giá chất lượng & nâng level | PHAN-CONG §0.1 (Quản lý nhóm) |
| Xác nhận danh tính/vai trò thành viên mới khi ma trận trống hoặc xung đột | CLAUDE.md §0.4.2 |
| Ký duyệt bản export trước khi giao khách hàng | PHAN-CONG §6 (điểm chuyển giao) |
| Quản lý NKLR (nhật ký thay đổi yêu cầu) — mức C | PHAN-CONG §2.3 |
| Nhận sign-off tài liệu từ stakeholder (ủy quyền pháp lý) | PHAN-CONG §0.1 |
| Xử lý entry TIMELINE thiếu file / xác nhận xóa | CLAUDE.md §8 (Input processing, bước 5) |

## c) Phân hệ phụ trách

- **BA Review mặc định: cả 7 phân hệ** (PHAN-CONG §3).
- Chủ trì / hỗ trợ từng phân hệ: *(chưa điền — chờ BA Lead phân công vào ma trận §3)*.

## d) Làm việc với agent nào (map CLAUDE.md §5)

| Agent | Quan hệ với BA Lead |
|---|---|
| **project-coordinator** | Nhận báo cáo tổng hợp tồn đọng (OID, action items, cờ `[cần xác nhận]`, roadmap) để ra quyết định; agent chỉ tổng hợp, không quyết (§5 cross-cutting) |
| **ba-reviewer / requirement-validator / ui-reviewer** | Chạy Quality Gate / review trước khi BA Lead approve — agent tìm lỗi hình thức + mâu thuẫn, BA Lead phán xét chuyên môn + quyết định cuối (PHAN-CONG §0.3) |
| **business-analyst / srs-writer / data-modeler / process-modeler / gen-mockup** | Output cuối của các agent này chỉ được publish vào `ba/sync/` sau khi BA Lead Approve (PHAN-CONG §6; REVIEW-APPROVAL §1) |
| **export-word** (skill) | BA Lead chủ trì (mức C) việc xuất Word giao khách; ký duyệt trước khi giao (PHAN-CONG §2.3, §6) |

## e) Tình huống agent phải trả việc về BA Lead (CLAUDE.md §0.3 — câu nói bắt buộc)

- Quyết định phạm vi: *"Đây là quyết định nghiệp vụ — BA Lead cần xem xét và quyết định. Tôi có thể chuẩn bị bảng phân tích tác động để hỗ trợ ra quyết định nếu cần."*
- Approve tài liệu: *"Approve tài liệu là thẩm quyền của BA Lead. Tôi có thể chạy Quality Gate check trước để bạn biết tài liệu đã đủ điều kiện chưa."*
- Chọn Document Workflow: *"Chọn Document Workflow là quyết định của BA Lead (CLAUDE.md §0.1). Tôi có thể trình bày so sánh P1–P6 để bạn lựa chọn."*
- Điền tên nhân sự vào ma trận: *"Tác vụ này nhanh hơn nếu bạn tự thực hiện. Mở file `PHAN-CONG-ROLE-BA-v0.1.md`, tìm bảng §3, điền tên vào cột 'BA Chủ trì' và 'BA Hỗ trợ'. Tôi chờ bạn xong để tiếp tục."*

## f) Nguồn trích

1. `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` (v0.2, 2026-06-04) — §0.1, §1, §2.1–2.3, §3, §4, §6.
2. `CLAUDE.md` (v2.14) — §0, §0.1, §0.3, §0.4, §5, §8.
3. `ba/workspace/drafts/quy-trinh/REVIEW-APPROVAL-FLOW-v0.1.md` (v0.1) — §1, §2, §5, §6.
