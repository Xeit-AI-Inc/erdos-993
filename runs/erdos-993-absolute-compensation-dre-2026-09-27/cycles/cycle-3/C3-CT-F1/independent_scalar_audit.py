"""Independent exact-rational audit of C3 balanced scalar certificate."""
from fractions import Fraction
from functools import lru_cache
from math import comb, factorial
import json

SCALE = 1000
DEGREE = 12
GF = {2: (1, 2), 3: (2, 5, 2), 4: (3, 9, 7, 2)}

@lru_cache(None)
def exp_taylor_lower(e_millis):
    x = Fraction(e_millis, SCALE)
    # Positive Maclaurin partial sum is a lower bound for exp(x), x >= 0.
    return sum((x**h / factorial(h) for h in range(DEGREE + 1)), Fraction(0))

def exponent_floor_millis(branches, tips, rank):
    # Compute the adjacent-arity minimizing mixture using direct binomial
    # definitions of g_r, independently of the producer's falling-factorial formula.
    if 2 * branches <= tips <= 3 * branches:
        counts = (3 * branches - tips, tips - 2 * branches, 0)
    elif 3 * branches <= tips <= 4 * branches:
        counts = (0, 4 * branches - tips, tips - 3 * branches)
    else:
        raise AssertionError((branches, tips, rank))
    exponent = Fraction(0)
    for r, count in zip((2, 3, 4), counts):
        if count:
            top = comb(tips-r, rank-1) if 0 <= rank-1 <= tips-r else 0
            exponent += count * Fraction(2*r, 2*r+1) * Fraction(top, comb(tips, rank))
    assert exponent >= 0
    return (SCALE * exponent.numerator) // exponent.denominator

def audit():
    total = excluded = 0
    rows = []
    min_margin = None
    min_witness = None
    for m in range(70, 120):
        count = omitted = 0
        local_min = None
        local_arg = None
        for N in range(2*m, 4*m+1):
            lower_j = (2*N-1)//5 + 1  # strict 5j > 2N-1
            upper_j = (N-2)//2        # 2j <= N-2
            for r, coeffs in GF.items():
                M = N-r
                if not (2*(m-1) <= M <= 4*(m-1)):
                    continue
                for j in range(lower_j, upper_j+1):
                    # The certificate needs every nonzero GF shift in-range.
                    shifts = []
                    bad = False
                    for s, c in enumerate(coeffs):
                        if c == 0:
                            continue
                        k = j-s
                        if M < 10 or k < 0 or k > M or 3*k < M:
                            bad = True
                        shifts.append((s, c, k))
                    if bad:
                        omitted += 1
                        continue
                    left = Fraction(0)
                    for s, c, k in shifts:
                        e = exponent_floor_millis(m-1, M, k)
                        qratio = Fraction(comb(M, k), comb(N, j))
                        left += c * qratio * exp_taylor_lower(e)
                    right = Fraction(3*(N+1-j)*(N-2*j-1), 2*(j+1))
                    margin = left-right
                    assert margin > 0, (m, N, r, j, margin)
                    count += 1
                    if local_min is None or margin < local_min:
                        local_min, local_arg = margin, (N,r,j)
                    if min_margin is None or margin < min_margin:
                        min_margin, min_witness = margin, (m,N,r,j)
        rows.append({"m": m, "tested": count, "excluded": omitted,
                     "minimum_margin": {"numerator": str(local_min.numerator) if local_min else None,
                                        "denominator": str(local_min.denominator) if local_min else None},
                     "minimizer": local_arg})
        total += count
        excluded += omitted
    assert total == 799895 and excluded == 0, (total, excluded)
    return {"method": "direct math.comb and fractions.Fraction; degree-12 positive Taylor sum",
            "domain": "m=70..119; N=2m..4m; r=2,3,4; feasibility 2(m-1)<=N-r<=4(m-1); strict 5j>2N-1; 2j<=N-2; every nonzero GF shift",
            "tested_states": total, "excluded_states": excluded,
            "global_minimum_margin": {"numerator": str(min_margin.numerator), "denominator": str(min_margin.denominator)},
            "minimum_at_m_N_r_j": min_witness, "rows": rows}

if __name__ == '__main__':
    print(json.dumps(audit(), indent=2))
