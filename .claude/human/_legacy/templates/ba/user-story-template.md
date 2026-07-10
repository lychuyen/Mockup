---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "{{PHIÊN_BẢN}}"
date: "{{NGÀY_PHÁT_HÀNH}}"
status: "{{Draft | Ready | In Progress | Done}}"
document_type: "User Story"
---

# Câu chuyện Người dùng (User Story) — US-{{NNN}}

## Mục lục (Table of Contents)

1. [Thông tin tổng quan](#1-thông-tin-tổng-quan)
2. [Mô tả câu chuyện (Story Description)](#2-mô-tả-câu-chuyện-story-description)
3. [Tiêu chí chấp nhận (Acceptance Criteria)](#3-tiêu-chí-chấp-nhận-acceptance-criteria)
4. [Ghi chú thiết kế / kỹ thuật (Design / Technical Notes) — *tùy chọn*](#4-ghi-chú-thiết-kế--kỹ-thuật-design--technical-notes--tùy-chọn)
5. [Phụ thuộc (Dependencies) — *tùy chọn*](#5-phụ-thuộc-dependencies--tùy-chọn)
6. [Checklist hoàn thiện](#checklist-hoàn-thiện)

---

## 1. Thông tin tổng quan

**[Bắt buộc]**

| Trường | Giá trị |
|---|---|
| Mã câu chuyện (Story ID) | US-{{NNN}} |
| Tên ngắn (Title) | {{TIÊU_ĐỀ_NGẮN_GỌN}} |
| Epic / Feature | {{EPIC-xxx}} |
| Sprint | {{SPRINT_NUMBER}} |
| Người sở hữu (Owner) | {{TÊN_PO_HOẶC_BA}} |
| Ước lượng (Estimate) | {{STORY_POINTS}} |
| Mức ưu tiên (Priority) | {{Must / Should / Could / Won't}} |
| Trạng thái (Status) | {{Backlog / Ready / In Progress / Done}} |

---

## 2. Mô tả câu chuyện (Story Description)

**[Bắt buộc]** — Định dạng chuẩn:

> **Là một** {{LOẠI_NGƯỜI_DÙNG}} *(As a)*,
> **tôi muốn** {{HÀNH_ĐỘNG_HOẶC_TÍNH_NĂNG}} *(I want)*,
> **để** {{GIÁ_TRỊ_HOẶC_MỤC_ĐÍCH}} *(So that)*.

> **Ví dụ:**
> Là một **khách hàng đã đăng ký**, tôi muốn **đăng nhập bằng mã OTP qua SMS**, để **không cần ghi nhớ mật khẩu mà vẫn đảm bảo an toàn**.

### 2.1 Lý do (Why) — *tùy chọn*
Giải thích thêm động cơ nghiệp vụ, dữ liệu hỗ trợ (ví dụ: 35% người dùng quên mật khẩu mỗi tháng).

### 2.2 Bối cảnh (Context) — *tùy chọn*
Tham chiếu đến BRD/FRD hoặc phản hồi từ người dùng thực tế.

---

## 3. Tiêu chí chấp nhận (Acceptance Criteria)

**[Bắt buộc]** — Định dạng **Given-When-Then** (Cho trước — Khi — Thì).

### AC-1: {{TIÊU_ĐỀ_KỊCH_BẢN}}
- **Cho trước (Given)** {{BỐI_CẢNH}}
- **Khi (When)** {{HÀNH_ĐỘNG}}
- **Thì (Then)** {{KẾT_QUẢ_MONG_ĐỢI}}

### AC-2: {{TIÊU_ĐỀ_KỊCH_BẢN}}
- **Cho trước (Given)** {{...}}
- **Khi (When)** {{...}}
- **Thì (Then)** {{...}}

> **Ví dụ minh họa — Đăng nhập bằng OTP:**
>
> **AC-1: Đăng nhập thành công với OTP hợp lệ**
> - **Cho trước** người dùng đã đăng ký tài khoản với số điện thoại `0901234567`
> - **Khi** người dùng nhập đúng OTP `123456` trong vòng 5 phút kể từ khi yêu cầu
> - **Thì** hệ thống chuyển hướng đến trang chủ và hiển thị thông báo "Đăng nhập thành công"
>
> **AC-2: Khóa tài khoản khi nhập sai OTP quá 5 lần**
> - **Cho trước** người dùng đã nhập sai OTP 4 lần liên tiếp
> - **Khi** người dùng nhập sai OTP lần thứ 5
> - **Thì** hệ thống khóa tài khoản trong 15 phút và gửi email cảnh báo

---

## 4. Ghi chú thiết kế / kỹ thuật (Design / Technical Notes) — *tùy chọn*

- API endpoint dự kiến: `POST /api/v1/auth/otp/verify`
- Thư viện gửi SMS: {{NHÀ_CUNG_CẤP}}
- Lưu ý bảo mật: không log OTP trong server logs.
- Wireframe: {{LIÊN_KẾT}}

---

## 5. Phụ thuộc (Dependencies) — *tùy chọn*

| Phụ thuộc | Loại | Mô tả |
|---|---|---|
| US-005 | Trước (Predecessor) | Cần đăng ký tài khoản trước |
| Cổng SMS Brand-name | Bên ngoài | Hợp đồng đã ký với nhà mạng |

---

## Checklist hoàn thiện

**INVEST** (Independent — Negotiable — Valuable — Estimable — Small — Testable)

- [ ] Câu chuyện viết đúng định dạng "Là một… tôi muốn… để…"
- [ ] Đối tượng người dùng (Actor) cụ thể, không chung chung như "user"
- [ ] Mỗi câu chuyện đem lại giá trị nghiệp vụ rõ ràng
- [ ] Có tối thiểu 2 Acceptance Criteria theo Given-When-Then
- [ ] Acceptance Criteria có thể kiểm thử được (testable)
- [ ] Câu chuyện đủ nhỏ để hoàn thành trong 1 sprint
- [ ] Đã được ước lượng story points
- [ ] Đã xác định mức ưu tiên MoSCoW
- [ ] Liệt kê đầy đủ phụ thuộc với các story khác
- [ ] Đã được Product Owner xác nhận "Ready for Development"
