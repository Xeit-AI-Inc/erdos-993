from itertools import product
from math import comb
import json
from pathlib import Path


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    return out


def scale(a, c): return [c*x for x in a]


def independent_poly(vertices, edges):
    index = {v:i for i,v in enumerate(vertices)}
    e = [(index[u], index[v]) for u,v in edges if u in index and v in index]
    c = [0] * (len(vertices)+1)
    for mask in range(1 << len(vertices)):
        if all(not ((mask >> u) & 1 and (mask >> v) & 1) for u,v in e):
            c[mask.bit_count()] += 1
    while len(c) > 1 and c[-1] == 0: c.pop()
    return c


def B(r):
    c = [comb(r,j) for j in range(r+1)]
    c[1] += 1
    return c


def L(n): return [comb(n,j) for j in range(n+1)]


def check_profile(rs):
    m, N = len(rs), sum(rs)
    verts = ["0", "1", "2"]
    edges = [("0","1"), ("1","2")]
    centers, tips = [], []
    for i, r in enumerate(rs):
        c = f"c{i}"; centers.append(c); verts.append(c); edges.append(("0",c))
        bt=[]
        for j in range(r):
            t=f"t{i}_{j}"; tips.append(t); bt.append(t); verts.append(t); edges.append((c,t))
    P=independent_poly(verts,edges)
    Q=[1]
    for r in rs: Q=mul(Q,B(r))
    p_formula=add(mul([1,2],Q),mul([0,1],L(N+1)))
    assert P == p_formula, (P,p_formula)
    # Verify every original-leaf deletion polynomial and the aggregate tagged q identity.
    A2=independent_poly([v for v in verts if v!="2"],[e for e in edges if "2" not in e])
    A2f=add(mul([1,1],Q),mul([0,1],L(N)))
    assert A2 == A2f, (A2,A2f)
    tip_qs=[]
    for i,r in enumerate(rs):
        for t in [v for v in tips if v.startswith(f"t{i}_")]:
            A=independent_poly([v for v in verts if v!=t],[e for e in edges if t not in e])
            H=[v for v in verts if v not in (t,centers[i])]
            Hedges=[e for e in edges if t not in e and centers[i] not in e]
            R=[v for v in verts if v not in ("0",centers[i],*[v for v in tips if v.startswith(f"t{i}_")])]
            Redges=[e for e in edges if all(v in R for v in e)]
            q=add(independent_poly(H,Hedges),scale(independent_poly(R,Redges),-1))
            core=mul([1,2],mul([comb(r-1,j+1) for j in range(r-1)], Q_without(rs,i)))
            q_expected=add(mul([0,1],core),mul([0,1],L(N)))
            assert q == q_expected, (q,q_expected)
            tip_qs.append(q)
    H2=[v for v in verts if v not in ("1","2")]
    H2e=[e for e in edges if "1" not in e and "2" not in e]
    R2=[v for v in verts if v not in ("0","1","2")]
    R2e=[e for e in edges if all(v in R2 for v in e)]
    q2=add(independent_poly(H2,H2e),scale(independent_poly(R2,R2e),-1))
    # Endpoint tag in the aggregate identity is z L^N, as claimed.
    assert q2 == mul([0,1],L(N))
    total=[0]
    for q in tip_qs: total=add(total,q)
    total=add(total,q2)
    # Exact aggregate identity without fractional coefficient: N*sum(q tags) = z*[N*core sum +(N+1)L^N].
    core_sum=[0]
    for i,r in enumerate(rs):
        core=mul([1,2],mul([comb(r-1,j+1) for j in range(r-1)],Q_without(rs,i)))
        core_sum=add(core_sum,scale(core,r))
    rhs=add(scale(mul([0,1],core_sum),N),scale(mul([0,1],L(N)),N*(N+1)))
    assert scale(total,N)==rhs, (scale(total,N),rhs)
    return {"profile":rs,"vertices":len(verts),"tree_edges":len(edges),"tree_verified_by_recipe":len(edges)==len(verts)-1,
            "independence_polynomial":P,"endpoint_deletion_matches":True,"tip_deletion_and_tagged_q_matches":len(tip_qs),
            "aggregate_endpoint_spreading_identity":True}


def Q_without(rs, i):
    q=[1]
    for j,r in enumerate(rs):
        if j!=i: q=mul(q,B(r))
    return q


if __name__ == "__main__":
    rows=[check_profile([2,3]),check_profile([4,2,2])]
    result={"scope":"two direct small-tree formula checks only","checks":rows}
    text=json.dumps(result,indent=2)+"\n"
    (Path(__file__).with_name("DIRECT-GRAPH-CHECKS.json")).write_text(text)
    print(text)
