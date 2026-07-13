---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "README — cơ chế đối chiếu Function-list ↔ ba/sync/"
version: "0.2"
date: "2026-07-10"
status: "Active"
---

# Cơ chế đối chiếu Function-list ↔ `ba/sync/`

Mục đích: phát hiện khi sheet **Function-list** (nguồn W.B.S đầy đủ 12 module — [link](https://docs.google.com/spreadsheets/d/15icZM004vwMt0YvUbrLpj-2Z40T0QXsE/edit?gid=1588738845#gid=1588738845)) có chức năng **mới hoặc cập nhật** mà SRS trong `ba/sync/<module>/srs/` chưa phản ánh — để BA kịp bổ sung/cập nhật yêu cầu.

## Cách chạy

```powershell
# Bước 1 — kéo bản Function-list mới nhất (chỉ pull khi sheet đã đổi, có git diff cấp dòng)
python .claude/skills/crawl-pdf/scripts/gdrive-reconcile.py `
  15icZM004vwMt0YvUbrLpj-2Z40T0QXsE `
  ba/workspace/drafts/phan-tich/01-nguon/VNA-TOSS-Function-list-v1.0.extracted.md

# Bước 2 — đối chiếu với toàn bộ ba/sync/, ghi báo cáo vào thư mục này
python .claude/skills/crawl-pdf/scripts/check-function-list-vs-sync.py
```

Script Bước 2 tự lấy 12 module theo mã W.B.S (1=Live Operations … 12=Home), so khớp tên "Chức năng" trong Function-list với cột "Chức năng" trong `CATALOG.md` của từng module (so khớp chuỗi con + trùng từ khoá — **heuristic, không phải AI suy diễn**), rồi ghi báo cáo `FUNCTION-LIST-RECONCILE-<ngày>.md` liệt kê mọi dòng "CHƯA THẤY TRONG SRS".

## Quy tắc dùng báo cáo (BẮT BUỘC — CLAUDE.md §0)

Báo cáo là **danh sách ứng viên cần rà tay**, KHÔNG phải kết luận yêu cầu mới đã xác nhận:
1. So khớp chỉ dựa văn bản (không hiểu ngữ nghĩa) — có thể báo sai (vd 2 chức năng cùng tên "Lọc trên danh sách" ở 2 nhóm khác nhau vẫn coi là 1, hoặc tên viết khác đi bị báo nhầm là thiếu).
2. Mỗi dòng "CHƯA THẤY TRONG SRS" phải được **BA phụ trách phân hệ đó rà tay** — xác nhận đúng là thiếu thật hay chỉ là lệch cách đặt tên.
3. Sau khi xác nhận là yêu cầu mới/thay đổi thật → tạo mục NKLR trong thư mục này (`NKLR-TOSS-<phạm-vi>-v<X.Y>-<ngày>.md`, quy ước tại `CHANGE-CONTROL-SOP-v0.1.md`) trước khi sửa BRD/nhắc BA soạn SRS bổ sung.

## Tần suất chạy

Không cố định — chạy khi: (a) BA Lead yêu cầu rà soát định kỳ, (b) trước khi đóng gói bàn giao GitLab, hoặc (c) sau khi biết Function-list vừa được cập nhật (kiểm tra nhanh không cần pull: `gdrive-reconcile.py ... --pull-only` hoặc xem `source_modified` trong frontmatter bản `.extracted.md` hiện có).

## Lịch sử báo cáo

| Ngày | File | Tổng dòng cần rà | Ghi chú |
|---|---|---|---|
| 2026-07-10 | [`FUNCTION-LIST-RECONCILE-2026-07-10.md`](FUNCTION-LIST-RECONCILE-2026-07-10.md) | 61 | Lần đầu chạy — Report (38) và Authentication (6) chưa có SRS nên toàn bộ bị flag; Station Manager/Data Source Monitoring/Mail cảnh báo/Job đồng bộ chưa có dòng nào trong Function-list |

## Chiều ngược lại — điền cột SRS MD trên sheet "Theo dõi tiến độ sản xuất"

Sheet Jira/Sprint tracking ([link](https://docs.google.com/spreadsheets/d/1py4FFMLgwGYamsEjwDBhQfX1uopK_jGbWnwjoSgZf0g)) có cột **SRS MD** (cột A, tab Sprint 1 + Sprint 2 — Sprint 3 hiện chưa có cột này) để trỏ tới file SRS chi tiết tương ứng trong `ba/sync/`. Giá trị chỉ ghi **tên file** (vd `TOSS.SA.USER_LIST.FD.v0.1.md`), không kèm đường dẫn thư mục — tìm file bằng tên trong `ba/sync/<module>/srs/_parts/`. Chiều này lấy dữ liệu **từ dự án bổ sung LÊN sheet** (ngược với đối chiếu Function-list ở trên).

**Cách làm (chạy 1 lần 2026-07-10, chưa đóng gói thành script cố định — làm thủ công theo yêu cầu):**
1. So khớp (Module, Chức năng, Feature) của từng dòng Sprint với cột "Chức năng" trong `CATALOG.md` mỗi module (chỉ áp dụng module đã có SRS phân rã: FD/FLC/DM/SA) — heuristic chuỗi con + trùng từ khoá, y hệt cơ chế Function-list ở trên.
2. **Chỉ ghi lên sheet các dòng điểm khớp ≥ 0.85** (gần như khớp chính xác) — ghi theo ô riêng lẻ (`batch_update` theo range, KHÔNG clear+rewrite cả tab) để không đụng dữ liệu khác của team đang dùng sheet.
3. Dòng điểm khớp 0.5–0.85 → **KHÔNG tự ghi**, xuất báo cáo riêng để BA rà tay rồi tự điền.
4. Dòng thuộc module chưa có SRS phân rã (Authentication, Home, Report...) → bỏ qua, đã có trong báo cáo Function-list ở trên.

**Kết quả lần chạy 2026-07-10:** 152 dòng Sprint 1/2/3 có Module thuộc FD/FLC/DM/SA; 80 dòng ghi tự động (điểm ≥0.85); 49 dòng cần rà tay → [`GITCODE-CAN-RA-2026-07-10.md`](GITCODE-CAN-RA-2026-07-10.md); 23 dòng module chưa có SRS (Authentication 16, Home 4, không match 3) không xử lý.

---

*v0.2 — 2026-07-10: bổ sung chiều ghi ngược (SRS MD lên sheet tracking).*
*v0.1 — 2026-07-10: tạo mới cơ chế đối chiếu, theo yêu cầu BA Lead.*
