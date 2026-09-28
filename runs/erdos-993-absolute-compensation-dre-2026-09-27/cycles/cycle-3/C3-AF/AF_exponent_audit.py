"""Exact checks of the repaired adjacent-arity exponent identity."""
from fractions import Fraction
from math import comb
from pathlib import Path
import json


def g(M, k, r):
    top = comb(M - r, k - 1) if 0 <= k - 1 <= M - r else 0
    return Fraction(2 * r * top, (2 * r + 1) * comb(M, k))


checked = 0
minimum_f = None
for M in range(10, 201):
    for k in range((M + 2) // 3, M):
        u = M - k - 1
        v = 3 * k - M
        f = 63 * (M - 2) * (M - 3) - 135 * u * (M - 3) + 70 * u * (u - 1)
        d = M - 10
        assert 9 * f == (37 * d * d + 290 * d + 217 +
                         v * (125 * M - 585) + 70 * v * v)
        assert g(M, k, 2) - 2 * g(M, k, 3) + g(M, k, 4) == Fraction(
            4 * k * (M - k) * f, 315 * M * (M - 1) * (M - 2) * (M - 3))
        assert f > 0
        checked += 1
        if minimum_f is None or f < minimum_f:
            minimum_f = f
    assert g(M, M, 2) == g(M, M, 3) == g(M, M, 4) == 0

out = dict(checked_nonterminal_pairs=checked, minimum_f=minimum_f,
           terminal_equalities=191)
Path('AF_exponent_evidence.json').write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps(out))
