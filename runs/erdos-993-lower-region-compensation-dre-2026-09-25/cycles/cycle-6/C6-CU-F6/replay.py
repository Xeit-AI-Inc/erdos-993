#!/Library/Frameworks/Python.framework/Versions/3.11/bin/python3
"""Exact bounded replay for the equal-length-three rooted spider selector lead.

Boundary: 2 <= m <= 40 branches; all eligible integer p are checked.
Graph: vertices r=0 and a_i,b_i,c_i=3i+1,3i+2,3i+3;
       edges r-a_i, a_i-b_i, b_i-c_i.
All polynomial arithmetic uses Python integers and tree/forest DP.
"""
import json
from pathlib import Path


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    while len(out) > 1 and out[-1] == 0: out.pop()
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i+j] += x*y
    while len(out) > 1 and out[-1] == 0: out.pop()
    return out


def coeff(poly, k): return poly[k] if 0 <= k < len(poly) else 0

def delta(poly, k): return coeff(poly, k+1) - coeff(poly, k)


def forest_poly(vertices, edges):
    adj = {v: set() for v in vertices}
    for u, v in edges:
        if u in adj and v in adj:
            adj[u].add(v); adj[v].add(u)
    seen = set()
    def visit(v, parent):
        if v in seen: raise AssertionError('not a forest')
        seen.add(v)
        exc, inc = [1], [0, 1]
        for w in sorted(adj[v]):
            if w == parent: continue
            ce, ci = visit(w, v)
            exc = mul(exc, add(ce, ci))
            inc = mul(inc, ce)
        return exc, inc
    out = [1]
    for v in sorted(vertices):
        if v not in seen:
            e, i = visit(v, None)
            out = mul(out, add(e, i))
    return out


def spider(m):
    vertices = set(range(3*m+1))
    edges = []
    leaves = []
    for i in range(m):
        a,b,c = 3*i+1,3*i+2,3*i+3
        edges.extend(((0,a),(a,b),(b,c)))
        leaves.append(c)
    return vertices, edges, leaves


def main():
    rows = []
    eligible_rows = 0
    for m in range(2, 41):
        V,E,L = spider(m)
        P = forest_poly(V,E)
        alpha = len(P)-1
        x = next(j for j in range(len(P)+1) if delta(P,j)<0)
        assert alpha == 2*m and x == m
        # Strict 3p < 2alpha+1, and x+2 <= p.
        ps = [p for p in range(x+2, alpha+2) if 3*p < 2*alpha+1]
        # Independent coefficient formulas from the rooted branch decomposition.
        Q, Vfac = [1,3,1], [1,2]
        Qpow, Vpow = [1], [1]
        for _ in range(m): Qpow = mul(Qpow, Q); Vpow = mul(Vpow, Vfac)
        P_formula = Qpow + [0]
        P_formula += [0] * (len(Vpow)+1-len(P_formula))
        for j, value in enumerate(Vpow): P_formula[j+1] += value
        while len(P_formula)>1 and P_formula[-1]==0: P_formula.pop()
        assert P == P_formula
        leaf_data = {}
        for c in L:
            e = next(iter(v for v in V if (v,c) in E or (c,v) in E))
            del_poly = forest_poly(V-{c}, [(u,v) for u,v in E if u != c and v != c])
            b = e
            # c's support is b_i; its neighbor besides c is a_i.
            a = next(w for w in V if w != c and w != b and ((w,b) in E or (b,w) in E))
            h_removed={c,b}
            h_poly=forest_poly(V-h_removed, [(u,v) for u,v in E if u not in h_removed and v not in h_removed])
            closed={b} | {w for u,v in E for w in (() if b not in (u,v) else (v if u==b else u,))}
            r_poly=forest_poly(V-closed, [(u,v) for u,v in E if u not in closed and v not in closed])
            # A=V Q^(m-1)+z(1+z)V^(m-1); H-R=z Q^(m-1).
            Qprev, Vprev = [1], [1]
            for _ in range(m-1): Qprev=mul(Qprev,[1,3,1]); Vprev=mul(Vprev,[1,2])
            A_formula=mul([1,2],Qprev)
            low=mul([0,1,1],Vprev)
            A_formula=add(A_formula,low)
            assert del_poly == A_formula
            q_formula=[0]+Qprev
            diff=[coeff(h_poly,j)-coeff(r_poly,j) for j in range(max(len(h_poly),len(r_poly)))]
            while len(diff)>1 and diff[-1]==0: diff.pop()
            assert diff == q_formula
            leaf_data[c]=(del_poly,h_poly,r_poly,a,b)
        p_rows=[]
        for p in ps:
            favorable=[c for c in L if delta(leaf_data[c][0],p)<0]
            summands=[]
            for c in favorable:
                _,hp,rp,_,b=leaf_data[c]
                # rank p-1 Delta = i_p-i_(p-1) on H and R; direct formula
                g=(coeff(hp,p)-coeff(hp,p-1))-(coeff(rp,p)-coeff(rp,p-1))
                summands.append({'leaf':c,'support':b,'term':g})
            S=sum(t['term'] for t in summands)
            p_rows.append({'p':p,'eligible':True,'leaf_deletion_deltas':[delta(leaf_data[c][0],p) for c in L],
                           'favorable_leaves':favorable,'summands':summands,'S':S})
            eligible_rows+=1
        rows.append({'m':m,'order':len(V),'alpha':alpha,'P_coefficients':P,
                     'x':x,'strict_alpha_guard_upper_p':(2*alpha)//3,
                     'eligible_p_rows':p_rows})
    out={'family':'root joined to m disjoint paths of three vertices r-a_i-b_i-c_i',
         'boundary':{'m_min':2,'m_max':40,'profiles':39,'eligible_profile_rank_rows':eligible_rows},
         'method':'independent forest-set polynomial DP, integer coefficients; selector and every tag/summand evaluated on original graph',
         'rows':rows}
    path=Path(__file__).with_name('evidence.json')
    path.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({'profiles':len(rows),'eligible_profile_rank_rows':eligible_rows,
                      'first_m_with_eligible_p':next((r['m'] for r in rows if r['eligible_p_rows']),None),
                      'all_x_eq_m':all(r['x']==r['m'] for r in rows),
                      'all_eligible_rows_all_leaves_selected':all(len(x['favorable_leaves'])==r['m'] for r in rows for x in r['eligible_p_rows']),
                      'all_eligible_sums_negative':all(x['S']<0 for r in rows for x in r['eligible_p_rows']),
                      'evidence':'evidence.json'},indent=2))

if __name__=='__main__': main()
