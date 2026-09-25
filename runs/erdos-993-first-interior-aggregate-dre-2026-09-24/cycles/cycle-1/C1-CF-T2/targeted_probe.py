import json
import random
from ordinary_tree import t_family, prufer_tree, delta


def inspect(t):
    tp = t.forest_independence_polynomial()
    alpha = len(tp) - 1
    p = alpha - 2
    x = next(k for k in range(len(tp) + 1) if delta(tp, k) < 0)
    selected = []
    for v in t.leaves():
        s = t.support(v)
        a = delta(t.remove({v}).forest_independence_polynomial(), p)
        if a >= 0:
            continue
        h = t.remove({v, s}).forest_independence_polynomial()
        r = t.remove(t.closed_neighborhood({s})).forest_independence_polynomial()
        selected.append((v, a, delta(h, p - 1) - delta(r, p - 1)))
    return dict(n=len(t.vertices), alpha=alpha, p=p, x=x, eligible=x+2<=p,
                favorable=len(selected), positive=sum(g>0 for _, _, g in selected),
                aggregate=sum(g for _, _, g in selected), max_g=max((g for _, _, g in selected), default=None))


rows = []
for m in (8, 22, 40):
    t, marked = t_family(m)
    row = inspect(t)
    row.update(family='T_m', m=m)
    rows.append(row)

rng = random.Random(582221)
for n in (12, 18, 24, 30):
    for j in range(30):
        t = prufer_tree([rng.randrange(n) for _ in range(n - 2)])
        row = inspect(t)
        row.update(family='Prufer', order=n, index=j)
        rows.append(row)

summary = dict(cases=len(rows), eligible=sum(r['eligible'] for r in rows),
               positive_pointwise_cases=sum(r['positive'] > 0 and r['eligible'] for r in rows),
               positive_aggregate_cases=sum(r['aggregate'] > 0 and r['eligible'] for r in rows),
               constructed=[r for r in rows if r['family'] == 'T_m'])
with open('scratchpad/C1-CF-T2/targeted-probe.json', 'w') as f:
    json.dump(dict(summary=summary, rows=rows), f, indent=2)
print(json.dumps(summary, indent=2))
