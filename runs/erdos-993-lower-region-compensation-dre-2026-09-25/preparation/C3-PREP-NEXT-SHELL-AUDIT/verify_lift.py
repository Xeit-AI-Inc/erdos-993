#!/usr/bin/env python3
"""Independent, bounded checks for the pinned 4-matching deletion certificate.

The universal argument is written in REPORT.md; this script verifies the finite
certificate and samples its Boolean-chain lift at several values of k.
"""

import itertools
import json
from fractions import Fraction
from math import comb
from pathlib import Path

ROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
CERT = ROOT / 'control/C3-MATCHING4-BOOLEAN-LIFT-CERTIFICATE.json'
OUT = Path(__file__).with_name('EVIDENCE.json')


def independent_core():
    for states in itertools.product(((), (0,), (1,)), repeat=4):
        yield frozenset(2 * i + v for i, state in enumerate(states) for v in state)


core = tuple(independent_core())
data = json.loads(CERT.read_text())
assert data['graph_edges'] == [[0, 1], [2, 3], [4, 5], [6, 7]]
assert data['isolated_vertex'] == 8
assert (data['upper_rank'], data['lower_rank']) == (4, 3)
domain = {s | bit for s in core for bit in (frozenset(), frozenset({8})) if len(s | bit) == 4}
codomain = {s | bit for s in core for bit in (frozenset(), frozenset({8})) if len(s | bit) == 3}
rows = data['injection']
mapping = {}
for number, row in enumerate(rows, 1):
    upper, lower = frozenset(row['upper']), frozenset(row['lower'])
    assert len(row['upper']) == 4 and len(upper) == 4, number
    assert len(row['lower']) == 3 and len(lower) == 3, number
    assert upper in domain and lower in codomain, number
    assert lower < upper, number
    assert upper not in mapping, number
    mapping[upper] = lower
assert len(rows) == data['upper_count'] == len(domain) == 48
assert len(codomain) == data['lower_count'] == 56
assert set(mapping) == domain
assert len(set(mapping.values())) == len(mapping)


def scd(n):
    chains = [(frozenset(),)]
    for new in range(n):
        next_chains = []
        for chain in chains:
            next_chains.append(chain + (chain[-1] | {new},))
            if len(chain) > 1:
                next_chains.append(tuple(s | {new} for s in chain[:-1]))
        chains = next_chains
    all_sets = [s for chain in chains for s in chain]
    assert len(all_sets) == len(set(all_sets)) == 2**n
    for chain in chains:
        assert len(chain[0]) + len(chain[-1]) == n
        assert all(x < y and len(y) == len(x) + 1 for x, y in zip(chain, chain[1:]))
    return chains


lift_checks = []
for k in range(4, 9):
    n = 2 * k - 7
    chains = scd(n)
    index = {s: (chain, t) for chain in chains for t, s in enumerate(chain)}
    images = {}
    short = long = 0
    for s in core:
        j = len(s)
        for outside_tuple in itertools.combinations(range(n), k-j):
            outside = frozenset(outside_tuple)
            chain, t = index[outside]
            a = len(chain[0])
            if a <= k-5:
                assert t > 0
                result = (s, chain[t-1])
                long += 1
            else:
                assert a == k-4 and len(chain) == 2
                b = next(iter(chain[1] - chain[0]))
                bit = frozenset({8}) if b in outside else frozenset()
                upper = s | bit
                lower = mapping[upper]
                core_out = lower - {8}
                outside_out = chain[0] | ({b} if 8 in lower else set())
                result = (core_out, frozenset(outside_out))
                short += 1
            assert len(result[0]) + len(result[1]) == k-1
            assert result[0] <= s and result[1] <= outside
            assert result not in images, (k, result)
            images[result] = (s, outside)
    expected = sum(comb(4, j) * 2**j * comb(n, k-j)
                   for j in range(5) if 0 <= k-j <= n)
    assert len(images) == expected
    lift_checks.append({'k': k, 'upper_count': expected,
                        'long_chain_sources': long, 'two_element_chain_sources': short,
                        'distinct_images': len(images)})


def catalan(j):
    return comb(2*j, j)//(j+1)


cover_cases = []
for r in range(7):
    n = 14 if r <= 5 else 2*r+2
    empty = comb(n, r+1)-comb(n, r)
    debt = sum(comb(5, a)*catalan(r-a) for a in range(1, min(5, r)+1))
    cover_cases.append({'r': r, 'N': n, 'empty_fiber': empty,
                        'negative_budget': debt, 'margin': empty-debt})
assert [v['margin'] for v in cover_cases] == [13,72,258,607,941,855,18]

coefficient_checks = []
for a in range(12):
    n, k = 2*a+1, a+4
    def coef(h):
        return sum(comb(4,j)*2**j*comb(n,h-j)
                   for j in range(5) if 0 <= h-j <= n)
    normalized = Fraction(coef(k)-coef(k-1), comb(n,a))
    formula = -Fraction(6*(9*a*a+39*a+32), (a+2)*(a+3)*(a+4))
    assert normalized == formula < 0
    coefficient_checks.append({'a':a, 'difference':coef(k)-coef(k-1),
                               'normalized':str(normalized)})

result = {'status':'all_assertions_passed', 'certificate_rows':len(rows),
          'domain_count':len(domain), 'codomain_count':len(codomain),
          'unique_images':len(set(mapping.values())), 'lift_checks':lift_checks,
          'cover_five_cases':cover_cases, 'coefficient_checks':coefficient_checks,
          'limitations':'Finite checks only; universal arguments are in REPORT.md.'}
OUT.write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result, indent=2))
