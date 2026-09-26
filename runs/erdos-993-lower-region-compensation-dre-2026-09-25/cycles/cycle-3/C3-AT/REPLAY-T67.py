"""Independent exact coefficient replay for the single T_67 row."""
from math import comb


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def power(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


def add(a, b):
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)
            for i in range(max(len(a), len(b)))]


def delta(a, k):
    return (a[k + 1] if k + 1 < len(a) else 0) - (a[k] if k < len(a) else 0)


m, p = 67, 99
L, B = [1, 1], [1, 4, 3, 1]
Bm, Bm1 = power(B, m), power(B, m - 1)
L3m = [comb(3 * m, j) for j in range(3 * m + 1)]
P = add(mul([1, 2], Bm), [0] + [comb(3 * m + 1, j) for j in range(3 * m + 2)])
Da = add(mul(L, Bm), [0] + L3m)
Dc = add(mul(mul([1, 2], [1, 3, 1]), Bm1), [0] + L3m)
qa = [0] + L3m
qc = add(mul([0, 2, 5, 2], Bm1), qa)
alpha = max(j for j, x in enumerate(P) if x)
x = next(j for j in range(alpha + 1) if delta(P, j) < 0)
sa, sc = qa[p] - qa[p - 1], qc[p] - qc[p - 1]
assert (alpha, x) == (203, 97)
assert all(delta(P, j) >= 0 for j in range(x))
assert delta(P, alpha) == -1
assert x + 2 <= p and 3 * p < 2 * alpha + 1
assert delta(Da, p) < 0 and delta(Dc, p) < 0
assert sa == 9796517609248850465985369472611545317259503273458850354500
assert sc == -13234166380529838122666159928849625141442673759254128694948346
assert sa + 3 * m * sc == -2660057645968888213805432160329302041884660166106806408834263046
print('T67 exact replay passed; alpha=203 x=97 p=99 all 202 leaves selected')
print('S=', sa + 3 * m * sc)
