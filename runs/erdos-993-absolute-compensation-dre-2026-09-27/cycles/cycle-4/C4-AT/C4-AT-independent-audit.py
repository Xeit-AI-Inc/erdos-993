import hashlib
import json
import math
from fractions import Fraction
from functools import reduce
from pathlib import Path

B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')

def conv(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, u in enumerate(a):
        for j, v in enumerate(b):
            c[i+j] += u*v
    return c

def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, v in enumerate(a): c[i] += v
    for i, v in enumerate(b): c[i] += v
    return c

def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0

def binpoly(n):
    return [math.comb(n, k) for k in range(n+1)]

def profile(counts):
    rs = sum(([r]*counts[r-2] for r in (2,3,4)), [])
    N = sum(rs)
    B = {r:add(binpoly(r), [0,1]) for r in (2,3,4)}
    Q = [1]
    for r in rs: Q = conv(Q, B[r])
    C = conv([1,2], Q)
    E = [0]+binpoly(N)
    P = add(C, [0]+binpoly(N+1))
    A0 = add(conv([1,1], Q), E)
    Ai = {}
    for r in set(rs):
        H=[1]
        removed=False
        for s in rs:
            if s == r and not removed: removed=True; continue
            H=conv(H,B[s])
        Ai[r]=add(conv(conv([1,2],B[r-1] if r>2 else add(binpoly(1),[0,1])),H),E)
    W=[0]
    for r in rs: W=add(W,[r*v for v in Ai[r]])
    x=next(k for k in range(len(P)) if coeff(P,k+1)<coeff(P,k))
    eligible=[p for p in range(len(P)+1) if x+2<=p and 3*p<2*(N+2)+1 and 2*p<=N+2]
    return dict(rs=rs,N=N,C=C,E=E,P=P,A0=A0,Ai=Ai,W=W,x=x,eligible=eligible)

def margin(A,C,k):
    return coeff(A,k)*coeff(C,k)-coeff(A,k+1)*coeff(C,k-1)

def tree_poly(rs, deleted=None):
    edges=[(0,1),(1,2)]
    v=3
    tip0=None
    for r in rs:
        center=v;v+=1;edges.append((0,center))
        for _ in range(r):
            tip=v;v+=1;edges.append((center,tip))
            if tip0 is None:tip0=tip
    adj=[[] for _ in range(v)]
    for a,b in edges:adj[a].append(b);adj[b].append(a)
    def visit(u,parent):
        out=[1];inside=[0,1]
        for w in adj[u]:
            if w==parent or w==deleted:continue
            o,i=visit(w,u)
            out=conv(out,add(o,i));inside=conv(inside,o)
        return out,inside
    o,i=visit(0,-1)
    return add(o,i),tip0

def row(counts,k):
    d=profile(counts); C=d['C']; N=d['N']
    M={str(r):margin(A,C,k) for r,A in d['Ai'].items()}
    sels={str(p):{'endpoint':coeff(d['A0'],p+1)<coeff(d['A0'],p),
                   'tip_types':{str(r):coeff(A,p+1)<coeff(A,p) for r,A in d['Ai'].items()},
                   'guards':[d['x']+2<=p,3*p<2*(N+2)+1,2*p<=N+2]}
          for p in d['eligible']}
    return {'counts':counts,'N':N,'alpha':N+2,'x':d['x'],'eligible':d['eligible'],'k':k,
            'guarded':1<=k and 2*k<=N+2,'endpoint_margin':margin(d['A0'],C,k),
            'tip_margins':M,'weighted_margin':margin(d['W'],C,k),
            'E_margin':margin(d['E'],C,k),'selectors':sels}

def main():
    common=json.loads((B/'manifests/C4-COMMON-DISPATCH.json').read_text())['members']
    packet=json.loads((B/'packets/C4-AT.json').read_text())['allowed_source_files']
    for entry in common+packet:
        assert hashlib.sha256((B/entry['path']).read_bytes()).hexdigest()==entry['sha256'],entry['path']
    data={'sha256_verified':{'common':len(common),'packet':len(packet)}}
    data['GF_monomial_z']={str(r):conv([1,2],reduce(add,(binpoly(h) for h in range(r-1)),[0])) for r in (2,3,4)}
    assert data['GF_monomial_z']=={'2':[1,2],'3':[2,5,2],'4':[3,9,7,2]}
    data['rows']=[row((0,22,0),k) for k in (1,17,27,34)] + [row((38,0,1),k) for k in (41,77)] + [row((0,0,24),k) for k in (1,24,49)] + [row((0,12,10),k) for k in (19,39)]
    d=profile((38,0,1)); literal,tip=tree_poly(d['rs']); deletion,_=tree_poly(d['rs'],tip)
    data['literal_check']={'vertex_count':len(d['rs'])+sum(d['rs'])+3,'parent_equal':literal==d['P'],'tip_deletion_equal':deletion==d['Ai'][2]}
    assert data['literal_check']['parent_equal'] and data['literal_check']['tip_deletion_equal']
    d=profile((0,0,24)); wrong_A=add(conv([1,2],reduce(conv,(add(binpoly(4),[0,1]) for _ in range(23)),binpoly(3))),d['E'])
    wrong_W=[96*v for v in wrong_A]
    data['omitted_center_term_diagnostic']={'formula':'G L^3 B_4^23 + z L^96, multiplied by 96',
                                            'wrong_margins':{str(k):margin(wrong_W,d['C'],k) for k in (1,24,49)},
                                            'correct_margins':{str(k):margin(d['W'],d['C'],k) for k in (1,24,49)}}
    p=49
    data['actual_deck_24r4']={'x':d['x'],'p':p,'Delta_x_P':coeff(d['P'],d['x']+1)-coeff(d['P'],d['x']),
                              'left':coeff(d['W'],p+1)*coeff(d['C'],p-1),
                              'right':coeff(d['W'],p)*coeff(d['C'],p),
                              'Delta_p_W':coeff(d['W'],p+1)-coeff(d['W'],p),
                              'C_ratio_p':str(Fraction(coeff(d['C'],p),coeff(d['C'],p-1))),
                              'C_ratio_x_plus_1':str(Fraction(coeff(d['C'],d['x']+1),coeff(d['C'],d['x'])))}
    sizes=(2,3); M=sum(sizes); F=[add(binpoly(s),[0,1]) for s in sizes]; H=conv(F[0],F[1]); block=[]
    for k in (0,2,M):
        expectation=sum((Fraction(math.comb(2,t)*math.comb(3,k-t),math.comb(M,k))*Fraction(coeff(F[0],t),math.comb(2,t))*Fraction(coeff(F[1],k-t),math.comb(3,k-t)) for t in range(3) if 0<=k-t<=3),Fraction(0))
        y=sum((Fraction(math.comb(s,1)*math.comb(M-s,k-1),math.comb(M,k))*Fraction(2,2*s+1) for s in sizes if 0<=k-1<=M-s),Fraction(0))
        block.append({'k':k,'coefficient':H[k],'normalized':str(Fraction(H[k],math.comb(M,k))),'expectation':str(expectation),'y':str(y),'Taylor2':str(1+y+y*y/2)})
        assert Fraction(H[k],math.comb(M,k))==expectation
        assert expectation>=1+y+y*y/2
    data['block_check']=block
    print(json.dumps(data,sort_keys=True,indent=2))

if __name__=='__main__':main()
