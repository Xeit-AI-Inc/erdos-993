#!/usr/bin/env python3
"""Independent exact check of a 302-vertex path with a central spur."""
import json

N = 302
edges = [(i, i + 1) for i in range(300)] + [(150, 301)]
adj = [set() for _ in range(N)]
for u, v in edges:
    adj[u].add(v)
    adj[v].add(u)

def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    return out

def add(a, b):
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)
            for i in range(max(len(a), len(b)))]

def independent_poly(deleted):
    active = set(range(N)) - set(deleted)
    seen = set()
    def visit(v, parent):
        seen.add(v)
        without, with_v = [1], [0, 1]
        for w in sorted(adj[v] & active):
            if w == parent:
                continue
            child_without, child_with = visit(w, v)
            without = mul(without, add(child_without, child_with))
            with_v = mul(with_v, child_without)
        return without, with_v
    result = [1]
    for v in sorted(active):
        if v not in seen:
            a, b = visit(v, -1)
            result = mul(result, add(a, b))
    assert len(seen) == len(active)
    while result[-1] == 0:
        result.pop()
    return result

def coefficient(poly, k):
    return poly[k] if 0 <= k < len(poly) else 0

def delta(poly, k):
    return coefficient(poly, k + 1) - coefficient(poly, k)

P = independent_poly([])
alpha = len(P) - 1
p = alpha - 2
x = next(k for k in range(alpha + 1) if delta(P, k) < 0)
leaves = [v for v in range(N) if len(adj[v]) == 1]
rows = []
for v in leaves:
    s = next(iter(adj[v]))
    H = independent_poly([v, s])
    R = independent_poly(adj[s] | {s})
    Tv = independent_poly([v])
    W = adj[s] - {v}
    ah = len(H) - 1
    for k in range(1, ah + 1):
        q0 = coefficient(H, k) - coefficient(R, k)
        q1 = coefficient(H, k + 1) - coefficient(R, k + 1)
        assert q0 >= 0 and q1 >= 0
        assert k * q1 <= 2 * (ah - k) * q0
        assert k * q1 <= 2 * (alpha - 1 - k) * q0
        if 3 * k >= 2 * (alpha - 1):
            assert q1 <= q0
    qk = coefficient(H, p - 1) - coefficient(R, p - 1)
    qkp = coefficient(H, p) - coefficient(R, p)
    selector = delta(Tv, p)
    term = delta(H, p - 1) - delta(R, p - 1)
    assert term == qkp - qk
    assert qk >= 0 and qkp >= 0 and qkp <= qk
    rows.append(dict(tag=v, support=s, W=sorted(W), shadow_k_range=[1, ah], selector=selector,
                     favorable=selector < 0, q_k=qk, q_k_plus_1=qkp,
                     term=term))

result = dict(construction="P_301 on 0..300 plus leaf 301 at vertex 150",
              order=N, edge_count=len(edges), alpha=alpha, p=p, x=x,
              eligible=x + 2 <= p, original_leaves=leaves,
              high_tail_guard=3 * p >= 2 * alpha + 1,
              rows=rows,
              complete_sum=sum(row['term'] for row in rows if row['favorable']),
              terminal_delta=delta(P, alpha))
assert len(edges) == N - 1
assert result['eligible'] and result['high_tail_guard']
assert result['terminal_delta'] == -coefficient(P, alpha)
print(json.dumps(result, indent=2))
