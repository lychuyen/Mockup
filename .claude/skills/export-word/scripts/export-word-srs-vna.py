# -*- coding: utf-8 -*-
"""
export-word-srs-vna.py — Xuat SRS Markdown -> Word .docx theo bieu mau Viettel
"TAI LIEU THIET KE CHI TIET" (dong VNA.FIMS/TOSS — format 2 file SRS human-author).
Bien the 2 cua skill export-word (xem SKILL.md §7). Dac ta format:
.claude/knowledge/srs-word-format-vna-tit.md

Pipeline: strip nhe (.md links/frontmatter) -> pandoc --reference-doc=word-reference-srs-vna.docx
          -> hau xu ly (python, zipfile):
   1. Chen FRONT MATTER (bia + bang ghi nhan thay doi + trang ky + muc luc TOC) tu asset,
      dien placeholder tu tham so; chen logo Viettel (media + rels).
   2. Danh so heading da cap 1. / 1.1 / 1.1.1 / 1.1.1.1 (numPr tung paragraph + numbering.xml);
      heading phan "A - ..." khong danh so; SANG PHAN MOI (B - ...) danh so RESET (numId rieng).
   3. Section: front matter + phan A = portrait A4; tu phan B = landscape A4 (nhu nguon).
   4. Header/footer: header trong, footer "PAGE/NUMPAGES" nghieng TNR 11pt (default),
      trang bia khong so trang (titlePg + footer first trong).
   5. Bang: vien don den 0.5pt + header f2f2f2 (quy uoc bang mo ta cua nguon).
   6. settings.xml: updateFields (Word tu cap nhat TOC khi mo).
   7. QC + smoke test python-docx.

Vi du:
  python .claude/skills/export-word/scripts/export-word-srs-vna.py ^
      --md ba/workspace/drafts/srs/03-dac-ta-chuc-nang/my-srs.md ^
      --outbase SRS-TOSS-DataMaintenance --docversion 0.1 ^
      --ma-hieu-du-an VNA.TOSS --ma-hieu-tai-lieu "VNA.TOSS_SRS_Data Maintenance_v0.1" ^
      --thang-nam 07/2026
"""
import argparse, datetime, os, re, subprocess, sys, tempfile, zipfile, io
import xml.dom.minidom

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..', '..'))
SKILL = os.path.join(ROOT, '.claude', 'skills', 'export-word')
ASSETS = os.path.join(SKILL, 'assets', 'srs-vna')
TEMPLATE = os.path.join(ROOT, '.claude', 'templates', 'word-reference-srs-vna.docx')
PANDOC_CANDIDATES = [
    os.path.expandvars(r'%LOCALAPPDATA%\Pandoc\pandoc.exe'),
    r'C:\Users\VTIT\AppData\Local\Pandoc\pandoc.exe',
    'pandoc',
]

def read_asset(name):
    with open(os.path.join(ASSETS, name), encoding='utf-8') as f:
        return f.read()

# ---------------------------------------------------------------- strip nhe (kenh .md giu nguyen)
def transform_md(path):
    with open(path, encoding='utf-8-sig') as f:
        t = f.read()
    t = re.sub(r'^---\r?\n.*?\r?\n---\r?\n', '', t, count=1, flags=re.S)          # YAML frontmatter
    t = re.sub(r'(?<!\!)\[([^\]]+)\]\((?!https?://|mailto:)[^)]+\)', r'\1', t)     # link noi bo -> nhan
    t = re.sub(r'(?:\.{1,2}/)?(?:[\w.\-]+/)*([\w.\-]+?)\.(?:md|html)\b', r'\1', t) # path .md/.html
    return t

# ---------------------------------------------------------------- zip helpers
def zread(z, name):
    try:
        return z.read(name).decode('utf-8')
    except KeyError:
        return None

def repack(in_path, parts_text, parts_bin):
    """Ghi lai zip voi cac part thay the/them — entry '/' (OPC), khong dung backslash."""
    tmp = in_path + '.tmp'
    zin = zipfile.ZipFile(in_path)
    zout = zipfile.ZipFile(tmp, 'w', zipfile.ZIP_DEFLATED)
    done = set()
    for item in zin.infolist():
        name = item.filename.replace('\\', '/')
        if name in parts_text:
            zout.writestr(name, parts_text[name]); done.add(name)
        elif name in parts_bin:
            zout.writestr(name, parts_bin[name]); done.add(name)
        else:
            zout.writestr(name, zin.read(item))
    for name, data in list(parts_text.items()) + list(parts_bin.items()):
        if name not in done:
            zout.writestr(name, data)
    zin.close(); zout.close()
    os.replace(tmp, in_path)

# ---------------------------------------------------------------- heading numbering
PART_RX = re.compile(r'^[A-ZĐ]\s*[-–—]\s')   # "A - THONG TIN CHUNG", "B – ..."

def para_text(p_xml):
    return ''.join(re.findall(r'<w:t[^>]*>([^<]*)</w:t>', p_xml))

def number_headings(doc_xml):
    """Chen numPr vao moi paragraph Heading1-4; heading phan (A -/B -) khong danh so,
    moi phan dung numId rieng de danh so reset. Tra ve (doc_xml, danh sach numId)."""
    out = []
    pos = 0
    num_ids = [900]           # numId cho phan hien tai
    part_count = 0
    rx = re.compile(r'<w:p(?: [^>]*)?>.*?</w:p>', re.S)
    for m in rx.finditer(doc_xml):
        p = m.group(0)
        st = re.search(r'<w:pStyle w:val="Heading([1-9])"\s*/?>', p)
        if st:
            lvl = int(st.group(1))
            text = para_text(p).strip()
            if lvl == 1 and PART_RX.match(text):
                part_count += 1
                if part_count >= 2:
                    num_ids.append(900 + part_count - 1)   # phan moi -> numId moi (reset so)
            elif lvl <= 4 and '<w:numPr>' not in p:
                numpr = (f'<w:numPr><w:ilvl w:val="{lvl-1}"/>'
                         f'<w:numId w:val="{num_ids[-1]}"/></w:numPr>')
                p_new = p.replace(st.group(0), st.group(0) + numpr, 1)
                out.append(doc_xml[pos:m.start()]); out.append(p_new); pos = m.end()
    out.append(doc_xml[pos:])
    return ''.join(out), num_ids

def find_part2_offset(doc_xml):
    """Vi tri paragraph heading PHAN thu 2 (B - ...) trong chuoi hien tai — de chen section break."""
    part_count = 0
    for m in re.finditer(r'<w:p(?: [^>]*)?>.*?</w:p>', doc_xml, flags=re.S):
        p = m.group(0)
        if re.search(r'<w:pStyle w:val="Heading1"\s*/?>', p) and PART_RX.match(para_text(p).strip()):
            part_count += 1
            if part_count == 2:
                return m.start()
    return None

def inject_numbering(z_path, num_ids):
    z = zipfile.ZipFile(z_path)
    numb = zread(z, 'word/numbering.xml')
    ct = zread(z, '[Content_Types].xml')
    rels = zread(z, 'word/_rels/document.xml.rels')
    z.close()
    abs_tpl = read_asset('numbering-heading.xml')
    absx = ''.join(abs_tpl.replace('{{AID}}', str(n)) for n in num_ids)
    nums = ''.join(f'<w:num w:numId="{n}"><w:abstractNumId w:val="{n}"/></w:num>' for n in num_ids)
    parts = {}
    if numb is None:
        W_NS = ('xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"')
        numb = ('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
                f'<w:numbering {W_NS}>{absx}{nums}</w:numbering>')
        if 'numbering.xml' not in ct:
            ct = ct.replace('</Types>',
                            '<Override PartName="/word/numbering.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml"/></Types>')
            parts['[Content_Types].xml'] = ct
        if 'numbering.xml' not in rels:
            rid = new_rid(rels)
            rels = rels.replace('</Relationships>',
                                f'<Relationship Id="{rid}" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering" Target="numbering.xml"/></Relationships>')
            parts['word/_rels/document.xml.rels'] = rels
    else:
        first_num = numb.find('<w:num ')
        if first_num == -1:
            numb = numb.replace('</w:numbering>', absx + nums + '</w:numbering>')
        else:
            numb = numb[:first_num] + absx + numb[first_num:]
            numb = numb.replace('</w:numbering>', nums + '</w:numbering>')
    parts['word/numbering.xml'] = numb
    repack(z_path, parts, {})

def new_rid(rels_xml):
    used = set(int(x) for x in re.findall(r'Id="rId(\d+)"', rels_xml))
    return f'rId{max(used) + 1 if used else 1}'

# ---------------------------------------------------------------- tables: quy uoc vien/shading nguon
def canonical_tables(doc_xml):
    """Bang pandoc -> vien don den sz4 (0.5pt) + header row f2f2f2 (quy uoc bang mo ta nguon)."""
    borders = ('<w:tblBorders>'
               + ''.join(f'<w:{s} w:color="000000" w:space="0" w:sz="4" w:val="single"/>'
                         for s in ('top', 'left', 'bottom', 'right', 'insideH', 'insideV'))
               + '</w:tblBorders>')
    def fix_tblpr(m):
        pr = m.group(0)
        pr = re.sub(r'<w:tblBorders>.*?</w:tblBorders>', '', pr, flags=re.S)
        return pr.replace('</w:tblPr>', borders + '</w:tblPr>')
    doc_xml = re.sub(r'<w:tblPr>.*?</w:tblPr>', fix_tblpr, doc_xml, flags=re.S)
    # header row (tr dau tien cua moi tbl): shd f2f2f2 cho tung tc
    def shade_first_row(m):
        tbl = m.group(0)
        tr = re.search(r'<w:tr\b.*?</w:tr>', tbl, re.S)
        if not tr:
            return tbl
        row = tr.group(0)
        if '<w:shd' in row:
            return tbl
        row_new = row.replace('<w:tcPr>', '<w:tcPr><w:shd w:fill="f2f2f2" w:val="clear"/>')
        if '<w:tcPr>' not in row:
            row_new = row.replace('<w:tc>', '<w:tc><w:tcPr><w:shd w:fill="f2f2f2" w:val="clear"/></w:tcPr>', )
        return tbl.replace(row, row_new, 1)
    return re.sub(r'<w:tbl>.*?</w:tbl>', shade_first_row, doc_xml, flags=re.S)

# ---------------------------------------------------------------- main
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--md', action='append', required=True, help='file .md nguon (lap lai theo thu tu)')
    ap.add_argument('--outdir', default='ba/sync/output/human/exports')
    ap.add_argument('--outbase', required=True)
    ap.add_argument('--docversion', required=True)
    ap.add_argument('--ma-hieu-du-an', default='VNA.TOSS')
    ap.add_argument('--ma-hieu-tai-lieu', required=True)
    ap.add_argument('--thang-nam', default=datetime.date.today().strftime('%m/%Y'))
    ap.add_argument('--don-vi', default='VTIT')
    ap.add_argument('--force', action='store_true')
    a = ap.parse_args()

    pandoc = next((p for p in PANDOC_CANDIDATES if p == 'pandoc' or os.path.exists(p)), 'pandoc')
    today = datetime.date.today().isoformat()
    outdir = os.path.join(ROOT, a.outdir) if not os.path.isabs(a.outdir) else a.outdir
    os.makedirs(outdir, exist_ok=True)
    out = os.path.join(outdir, f'{a.outbase}-v{a.docversion}-{today}.docx')
    if os.path.exists(out) and not a.force:
        sys.exit(f'DA TON TAI: {out} — noi dung da chot thi TANG version; chi dung --force khi dang nhap cung version.')

    # 1) ghep + strip nhe
    md = '\n\n'.join(transform_md(os.path.join(ROOT, m) if not os.path.isabs(m) else m) for m in a.md)
    tmp_md = os.path.join(tempfile.gettempdir(), f'_srsvna_{a.outbase}.md')
    with open(tmp_md, 'w', encoding='utf-8') as f:
        f.write(md)

    # 2) pandoc
    cmd = [pandoc, tmp_md, '--from=markdown-yaml_metadata_block',
           f'--reference-doc={TEMPLATE}', '-o', out, f'--resource-path={ROOT}']
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0 or not os.path.exists(out):
        sys.exit(f'Pandoc loi: {r.stderr}')
    os.remove(tmp_md)

    # 3) hau xu ly
    z = zipfile.ZipFile(out)
    doc = zread(z, 'word/document.xml')
    rels = zread(z, 'word/_rels/document.xml.rels')
    ct = zread(z, '[Content_Types].xml')
    settings = zread(z, 'word/settings.xml')
    z.close()
    tz = zipfile.ZipFile(TEMPLATE)
    logo = tz.read('word/media/logo.png')
    tz.close()

    # 3a. rels: logo + header/footer parts
    hf_parts = {'header1.xml': ('header', 'first'), 'header2.xml': ('header', 'even'),
                'footer1.xml': ('footer', 'default'), 'footer2.xml': ('footer', 'first'),
                'footer3.xml': ('footer', 'even')}
    rid_map = {}
    for name in ['logo'] + list(hf_parts):
        rid = new_rid(rels)
        rid_map[name] = rid
        if name == 'logo':
            rel = (f'<Relationship Id="{rid}" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/logo.png"/>')
        else:
            kind = hf_parts[name][0]
            rel = (f'<Relationship Id="{rid}" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/{kind}" Target="{name}"/>')
        rels = rels.replace('</Relationships>', rel + '</Relationships>')

    # 3b. content types: png + header/footer overrides
    if 'Extension="png"' not in ct:
        ct = ct.replace('</Types>', '<Default Extension="png" ContentType="image/png"/></Types>')
    for name, (kind, _) in hf_parts.items():
        part = f'/word/{name}'
        if part not in ct:
            ct = ct.replace('</Types>',
                            f'<Override PartName="{part}" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.{kind}+xml"/></Types>')

    # 3c. front matter voi placeholder + logo rId
    fm = read_asset('frontmatter.xml')
    fm = (fm.replace('{{RID_LOGO}}', rid_map['logo'])
            .replace('{{MA_HIEU_DU_AN}}', a.ma_hieu_du_an)
            .replace('{{MA_HIEU_TAI_LIEU}}', a.ma_hieu_tai_lieu)
            .replace('{{THANG_NAM}}', a.thang_nam)
            .replace('{{DON_VI}}', a.don_vi))

    # 3d. danh so heading; bang theo quy uoc nguon (TRUOC khi chen front matter,
    #     de khong dung vao bang ghi nhan thay doi dotted/c0c0c0)
    doc, num_ids = number_headings(doc)
    doc = canonical_tables(doc)

    # 3e. tach section portrait/landscape
    refs = ''.join(
        f'<w:{kind}Reference r:id="{rid_map[name]}" w:type="{typ}"/>'
        for name, (kind, typ) in hf_parts.items())
    sect_portrait = read_asset('sectpr-portrait.xml').replace('{{HDRFTR_REFS}}', refs)
    sect_landscape = read_asset('sectpr-landscape.xml')
    break_para = f'<w:p><w:pPr>{sect_portrait}</w:pPr></w:p>'
    # thay sectPr CUOI CUNG (pandoc copy tu template, attribute da bi normalize) = landscape chuan
    last = None
    for m in re.finditer(r'<w:sectPr[\s>].*?</w:sectPr>', doc, flags=re.S):
        last = m
    if last is None:
        sys.exit('Khong tim thay sectPr cuoi trong document.xml')
    doc = doc[:last.start()] + sect_landscape + doc[last.end():]
    part2_at = find_part2_offset(doc)
    if part2_at is not None:
        doc = doc[:part2_at] + break_para + doc[part2_at:]

    # 3f. chen front matter ngay sau <w:body> (+ break neu tai lieu khong chia phan)
    fm_block = fm + ('' if part2_at is not None else break_para)
    doc = doc.replace('<w:body>', '<w:body>' + fm_block, 1)

    # 3g. dam bao khai bao namespace (wp/a/pic) tren root
    root = re.search(r'<w:document[^>]*>', doc).group(0)
    root_new = root
    for pref, uri in [('wp', 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing'),
                      ('a', 'http://schemas.openxmlformats.org/drawingml/2006/main'),
                      ('pic', 'http://schemas.openxmlformats.org/drawingml/2006/picture'),
                      ('r', 'http://schemas.openxmlformats.org/officeDocument/2006/relationships')]:
        if f'xmlns:{pref}=' not in root_new:
            root_new = root_new.replace('>', f' xmlns:{pref}="{uri}">', 1)
    doc = doc.replace(root, root_new, 1)

    # 3h. settings: updateFields (Word cap nhat TOC/PAGE khi mo)
    if settings and '<w:updateFields' not in settings:
        settings = re.sub(r'(<w:settings[^>]*>)', r'\1<w:updateFields w:val="true"/>', settings, count=1)

    parts_text = {'word/document.xml': doc,
                  'word/_rels/document.xml.rels': rels,
                  '[Content_Types].xml': ct}
    if settings:
        parts_text['word/settings.xml'] = settings
    for name, _ in hf_parts.items():
        parts_text[f'word/{name}'] = read_asset(name)
    repack(out, parts_text, {'word/media/logo.png': logo})
    inject_numbering(out, num_ids)

    # ---------------- QC ----------------
    z = zipfile.ZipFile(out)
    names = [i.filename for i in z.infolist()]
    doc = zread(z, 'word/document.xml')
    numb = zread(z, 'word/numbering.xml') or ''
    settings = zread(z, 'word/settings.xml') or ''
    styles = zread(z, 'word/styles.xml') or ''
    txt = re.sub(r'<[^>]+>', '', re.sub(r'</w:p>', '\n', doc))
    qc = {}
    qc['OPC entry dung "/" (khong backslash)'] = not any('\\' in n for n in names)
    qc['XML well-formed (moi part)'] = True
    for n in names:
        if n.endswith('.xml') or n.endswith('.rels'):
            try:
                xml.dom.minidom.parseString(z.read(n))
            except Exception:
                qc['XML well-formed (moi part)'] = False
    qc['khong con {{placeholder}}'] = '{{' not in doc
    qc['bia: TAP DOAN + BIEU MAU + TL TKCT'] = all(s in txt for s in
        ['TẬP ĐOÀN CÔNG NGHIỆP - VIỄN THÔNG QUÂN ĐỘI VIETTEL', 'BIỂU MẪU', 'TÀI LIỆU THIẾT KẾ CHI TIẾT'])
    qc['bia: ma hieu du an/tai lieu'] = (f'Mã hiệu dự án: {a.ma_hieu_du_an}' in txt
                                          and 'Mã hiệu tài liệu: ' in txt)
    qc['logo bia (media + rels + drawing)'] = ('word/media/logo.png' in names
        and rid_map['logo'] in doc and f'Id="{rid_map["logo"]}"' in zread(z, 'word/_rels/document.xml.rels'))
    qc['BANG GHI NHAN THAY DOI (c0c0c0, dotted)'] = ('BẢNG GHI NHẬN THAY ĐỔI TÀI LIỆU' in txt
        and 'w:fill="c0c0c0"' in doc and 'w:val="dotted"' in doc)
    qc['TRANG KY (lap/xem xet/phe duyet)'] = all(s in txt for s in
        ['TRANG KÝ', 'Người lập:', 'Người xem xét:', 'Người phê duyệt:'])
    qc['MUC LUC + field TOC \\t Heading'] = ('MỤC LỤC' in txt
        and 'TOC \\h \\u \\z \\t' in doc and 'Heading 1,1,Heading 2,2,Heading 3,3' in doc)
    qc['heading co numPr da cap'] = ('<w:numPr>' in doc
        and all(f'<w:num w:numId="{n}">' in numb for n in num_ids))
    qc['numbering: 1. / 1.1 / 1.1.1'] = ('<w:lvlText w:val="%1."/>' in numb
        and '<w:lvlText w:val="%1.%2"/>' in numb)
    qc['2 section: portrait + landscape'] = (doc.count('<w:sectPr') == 2
        and 'w:orient="portrait"' in doc and 'w:orient="landscape"' in doc)
    qc['footer PAGE/NUMPAGES + trang bia trong'] = ('word/footer1.xml' in names
        and 'NUMPAGES' in (zread(z, 'word/footer1.xml') or '')
        and 'word/footer2.xml' in names and '<w:titlePg' in doc)
    qc['bang: vien den sz4 + header f2f2f2'] = True  # co the khong co bang trong md
    body_after_fm = doc.split('MỤC LỤC', 1)[-1]
    if '<w:tbl>' in body_after_fm:
        qc['bang: vien den sz4 + header f2f2f2'] = ('w:fill="f2f2f2"' in body_after_fm)
    qc['docDefaults khong italic (quirk gdocs da va)'] = bool(
        re.search(r'<w:rPrDefault>\s*<w:rPr>\s*<w:i w:val="0"\s*/>', styles))
    qc['settings updateFields'] = '<w:updateFields w:val="true"/>' in settings
    qc['khong lo .md / ]('] = ('.md' not in txt and '](' not in txt)
    z.close()
    try:
        from docx import Document
        Document(out)
        qc['python-docx mo duoc (smoke)'] = True
    except Exception:
        qc['python-docx mo duoc (smoke)'] = False

    print(f'\nXUAT: {out}  ({os.path.getsize(out)/1024:.1f} KB)')
    print('----- QC -----')
    fail = 0
    for k, v in qc.items():
        if not v:
            fail += 1
        print(f'  [{"PASS" if v else "FAIL"}] {k}')
    print(f'----- KET QUA: {"PASS toan bo" if fail == 0 else str(fail) + " muc FAIL"} -----')
    if fail:
        sys.exit(1)

if __name__ == '__main__':
    main()
