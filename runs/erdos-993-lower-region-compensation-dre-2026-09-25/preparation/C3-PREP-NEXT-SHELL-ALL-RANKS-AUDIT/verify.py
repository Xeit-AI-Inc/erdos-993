#!/usr/bin/env python3
"""Exact independent finite checks for the bounded proposal."""
import itertools
import json
import math
from pathlib import Path

ROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
CERT = ROOT / 'control/C3-MATCHING4-BOOLEAN-LIFT-CERTIFICATE.json'

def choose(n, r):
    return math.comb(n, r) if 0 <= r <= n else 0

def E(n, t):
    return choose(n, t + 1) - choose(n, t)

def cat(t):
    return choose(2 * t, t) // (t + 1)

def budget(r, excluded_singletons=0):
    return sum((choose(5, a) - (excluded_singletons if a == 1 else 0)) * cat(r-a)
               for a in range(1, min(5, r) + 1))

data = json.loads(CERT.read_text())
edges = [set(e) for e in data['graph_edges']]
vertices = set(range(9))
def independent(s):
    return all(not e <= set(s) for e in edges)

upper = {frozenset(s) for s in itertools.combinations(vertices, 4) if independent(s)}
lower = {frozenset(s) for s in itertools.combinations(vertices, 3) if independent(s)}
rows = data['injection']
sources = [frozenset(row['upper']) for row in rows]
targets = [frozenset(row['lower']) for row in rows]
assert len(upper) == data['upper_count'] == len(rows) == 48
assert len(lower) == data['lower_count'] == 56
assert len(set(sources)) == len(sources) and set(sources) == upper
assert len(set(targets)) == len(targets) and set(targets) <= lower
assert all(t < s for s, t in zip(sources, targets))

small = []
for p, dmax in [(6, 2), (7, 3)]:
    n, N = 2*p+3, 2*p-2
    assert dmax == (n-1)//5
    bmin = N-dmax
    for r in range(p-1):
        empty = E(N, r)
        original = empty-budget(r)
        special = E(bmin, r-1) if r >= 1 else 1
        improved = (empty + special-budget(r, excluded_singletons=1)) if r >= 1 else empty
        assert improved >= 0
        small.append({'p':p, 'r':r, 'n':n, 'N':N, 'b_min':bmin,
                      'empty':empty, 'ordinary_budget':budget(r),
                      'ordinary_margin':original, 'special_singleton_floor':special,
                      'other_negative_budget':budget(r, excluded_singletons=1),
                      'improved_margin':improved})

large = []
for r in range(6):
    large.append({'r':r, 'empty':E(14,r), 'budget':budget(r),
                  'margin':E(14,r)-budget(r)})
assert all(x['margin'] > 0 for x in large)
large6 = {'r':6, 'empty':E(14,6), 'budget':budget(6),
          'margin':E(14,6)-budget(6)}
assert large6 == {'r':6,'empty':429,'budget':411,'margin':18}

low = [{'p':p, 'n':2*p+3, 'max_order_if_eligible':4*(p-2),
        'gap':2*p+3-4*(p-2)} for p in (3,4,5)]
assert all(x['gap'] > 0 for x in low)

out = {'certificate':{'upper_count':len(upper),'lower_count':len(lower),
                       'distinct_subset_images':len(set(targets))},
       'small_rank_rows':small, 'large_rank_endpoints':large+[large6],
       'low_rank_exclusion':low,
       'methods':'exact integer binomial arithmetic; complete finite nine-vertex core enumeration'}
Path('EVIDENCE.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out, indent=2))
