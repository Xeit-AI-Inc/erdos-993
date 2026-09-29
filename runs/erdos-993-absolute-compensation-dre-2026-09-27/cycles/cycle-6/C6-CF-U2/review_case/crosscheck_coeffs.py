"""Small independent convolution cross-check for C6-U2's packed digits."""
import itertools
import json
import census_b


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
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def explicit(counts, marked=None):
    a2, a3, a4 = counts
    q = [1]
    for r, exponent in ((2, a2), (3, a3), (4, a4)):
        br = add(power([1, 1], r), [0, 1])
        q = mul(q, power(br, exponent))
    g = [1, 2]
    if marked is None:
        return mul(g, q)
    other = [1]
    for r, exponent in ((2, a2), (3, a3), (4, a4)):
        if r != marked:
            br = add(power([1, 1], r), [0, 1])
            other = mul(other, power(br, exponent))
        else:
            br = add(power([1, 1], r), [0, 1])
            other = mul(other, power(br, exponent - 1))
    marked_factor = add(power([1, 1], marked - 1), [0, 1])
    return mul(mul(g, marked_factor), other)


def padded(v, n):
    return v + [0] * max(0, n - len(v))


def main():
    checked = 0
    for m in range(1, 9):
        for a2 in range(m + 1):
            for a3 in range(m - a2 + 1):
                a4 = m - a2 - a3
                counts = (a2, a3, a4)
                N = 2 * a2 + 3 * a3 + 4 * a4
                w = census_b.support_and_coefficient_bound(N, m)
                beta = 1 << w
                mask = beta - 1
                packed_c = census_b.unpack(census_b.packed_poly(counts, None, beta), N + 1, w, mask)
                assert packed_c == padded(explicit(counts), N + 2), counts
                for r in (2, 3, 4):
                    if counts[r - 2]:
                        packed_u = census_b.unpack(census_b.packed_poly(counts, r, beta), N, w, mask)
                        assert packed_u == padded(explicit(counts, r), N + 1), (counts, r)
                checked += 1
    print(json.dumps({"profiles_checked": checked, "m_range": [1, 8], "result": "PASS"}))


if __name__ == "__main__":
    main()
