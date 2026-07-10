---
description: Sinh ma trận RACI và Power-Interest Grid cho dự án, dựa trên danh sách stakeholder và hoạt động chính do người dùng cung cấp.
argument-hint: (không cần tham số — sẽ hỏi tương tác)
allowed-tools: Read, Grep, Glob, Write, Edit, AskUserQuestion, Agent
---

# /stakeholder — Phân tích Các Bên Liên Quan

## Quy trình thực hiện

### Bước 1 — Thu thập danh sách stakeholder

Dùng `AskUserQuestion` hỏi người dùng (tối đa 4 câu):

1. **Phạm vi áp dụng:** Toàn bộ dự án VCM hay một module/sáng kiến cụ thể?
2. **Stakeholder nội bộ:** Liệt kê các vai trò/cá nhân nội bộ tham gia (ví dụ: Sponsor, PM, BA, Dev Lead, QA Lead, End Users...).
3. **Stakeholder bên ngoài:** Có nhà cung cấp, đối tác, cơ quan quản lý nào liên quan không?
4. **Các hoạt động/quyết định chính** của dự án mà cần phân định trách nhiệm? (ví dụ: phê duyệt yêu cầu, ký nghiệm thu, triển khai, đào tạo...)

Nếu thông tin chưa đủ, hỏi bổ sung; không tự bịa danh sách.

### Bước 2 — Đọc tham chiếu

- [.claude/glossary/ba-terms-vi-en.md](.claude/glossary/ba-terms-vi-en.md) — Nhóm 4 (RACI, Stakeholder Analysis).
- [CLAUDE.md §3](CLAUDE.md#3-end-user-personas) — danh sách persona đã định nghĩa cho VCM.

### Bước 3 — Delegate sang business-analyst để sinh 2 bảng

#### 3.1 Ma trận RACI

Định dạng:

| Hoạt động | Sponsor | PM | BA | Dev Lead | QA Lead | End User | Pháp chế | ... |
|---|---|---|---|---|---|---|---|---|
| Phê duyệt phạm vi dự án | **A** | C | R | I | I | C | I | |
| Soạn thảo BRD | I | C | **R/A** | I | I | C | I | |
| Duyệt thiết kế kỹ thuật | I | A | C | **R** | C | I | I | |
| Kiểm thử nghiệm thu (UAT) | I | A | C | C | C | **R** | I | |
| Đào tạo người dùng | I | A | R | C | I | C | I | |

Quy tắc bắt buộc:
- **R = Responsible** (Thực hiện) — có thể nhiều người.
- **A = Accountable** (Chịu trách nhiệm cuối cùng) — **chỉ 1 người duy nhất mỗi hoạt động**.
- **C = Consulted** (Tham vấn 2 chiều).
- **I = Informed** (Thông báo 1 chiều).
- Kiểm tra: mỗi cột không nên có quá nhiều R (quá tải), mỗi hàng phải có đúng 1 A.

#### 3.2 Power-Interest Grid

Dạng bảng phân loại stakeholder theo 4 góc phần tư:

| Quyền lực ↑ / Quan tâm → | Quan tâm **Thấp** | Quan tâm **Cao** |
|---|---|---|
| Quyền lực **Cao** | **Keep Satisfied** (Giữ hài lòng) — VD: Sponsor cấp cao | **Manage Closely** (Quản lý sát sao) — VD: PM, Trưởng đơn vị sử dụng |
| Quyền lực **Thấp** | **Monitor** (Theo dõi) — VD: Phòng ban gián tiếp | **Keep Informed** (Cập nhật thường xuyên) — VD: End user, Hỗ trợ vận hành |

Mỗi stakeholder phải:
- Được đặt vào đúng 1 góc phần tư.
- Kèm chiến lược tương tác cụ thể: tần suất gặp/báo cáo, kênh giao tiếp, nội dung trọng tâm.

#### 3.3 Bảng tổng hợp stakeholder

| Stakeholder | Vai trò | Quyền lực (C/T) | Quan tâm (C/T) | Góc phần tư | Chiến lược tương tác |
|---|---|---|---|---|---|
| {{TÊN}} | {{...}} | Cao/Thấp | Cao/Thấp | Manage Closely / Keep Satisfied / Keep Informed / Monitor | {{...}} |

### Bước 4 — Lưu kết quả

- File: `ba/process/stakeholder-analysis/Stakeholder-VCM-<scope-slug>-v1.0-<YYYY-MM-DD>.md`
- Frontmatter YAML chuẩn.
- Nội dung: (1) Bối cảnh, (2) Danh sách stakeholder, (3) Power-Interest Grid, (4) Ma trận RACI, (5) Chiến lược truyền thông, (6) Checklist hoàn thiện.

## Quy tắc bắt buộc

- **Toàn bộ nội dung bằng tiếng Việt.** RACI / Power-Interest Grid giữ tên gốc (không dịch).
- Mỗi hoạt động trong RACI phải có **đúng 1 A**. Nếu nhiều A → cảnh báo người dùng cần làm rõ.
- Không bịa danh sách stakeholder. Nếu thông tin thiếu, ghi `{{CẦN_BỔ_SUNG}}` và hỏi lại.

## Sau khi hoàn thành

Báo cáo:
1. Số stakeholder đã phân tích.
2. Phân bổ theo 4 góc Power-Interest.
3. Cảnh báo các hoạt động chưa có A rõ ràng (nếu có).
4. Đề xuất 3 stakeholder ưu tiên engage trước.
