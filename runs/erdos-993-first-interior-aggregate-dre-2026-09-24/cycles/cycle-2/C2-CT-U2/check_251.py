#!/usr/bin/env python3
"""Exact independent-tree check of T_62, using a copied DP evaluator."""
import json
from collections import Counter

from origin_dp_copy import build, forest_independence_polynomial, alpha, delta, first_descent, poly_add, poly_mul


def main():
    m = 62
    adj, edges, leaves = build(m)
    vertices = set(range(len(adj)))
    full = forest_independence_polynomial(adj, vertices)
    star = [1, 4, 3, 1]  # (1+z)^3+z
    star_power = [1]
    leaf_power = [1]
    for _ in range(m):
        star_power = poly_mul(star_power, star)
    for _ in range(3*m+1):
        leaf_power = poly_mul(leaf_power, [1, 1])
    closed_form = poly_add(poly_mul([1, 2], star_power), [0] + leaf_power)
    assert full == closed_form
    a = alpha(full)
    p = a - 2
    x = first_descent(full, a)
    assert len(edges) == len(adj) - 1
    assert len(leaves) == 3*m + 1
    assert len(adj) == 4*m + 3
    assert a == 3*m + 2
    assert x + 2 <= p
    rows = []
    for v, s in leaves:
        del_v = forest_independence_polynomial(adj, vertices - {v})
        H = forest_independence_polynomial(adj, vertices - {v, s})
        R = forest_independence_polynomial(adj, vertices - ({s} | adj[s]))
        assert del_v == poly_add(H, [0] + R)
        rows.append((delta(del_v, p), delta(H, p - 1) - delta(R, p - 1)))
    favorable = [(selector, term) for selector, term in rows if selector < 0]
    result = {
        "construction": "root 0; arm edges (0,1),(1,2); for j=0..61 center c=3+4j linked to root and to c+1,c+2,c+3",
        "m": m, "order": len(adj), "edges": len(edges), "leaf_tags": len(leaves),
        "alpha": a, "p": p, "x": x, "eligible": x + 2 <= p,
        "terminal_delta_alpha": delta(full, a),
        "selector_term_multiplicities": [
            {"selector": selector, "term": term, "multiplicity": count}
            for (selector, term), count in sorted(Counter(rows).items())
        ],
        "favorable_count": len(favorable),
        "complete_favorable_sum": sum(term for _, term in favorable),
        "all_favorable_terms_nonpositive": all(term <= 0 for _, term in favorable),
    }
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
