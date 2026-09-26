"""Independent bounded falsification for the first-shell proof audit.

No project modules or prior sanity code are imported. This is not a proof.
"""
import itertools
import json
import math
import random


def coefficients(adj, kept):
    vertices = [v for v in range(len(adj)) if kept >> v & 1]
    out = [0] * (len(vertices) + 1)
    for subset in range(1 << len(vertices)):
        original = sum(1 << vertices[i] for i in range(len(vertices)) if subset >> i & 1)
        if all(not (adj[v] & original) for v in vertices if original >> v & 1):
            out[subset.bit_count()] += 1
    return out


def count(poly, j):
    return poly[j] if 0 <= j < len(poly) else 0


def delta(poly, j):
    return count(poly, j + 1) - count(poly, j)


def prufer_tree(n, seq):
    degrees = [1] * n
    for v in seq:
        degrees[v] += 1
    adj = [0] * n
    for v in seq:
        leaf = next(i for i, d in enumerate(degrees) if d == 1)
        adj[v] |= 1 << leaf
        adj[leaf] |= 1 << v
        degrees[v] -= 1
        degrees[leaf] -= 1
    u, v = [i for i, d in enumerate(degrees) if d == 1]
    adj[u] |= 1 << v
    adj[v] |= 1 << u
    return adj


def tree_poly(adj, kept):
    # Independent tree recurrence, unrelated to the supplied evaluator.
    def multiply(a, b):
        out = [0] * (len(a) + len(b) - 1)
        for i, x in enumerate(a):
            for j, y in enumerate(b):
                out[i + j] += x * y
        return out

    def visit(v, parent):
        excluded, included = [1], [0, 1]
        for w in range(len(adj)):
            if kept >> w & 1 and adj[v] >> w & 1 and w != parent:
                a, b = visit(w, v)
                excluded = multiply(excluded, [x + y for x, y in itertools.zip_longest(a, b, fillvalue=0)])
                included = multiply(included, a)
        return excluded, included

    product = [1]
    seen = 0
    for root in range(len(adj)):
        if not (kept >> root & 1) or (seen >> root & 1):
            continue
        stack = [root]
        seen |= 1 << root
        while stack:
            v = stack.pop()
            for w in range(len(adj)):
                if kept >> w & 1 and adj[v] >> w & 1 and not (seen >> w & 1):
                    seen |= 1 << w
                    stack.append(w)
        a, b = visit(root, -1)
        product = multiply(product, [x + y for x, y in itertools.zip_longest(a, b, fillvalue=0)])
    return product


def run():
    edges = list(itertools.combinations(range(6), 2))
    graphs = marked_cases = 0
    for code in range(1 << len(edges)):
        adj = [0] * 6
        for i, (u, v) in enumerate(edges):
            if code >> i & 1:
                adj[u] |= 1 << v
                adj[v] |= 1 << u
        independent = [False] * 64
        independent[0] = True
        by_rank = [[0] * 64 for _ in range(4)]
        by_rank[0][0] = 1
        alpha = 0
        for mask in range(1, 64):
            bit = mask & -mask
            v = bit.bit_length() - 1
            rest = mask ^ bit
            independent[mask] = independent[rest] and not (adj[v] & rest)
            if independent[mask]:
                j = mask.bit_count()
                alpha = max(alpha, j)
                if j <= 3:
                    by_rank[j][mask] = 1
        if 6 - alpha < 3:
            continue
        for table in by_rank:
            for v in range(6):
                for mask in range(64):
                    if mask >> v & 1:
                        table[mask] += table[mask ^ (1 << v)]
        graphs += 1
        noniso = sum(1 << v for v in range(6) if adj[v])
        for marks in range(64):
            if not marks & noniso:
                continue
            q2 = by_rank[2][63] - by_rank[2][63 ^ marks]
            q3 = by_rank[3][63] - by_rank[3][63 ^ marks]
            assert q3 <= q2, (code, marks, q2, q3)
            marked_cases += 1

    gamma_min = None
    for r in range(501):
        cat = lambda j: math.comb(2 * j, j) // (j + 1) if j >= 0 else 0
        n = 2 * r + 3
        value = math.comb(n, r + 1) - math.comb(n, r) - 3 * cat(r - 1) - 3 * cat(r - 2) - cat(r - 3)
        assert value > 0, (r, value)
        gamma_min = value if gamma_min is None else min(gamma_min, value)

    rng = random.Random(20260925)
    tree_rows = []
    for n, samples in [(8, 100), (10, 100), (12, 100), (14, 100), (16, 100), (18, 100), (20, 100)]:
        p = (n - 2) // 2
        eligible = leaves_checked = selected = 0
        for _ in range(samples):
            adj = prufer_tree(n, [rng.randrange(n) for _ in range(n - 2)])
            full = (1 << n) - 1
            poly = tree_poly(adj, full)
            x = next(j for j in range(len(poly)) if delta(poly, j) < 0)
            if x + 2 > p:
                continue
            eligible += 1
            alpha = max(j for j, value in enumerate(poly) if value)
            assert n - alpha >= 4
            for v in range(n):
                if adj[v].bit_count() != 1:
                    continue
                leaves_checked += 1
                s = adj[v].bit_length() - 1
                h_mask = full ^ (1 << v) ^ (1 << s)
                h = tree_poly(adj, h_mask)
                w_mask = adj[s] ^ (1 << v)
                r = tree_poly(adj, h_mask & ~w_mask)
                q_high = count(h, p) - count(r, p)
                q_low = count(h, p - 1) - count(r, p - 1)
                assert q_high <= q_low, (n, p, v, q_high, q_low)
                term = delta(h, p - 1) - delta(r, p - 1)
                assert term == q_high - q_low
                if delta(tree_poly(adj, full ^ (1 << v)), p) < 0:
                    selected += 1
        tree_rows.append(dict(order=n, samples=samples, eligible=eligible, leaves_checked=leaves_checked, selected=selected))
    return dict(status='no_counterexample_in_bounded_checks', exhaustive_order6_graphs=graphs,
                exhaustive_order6_mark_cases=marked_cases, gamma_ranks='0..500',
                gamma_min=gamma_min, random_tree_rows=tree_rows, seed=20260925)


if __name__ == '__main__':
    result = run()
    with open('INDEPENDENT-CHECK.json', 'w') as out:
        json.dump(result, out, indent=2)
        out.write('\n')
    print(json.dumps(result))
