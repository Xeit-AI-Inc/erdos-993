"""Closed-form checks independent of the pinned forest-DP implementation."""

from math import comb


def path_coefficient(n, k):
    return comb(n - k + 1, k) if 0 <= k <= (n + 1) // 2 else 0


def path_delta(n, k):
    return path_coefficient(n, k + 1) - path_coefficient(n, k)


def multiply(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def power(a, m):
    out = [1]
    for _ in range(m):
        out = multiply(out, a)
    return out


def coefficient(a, k):
    return a[k] if 0 <= k < len(a) else 0


def first_descent(a):
    return next(k for k in range(len(a)) if coefficient(a, k + 1) < coefficient(a, k))


def check_path():
    n, p = 100, 48
    a = [path_coefficient(n, k) for k in range(51)]
    selector = path_delta(n - 1, p)
    g = path_delta(n - 2, p - 1) - path_delta(n - 3, p - 1)
    assert (len(a) - 1, first_descent(a), selector, g, 2 * g) == (
        50, 28, -269450, -2329460, -4658920
    )
    print("P100", len(a) - 1, first_descent(a), p, selector, g, 2 * g)


def check_double_leaf_hub():
    m = 30
    branch = [1, 3, 1]
    a = power(branch, m)
    leaf_term = multiply([0, 1], power([1, 1], 2 * m))
    graph = [coefficient(a, k) + coefficient(leaf_term, k)
             for k in range(max(len(a), len(leaf_term)))]
    p = len(graph) - 3
    # After deleting one original leaf, the hub-excluded branch has (1+2z).
    tv0 = multiply([1, 2], power(branch, m - 1))
    tv1 = multiply([0, 1], power([1, 1], 2 * m - 1))
    selector = (coefficient(tv0, p + 1) + coefficient(tv1, p + 1)
                - coefficient(tv0, p) - coefficient(tv1, p))
    # H_v=(1+z)(B^(m-1)+z(1+z)^(2m-2)), R_v=B^(m-1).
    h = multiply([1, 1], [coefficient(power(branch, m - 1), k)
                            + coefficient(multiply([0, 1], power([1, 1], 2 * m - 2)), k)
                            for k in range(2 * m)])
    r = power(branch, m - 1)
    g = (coefficient(h, p) - coefficient(h, p - 1)
         - coefficient(r, p) + coefficient(r, p - 1))
    assert (len(graph) - 1, first_descent(graph), p, selector, g, 2 * m * g) == (
        61, 30, 59, -60, -1738, -104280
    )
    print("hub_m30", len(graph) - 1, first_descent(graph), p,
          selector, g, 2 * m * g)


if __name__ == "__main__":
    check_path()
    check_double_leaf_hub()
