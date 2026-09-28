"""Independent exact boundary and obstruction checks for C3-AF."""
from fractions import Fraction
from math import comb, factorial
from pathlib import Path
import json

B = {1: [1, 2], 2: [1, 3, 1], 3: [1, 4, 3, 1], 4: [1, 5, 6, 4, 1]}
GF = {2: [1, 2], 3: [2, 5, 2], 4: [3, 9, 7, 2]}


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def at(a, k):
    return a[k] if 0 <= k < len(a) else 0


def diff(a, k):
    return at(a, k + 1) - at(a, k)


def quotient_one(a, b):
    q = []
    for k in range(len(a) - len(b) + 1):
        q.append(a[k] - sum(b[s] * at(q, k - s) for s in range(1, len(b))))
    assert mul(q, b) == a
    return q


def profile(counts):
    m = sum(counts)
    N = sum(r * counts[r - 2] for r in (2, 3, 4))
    q = N + 1
    alpha = N + 2
    Q = [1]
    for r in (2, 3, 4):
        for _ in range(counts[r - 2]):
            Q = mul(Q, B[r])
    C = mul([1, 2], Q)
    P = [at(C, k) + (comb(q, k - 1) if 1 <= k <= q + 1 else 0)
         for k in range(q + 2)]
    x = next(k for k in range(len(P)) if diff(P, k) < 0)
    A0 = [at(mul([1, 1], Q), k) + (comb(N, k - 1) if 1 <= k <= N + 1 else 0)
          for k in range(N + 2)]
    branch = {}
    for r in (2, 3, 4):
        if counts[r - 2]:
            H = quotient_one(Q, B[r])
            Ai_base = mul(mul([1, 2], B[r - 1]), H)
            Ai = [at(Ai_base, k) + (comb(N, k - 1) if 1 <= k <= N + 1 else 0)
                  for k in range(N + 2)]
            T = mul(GF[r], H)
            branch[r] = (Ai, T)
    rows = []
    for p in range(x + 2, alpha // 2 + 1):
        if not (3 * p < 2 * alpha + 1):
            continue
        j = p - 2
        delta = q - j
        D = comb(N, j + 1) - comb(N, j)
        e0 = int(diff(A0, p) < 0)
        flags = {r: int(diff(Ai, p) < 0) for r, (Ai, _) in branch.items()}
        Tj = {r: at(T, j) for r, (_, T) in branch.items()}
        b = e0 + sum(r * counts[r - 2] * flags[r] for r in flags)
        A = sum(r * counts[r - 2] * flags[r] * Tj[r] for r in flags)
        mass = A - b * delta * D
        payment = (delta * C[j] - (delta - 1) * C[j + 1]) * A - b * delta * D * C[j]
        truncation = None
        if counts[0] == counts[1] == 0 and counts[2] >= 2:
            # Empty and singleton center-choice layers of T_i, for the
            # homogeneous arity-4 obstruction control.
            c = GF[4]
            U = sum(c[s] * comb(N - 4, j - s) for s in range(len(c))
                    if 0 <= j - s <= N - 4)
            U += (m - 1) * sum(c[s] * comb(N - 8, j - 1 - s)
                                 for s in range(len(c)) if 0 <= j - 1 - s <= N - 8)
            truncated_A = 4 * m * U
            truncation = dict(U=U, A=truncated_A,
                              payment_margin=(delta * C[j] - (delta - 1) * C[j + 1])
                              * truncated_A - b * delta * D * C[j])
        rows.append(dict(p=p, j=j, delta=delta, e0=e0, flags=flags, b=b,
                         Tj=Tj, A=A, D=D, Cj=C[j], Cj1=C[j + 1],
                         mass_margin=mass, payment_margin=payment,
                         local_margins={r: 2 * Tj[r] - 3 * delta * D for r in Tj},
                         truncation=truncation))
    return dict(counts=counts, m=m, n=3 + m + N, N=N, alpha=alpha,
                x=x, rows=rows)


def analytic_checks():
    # Exact constants used in the all-M tail proof; the proof in REPORT.md
    # supplies monotonicity, so this finite check only tests its base.
    E8 = sum((Fraction(119, 20) ** h / factorial(h) for h in range(9)), Fraction())
    E3 = sum((Fraction(119, 20) ** h / factorial(h) for h in range(4)), Fraction())
    assert E8 > 288 and E3 > 48
    assert Fraction((44 + 2) * (44 - 4) * (44 - 6),
                    4 * 44 * 43 * 41) > Fraction(9, 40)
    return dict(E8=str(E8), E3=str(E3), p4_at_44=str(Fraction(
        (44 + 2) * (44 - 4) * (44 - 6), 4 * 44 * 43 * 41)))


if __name__ == '__main__':
    out = {'analytic_base': analytic_checks(),
           'fresh_profiles': [profile((0, 22, 0)), profile((119, 0, 1)),
                              profile((1, 0, 119))],
           'obstruction_control': profile((0, 0, 172))}
    for rec in out['fresh_profiles'] + [out['obstruction_control']]:
        assert all(row['mass_margin'] > 0 and row['payment_margin'] > 0
                   for row in rec['rows'])
    Path('AF_boundary_evidence.json').write_text(json.dumps(out, indent=2) + '\n')
    print(json.dumps({'profile_summaries': [(x['counts'], x['x'], len(x['rows']))
                                             for x in out['fresh_profiles'] + [out['obstruction_control']]],
                      'analytic_base': out['analytic_base']}))
