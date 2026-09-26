#!/usr/bin/env python3
"""Exact replay for the C5-F3 bounded search and its order-13 fixture."""

from itertools import combinations, product
import json
import random


def graph(n, edges):
    adj = [set() for _ in range(n)]
    for u, v in edges:
        assert 0 <= u < n and 0 <= v < n and u != v
        adj[u].add(v)
        adj[v].add(u)
    # Connected and acyclic validation for an ordinary tree.
    seen = set()
    stack = [0] if n else []
    while stack:
        v = stack.pop()
        if v in seen:
            continue
        seen.add(v)
        stack.extend(adj[v] - seen)
    assert len(seen) == n and len(edges) == n - 1
    return adj


def remove(adj, gone):
    gone = set(gone)
    keep = set(range(len(adj))) - gone
    order = sorted(keep)
    renumber = {v: i for i, v in enumerate(order)}
    return [{renumber[u] for u in adj[v] if u in keep} for v in order]


def poly(adj):
    """Tree/forest independence polynomial by component tree DP."""
    n = len(adj)
    seen = set()

    def add(a, b):
        out = [0] * max(len(a), len(b))
        for i, x in enumerate(a):
            out[i] += x
        for i, x in enumerate(b):
            out[i] += x
        return out

    def mul(a, b):
        out = [0] * (len(a) + len(b) - 1)
        for i, x in enumerate(a):
            for j, y in enumerate(b):
                out[i + j] += x * y
        return out

    def visit(v, parent):
        assert v not in seen, "cycle"
        seen.add(v)
        no, yes = [1], [0, 1]
        for w in sorted(adj[v]):
            if w == parent:
                continue
            child_no, child_yes = visit(w, v)
            no = mul(no, add(child_no, child_yes))
            yes = mul(yes, child_no)
        return no, yes

    out = [1]
    for root in range(n):
        if root not in seen:
            no, yes = visit(root, None)
            out = mul(out, add(no, yes))
    while len(out) > 1 and out[-1] == 0:
        out.pop()
    return out


def coeff(a, j):
    return a[j] if 0 <= j < len(a) else 0


def delta(a, j):
    return coeff(a, j + 1) - coeff(a, j)


def descent(a):
    # Includes rank alpha, where the zero-extended next coefficient is 0.
    return next(j for j in range(len(a)) if delta(a, j) < 0)


def leaves(adj):
    return [v for v, ns in enumerate(adj) if len(ns) == 1]


def support(adj, v):
    assert len(adj[v]) == 1
    return next(iter(adj[v]))


def closed_neighborhood(adj, v):
    return {v} | adj[v]


def independent_sets(adj, rank):
    n = len(adj)
    for tup in combinations(range(n), rank):
        A = set(tup)
        if all(not (adj[v] & A) for v in A):
            yield A


def fixture():
    # Root 0 has a distinguished 0-1-2 path and three root-adjacent
    # supports with respectively 2, 2, and 3 terminal leaves.
    edges = [(0, 1), (1, 2), (0, 3), (3, 4), (3, 5),
             (0, 6), (6, 7), (6, 8), (0, 9), (9, 10), (9, 11), (9, 12)]
    return graph(13, edges), edges


def evaluate_fixture():
    T, edges = fixture()
    f = poly(T)
    a = len(f) - 1
    x = descent(f)
    p = 6
    assert p >= x + 2 and 3 * p < 2 * a + 1
    original_leaves = leaves(T)
    leaf_deltas = {}
    favorable = []
    for v in original_leaves:
        fv = poly(remove(T, {v}))
        leaf_deltas[str(v)] = delta(fv, p)
        if delta(fv, p) < 0:
            favorable.append(v)

    k = p - 1
    h = a - 1
    Q = U = E = C = D = S = 0
    tags = []
    for v in favorable:
        s = support(T, v)
        H = remove(T, {v, s})
        Ncs = closed_neighborhood(T, s)
        R = remove(T, Ncs)
        h_order = sorted(set(range(len(T))) - {v, s})
        h_map = {old: new for new, old in enumerate(h_order)}
        W_original = T[s] - {v}
        W = {h_map[w] for w in W_original}
        hpoly, rpoly = poly(H), poly(R)
        qk = coeff(hpoly, k) - coeff(rpoly, k)
        qk1 = coeff(hpoly, k + 1) - coeff(rpoly, k + 1)
        assert qk == sum(bool(A & W) for A in independent_sets(H, k))
        assert qk1 == sum(bool(A & W) for A in independent_sets(H, k + 1))
        e = c = 0
        for A in independent_sets(H, k):
            if A & W:
                e += sum(1 for z in (set(range(len(H))) - A)
                         if not (H[z] & A))
        for A in independent_sets(H, k + 1):
            if A & W and len(A & W) >= 2:
                c += 1
        d = 2 * (h - k) * qk - e
        g = qk1 - qk
        sdelta = delta(hpoly, k) - delta(rpoly, k)
        assert g == sdelta
        assert e == k * qk1 + c
        Q += qk
        U += qk1
        E += e
        C += c
        D += d
        S += g
        tags.append({"leaf": v, "support": s, "W": sorted(W_original), "q_k": qk,
                     "q_k1": qk1, "E_v": e, "C_v": c, "D_v": d,
                     "summand": g})

    coefficient = 2 * a + 1 - 3 * p
    return {
        "edges": [list(e) for e in edges], "n": len(T),
        "independence_vector": f, "alpha": a, "x": x,
        "i_x": coeff(f, x), "i_x_plus_1": coeff(f, x + 1),
        "p": p, "k": k, "selector_leaf_deltas": leaf_deltas,
        "original_leaves": original_leaves, "favorable_leaves": favorable,
        "tag_rows": tags, "Q": Q, "U": U, "E": E, "C": C, "D": D,
        "S": S, "coefficient_2a1_minus_3p": coefficient,
        "budget_margin": D + C - coefficient * Q,
        "kS": k * S, "E_equals_kU_plus_C": E == k * U + C,
        "lower_region_guard": p >= x + 2 and 3 * p < 2 * a + 1,
    }


def prufer_tree(seq):
    n = len(seq) + 2
    degree = [1] * n
    for v in seq:
        degree[v] += 1
    edges = []
    for v in seq:
        leaf = next(i for i, d in enumerate(degree) if d == 1)
        edges.append((leaf, v))
        degree[leaf] -= 1
        degree[v] -= 1
    last = [i for i, d in enumerate(degree) if d == 1]
    edges.append(tuple(last))
    return graph(n, edges)


def eligible_rows(adj):
    f = poly(adj)
    a, x = len(f) - 1, descent(f)
    for p in range(x + 2, a + 1):
        if 3 * p < 2 * a + 1:
            fv = [poly(remove(adj, {v})) for v in leaves(adj)]
            F = [v for v, fp in zip(leaves(adj), fv) if delta(fp, p) < 0]
            if F:
                yield p, F


def bounded_search():
    # Seeded random Prüfer sample used as a lead only.
    rng = random.Random(993)
    random_eligible = random_proper = 0
    for _ in range(5000):
        n = rng.randint(10, 17)
        T = prufer_tree([rng.randrange(n) for _ in range(n - 2)])
        for p, F in eligible_rows(T):
            random_eligible += 1
            if 0 < len(F) < len(leaves(T)):
                random_proper += 1

    # Exhaustive ordered arm profiles: m=3,4,5 and d_i in {2,3,4},
    # excluding constant profiles. These are asymmetric rooted star-arm trees.
    profiles = eligible = proper = 0
    for m in (3, 4, 5):
        for ds in product((2, 3, 4), repeat=m):
            if len(set(ds)) == 1:
                continue
            edges = [(0, 1), (1, 2)]
            v = 3
            for d in ds:
                edges.append((0, v))
                edges.extend((v, v + j) for j in range(1, d + 1))
                v += d + 1
            T = graph(v, edges)
            profiles += 1
            for _, F in eligible_rows(T):
                eligible += 1
                if 0 < len(F) < len(leaves(T)):
                    proper += 1
    return {"random_seed": 993, "random_trees_sampled": 5000,
            "random_eligible_rows": random_eligible,
            "random_proper_selector_rows": random_proper,
            "ordered_arm_profiles": profiles,
            "ordered_arm_eligible_rows": eligible,
            "ordered_arm_proper_selector_rows": proper}


if __name__ == "__main__":
    exact = evaluate_fixture()
    bounded = bounded_search()
    assert exact["lower_region_guard"]
    assert exact["favorable_leaves"] == exact["original_leaves"]
    assert exact["S"] == -307 and exact["budget_margin"] == 1535
    assert exact["E_equals_kU_plus_C"] and exact["budget_margin"] == -exact["kS"]
    assert bounded == {"random_seed": 993, "random_trees_sampled": 5000,
                       "random_eligible_rows": 98, "random_proper_selector_rows": 0,
                       "ordered_arm_profiles": 342,
                       "ordered_arm_eligible_rows": 536,
                       "ordered_arm_proper_selector_rows": 0}
    print(json.dumps({"fixture": exact, "bounded_search": bounded}, indent=2))
