"""Independent coefficient check for the three reported T_m rows."""
import json


def add(*polys):
    n = max(map(len, polys))
    return [sum(p[k] if k < len(p) else 0 for p in polys) for k in range(n)]


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


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def delta(a, k):
    return coeff(a, k + 1) - coeff(a, k)


branch = [1, 4, 3, 1]
rows = []
for m in (22, 60, 100):
    b = power(branch, m)
    bm1 = power(branch, m - 1)
    one = power([1, 1], 3 * m)
    t = add(mul([1, 2], b), mul([0, 1, 1], one))
    alpha = len(t) - 1
    p = alpha - 2
    x = next(k for k in range(alpha + 1) if delta(t, k) < 0)
    hm = add(b, mul([0, 1], one))
    rm = b
    hs = add(mul(mul([1, 2], bm1), [1, 2, 1]), mul([0, 1], one))
    rs = mul([1, 2], bm1)
    marker_sel = delta(add(hm, mul([0, 1], rm)), p)
    star_sel = delta(add(hs, mul([0, 1], rs)), p)
    marker_g = delta(hm, p - 1) - delta(rm, p - 1)
    star_g = delta(hs, p - 1) - delta(rs, p - 1)
    rows.append(dict(m=m, alpha=alpha, p=p, x=x, eligible=x + 2 <= p,
                     marked_selector=marker_sel, star_selector=star_sel,
                     marked_g=marker_g, star_g=star_g,
                     favorable_tags=int(marker_sel < 0) + 3 * m * int(star_sel < 0),
                     aggregate=(marker_g if marker_sel < 0 else 0)
                               + 3 * m * (star_g if star_sel < 0 else 0)))

print(json.dumps(rows, indent=2))
