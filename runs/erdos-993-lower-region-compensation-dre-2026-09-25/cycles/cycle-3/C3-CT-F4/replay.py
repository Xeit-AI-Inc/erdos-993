"""Reproduce C3-F4 bounded checks using the packet-pinned exact tree evaluator."""
import importlib.util
import json
import random
import sys

EVALUATOR = "/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C3-CT-F4/ordinary_tree_checked.py"
spec = importlib.util.spec_from_file_location("ordinary_tree_checked", EVALUATOR)
ev = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = ev
spec.loader.exec_module(ev)

# Exact degenerate mark-shadow counterexample when tau(G)>=3 is removed.
k = 3
G = ev.star_graph(2*k + 1)  # order 2k+2, center 0 and 2k+1 leaves
W = frozenset({1})
q = {j: sum(bool(A & W) for A in G.independent_sets(j)) for j in (k, k+1)}

# Next-order positive favorable sum, but first-descent-ineligible tree.
# K1,8 centered at 0, with the edge (0,1) replaced by 0-1-9-10.
p = 4
edges = [(0, i) for i in range(2, 9)] + [(0, 1), (1, 9), (9, 10)]
T = ev.Graph.from_edges(range(11), edges)
next_order = ev.aggregate_row(T, p)

# Reproducible random Prüfer sample. Each draw is an independent uniform
# sequence in [0,n)^(n-2), decoded by the packet-pinned evaluator.
rng = random.Random(20260925)
sampled = {}
for p in range(6, 11):
    n = 2*p + 3
    early = 0
    witness = None
    trials = 12000
    for draw in range(trials):
        tree = ev.prufer_tree([rng.randrange(n) for _ in range(n-2)])
        poly = tree.forest_independence_polynomial()
        x = ev.first_strict_descent(poly)
        if x is None or x + 2 > p:
            continue
        early += 1
        row = ev.aggregate_row(tree, p)
        for term in row["summands"]:
            if term["g"] > 0:
                witness = {
                    "draw": draw,
                    "prufer": None,
                    "x": x,
                    "term": term,
                    "row": row,
                }
                break
        if witness:
            break
    sampled[str(p)] = {
        "order": n,
        "draws": trials if witness is None else witness["draw"] + 1,
        "early_descent_rows": early,
        "positive_favorable_term_found": witness is not None,
        "witness": witness,
    }

print(json.dumps({
    "marked_star": {"order": len(G.vertices), "k": k, "tau": 1, "W": sorted(W), "q_k": q[k], "q_k_plus_1": q[k+1]},
    "next_order_tree": {
        "order": len(T.vertices), "p": 4,
        "edges": sorted([list(e) for e in edges]),
        "polynomial": T.forest_independence_polynomial(),
        "alpha": next_order["alpha"],
        "x": next_order["first_strict_descent"],
        "favorable_leaves": next_order["favorable_leaves"],
        "summands": next_order["summands"],
        "S": next_order["aggregate"],
    },
    "random_sample": sampled,
}, sort_keys=True, indent=2))
