#!/usr/bin/env python3
"""Independent exact arithmetic for two narrowly scoped C4 mechanism fences."""

from collections import defaultdict
from functools import lru_cache
from hashlib import sha256
from itertools import combinations
from json import dump, load
from pathlib import Path

BASE = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
EDGES24 = [
    (0, 1), (3, 2), (2, 4), (4, 17), (5, 10), (6, 19), (10, 18),
    (12, 7), (14, 11), (11, 13), (15, 8), (17, 9), (18, 19),
    (19, 13), (13, 7), (20, 8), (8, 9), (9, 1), (21, 1), (22, 1),
    (1, 7), (7, 16), (16, 23),
]


def graph(n, edges):
    adj = [0] * n
    for a, b in edges:
        assert a != b and not (adj[a] & (1 << b))
        adj[a] |= 1 << b
        adj[b] |= 1 << a
    return adj


def graph_data(adj):
    n = len(adj)
    reached = 1
    while True:
        extended = reached
        for v in range(n):
            if reached & (1 << v):
                extended |= adj[v]
        if extended == reached:
            break
        reached = extended
    assert reached == (1 << n) - 1
    assert sum(x.bit_count() for x in adj) // 2 == n - 1


def polynomial_evaluator(adj):
    @lru_cache(None)
    def coeffs(mask):
        if not mask:
            return (1,)
        bit = mask & -mask
        v = bit.bit_length() - 1
        left = coeffs(mask ^ bit)
        right = coeffs(mask & ~(bit | adj[v]))
        result = [0] * max(len(left), len(right) + 1)
        for j, count in enumerate(left):
            result[j] += count
        for j, count in enumerate(right):
            result[j + 1] += count
        while result[-1] == 0:
            result.pop()
        return tuple(result)

    return coeffs


def value(coeffs, j):
    return coeffs[j] if 0 <= j < len(coeffs) else 0


def extract(mask):
    return [v for v in range(mask.bit_length()) if mask & (1 << v)]


def star_case():
    adj = graph(13, [(0, v) for v in range(1, 13)])
    graph_data(adj)
    poly = polynomial_evaluator(adj)
    full = (1 << 13) - 1
    counts = poly(full)
    alpha = len(counts) - 1
    x = next(j for j in range(alpha + 1) if value(counts, j + 1) < value(counts, j))
    p = 8
    leaves = [v for v in range(13) if adj[v].bit_count() == 1]
    F = [v for v in leaves if value(poly(full ^ (1 << v)), p + 1) < value(poly(full ^ (1 << v)), p)]
    assert F == list(range(1, 13)) and x + 2 <= p and 3 * p < 2 * alpha + 1

    def admissible(tag, face):
        support = 0
        H = full & ~((1 << tag) | (1 << support))
        W = adj[support] & ~(1 << tag)
        return face & ~H == 0 and face & W != 0

    def image_of(tag, vertices):
        out = []
        for position, u in enumerate(vertices):
            face = tuple(w for w in vertices if w != u)
            mask = sum(1 << w for w in face)
            if admissible(tag, mask):
                chosen = tag
                branch = 'retained'
            else:
                choices = [w for w in F if admissible(w, mask)]
                if not choices:
                    continue
                chosen = choices[0]
                branch = 'retagged'
            out.append((chosen, face, (-1) ** position, branch))
        return out

    C = tuple(range(2, 11))
    z = [(1, tuple(w for w in C if w != u), (-1) ** position)
         for position, u in enumerate(C)]
    image = defaultdict(int)
    branches = defaultdict(int)
    for tag, face, coefficient in z:
        assert len(face) == p and admissible(tag, sum(1 << w for w in face))
        for chosen, boundary, sign, branch in image_of(tag, face):
            image[(chosen, boundary)] += coefficient * sign
            branches[branch] += 1
    assert len(z) == 9 and len(image) == 36 and all(c == 0 for c in image.values())
    H_counts = poly(full & ~((1 << 1) | (1 << 0)))
    R_counts = poly(0)
    q7, q8 = value(H_counts, 7), value(H_counts, 8)
    return {
        'vertices': list(range(13)), 'edges': [(0, v) for v in range(1, 13)],
        'connected_acyclic': True, 'tree_counts': counts, 'alpha': alpha,
        'deltas_through_alpha': [value(counts, j + 1) - value(counts, j) for j in range(alpha + 1)],
        'x': x, 'p': p, 'guards': {'x_plus_2_le_p': x + 2 <= p, 'three_p_lt_two_alpha_plus_one': 3 * p < 2 * alpha + 1},
        'original_leaves': leaves, 'F': F,
        'selector_deltas': {str(v): value(poly(full ^ (1 << v)), p + 1) - value(poly(full ^ (1 << v)), p) for v in leaves},
        'H1_counts': H_counts, 'R1_counts': R_counts,
        'q7_per_tag': q7, 'q8_per_tag': q8, 'K7_dimension': len(F) * q7,
        'K8_dimension': len(F) * q8, 'S': len(F) * (q8 - q7),
        'C': C, 'kernel_vector': [{'tag': t, 'A': a, 'coefficient': c} for t, a, c in z],
        'image_distinct_faces': len(image), 'image_nonzero_coefficients': [(t, a, c) for (t, a), c in image.items() if c],
        'action_branches': dict(branches),
    }


def order24_case():
    adj = graph(24, EDGES24)
    graph_data(adj)
    poly = polynomial_evaluator(adj)
    full = (1 << 24) - 1
    counts = poly(full)
    alpha = len(counts) - 1
    x = next(j for j in range(alpha + 1) if value(counts, j + 1) < value(counts, j))
    p = 10
    k = p - 1
    leaves = [v for v in range(24) if adj[v].bit_count() == 1]
    rows = []
    for v in leaves:
        s = (adj[v] & -adj[v]).bit_length() - 1
        T_minus_v = poly(full ^ (1 << v))
        Hmask = full & ~((1 << v) | (1 << s))
        Wmask = adj[s] & ~(1 << v)
        Rmask = Hmask & ~Wmask
        Hcounts, Rcounts = poly(Hmask), poly(Rmask)
        qk = value(Hcounts, k) - value(Rcounts, k)
        qu = value(Hcounts, k + 1) - value(Rcounts, k + 1)
        delta = value(T_minus_v, p + 1) - value(T_minus_v, p)
        rows.append({'leaf': v, 'support': s, 'W': extract(Wmask),
                     'delta_p_T_minus_v': delta, 'selected': delta < 0,
                     'iH_k': value(Hcounts, k), 'iH_k1': value(Hcounts, k + 1),
                     'q_k': qk, 'q_k1': qu, 'summand': qu - qk})
    F = [r['leaf'] for r in rows if r['selected']]
    assert x + 2 <= p and 3 * p < 2 * alpha + 1 and F == leaves

    v = 0
    s = 1
    Hmask = full & ~((1 << v) | (1 << s))
    Wmask = adj[s] & ~(1 << v)
    vertices = extract(Hmask)
    independent_k = 0
    marked_k = 0
    actual_marked_addability = 0
    for A in combinations(vertices, k):
        Amask = sum(1 << u for u in A)
        if any(adj[u] & Amask for u in A):
            continue
        independent_k += 1
        if not Amask & Wmask:
            continue
        marked_k += 1
        blocked = Amask
        for u in A:
            blocked |= adj[u]
        actual_marked_addability += (Hmask & ~blocked).bit_count()
    row0 = rows[0]
    assert independent_k == row0['iH_k'] and marked_k == row0['q_k']
    numerator = actual_marked_addability * independent_k - marked_k * (k + 1) * row0['iH_k1']
    assert numerator == 1773113 and numerator > 0
    Q = sum(r['q_k'] for r in rows if r['selected'])
    U = sum(r['q_k1'] for r in rows if r['selected'])
    S = sum(r['summand'] for r in rows if r['selected'])
    assert S == U - Q == -51095
    return {
        'vertices': list(range(24)), 'edges': EDGES24, 'connected_acyclic': True,
        'tree_counts': counts, 'alpha': alpha,
        'deltas_through_alpha': [value(counts, j + 1) - value(counts, j) for j in range(alpha + 1)],
        'x': x, 'p': p, 'k': k,
        'guards': {'x_plus_2_le_p': x + 2 <= p, 'three_p_lt_two_alpha_plus_one': 3 * p < 2 * alpha + 1},
        'original_leaves': leaves, 'F': F, 'leaf_rows': rows,
        'Q': Q, 'U': U, 'S': S,
        'covariance_tag': v, 'covariance_W': extract(Wmask),
        'covariance_domain': 'uniform independent 9-sets of H_0=T-{0,1}',
        'rank9_independent_sets_enumerated': independent_k,
        'marked_rank9_sets_enumerated': marked_k,
        'actual_marked_addability_enumerated': actual_marked_addability,
        'rank10_independent_sets': row0['iH_k1'],
        'covariance_numerator': numerator,
        'covariance_denominator': independent_k ** 2,
    }


def source_hashes():
    base_paths = [
        'SOLUTION-CONTRACT.md', 'control/C4-REGISTERED-CLAIM-IDENTITY.json',
        'packets/C4-AT.json', 'cycles/cycle-4/C4-AT/REPORT.md',
        'cycles/cycle-4/C4-AT/RETURN.json',
        'preparation/C4-PREP-SIGNED-MAP-AUDIT/REPORT.md',
        'preparation/C4-PREP-SIGNED-MAP-AUDIT/RESULTS.json',
        'preparation/C4-PREP-SIGNED-MAP-AUDIT/EVIDENCE.json',
    ]
    packet = load((BASE / 'packets/C4-AT.json').open())
    paths = base_paths + [entry['path'] for entry in packet['allowed_source_files']
                          if any('/' + d + '/' in entry['path'] for d in ('C4-T1', 'C4-CF-T1', 'C4-CU-T1'))]
    hashes = {path: sha256((BASE / path).read_bytes()).hexdigest() for path in paths}
    assert all(hashes[entry['path']] == entry['sha256'] for entry in packet['allowed_source_files'] if entry['path'] in hashes)
    return hashes


def registry_comparison():
    registry = load((BASE / 'control/C4-REGISTERED-CLAIM-IDENTITY.json').open())['claims']
    proposals = load((HERE / 'CLAIMS-DRAFT.json').open())['claims']
    proposed_keys = [c['claim_key'] for c in proposals]
    normalized = lambda s: ' '.join(s.lower().split())
    exact_statement_collisions = [
        {'proposed': p['claim_key'], 'registered': c['claim_key']}
        for p in proposals for c in registry
        if normalized(p['statement']) == normalized(c['statement'])
    ]
    alias_collisions = [
        {'proposed': p['claim_key'], 'registered': c['claim_key'], 'alias': alias}
        for p in proposals for c in registry for alias in c.get('aliases', [])
        if normalized(p['statement']) == normalized(alias)
    ]
    key_collisions = [key for key in proposed_keys if any(c['claim_key'] == key for c in registry)]
    assert len(registry) == 426 and not key_collisions and not exact_statement_collisions and not alias_collisions
    return {'canonical_prior_claim_count': len(registry),
            'proposed_keys': proposed_keys,
            'proposed_key_collisions': key_collisions,
            'exact_statement_collisions': exact_statement_collisions,
            'exact_alias_collisions': alias_collisions,
            'related_registered_claims': [
                {'claim_key': c['claim_key'], 'status': c['status'], 'statement': c['statement'], 'scope': c['scope']}
                for c in registry if c['claim_key'] in {
                    'E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY',
                    'E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL',
                    'E993-R23-LITERAL-DELETE-ONLY-HALL',
                    'E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION',
                    'E993-R19-U2-UNIVERSAL-FACES',
                    'E993-C3-G1-POINTWISE-ADDABILITY-BOUND',
                    'E993-LOWER-REGION-EARLY-MARKED-OCCUPANCY-TRANSFER',
                    'E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE',
                    'E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL',
                }],
            }


if __name__ == '__main__':
    result = {'authority': 'independent scratchpad arithmetic only',
              'source_sha256': source_hashes(), 'star': star_case(),
              'order24': order24_case(), 'registry_comparison': registry_comparison()}
    with (HERE / 'EVIDENCE.json').open('w') as f:
        dump(result, f, indent=2)
        f.write('\n')
    print('star kernel image zero:', not result['star']['image_nonzero_coefficients'])
    print('order24 covariance:', result['order24']['covariance_numerator'], '/', result['order24']['covariance_denominator'])
    print('order24 S:', result['order24']['S'])
    print('source hashes:', len(result['source_sha256']))
