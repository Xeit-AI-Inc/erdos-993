#!/usr/bin/env python3
"""Exact recurrence audit for the self-built path P_1001."""
from math import comb
import json


def ipath(n):
    # Independent j-sets in P_n: choose j nonconsecutive positions among n.
    # Coefficients are exact integers; extend by zero outside [0, floor((n+1)/2)].
    return [comb(n-j+1, j) for j in range((n+1)//2 + 1)]


def coeff(poly, j):
    return poly[j] if 0 <= j < len(poly) else 0


def delta(poly, j):
    return coeff(poly, j+1) - coeff(poly, j)

n = 1001
alpha = (n+1)//2
p = alpha-2
poly_t = ipath(n)
# For either endpoint v, T-v=P_(n-1), H=P_(n-2), R=P_(n-3).
poly_minus_v = ipath(n-1)
poly_h = ipath(n-2)
poly_r = ipath(n-3)
x = next(j for j in range(alpha+1) if delta(poly_t, j) < 0)
selector = delta(poly_minus_v, p)
term_h = delta(poly_h, p-1)
term_r = delta(poly_r, p-1)
term = term_h-term_r
# At either endpoint, W is the endpoint of H, so q_j=i_j(H)-i_j(R).
# Check the double-count inequality at every eligible k and high-tail sign.
a_h = alpha-1
q = [coeff(poly_h,j)-coeff(poly_r,j) for j in range(a_h+2)]
shadow_checks = []
for k in range(1, a_h+1):
    lhs = k*q[k+1]
    rhs = 2*(alpha-1-k)*q[k]
    if lhs > rhs:
        raise AssertionError((k,lhs,rhs))
    if 3*k >= 2*(alpha-1) and q[k+1] > q[k]:
        raise AssertionError((k,q[k+1],q[k]))
    if k in (1, 498, 499, 500):
        shadow_checks.append({"k":k,"q_k":q[k],"q_k_plus_1":q[k+1],"lhs":lhs,"rhs":rhs,"high_tail":3*k>=2*(alpha-1)})
result = {
    "construction": "P_1001 with vertices 0..1000 and edges {i,i+1} for 0<=i<1000",
    "order": n,
    "alpha": alpha,
    "p": p,
    "x_first_strict_negative_including_terminal_alpha": x,
    "eligible": x+2 <= p,
    "original_leaf_tags": [0,1000],
    "support_by_tag": {"0": 1, "1000": 999},
    "deletion_binding_each_tag": "T-v=P_1000, H=P_999, R=P_998",
    "selector_delta_p_T_minus_v": selector,
    "favorable_tags": [0,1000] if selector < 0 else [],
    "delta_p_minus_1_H": term_h,
    "delta_p_minus_1_R": term_r,
    "term_each_favorable_tag": term,
    "tagged_shadow_q_at_primary_k": {"k":p-1,"q_k":q[p-1],"q_k_plus_1":q[p],"comparison":q[p] <= q[p-1]},
    "tagged_shadow_boundary_checks": shadow_checks,
    "tagged_shadow_full_checked_k_range": [1,a_h],
    "tagged_shadow_high_tail_checked_k_range": [334,a_h],
    "tagged_shadow_high_tail_rank_count": a_h-333,
    "tagged_shadow_all_k_inequality_holds": True,
    "tagged_shadow_high_tail_monotonicity_holds_for_k_ge_ceil_2a_minus_2_over_3": True,
    "complete_favorable_sum": 2*term if selector < 0 else 0,
    "checks": {
        "delta_at_x_minus_1_nonnegative": x == 0 or delta(poly_t,x-1) >= 0,
        "delta_at_x_negative": delta(poly_t,x) < 0,
        "terminal_delta_at_alpha": delta(poly_t,alpha),
        "both_original_tags_have_strict_selector": selector < 0,
        "sum_counts_each_original_tag_once": True,
    },
}
print(json.dumps(result, indent=2))
