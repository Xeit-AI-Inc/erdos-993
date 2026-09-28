"""Exact arithmetic checks for the proposed MASS -> payment composition."""
from fractions import Fraction

# Source intervals cover every m; inspect boundaries and representative points.
for m in (1, 21, 22, 69, 70, 80, 81, 119, 120, 237, 238, 265, 266, 10000):
    assert (m <= 80) or (42 <= m <= 265) or (m >= 266)
    assert (m <= 69) or (70 <= m <= 119) or (m >= 120)
    if m >= 70:
        assert (m <= 80) or (81 <= m <= 265) or (m >= 266)

# Full selection gives b=N+1 and A >= (3/2)N delta D. For every path-star,
# N>=2, so that lower bound dominates (N+1)delta D.
for N in (2, 3, 4, 138, 140, 236, 238, 474, 950, 10000):
    assert 3 * N >= 2 * (N + 1)

# 2p<=alpha (alpha=N+2) implies 3p<2alpha+1, D_j>0, and delta>1.
for N in (2, 3, 4, 76, 138, 140, 236, 238, 474, 10000):
    alpha = N + 2
    for p in (0, max(0, alpha // 2 - 1), alpha // 2):
        assert 2 * p <= alpha
        assert 3 * p < 2 * alpha + 1
        j = p - 2
        if j >= 0:
            assert N - 2 * j - 1 > 0
        assert N + 3 - p > 1

# For 0<t<1 and delta>1, kappa=1-t+t/delta satisfies
# kappa-1/delta=(1-t)(1-1/delta)>0, so MASS implies payment.
for delta in (2, 3, 4, 60, 120, 355):
    for t in (Fraction(1, 1000), Fraction(1, 2), Fraction(999, 1000)):
        kappa = 1 - t + t / delta
        assert kappa - Fraction(1, delta) == (1 - t) * (1 - Fraction(1, delta)) > 0
        for b, D in ((0, 1), (1, 1), (1, 9), (689, 10001)):
            A = b * delta * D
            assert kappa * A >= b * D

# Actual m>=70 has N>=2m and M=N-r. Thus M>=10 and N>=10r-12
# for each r=2,3,4, the supplied sufficient GF_r shift guard.
for m in (70, 80, 119, 120, 237, 238, 10000):
    for r in (2, 3, 4):
        N, M = 2 * m, 2 * m - r
        assert M >= 10 and N >= 10 * r - 12
print('composition implications and interval/guard checks passed')
