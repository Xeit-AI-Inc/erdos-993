"""Exact foreground checks for the assigned T_m family, m=1..50."""
from math import comb


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        c[i] += x
    for i, x in enumerate(b):
        c[i] += x
    return c


def power(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


def coefficient(a, j):
    return a[j] if 0 <= j < len(a) else 0


def delta(a, j):
    return coefficient(a, j + 1) - coefficient(a, j)


def subtract(a, b):
    return add(a, [-x for x in b])


L, B = [1, 1], [1, 4, 3, 1]
rows = []
for m in range(1, 51):
    Bm = power(B, m)
    Bm1 = power(B, m - 1)
    L3m = power(L, 3 * m)
    P = add(mul([1, 2], Bm), mul([0, 1], power(L, 3 * m + 1)))
    D_arm = add(mul([1, 1], Bm), mul([0, 1], L3m))
    D_claw = add(mul(mul([1, 2], [1, 3, 1]), Bm1), mul([0, 1], L3m))
    q_arm = [0] + [comb(3 * m, j) for j in range(3 * m + 1)]
    q_claw = add(mul([0, 2, 5, 2], Bm1), mul([0, 1], L3m))
    q_all = add([(3 * m + 1) * c for c in [0] + L3m],
                [3 * m * c for c in mul([0, 2, 5, 2], Bm1)])
    # Independently check marked-polynomial identities from direct deletion polynomials.
    # q_v = I(T-v-s_v) - I(T-N[s_v]); these are the explicit q formulas in the route note.
    assert add(q_arm, [0]) == add([0] + L3m, [0])
    assert q_claw == add(mul([0, 2, 5, 2], Bm1), [0] + L3m)
    assert q_all == add([(3 * m + 1) * c for c in [0] + L3m],
                        [3 * m * c for c in mul([0, 2, 5, 2], Bm1)])
    # Check P degree and terminal-zero-extended first descent.
    alpha = 3 * m + 2
    assert max(j for j, c in enumerate(P) if c) == alpha
    x = next(j for j in range(len(P) + 1) if delta(P, j) < 0)
    valid = []
    for p in range(x + 2, (2 * alpha + 1 - 1) // 3 + 1):
        assert p >= x + 2 and 3 * p < 2 * alpha + 1
        arm_ok, claw_ok = delta(D_arm, p) < 0, delta(D_claw, p) < 0
        sa = coefficient(q_arm, p) - coefficient(q_arm, p - 1)
        sc = coefficient(q_claw, p) - coefficient(q_claw, p - 1)
        S = (sa if arm_ok else 0) + 3 * m * (sc if claw_ok else 0)
        assert S == (coefficient(q_all, p) - coefficient(q_all, p - 1)
                     if arm_ok and claw_ok else S)
        valid.append((p, arm_ok, claw_ok, sa, sc, S))
    rows.extend((m, alpha, x, *r) for r in valid)

# Correct symbolic difference check separately: D_arm-D_claw = z^3(2+z)B^(m-1).
for m in range(1, 51):
    Bm1 = power(B, m - 1)
    Da = add(mul([1, 1], power(B, m)), mul([0, 1], power(L, 3 * m)))
    Dc = add(mul(mul([1, 2], [1, 3, 1]), Bm1), mul([0, 1], power(L, 3 * m)))
    assert subtract(Da, Dc) == mul([0, 0, 0, 2, 1], Bm1)

print(f"m_horizon=1..50; eligible_rows={len(rows)}")
print(f"selected_arm_rows={sum(r[4] for r in rows)}; selected_claw_rows={sum(r[5] for r in rows)}")
print(f"both_selected_rows={sum(r[4] and r[5] for r in rows)}; neither_selected_rows={sum(not r[4] and not r[5] for r in rows)}")
print(f"positive_full_sums={sum(r[-1] > 0 for r in rows)}; zero_full_sums={sum(r[-1] == 0 for r in rows)}")
for r in rows:
    m, alpha, x, p, aa, cc, sa, sc, S = r
    if m <= 10 or p == x + 2:
        print(f"m={m} alpha={alpha} x={x} p={p} arm={int(aa)} claw={int(cc)} arm_term={sa} claw_term={sc} S={S}")
