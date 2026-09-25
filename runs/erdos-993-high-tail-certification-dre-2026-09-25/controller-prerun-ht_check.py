#!/usr/bin/env python3
"""r29 controller pre-run instrument (a PRIOR, never evidence): exhaustive checks of the four r29 targets on
small graphs, from the definitions of SEMANTIC-CONTRACT.md §1 (independent sets by subset enumeration).

  T1  tagged-shadow bound      k*q_{k+1} <= 2(a-k)*q_k, a = alpha(H), 1 <= k <= a, every bipartite H on <= NMAX
                               vertices (all labelled graphs, bipartite ones kept), every W subset of V(H).
  T2  pointwise high-tail      Delta_{p-1}(H_v) - Delta_{p-1}(R_v) <= 0 for every degree-1 vertex v of a bipartite G,
                               every p >= 1 with 3p >= 2alpha(G)+1 (incl. p = 1); and the aggregate corollary.
      boundary                 the smallest bipartite G / tree with a FAILURE of the pointwise sign at 3p = 2alpha
                               (just below the guard), if any — the guard's precision.
  T3  eligibility guard        trees: x+2 <= alpha-2  =>  alpha >= 7.
  T4  top-rank corollary       trees: x+2 <= alpha-1  =>  sum_{v in F_{alpha-1}} [ ... ] <= 0; non-vacuity witnesses.
Trees are enumerated up to isomorphism (AHU canonical form) to order TMAX. Standard library only; exact integers.
Controller: Claude Fable 5.1, 2026-09-25.
"""
import itertools, json, sys, hashlib
from functools import lru_cache

NMAX = int(sys.argv[1]) if len(sys.argv) > 1 else 6
TMAX = int(sys.argv[2]) if len(sys.argv) > 2 else 12

def indep_sets(n, adj):
    """all independent subsets as bitmasks; adj[v] bitmask of neighbours"""
    out = []
    for S in range(1 << n):
        ok = True
        s = S
        while s:
            v = (s & -s).bit_length() - 1
            if adj[v] & S:
                ok = False; break
            s &= s - 1
        if ok: out.append(S)
    return out

def popcount(x): return bin(x).count("1")

def is_bipartite(n, adj):
    color = [-1] * n
    for s in range(n):
        if color[s] >= 0: continue
        color[s] = 0; stack = [s]
        while stack:
            u = stack.pop()
            m = adj[u]
            while m:
                w = (m & -m).bit_length() - 1; m &= m - 1
                if color[w] < 0: color[w] = 1 - color[u]; stack.append(w)
                elif color[w] == color[u]: return False
    return True

def counts(n, adj, avoid=0):
    """i_j(G - avoid) for j = 0..n"""
    c = [0] * (n + 2)
    for S in indep_sets(n, adj):
        if S & avoid == 0: c[popcount(S)] += 1
    return c

def delta(c, j): return (c[j + 1] if j + 1 < len(c) else 0) - (c[j] if j < len(c) else 0)

def alpha_of(c): return max(j for j in range(len(c)) if c[j] > 0)

def check_graph_targets12(n, adj, rep):
    I = indep_sets(n, adj)
    full = counts(n, adj)
    a = alpha_of(full)
    # T1 tagged bound over all W
    for W in range(1 << n):
        q = [0] * (n + 2)
        for S in I:
            if S & W: q[popcount(S)] += 1
        for k in range(1, a + 1):
            if k * q[k + 1] > 2 * (a - k) * q[k]:
                rep["t1_failures"].append({"n": n, "adj": adj, "W": W, "k": k, "q": q[:a + 2]})
    # T2 pointwise: leaves v (degree exactly 1)
    for v in range(n):
        if popcount(adj[v]) != 1: continue
        s = adj[v].bit_length() - 1
        Hdel = (1 << v) | (1 << s)
        Rdel = (1 << s) | adj[s]
        cH = counts(n, adj, Hdel); cR = counts(n, adj, Rdel)
        for p in range(1, n + 2):
            term = delta(cH, p - 1) - delta(cR, p - 1)
            if 3 * p >= 2 * a + 1:
                if term > 0:
                    rep["t2_failures"].append({"n": n, "adj": adj, "v": v, "p": p, "alpha": a, "term": term})
            elif 3 * p == 2 * a and term > 0:
                rep["boundary_witnesses_3p_eq_2a"].append({"n": n, "adj": adj, "v": v, "p": p, "alpha": a, "term": term})
            elif 3 * p == 2 * a - 1 and term > 0 and len(rep["boundary_witnesses_3p_eq_2a_minus_1"]) < 5:
                rep["boundary_witnesses_3p_eq_2a_minus_1"].append({"n": n, "adj": adj, "v": v, "p": p, "alpha": a, "term": term})
    # aggregate corollary under the guard, p >= 1
    for p in range(1, n + 2):
        if 3 * p >= 2 * a + 1:
            S = 0
            for v in range(n):
                if popcount(adj[v]) != 1: continue
                cv = counts(n, adj, 1 << v)
                if delta(cv, p) < 0:
                    s = adj[v].bit_length() - 1
                    cH = counts(n, adj, (1 << v) | (1 << s)); cR = counts(n, adj, (1 << s) | adj[s])
                    S += delta(cH, p - 1) - delta(cR, p - 1)
            if S > 0: rep["t2_aggregate_failures"].append({"n": n, "adj": adj, "p": p, "S": S})

def all_graphs(n):
    edges = list(itertools.combinations(range(n), 2))
    for mask in range(1 << len(edges)):
        adj = [0] * n
        for i, (u, w) in enumerate(edges):
            if mask >> i & 1: adj[u] |= 1 << w; adj[w] |= 1 << u
        yield adj

# ---- free trees up to isomorphism (rooted level sequences -> AHU canonical form of the free tree)
def rooted_trees(n):
    """Beyer–Hedetniemi: all rooted trees on n vertices as level sequences (parent arrays)."""
    if n == 1: yield [0]; return
    L = list(range(n))  # level sequence 0..n-1 (a path)
    yield L[:]
    while True:
        p = max((i for i in range(n) if L[i] > 1), default=-1)
        if p < 0: return
        q = max(i for i in range(p) if L[i] == L[p] - 1)
        L = L[:p] + [L[i - (p - q)] for i in range(p, n)]
        yield L[:]

def level_to_adj(L):
    n = len(L); adj = [0] * n; stack = []
    for i, lv in enumerate(L):
        while len(stack) > lv: stack.pop()
        if stack:
            par = stack[-1]; adj[i] |= 1 << par; adj[par] |= 1 << i
        stack.append(i)
    return adj

def canon(n, adj):
    def enc(v, par):
        ch = []
        m = adj[v]
        while m:
            w = (m & -m).bit_length() - 1; m &= m - 1
            if w != par: ch.append(enc(w, v))
        return "(" + "".join(sorted(ch)) + ")"
    # centers
    deg = [popcount(adj[v]) for v in range(n)]; leaves = [v for v in range(n) if deg[v] <= 1]; rem = n; d = deg[:]
    alive = [True] * n
    while rem > 2:
        nxt = []
        for v in leaves:
            alive[v] = False; rem -= 1
            m = adj[v]
            while m:
                w = (m & -m).bit_length() - 1; m &= m - 1
                if alive[w]:
                    d[w] -= 1
                    if d[w] == 1: nxt.append(w)
        leaves = nxt
    centers = [v for v in range(n) if alive[v]]
    return min(enc(c, -1) for c in centers)

def free_trees(n):
    seen = set()
    for L in rooted_trees(n):
        adj = level_to_adj(L); c = canon(n, adj)
        if c not in seen:
            seen.add(c); yield adj

def crossing(c):
    j = 0
    while delta(c, j) >= 0: j += 1
    return j

def main():
    rep = {"schema": "verityos.r29.controller-prerun.v1", "nmax_graphs": NMAX, "tmax_trees": TMAX,
           "t1_failures": [], "t2_failures": [], "t2_aggregate_failures": [], "boundary_witnesses_3p_eq_2a": [],
           "boundary_witnesses_3p_eq_2a_minus_1": [], "graphs_checked": {}, "trees": {}, "t3_failures": [], "t4_failures": [],
           "t4_eligible_examples": [], "t3_eligible_count": 0}
    for n in range(1, NMAX + 1):
        cnt = 0
        for adj in all_graphs(n):
            if not is_bipartite(n, adj): continue
            cnt += 1
            check_graph_targets12(n, adj, rep)
        rep["graphs_checked"][n] = cnt
        print(f"graphs n={n}: {cnt} bipartite labelled graphs checked; T1 fail {len(rep['t1_failures'])}, T2 fail {len(rep['t2_failures'])}, boundary(3p=2a) {len(rep['boundary_witnesses_3p_eq_2a'])}", flush=True)
    # trees: T2 on trees to TMAX too (pointwise + aggregate), T3, T4
    A000055 = {1:1,2:1,3:1,4:2,5:3,6:6,7:11,8:23,9:47,10:106,11:235,12:551,13:1301,14:3159,15:7741,16:19320}
    for n in range(1, TMAX + 1):
        cnt = 0; elig3 = 0; elig4 = 0
        for adj in free_trees(n):
            cnt += 1
            full = counts(n, adj); a = alpha_of(full); x = crossing(full)
            if n <= 10: check_graph_targets12(n, adj, rep)
            else:
                # pointwise high tail on trees (guard) only
                for v in range(n):
                    if popcount(adj[v]) != 1: continue
                    s = adj[v].bit_length() - 1
                    cH = counts(n, adj, (1 << v) | (1 << s)); cR = counts(n, adj, (1 << s) | adj[s])
                    for p in range(1, n + 2):
                        term = delta(cH, p - 1) - delta(cR, p - 1)
                        if 3 * p >= 2 * a + 1 and term > 0:
                            rep["t2_failures"].append({"n": n, "adj": adj, "v": v, "p": p, "alpha": a, "term": term, "tree": True})
                        if 3 * p == 2 * a and term > 0 and len(rep["boundary_witnesses_3p_eq_2a"]) < 40:
                            rep["boundary_witnesses_3p_eq_2a"].append({"n": n, "adj": adj, "v": v, "p": p, "alpha": a, "term": term, "tree": True})
            if x + 2 <= a - 2:
                elig3 += 1
                if a < 7: rep["t3_failures"].append({"n": n, "adj": adj, "alpha": a, "x": x})
            if x + 2 <= a - 1:
                elig4 += 1
                p = a - 1; S = 0; terms = []
                for v in range(n):
                    if popcount(adj[v]) != 1: continue
                    cv = counts(n, adj, 1 << v)
                    if delta(cv, p) < 0:
                        s = adj[v].bit_length() - 1
                        cH = counts(n, adj, (1 << v) | (1 << s)); cR = counts(n, adj, (1 << s) | adj[s])
                        t = delta(cH, p - 1) - delta(cR, p - 1); S += t; terms.append(t)
                if S > 0: rep["t4_failures"].append({"n": n, "adj": adj, "alpha": a, "x": x, "S": S})
                if len(rep["t4_eligible_examples"]) < 6: rep["t4_eligible_examples"].append({"n": n, "adj": adj, "alpha": a, "x": x, "S": S, "favorable_terms": terms})
        rep["trees"][n] = {"classes": cnt, "A000055": A000055.get(n), "eligible_p_alpha_minus_2": elig3, "eligible_p_alpha_minus_1": elig4}
        rep["t3_eligible_count"] += elig3
        print(f"trees n={n}: {cnt} classes (A000055 {A000055.get(n)}); elig(a-2) {elig3}, elig(a-1) {elig4}; T2 fail {len(rep['t2_failures'])}, T3 fail {len(rep['t3_failures'])}, T4 fail {len(rep['t4_failures'])}", flush=True)
    body = json.dumps(rep, sort_keys=True, indent=1)
    rep["report_sha256_without_this_field"] = hashlib.sha256(body.encode()).hexdigest()
    out = sys.argv[3] if len(sys.argv) > 3 else "ht_report.json"
    open(out, "w").write(json.dumps(rep, sort_keys=True, indent=1) + "\n")
    print("SUMMARY", json.dumps({k: (len(v) if isinstance(v, list) else v) for k, v in rep.items() if k not in ("graphs_checked", "trees", "t4_eligible_examples")}))

if __name__ == "__main__":
    main()
