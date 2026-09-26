"""Independent integer audit of the T_m candidate; no producer imports.

The coefficients of B^m are obtained from B (B^m)' = m B' B^m,
not by multiplying the producer's B-polynomial arrays.  Tiny graph instances
are checked by literal independent-set enumeration.
"""

import hashlib
import json
from fractions import Fraction
from math import factorial
from pathlib import Path


def b_power_coeffs(m):
    """B=1+4z+3z^2+z^3; exact derivative recurrence."""
    out = [1] + [0] * (3 * m)
    for j in range(1, 3 * m + 1):
        numerator = (4 * (m - j + 1) * out[j - 1]
                     + (6 * m - 3 * j + 6) * (out[j - 2] if j >= 2 else 0)
                     + (3 * m - j + 3) * (out[j - 3] if j >= 3 else 0))
        q, r = divmod(numerator, j)
        assert r == 0, (m, j, r)
        out[j] = q
    assert min(out) > 0
    return out


def at(v, j):
    return v[j] if 0 <= j < len(v) else 0


def choose_row(n):
    row=[1]*(n+1)
    for k in range(1,n+1):
        q,r=divmod(row[k-1]*(n-k+1),k)
        assert r==0
        row[k]=q
    return row


def polys(m):
    bm, old = b_power_coeffs(m), b_power_coeffs(m - 1)
    binom=choose_row(3*m)
    binom_plus=[at(binom,k)+at(binom,k-1) for k in range(3*m+2)]
    n = 3 * m + 3
    p, a0, astar, rr = ([0] * n for _ in range(4))
    for j in range(n):
        p[j] = at(bm,j) + 2*at(bm,j-1) + at(binom_plus,j-1)
        a0[j] = at(bm,j) + at(bm,j-1) + at(binom,j-1)
        astar[j] = at(old,j) + 5*at(old,j-1) + 7*at(old,j-2) + 2*at(old,j-3) + at(binom,j-1)
        rr[j] = 3*m*(2*at(old,j)+5*at(old,j-1)+2*at(old,j-2)) + (3*m+1)*at(binom,j)
    return p, {'A0': a0, 'Astar': astar, 'R': rr}


def graph(m):
    # 0=r, 1=b, 2=a; each arm is center, three private leaves.
    edges = [(0,1),(1,2)]
    for i in range(m):
        c = 3+4*i
        edges += [(0,c)] + [(c,c+t) for t in (1,2,3)]
    return 4*m+3, edges


def literal_independence(n, edges, keep):
    verts = list(keep)
    out = [0]*(len(verts)+1)
    present = set(verts)
    es = [(u,v) for u,v in edges if u in present and v in present]
    for bits in range(1<<len(verts)):
        chosen = set(verts[i] for i in range(len(verts)) if (bits>>i)&1)
        if all(u not in chosen or v not in chosen for u,v in es):
            out[len(chosen)] += 1
    return out


def tiny_graph_check(m, p, aux):
    n, es = graph(m)
    full=set(range(n))
    full_counts=literal_independence(n,es,full)
    assert all(at(full_counts,j)==at(p,j) for j in range(max(len(full_counts),len(p))))
    leaves=[u for u in range(n) if sum(u in e for e in es)==1]
    assert len(leaves)==3*m+1
    qa=[]
    for v in leaves:
        sv=next(w if v==u else u for u,w in es if v in (u,w))
        H=full-{v,sv}
        closed={sv}|{w if u==sv else u for u,w in es if sv in (u,w)}
        R=full-closed
        D=literal_independence(n,es,full-{v})
        h=literal_independence(n,es,H)
        r=literal_independence(n,es,R)
        tag=[at(h,j)-at(r,j) for j in range(max(len(h),len(r)))]
        target=aux['A0'] if v==2 else aux['Astar']
        assert all(at(D,j)==at(target,j) for j in range(max(len(D),len(target))))
        qa.append(tag)
    qsum=[sum(at(q,j) for q in qa) for j in range(max(map(len,qa)))]
    assert all(at(qsum,j)==at(aux['R'],j-1) for j in range(len(qsum)))
    return {'m':m,'n':n,'leaves':len(leaves),'P':p[:n+1],
            'A0':aux['A0'][:n], 'Astar':aux['Astar'][:n],
            'Q':qsum}


def run():
    k = Fraction(factorial(8))*Fraction(125,124)**8*Fraction(150,49)**27
    cuts={name: Fraction(c)*2003*k/1000**8 for name,c in
          [('LC',24),('A0',47),('Astar',431),('R',Fraction(14688,21))]}
    assert all(v<1 for v in cuts.values())
    lc=hashlib.sha256(); lr=hashlib.sha256()
    lc_min=None; lr_min=None; checks=0
    tiny=[]; eligible=0; eligible_fail=[]; first=[]
    for m in range(1,1000):
        p,zs=polys(m)
        if m<=3:
            tiny.append(tiny_graph_check(m,p,zs))
        aa=3*m+2
        x=next(j for j in range(len(p)) if at(p,j+1)<at(p,j))
        if m<=3:first.append({'m':m,'alpha':aa,'x':x})
        for rank in range(x+2,aa+1):
            if 3*rank>=2*aa+1:continue
            eligible+=1
            d0=at(zs['A0'],rank+1)-at(zs['A0'],rank)
            ds=at(zs['Astar'],rank+1)-at(zs['Astar'],rank)
            sr=at(zs['R'],rank-1)-at(zs['R'],rank-2)
            if not(d0<0 and ds<0 and sr<0):
                eligible_fail.append({'m':m,'p':rank,'x':x,'d0':str(d0),'ds':str(ds),'s':str(sr)})
        if m<3:continue
        for name,z in zs.items():
            for j in range(m,2*m+3):
                a=z[j]*z[j]-z[j-1]*z[j+1]
                b=z[j]*p[j+1]-z[j+1]*p[j]
                if lc_min is None or a<lc_min[0]:lc_min=(a,m,name,j)
                if lr_min is None or b<lr_min[0]:lr_min=(b,m,name,j)
                assert a>0 and b>0, (m,name,j,a,b)
                lc.update(f'{m}:{name}:{j}:{a}\n'.encode())
                lr.update(f'{m}:{name}:{j}:{b}\n'.encode())
                checks+=1
    result={'method':'B^m coefficient recurrence from logarithmic derivative; literal graph enumeration m=1..3',
            'm_range':[3,999],'central_checks_each':checks,'lc_sha256':lc.hexdigest(),
            'mixed_sha256':lr.hexdigest(),'lc_min':[str(lc_min[0]),*lc_min[1:]],
            'mixed_min':[str(lr_min[0]),*lr_min[1:]],
            'cutoff_ratios':{name:[str(v.numerator),str(v.denominator)] for name,v in cuts.items()},
            'tiny_graph_checks':tiny,'early_first_descents':first,
            'eligible_rows_m1_to_999':eligible,'eligible_failures':eligible_fail[:10],
            'eligible_failure_count':len(eligible_fail)}
    out=Path(__file__).with_name('RESULTS.json')
    out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({x:result[x] for x in result if x!='tiny_graph_checks'},indent=2))


if __name__=='__main__':run()
