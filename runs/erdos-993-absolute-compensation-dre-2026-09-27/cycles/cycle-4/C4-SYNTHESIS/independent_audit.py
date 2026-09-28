"""Independent exact checks for C4 synthesis; no producer imports."""

import json
from fractions import Fraction
from math import comb


def add(a, b):
    return [at(a, i) + at(b, i) for i in range(max(len(a), len(b)))]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            out[i + j] += ai * bj
    return out


def power(a, n):
    out = [1]
    for _ in range(n):
        out = mul(out, a)
    return out


def at(a, k):
    return a[k] if 0 <= k < len(a) else 0


def choose(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def diff(a, k):
    return at(a, k + 1) - at(a, k)


def descent(a):
    return next(k for k in range(len(a)) if diff(a, k) < 0)


def shift_margin(a, c, k):
    return at(a, k) * at(c, k) - at(a, k + 1) * at(c, k - 1)


L = [1, 1]
G = [1, 2]
B = {r: add(power(L, r), [0, 1]) for r in (2, 3, 4)}


def sum_poly(items):
    out = [0]
    for p in items:
        out = add(out, p)
    return out


F = {r: sum_poly([power(L, h) for h in range(r - 1)]) for r in (2, 3, 4)}
GF = {r: mul(G, F[r]) for r in (2, 3, 4)}


def family(counts):
    m = sum(counts)
    n_tips = sum(r * counts[r - 2] for r in (2, 3, 4))
    qpoly = [1]
    for r in (2, 3, 4):
        qpoly = mul(qpoly, power(B[r], counts[r - 2]))
    c = mul(G, qpoly)
    binomial = power(L, n_tips)
    pparent = add(c, mul([0, 1], power(L, n_tips + 1)))
    a0 = add(mul(L, qpoly), mul([0, 1], binomial))
    branches = {}
    terms = {}
    for r in (2, 3, 4):
        if counts[r - 2]:
            h = [1]
            for s in (2, 3, 4):
                h = mul(h, power(B[s], counts[s - 2] - (s == r)))
            brminus = add(power(L, r - 1), [0, 1])
            branches[r] = add(mul(mul(G, brminus), h), mul([0, 1], binomial))
            terms[r] = mul(GF[r], h)
    w = sum_poly([[(r * counts[r - 2]) * a for a in branches[r]] for r in branches])
    return dict(m=m, N=n_tips, Q=qpoly, C=c, P=pparent, A0=a0, Ai=branches, T=terms,
                W=w, x=descent(pparent))


def case(counts, p):
    f = family(counts)
    n, x, c = f['N'], f['x'], f['C']
    j = p - 2
    delta = n + 1 - j
    dj = choose(n, j + 1) - choose(n, j)
    e0 = int(diff(f['A0'], p) < 0)
    flags = {str(r): int(diff(a, p) < 0) for r, a in f['Ai'].items()}
    rweight = sum(r * counts[r - 2] * flags[str(r)] for r in f['Ai'])
    a = sum(r * counts[r - 2] * flags[str(r)] * at(f['T'][r], j) for r in f['Ai'])
    b = rweight + e0
    kfactor = delta * at(c, j) - (delta - 1) * at(c, j + 1)
    return {
        'counts': counts, 'n': 3 + f['m'] + n, 'N': n, 'alpha': n + 2,
        'x': x, 'p': p, 'j': j,
        'guards': [x + 2 <= p, 3 * p < 2 * (n + 2) + 1, 2 * p <= n + 2],
        'selectors': {'e0': e0, 'tips': flags, 'R': rweight, 'b': b},
        'Cjm1': str(at(c, j - 1)), 'Cj': str(at(c, j)),
        'Cj1': str(at(c, j + 1)), 'Dj': str(dj),
        'Ckm1': str(at(c, p - 1)), 'Ck': str(at(c, p)),
        'tip_coefficients_at_p': {str(r): [str(at(f['Ai'][r], p)), str(at(f['Ai'][r], p + 1))]
                                  for r in f['Ai']},
        'parent_first_difference': str(diff(f['P'], x)),
        'parent_terminal_difference': str(diff(f['P'], len(f['P']) - 1)),
        'endpoint_margin': str(shift_margin(f['A0'], c, p)),
        'tip_margins': {str(r): str(shift_margin(f['Ai'][r], c, p)) for r in f['Ai']},
        'weighted_margin': str(shift_margin(f['W'], c, p)),
        'mass_margin': str(a - b * delta * dj),
        'payment_margin': str(kfactor * a - b * delta * dj * at(c, j)),
    }


def tree_polynomial(counts, delete=None):
    edges = []
    edges += [(0, 1), (1, 2)]
    next_id = 3
    selected_tip = None
    for r in (2, 3, 4):
        for _ in range(counts[r - 2]):
            center = next_id
            next_id += 1
            edges.append((0, center))
            for _ in range(r):
                tip = next_id
                next_id += 1
                edges.append((center, tip))
                if r == 4 and selected_tip is None:
                    selected_tip = tip
    if delete == 'tip4':
        delete = selected_tip
    vertices = set(range(next_id)) - ({delete} if delete is not None else set())
    adjacent = {v: [] for v in vertices}
    for u, v in edges:
        if u in vertices and v in vertices:
            adjacent[u].append(v)
            adjacent[v].append(u)

    def dfs(v, parent):
        exc, inc = [1], [0, 1]
        for u in adjacent[v]:
            if u != parent:
                child_exc, child_inc = dfs(u, v)
                exc = mul(exc, add(child_exc, child_inc))
                inc = mul(inc, child_exc)
        return exc, inc

    total = [0]
    seen = set()
    for root in vertices:
        if root in seen:
            continue
        stack = [root]
        while stack:
            v = stack.pop()
            if v not in seen:
                seen.add(v)
                stack.extend(adjacent[v])
        ex, inc = dfs(root, -1)
        total = mul(total if total != [0] else [1], add(ex, inc))
    return total


def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def jensen_check():
    sizes = [2, 3]
    q = mul(B[2], B[3])
    out = {}
    for k in (0, 2, 5):
        norm = Fraction(at(q, k), choose(5, k))
        y = sum((Fraction(2 * s, 2 * s + 1) *
                 Fraction(choose(5 - s, k - 1), choose(5, k)) for s in sizes), Fraction(0))
        taylor2 = 1 + y + y * y / 2
        out[str(k)] = {'normalized': str(norm), 'y': str(y), 'taylor2': str(taylor2),
                       'floor_holds': norm >= taylor2}
    return out


def depth_check():
    f = family((0, 0, 173))
    p, j, n = 338, 336, 692
    c = f['C']
    delta = n + 1 - j
    dj = choose(n, j + 1) - choose(n, j)
    kfactor = delta * at(c, j) - (delta - 1) * at(c, j + 1)
    layers = []
    for a in range(173):
        layer = comb(172, a) * sum(g * choose(4 * (172 - a), j - a - s)
                                    for s, g in enumerate(GF[4]))
        layers.append(layer)
    lhs_partial = 0
    margins = {}
    for i, layer in enumerate(layers):
        lhs_partial += layer
        if i in (1, 2, 172):
            margins[str(i)] = str(kfactor * (692 * lhs_partial)
                                   - 693 * delta * dj * at(c, j))
    return {'case': case((0, 0, 173), p),
            'layers0to2': [str(v) for v in layers[:3]],
            'full_layer_equals_T': sum(layers) == at(f['T'][4], j),
            'kfactor_positive': kfactor > 0, 'margins': margins}


def selector_ratio_check(counts, p):
    f = family(counts)
    x, c, n = f['x'], f['C'], f['N']
    j = p - 2
    beta = choose(n + 1, x) - choose(n + 1, x - 1)
    ratio_x = Fraction(at(c, x + 1), at(c, x))
    ratio_j = Fraction(at(c, j + 1), at(c, j))
    return {'counts': counts, 'x': x, 'j': j, 'beta': str(beta),
            'delta_x_C': str(diff(c, x)), 'ratio_x': str(ratio_x),
            'ratio_j': str(ratio_j), 'ratio_order': ratio_j <= ratio_x < 1,
            'descent_bound': ratio_x < 1 - Fraction(beta, at(c, x))}


def drift_check(counts, p):
    f = family(counts)
    c, n, x, j = f['C'], f['N'], f['x'], p - 2
    derivative = [(i + 1) * at(c, i + 1) for i in range(len(c) - 1)]
    lhs = add(mul(L, derivative), [-(n + 1) * v for v in c])
    rhs = f['Q'][:]
    for r in (2, 3, 4):
        if counts[r - 2]:
            h = [1]
            for s in (2, 3, 4):
                h = mul(h, power(B[s], counts[s - 2] - (s == r)))
            rhs = add(rhs, [counts[r - 2] * v for v in mul(mul(G, [1, 1 - r]), h)])
    beta = choose(n + 1, x) - choose(n + 1, x - 1)
    drift = Fraction((j + 1) * at(c, j + 1), at(c, j)) - (n + 1 - j)
    bound = Fraction(2 * j - n) - Fraction((j + 1) * beta, at(c, x))
    return {'polynomial_identity': trim(lhs) == trim(rhs), 'drift': str(drift),
            'bound': str(bound), 'strict_bound': drift < bound,
            'below_minus_two': bound <= -2}


def wrong_deck_check():
    f = family((0, 0, 24))
    n = f['N']
    h = power(B[4], 23)
    wrong_ai = add(mul(mul(G, power(L, 3)), h), mul([0, 1], power(L, n)))
    wrong_w = [n * v for v in wrong_ai]
    return {str(k): {'correct': str(shift_margin(f['W'], f['C'], k)),
                     'missing_plus_z': str(shift_margin(wrong_w, f['C'], k))}
            for k in (1, 24, 49)}


if __name__ == '__main__':
    witness = family((38, 0, 1))
    out = {
        'monomial_GF': {str(r): GF[r] for r in GF},
        'witness': case((38, 0, 1), 77),
        'witness_literal_matches': {
            'parent': trim(tree_polynomial((38, 0, 1))) == trim(witness['P']),
            'endpoint': trim(tree_polynomial((38, 0, 1), 2)) == trim(witness['A0']),
            'tip4': trim(tree_polynomial((38, 0, 1), 'tip4')) == trim(witness['Ai'][4]),
        },
        'guarded_boundary': case((0, 22, 0), 34),
        'summand_interior': {
            'k': 27,
            'E_margin': str(shift_margin(mul([0, 1], power(L, 66)), family((0, 22, 0))['C'], 27)),
            'A0_margin': str(shift_margin(family((0, 22, 0))['A0'], family((0, 22, 0))['C'], 27)),
        },
        'drift_boundary': case((0, 12, 10), 39),
        'drift_interior': case((0, 10, 28), 72),
        'drift_boundary_identity': drift_check((0, 12, 10), 39),
        'drift_interior_identity': drift_check((0, 10, 28), 72),
        'selector_ratio_boundary': selector_ratio_check((0, 22, 0), 34),
        'selector_ratio_interior': selector_ratio_check((0, 10, 28), 72),
        'wrong_deck24': wrong_deck_check(),
        'jensen_2_3': jensen_check(),
        'depth173': depth_check(),
    }
    print(json.dumps(out, indent=2))
