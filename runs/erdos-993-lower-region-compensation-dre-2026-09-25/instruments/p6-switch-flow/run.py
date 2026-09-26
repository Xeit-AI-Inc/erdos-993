"""Bounded direct-set flow check on the 241 sealed p6 residual census rows."""
from pathlib import Path
import sys, json, importlib.util, hashlib

P = Path(__file__).resolve().parent
B = P.parents[1]
sys.path.insert(0, str(B / 'inputs'))
import ordinary_tree_checked as O
spec = importlib.util.spec_from_file_location('orbit_switch', B/'instruments/orbit-flow-twoforone/run.py')
Q = importlib.util.module_from_spec(spec)
spec.loader.exec_module(Q)


def graph(code):
    edges = []
    counter = 0
    def parse(s, at, parent=None):
        nonlocal counter
        assert s[at] == '('
        u = counter
        counter += 1
        at += 1
        if parent is not None:
            edges.append((parent, u))
        while s[at] != ')':
            _, at = parse(s, at, u)
        return u, at + 1
    if code.startswith('U:'):
        s = code[2:]
        _, end = parse(s, 0)
        assert end == len(s)
    else:
        a, b = code[2:].split('|')
        u, end = parse(a, 0)
        assert end == len(a)
        _, end = parse(b, 0, u)
        assert end == len(b)
    return O.Graph.from_edges(range(counter), edges), edges


def run(row):
    T, edges = graph(row['centroid_code'])
    p, n = row['rank'], row['order']
    assert p == 6 and len(T.vertices) == n
    fresh = O.aggregate_row(T, p)
    assert all(fresh[k] == row[k] for k in fresh)
    assert fresh['first_strict_descent'] + 2 <= p and 3*p < 2*fresh['alpha']+1
    adj = [sum(1 << v for v in T.adjacency[u]) for u in range(n)]
    witnesses = [(1 << v, adj[T.support(v)] & ~(1 << v)) for v in fresh['favorable_leaves']]
    independent = bytearray(1 << n)
    independent[0] = 1
    upper, lower = {}, {}
    for mask in range(1, 1 << n):
        bit = mask & -mask
        vertex = bit.bit_length() - 1
        rest = mask ^ bit
        independent[mask] = bool(independent[rest] and not(adj[vertex] & rest))
        if independent[mask] and mask.bit_count() in (p, p+1):
            w = sum(bool(mask & v) and bool(mask & W) for v, W in witnesses)
            if w:
                (upper if mask.bit_count() == p+1 else lower)[mask] = w
    supply, capacity = sum(upper.values()), sum(lower.values())
    assert supply - capacity == fresh['aggregate']
    uid = {s: i+1 for i, s in enumerate(upper)}
    lid = {s: len(uid)+i+1 for i, s in enumerate(lower)}
    sink = len(uid)+len(lid)+1
    net = Q.Dinic(sink+1)
    for s, weight in upper.items():
        net.add(0, uid[s], weight)
    for s, weight in lower.items():
        net.add(lid[s], sink, weight)
    arcs, adjacency = [], {}
    for s in upper:
        nbr = {s ^ (1 << v) for v in range(n) if s >> v & 1}
        for v in range(n):
            if s >> v & 1:
                continue
            hit = adj[v] & s
            if hit.bit_count() == 2:
                t = (s ^ hit) | (1 << v)
                assert independent[t] and t.bit_count() == p
                nbr.add(t)
        adjacency[s] = nbr & lower.keys()
        for t in sorted(adjacency[s]):
            f, b = net.add(uid[s], lid[t], supply+1)
            arcs.append((s, t, b))
    flow, reachable = net.run(0, sink, supply)
    positive = [(s, t, e[1]) for s, t, e in arcs if e[1]]
    outgoing = dict.fromkeys(upper, 0)
    incoming = dict.fromkeys(lower, 0)
    for s, t, amount in positive:
        assert amount > 0 and t in adjacency[s]
        outgoing[s] += amount
        incoming[t] += amount
    assert all(outgoing[s] <= upper[s] for s in upper)
    assert all(incoming[t] <= lower[t] for t in lower)
    assert sum(outgoing.values()) == sum(incoming.values()) == flow
    cut = [s for s in upper if uid[s] in reachable]
    neighbors = set().union(*(adjacency[s] for s in cut)) if cut else set()
    deficit = sum(upper[s] for s in cut) - sum(lower[t] for t in neighbors)
    assert deficit == supply-flow
    return {'centroid_code': row['centroid_code'], 'order': n, 'rank': p,
            'edges': edges, 'favorable_leaves': fresh['favorable_leaves'],
            'x': fresh['first_strict_descent'], 'alpha': fresh['alpha'],
            'aggregate': fresh['aggregate'], 'upper_supply': supply, 'lower_capacity': capacity,
            'positive_weight_upper_sets': len(upper), 'positive_weight_lower_sets': len(lower),
            'arcs': len(arcs), 'flow': flow, 'deficit': deficit,
            'cut_upper_masks': cut, 'positive_flow_arcs': positive}


if __name__ == '__main__':
    source = B/'instruments/p6-order14-15/RESULTS.json'
    data = json.loads(source.read_text())
    rows = [row for block in data['results'] for row in block['rows']]
    assert len(rows) == 241
    results = []
    for i, row in enumerate(rows, 1):
        results.append(run(row))
        if i % 50 == 0:
            print(json.dumps({'checked': i, 'failures': sum(r['deficit'] > 0 for r in results)}), flush=True)
    summary = {'scope': 'all 241 eligible p6 census rows at orders14 and15; no other ranks or orders',
               'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
               'evidence_grade': 'bounded_computation', 'formal_award': False,
               'cases': len(results), 'failures': sum(r['deficit'] > 0 for r in results), 'rows': results}
    with (P/'RESULTS.json').open('x') as f:
        json.dump(summary, f, sort_keys=True)
        f.write('\n')
    print(json.dumps({k: v for k, v in summary.items() if k != 'rows'}), flush=True)
