"""Independent exact audit of the assigned C5 F routes; writes only top-level output."""
from fractions import Fraction
from hashlib import sha256
from math import comb
from pathlib import Path
import json

ROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
HERE = Path(__file__).resolve().parent


def coefficient(a, k):
    return a[k] if 0 <= k < len(a) else 0


def multiply(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            c[i + j] += ai * bj
    return c


def add(a, b):
    return [coefficient(a, k) + coefficient(b, k) for k in range(max(len(a), len(b)))]


def power(a, n):
    v = [1]
    for _ in range(n):
        v = multiply(v, a)
    return v


def scale(a, n):
    return [n * v for v in a]


def binomial_shift(n):
    return [0] + [comb(n, j) for j in range(n + 1)]


L = [1, 1]
G = [1, 2]
B = {r: add([comb(r, j) for j in range(r + 1)], [0, 1]) for r in (1, 2, 3, 4)}


def core(counts):
    n = sum(r * count for r, count in zip((2, 3, 4), counts))
    q = [1]
    for r, count in zip((2, 3, 4), counts):
        q = multiply(q, power(B[r], count))
    return n, q, multiply(G, q)


def marked(counts, r):
    n, q, c = core(counts)
    other = [1]
    for s, count in zip((2, 3, 4), counts):
        other = multiply(other, power(B[s], count - (s == r)))
    u = multiply(multiply(G, B[r - 1]), other)
    e = binomial_shift(n)
    return c, u, e, add(u, e)


def endpoint(counts):
    n, q, _ = core(counts)
    return add(multiply(L, q), binomial_shift(n))


def parent(counts):
    n, _, c = core(counts)
    return add(c, binomial_shift(n + 1))


def first_descent(p):
    return next(k for k in range(len(p)) if coefficient(p, k + 1) < coefficient(p, k))


def minor(v, c, k):
    return coefficient(v, k) * coefficient(c, k) - coefficient(v, k + 1) * coefficient(c, k - 1)


def manifest_check():
    manifest = json.loads((ROOT / 'manifests/C5-COMMON-DISPATCH.json').read_text())
    packet = json.loads((ROOT / 'packets/C5-AF.json').read_text())
    bad = []
    for kind, items in [('common', manifest['members']), ('packet', packet['allowed_source_files'])]:
        for item in items:
            path = ROOT / item['path']
            if not path.is_file() or sha256(path.read_bytes()).hexdigest() != item['sha256']:
                bad.append((kind, item['path']))
    assert not bad, bad
    return {'common_members': len(manifest['members']), 'packet_sources': len(packet['allowed_source_files']), 'mismatches': bad}


def f1_controls():
    counts = (0, 22, 0)
    n, _, c = core(counts)
    _, u, e, a = marked(counts, 3)
    a0 = endpoint(counts)
    x = first_descent(parent(counts))
    p, k = 34, 27
    e0 = int(coefficient(a0, p + 1) < coefficient(a0, p))
    e3 = int(coefficient(a, p + 1) < coefficient(a, p))
    first = {
        'counts': counts, 'm': 22, 'n': n + 22 + 3, 'N': n, 'alpha': n + 2,
        'x': x, 'p': p, 'k': k,
        'guards': [x + 2 <= p, 3 * p < 2 * (n + 2) + 1, 2 * p <= n + 2, 1 <= k, 2 * k <= n + 2],
        'selectors': {'e0': e0, 'e3': e3}, 'original_tip_tags': 22 * 3,
        'E_minor': str(minor(e, c, k)), 'A0_minor': str(minor(a0, c, k)), 'A3_minor': str(minor(a, c, k))}
    assert first['guards'] == [True] * 5 and (x, e0, e3) == (32, 1, 1)

    # Activity is inserted only in the other two centers; the distinguished
    # branch factors B4 and B3 stay fixed, and E is independent of activity.
    n, _, c4 = core((0, 0, 3))
    e4 = binomial_shift(n)
    c_layers, u_layers = [], []
    for a_idx in range(3):
        cofactor = [0] * a_idx + scale(power(L, 4 * (2 - a_idx)), comb(2, a_idx))
        c_layers.append(multiply(multiply(G, B[4]), cofactor))
        u_layers.append(multiply(multiply(G, B[3]), cofactor))
    layer = []
    for degree in range(5):
        value = 0
        for a_idx in range(3):
            b_idx = degree - a_idx
            if 0 <= b_idx < 3:
                value += coefficient(u_layers[a_idx], 7) * coefficient(c_layers[b_idx], 7)
                value -= coefficient(u_layers[a_idx], 8) * coefficient(c_layers[b_idx], 6)
        if degree < 3:
            value += minor(e4, c_layers[degree], 7)
        layer.append(value)
    c_direct, _, _, a_direct = marked((0, 0, 3), 4)
    weighted = 12 * minor(a_direct, c_direct, 7)
    activity = {'counts': (0, 0, 3), 'n': 18, 'N': 12, 'k': 7,
                'guard': 2 * 7 <= 12 + 2, 'partial_activity_layer_minors': layer,
                'sum': sum(layer), 'direct_tip_minor': minor(a_direct, c_direct, 7),
                'correct_original_weighted_minor': weighted}
    assert activity['guard'] and layer == [1898616, 171542, 6175, -66, 0]
    assert sum(layer) == activity['direct_tip_minor'] == 2076267
    assert weighted == 24915204

    counts = (38, 0, 1)
    n, _, c = core(counts)
    _, _, _, a4 = marked(counts, 4)
    x = first_descent(parent(counts))
    outside = {'counts': counts, 'n': n + sum(counts) + 3, 'N': n, 'alpha': n + 2,
               'x': x, 'k': 77, 'guard': 2 * 77 <= n + 2,
               'A4_minor': minor(a4, c, 77)}
    assert outside['n'] == 122 and x == 41 and not outside['guard']
    assert outside['A4_minor'] == -49239834336
    return {'isolated_E': first, 'activity': activity, 'outside_guard': outside}


def weighted_scan():
    rows, ranks, minimum = 0, 0, None
    failures = []
    for a2 in range(21):
        for a3 in range(21 - a2):
            for a4 in range(21 - a2 - a3):
                counts = (a2, a3, a4)
                if sum(counts) == 0:
                    continue
                rows += 1
                n, _, c = core(counts)
                w = [0]
                for r, count in zip((2, 3, 4), counts):
                    if count:
                        _, _, _, a = marked(counts, r)
                        w = add(w, scale(a, r * count))
                for k in range(1, (n + 2) // 2 + 1):
                    ranks += 1
                    v = minor(w, c, k)
                    if minimum is None or v < minimum['margin']:
                        minimum = {'counts': counts, 'N': n, 'k': k, 'margin': v}
                    if v < 0:
                        failures.append({'counts': counts, 'N': n, 'k': k, 'margin': v})
    assert (rows, ranks) == (1770, 41205)
    assert minimum == {'counts': (1, 0, 0), 'N': 2, 'k': 1, 'margin': 38}
    assert not failures
    return {'profiles': rows, 'guarded_ranks': ranks, 'minimum': minimum, 'negative_rows': failures}


def f2_controls():
    c1, a1, c2, a2 = (1, 100), (1, 90), (100, 1), (80, 0)
    m1 = a1[1] * c1[0] - a1[0] * c1[1]
    m2 = a2[1] * c2[0] - a2[0] * c2[1]
    ms = (a1[1] + a2[1]) * (c1[0] + c2[0]) - (a1[0] + a2[0]) * (c1[1] + c2[1])
    assert (m1, m2, ms) == (-10, -80, 909)
    counts = (10, 0, 0)
    n, _, c = core(counts)
    d = binomial_shift(n + 1)
    k = 4
    value = coefficient(d, 5) * coefficient(c, 4) - coefficient(d, 4) * coefficient(c, 5)
    x = first_descent(parent(counts))
    assert [coefficient(d, 4), coefficient(d, 5), coefficient(c, 4), coefficient(c, 5)] == [1330, 5985, 27315, 125586]
    assert (value, x) == (-3549105, 11)
    return {'different_denominator': {'input_minors': [m1, m2], 'sum_minor': ms},
            'root_mixture': {'counts': counts, 'm': 10, 'n': 33, 'N': n, 'alpha': n + 2, 'x': x,
                             'k': k, 'coefficients': [coefficient(d, 4), coefficient(d, 5), coefficient(c, 4), coefficient(c, 5)],
                             'signed_monotonicity_minor': value,
                             'simple_guard': 1 <= k and 2 * k <= n + 2,
                             'actual_eligible': x + 2 <= k and 3 * k < 2 * (n + 2) + 1 and 2 * k <= n + 2}}


def f3_control():
    f = (1, 2, 100)
    base = tuple(comb(2, k) for k in range(3))
    assert all(f[k] >= base[k] for k in range(3))
    y = [Fraction(2 * (f[k] - base[k]), f[k] + base[k]) for k in range(3)]
    ratios = [Fraction(f[k], base[k]) for k in range(3)]
    assert y == [0, 0, Fraction(198, 101)] and ratios == [1, 1, 100]
    interior = f[1] * base[1] - f[2] * base[0]
    boundary = f[2] * base[2] - 0 * base[1]
    assert (interior, boundary) == (-96, 100)
    return {'r': 2, 'M': 2, 'f_z_basis': f, 'baseline_z_basis': base,
            'actual_uniform_subset_weight_averages': [str(x) for x in ratios],
            'jensen_y': [str(x) for x in y], 'k1_guard': 2 <= 4,
            'k1_minor': interior, 'k2_boundary_minor': boundary}


def surplus_spots():
    out = []
    for counts, r, k in [((1, 0, 0), 2, 1), ((1, 0, 0), 2, 2),
                         ((0, 0, 1), 4, 3), ((0, 0, 4), 4, 8),
                         ((0, 22, 0), 3, 17), ((0, 22, 0), 3, 34)]:
        n, _, c = core(counts)
        _, u, e, a = marked(counts, r)
        h = 1 + 2 * counts[0] + 4 * counts[1] + 7 * counts[2]
        g = (k + 1) * (h - k + 1)
        mu, me, ma = minor(u, c, k), minor(e, c, k), minor(a, c, k)
        s = (h + 1) * coefficient(u, k) * coefficient(c, k) + g * me
        assert g > 0 and ma == mu + me and (h + 1) * coefficient(u, k) * coefficient(c, k) <= g * mu
        crude = 2 * (n + 2 - k) * (h + 1) * coefficient(u, k) - coefficient(e, k) * (n - k - 1) * g
        out.append({'counts': counts, 'r': r, 'N': n, 'h': h, 'k': k, 'g': g,
                    'M_U': str(mu), 'M_E': str(me), 'M_A': str(ma),
                    'exact_surplus': str(s), 'crude_margin': str(crude)})
    assert out[3]['exact_surplus'] == '45380234160'
    assert out[3]['crude_margin'] == '-87840'
    return out


def bases():
    f4_z = add(add([1], L), power(L, 2))
    gf4_z = multiply(G, f4_z)
    assert f4_z == [3, 3, 1] and gf4_z == [3, 9, 7, 2]
    assert B[4] == [1, 5, 6, 4, 1]
    return {'F4_L_basis': [1, 1, 1], 'F4_z_basis': f4_z,
            'GF4_z_basis': gf4_z, 'B4_z_basis': B[4]}


def main():
    result = {'input_integrity': manifest_check(), 'basis_cross_check': bases(),
              'F1_controls': f1_controls(), 'F1_weighted_scan': weighted_scan(),
              'F2_controls': f2_controls(), 'F3_control': f3_control(),
              'surplus_spots': surplus_spots()}
    (HERE / 'C5AF_audit.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({'integrity': result['input_integrity'], 'weighted_scan': result['F1_weighted_scan'],
                      'F1_activity': result['F1_controls']['activity'], 'F2': result['F2_controls'],
                      'F3': result['F3_control']}, indent=2))


if __name__ == '__main__':
    main()
