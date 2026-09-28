#!/usr/bin/env python3
"""Independent exact checks of the C4-T2 weighted-deck shifted comparison.

This is a finite diagnostic, not a proof. All arithmetic is integer arithmetic.
"""
from collections import deque
import json


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def scale(a, c):
    return [c * x for x in a]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def power(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


L = [1, 1]
G = [1, 2]
Z = [0, 1]


def factors(counts):
    rs = [2] * counts[0] + [3] * counts[1] + [4] * counts[2]
    N = sum(rs)
    Bs = {r: add(power(L, r), Z) for r in (2, 3, 4)}
    Q = [1]
    for r in rs:
        Q = mul(Q, Bs[r])
    C = mul(G, Q)
    W = [0]
    for r in rs:
        # Exclude one occurrence of this branch; equal-arity branches stay distinct.
        H = [1]
        skipped = False
        for s in rs:
            if s == r and not skipped:
                skipped = True
            else:
                H = mul(H, Bs[s])
        # Ai = G B_(r-1) H_i + z L^N; W weights each original tip r times.
        Bprev = add(power(L, r - 1), Z)
        Ai = add(mul(mul(G, Bprev), H), mul(Z, power(L, N)))
        W = add(W, scale(Ai, r))
    return rs, N, C, W


def graph_for(rs):
    adj = [set() for _ in range(3 + len(rs) + sum(rs))]
    def edge(u, v):
        adj[u].add(v)
        adj[v].add(u)
    edge(0, 1)
    edge(1, 2)
    tips_by_branch = []
    next_vertex = 3
    for r in rs:
        center = next_vertex
        next_vertex += 1
        edge(0, center)
        tips = []
        for _ in range(r):
            tip = next_vertex
            next_vertex += 1
            edge(center, tip)
            tips.append(tip)
        tips_by_branch.append(tips)
    return adj, tips_by_branch


def forest_poly(adj, removed=None):
    gone = set() if removed is None else {removed}
    seen = set(gone)
    total = [1]
    for start in range(len(adj)):
        if start in seen:
            continue
        component = []
        stack = [start]
        seen.add(start)
        while stack:
            v = stack.pop()
            component.append(v)
            for u in adj[v]:
                if u not in seen and u not in gone:
                    seen.add(u)
                    stack.append(u)
        root = component[0]
        parent = {root: -1}
        order = [root]
        for v in order:
            for u in adj[v]:
                if u != parent[v] and u not in gone:
                    parent[u] = v
                    order.append(u)
        state = {}
        for v in reversed(order):
            children = [u for u in adj[v] if parent.get(u) == v]
            absent = [1]
            present = [0, 1]
            for u in children:
                f, g = state[u]
                absent = mul(absent, add(f, g))
                present = mul(present, f)
            state[v] = (absent, present)
        total = mul(total, add(*state[root]))
    return total


def literal_tree_check(rs, C, W):
    adj, tips = graph_for(rs)
    q = sum(rs) + 1
    # Parent formula is C + z L^(N+1).
    P_formula = add(C, mul(Z, power(L, q)))
    P_graph = forest_poly(adj)
    if P_formula != P_graph:
        raise AssertionError("literal parent tree polynomial disagrees with path-star formula")
    W_graph = [0]
    for branch_tips in tips:
        for tip in branch_tips:
            W_graph = add(W_graph, forest_poly(adj, tip))
    if W != W_graph:
        raise AssertionError("weighted tip-deletion formula disagrees with literal tree deletions")
    return len(adj), len(tips), len(W_graph)


PROFILES = [
    (1, 0, 0),       # smallest arity-2 profile
    (0, 1, 0),       # smallest arity-3 profile
    (0, 0, 1),       # smallest arity-4 profile
    (1, 1, 1),       # mixed small profile
    (0, 12, 10),     # negative cofactor-slope control
    (38, 0, 1),      # known unguarded shifted-ratio obstruction profile
    (1, 1, 30),      # rare arity-2/3 branches with many arity-4 branches
    (120, 80, 60),   # large mixed diagnostic profile
]


def main():
    results = []
    for counts in PROFILES:
        rs, N, C, W = factors(counts)
        kmax = (N + 2) // 2
        margins = [coeff(W, k) * coeff(C, k) - coeff(W, k + 1) * coeff(C, k - 1)
                   for k in range(1, kmax + 1)]
        result = {
            "counts_2_3_4": counts,
            "m": len(rs),
            "N": N,
            "guarded_k": [1, kmax],
            "guarded_ranks_checked": len(margins),
            "minimum_signed_margin": str(min(margins)) if margins else None,
            "first_guarded_failure": next((k for k, value in enumerate(margins, 1) if value < 0), None),
        }
        if counts == (38, 0, 1):
            k = 77
            result["outside_guard_control_k77"] = {
                "guard": 2 * k <= N + 2,
                "signed_margin": str(coeff(W, k) * coeff(C, k) - coeff(W, k + 1) * coeff(C, k - 1)),
            }
            result["literal_tree_crosscheck"] = literal_tree_check(rs, C, W)
        results.append(result)
    print(json.dumps({"scope": "eight fixed profiles; all guarded k per profile; exact integer diagnostics only",
                      "results": results}, indent=2))


if __name__ == "__main__":
    main()
