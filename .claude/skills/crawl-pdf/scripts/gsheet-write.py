#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
gsheet-write.py — Ghi một file TSV/CSV lên Google Sheet (qua Service Account).

Bổ trợ gsheet-to-md.py (đọc). Script này GHI: clear tab đích rồi update toàn bộ.
YÊU CẦU: Service Account phải có quyền **Editor** trên sheet (Share → client_email → Editor).

Usage:
  python gsheet-write.py <id|url> <file.tsv> [--tab "Tên tab"] [--key .secrets/toss-sa.json] [--delimiter \t] [--no-clear]
- --tab: tên worksheet đích; nếu chưa có sẽ TẠO MỚI; bỏ qua = worksheet đầu tiên.
- Mặc định clear tab rồi ghi từ A1.
"""
import sys, csv, io, argparse, re

def extract_id(s):
    m = re.search(r'/spreadsheets/d/([a-zA-Z0-9_-]+)', s)
    return m.group(1) if m else s

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('sheet'); ap.add_argument('tsv')
    ap.add_argument('--tab', default=None)
    ap.add_argument('--key', default='.secrets/toss-sa.json')
    ap.add_argument('--delimiter', default='\t')
    ap.add_argument('--no-clear', action='store_true')
    a = ap.parse_args()
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:
        pass

    import gspread
    from google.oauth2.service_account import Credentials
    SCOPES = ['https://www.googleapis.com/auth/spreadsheets',
              'https://www.googleapis.com/auth/drive']
    creds = Credentials.from_service_account_file(a.key, scopes=SCOPES)
    gc = gspread.authorize(creds)

    sid = extract_id(a.sheet)
    delim = '\t' if a.delimiter in ('\\t', '\t') else a.delimiter
    rows = [r for r in csv.reader(io.open(a.tsv, encoding='utf-8-sig'), delimiter=delim)]
    if not rows:
        print('[LỖI] file rỗng'); sys.exit(1)

    try:
        sh = gc.open_by_key(sid)
    except Exception as e:
        print(f'[LỖI] Không mở được sheet {sid}: {e}')
        print('  → Kiểm tra Service Account đã được Share quyền Editor chưa.')
        sys.exit(2)

    if a.tab:
        try:
            ws = sh.worksheet(a.tab)
        except gspread.WorksheetNotFound:
            ws = sh.add_worksheet(title=a.tab, rows=len(rows) + 10, cols=len(rows[0]) + 2)
    else:
        ws = sh.sheet1

    try:
        if not a.no_clear:
            ws.clear()
        ws.update(rows, 'A1')  # gspread v6: update(values, range)
    except Exception as e:
        print(f'[LỖI] Ghi thất bại: {e}')
        print('  → Nhiều khả năng Service Account chỉ có quyền Viewer.')
        print('     Share sheet cho client_email với quyền **Editor** rồi chạy lại.')
        sys.exit(3)
    print(f'[OK] Ghi {len(rows)} dòng × {len(rows[0])} cột vào tab "{ws.title}" của sheet {sid}.')

if __name__ == '__main__':
    main()
