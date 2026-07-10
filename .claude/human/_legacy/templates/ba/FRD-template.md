---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "{{PHIÊN_BẢN}}"
date: "{{NGÀY_PHÁT_HÀNH}}"
status: "{{Draft | Review | Approved}}"
document_type: "Functional Requirements Document (FRD)"
---

# Tài liệu Yêu cầu Chức năng (Functional Requirements Document — FRD)

> FRD chi tiết hóa các yêu cầu chức năng đã được mô tả ở BRD/SRS, tập trung vào **hành vi hệ thống** (system behavior) — không bao gồm thiết kế kỹ thuật.

## Mục lục (Table of Contents)

1. [Thông tin tài liệu (Document Control)](#1-thông-tin-tài-liệu-document-control)
2. [Giới thiệu (Introduction)](#2-giới-thiệu-introduction)
3. [Tổng quan chức năng (Functional Overview)](#3-tổng-quan-chức-năng-functional-overview)
4. [Đặc tả chức năng chi tiết (Detailed Functional Specifications)](#4-đặc-tả-chức-năng-chi-tiết-detailed-functional-specifications)
5. [Quy tắc nghiệp vụ (Business Rules)](#5-quy-tắc-nghiệp-vụ-business-rules)
6. [Ma trận truy vết yêu cầu (Requirements Traceability Matrix)](#6-ma-trận-truy-vết-yêu-cầu-requirements-traceability-matrix)
7. [Phụ lục (Appendix) — *tùy chọn*](#7-phụ-lục-appendix--tùy-chọn)
8. [Checklist hoàn thiện](#checklist-hoàn-thiện)

---

## 1. Thông tin tài liệu (Document Control)

**[Bắt buộc]**

| Trường | Giá trị |
|---|---|
| Tên dự án | {{TÊN_DỰ_ÁN}} |
| Phân hệ (Module) | {{TÊN_MODULE}} |
| Phiên bản | {{PHIÊN_BẢN}} |
| Trạng thái | {{Draft / Review / Approved}} |
| Người soạn | {{TÊN_BA}} |
| Người phê duyệt | {{TÊN_NGƯỜI_DUYỆT}} |

### Lịch sử thay đổi

| Phiên bản | Ngày | Người sửa | Nội dung thay đổi |
|---|---|---|---|
| {{X.Y}} | {{YYYY-MM-DD}} | {{TÊN}} | {{MÔ_TẢ}} |

---

## 2. Giới thiệu (Introduction)

### 2.1 Mục đích (Purpose) — **[Bắt buộc]**
Mô tả chi tiết các chức năng mà hệ thống phải cung cấp, làm cơ sở cho thiết kế, lập trình và kiểm thử.

### 2.2 Phạm vi (Scope) — **[Bắt buộc]**
- Phân hệ áp dụng: {{MODULE}}
- Tham chiếu BRD: {{TÊN_BRD}} v{{X.Y}}

### 2.3 Đối tượng đọc (Audience) — *tùy chọn*
Đội phát triển, kiểm thử, kiến trúc sư, người vận hành.

---

## 3. Tổng quan chức năng (Functional Overview)

**[Bắt buộc]**

### 3.1 Danh sách chức năng (Function List)

| Mã | Tên chức năng | Phân hệ | Ưu tiên | Nguồn |
|---|---|---|---|---|
| FUNC-001 | Đăng nhập bằng OTP | Authentication | Must | BR-005 |
| FUNC-{{NNN}} | {{TÊN}} | {{MODULE}} | {{Must/Should}} | {{BR-xxx}} |

### 3.2 Sơ đồ chức năng (Function Hierarchy)
{{SƠ_ĐỒ_CÂY_CHỨC_NĂNG_HOẶC_MÔ_TẢ}}

---

## 4. Đặc tả chức năng chi tiết (Detailed Functional Specifications)

**[Bắt buộc]** — Mỗi chức năng phải có một mục riêng theo cấu trúc dưới đây.

### 4.x FUNC-{{NNN}} — {{TÊN_CHỨC_NĂNG}}

| Trường | Nội dung |
|---|---|
| **Mã chức năng** | FUNC-{{NNN}} |
| **Tên chức năng** | {{TÊN}} |
| **Mô tả ngắn** | {{MÔ_TẢ_1_2_CÂU}} |
| **Tác nhân (Actor)** | {{KH / Admin / Hệ thống ngoài}} |
| **Tiền điều kiện (Pre-condition)** | {{ĐIỀU_KIỆN_TRƯỚC}} |
| **Đầu vào (Input)** | {{DANH_SÁCH_TRƯỜNG_DỮ_LIỆU}} |
| **Xử lý (Process)** | {{LUỒNG_XỬ_LÝ_TỪNG_BƯỚC}} |
| **Đầu ra (Output)** | {{KẾT_QUẢ_TRẢ_VỀ}} |
| **Hậu điều kiện (Post-condition)** | {{TRẠNG_THÁI_SAU}} |
| **Ngoại lệ (Exceptions)** | {{CÁC_TÌNH_HUỐNG_LỖI}} |
| **Yêu cầu phi chức năng liên quan** | {{NFR-xxx}} |

> **Ví dụ — FUNC-001: Đăng nhập bằng OTP**
> - **Tác nhân:** Khách hàng đã đăng ký.
> - **Tiền điều kiện:** Tài khoản đang ở trạng thái "Đã kích hoạt".
> - **Đầu vào:** Số điện thoại (10 chữ số), mã OTP (6 chữ số, hiệu lực 5 phút).
> - **Xử lý:**
>   1. Hệ thống kiểm tra định dạng số điện thoại.
>   2. Gửi OTP qua SMS.
>   3. Xác thực OTP do người dùng nhập.
>   4. Tạo session JWT có hiệu lực 24 giờ.
> - **Đầu ra:** Trang chủ + token đăng nhập.
> - **Ngoại lệ:** OTP sai 5 lần liên tiếp → khóa tài khoản 15 phút.

#### Quy tắc xác thực dữ liệu (Validation Rules)

| Trường | Quy tắc | Thông báo lỗi |
|---|---|---|
| Số điện thoại | 10 chữ số, bắt đầu bằng 0 | "Số điện thoại không hợp lệ" |
| {{TRƯỜNG}} | {{QUY_TẮC}} | {{THÔNG_BÁO}} |

#### Wireframe / Mockup — *tùy chọn*
{{LIÊN_KẾT_HOẶC_HÌNH_ẢNH}}

---

## 5. Quy tắc nghiệp vụ (Business Rules)

**[Bắt buộc]** — Các quy tắc nghiệp vụ áp dụng xuyên suốt nhiều chức năng.

| Mã | Mô tả quy tắc | Phạm vi áp dụng |
|---|---|---|
| BR-001 | Đơn hàng trên 5 triệu đồng phải được duyệt bởi quản lý | FUNC-010, FUNC-011 |
| BR-{{NNN}} | {{MÔ_TẢ}} | {{FUNC-xxx}} |

---

## 6. Ma trận truy vết yêu cầu (Requirements Traceability Matrix)

**[Bắt buộc]**

| Yêu cầu nghiệp vụ (BR) | Chức năng (FUNC) | Test case (TC) | Trạng thái |
|---|---|---|---|
| BR-005 | FUNC-001 | TC-001, TC-002 | Implemented |
| {{BR-xxx}} | {{FUNC-xxx}} | {{TC-xxx}} | {{Trạng thái}} |

---

## 7. Phụ lục (Appendix) — *tùy chọn*

- Danh sách mã lỗi
- Sơ đồ trạng thái chi tiết
- Tham chiếu chéo với SRS

---

## Checklist hoàn thiện

- [ ] Mỗi chức năng có mã FUNC-xxx duy nhất
- [ ] Đầy đủ Input / Process / Output / Tiền điều kiện / Hậu điều kiện
- [ ] Đã liệt kê các ngoại lệ và thông báo lỗi
- [ ] Validation rules đã định nghĩa cho mọi trường nhập liệu
- [ ] Quy tắc nghiệp vụ được tách riêng và đánh mã
- [ ] Có ma trận truy vết từ BR → FUNC → TC
- [ ] Mỗi chức năng truy vết được về ít nhất một yêu cầu nghiệp vụ
- [ ] Wireframe đính kèm cho các màn hình chính
- [ ] Đã rà soát thống nhất với SRS và BRD
- [ ] Đã được nghiệm thu bởi đại diện nghiệp vụ
