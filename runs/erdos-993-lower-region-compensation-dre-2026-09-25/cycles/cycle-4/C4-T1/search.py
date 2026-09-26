"""Exhaust labeled trees through order 8 and test q_v(k+1)>q_v(k) on eligible tags."""
from itertools import product
import json

def trees(n):
    if n == 2:
        yield [(0, 1)]
        return
    for seq in product(range(n), repeat=n-2):
        deg = [1] * n
        for z in seq:
            deg[z] += 1
        edges = []
        for z in seq:
            leaf = next(i for i, d in enumerate(deg) if d == 1)
            edges.append((leaf, z))
            deg[leaf] -= 1
            deg[z] -= 1
        ends = [i for i, d in enumerate(deg) if d == 1]
        edges.append(tuple(ends))
        yield edges

def counts_for(n, edges, allowed_mask=None):
    counts = [0] * (n + 1)
    for mask in range(1 << n):
        if allowed_mask is not None and mask & ~allowed_mask:
            continue
        if any((mask >> u & 1) and (mask >> v & 1) for u, v in edges):
            continue
        counts[mask.bit_count()] += 1
    return counts

out = []
for n in range(2, 9):
    tree_count = eligible_pairs = selected_tags = comparisons = violations = 0
    for edges in trees(n):
        tree_count += 1
        adj = [set() for _ in range(n)]
        for u, v in edges:
            adj[u].add(v); adj[v].add(u)
        iT = counts_for(n, edges)
        alpha = max(j for j, z in enumerate(iT) if z)
        delta = [iT[j+1] - iT[j] for j in range(n)] + [-iT[n]]
        x = next(j for j, z in enumerate(delta) if z < 0)
        leaves = [v for v in range(n) if len(adj[v]) == 1]
        for p in range(x + 2, n + 1):
            if 3*p >= 2*alpha + 1:
                continue
            eligible_pairs += 1
            F = []
            for v in leaves:
                s = next(iter(adj[v]))
                allowed = ((1 << n) - 1) ^ (1 << v)
                iTv = counts_for(n, edges, allowed)
                if iTv[p+1] - iTv[p] < 0:
                    F.append((v, s))
            k = p - 1
            for v, s in F:
                selected_tags += 1
                W = adj[s] - {v}
                allowed = ((1 << n) - 1) ^ (1 << v) ^ (1 << s)
                q = [0] * (n + 1)
                for mask in range(1 << n):
                    if mask & ~allowed:
                        continue
                    if any((mask >> u & 1) and (mask >> z & 1) for u, z in edges):
                        continue
                    if any(mask >> w & 1 for w in W):
                        q[mask.bit_count()] += 1
                comparisons += 1
                if q[k+1] > q[k]:
                    violations += 1
                    out.append({"n": n, "edges": edges, "alpha": alpha, "x": x,
                                "p": p, "k": k, "counts": iT[:alpha+1],
                                "F": F, "leaf": v, "support": s,
                                "W": sorted(W), "q_k": q[k], "q_k1": q[k+1]})
    print(json.dumps({"n": n, "labeled_trees": tree_count,
                      "eligible_tree_p_pairs": eligible_pairs,
                      "selected_leaf_tags": selected_tags,
                      "adjacent_rank_comparisons": comparisons,
                      "q_k1_gt_q_k": sum(1 for z in out if z["n"] == n)},
                     separators=(",", ":")))
    if violations:
        break
if out:
    print(json.dumps({"first_witness": out[0]}, separators=(",", ":")))
