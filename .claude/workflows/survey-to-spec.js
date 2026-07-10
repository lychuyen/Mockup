// Workflow: survey-to-spec
// Tự động hóa chuỗi việc lặp lại sau mỗi buổi khảo sát TOSS:
//   Báo cáo khảo sát -> Đối chiếu nguồn chuẩn (YCKT + Function list + wireframe/SRS)
//   -> Sinh ĐỀ XUẤT làm giàu (wireframe delta + OID delta + glossary) + Bảng quyết định BA Lead.
//
// NGUYÊN TẮC §0: workflow chỉ PHÂN RÃ + ĐỐI CHIẾU + ĐỀ XUẤT. KHÔNG tự ghi đè
// wireframe/OID/glossary đã chốt; KHÔNG tự quyết. Đầu ra là 1 file proposal để người duyệt.
//
// Tham số (args): { meeting: 'DDMMYYYY', label: '...', screen?: '...' }
//   meeting  — mã ngày buổi khảo sát (vd '18062026'); báo cáo phải đã tồn tại ở 02-khao-sat.
//   label    — mô tả ngắn buổi (vd 'CLC & Điều phái').
// Cổng người: glossary (chỉ đề xuất), OID (chỉ đề xuất), áp dụng vào file chốt — đều do BA Lead.

export const meta = {
  name: 'survey-to-spec',
  description: 'Sau buổi khảo sát: đối chiếu báo cáo với YCKT + Function list + wireframe/SRS, sinh đề xuất làm giàu (wireframe/OID/glossary) + bảng quyết định BA Lead. Chỉ đề xuất, không ghi đè file chốt (§0).',
  phases: [
    { title: 'Discovery', detail: 'Đọc báo cáo khảo sát + xác nhận domain' },
    { title: 'Cross-ref', detail: 'Đối chiếu song song: YCKT sheets + Function list/wireframe/SRS' },
    { title: 'Proposal', detail: 'Tổng hợp đề xuất làm giàu + OID + glossary + bảng quyết định' },
    { title: 'Status', detail: 'Cập nhật bảng theo dõi pipeline survey-pipeline-status.md' },
  ],
}

const MEETING = (args && args.meeting) || '18062026'
const LABEL = (args && args.label) || 'buổi khảo sát'
const BASE = 'd:/TOSS'
const KS = BASE + '/ba/workspace/drafts/phan-tich/02-khao-sat'
const YCKT = BASE + '/ba/workspace/drafts/phan-tich/03-yckt'
const NGUON = BASE + '/ba/workspace/drafts/phan-tich/01-nguon'
const WF = BASE + '/ba/workspace/drafts/wireframe/PH1/wf-monitoring-overview.md'
const OUT = 'd:\\TOSS\\ba\\workspace\\drafts\\phan-tich\\02-khao-sat\\PROPOSAL-' + MEETING + '-enrichment.md'
const STATUS = 'd:\\TOSS\\ba\\sync\\models\\survey-pipeline-status.md'
const TODAY = (args && args.today) || ''  // truyền ngày qua args nếu muốn cố định; trống = agent tự dùng ngày hệ thống

// ── PHASE 1 — Discovery: đọc báo cáo + xác nhận domain ───────────────────────────
phase('Discovery')

const REPORT_SCHEMA = {
  type: 'object',
  additionalProperties: false,
  required: ['reportFound', 'domainOk', 'topics', 'summary'],
  properties: {
    reportFound: { type: 'boolean' },
    domainOk: { type: 'boolean', description: 'true nếu nội dung thuộc TOSS (khai thác hàng không)' },
    reportPath: { type: 'string' },
    topics: { type: 'array', items: { type: 'string' }, description: 'Các chủ đề §II của báo cáo' },
    summary: { type: 'string', description: 'Tóm tắt 3-5 câu nội dung buổi' },
  },
}

const discovery = await agent(
  'Tìm và đọc báo cáo khảo sát của buổi ' + MEETING + ' (' + LABEL + ') trong thư mục ' + KS + '/.\n'
  + 'Tên file dạng BAO-CAO-KHAO-SAT-' + MEETING + '-v*.md (lấy version cao nhất). Nếu KHÔNG có báo cáo, đặt reportFound=false.\n'
  + 'Xác nhận domain: nội dung có thuộc dự án TOSS (điều hành khai thác hàng không: dispatch/OFP/MEL/AMOS/điều phái/tải...) không → domainOk.\n'
  + 'Liệt kê các chủ đề §II và tóm tắt ngắn. CHỈ đọc, không sửa file.',
  { label: 'discovery', phase: 'Discovery', agentType: 'business-analyst', schema: REPORT_SCHEMA }
)

if (!discovery || !discovery.reportFound) {
  log('DỪNG: không tìm thấy báo cáo khảo sát cho ' + MEETING + ' (chạy survey-report trước).')
  return { stopped: 'no-report', meeting: MEETING }
}
if (!discovery.domainOk) {
  log('DỪNG: nội dung buổi ' + MEETING + ' KHÔNG thuộc domain TOSS — cần BA Lead xem xét.')
  return { stopped: 'domain-mismatch', meeting: MEETING, summary: discovery.summary }
}
log('Báo cáo OK, domain TOSS. Chủ đề: ' + (discovery.topics || []).length + ' — đối chiếu nguồn...')

// ── PHASE 2 — Cross-ref song song (YCKT  +  Function list/wireframe/SRS) ─────────
phase('Cross-ref')

const XREF_SCHEMA = {
  type: 'object',
  additionalProperties: false,
  required: ['matches', 'newItems', 'gaps'],
  properties: {
    matches: { type: 'array', items: { type: 'object', additionalProperties: true }, description: 'Chủ đề buổi -> mã nguồn khớp + quan hệ (Khớp/Một phần)' },
    newItems: { type: 'array', items: { type: 'string' }, description: 'Nội dung buổi CHƯA có trong nguồn (yêu cầu mới)' },
    gaps: { type: 'array', items: { type: 'string' }, description: 'Mục nguồn liên quan mà buổi không bàn' },
  },
}

const xref = await parallel([
  () => agent(
    'Đối chiếu báo cáo khảo sát buổi ' + MEETING + ' (' + KS + '/, lấy version cao nhất) với thư mục YCKT ' + YCKT + '/.\n'
    + 'Đọc các sheet liên quan (đặc biệt sheet-04 yckt-v3, sheet-05 dsp, sheet-08 cảnh báo & tham số, sheet-06 tích hợp, sheet-09 fos, sheet-12 logic).\n'
    + 'Với mỗi chủ đề/nội dung buổi họp: tìm mã TOSS-xxx / sheet khớp; phân loại Khớp / Một phần / Mới (chưa có) / Gap (nguồn có, buổi không bàn).\n'
    + 'Bám §0: dẫn mã sheet/TOSS-xxx. Trả về matches/newItems/gaps.',
    { label: 'xref-yckt', phase: 'Cross-ref', agentType: 'business-analyst', schema: XREF_SCHEMA }
  ),
  () => agent(
    'Đối chiếu báo cáo khảo sát buổi ' + MEETING + ' (' + KS + '/) với (a) sheet "Màn hình Flight Dispatch" trong ' + NGUON + '/VNA-TOSS-Function-list-v1.0.extracted.md và (b) wireframe ' + WF + ' (§8/§9) và (c) SRS PH1 (FUNC màn giám sát).\n'
    + 'Xác định: nội dung buổi đã có trong wireframe/SRS chưa; phần nào làm rõ thêm cột/logic đã đặc tả; phần nào MỚI cần bổ sung.\n'
    + 'Bám §0: dẫn §8/§9 wireframe, FUNC-xxx, [FL-FD]. Trả về matches/newItems/gaps.',
    { label: 'xref-wf-srs', phase: 'Cross-ref', agentType: 'business-analyst', schema: XREF_SCHEMA }
  ),
])

const xy = xref.filter(Boolean)
const allNew = xy.flatMap(r => r.newItems || [])
log('Cross-ref xong. Tổng yêu cầu MỚI phát hiện: ' + allNew.length + ' — sinh đề xuất...')

// ── PHASE 3 — Proposal: tổng hợp đề xuất (KHÔNG ghi đè file chốt) ─────────────────
phase('Proposal')

await agent(
  'Viết MỘT file đề xuất làm giàu cho buổi khảo sát ' + MEETING + ' (' + LABEL + '). Đây là tài liệu ĐỀ XUẤT để BA Lead duyệt — KHÔNG sửa wireframe/OID/glossary đã chốt.\n\n'
  + 'Ngữ liệu: báo cáo khảo sát buổi ' + MEETING + ' (' + KS + '/), kết quả đối chiếu YCKT + Function list/wireframe/SRS (đọc lại các nguồn để dẫn chính xác). '
  + 'Các yêu cầu MỚI phát hiện: ' + JSON.stringify(allNew).slice(0, 3000) + '\n\n'
  + 'GHI FILE: ' + OUT + ' với cấu trúc:\n'
  + '1. **Tổng quan** — buổi làm rõ/đào sâu sheet/màn nào; mức khớp ước lượng.\n'
  + '2. **Đề xuất làm giàu WIREFRAME** — các cột/logic/quy ước mới cần thêm vào wf-monitoring §9.x hoặc section mới (mỗi mục: nội dung + nguồn timestamp + chỗ chèn đề xuất). KHÔNG sửa file wireframe, chỉ liệt kê delta.\n'
  + '3. **Đề xuất làm giàu SRS** — cột/chức năng nào ĐÃ RÕ NGUỒN có thể phân rã FUNC mới; cột nào còn cờ → hoãn (ghi rõ cờ).\n'
  + '4. **Đề xuất OID** — các điểm mở mới (SME/KS/RISK/DEC) dạng bảng sẵn để thêm vào sổ (mã đề xuất, nội dung, owner, loại). Đánh dấu rủi ro 🔴 nếu có.\n'
  + '5. **Đề xuất GLOSSARY** — bảng thuật ngữ mới (Thuật ngữ | Mô tả | Nguồn) — chỉ đề xuất, chờ confirm.\n'
  + '6. **BẢNG QUYẾT ĐỊNH BA LEAD** — các mâu thuẫn/điểm cần người chốt (đánh số, nêu rõ phương án A/B nếu có).\n\n'
  + 'Văn phong tiếng Việt; định danh OPS++/Lido Import file/FOEM; dẫn nguồn mọi mục (timestamp / mã sheet / §wireframe / FUNC). Frontmatter: project TOSS, document_type "Đề xuất làm giàu sau khảo sát", date theo hệ thống, status Draft, survey_date ' + MEETING + '.\n'
  + 'Cuối file ghi rõ: "Đây là ĐỀ XUẤT — việc áp dụng vào wireframe/SRS/OID/glossary do BA Lead duyệt (§0)."',
  { label: 'proposal', phase: 'Proposal', agentType: 'business-analyst' }
)

// ── PHASE 4 — Status: cập nhật bảng theo dõi pipeline ───────────────────────────
phase('Status')

await agent(
  'Cập nhật bảng theo dõi pipeline khảo sát: ' + STATUS + '.\n'
  + 'Đọc bảng hiện tại (nếu chưa tồn tại thì tạo mới theo cấu trúc: §1 bảng tiến độ theo buổi, §2 quyết định/rủi ro chờ, §3 số liệu tích lũy, §4 next actions).\n'
  + 'CẬP NHẬT (không xóa dòng buổi khác) cho buổi ' + MEETING + ':\n'
  + '- §1: dòng buổi ' + MEETING + ' → Báo cáo KS=✅, Đối chiếu nguồn=✅, Proposal=✅ (' + OUT + '), Áp dụng=⏳ chờ duyệt, Commit=—, Quyết định chờ=<đếm số câu trong §6 BẢNG QUYẾT ĐỊNH của ' + OUT + '> kèm số rủi ro 🔴, Cập nhật=' + (TODAY ? TODAY : 'ngày hiện tại theo hệ thống') + '.\n'
  + '- §2: gom các quyết định/rủi ro 🔴 mới từ §4 và §6 của proposal.\n'
  + '- §3: cập nhật cột "Đề xuất thêm" (đọc proposal lấy số FUNC/OID/glossary đề xuất). Phát hiện ' + allNew.length + ' yêu cầu mới ở lần chạy này.\n'
  + '- §4: cập nhật next actions.\n'
  + 'Ghi đè file bằng bảng đã cập nhật. Giữ định dạng markdown gọn, dễ đọc. Cuối file ghi "Lần cập nhật gần nhất" = ngày hiện tại.',
  { label: 'status', phase: 'Status', agentType: 'business-analyst' }
)

return { ok: true, meeting: MEETING, newItems: allNew.length, proposal: OUT, status: STATUS }
