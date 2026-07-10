#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
split-md-by-section.py — Phân rã một file .md LỚN thành thư mục `<ten>_parts/`
theo SECTION CẤP 1 (mục đánh số), kèm INDEX.md nối nội dung từng phần.

Mục tiêu: tài liệu lớn (vd bản trích PDF 10k+ dòng) tra theo section, không nạp cả file
(token-economy, CLAUDE.md §0.5/§8). CHỈ tách trung thực — không sửa nội dung (§0).

Nhận diện ranh giới section (theo thứ tự ưu tiên):
  1. Heading đánh số cấp 1:  `## **N Title**` | `## N Title` | `# N Title`  (N = 1..n, KHÔNG phải N.M)
  2. Fallback nếu <2 section số: heading `## ` (cấp 2) — chỉ khi >=6 heading.
Phần trước section đầu tiên -> `sec-00-front-matter.md`.

Usage:
  python split-md-by-section.py "<file.md>" [--outdir <dir>] [--title "<tiêu đề INDEX>"] [--min-lines 800] [--delete-original]
  python split-md-by-section.py "<thư mục>" --all   # phân rã mọi .md > min-lines trong thư mục

Mặc định outdir = "<thư mục chứa file>/<tên-file-không-đuôi>_parts".
"""
import re, os, sys, argparse, io

# stdout UTF-8 (tránh UnicodeEncodeError trên Windows cp1252)
try:
    sys.stdout.reconfigure(encoding='utf-8')
except Exception:
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')

SEC_H2  = re.compile(r'^##\s+\*{0,2}(.*?)\*{0,2}\s*$')

def slug(s):
    s = re.sub(r'[^\w\s-]', '', s, flags=re.UNICODE).strip().lower()
    s = re.sub(r'\s+', '-', s)
    return (s[:40]).strip('-') or 'section'

def _collect_num(lines, level):
    """Heading đánh số ở 1 cấp ('##' hoặc '#'); số <= 99 để tránh bắt nhầm model/năm (vd '787')."""
    rx = re.compile(r'^' + re.escape(level) + r'\s+\*{0,2}(\d+)\s+(.*?)\*{0,2}\s*$')
    out = []
    for i, l in enumerate(lines):
        m = rx.match(l)
        if m and int(m.group(1)) <= 99:
            out.append((i, int(m.group(1)), m.group(2).strip()))
    return out

def find_bounds(lines):
    """Trả về (list[(line_index, num_or_None, title)], mode). Ưu tiên ## đánh số → # đánh số → ## (H2)."""
    for level in ('##', '#'):
        num_b = _collect_num(lines, level)
        if len(num_b) >= 2:
            return num_b, 'num(' + level + ')'
    h2_b = []
    for i, l in enumerate(lines):
        m = SEC_H2.match(l)
        if m and not l.strip().lower().startswith('## **table'):
            h2_b.append((i, None, m.group(1).strip()))
    if len(h2_b) >= 6:
        return h2_b, 'h2'
    return [], None

def split_file(path, outdir=None, title=None, delete_original=False):
    text = open(path, encoding='utf-8').read()
    lines = text.split('\n')
    base = os.path.splitext(os.path.basename(path))[0]
    if outdir is None:
        outdir = os.path.join(os.path.dirname(path), base + '_parts')
    os.makedirs(outdir, exist_ok=True)
    bounds, mode = find_bounds(lines)
    if not bounds:
        print(f"[BỎ QUA] {os.path.basename(path)} — không tìm thấy section để cắt.")
        return None
    parts = []
    first = bounds[0][0]
    fm = '\n'.join(lines[:first]).strip()
    if fm:
        fn = 'sec-00-front-matter.md'
        open(os.path.join(outdir, fn), 'w', encoding='utf-8').write(fm + '\n')
        parts.append(('00', 'Front matter (tiêu đề / mục lục / danh sách)', fn, fm.count('\n') + 1))
    for idx, (b, num, sec_title) in enumerate(bounds):
        end = bounds[idx + 1][0] if idx + 1 < len(bounds) else len(lines)
        body = '\n'.join(lines[b:end]).strip()
        nn = f"{num:02d}" if num is not None else f"{idx + 1:02d}"
        fn = f"sec-{nn}-{slug(sec_title)}.md"
        open(os.path.join(outdir, fn), 'w', encoding='utf-8').write(body + '\n')
        parts.append((nn, sec_title, fn, body.count('\n') + 1))
    # INDEX
    idx_title = title or f"INDEX — {base} (phân rã theo section)"
    out = [f"# {idx_title}\n",
           f"> Phân rã từ `{os.path.basename(path)}` để tra theo section (token-economy). CHỈ tách trung thực — không sửa nội dung (§0). Chế độ cắt: **{mode}**.\n",
           "| Section | Nội dung | File | Dòng |", "|---|---|---|---|"]
    for nn, t, fn, n in parts:
        out.append(f"| {nn} | {t} | [{fn}]({fn}) | {n} |")
    open(os.path.join(outdir, 'INDEX.md'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    total = sum(n for _, _, _, n in parts)
    print(f"[OK] {os.path.basename(path)} -> {outdir} ({len(parts)} part, {total}/{len(lines)} dòng, mode={mode})")
    for nn, t, fn, n in parts:
        print(f"     sec-{nn} ({n:>5} dòng) {t}")
    if delete_original:
        os.remove(path)
        print(f"     [đã xóa bản gốc {os.path.basename(path)} — nội dung nằm trong _parts/]")
    return outdir

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('target', help='file .md hoặc thư mục (với --all)')
    ap.add_argument('--outdir', default=None)
    ap.add_argument('--title', default=None)
    ap.add_argument('--min-lines', type=int, default=800)
    ap.add_argument('--all', action='store_true', help='phân rã mọi .md > min-lines trong thư mục target')
    ap.add_argument('--delete-original', action='store_true')
    a = ap.parse_args()
    if a.all and os.path.isdir(a.target):
        for f in sorted(os.listdir(a.target)):
            p = os.path.join(a.target, f)
            if f.endswith('.md') and not f.endswith('_parts') and os.path.isfile(p):
                if sum(1 for _ in open(p, encoding='utf-8')) > a.min_lines:
                    split_file(p, delete_original=a.delete_original)
    else:
        split_file(a.target, a.outdir, a.title, a.delete_original)

if __name__ == '__main__':
    main()
