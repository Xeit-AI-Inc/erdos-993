"""Small independent graph and tag-identity checks for T_m, m=3..6."""
import importlib.util
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("ordinary_tree_checked", HERE / "ordinary_tree_checked.py")
ot = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = ot
spec.loader.exec_module(ot)

def add(a, b):
    return ot.add_poly(a, b)

def mul(a, b):
    return ot.mul_poly(a, b)

def shift(poly):
    return [0] + list(poly)

def c(poly, j):
    return ot.coefficient(poly, j)

rows = []
L = [1, 1]
B = [1, 4, 3, 1]
for m in range(3, 7):
    tree, endpoint = ot.t_family(m)
    P = tree.forest_independence_polynomial()
    # Build P=(1+2z)B^m+z(1+z)^(3m+1) directly.
    bm = [1]
    for _ in range(m):
        bm = mul(bm, B)
    leaves_poly = [1]
    for _ in range(3*m+1):
        leaves_poly = mul(leaves_poly, L)
    formula_P = add(mul([1, 2], bm), shift(leaves_poly))
    assert P == formula_P
    alpha = len(P) - 1
    x = ot.first_strict_descent(P)
    assert x is not None
    leaf_vertices = tree.leaves()
    assert len(leaf_vertices) == 3*m + 1

    bprev = [1]
    for _ in range(m-1):
        bprev = mul(bprev, B)
    L3m = [1]
    for _ in range(3*m):
        L3m = mul(L3m, L)
    q_endpoint = shift(L3m)
    q_private = add(
        shift(mul([2, 5, 2], bprev)),
        shift(L3m),
    )
    q_sum_formula = q_endpoint
    for _ in range(3*m):
        q_sum_formula = add(q_sum_formula, q_private)
    R = add(mul([6*m, 15*m, 6*m], bprev), [(3*m+1)*v for v in L3m])
    assert q_sum_formula == shift(R)

    q_sum_actual = [0]
    for leaf in leaf_vertices:
        support = tree.support(leaf)
        H = tree.remove({leaf, support}).forest_independence_polynomial()
        Rgraph = tree.remove(tree.closed_neighborhood({support})).forest_independence_polynomial()
        q = [c(H, j)-c(Rgraph, j) for j in range(max(len(H), len(Rgraph)))]
        q_sum_actual = add(q_sum_actual, q)
    assert q_sum_actual == q_sum_formula

    eligible = []
    for p in range(0, len(P)+1):
        if x+2 <= p and 3*p < 2*alpha+1:
            fav = ot.favorable_leaves(tree, p)
            assert set(fav) == set(leaf_vertices)
            full_s = ot.aggregate_row(tree, p)["aggregate"]
            assert full_s == c(R, p-1)-c(R, p-2)
            eligible.append({"p": p, "favorable_leaf_count": len(fav), "S": full_s,
                             "R_p_minus_1_minus_R_p_minus_2": c(R,p-1)-c(R,p-2)})
    rows.append({"m": m, "order": len(tree.vertices), "alpha": alpha, "x": x,
                 "leaf_count": len(leaf_vertices), "eligible_rows": eligible,
                 "P_formula_matches": True, "all_tagged_q_sum_matches_zR": True})

out = {"scope": "independent tree-DP replay for T_m, 3<=m<=6 only",
       "method": "ordinary_tree_checked.py copied to this scratch; all graph polynomials and every original leaf tag recomputed",
       "rows": rows}
(HERE / "SMALL-GRAPH-EVIDENCE.json").write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps(out, indent=2))
