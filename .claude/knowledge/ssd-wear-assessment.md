# Đánh giá hao mòn SSD do workflow agent (cảnh báo dùng cho mọi dự án clone framework)

> **Mục đích:** Giải đáp/đánh giá nhanh khi ai đó lo "cách agent làm việc (hook, log, extract, export, git) có làm giảm tuổi thọ SSD không". Áp dụng cho TOSS và **mọi dự án clone từ framework này** (PIC, n8n…). Nguồn: rà soát thực tế TOSS ngày 2026-06-23.

---

## Kết luận một dòng
Workflow agent của framework này **gần như không ảnh hưởng** tuổi thọ SSD. Hao mòn (TBW) không phải là rủi ro; vấn đề thực tế (nếu có) là **phình dung lượng** `logs/` và `.git`, không phải mòn ổ.

## Vì sao — định lượng
- SSD tiêu dùng có định mức **TBW (Terabytes Written)** thường **150–600 TB**.
- Phiên làm việc nặng (extract PDF/DOCX + export Word + lưu transcript + git) ước tính **~1–2 GB ghi/ngày**.
- → **~0,4–0,7 TB/năm**. Với ổ 300 TBW: chạy kiểu này **~400 năm** mới chạm giới hạn. Hao mòn không đáng kể.

## Các nguồn ghi và mức độ (bảng tham chiếu)

| Nguồn | Tần suất | Lượng ghi | Đánh giá |
|---|---|---|---|
| **Hook PostToolUse** (format-markdown, quality-gate, skill-lint) | Mỗi lần Write | **0 byte** — các script chỉ ĐỌC/kiểm tra, không ghi lại file | ✅ Không khuếch đại ghi |
| **save-transcript** (Stop hook) | Mỗi khi kết thúc phiên | ~3 MB/phiên (copy full transcript JSONL → `logs/ba-sessions/`) | 🟡 Lặp lại nhưng nhỏ |
| Write/Edit file `.md` | Theo thao tác | KB–vài MB/file | ✅ Không đáng kể |
| Extract PDF/DOCX, export Word | Khi có tài liệu mới | vài MB/lần | ✅ Không đáng kể |
| Git commit (nếu track file input nhị phân) | Khi commit | Gộp vào `.git` | 🟡 Phình dung lượng, không phải hao mòn |

## Điểm tốt cần giữ (chống write amplification)
**Các hook chạy trên mỗi Write phải read-only.** Sai lầm phổ biến gây hao SSD là hook ghi lại (format/rewrite) file sau mỗi lần Write → mỗi file bị ghi 2 lần. Framework hiện tại các hook validate đều **không ghi** — giữ nguyên thiết kế này. Khi thêm hook mới: ưu tiên kiểm tra-rồi-cảnh-báo, tránh tự sửa file trong PostToolUse trừ khi thật cần.

## Cờ cần để ý (là DUNG LƯỢNG, không phải tuổi thọ)
1. **`logs/ba-sessions/` tăng mỗi phiên** (lưu transcript trên mỗi Stop). Nên `.gitignore` (TOSS đã ignore) và dọn định kỳ — giữ N phiên gần nhất.
2. **`.git` phình** nếu track nhiều file input nhị phân (PDF/DOCX). Cân nhắc `.gitignore` file thô lớn, dùng Git LFS, hoặc chỉ giữ bản `.extracted.md`.

## Checklist nhanh khi audit một dự án
- [ ] Các hook PostToolUse có ghi lại file không? (phải KHÔNG — nếu có là write amplification)
- [ ] `logs/` đã `.gitignore` chưa? Có cơ chế dọn không?
- [ ] File input nhị phân lớn có bị track trong git làm `.git` phình không?
- [ ] Có tiến trình nền/loop nào ghi file liên tục không?

> **Tóm lại để trả lời người hỏi:** "Không cần lo tuổi thọ SSD. Cách làm hiện tại ghi quá ít so với định mức ổ. Thứ đáng quản là dung lượng log/git, không phải hao mòn."
