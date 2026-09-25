"""Independent exact polynomial audit of C2-F2 and a 245-vertex target."""
from math import comb


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, v in enumerate(a):
        c[i] += v
    for i, v in enumerate(b):
        c[i] += v
    return c


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def polynomial(vertices, edges):
    """Forest independence polynomial by include/exclude at each rooted vertex."""
    vertices = set(vertices)
    adj = {u: [] for u in vertices}
    for u, v in edges:
        if u in vertices and v in vertices:
            adj[u].append(v)
            adj[v].append(u)
    seen = set()

    def visit(u, parent):
        seen.add(u)
        out = [1]
        inside = [0, 1]
        for v in adj[u]:
            if v == parent:
                continue
            assert v not in seen, "input is cyclic"
            child_out, child_in = visit(v, u)
            out = mul(out, add(child_out, child_in))
            inside = mul(inside, child_out)
        return out, inside

    poly = [1]
    for root in vertices:
        if root not in seen:
            out, inside = visit(root, None)
            poly = mul(poly, add(out, inside))
    return poly


def delta(poly, k):
    coeff = lambda j: poly[j] if 0 <= j < len(poly) else 0
    return coeff(k + 1) - coeff(k)


def audit(n, edges):
    assert len(edges) == n - 1
    adj = [set() for _ in range(n)]
    for u, v in edges:
        assert 0 <= u < n and 0 <= v < n and u != v and v not in adj[u]
        adj[u].add(v)
        adj[v].add(u)
    all_vertices = set(range(n))
    poly = polynomial(all_vertices, edges)
    alpha = len(poly) - 1
    x = next(k for k in range(alpha + 1) if delta(poly, k) < 0)
    p = alpha - 2
    rows = []
    for v in range(n):
        if len(adj[v]) != 1:
            continue
        s = next(iter(adj[v]))
        tv = polynomial(all_vertices - {v}, edges)
        h = polynomial(all_vertices - {v, s}, edges)
        r = polynomial(all_vertices - ({s} | adj[s]), edges)
        selector = delta(tv, p)
        term = delta(h, p - 1) - delta(r, p - 1)
        rows.append((v, s, selector, term))
    return {
        "n": n,
        "alpha": alpha,
        "x": x,
        "p": p,
        "eligible": x + 2 <= p,
        "counts": poly,
        "rows": rows,
        "S": sum(term for _, _, selector, term in rows if selector < 0),
    }


core = [(0, 2), (1, 2), (3, 2), (5, 4), (7, 4), (4, 6), (6, 2), (2, 8)]
small = audit(9, core)
assert small["counts"] == [1, 9, 28, 42, 39, 22, 7, 1]
assert small["alpha"] == 7 and small["x"] == 3 and small["p"] == 5
assert small["rows"] == [(0, 2, -5, -10), (1, 2, -5, -10),
                          (3, 2, -5, -10), (5, 4, -6, -8),
                          (7, 4, -6, -8), (8, 2, -5, -10)]
assert small["S"] == -56
print("order9", {k: v for k, v in small.items() if k != "counts"})

# A fresh 245-vertex target: the same core with a pendant path attached at 0.
# The path has vertices 9,...,244 and edges 0--9--...--244.
large_edges = core + [(0, 9)] + [(j, j + 1) for j in range(9, 244)]
large = audit(245, large_edges)
print("order245", {k: v for k, v in large.items() if k != "counts"})
print("order245 first descent", large["counts"][large["x"]],
      large["counts"][large["x"] + 1])
print("order245 target coefficients", [large["counts"][k] for k in range(large["p"] - 1,
                                                               large["p"] + 2)])

# Independent closed-form check on an ordinary 245-vertex path, to cross-check
# the high-rank arithmetic in a second large graph.
path = audit(245, [(j, j + 1) for j in range(244)])
assert path["counts"] == [comb(246 - k, k) for k in range(124)]
print("path245", {k: v for k, v in path.items() if k != "counts"})
