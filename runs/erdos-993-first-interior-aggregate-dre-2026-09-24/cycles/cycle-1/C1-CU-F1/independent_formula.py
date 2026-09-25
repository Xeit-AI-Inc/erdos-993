"""Independent coefficient formulas for the T_m tree; integer arithmetic only."""
from collections import Counter
from math import comb
import json


def add(a, b):
    c = [0] * max(len(a), len(b))
    for k, v in enumerate(a):
        c[k] += v
    for k, v in enumerate(b):
        c[k] += v
    return c


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def power(a, n):
    c = [1]
    for _ in range(n):
        c = mul(c, a)
    return c


def choose(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def coeff(a, k):
    return a[k] if 0 <= k < len(a) else 0


def delta(a, k):
    return coeff(a, k + 1) - coeff(a, k)


def x_contract(a):
    return next(k for k in range(len(a)) if delta(a, k) < 0)


def row(m, p):
    # Root excluded: (1+2z) A^m; root included: z(1+z)^(3m+1).
    a = [1, 4, 3, 1]
    b = [1, 3, 1]  # An arm with one leaf removed.
    z_one = [0, 1]
    one_z = [1, 1]
    poly = add(mul([1, 2], power(a, m)), mul(z_one, power(one_z, 3*m+1)))
    marked_minus = add(mul(one_z, power(a, m)), mul(z_one, power(one_z, 3*m)))
    arm_minus = add(mul(mul([1, 2], b), power(a, m-1)), mul(z_one, power(one_z, 3*m)))
    # H_v-R_v for marked v is z(1+z)^(3m).
    marked_g = choose(3*m, p-1) - choose(3*m, p-2)
    # For an arm leaf: [(1+z)^2-1](1+2z)A^(m-1)+z(1+z)^(3m).
    arm_hr = add(mul([0, 2, 5, 2], power(a, m-1)), mul(z_one, power(one_z, 3*m)))
    arm_g = delta(arm_hr, p-1)
    marked_selector = delta(marked_minus, p) < 0
    arm_selector = delta(arm_minus, p) < 0
    return {
        'm': m, 'order': 4*m+3, 'alpha': len(poly)-1,
        'x': x_contract(poly), 'p': p,
        'marked_selector_delta': delta(marked_minus, p),
        'arm_selector_delta': delta(arm_minus, p),
        'marked_g': marked_g, 'arm_g': arm_g,
        'favorable_count': int(marked_selector)+3*m*int(arm_selector),
        'aggregate': int(marked_selector)*marked_g+3*m*int(arm_selector)*arm_g,
    }


if __name__ == '__main__':
    print(json.dumps([row(22, 66), row(22, 34), row(60, 180), row(60, 90)], indent=2, sort_keys=True))
