"""Independent exact checks for C4 shifted-deck critique."""
from math import comb
from fractions import Fraction
import json


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def add(a, b):
    return [coeff(a, k) + coeff(b, k) for k in range(max(len(a), len(b)))]


def scale(a, c):
    return [c * x for x in a]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, u in enumerate(a):
        for j, v in enumerate(b):
            out[i + j] += u * v
    return out


def monomial_power_binomial(r):
    # Coefficients in z, not in L=1+z.
    return [comb(r, k) + int(k == 1) for k in range(r + 1)]


def F(r):
    # F_r = sum_{h=0}^{r-2} (1+z)^h, expanded in z.
    return [sum(comb(h, k) for h in range(r - 1)) for k in range(r - 1)]


def product(polys):
    out = [1]
    for p in polys:
        out = mul(out, p)
    return out


def literal_tree_poly(rs, deleted=None):
    # Tree edges: path 0-1-2; each branch center attaches to 0,
    # with its r private leaves. Independence polynomial by rooted DP.
    adj = [[] for _ in range(3 + sum(r + 1 for r in rs))]
    def edge(u, v):
        adj[u].append(v)
        adj[v].append(u)
    edge(0, 1)
    edge(1, 2)
    c = 3
    for r in rs:
        edge(0, c)
        for t in range(c + 1, c + r + 1):
            edge(c, t)
        c += r + 1

    def rec(v, parent):
        out_poly, in_poly = [1], [0, 1]
        for w in adj[v]:
            if w == parent or w == deleted:
                continue
            child_out, child_in = rec(w, v)
            out_poly = mul(out_poly, add(child_out, child_in))
            in_poly = mul(in_poly, child_out)
        return out_poly, in_poly

    a, b = rec(0, -1)
    return add(a, b), adj


def factored(rs):
    n = sum(rs)
    Q = product([monomial_power_binomial(r) for r in rs])
    C = mul([1, 2], Q)
    P = add(C, [0] + [comb(n + 1, k) for k in range(n + 2)])
    Ais = {}
    for i, r in enumerate(rs):
        others = rs[:i] + rs[i + 1:]
        core = mul(mul([1, 2], monomial_power_binomial(r - 1)),
                   product([monomial_power_binomial(s) for s in others]))
        Ai = add(core, [0] + [comb(n, k) for k in range(n + 1)])
        Ais[i] = Ai
    Q0 = mul([1, 1], Q)
    A0 = add(Q0, [0] + [comb(n, k) for k in range(n + 1)])
    W = [0]
    for i, r in enumerate(rs):
        W = add(W, scale(Ais[i], r))
    return n, C, P, W, A0, Ais


def first_strict_descent(P):
    # Zero extension includes the terminal degree difference.
    for k in range(len(P) + 1):
        if coeff(P, k + 1) - coeff(P, k) < 0:
            return k
    raise AssertionError("no strict descent")


def row(rs, p):
    n, C, P, W, A0, Ais = factored(rs)
    x = first_strict_descent(P)
    alpha, q, j = n + 2, n + 1, p - 2
    guards = [x + 2 <= p, 3 * p < 2 * alpha + 1,
              2 * p <= alpha, 1 <= p, 2 * p <= n + 2]
    assert all(guards)
    literal, adj = literal_tree_poly(rs)
    assert literal == P
    literal_endpoint, _ = literal_tree_poly(rs, deleted=2)
    assert literal_endpoint == A0
    # Locate final tip in final branch and verify its actual deletion polynomial.
    deleted_tip = len(adj) - 1
    literal_deleted, _ = literal_tree_poly(rs, deleted_tip)
    assert literal_deleted == Ais[len(rs) - 1]
    e0 = coeff(A0, p + 1) - coeff(A0, p) < 0
    ei = [coeff(Ais[i], p + 1) - coeff(Ais[i], p) < 0 for i in range(len(rs))]
    R = sum(rs[i] for i, e in enumerate(ei) if e)
    b = int(e0) + R
    # T_i is the core term of Ai before its common z L^N summand.
    marked = 0
    branch_checks = []
    for i, e in enumerate(ei):
        if e:
            r = rs[i]
            Ti = mul(mul([1, 2], F(r)),
                     product([monomial_power_binomial(s) for h, s in enumerate(rs) if h != i]))
            D = comb(n, j + 1) - comb(n, j)
            delta = q - j
            branch_checks.append(2 * coeff(Ti, j) - 3 * delta * D)
            marked += r * coeff(Ti, j)
    delta = q - j
    D = comb(n, j + 1) - comb(n, j)
    weighted_margin = coeff(C, p) * coeff(W, p) - coeff(C, p - 1) * coeff(W, p + 1)
    endpoint_margin = coeff(C, p) * coeff(A0, p) - coeff(C, p - 1) * coeff(A0, p + 1)
    tip_deltas = [coeff(Ais[i], p + 1) - coeff(Ais[i], p) for i in range(len(rs))]
    assert coeff(W, p + 1) - coeff(W, p) == sum(rs[i] * tip_deltas[i] for i in range(len(rs)))
    t = Fraction(coeff(C, j + 1), coeff(C, j))
    ratio_factor = 1 - t + t / delta
    mass_margin = marked - b * delta * D
    ratio_margin = ratio_factor * marked - b * D
    assert coeff(C, p - 1) > coeff(C, p) > 0
    assert coeff(W, p) > 0
    assert weighted_margin >= 0
    assert endpoint_margin >= 0
    assert R > 0 and any(ei)
    assert all(v >= 0 for v in branch_checks)
    assert ratio_factor > 0 and ratio_margin >= 0
    return {
        "counts_2_3_4": [rs.count(2), rs.count(3), rs.count(4)],
        "m": len(rs), "N": n, "n_tree": len(adj), "alpha": alpha,
        "first_strict_descent_x": x, "p": p, "j": j, "delta": delta,
        "guards": {"x+2<=p": guards[0], "3p<2alpha+1": guards[1],
                   "2p<=alpha": guards[2], "1<=p": guards[3],
                   "2p<=N+2": guards[4]},
        "C_p_minus_1": coeff(C, p - 1), "C_p": coeff(C, p),
        "weighted_shift_margin": weighted_margin,
        "endpoint_shift_margin": endpoint_margin,
        "tip_selector_by_branch": ei, "endpoint_selector": e0,
        "tip_delta_by_branch": tip_deltas,
        "W_delta_identity_exact": True,
        "selected_original_tip_weight_R": R, "b_original_tags": b,
        "branchwise_3half_margins": branch_checks,
        "selected_A": marked, "selected_mass_margin": mass_margin,
        "t_numerator": coeff(C, j + 1), "t_denominator": coeff(C, j),
        "ratio_factor_exact": str(ratio_factor),
        "ratio_payment_margin_exact": str(ratio_margin),
        "literal_parent_and_tip_deletion_match": True,
        "literal_endpoint_deletion_matches_A0": True,
    }


assert monomial_power_binomial(2) == [1, 3, 1]
assert monomial_power_binomial(3) == [1, 4, 3, 1]
assert monomial_power_binomial(4) == [1, 5, 6, 4, 1]
checks = [row([4] * 40, 80), row([4] * 40, 81), row([2, 3] + [4] * 30, 63)]
out = {"scope": "Independent exact boundary/interior arithmetic; not universal proof.",
       "monomial_B_coefficients": {str(r): monomial_power_binomial(r) for r in (2, 3, 4)},
       "rows": checks,
       "direction_substitution": {
           "weighted_order": "C[p]W[p]-C[p-1]W[p+1]>=0 with C[p]<C[p-1], W[p]>0 implies W[p+1]<W[p]",
           "payment": "(1-t+t/delta)*delta = 1+(delta-1)*(1-t)>=1 for delta>=1 and 0<t<1",
           "negative_factor_rule": "multiplying an inequality by a negative number reverses its direction; this proof multiplies only by positive C coefficients, positive selector weights, delta, and 1-t+t/delta"
       }}
with open("independent_audit.json", "w") as f:
    json.dump(out, f, indent=2)
print(json.dumps({"rows": len(checks), "all_exact_checks_passed": True,
                  "weighted_margins": [x["weighted_shift_margin"] for x in checks],
                  "mass_margins": [x["selected_mass_margin"] for x in checks]}, indent=2))
