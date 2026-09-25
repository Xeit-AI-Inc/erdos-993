"""Bounded attempt to falsify a pointwise top-shell repair conjecture."""
import json
import random
from ordinary_tree_copy import prufer_tree, coefficient, delta

rng = random.Random(99320260924)
results = []
for n, trials in [(16, 300), (24, 300), (40, 300), (60, 200)]:
    eligible = 0
    favorable_tags = 0
    positive_favorable = []
    positive_unselected = []
    positive_aggregate = []
    min_aggregate = None
    max_aggregate = None
    for trial in range(trials):
        sequence = [rng.randrange(n) for _ in range(n - 2)]
        T = prufer_tree(sequence)
        P = T.forest_independence_polynomial()
        a = len(P) - 1
        p = a - 2
        x = next(k for k in range(len(P)) if delta(P, k) < 0)
        if x + 2 > p:
            continue
        eligible += 1
        total = 0
        for v in T.leaves():
            s = T.support(v)
            H = T.remove({v, s}).forest_independence_polynomial()
            R = T.remove(T.closed_neighborhood({s})).forest_independence_polynomial()
            qtop = coefficient(H, p) - coefficient(R, p)
            qlow = coefficient(H, p - 1) - coefficient(R, p - 1)
            g = qtop - qlow
            favorable = delta(T.remove({v}).forest_independence_polynomial(), p) < 0
            witness = {'n': n, 'trial': trial, 'sequence': sequence, 'alpha': a,
                       'x': x, 'p': p, 'leaf': v, 'g': g, 'qtop': qtop,
                       'qlow': qlow}
            if favorable:
                favorable_tags += 1
                total += g
                if g > 0 and len(positive_favorable) < 3:
                    positive_favorable.append(witness)
            elif g > 0 and len(positive_unselected) < 3:
                positive_unselected.append(witness)
        min_aggregate = total if min_aggregate is None else min(min_aggregate, total)
        max_aggregate = total if max_aggregate is None else max(max_aggregate, total)
        if total > 0 and len(positive_aggregate) < 3:
            positive_aggregate.append({'n': n, 'trial': trial, 'sequence': sequence,
                                       'alpha': a, 'x': x, 'p': p, 'sum': total})
    results.append({'n': n, 'trials': trials, 'eligible': eligible,
                    'favorable_tags': favorable_tags,
                    'positive_favorable_examples': positive_favorable,
                    'positive_unselected_examples': positive_unselected,
                    'positive_aggregate_examples': positive_aggregate,
                    'min_aggregate': min_aggregate, 'max_aggregate': max_aggregate})
print(json.dumps(results, indent=2))
