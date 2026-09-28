"""Independent exact branch-local audit on all actual rows with m<=69."""
from functools import lru_cache
from math import comb
from pathlib import Path
import json

B = {2: (1, 3, 1), 3: (1, 4, 3, 1), 4: (1, 5, 6, 4, 1)}
GF = {2: (1, 2), 3: (2, 5, 2), 4: (3, 9, 7, 2)}


def product(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return tuple(out)


def coefficient_product(a, b, k):
    return sum(v * a[k - s] for s, v in enumerate(b) if 0 <= k - s < len(a))


@lru_cache(None)
def qpoly(c2, c3, c4):
    if c2 + c3 + c4 == 0:
        return (1,)
    if c2:
        return product(qpoly(c2 - 1, c3, c4), B[2])
    if c3:
        return product(qpoly(c2, c3 - 1, c4), B[3])
    return product(qpoly(c2, c3, c4 - 1), B[4])


profiles = rows = local_tests = failures = 0
minimum = None
for m in range(1, 70):
    for c2 in range(m + 1):
        for c3 in range(m - c2 + 1):
            counts = (c2, c3, m - c2 - c3)
            profiles += 1
            N = 2 * counts[0] + 3 * counts[1] + 4 * counts[2]
            alpha, q = N + 2, N + 1
            Q = qpoly(*counts)
            C = product(Q, (1, 2))
            P = tuple((C[k] if k < len(C) else 0) +
                      (comb(q, k - 1) if 1 <= k <= q + 1 else 0)
                      for k in range(q + 2))
            x = next(k for k in range(len(P)) if
                     (P[k + 1] if k + 1 < len(P) else 0) < P[k])
            branch = {}
            for r in (2, 3, 4):
                if counts[r - 2]:
                    c = list(counts)
                    c[r - 2] -= 1
                    branch[r] = qpoly(*c)
            for p in range(x + 2, alpha // 2 + 1):
                if not 3 * p < 2 * alpha + 1:
                    continue
                rows += 1
                j, delta = p - 2, q - (p - 2)
                D = comb(N, j + 1) - comb(N, j)
                assert D > 0
                for r, H in branch.items():
                    local_tests += 1
                    Tj = coefficient_product(H, GF[r], j)
                    margin = 2 * Tj - 3 * delta * D
                    failures += margin < 0
                    if minimum is None or margin < minimum['margin']:
                        minimum = dict(counts=counts, m=m, N=N, alpha=alpha,
                                       x=x, p=p, j=j, delta=delta, r=r,
                                       Tj=Tj, D=D, margin=margin)

out = dict(profiles=profiles, eligible_rows=rows, local_tests=local_tests,
           failures=failures, minimum=minimum)
assert profiles == 59639 and rows == 68129 and failures == 0
Path('AF_prefix_local_evidence.json').write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps(out))
