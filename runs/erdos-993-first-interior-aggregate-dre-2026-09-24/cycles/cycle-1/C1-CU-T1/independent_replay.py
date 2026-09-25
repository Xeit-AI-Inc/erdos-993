"""Independent symbolic coefficient checks for the two C1-T1 examples.

No admitted evaluator is imported. Path counts use the closed binomial formula;
the T_m calculation uses direct vertex-state factorization at the root.
"""

from math import comb


def add(*polys):
    out = [0] * max(map(len, polys))
    for poly in polys:
        for j, value in enumerate(poly):
            out[j] += value
    return out


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for j, x in enumerate(a):
        for k, y in enumerate(b):
            out[j + k] += x * y
    return out


def power(poly, n):
    out = [1]
    for _ in range(n):
        out = mul(out, poly)
    return out


def delta(poly, k):
    def coefficient(j):
        return poly[j] if 0 <= j < len(poly) else 0
    return coefficient(k + 1) - coefficient(k)


def alpha(poly):
    return max(k for k, c in enumerate(poly) if c)


def first_descent(poly):
    return next(k for k in range(alpha(poly) + 1) if delta(poly, k) < 0)


def path(n):
    return [comb(n - k + 1, k) for k in range((n + 1) // 2 + 1)]


def row(name, original, h, r, direct_deleted, multiplicity):
    a = alpha(original)
    p = a - 2
    x = first_descent(original)
    selector = delta(h, p) + delta(r, p - 1)
    summand = delta(h, p - 1) - delta(r, p - 1)
    assert add(h, mul([0, 1], r)) == direct_deleted
    direct_selector = delta(direct_deleted, p)
    assert selector == direct_selector
    return {
        "class": name, "alpha": a, "x": x, "p": p,
        "eligible": x + 2 <= p,
        "multiplicity": multiplicity,
        "selector": selector,
        "summand": summand,
        "contribution": multiplicity * summand if selector < 0 else 0,
        "A": delta(h, p), "B": delta(r, p - 1), "C": delta(h, p - 1),
    }


P60 = path(60)
path_row = row("P60 endpoint", P60, path(58), path(57), path(59), 2)

m = 60
one = [1, 1]
branch = add(power(one, 3), [0, 1])
all_branches = power(branch, m)
remaining_branches = power(branch, m - 1)
all_free_leaves = power(one, 3 * m)
T60 = add(mul([1, 2], all_branches), mul([0, 1], power(one, 3 * m + 1)))

# Delete marked leaf 2 and its support 1: root with m complete arms.
marked_h = add(all_branches, mul([0, 1], all_free_leaves))
# Delete the original closed neighborhood of support 1: m disjoint stars.
marked_r = all_branches
marked_deleted = add(mul(one, all_branches), mul([0, 1], all_free_leaves))
marked_row = row("T60 marked leaf", T60, marked_h, marked_r, marked_deleted, 1)

# Delete an arm leaf and its center: two formerly adjacent leaves become
# isolated. In R, root and the marked support are deleted; the marked
# leaf/support edge remains as P2 beside the other m-1 complete stars.
arm_h = add(
    mul(mul(power(one, 2), [1, 2]), remaining_branches),
    mul([0, 1], all_free_leaves),
)
arm_r = mul([1, 2], remaining_branches)
short_arm = add(power(one, 2), [0, 1])
arm_deleted = add(
    mul(mul([1, 2], short_arm), remaining_branches),
    mul([0, 1], all_free_leaves),
)
arm_row = row("T60 arm leaf", T60, arm_h, arm_r, arm_deleted, 3 * m)

for result in (path_row, marked_row, arm_row):
    print(result)
print("P60 sum", path_row["contribution"])
print("T60 sum", marked_row["contribution"] + arm_row["contribution"])
