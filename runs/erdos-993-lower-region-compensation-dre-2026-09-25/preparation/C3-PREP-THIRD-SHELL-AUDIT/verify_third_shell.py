#!/usr/bin/env python3
"""Finite certificate, bounded SCD, and Catalan arithmetic checks only."""
import itertools
import json
from math import comb
from pathlib import Path

BASE = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
HERE = Path(__file__).parent


def core_sets(edges):
    return {frozenset(picked) for choices in itertools.product(range(3), repeat=len(edges))
            for picked in [tuple(edges[i][choice - 1] for i, choice in enumerate(choices) if choice)]}


def check_cert(path, edges, cases):
    data = json.loads((BASE / path).read_text())
    assert data['matching_edges' if len(edges) == 5 else 'graph_edges'] == edges
    core = core_sets(edges)
    maps = {}
    summaries = []
    for case in cases:
        rank, prefix_max, upper_expected, lower_expected = case
        cert = next(c for c in data['cases'] if c['rank'] == rank and
                    c['outside_prefix_chain_length'] == prefix_max) if len(edges) == 5 else data
        prefix = [frozenset(range(2 * len(edges), 2 * len(edges) + t)) for t in range(prefix_max + 1)]
        upper_domain = {s | q for s in core for q in prefix if len(s | q) == rank}
        lower_domain = {s | q for s in core for q in prefix if len(s | q) == rank - 1}
        assert len(upper_domain) == upper_expected == cert['upper_count']
        assert len(lower_domain) == lower_expected == cert['lower_count']
        mapping = {}
        for row in cert['injection']:
            u, v = frozenset(row['upper']), frozenset(row['lower'])
            assert len(row['upper']) == len(u) == rank
            assert len(row['lower']) == len(v) == rank - 1
            assert u in upper_domain and v in lower_domain and v < u
            assert u not in mapping
            mapping[u] = v
        assert len(cert['injection']) == len(mapping) == upper_expected
        assert set(mapping) == upper_domain
        assert len(set(mapping.values())) == len(mapping)
        maps[prefix_max] = mapping
        summaries.append(dict(rank=rank, prefix_chain_edges=prefix_max,
                              domain=len(upper_domain), codomain=len(lower_domain),
                              distinct_images=len(set(mapping.values()))))
    return core, maps, summaries


def scd(n):
    chains = [(frozenset(),)]
    for b in range(n):
        new = []
        for chain in chains:
            new.append(chain + (chain[-1] | {b},))
            if len(chain) > 1:
                new.append(tuple(s | {b} for s in chain[:-1]))
        chains = new
    assert {s for chain in chains for s in chain} == {
        frozenset(s) for size in range(n + 1) for s in itertools.combinations(range(n), size)}
    assert sum(map(len, chains)) == 2 ** n
    for chain in chains:
        assert len(chain[0]) + len(chain[-1]) == n
        assert all(y > x and len(y) == len(x) + 1 for x, y in zip(chain, chain[1:]))
    return chains


def lift_check(k, matching_count, core, maps):
    outside_n = 2 * k - (8 if matching_count == 5 else 7)
    index = {s: (chain, t) for chain in scd(outside_n) for t, s in enumerate(chain)}
    images = {}
    case_counts = {'predecessor': 0, 'prefix_2': 0, 'prefix_1': 0, 'prefix_0': 0}
    for c in core:
        if not 0 <= k - len(c) <= outside_n:
            continue
        for qtuple in itertools.combinations(range(outside_n), k - len(c)):
            q = frozenset(qtuple)
            chain, t = index[q]
            a = len(chain[0])
            threshold = k - (6 if matching_count == 5 else 5)
            if a <= threshold:
                assert t > 0
                out = (c, chain[t - 1])
                case_counts['predecessor'] += 1
            else:
                if matching_count == 5:
                    assert a in (k - 5, k - 4)
                    prefix_max = 2 if a == k - 5 else 0
                else:
                    assert a == k - 4
                    prefix_max = 1
                assert len(chain) == prefix_max + 1
                prefix = frozenset(range(2 * matching_count, 2 * matching_count + t))
                u = c | prefix
                v = maps[prefix_max][u]
                c_out = frozenset(x for x in v if x < 2 * matching_count)
                t_out = len(v - c_out)
                out = (c_out, chain[t_out])
                case_counts['prefix_' + str(prefix_max)] += 1
            assert len(out[0]) + len(out[1]) == k - 1
            assert out[0] <= c and out[1] <= q
            assert out not in images
            images[out] = (c, q)
    expected = sum(comb(matching_count, j) * 2 ** j * comb(outside_n, k - j)
                   for j in range(matching_count + 1) if 0 <= k - j <= outside_n)
    assert len(images) == expected
    return dict(k=k, outside_vertices=outside_n, upper=expected,
                distinct_images=len(images), cases=case_counts)


def cat(j):
    return comb(2 * j, j) // (j + 1)


def budget(r, n, cover):
    e = comb(n, r + 1) - comb(n, r)
    debt = sum(comb(cover, a) * cat(r - a) for a in range(1, min(cover, r) + 1))
    return dict(r=r, N=n, empty=e, debt=debt, margin=e - debt)


core5, maps5, cert5 = check_cert(
    'control/C3-MATCHING5-EVEN-FINITE-CERTIFICATES.json',
    [[2 * i, 2 * i + 1] for i in range(5)], [(4, 0, 80, 80), (5, 2, 192, 200)])
core4, maps4, cert4 = check_cert(
    'control/C3-MATCHING4-BOOLEAN-LIFT-CERTIFICATE.json',
    [[2 * i, 2 * i + 1] for i in range(4)], [(4, 1, 48, 56)])
four_metadata = json.loads((BASE / 'control/C3-MATCHING4-BOOLEAN-LIFT-CERTIFICATE.json').read_text())
assert four_metadata['isolated_vertex'] == 8
assert (four_metadata['upper_rank'], four_metadata['lower_rank']) == (4, 3)
small = [budget(r, 26, 6) for r in range(12)]
large = budget(12, 26, 6)
assert [b['margin'] for b in small] == [25, 293, 2254, 12303, 50735, 164230,
                                        426971, 902685, 1556639, 2168811, 2352977, 1721965]
assert large['margin'] == 16848
assert all(b['margin'] > 0 for b in small + [large])
def matching5_coefficient(rank, isolates):
    return sum(comb(5, j) * 2 ** j * comb(isolates, rank - j)
               for j in range(6) if 0 <= rank - j <= isolates)

next_order_example = {'k': 13, 'graph': '5K2 plus 19 isolated vertices',
                      'order': 29, 'i_k': matching5_coefficient(13, 19),
                      'i_k_minus_1': matching5_coefficient(12, 19)}
assert next_order_example['i_k'] - next_order_example['i_k_minus_1'] == 1202852
result = {'finite_certificates': {'matching5': cert5, 'matching4': cert4},
          'matching5_bounded_lift': [lift_check(k, 5, core5, maps5) for k in range(4, 9)],
          'matching4_bounded_lift': [lift_check(k, 4, core4, maps4) for k in range(4, 8)],
          'cover_six_N26_r0_to_11': small, 'cover_six_r12': large,
          'next_residual_order_boundary': next_order_example,
          'scope': 'finite enumeration and bounded lift checks; universal proof is in REPORT.md'}
(HERE / 'EVIDENCE.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
