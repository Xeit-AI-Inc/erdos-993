#!/usr/bin/env python3
"""Independent exact C6 finite-prefix coverage audit; counts only, no signs."""
from math import comb
import json


def direct_layer(m):
    profiles = tests = 0
    represented_weighted_N = 0
    odd_a3_types = 0
    for a2 in range(m + 1):
        for a3 in range(m - a2 + 1):
            a4 = m - a2 - a3
            counts = (a2, a3, a4)
            s = sum(v > 0 for v in counts)
            N = 2 * a2 + 3 * a3 + 4 * a4
            profiles += 1
            tests += s * ((N + 2) // 2)
            represented_weighted_N += s * N
            if a3 % 2:
                odd_a3_types += s
    return profiles, tests, represented_weighted_N, odd_a3_types


def closed_layer(m):
    S = 3 * comb(m + 1, 2)
    # By permutation symmetry, sum(s*a2)=sum(s*a3)=sum(s*a4)=m*S/3.
    # Therefore sum(s*N)=(2+3+4)m*S/3=3mS.
    if m % 2 == 0:
        u = m // 2
        O = 3 * u * u + u
    else:
        u = (m - 1) // 2
        O = (u + 1) * (3 * u + 1)
    tests = ((3 * m + 2) * S - O) // 2
    return comb(m + 2, 2), tests, 3 * m * S, O


def main():
    rows = []
    total_profiles = total_tests = 0
    for m in range(1, 100):
        direct = direct_layer(m)
        closed = closed_layer(m)
        assert direct == closed, (m, direct, closed)
        rows.append({"m": m, "profiles": direct[0], "represented_type_rank_tests": direct[1]})
        total_profiles += direct[0]
        total_tests += direct[1]
    assert total_profiles == 171699
    assert total_tests == 56245000
    assert sum(row["represented_type_rank_tests"] for row in rows[:20]) == 109175
    # Protocol control coverage: homogeneous (m=1,r=2) contributes k=1,2.
    assert 1 * ((2 + 2) // 2) == 2
    print(json.dumps({"grade": "independent exact coverage arithmetic only; no coefficient/sign tests",
                      "method": "direct compositions and per-profile represented types/ranks, cross-checked against closed forms for each m",
                      "rows": rows, "profiles": total_profiles, "tests": total_tests,
                      "tests_through_m20": 109175}, indent=2))

if __name__ == "__main__":
    main()
