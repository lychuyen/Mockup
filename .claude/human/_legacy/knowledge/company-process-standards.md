---
name: company-process-standards
description: Template trống cho chuẩn nội bộ công ty về quy trình BA. User điền sau theo chính sách thực tế của tổ chức.
status: "PLACEHOLDER — CHỜ USER ĐIỀN"
version: "0.1"
date: "2026-05-26"
---

> Bản canonical (AGENTS scope) tại `.claude/knowledge/company-process-standards.md`. Đồng bộ theo [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md).
>
> **TRẠNG THÁI: PLACEHOLDER.** File này cố ý để trống. Hãy điền các chuẩn nội bộ thực tế của công ty bạn.

# Chuẩn Quy trình Nội bộ Công ty (HUMAN scope)

## Hướng dẫn điền file này

File này ghi lại các **chuẩn riêng của công ty** — sẽ **được áp dụng trước** so với hướng dẫn chung trong [CLAUDE.md](../../../CLAUDE.md), BABOK, hay template mặc định.

**Các bước điền:**

1. Điền nội dung vào 5 mục bên dưới.
2. Xóa dòng `TRẠNG THÁI: PLACEHOLDER` trong frontmatter.
3. Cập nhật frontmatter: `version: "1.0"`, `date: "<ngày-hôm-nay>"`.
4. **Đồng bộ bản canonical** tại `.claude/knowledge/company-process-standards.md` (xem [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md)).
5. Ghi log vào `.claude/sync/SYNC-LOG.md`.

Mọi agent sinh deliverable BA (`business-analyst`, `ba-reviewer`...) sẽ **đọc file này đầu tiên** và áp dụng các chuẩn của công ty thay vì chuẩn chung.

---

## 1. Quy trình Phê duyệt Tài liệu

> **CẦN ĐIỀN:** Mô tả các bước phê duyệt cho từng loại deliverable. Ai soạn → ai review → ai duyệt → lưu chữ ký phê duyệt ở đâu?

| Loại tài liệu | Người soạn | Người review | Người phê duyệt cuối | Nơi lưu sign-off |
|---|---|---|---|---|
| BRD | _vd: BA Lead_ | _vd: PM, Sponsor_ | _vd: Sponsor_ | _vd: Confluence approval workflow_ |
| SRS | | | | |
| FRD | | | | |
| User Story | | | | |
| Change Request | | | _vd: CCB_ | |
| Meeting Minutes | | | | |
| Gap Analysis | | | | |

**Quy tắc phê duyệt:**
- _Ví dụ: BRD cần ≥ 2 chữ ký (Sponsor + Trưởng đơn vị sử dụng)_
- _Ví dụ: Change Request High/Critical phải qua CCB_

---

## 2. Quy ước Version Control cho Deliverable

> **CẦN ĐIỀN:** Cách đánh số phiên bản, khi nào bump major/minor, chiến lược branching/baseline.

- **Định dạng:** _vd: `vMAJOR.MINOR` (`v1.0`, `v1.1`, `v2.0`)_
- **Bump major khi:** _vd: thay đổi phạm vi, viết lại cấu trúc, re-baseline sau phê duyệt_
- **Bump minor khi:** _vd: bổ sung nội dung, làm rõ trong baseline đã phê duyệt_
- **Bản nháp chưa phê duyệt:** _vd: dùng `v0.X` cho đến khi được duyệt, rồi chuyển thành `v1.0`_
- **Nơi lưu baseline:** _vd: Git tag, SharePoint version, Confluence labeled version_

---

## 3. Định dạng Đặt tên File chuẩn Công ty

> **CẦN ĐIỀN:** Mẫu đặt tên file canonical bắt buộc cho mọi deliverable.

**Mẫu:** `<LOẠI>-<DỰ_ÁN>-<MODULE>-<v.MAJOR.MINOR>-<YYYY-MM-DD>.md`

Ví dụ: `BRD-VCM-quan-ly-hop-dong-v1.0-2026-05-26.md`

**Quy tắc:**
- _vd: kebab-case, không dấu, không khoảng trắng_
- _vd: ngày theo chuẩn ISO 8601_
- _vd: module bắt buộc với tài liệu thuộc module cụ thể_
- _vd: version luôn gồm cả major và minor_

---

## 4. SLA cho từng loại Tài liệu

> **CẦN ĐIỀN:** Thời gian phản hồi kỳ vọng cho mỗi loại deliverable, theo từng giai đoạn.

| Loại tài liệu | Draft → Review | Review → Revision | Revision → Approval | Tổng |
|---|---|---|---|---|
| BRD | _vd: 5 ngày làm việc_ | _vd: 3 ngày_ | _vd: 5 ngày_ | _vd: 2–3 tuần_ |
| SRS | | | | |
| FRD | | | | |
| User Story | | | | |
| Change Request (Low/Medium) | | | | |
| Change Request (High/Critical) | | | | |
| Meeting Minutes | _vd: trong vòng 24 giờ_ | — | — | |
| Gap Analysis | | | | |
| Audit Report | | | | |

**Quy tắc SLA bổ sung:**
- _vd: Nếu CR Critical không phản hồi trong 1 ngày làm việc → escalate lên Sponsor_
- _vd: BRD chậm SLA > 1 tuần phải có "Status Report" gửi lên PMO_

---

## 5. Quy tắc bổ sung khác

> **CẦN ĐIỀN:** Bất cứ điều gì đặc thù tổ chức bạn — yêu cầu pháp lý, từ ngữ cấm, section bắt buộc, đường dẫn escalation, công cụ bắt buộc...

**Tuân thủ pháp lý:**
- _vd: Tuân thủ Nghị định 13/2023/NĐ-CP về bảo vệ dữ liệu cá nhân_
- _vd: Tuân thủ Luật Đấu thầu sửa đổi 2024_

**Định dạng tài liệu bắt buộc:**
- _vd: Footer mọi trang phải có "Mật — Lưu hành nội bộ"_
- _vd: Trang bìa theo template công ty (file `templates/cover-page.docx`)_

**Đường dẫn escalation:**
- _vd: BA gặp khó khăn → BA Lead → PM → Sponsor (mỗi cấp 1 ngày)_

**Công cụ bắt buộc:**
- _vd: Lưu trên Confluence space `VCM-DOCS`_
- _vd: Theo dõi issue trên Jira project `VCM`_
- _vd: Sơ đồ Mermaid lưu cùng file Markdown_

---

## Lịch sử thay đổi

| Phiên bản | Ngày | Người sửa | Nội dung |
|---|---|---|---|
| 0.1 | 2026-05-26 | (placeholder) | Tạo template trống. |
| 1.0 | _<chờ điền>_ | _<chờ điền>_ | _Phát hành chuẩn nội bộ đầu tiên._ |

---

*Sau khi điền xong file này, các agent sẽ coi đây là tài liệu có thẩm quyền cao nhất cho công việc BA tại VCM. Bản canonical: `.claude/knowledge/company-process-standards.md`.*
