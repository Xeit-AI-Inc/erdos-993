#!/usr/bin/env python3
"""Independent exact targeted adjudication of the allowed C2-T routes."""
import json
from fractions import Fraction
from math import comb, factorial


def choose(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for h, y in enumerate(b):
            out[i + h] += x * y
    return out


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def diff(a, k):
    return coeff(a, k + 1) - coeff(a, k)


def power_l(n):
    return [comb(n, k) for k in range(n + 1)]


def branch(r):
    out = power_l(r)
    out[1] += 1
    return out


def mark(r):
    out = [0]
    for h in range(r - 1):
        out = add(out, power_l(h))
    return out


def product(arities):
    out = [1]
    for r in arities:
        out = mul(out, branch(r))
    return out


def rational_lower(others, k, degree=4):
    m = sum(others)
    if not 0 <= k <= m:
        return Fraction(0)
    den = choose(m, k)
    exponent = sum((Fraction(2 * r * choose(m-r, k-1), (2*r+1) * den)
                    for r in others), Fraction(0))
    return den * sum((exponent**v / factorial(v) for v in range(degree+1)), Fraction(0))


def audit(counts, chosen_p=None):
    arities = sum(([r] * counts[r-2] for r in (2, 3, 4)), [])
    n = sum(arities)
    q, alpha = n+1, n+2
    Q = product(arities)
    C = mul([1, 2], Q)
    P = add(C, [0] + power_l(q))
    x = next(k for k in range(len(P)) if diff(P, k) < 0)
    assert all(diff(P, k) >= 0 for k in range(x))
    assert 5*x > 2*n-1
    A0 = add(mul([1, 1], Q), [0] + power_l(n))
    classes = {}
    for r in (2, 3, 4):
        if counts[r-2]:
            others = arities.copy()
            others.remove(r)
            H = product(others)
            Ai = add(mul(mul([1, 2], branch(r-1)), H), [0]+power_l(n))
            T = mul(mul([1, 2], mark(r)), H)
            shifted = [0, 0, 0] + mul(mark(r), H)
            assert all(coeff(A0, k)-coeff(Ai, k) == coeff(shifted, k)
                       for k in range(max(len(A0), len(Ai), len(shifted))))
            classes[r] = (others, Ai, T, shifted)
    eligible = [p for p in range(x+2, n+4)
                if 3*p < 2*alpha+1 and 2*p <= alpha]
    if chosen_p is not None:
        assert chosen_p in eligible
        eligible = [chosen_p]
    rows = []
    for p in eligible:
        j, delta = p-2, q-(p-2)
        e0 = int(diff(A0, p) < 0)
        flags = {r: int(diff(classes[r][1], p) < 0) for r in classes}
        b = e0 + sum(r*counts[r-2]*flags[r] for r in classes)
        A = sum(r*counts[r-2]*flags[r]*coeff(classes[r][2], j) for r in classes)
        D = choose(n, j+1)-choose(n, j)
        beta = choose(q, x)-choose(q, x-1)
        t = Fraction(coeff(C, j+1), coeff(C, j))
        v = Fraction(beta, coeff(C, x))
        kappa = 1-t+t/delta
        old_bound = v + Fraction(1, delta)
        repaired = v + (1-v)/delta
        lowerA = sum((r*counts[r-2]*flags[r] *
                     sum(coeff(mul([1, 2], mark(r)), s) * rational_lower(classes[r][0], j-s)
                         for s in range(len(mul([1, 2], mark(r)))))
                     for r in classes), Fraction(0))
        data = dict(p=p, j=j, delta=delta, e0=e0,
                    branch_flags={str(r): flags[r] for r in classes}, b=b,
                    Cj=str(coeff(C,j)), Cj1=str(coeff(C,j+1)),
                    D=str(D), A=str(A), t=str(t), beta_over_Cx=str(v),
                    kappa=str(kappa), old_bound=str(old_bound),
                    repaired_bound=str(repaired), old_bound_valid=kappa>old_bound,
                    repaired_bound_valid=kappa>repaired,
                    payment_margin=str((delta*coeff(C,j)-(delta-1)*coeff(C,j+1))*A
                                       -b*delta*D*coeff(C,j)),
                    mass_margin=str(A-b*delta*D),
                    degree4_lower_A=str(lowerA),
                    repaired_scalar_margin=str(repaired*lowerA-b*D),
                    endpoint_slope=str(diff(A0,p)),
                    class_slopes={str(r): str(diff(classes[r][3],p)) for r in classes})
        if counts == (0, 0, 173) and p == 338:
            # Empty and singleton center-choice layers for one arity-4 mark.
            r = 4
            others = classes[r][0]
            gf = mul([1, 2], mark(r))
            M = sum(others)
            truncated = sum(gf[s]*(choose(M, j-s) +
                            len(others)*choose(M-r, j-s-1)) for s in range(len(gf)))
            truncA = r*counts[r-2]*truncated
            data['truncated_Tj'] = str(truncated)
            data['truncated_payment_margin'] = str(
                (delta*coeff(C,j)-(delta-1)*coeff(C,j+1))*truncA
                -b*delta*D*coeff(C,j))
        rows.append(data)
    return dict(counts=list(counts), m=len(arities), N=n, alpha=alpha,
                x=x, eligible_p=eligible, rows=rows)


def occupancy_check():
    checked = 0
    for counts in ((1,0,0),(0,1,0),(0,0,1),(1,1,1),(2,2,1)):
        arities = sum(([r]*counts[r-2] for r in (2,3,4)), [])
        M = sum(arities)
        Q = product(arities)
        for u in range(M+1):
            # Exact subset expansion, distinct from the polynomial multiplication above.
            weighted = 0
            for mask in range(1 << len(arities)):
                selected = [arities[i] for i in range(len(arities)) if mask & (1 << i)]
                weighted += choose(M-sum(selected), u-len(selected))
            assert weighted == coeff(Q,u)
            checked += 1
    return checked


if __name__ == '__main__':
    out = {'occupancy_coefficients_checked': occupancy_check(),
           'controls': [audit((0,12,10),39), audit((0,10,13),42),
                        audit((1,8,14),42), audit((0,38,0),57),
                        audit((0,0,173),338)]}
    with open('independent_audit.json','w') as f:
        json.dump(out,f,indent=2,sort_keys=True)
    print('exact independent controls:',len(out['controls']),
          'occupancy coefficients:',out['occupancy_coefficients_checked'])
