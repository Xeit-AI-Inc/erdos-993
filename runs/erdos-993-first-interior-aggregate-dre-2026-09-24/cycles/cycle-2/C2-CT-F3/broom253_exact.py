#!/usr/bin/env python3
"""Bounded exact audit of a new 253-vertex tree and all original leaf tags."""
import json


def add(a, b):
    return [((a[i] if i < len(a) else 0) +
             (b[i] if i < len(b) else 0)) for i in range(max(len(a), len(b)))]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            out[i + j] += ai * bj
    return out


def independent_poly(vertices, edges):
    keep = set(vertices)
    adj = {v: [] for v in keep}
    for u, v in edges:
        if u in keep and v in keep:
            adj[u].append(v)
            adj[v].append(u)
    seen = set()

    def visit(u, parent):
        seen.add(u)
        omit, take = [1], [0, 1]
        for w in adj[u]:
            if w == parent:
                continue
            assert w not in seen, "input must be a forest"
            child_omit, child_take = visit(w, u)
            omit = mul(omit, add(child_omit, child_take))
            take = mul(take, child_omit)
        return omit, take

    answer = [1]
    for u in sorted(keep):
        if u not in seen:
            omit, take = visit(u, None)
            answer = mul(answer, add(omit, take))
    assert len(seen) == len(keep)
    return answer


def coeff(poly, j):
    return poly[j] if 0 <= j < len(poly) else 0


def delta(poly, j):
    return coeff(poly, j + 1) - coeff(poly, j)


# Path 0--1--...--250, with two additional leaves at vertex 1.
vertices = set(range(253))
edges = [(i, i + 1) for i in range(250)] + [(1, 251), (1, 252)]
adj = {u: [] for u in vertices}
for u, v in edges:
    adj[u].append(v)
    adj[v].append(u)
assert len(edges) == len(vertices) - 1
assert {v for v in vertices if len(adj[v]) == 1} == {0, 250, 251, 252}

poly_t = independent_poly(vertices, edges)
alpha = len(poly_t) - 1
p = alpha - 2
x = next(j for j in range(alpha + 1) if delta(poly_t, j) < 0)
rows = []
for leaf in sorted(v for v in vertices if len(adj[v]) == 1):
    support = adj[leaf][0]
    h_vertices = vertices - {leaf, support}
    r_vertices = vertices - {support} - set(adj[support])
    poly_minus = independent_poly(vertices - {leaf}, edges)
    poly_h = independent_poly(h_vertices, edges)
    poly_r = independent_poly(r_vertices, edges)
    sel = delta(poly_minus, p)
    term = delta(poly_h, p - 1) - delta(poly_r, p - 1)
    q = [coeff(poly_h, k) - coeff(poly_r, k) for k in range(alpha + 1)]
    alpha_h = len(poly_h) - 1
    assert all(q[k] >= 0 for k in range(alpha + 1))
    assert all(k * q[k + 1] <= 2 * (alpha_h - k) * q[k]
               for k in range(1, alpha_h + 1))
    assert term == q[p] - q[p - 1]
    rows.append({
        "leaf": leaf,
        "support": support,
        "alpha_H": alpha_h,
        "selector_delta_p_T_minus_v": sel,
        "favorable": sel < 0,
        "delta_p_minus_1_H": delta(poly_h, p - 1),
        "delta_p_minus_1_R": delta(poly_r, p - 1),
        "q_p_minus_1": q[p - 1],
        "q_p": q[p],
        "term": term,
        "shadow_checked_k_range": [1, alpha_h],
    })

result = {
    "construction": "path 0--1--...--250 plus edges (1,251),(1,252)",
    "order": len(vertices),
    "edge_count": len(edges),
    "alpha": alpha,
    "p": p,
    "x": x,
    "delta_x_minus_1": delta(poly_t, x - 1),
    "delta_x": delta(poly_t, x),
    "delta_alpha": delta(poly_t, alpha),
    "eligible": x + 2 <= p,
    "leaf_rows": rows,
    "complete_favorable_sum": sum(row["term"] for row in rows if row["favorable"]),
}
print(json.dumps(result, indent=2))
