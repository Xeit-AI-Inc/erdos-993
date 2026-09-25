"""Generate all unlabelled trees through order 8 by leaf extension.

Canonicalization uses the standard center-rooted parenthesis code. Independence
coefficients are counted directly from vertex subsets, independently of forest DP.
"""
import json


def centers(adj):
    alive = set(range(len(adj)))
    while len(alive) > 2:
        leaves = {v for v in alive if len(adj[v] & alive) <= 1}
        alive -= leaves
    return sorted(alive)


def rooted_code(adj, v, parent=-1):
    return '(' + ''.join(sorted(rooted_code(adj, u, v) for u in adj[v] if u != parent)) + ')'


def canonical(adj):
    return min(rooted_code(adj, v) for v in centers(adj))


def extend(adj, attach):
    out = [set(ns) for ns in adj] + [{attach}]
    out[attach].add(len(adj))
    return out


def coefficients(adj):
    n = len(adj)
    out = [0] * (n + 1)
    for mask in range(1 << n):
        if all(not ((mask >> v) & 1) or all(not ((mask >> u) & 1) for u in adj[v]) for v in range(n)):
            out[mask.bit_count()] += 1
    while out[-1] == 0:
        out.pop()
    return out


def x_contract(a):
    for k in range(len(a)):
        upper = a[k+1] if k+1 < len(a) else 0
        if upper-a[k] < 0:
            return k
    raise AssertionError


trees = {canonical([{1}, {0}]): [{1}, {0}]}
rows = []
for n in range(2, 9):
    eligible = []
    for code, adj in trees.items():
        a = coefficients(adj)
        alpha = len(a)-1
        x = x_contract(a)
        if x+2 <= alpha-2:
            eligible.append({'code': code, 'alpha': alpha, 'x': x})
    rows.append({'order': n, 'unlabeled_trees': len(trees), 'eligible': eligible})
    if n < 8:
        newer = {}
        for adj in trees.values():
            for v in range(n):
                t = extend(adj, v)
                newer[canonical(t)] = t
        trees = newer
print(json.dumps(rows, indent=2, sort_keys=True))
