"""Seeded bounded asymmetric rooted-tree search for Cycle 1 F2."""
import json
import random
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / "inputs"))
import ordinary_tree_checked as otc

SEED = 99320260925
N_CASES = 1200
MIN_ORDER = 9
MAX_ORDER = 36
rng = random.Random(SEED)

def grow_tree(n, mode):
    # Root at 0. Weighted attachment gives a broad mix of hub, path, and
    # irregular rooted shapes; mode 1 also grows non-root descendants more often.
    edges = []
    deg = [0]
    for v in range(1, n):
        if mode == 0:
            weights = [1 + d for d in deg]
        else:
            weights = [1 + (3*d if i == 0 else 2*d + 1) for i, d in enumerate(deg)]
        parent = rng.choices(range(v), weights=weights, k=1)[0]
        edges.append((parent, v))
        deg[parent] += 1
        deg.append(1)
    return otc.Graph.from_edges(range(n), edges)

def rooted_gadget_tree(n):
    # Generate an asymmetric hub-and-gadget tree. Reserve a 1-3 vertex backbone,
    # then attach rooted recursive gadgets with independently varied sizes.
    backbone = rng.randint(1, min(3, n - 2))
    edges = [(i - 1, i) for i in range(1, backbone)]
    deg = [0] * backbone
    for u, v in edges:
        deg[u] += 1; deg[v] += 1
    remaining = n - backbone
    while remaining:
        size = min(remaining, rng.randint(1, min(7, remaining)))
        attachment = rng.randrange(backbone)
        first = len(deg)
        edges.append((attachment, first))
        deg[attachment] += 1
        deg.append(1)
        # Growth biases differ per gadget, producing rooted paths, brooms, and forks.
        gadget_mode = rng.randrange(3)
        for v in range(first + 1, first + size):
            local = list(range(first, v))
            if gadget_mode == 0:
                weights = [1 + deg[z] for z in local]
            elif gadget_mode == 1:
                weights = [1 + 3*deg[z] for z in local]
            else:
                weights = [1 + (2*deg[z] if deg[z] > 1 else 1) for z in local]
            parent = rng.choices(local, weights=weights, k=1)[0]
            edges.append((parent, v))
            deg[parent] += 1
            deg.append(1)
        remaining -= size
    return otc.Graph.from_edges(range(n), edges)

def summarize(tree):
    poly = tree.forest_independence_polynomial()
    alpha = len(poly) - 1
    x = otc.first_strict_descent(poly)
    if x is None:
        return []
    rows = []
    for p in range(x + 2, (2 * alpha + 1 - 1) // 3 + 1):
        if not (3*p < 2*alpha+1):
            continue
        row = otc.aggregate_row(tree, p)
        rows.append(row)
    return rows

cases = []
positive = []
eligible_rows = 0
trees_with_eligible_row = 0
rows_with_positive_term = 0
positive_terms = 0
best_row = None
for idx in range(N_CASES):
    n = rng.randint(MIN_ORDER, MAX_ORDER)
    mode = idx % 3
    tree = rooted_gadget_tree(n) if mode == 2 else grow_tree(n, mode)
    rows = summarize(tree)
    eligible_rows += len(rows)
    trees_with_eligible_row += int(bool(rows))
    cases.append({"index": idx, "order": n, "mode": mode,
                  "edges": sorted([list(e) for e in (tuple(sorted((u,v))) for u in tree.vertices for v in tree.adjacency[u] if u < v)]),
                  "eligible_row_count": len(rows)})
    for row in rows:
        candidate = {"index": idx, "mode": mode, "edges": cases[-1]["edges"], **row}
        n_positive_terms = sum(entry["g"] > 0 for entry in row["summands"])
        positive_terms += n_positive_terms
        rows_with_positive_term += int(n_positive_terms > 0)
        if best_row is None or candidate["aggregate"] > best_row["aggregate"]:
            best_row = candidate
        if row["aggregate"] > 0:
            positive.append({"index": idx, "mode": mode, "edges": cases[-1]["edges"], **row})

best_graph = otc.Graph.from_edges(range(best_row["order"]), best_row["edges"])
best_poly = best_graph.forest_independence_polynomial()
best_selector = [{"leaf": v, "support": best_graph.support(v),
                  "delta_p_after_delete": otc.delta(best_graph.remove({v}).forest_independence_polynomial(), best_row["rank"])}
                 for v in best_graph.leaves()]
out = {
    "seed": SEED,
    "generation": {"cases": N_CASES, "orders_uniform_integer": [MIN_ORDER, MAX_ORDER],
                   "mode": "cyclic modes: 0 weighted recursive tree parent weight 1+degree; 1 weighted recursive tree root parent weight 1+3*degree and other parent weight 2*degree+1; 2 1-3 vertex backbone with randomly sized (max 7) asymmetrically grown rooted gadgets attached at random backbone vertices; each new vertex attaches to one earlier vertex by weighted choice"},
    "counts": {"trees": len(cases), "eligible_tree_rank_rows": eligible_rows,
               "trees_with_at_least_one_eligible_rank": trees_with_eligible_row,
               "rows_with_at_least_one_positive_leaf_term": rows_with_positive_term,
               "positive_leaf_terms_across_rows": positive_terms,
               "positive_complete_aggregates": len(positive)},
    "best_tree_full_check": {"index": best_row["index"], "edges": best_row["edges"],
                             "independence_polynomial": best_poly,
                             "alpha": best_row["alpha"], "x": best_row["first_strict_descent"],
                             "p": best_row["rank"], "selector_by_original_leaf": best_selector,
                             "eligible": best_row["first_strict_descent"] + 2 <= best_row["rank"] and 3*best_row["rank"] < 2*best_row["alpha"]+1,
                             "full_aggregate": best_row["aggregate"],
                             "tagged_summands": best_row["summands"]},
    "best_nonpositive_row": best_row,
    "cases": cases,
    "positive_rows": positive,
}
Path(__file__).with_name("search_results.json").write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps(out["counts"], sort_keys=True))
if positive:
    print("FIRST_POSITIVE", json.dumps(positive[0], sort_keys=True))
