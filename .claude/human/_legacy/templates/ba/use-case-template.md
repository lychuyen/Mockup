---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "{{PHIÊN_BẢN}}"
date: "{{NGÀY_PHÁT_HÀNH}}"
status: "{{Draft | Review | Approved}}"
document_type: "Use Case Specification"
---

# Đặc tả Trường hợp Sử dụng (Use Case Specification) — UC-{{NNN}}

## Mục lục (Table of Contents)

1. [Thông tin tổng quan](#1-thông-tin-tổng-quan)
2. [Tác nhân (Actors)](#2-tác-nhân-actors)
3. [Tiền điều kiện (Pre-conditions)](#3-tiền-điều-kiện-pre-conditions)
4. [Luồng chính (Main Flow / Basic Flow)](#4-luồng-chính-main-flow--basic-flow)
5. [Luồng thay thế (Alternative Flow)](#5-luồng-thay-thế-alternative-flow)
6. [Luồng ngoại lệ (Exception Flow)](#6-luồng-ngoại-lệ-exception-flow)
7. [Hậu điều kiện (Post-conditions)](#7-hậu-điều-kiện-post-conditions)
8. [Yêu cầu đặc biệt (Special Requirements) — *tùy chọn*](#8-yêu-cầu-đặc-biệt-special-requirements--tùy-chọn)
9. [Điểm mở rộng (Extension Points) — *tùy chọn*](#9-điểm-mở-rộng-extension-points--tùy-chọn)
10. [Checklist hoàn thiện](#checklist-hoàn-thiện)

---

## 1. Thông tin tổng quan

**[Bắt buộc]**

| Trường | Giá trị |
|---|---|
| Mã trường hợp sử dụng (Use Case ID) | UC-{{NNN}} |
| Tên trường hợp sử dụng (Use Case Name) | {{TÊN_UC}} |
| Phân hệ (Module) | {{MODULE}} |
| Mức độ (Level) | {{Summary / User Goal / Sub-function}} |
| Phạm vi (Scope) | {{HỆ_THỐNG_HOẶC_PHÂN_HỆ}} |
| Mức ưu tiên | {{Must / Should / Could}} |
| Người soạn | {{TÊN_BA}} |

### Mục đích (Brief Description) — **[Bắt buộc]**
Mô tả mục tiêu nghiệp vụ của UC trong 1–2 câu.

> **Ví dụ:** Cho phép khách hàng đặt hàng trực tuyến và thanh toán qua cổng thanh toán điện tử.

---

## 2. Tác nhân (Actors)

**[Bắt buộc]**

| Loại | Tên tác nhân | Vai trò trong UC |
|---|---|---|
| Tác nhân chính (Primary) | {{TÊN_ACTOR_CHÍNH}} | {{VAI_TRÒ}} |
| Tác nhân phụ (Secondary) | {{TÊN_ACTOR_PHỤ}} | {{VAI_TRÒ}} |

> **Ví dụ:**
> - Tác nhân chính: Khách hàng (Customer)
> - Tác nhân phụ: Cổng thanh toán VNPay (External System)

---

## 3. Tiền điều kiện (Pre-conditions)

**[Bắt buộc]** — Các điều kiện phải đúng *trước khi* UC bắt đầu.

- {{ĐIỀU_KIỆN_1}}
- {{ĐIỀU_KIỆN_2}}

> **Ví dụ:**
> - Khách hàng đã đăng nhập hệ thống.
> - Giỏ hàng có ít nhất 1 sản phẩm.
> - Tài khoản khách hàng đang ở trạng thái "Hoạt động".

---

## 4. Luồng chính (Main Flow / Basic Flow)

**[Bắt buộc]** — Kịch bản thành công (Happy Path).

| Bước | Tác nhân | Hành động | Phản hồi hệ thống |
|---|---|---|---|
| 1 | Khách hàng | Nhấn nút "Thanh toán" trong giỏ hàng | Hiển thị màn hình xác nhận đơn hàng |
| 2 | Khách hàng | Chọn phương thức thanh toán "VNPay" | Hiển thị nút "Tiếp tục thanh toán" |
| 3 | Khách hàng | Nhấn "Tiếp tục thanh toán" | Chuyển hướng sang cổng VNPay |
| 4 | Cổng VNPay | Trả về kết quả "Thành công" | Hiển thị màn hình xác nhận đặt hàng, gửi email |
| {{N}} | {{ACTOR}} | {{HÀNH_ĐỘNG}} | {{PHẢN_HỒI}} |

---

## 5. Luồng thay thế (Alternative Flow)

**[Bắt buộc nếu có nhiều cách hoàn thành mục tiêu]**

### 5.1 AF-1: {{TÊN_LUỒNG_THAY_THẾ}}
- **Điểm rẽ nhánh:** Bước {{N}} trong luồng chính.
- **Điều kiện:** {{ĐIỀU_KIỆN_RẼ_NHÁNH}}
- **Các bước:**
  1. {{BƯỚC_1}}
  2. {{BƯỚC_2}}
- **Quay lại luồng chính tại bước:** {{N+1}} *hoặc* "Kết thúc UC".

> **Ví dụ — AF-1: Thanh toán bằng MoMo thay vì VNPay**
> Điểm rẽ nhánh: Bước 2. Khách hàng chọn "MoMo" thay vì "VNPay". Hệ thống chuyển hướng sang cổng MoMo. Quay lại bước 4.

---

## 6. Luồng ngoại lệ (Exception Flow)

**[Bắt buộc]** — Các tình huống lỗi và cách xử lý.

### 6.1 EX-1: {{TÊN_NGOẠI_LỆ}}
- **Điểm phát sinh:** Bước {{N}}.
- **Điều kiện kích hoạt:** {{ĐIỀU_KIỆN_LỖI}}
- **Xử lý:**
  1. Hệ thống hiển thị thông báo lỗi: "{{NỘI_DUNG}}"
  2. Hệ thống ghi log sự kiện.
  3. Khách hàng có thể thử lại hoặc thoát.

> **Ví dụ — EX-1: Thanh toán thất bại do thẻ không đủ số dư**
> Điểm phát sinh: Bước 4. Cổng VNPay trả về mã lỗi `99`. Hệ thống hiển thị "Giao dịch thất bại. Vui lòng kiểm tra số dư hoặc thử thẻ khác." Đơn hàng giữ ở trạng thái "Chờ thanh toán" trong 15 phút.

---

## 7. Hậu điều kiện (Post-conditions)

**[Bắt buộc]**

### 7.1 Khi thành công (Success Post-condition)
- {{TRẠNG_THÁI_SAU}}

### 7.2 Khi thất bại (Failure Post-condition)
- {{TRẠNG_THÁI_KHI_LỖI}}

> **Ví dụ:**
> - Thành công: Đơn hàng có trạng thái "Đã thanh toán"; tồn kho giảm tương ứng; email xác nhận đã gửi.
> - Thất bại: Đơn hàng giữ trạng thái "Chờ thanh toán"; tồn kho không thay đổi.

---

## 8. Yêu cầu đặc biệt (Special Requirements) — *tùy chọn*

- Hiệu năng: Bước thanh toán hoàn tất trong ≤ 5 giây kể từ khi nhận phản hồi cổng thanh toán.
- Bảo mật: Không lưu thông tin thẻ tín dụng trên hệ thống.
- Tuân thủ: PCI-DSS Level 1.

---

## 9. Điểm mở rộng (Extension Points) — *tùy chọn*

| Tên điểm mở rộng | Vị trí | Use Case mở rộng |
|---|---|---|
| Áp mã giảm giá | Bước 1 (Luồng chính) | UC-012 — Áp dụng voucher |

---

## Checklist hoàn thiện

- [ ] Mã UC duy nhất theo định dạng UC-xxx
- [ ] Đã xác định rõ tác nhân chính và phụ
- [ ] Tiền điều kiện cụ thể, có thể kiểm chứng
- [ ] Luồng chính được mô tả tuần tự, đầy đủ tương tác giữa actor và hệ thống
- [ ] Có ít nhất 1 luồng thay thế nếu UC có nhiều con đường hoàn thành
- [ ] Đã liệt kê đầy đủ luồng ngoại lệ với cách xử lý
- [ ] Hậu điều kiện phân biệt giữa thành công và thất bại
- [ ] Có sơ đồ Use Case Diagram đính kèm (nếu là UC quan trọng)
- [ ] Tham chiếu chéo với FRD (FUNC-xxx) đã được xác định
- [ ] Đã được nghiệm thu bởi người dùng đại diện
