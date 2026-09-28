"""Independent exact check of C4-U1 drift formulas and m<=40 evidence."""
from fractions import Fraction
from math import comb


def conv(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, v in enumerate(a): out[i] += v
    for i, v in enumerate(b): out[i] += v
    return out


def at(a, k):
    return a[k] if 0 <= k < len(a) else 0


def first_drop(a):
    return next(k for k in range(len(a)) if at(a, k + 1) < at(a, k))


def power(a, n):
    out = [1]
    for _ in range(n): out = conv(out, a)
    return out


def eligible(N, x):
    return [p for p in range(x + 2, N + 3)
            if 3*p < 2*(N + 2) + 1 and 2*p <= N + 2]

L = [1, 1]
G = [1, 2]
B = {r: add([comb(r, t) for t in range(r + 1)], [0, 1]) for r in (2, 3, 4)}
BP = {r: [[1] if n == 0 else None for n in range(1)] for r in ()}
# Cache all small powers; profiles depend only on multiplicity counts.
PWR = {r: [[1]] for r in (2, 3, 4)}
for r in PWR:
    for n in range(1, 41): PWR[r].append(conv(PWR[r][-1], B[r]))

checked = 0
first_interior = None
for m in range(1, 41):
    for a2 in range(m + 1):
        for a3 in range(m - a2 + 1):
            a4 = m - a2 - a3
            N = 2*a2 + 3*a3 + 4*a4
            Q = conv(conv(PWR[2][a2], PWR[3][a3]), PWR[4][a4])
            C = conv(G, Q)
            P = add(C, conv([0, 1], power(L, N + 1)))
            x = first_drop(P)
            ps = eligible(N, x)
            if not ps: continue
            checked += 1
            ratio = Fraction((x + 1)*at(C, x + 1), at(C, x))
            drift = ratio - (N + 1 - x)
            fugacity = Fraction(1, 3) + sum((Fraction(2-r, 2**r+1) * a
                                                  for r, a in ((2,a2),(3,a3),(4,a4))), Fraction(0))
            assert drift <= fugacity, (m, a2, a3, a4, x, drift, fugacity)
            beta = comb(N + 1, x) - (comb(N + 1, x - 1) if x else 0)
            assert beta > 0
            assert at(C, x) > 0 and at(C, x+1) > 0
            for p in ps:
                j = p - 2
                assert j >= x
                lhs_ratio = Fraction(at(C, j+1), at(C, j))
                rhs_ratio = Fraction(at(C, x+1), at(C, x))
                assert lhs_ratio <= rhs_ratio
                strict_rhs = Fraction(2*j-N, 1) - Fraction((j+1)*beta, at(C, x))
                drift_j = Fraction((j+1)*at(C,j+1), at(C,j)) - (N+1-j)
                assert drift_j < strict_rhs < 2*j-N
                if j > x and first_interior is None:
                    first_interior = (a2,a3,a4,N,x,p,j,str(drift_j),str(strict_rhs))

print({"checked_profiles_with_eligible_p": checked,
       "bounded_claim_no_E_xD_above_fugacity": True,
       "first_interior_substitution": first_interior})

# Exact boundary substitution for the detailed (0,12,10) report row.
a2,a3,a4=0,12,10
N=76
Q=conv(conv(PWR[2][a2],PWR[3][a3]),PWR[4][a4])
C=conv(G,Q)
P=add(C,conv([0,1],power(L,N+1)))
x=first_drop(P); p=x+2; j=p-2
beta=comb(N+1,x)-comb(N+1,x-1)
left=Fraction((x+1)*at(C,x+1),at(C,x))-(N+1-x)
right=Fraction(2*j-N,1)-Fraction((j+1)*beta,at(C,x))
assert (x,p,j)==(37,39,37)
assert left < right < 2*j-N
print({"boundary_profile": [a2,a3,a4], "x_p_j": [x,p,j],
       "drift_j": str(left), "strict_bound": str(right), "rank_bound": 2*j-N})
