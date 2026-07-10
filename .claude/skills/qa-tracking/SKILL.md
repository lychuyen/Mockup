---
name: qa-tracking
description: Theo dõi hỏi-đáp làm rõ giữa đội BA và khách hàng VNA. Rút điểm mở từ sổ OID thành bảng yêu cầu làm rõ 9 cột (nhóm theo phân hệ, phân loại nghiệp vụ vs thuật ngữ ASR), đẩy lên Google Sheet dùng chung qua Service Account, và đồng bộ phản hồi VNA về OID. Dùng khi cần tạo bảng yêu cầu làm rõ VNA, gửi câu hỏi cho VNA, đẩy điểm cần chốt lên Google Sheet, hoặc đồng bộ phản hồi khách hàng về sổ điểm chốt.
---

# Skill: Theo dõi Q&A làm rõ với khách hàng (VNA)

> Biến các **điểm mở** trong sổ OID thành **bảng yêu cầu làm rõ** gửi khách hàng, **đẩy lên Google Sheet** dùng chung, rồi **đồng bộ phản hồi** về OID. Khép vòng hỏi–đáp giữa đội BA và VNA mà không rời sổ điểm chốt.

## 1. Khi nào dùng
Trigger: "tạo bảng yêu cầu làm rõ VNA", "gửi câu hỏi cho VNA", "đẩy điểm cần chốt lên Google Sheet", "đồng bộ phản hồi VNA về OID", "tracking Q&A khách hàng".

## 2. Nguyên tắc (CLAUDE.md §0 + văn phong người)
- Bảng **chỉ rút từ OID đã ghi** (`SO-THEO-DOI-DIEM-CHOT-v0.1.md`); không tự bịa câu hỏi.
- Tài liệu **gửi khách hàng** → tiếng Việt sạch, KHÔNG mã nội bộ (KS-xx/SME-xx/DEC-xx), không ký hiệu AI, không đối chiếu nội bộ.
- **Loại** nhóm A (Quyết định BA Lead) + mọi DEC nội bộ + điểm thuần nội bộ; chỉ đưa điểm **VNA trả lời được**.

## 3. Cột chuẩn (9)
`STT | Vấn đề | Mô tả nội dung | Điểm cần chốt | Trạng thái | Ngày gửi yêu cầu | Nội dung VNA phản hồi | Nhóm phân hệ | Phân loại`
- **Nhóm phân hệ:** PH1 / PH2 / PH3 / PH4 / PH5 / Chung — sort theo cột này.
- **Phân loại:** "Nghiệp vụ" (VNA chốt nghiệp vụ/tham số/nguồn dữ liệu) hoặc "Thuật ngữ/ASR" (xác minh tên/viết tắt/ký hiệu nghi nghe nhầm từ transcript).
- **Trạng thái:** "Mở" (chưa phản hồi) → "Đã trả lời" → đồng bộ về OID.
- **Ngày gửi / Phản hồi VNA:** để trống khi tạo; điền khi gửi / khi VNA trả lời.

## 4. Quy trình
1. **Rút điểm** (project-coordinator): đọc OID, chọn điểm mở cần VNA (nhóm B/C/D + E liên quan), gán phân hệ + phân loại → TSV **UTF-8 BOM, tab-separated, 9 cột**, sort theo phân hệ. Lưu `ba/sync/output/human/exports/YEU-CAU-LAM-RO-VNA-<YYYY-MM-DD>.tsv`. Kiểm mỗi dòng đúng 9 cột (8 tab).
2. **Đẩy lên Google Sheet** (SA cần quyền **Editor**):
   `python .claude/skills/crawl-pdf/scripts/gsheet-write.py <id|url> <file.tsv> --tab "Yêu cầu làm rõ VNA"`
   Nếu báo lỗi quyền → Share sheet cho `client_email` của Service Account với quyền Editor.
3. **Đồng bộ phản hồi (vòng sau):** pull sheet về bằng `gsheet-to-md.py <id> <out.md>`; với mỗi dòng có "Nội dung VNA phản hồi" → cập nhật điểm OID tương ứng (ghi kết quả + ngày, đổi 🟢 nếu đã chốt), bump version OID + changelog. Re-đẩy bảng cập nhật nếu cần.

## 5. Tài sản
- `crawl-pdf/scripts/gsheet-write.py` — ghi TSV → Google Sheet (clear+update, tự tạo tab).
- `crawl-pdf/scripts/gsheet-to-md.py` — đọc sheet về MD (đồng bộ phản hồi).
- Nguồn: `ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md`. SA key: `.secrets/toss-sa.json` (không commit).
