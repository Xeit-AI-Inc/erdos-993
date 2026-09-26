"""Exact scratch replay for the C2-U5 pendant-extension example."""
import sys
sys.path.insert(0, "/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C2-CF-U5")
from ordinary_tree_checked import Graph, add_poly, coefficient, delta, first_strict_descent, mul_poly


def shift(poly):
    return [0] + list(poly)


def isolated(poly):
    return mul_poly([1, 1], poly)


def tree(extended=False):
    edges = [(i, i + 1) for i in range(5)]
    edges += [edge for i in range(6) for edge in ((i, 6 + 2*i), (i, 7 + 2*i))]
    if extended:
        edges.append((10, 18))
    return Graph.from_edges(range(19 if extended else 18), edges)


def inspect(g, p):
    poly = g.forest_independence_polynomial()
    x = first_strict_descent(poly)
    leaves = g.leaves()
    leaf_deltas = {v: delta(g.remove({v}).forest_independence_polynomial(), p) for v in leaves}
    favorable = [v for v in leaves if leaf_deltas[v] < 0]
    terms = []
    for v in favorable:
        s = g.support(v)
        H = g.remove({v, s})
        R = g.remove(g.closed_neighborhood({s}))
        HP = H.forest_independence_polynomial()
        RP = R.forest_independence_polynomial()
        terms.append((v, s, delta(HP, p-1) - delta(RP, p-1)))
    return poly, x, leaves, leaf_deltas, favorable, terms


p = 8
base, ext = tree(False), tree(True)
u = 10
for g, extended in ((base, False), (ext, True)):
    poly, x, leaves, leaf_deltas, favorable, terms = inspect(g, p)
    assert x == 6 and len(poly)-1 == 12
    print(f"extended={extended} n={len(g.vertices)} alpha={len(poly)-1} x={x}")
    print("P_T=", poly)
    print("Delta_0..terminal=", [delta(poly, j) for j in range(len(poly))])
    print("leaf Delta_p=", leaf_deltas)
    print("favorable=", favorable)
    print("(leaf,support,summand)=", terms)
    print("S=", sum(t[2] for t in terms))

P = base.forest_independence_polynomial()
P_minus_u = base.remove({u}).forest_independence_polynomial()
Pplus = ext.forest_independence_polynomial()
assert Pplus == add_poly(P, shift(P_minus_u))
# Verify every surviving old-leaf selector polynomial recurrence and each H/R deletion recurrence.
for v in base.leaves():
    if v == u:
        continue
    assert ext.remove({v}).forest_independence_polynomial() == add_poly(
        base.remove({v}).forest_independence_polynomial(),
        shift(base.remove({v, u}).forest_independence_polynomial()))
    s = base.support(v)
    H = base.remove({v, s})
    Hplus = ext.remove({v, s})
    expected_Hplus = (add_poly(H.forest_independence_polynomial(),
                               shift(H.remove({u}).forest_independence_polynomial()))
                      if u in H.vertices else isolated(H.forest_independence_polynomial()))
    assert Hplus.forest_independence_polynomial() == expected_Hplus
    R = base.remove(base.closed_neighborhood({s}))
    Rplus = ext.remove(ext.closed_neighborhood({s}))
    if u == s:
        expected_Rplus = R.forest_independence_polynomial()
    elif u in R.vertices:
        expected_Rplus = add_poly(R.forest_independence_polynomial(),
                                  shift(R.remove({u}).forest_independence_polynomial()))
    else:
        expected_Rplus = isolated(R.forest_independence_polynomial())
    assert Rplus.forest_independence_polynomial() == expected_Rplus
# New leaf w has H=T-u and R=T-N_T[u].
assert ext.remove({18, 10}).forest_independence_polynomial() == P_minus_u
assert ext.remove(ext.closed_neighborhood({10})).forest_independence_polynomial() == base.remove(base.closed_neighborhood({10})).forest_independence_polynomial()
print("recurrence checks: base-to-extension, all surviving selectors, all old H/R cases, and new leaf H/R passed")
