# -*- coding: utf-8 -*-
"""
mermaid-to-drawio.py — Chuyển các sơ đồ Mermaid trong 1 file .md sang draw.io XML (.drawio)
CHẤT LƯỢNG hand-author: layered layout cho flowchart/state, lifeline cho sequence.
Mỗi block Mermaid -> 1 page trong .drawio. Mermaid = nguồn AI; draw.io = bản Human (quy tắc modeler).

Usage: python mermaid-to-drawio.py "<file.md>" ["<out.drawio>"]
"""
import re, sys, html, io
try: sys.stdout.reconfigure(encoding='utf-8')
except Exception: pass

def esc(s): return html.escape(s).replace("\\n", "&#10;").replace("&amp;#10;", "&#10;")

# ---------- tách block ----------
def blocks(md):
    out=[]; cur=None
    for ln in md.split("\n"):
        if ln.strip().startswith("```mermaid"): cur=[]; continue
        if cur is not None and ln.strip().startswith("```"):
            out.append(cur); cur=None; continue
        if cur is not None: cur.append(ln)
    return out

def dtype(lines):
    for l in lines:
        s=l.strip()
        if not s: continue
        if s.startswith("sequenceDiagram"): return "seq"
        if s.startswith("stateDiagram"): return "state"
        if s.startswith("flowchart") or s.startswith("graph"): return "flow"
        return "flow"
    return "flow"

# ---------- FLOWCHART / STATE ----------
NODE_RE = re.compile(r'([A-Za-z0-9_]+)\s*(\(\(.+?\)\)|\[\[.+?\]\]|\(\[.+?\]\)|\[\(.+?\)\]|\{.+?\}|\(.+?\)|\[.+?\])')
# token: node-id  |  arrow (kèm nhãn |..| tùy chọn)
TOK_RE = re.compile(r'([A-Za-z0-9_]+)|(-\.->|==>|-->|-\.-|---)\s*(?:\|([^|]*)\|)?')

def shape_of(br):
    if br.startswith("(("): return ("ellipse", br[2:-2])
    if br.startswith("[["): return ("process", br[2:-2])      # subroutine
    if br.startswith("(["): return ("stadium", br[2:-2])
    if br.startswith("[("): return ("cylinder", br[2:-2])
    if br.startswith("{"):  return ("rhombus", br[1:-1])
    if br.startswith("("):  return ("rounded", br[1:-1])
    return ("rect", br[1:-1])

def parse_flow(lines):
    nodes={}; order=[]; edges=[]; subs=[]; cursub=None; sgids={}  # sgids: id->index in subs
    def reg(nid, sh=None, lab=None):
        if nid in sgids: return            # subgraph id: KHÔNG tạo node (sẽ nối vào khung)
        if nid not in nodes:
            nodes[nid]=(sh or ("ellipse" if nid=="START_STATE" else "rect"),
                        lab if lab is not None else ("●" if nid=="START_STATE" else nid))
            order.append(nid)
    for raw in lines:
        s=raw.strip(); low=s.lower()
        if not s or s.startswith("%%"): continue
        if any(low.startswith(k) for k in ("flowchart","graph","statediagram","direction","classdef","class ","linkstyle","style ")): continue
        if low.startswith("subgraph"):
            m=re.match(r'subgraph\s+(\w+)\s*\["?(.+?)"?\]\s*$', s)
            if m: sgid,title=m.group(1),m.group(2)
            else:
                m2=re.match(r'subgraph\s+"?(.+?)"?\s*$', s); sgid="SG%d"%len(subs); title=(m2.group(1) if m2 else "Nhóm")
            sgids[sgid]=len(subs); cursub=[title,[],sgid]; subs.append(cursub); continue
        if low=="end": cursub=None; continue
        s2=s.replace("[*]","START_STATE")
        def repl(m):
            nid=m.group(1); sh,lab=shape_of(m.group(2)); reg(nid,sh,lab); return " "+nid+" "
        norm=NODE_RE.sub(repl, s2)
        toks=[]
        for m in TOK_RE.finditer(norm):
            if m.group(1) is not None: toks.append(("n", m.group(1)))
            elif m.group(2) is not None: toks.append(("a", m.group(2), m.group(3) or ""))
        members=[]; i=0
        while i < len(toks):
            if toks[i][0]=="n": members.append(toks[i][1])
            if i+2 <= len(toks)-1 and toks[i][0]=="n" and toks[i+1][0]=="a" and toks[i+2][0]=="n":
                a=toks[i][1]; arrow=toks[i+1][1]; lbl=toks[i+1][2]; b=toks[i+2][1]
                reg(a); reg(b); edges.append((a,b,lbl,arrow.startswith("-.")))
                i+=2; continue
            i+=1
        if cursub is not None:
            for nid in members:
                if nid in nodes and nid not in cursub[1]: cursub[1].append(nid)
    return nodes, order, edges, subs, sgids

def layer_layout(nodes, order, edges):
    # cycle-aware longest-path layering (bỏ back-edge khi DFS)
    succ={n:[] for n in nodes}; indeg={n:0 for n in nodes}
    fwd=[]
    # phát hiện back-edge bằng DFS order
    adj={n:[] for n in nodes}
    for a,b,_,_ in edges: adj[a].append(b)
    state={}; back=set()
    def dfs(u):
        state[u]=1
        for v in adj[u]:
            if state.get(v,0)==1: back.add((u,v))
            elif state.get(v,0)==0: dfs(v)
        state[u]=2
    for n in order:
        if state.get(n,0)==0: dfs(n)
    for a,b,_,_ in edges:
        if (a,b) in back: continue
        succ[a].append(b); indeg[b]+=1; fwd.append((a,b))
    layer={n:0 for n in nodes}
    # topo longest path
    from collections import deque
    q=deque([n for n in order if indeg[n]==0]); ind=dict(indeg)
    seen=set(q)
    while q:
        u=q.popleft()
        for v in succ[u]:
            layer[v]=max(layer[v],layer[u]+1); ind[v]-=1
            if ind[v]==0: q.append(v)
    # nhóm theo layer, giữ thứ tự xuất hiện
    bylayer={}
    for n in order: bylayer.setdefault(layer[n],[]).append(n)
    pos={}
    YH=90; XW=240; GAPX=40; GAPY=70
    maxw=max((len(v) for v in bylayer.values()), default=1)
    for ly in sorted(bylayer):
        row=bylayer[ly]; total=len(row)
        for i,n in enumerate(row):
            x = int((i - (total-1)/2)*(XW+GAPX) + maxw*(XW+GAPX)/2)
            y = ly*(YH+GAPY)+40
            pos[n]=(x,y)
    return pos

STYLE={"rect":"rounded=0;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;",
 "rounded":"rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;",
 "rhombus":"rhombus;whiteSpace=wrap;html=1;fillColor=#ffe6cc;strokeColor=#d79b00;",
 "ellipse":"ellipse;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;",
 "process":"shape=process;whiteSpace=wrap;html=1;fillColor=#e1d5e7;strokeColor=#9673a6;",
 "stadium":"rounded=1;arcSize=50;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;",
 "cylinder":"shape=cylinder3;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;"}

def flow_cells(lines):
    nodes,order,edges,subs=parse_flow(lines)
    pos=layer_layout(nodes,order,edges)
    cells=[]
    # subgraph containers (vẽ trước, làm nền)
    for si,(title,ids) in enumerate(subs):
        ids=[i for i in ids if i in pos]
        if not ids: continue
        xs=[pos[i][0] for i in ids]; ys=[pos[i][1] for i in ids]
        x0=min(xs)-20; y0=min(ys)-30; x1=max(xs)+240+20; y1=max(ys)+90+20
        cells.append(f'<mxCell id="sg{si}" value="{esc(title)}" style="rounded=0;whiteSpace=wrap;html=1;dashed=1;fillColor=none;strokeColor=#999999;verticalAlign=top;fontStyle=2;fontSize=11;" vertex="1" parent="1"><mxGeometry x="{x0}" y="{y0}" width="{x1-x0}" height="{y1-y0}" as="geometry"/></mxCell>')
    for n in order:
        sh,lab=nodes[n]; x,y=pos[n]
        st=STYLE.get(sh,STYLE["rect"])
        cells.append(f'<mxCell id="{n}" value="{esc(lab)}" style="{st}fontSize=11;" vertex="1" parent="1"><mxGeometry x="{x}" y="{y}" width="240" height="90" as="geometry"/></mxCell>')
    for j,(a,b,lbl,dash) in enumerate(edges):
        d="dashed=1;" if dash else ""
        cells.append(f'<mxCell id="e{j}" value="{esc(lbl)}" style="edgeStyle=orthogonalEdgeStyle;rounded=1;html=1;{d}endArrow=block;fontSize=10;" edge="1" parent="1" source="{a}" target="{b}"><mxGeometry relative="1" as="geometry"/></mxCell>')
    return cells

# ---------- SEQUENCE ----------
def seq_cells(lines):
    parts=[]; pmap={}; msgs=[]; notes=[]
    for raw in lines:
        s=raw.strip()
        if not s or s.startswith("sequenceDiagram") or s.startswith("%%"): continue
        m=re.match(r'(?:participant|actor)\s+(\w+)(?:\s+as\s+(.+))?$', s)
        if m:
            pid=m.group(1); lab=(m.group(2) or pid).strip()
            if pid not in pmap: pmap[pid]=lab; parts.append(pid)
            continue
        m=re.match(r'(\w+)\s*(-->>|->>|-\)|--\)|->|-->)\s*(\w+)\s*:\s*(.+)$', s)
        if m:
            a,arr,b,txt=m.group(1),m.group(2),m.group(3),m.group(4)
            for p in (a,b):
                if p not in pmap: pmap[p]=p; parts.append(p)
            msgs.append((a,b,txt,arr.startswith("--") or arr.startswith("-->")))
            continue
        m=re.match(r'[Nn]ote\s+(?:over|right of|left of)\s+([\w, ]+)\s*:\s*(.+)$', s)
        if m: notes.append((m.group(1).split(",")[0].strip(), m.group(2)))
    cells=[]; X0=40; XG=220; TOP=40; LL=60; STEP=50
    px={p:X0+i*XG for i,p in enumerate(parts)}
    nmsg=len(msgs); H=LL+TOP+(nmsg+len(notes)+1)*STEP+40
    for p in parts:
        x=px[p]
        cells.append(f'<mxCell id="p_{p}" value="{esc(pmap[p])}" style="shape=umlActor;verticalLabelPosition=bottom;html=1;outlineConnect=0;fillColor=#dae8fc;strokeColor=#6c8ebf;" vertex="1" parent="1"><mxGeometry x="{x}" y="{TOP}" width="30" height="60" as="geometry"/></mxCell>')
        cells.append(f'<mxCell id="ll_{p}" value="" style="endArrow=none;dashed=1;html=1;strokeColor=#999999;" edge="1" parent="1"><mxGeometry relative="1" as="geometry"><mxPoint x="{x+15}" y="{TOP+LL}" as="sourcePoint"/><mxPoint x="{x+15}" y="{H}" as="targetPoint"/></mxGeometry></mxCell>')
    y=TOP+LL+STEP
    for k,(a,b,txt,dash) in enumerate(msgs):
        xa=px[a]+15; xb=px[b]+15; d="dashed=1;" if dash else ""
        style=f'html=1;{d}endArrow=block;fontSize=10;align=center;verticalAlign=bottom;'
        cells.append(f'<mxCell id="m{k}" value="{esc(txt)}" style="{style}" edge="1" parent="1"><mxGeometry relative="1" as="geometry"><mxPoint x="{xa}" y="{y}" as="sourcePoint"/><mxPoint x="{xb}" y="{y}" as="targetPoint"/></mxGeometry></mxCell>')
        y+=STEP
    for k,(p,txt) in enumerate(notes):
        x=px.get(p,X0);
        cells.append(f'<mxCell id="nt{k}" value="{esc(txt)}" style="shape=note;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=10;" vertex="1" parent="1"><mxGeometry x="{x+30}" y="{y}" width="160" height="40" as="geometry"/></mxCell>')
        y+=STEP
    return cells

# ---------- emit ----------
def page(name, cells, idx):
    body="\n        ".join(cells)
    return (f'  <diagram id="d{idx}" name="{esc(name)}">\n'
            f'    <mxGraphModel dx="1400" dy="900" grid="1" gridSize="10" guides="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="2339" pageHeight="1654" math="0" shadow="0">\n'
            f'      <root>\n        <mxCell id="0"/>\n        <mxCell id="1" parent="0"/>\n        {body}\n      </root>\n'
            f'    </mxGraphModel>\n  </diagram>')

def main():
    src=sys.argv[1]; out=sys.argv[2] if len(sys.argv)>2 else src.rsplit(".",1)[0]+".drawio"
    md=open(src,encoding="utf-8").read()
    bl=blocks(md)
    pages=[]
    for i,lines in enumerate(bl):
        t=dtype(lines)
        try:
            cells = seq_cells(lines) if t=="seq" else flow_cells(lines)
        except Exception as ex:
            cells=[f'<mxCell id="err" value="(lỗi convert block {i+1}: {esc(str(ex))})" style="text;html=1;" vertex="1" parent="1"><mxGeometry x="40" y="40" width="400" height="30" as="geometry"/></mxCell>']
        pages.append(page(f"Sơ đồ {i+1} ({t})", cells, i))
    xml='<mxfile host="app.diagrams.net" type="device">\n'+"\n".join(pages)+'\n</mxfile>\n'
    open(out,"w",encoding="utf-8").write(xml)
    print(f"[OK] {out} | {len(bl)} sơ đồ -> {len(pages)} page")

if __name__=="__main__": main()
