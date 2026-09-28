#!/usr/bin/env python3
"""Exact coefficient-conditioned occupancy-drift probe for Cycle 4 U1."""
from fractions import Fraction
from itertools import product
from math import comb


def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, v in enumerate(a):
        c[i] += v
    for i, v in enumerate(b):
        c[i] += v
    return trim(c)


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return trim(c)


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def delta(a, k):
    return coeff(a, k + 1) - coeff(a, k)


def choose(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def power(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


L = [1, 1]
G = [1, 2]


def B(r):
    return add([comb(r, k) for k in range(r + 1)], [0, 1])


def divide_by_B(poly, r):
    """Exact coefficient recurrence for division by B_r, whose constant is 1."""
    b = B(r)
    q = [0] * len(poly)
    for n in range(len(poly)):
        q[n] = poly[n] - sum(b[t] * q[n - t]
                              for t in range(1, min(len(b) - 1, n) + 1))
    return trim(q)


def family(rs):
    qpoly = [1]
    for r in rs:
        qpoly = mul(qpoly, B(r))
    cpoly = mul(G, qpoly)
    n = sum(rs)
    ppoly = add(cpoly, mul([0, 1], power(L, n + 1)))
    return qpoly, cpoly, ppoly


def first_strict_descent(a):
    # Range includes the last nonzero coefficient, hence the terminal difference.
    for k in range(len(a)):
        if coeff(a, k + 1) < coeff(a, k):
            return k
    raise AssertionError("nonzero finite sequence has a terminal strict descent")


def eligible_p_values(N, x):
    # Integer upper bounds are only loop bounds; the three strict/weak guards
    # are checked literally below.
    return [p for p in range(x + 2, (N + 2) // 2 + 1)
            if 3 * p < 2 * (N + 2) + 1 and 2 * p <= N + 2]


def conditioned_drift_numerator(rs, k, qpoly=None):
    """Return numerator and C[k] for E_k D, using exact state coefficients."""
    if qpoly is None:
        qpoly = [1]
        for r in rs:
            qpoly = mul(qpoly, B(r))
    cpoly = mul(G, qpoly)
    # Root state zero has coefficient Q[k]. For a branch of arity r,
    # its contribution numerator is (G H_r)[k]-(r-1)(G H_r)[k-1].
    value = Fraction(coeff(qpoly, k), 1)
    for r in (2, 3, 4):
        multiplicity = rs.count(r)
        if multiplicity:
            gh = mul(G, divide_by_B(qpoly, r))
            value += multiplicity * (coeff(gh, k) - (r - 1) * coeff(gh, k - 1))
    return value, coeff(cpoly, k)


def fugacity_one_drift(rs):
    return Fraction(1, 3) + sum((Fraction(2 - r, 2**r + 1) for r in rs), Fraction(0))


def bounded_search():
    checked = 0
    checked_with_eligible_p = 0
    for m in range(1, 41):
        for a2 in range(m + 1):
            for a3 in range(m - a2 + 1):
                a4 = m - a2 - a3
                rs = [2] * a2 + [3] * a3 + [4] * a4
                qpoly, cpoly, ppoly = family(rs)
                x = first_strict_descent(ppoly)
                N = sum(rs)
                ps = eligible_p_values(N, x)
                if not ps:
                    continue
                checked += 1
                checked_with_eligible_p += 1
                numerator, denominator = conditioned_drift_numerator(rs, x, qpoly)
                conditional = numerator / denominator
                # Exact coefficient identity for D at rank x.
                identity_value = Fraction((x + 1) * coeff(cpoly, x + 1), denominator) - (N + 1 - x)
                assert conditional == identity_value
                if conditional > fugacity_one_drift(rs):
                    return {
                        "m": m, "counts": (a2, a3, a4), "N": N, "x": x,
                        "eligible_p": ps, "C[x]": denominator,
                        "conditional_D": str(conditional),
                        "fugacity1_D": str(fugacity_one_drift(rs)),
                        "difference": str(conditional - fugacity_one_drift(rs)),
                    }
    return {"checked_profiles_with_eligible_p": checked_with_eligible_p,
            "result": "no upward discrepancy at x for m<=40"}


def detailed_row():
    rs = [3] * 12 + [4] * 10
    N = sum(rs)
    q = N + 1
    alpha = N + 2
    qpoly, cpoly, ppoly = family(rs)
    x = first_strict_descent(ppoly)
    p = x + 2
    j = p - 2
    delta_rank = q - j
    beta = choose(q, x) - choose(q, x - 1)

    A0 = add(mul(L, qpoly), mul([0, 1], power(L, N)))
    selectors = {"endpoint": int(delta(A0, p) < 0)}
    for r in (3, 4):
        h = divide_by_B(qpoly, r)
        ai = add(mul(mul(G, B(r - 1)), h), mul([0, 1], power(L, N)))
        selectors[f"r{r}"] = int(delta(ai, p) < 0)
    b = selectors["endpoint"] + 12 * 3 * selectors["r3"] + 10 * 4 * selectors["r4"]

    tip_coefficients = {}
    mass = 0
    for r, multiplicity in ((3, 12), (4, 10)):
        h = divide_by_B(qpoly, r)
        f = [0]
        for degree in range(r - 1):
            f = add(f, power(L, degree))
        ti = mul(mul(G, f), h)
        tip_coefficients[r] = coeff(ti, j)
        mass += multiplicity * r * selectors[f"r{r}"] * coeff(ti, j)

    debt = choose(N, j + 1) - choose(N, j)
    primary_margin = ((delta_rank * coeff(cpoly, j)
                       - (delta_rank - 1) * coeff(cpoly, j + 1)) * mass
                      - b * delta_rank * debt * coeff(cpoly, j))
    drift_num, cx = conditioned_drift_numerator(rs, x, qpoly)
    conditional = drift_num / cx
    fugacity = fugacity_one_drift(rs)
    drift_bound = (Fraction(2 * j - N, 1)
                   - Fraction((j + 1) * beta, coeff(cpoly, x)))
    return {
        "counts_(a2,a3,a4)": (0, 12, 10), "m": 22, "n": N + 2,
        "N": N, "alpha": alpha, "q": q, "x": x, "p": p, "j": j,
        "delta": delta_rank,
        "guards": {"x+2<=p": x + 2 <= p,
                   "3p<2alpha+1": 3 * p < 2 * alpha + 1,
                   "2p<=alpha": 2 * p <= alpha},
        "selectors_at_p": selectors, "b": b,
        "C[x]": coeff(cpoly, x), "Delta_x_C": delta(cpoly, x),
        "beta=Delta_x(zL^q)": beta,
        "E_x[D]": str(conditional), "E_fugacity1[D]": str(fugacity),
        "E_x[D]-E_1[D]": str(conditional - fugacity),
        "strict_bound_for_E_j[D]": str(drift_bound), "2j-N": 2 * j - N,
        "C[j]": coeff(cpoly, j), "C[j+1]": coeff(cpoly, j + 1),
        "D_j": debt, "T_i[j]_by_r": tip_coefficients, "A": mass,
        "signed_primary_target_margin": primary_margin,
    }


if __name__ == "__main__":
    print("Finite search:", bounded_search())
    print("Detailed eligible row:", detailed_row())
