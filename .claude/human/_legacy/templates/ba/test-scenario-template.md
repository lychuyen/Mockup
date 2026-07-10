---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA_HOẶC_QA}}"
version: "{{PHIÊN_BẢN}}"
date: "{{NGÀY_PHÁT_HÀNH}}"
status: "{{Draft | Review | Approved | Executed}}"
document_type: "Test Scenario"
---

# Kịch bản Kiểm thử (Test Scenario) — TS-{{NNN}}

## Mục lục (Table of Contents)

1. [Thông tin tổng quan](#1-thông-tin-tổng-quan)
2. [Mục tiêu kiểm thử (Test Objective)](#2-mục-tiêu-kiểm-thử-test-objective)
3. [Tài liệu tham chiếu (References)](#3-tài-liệu-tham-chiếu-references)
4. [Môi trường & Dữ liệu (Environment & Test Data)](#4-môi-trường--dữ-liệu-environment--test-data)
5. [Danh sách Test Case](#5-danh-sách-test-case)
6. [Đặc tả Test Case chi tiết](#6-đặc-tả-test-case-chi-tiết)
7. [Tiêu chí vào / ra (Entry / Exit Criteria) — *tùy chọn*](#7-tiêu-chí-vào--ra-entry--exit-criteria--tùy-chọn)
8. [Báo cáo kết quả (Execution Report) — *tùy chọn*](#8-báo-cáo-kết-quả-execution-report--tùy-chọn)
9. [Checklist hoàn thiện](#checklist-hoàn-thiện)

---

## 1. Thông tin tổng quan

**[Bắt buộc]**

| Trường | Giá trị |
|---|---|
| Mã kịch bản (Test Scenario ID) | TS-{{NNN}} |
| Tên kịch bản | {{TÊN}} |
| Phân hệ / Chức năng | {{MODULE / FUNC-xxx}} |
| Loại kiểm thử | {{Functional / Integration / UAT / Regression / Performance}} |
| Mức độ ưu tiên | {{Cao / Trung / Thấp}} |
| Người soạn | {{TÊN}} |
| Người thực thi | {{TÊN_TESTER}} |
| Phiên bản build | {{X.Y.Z}} |

---

## 2. Mục tiêu kiểm thử (Test Objective)

**[Bắt buộc]**

Mô tả mục tiêu của kịch bản trong 1–2 câu.

> **Ví dụ:** Xác minh người dùng có thể đăng nhập thành công bằng OTP qua SMS và bị khóa tài khoản sau 5 lần nhập sai.

---

## 3. Tài liệu tham chiếu (References)

**[Bắt buộc]**

| Loại | Mã / Tên | Phiên bản |
|---|---|---|
| Yêu cầu nghiệp vụ | BR-005 | 1.2 |
| Chức năng | FUNC-001 | 1.0 |
| Câu chuyện người dùng | US-010 | 1.0 |
| Use Case | UC-003 | 1.1 |

---

## 4. Môi trường & Dữ liệu (Environment & Test Data)

**[Bắt buộc]**

### 4.1 Môi trường
| Thành phần | Giá trị |
|---|---|
| URL | {{https://staging.example.vn}} |
| Trình duyệt | Chrome 124+, Edge 124+ |
| Hệ điều hành | Windows 11, iOS 17 |
| Kích cỡ màn hình | Desktop 1920×1080, Mobile 390×844 |

### 4.2 Dữ liệu thử (Test Data)
| Trường | Giá trị mẫu |
|---|---|
| Số điện thoại | 0901234567 |
| OTP hợp lệ | 123456 (cấu hình sandbox) |
| Tài khoản test | test_user_01 |

---

## 5. Danh sách Test Case

**[Bắt buộc]**

| Mã TC | Tên | Loại | Mức độ | Tự động hóa |
|---|---|---|---|---|
| TC-001 | Đăng nhập thành công với OTP hợp lệ | Happy path | Cao | Có |
| TC-002 | Đăng nhập thất bại với OTP sai | Negative | Cao | Có |
| TC-003 | Khóa tài khoản sau 5 lần sai OTP | Boundary | Cao | Có |
| TC-004 | OTP hết hạn sau 5 phút | Boundary | Trung | Không |
| TC-{{NNN}} | {{TÊN}} | {{LOẠI}} | {{MỨC_ĐỘ}} | {{Có/Không}} |

---

## 6. Đặc tả Test Case chi tiết

**[Bắt buộc]** — Lặp lại khối dưới cho mỗi test case.

### TC-{{NNN}} — {{TÊN_TEST_CASE}}

| Trường | Nội dung |
|---|---|
| **Mã Test Case** | TC-{{NNN}} |
| **Liên kết yêu cầu** | {{BR-xxx / FUNC-xxx / US-xxx}} |
| **Tiền điều kiện (Precondition)** | {{ĐIỀU_KIỆN_TRƯỚC_KHI_CHẠY}} |
| **Dữ liệu đầu vào (Input Data)** | {{DỮ_LIỆU_CỤ_THỂ}} |

#### Các bước thực hiện (Steps)

| # | Hành động (Action) | Kết quả mong đợi (Expected Result) | Kết quả thực tế (Actual Result) | Đạt / Không đạt |
|---|---|---|---|---|
| 1 | {{HÀNH_ĐỘNG_1}} | {{KỲ_VỌNG_1}} | {{ĐIỀN_KHI_CHẠY}} | {{Pass / Fail}} |
| 2 | {{HÀNH_ĐỘNG_2}} | {{KỲ_VỌNG_2}} | {{...}} | {{...}} |

| **Hậu điều kiện (Postcondition)** | {{TRẠNG_THÁI_SAU_KHI_CHẠY}} |
|---|---|
| **Kết luận chung (Overall Result)** | {{Pass / Fail / Blocked}} |
| **Ghi chú / Bằng chứng (Evidence)** | {{Screenshot / Log / Video}} |

> **Ví dụ — TC-001: Đăng nhập thành công với OTP hợp lệ**
>
> | Trường | Nội dung |
> |---|---|
> | Tiền điều kiện | Tài khoản `0901234567` đang ở trạng thái "Hoạt động", không bị khóa |
> | Dữ liệu đầu vào | SĐT: `0901234567`, OTP: `123456` |
>
> | # | Hành động | Kết quả mong đợi | Kết quả thực tế | Pass/Fail |
> |---|---|---|---|---|
> | 1 | Mở trang `/login` | Hiển thị form đăng nhập | Hiển thị đúng | Pass |
> | 2 | Nhập SĐT `0901234567`, nhấn "Gửi OTP" | Hệ thống gửi OTP qua SMS, hiển thị ô nhập OTP | OK | Pass |
> | 3 | Nhập OTP `123456`, nhấn "Xác nhận" | Chuyển hướng đến `/home`, hiển thị "Đăng nhập thành công" | OK | Pass |
>
> - **Hậu điều kiện:** Session JWT hợp lệ trong 24 giờ, log ghi nhận sự kiện `login_success`.
> - **Kết luận:** Pass.

---

## 7. Tiêu chí vào / ra (Entry / Exit Criteria) — *tùy chọn*

### 7.1 Tiêu chí vào (Entry Criteria)
- Build đã được triển khai lên môi trường staging
- Dữ liệu test đã được nạp
- Tất cả Test Case đã được rà soát

### 7.2 Tiêu chí ra (Exit Criteria)
- 100% TC mức độ Cao đã chạy
- ≥ 95% TC đạt Pass
- Không còn defect Critical/High mở
- Báo cáo đã được Test Lead phê duyệt

---

## 8. Báo cáo kết quả (Execution Report) — *tùy chọn*

| Chỉ số | Giá trị |
|---|---|
| Tổng số TC | {{N}} |
| Pass | {{N}} ({{%}}) |
| Fail | {{N}} ({{%}}) |
| Blocked / Skipped | {{N}} ({{%}}) |
| Defects phát hiện | {{N}} (Critical: {{x}}, High: {{y}}, Medium: {{z}}, Low: {{w}}) |
| Ngày thực thi | {{YYYY-MM-DD}} |

---

## Checklist hoàn thiện

- [ ] Mã kịch bản (TS-xxx) và mã test case (TC-xxx) duy nhất
- [ ] Mỗi TC truy vết được về yêu cầu nghiệp vụ/chức năng cụ thể
- [ ] Tiền điều kiện rõ ràng, có thể chuẩn bị được
- [ ] Dữ liệu thử cụ thể, không mơ hồ ("dữ liệu hợp lệ")
- [ ] Các bước rõ ràng, mỗi bước có kết quả mong đợi tương ứng
- [ ] Hậu điều kiện được kiểm chứng được
- [ ] Có đầy đủ test case Happy path, Negative, Boundary
- [ ] Đã phân loại mức độ ưu tiên (Cao/Trung/Thấp)
- [ ] Định nghĩa rõ tiêu chí vào và tiêu chí ra
- [ ] Đã có chỗ ghi nhận bằng chứng (screenshot/log) sau khi thực thi
