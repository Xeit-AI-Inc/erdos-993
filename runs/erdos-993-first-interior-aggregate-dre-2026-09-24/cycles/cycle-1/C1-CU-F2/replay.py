#!/usr/bin/env python3
"""Independent bounded audit of the C1-F2 scope witness and factorized family."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
CASE = json.loads((ROOT / "packets/C1-CU-F2.json").read_text())
hashes = {r["path"]: hashlib.sha256((ROOT / r["path"]).read_bytes()).hexdigest() == r["sha256"] for r in CASE["allowed_source_files"]}
assert all(hashes.values()), [p for p, ok in hashes.items() if not ok]
SOURCE = ROOT / "cycles/cycle-1/C1-F2"

def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a

def add(a, b):
    return trim([(a[k] if k < len(a) else 0) + (b[k] if k < len(b) else 0) for k in range(max(len(a), len(b)))])

def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for k, ak in enumerate(a):
        for j, bj in enumerate(b):
            out[k+j] += ak*bj
    return trim(out)

def power(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out

def d(a, k):
    c = lambda j: a[j] if 0 <= j < len(a) else 0
    return c(k+1) - c(k)

def brute_witness(edges):
    n = 10
    N = [set() for _ in range(n)]
    for a, b in edges:
        N[a].add(b)
        N[b].add(a)
    assert len(edges) == n-1
    seen = {0}
    stack = [0]
    while stack:
        u = stack.pop()
        for v in N[u] - seen:
            seen.add(v)
            stack.append(v)
    assert len(seen) == n
    def poly(remaining):
        vs = sorted(remaining)
        out = [0] * (len(vs)+1)
        for mask in range(1 << len(vs)):
            S = {v for i, v in enumerate(vs) if mask & (1 << i)}
            if all(not (N[v] & S) for v in S):
                out[len(S)] += 1
        return trim(out)
    V = set(range(n))
    P = poly(V)
    alpha = len(P)-1
    p = alpha-2
    x = next(k for k in range(len(P)) if d(P,k)<0)
    leaves = [v for v in range(n) if len(N[v]) == 1]
    terms = []
    for v in leaves:
        if d(poly(V-{v}),p)<0:
            s = next(iter(N[v]))
            H = poly(V-{v,s})
            R = poly(V-({s}|N[s]))
            terms.append({"leaf":v,"support":s,"selector_delta":d(poly(V-{v}),p),"H_delta":d(H,p-1),"R_delta":d(R,p-1),"g":d(H,p-1)-d(R,p-1)})
    maxsets=[]
    for mask in range(1<<n):
        S={v for v in range(n) if mask&(1<<v)}
        if len(S)==alpha and all(not (N[v]&S) for v in S):
            maxsets.append(sorted(S))
    return {"edges":edges,"poly":P,"alpha":alpha,"p":p,"x":x,"eligible":x+2<=p,"leaves":leaves,"terms":terms,"S":sum(t["g"] for t in terms),"maximum_sets":maxsets,"nonresidual_leaves":[v for v in leaves if any(v not in M for M in maxsets)]}

def family(m):
    # Root-excluded and root-included partition; Q is a three-leaf star.
    A=[1,1]
    Q=[1,4,3,1]
    Qminus=[1,3,1]
    qm=power(Q,m)
    full=add(mul([1,2],qm),mul([0,1],power(A,3*m+1)))
    p=len(full)-3
    x=next(k for k in range(len(full)) if d(full,k)<0)
    deleted_mark=add(mul(A,qm),mul([0,1],power(A,3*m)))
    deleted_branch=add(mul([1,2],mul(Qminus,power(Q,m-1))),mul([0,1],power(A,3*m)))
    Hm=add(qm,mul([0,1],power(A,3*m)))
    Rm=qm
    Hb=mul(power(A,2),add(mul([1,2],power(Q,m-1)),mul([0,1],power(A,3*m-2))))
    Rb=mul([1,2],power(Q,m-1))
    dm=d(deleted_mark,p)
    db=d(deleted_branch,p)
    gm=d(Hm,p-1)-d(Rm,p-1)
    gb=d(Hb,p-1)-d(Rb,p-1)
    return {"m":m,"order":4*m+3,"alpha":len(full)-1,"p":p,"x":x,"eligible":x+2<=p,"marked_selector_delta":dm,"branch_selector_delta":db,"marked_g":gm,"branch_g":gb,"favorable_count":int(dm<0)+3*m*int(db<0),"S":(gm if dm<0 else 0)+(3*m*gb if db<0 else 0)}

src=json.loads((SOURCE/"nonresidual-example.json").read_text())
w=brute_witness(src["edges"])
ver=json.loads((SOURCE/"nonresidual-verification.json").read_text())
assert w["poly"]==ver["poly"] and w["alpha"]==ver["alpha"] and w["p"]==ver["p"] and w["x"]==ver["x"]
assert w["leaves"]==ver["leaves"] and w["S"]==ver["S"] and w["maximum_sets"]==ver["maximum_independent_sets"]
assert [(t["leaf"],t["support"],t["selector_delta"],t["H_delta"],t["R_delta"],t["g"]) for t in w["terms"]]==[(t["leaf"],t["support"],t["Delta_p_T_minus_v"],t["Delta_p_minus_1_H"],t["Delta_p_minus_1_R"],t["g"]) for t in ver["terms"]]
report_edges=[[0,8],[1,2],[2,5],[3,7],[3,8],[4,8],[5,8],[6,8],[7,9]]
report_w=brute_witness(report_edges)
rows=[family(m) for m in range(1,61)]
factorized=json.loads((SOURCE/"factorized-family-sweep.json").read_text())
dp=json.loads((SOURCE/"family-sweep.json").read_text())
assert len(factorized)==60 and len(dp)>=60
for k,row in enumerate(rows):
    f=factorized[k]
    assert row["m"]==f["m"] and row["alpha"]==f["alpha"] and row["p"]==f["p"] and row["x"]==f["x"]
    assert row["eligible"]==f["eligible"] and row["marked_g"]==f["marked_g"] and row["branch_g"]==f["branch_leaf_g"]
    assert row["favorable_count"]==f["favorable_count"] and row["S"]==f["complete_sum"]
    assert row["p"]==dp[k]["rank"] and row["S"]==dp[k]["aggregate"]
assert all(r["S"]<0 for r in rows if r["eligible"])
out={"pinned_files_hash_ok":len(hashes),"certificate_witness":w,"report_edge_list_witness":report_w,"family_checked_m": [1,60],"family_eligible_count":sum(r["eligible"] for r in rows),"family_m2":rows[1],"family_m22":rows[21],"family_m60":rows[59],"random_search_counts_replayed":False}
(Path(__file__).with_name("replay-results.json")).write_text(json.dumps(out,indent=2)+"\n")
print(json.dumps({"pinned_files_hash_ok":len(hashes),"certificate_witness_S":w["S"],"certificate_nonresidual_leaves":w["nonresidual_leaves"],"report_edge_list_leaves":report_w["leaves"],"report_edge_list_S":report_w["S"],"eligible_family_rows":out["family_eligible_count"],"m60_S":rows[59]["S"]}))
