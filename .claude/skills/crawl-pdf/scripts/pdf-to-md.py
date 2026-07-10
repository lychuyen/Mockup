#!/usr/bin/env python
# pdf-to-md.py - Phan ra PDF -> Markdown GIU CAU TRUC bang pymupdf4llm (PyMuPDF).
#
# Vi sao: pymupdf4llm suy ra heading tu co chu (#, ##), phat hien bang -> Markdown table,
# giu **bold**/*italic*, reading-order tot hon -> dung muc tieu ra .md cho doc/RAG/LLM.
# Thay cho pdftotext (text phang) lam ENGINE MAC DINH cho PDF. pdftotext chi dung khi
# can text tho/toc do toi da (grep/dem tu/feed ASR) - xem pdf-to-md.ps1.
#
# Cai dat (pure Python, KHONG can poppler binary): python -m pip install --user pymupdf4llm
#
# Dung:
#   python pdf-to-md.py <input.pdf | thu-muc> [out-dir] [--images] [--suffix .extracted.md]
#   - input la file .pdf -> ghi <out-dir>/<base><suffix>
#   - input la thu muc   -> phan ra moi *.pdf trong do
#   - out-dir mac dinh = thu muc cua input
#   - --images: trich anh trong PDF ra <out-dir>/<base>_images/ (write_images)
#   - Ban .md la RAW EXTRACT, khong dien giai (CLAUDE.md §0).
#
# Khong dung print tieng Viet co dau de tranh loi console code page tren Windows.

import sys
import os
import io

def log(msg):
    sys.stdout.write(msg + "\n")
    sys.stdout.flush()

def main():
    args = [a for a in sys.argv[1:]]
    if not args:
        log("Usage: python pdf-to-md.py <input.pdf|dir> [out-dir] [--images] [--suffix .ext]")
        return 1

    images = "--images" in args
    if images:
        args.remove("--images")
    suffix = ".extracted.md"
    if "--suffix" in args:
        i = args.index("--suffix")
        suffix = args[i + 1]
        del args[i:i + 2]

    inp = args[0]
    out_dir = args[1] if len(args) > 1 else None

    try:
        import pymupdf4llm
    except ImportError:
        log("ERROR: pymupdf4llm chua cai. Chay: python -m pip install --user pymupdf4llm")
        return 3

    # Lap danh sach PDF
    if os.path.isdir(inp):
        pdfs = [os.path.join(inp, f) for f in sorted(os.listdir(inp)) if f.lower().endswith(".pdf")]
        default_out = inp
    elif os.path.isfile(inp) and inp.lower().endswith(".pdf"):
        pdfs = [inp]
        default_out = os.path.dirname(os.path.abspath(inp))
    else:
        log("ERROR: input khong phai .pdf hay thu muc: " + inp)
        return 2

    out_dir = out_dir or default_out
    os.makedirs(out_dir, exist_ok=True)

    if not pdfs:
        log("Khong tim thay .pdf nao trong: " + inp)
        return 0

    ok = 0
    for pdf in pdfs:
        base = os.path.splitext(os.path.basename(pdf))[0]
        out_md = os.path.join(out_dir, base + suffix)
        try:
            kwargs = {}
            if images:
                img_dir = os.path.join(out_dir, base + "_images")
                os.makedirs(img_dir, exist_ok=True)
                kwargs = {"write_images": True, "image_path": img_dir}
            md = pymupdf4llm.to_markdown(pdf, **kwargs)
            with io.open(out_md, "w", encoding="utf-8", newline="\n") as f:
                f.write(md)
            nlines = md.count("\n") + 1
            log("[OK] " + out_md + " (" + str(nlines) + " dong)")
            ok += 1
        except Exception as e:
            log("[LOI] " + pdf + " -> " + repr(e))

    log("Xong: " + str(ok) + "/" + str(len(pdfs)) + " PDF -> Markdown.")
    return 0 if ok == len(pdfs) else 1

if __name__ == "__main__":
    sys.exit(main())
