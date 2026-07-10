---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_NGƯỜI_ĐỀ_XUẤT}}"
version: "{{PHIÊN_BẢN}}"
date: "{{NGÀY_PHÁT_HÀNH}}"
status: "{{Submitted | Under Review | Approved | Rejected | Implemented}}"
document_type: "Change Request (CR)"
---

# Yêu cầu Thay đổi (Change Request) — CR-{{NNN}}

## Mục lục (Table of Contents)

1. [Thông tin yêu cầu](#1-thông-tin-yêu-cầu)
2. [Mô tả thay đổi (Change Description)](#2-mô-tả-thay-đổi-change-description)
3. [Lý do thay đổi (Justification)](#3-lý-do-thay-đổi-justification)
4. [Đánh giá tác động (Impact Assessment)](#4-đánh-giá-tác-động-impact-assessment)
5. [Ước lượng nỗ lực & chi phí (Effort & Cost Estimation)](#5-ước-lượng-nỗ-lực--chi-phí-effort--cost-estimation)
6. [Phương án thay thế (Alternatives Considered) — *tùy chọn*](#6-phương-án-thay-thế-alternatives-considered--tùy-chọn)
7. [Khuyến nghị (Recommendation)](#7-khuyến-nghị-recommendation)
8. [Phê duyệt (Approval)](#8-phê-duyệt-approval)
9. [Checklist hoàn thiện](#checklist-hoàn-thiện)

---

## 1. Thông tin yêu cầu

**[Bắt buộc]**

| Trường | Giá trị |
|---|---|
| Mã CR | CR-{{NNN}} |
| Tiêu đề | {{TIÊU_ĐỀ_NGẮN_GỌN}} |
| Ngày đề xuất | {{YYYY-MM-DD}} |
| Người đề xuất | {{TÊN}} ({{VAI_TRÒ}}) |
| Loại thay đổi | {{Phạm vi / Yêu cầu / Lịch trình / Chi phí / Chất lượng}} |
| Mức độ khẩn cấp | {{Cao / Trung bình / Thấp}} |
| Mức ưu tiên | {{Must / Should / Could}} |
| Trạng thái | {{Submitted / Under Review / Approved / Rejected / Implemented}} |
| Tài liệu liên quan | {{BRD/SRS/FRD/Sprint}} |

---

## 2. Mô tả thay đổi (Change Description)

**[Bắt buộc]**

### 2.1 Hiện trạng (Current State)
{{MÔ_TẢ_NỘI_DUNG_HIỆN_TẠI_HOẶC_ĐÃ_THỎA_THUẬN}}

### 2.2 Trạng thái đề xuất (Proposed State)
{{MÔ_TẢ_THAY_ĐỔI_ĐỀ_XUẤT}}

### 2.3 Khác biệt chính (Key Differences)
- {{KHÁC_BIỆT_1}}
- {{KHÁC_BIỆT_2}}

> **Ví dụ:**
> - **Hiện trạng:** Hệ thống hỗ trợ thanh toán bằng VNPay và MoMo.
> - **Đề xuất:** Bổ sung thanh toán ZaloPay.
> - **Khác biệt:** Cần tích hợp thêm SDK ZaloPay, mở rộng bảng `payment_methods`, cập nhật UI checkout.

---

## 3. Lý do thay đổi (Justification)

**[Bắt buộc]**

- **Vấn đề / Cơ hội:** {{MÔ_TẢ}}
- **Lợi ích nghiệp vụ:** {{LỢI_ÍCH_ĐỊNH_LƯỢNG_NẾU_CÓ}}
- **Hậu quả nếu không thực hiện:** {{...}}

> **Ví dụ:** 28% khách hàng phản hồi muốn thanh toán qua ZaloPay (khảo sát 04/2026). Bổ sung phương thức này dự kiến tăng tỷ lệ chuyển đổi 5–8%, tương đương 600 triệu doanh thu/tháng.

---

## 4. Đánh giá tác động (Impact Assessment)

**[Bắt buộc]**

### 4.1 Tác động đến phạm vi (Scope Impact)
| Hạng mục | Tác động |
|---|---|
| Yêu cầu / Tính năng | {{TĂNG/GIẢM/THAY_ĐỔI}} |
| Module ảnh hưởng | {{DANH_SÁCH_MODULE}} |

### 4.2 Tác động đến lịch trình (Schedule Impact)
- Ngày go-live hiện tại: {{YYYY-MM-DD}}
- Ngày go-live sau thay đổi: {{YYYY-MM-DD}}
- Chênh lệch: +/- {{N}} ngày

### 4.3 Tác động đến chi phí (Cost Impact)
- Chi phí phát sinh: {{SỐ_TIỀN}} VND
- Nguồn ngân sách: {{...}}

### 4.4 Tác động đến chất lượng / rủi ro (Quality / Risk Impact)
- {{RỦI_RO_PHÁT_SINH}}
- {{BIỆN_PHÁP_GIẢM_THIỂU}}

### 4.5 Tác động đến nguồn lực (Resource Impact) — *tùy chọn*
- Nhân sự bổ sung: {{...}}
- Phụ thuộc bên thứ ba: {{...}}

---

## 5. Ước lượng nỗ lực & chi phí (Effort & Cost Estimation)

**[Bắt buộc]**

| Hạng mục | Người-ngày | Đơn giá | Thành tiền |
|---|---|---|---|
| Phân tích (Analysis) | 3 | {{...}} | {{...}} |
| Thiết kế (Design) | 5 | {{...}} | {{...}} |
| Phát triển (Development) | 12 | {{...}} | {{...}} |
| Kiểm thử (Testing) | 4 | {{...}} | {{...}} |
| Triển khai (Deployment) | 1 | {{...}} | {{...}} |
| **Tổng** | **25** | | **{{TỔNG_CHI_PHÍ}}** |

---

## 6. Phương án thay thế (Alternatives Considered) — *tùy chọn*

| Phương án | Mô tả | Ưu điểm | Nhược điểm | Đánh giá |
|---|---|---|---|---|
| A — Triển khai đầy đủ | {{...}} | {{...}} | {{...}} | Khuyến nghị |
| B — Triển khai từng phần | {{...}} | {{...}} | {{...}} | Cân nhắc |
| C — Không thực hiện | Giữ nguyên hiện trạng | Không phát sinh chi phí | Mất cơ hội doanh thu | Không khuyến nghị |

---

## 7. Khuyến nghị (Recommendation)

**[Bắt buộc]**

- **Khuyến nghị từ BA / PM:** {{Phê duyệt / Từ chối / Hoãn để khảo sát thêm}}
- **Cơ sở khuyến nghị:** {{...}}

---

## 8. Phê duyệt (Approval)

**[Bắt buộc]**

| Vai trò | Họ tên | Chữ ký | Ngày | Kết luận |
|---|---|---|---|---|
| Người đề xuất | {{TÊN}} | _______ | {{YYYY-MM-DD}} | — |
| BA / PM | {{TÊN}} | _______ | {{YYYY-MM-DD}} | {{Đồng ý / Không đồng ý}} |
| Change Control Board (CCB) | {{TÊN}} | _______ | {{YYYY-MM-DD}} | {{Phê duyệt / Từ chối}} |
| Sponsor | {{TÊN}} | _______ | {{YYYY-MM-DD}} | {{...}} |

---

## Checklist hoàn thiện

- [ ] Mã CR duy nhất theo định dạng CR-xxx
- [ ] Mô tả rõ ràng hiện trạng và trạng thái đề xuất
- [ ] Lý do thay đổi có dữ liệu/cơ sở định lượng
- [ ] Đánh giá đầy đủ tác động đến: phạm vi, lịch trình, chi phí, chất lượng, nguồn lực
- [ ] Có ước lượng nỗ lực chi tiết theo từng giai đoạn
- [ ] Đã xem xét ít nhất 2 phương án thay thế
- [ ] Có khuyến nghị rõ ràng kèm cơ sở
- [ ] Đã có ý kiến của các bên liên quan kỹ thuật và nghiệp vụ
- [ ] Đã gửi cho Change Control Board (CCB) xem xét
- [ ] Sau khi phê duyệt, cập nhật vào BRD/SRS/FRD và baseline mới
