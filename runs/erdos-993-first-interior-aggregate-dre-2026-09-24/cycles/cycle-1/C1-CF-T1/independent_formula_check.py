"""Independent closed-form checks for the C1-T1 examples (integer arithmetic)."""
from math import comb
import json


def add(*polys):
    out = [0] * max(map(len, polys))
    for poly in polys:
        for k, a in enumerate(poly):
            out[k] += a
    return out


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


def coef(a, k):
    return a[k] if 0 <= k < len(a) else 0


def diff(a, k):
    return coef(a, k + 1) - coef(a, k)


def first_descent(a):
    return next(k for k in range(len(a)) if diff(a, k) < 0)


def path(n):
    return [comb(n - k + 1, k) for k in range(n // 2 + 1)]


p60 = path(60)
path_selector = diff(path(59), 28)
path_g = diff(path(58), 27) - diff(path(57), 27)
path_row = dict(alpha=len(p60)-1, x=first_descent(p60), p=28,
                selector=path_selector, summand=path_g, sum=2*path_g)

m = 60
B = [1, 4, 3, 1]
Q = [1, 3, 1]
Z1 = [0, 1]
one2 = [1, 2]
ones = [1, 1]
Bm = power(B, m)
Bm1 = power(B, m-1)
binom3m = [comb(3*m, k) for k in range(3*m+1)]
T = add(mul(one2, Bm), mul(Z1, power(ones, 3*m+1)))
marked_delete = add(mul(ones, Bm), mul(Z1, binom3m))
star_delete = add(mul(mul(one2, Q), Bm1), mul(Z1, binom3m))
marked_H = add(Bm, mul(Z1, binom3m))
marked_R = Bm
star_H = add(mul(mul(power(ones, 2), one2), Bm1), mul(Z1, binom3m))
star_R = mul(one2, Bm1)
p = 3*m
marked_selector = diff(marked_delete, p)
star_selector = diff(star_delete, p)
marked_g = diff(marked_H, p-1) - diff(marked_R, p-1)
star_g = diff(star_H, p-1) - diff(star_R, p-1)
assert marked_selector == diff(marked_H, p)+diff(marked_R, p-1)
assert star_selector == diff(star_H, p)+diff(star_R, p-1)
family_row = dict(alpha=len(T)-1, x=first_descent(T), p=p,
                  marked_selector=marked_selector, star_selector=star_selector,
                  marked_summand=marked_g, star_summand=star_g,
                  favorable_count=1+3*m if marked_selector<0 and star_selector<0 else None,
                  sum=marked_g+3*m*star_g)
assert path_row['alpha'] == 30 and path_row['x'] == 17 and path_row['sum'] == -331702
assert family_row['alpha'] == 182 and family_row['x'] == 87
assert family_row['marked_summand'] == -15930 and family_row['star_summand'] == -16287
assert family_row['sum'] == -2947590
print(json.dumps({'P60':path_row,'T60':family_row}, indent=2, sort_keys=True))
