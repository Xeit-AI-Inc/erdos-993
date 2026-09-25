#!/usr/bin/env python3
"""Exact finite rank check for a fresh 244-vertex bipartite sharpness target."""
from math import comb
import json


def tagged_count(m, j):
    # M_m has m independent edges. A tagged set contains one fixed endpoint.
    if j < 1 or j > m:
        return 0
    return comb(m - 1, j - 1) * 2 ** (j - 1)


def main():
    m = 122
    rows = []
    for k in range(1, m + 1):
        qk = tagged_count(m, k)
        qk1 = tagged_count(m, k + 1)
        lhs = k * qk1
        rhs = 2 * (m - k) * qk
        assert lhs == rhs
        if k in (1, 61, 121, 122):
            rows.append({"k": k, "q_k": qk, "q_k_plus_1": qk1,
                         "lhs": lhs, "rhs": rhs})
    print(json.dumps({"graph": "122 disjoint edges", "order": 244,
                      "alpha": m, "tag": "one fixed endpoint",
                      "ranks_checked": [1, m], "equalities": m,
                      "sample_rows": rows}, indent=2))


if __name__ == "__main__":
    main()
