"""Independent exact coefficient check of the T_m interior-rank probe."""

import json
from math import comb


def multiply(a, b):
    result = [0] * (len(a) + len(b) - 1)
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            result[i + j] += ai * bj
    return result


def power(base, exponent):
    result = [1]
    for _ in range(exponent):
        result = multiply(result, base)
    return result


def coefficient(poly, k):
    return poly[k] if 0 <= k < len(poly) else 0


def row(m):
    b = [1, 4, 3, 1]
    bm = power(b, m)
    # Root excluded: marked path and m stars. Root included: its
    # 3m+1 non-neighbor leaves are free.
    whole = multiply([1, 2], bm)
    whole += [0] * (3 * m + 3 - len(whole))
    for k in range(3 * m + 2):
        whole[k + 1] += comb(3 * m + 1, k)
    alpha = len(whole) - 1
    assert coefficient(whole, alpha) > 0
    p = alpha - 2
    x = next(k for k in range(alpha + 1)
             if coefficient(whole, k + 1) - coefficient(whole, k) < 0)

    marked_selector = 1 - 6 * m
    star_selector = -3 * m - 1
    marked_g = 3 * m - comb(3 * m, 2)
    star_g = marked_g + 3 - 6 * m
    aggregate = marked_g + 3 * m * star_g
    return dict(m=m, order=4*m+3, alpha=alpha, p=p, x=x,
                eligible=x+2 <= p, marked_selector=marked_selector,
                star_selector=star_selector, favorable_tags=3*m+1,
                marked_g=marked_g, star_g=star_g, aggregate=aggregate)


print(json.dumps([row(m) for m in (22, 60, 100)], indent=2))
