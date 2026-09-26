"""Exact finite orbit-flow diagnostic; no universal or formal award."""
from pathlib import Path
from math import factorial
from collections import deque
import json, sys, hashlib

P = Path(__file__).resolve().parent
B = P.parents[1]
sys.path.insert(0, str(B / 'inputs'))
import ordinary_tree_checked as O


def layer(m, rank):
    out = {}
    fac = [factorial(j) for j in range(m + 1)]
    for root in (0, 1):
        for special in ((0, 2) if root else (0, 1, 2)):
            target = rank - root - (special != 0)
            if target < 0:
                continue
            for triples in range(min(m, target // 3) + 1):
                for pairs in range(min(m - triples, (target - 3 * triples) // 2) + 1):
                    rest = target - 3 * triples - 2 * pairs
                    if rest + pairs + triples > m:
                        continue
                    for centers in (range(rest + 1) if not root else (0,)):
                        singles = rest - centers
                        empty = m - rest - pairs - triples
                        counts = (empty, centers, singles, pairs, triples)
                        multiplicity = fac[m]
                        denominator = 1
                        for x in counts:
                            denominator *= fac[x]
                        assert multiplicity % denominator == 0
                        multiplicity = multiplicity // denominator * 3 ** (singles + pairs)
                        state = (root, special, *counts)
                        assert state not in out
                        out[state] = multiplicity
    return out


def neighbors(state):
    root, special, *counts = state
    result = set()
    if root:
        result.add((0, special, *counts))
    if special:
        result.add((root, 0, *counts))
    for before, after in ((1, 0), (2, 0), (3, 2), (4, 3)):
        if counts[before]:
            new = counts.copy()
            new[before] -= 1
            new[after] += 1
            result.add((root, special, *new))
    return result


def weight(state, selected_special, selected_arm):
    root, special, empty, centers, singles, pairs, triples = state
    return (selected_special * (special == 2) + selected_arm * (singles + 2 * pairs + 3 * triples)
            if root else selected_arm * (2 * pairs + 3 * triples))


class Dinic:
    def __init__(self, n):
        self.g = [[] for _ in range(n)]

    def add(self, u, v, cap):
        f = [v, cap, len(self.g[v])]
        b = [u, 0, len(self.g[u])]
        self.g[u].append(f)
        self.g[v].append(b)
        return f, b

    def run(self, source, sink, supply):
        total = 0
        n = len(self.g)
        sys.setrecursionlimit(max(10000, 3 * n))
        while total < supply:
            level = [-1] * n
            level[source] = 0
            q = deque([source])
            while q:
                u = q.popleft()
                for v, cap, rev in self.g[u]:
                    if cap and level[v] < 0:
                        level[v] = level[u] + 1
                        q.append(v)
            if level[sink] < 0:
                break
            at = [0] * n

            def send(u, cap):
                if u == sink:
                    return cap
                while at[u] < len(self.g[u]):
                    edge = self.g[u][at[u]]
                    v, remain, rev = edge
                    if remain and level[v] == level[u] + 1:
                        amount = send(v, min(cap, remain))
                        if amount:
                            edge[1] -= amount
                            self.g[v][rev][1] += amount
                            return amount
                    at[u] += 1
                return 0

            while total < supply:
                amount = send(source, supply - total)
                if not amount:
                    break
                total += amount
        reached = {source}
        q = deque([source])
        while q:
            u = q.popleft()
            for v, cap, rev in self.g[u]:
                if cap and v not in reached:
                    reached.add(v)
                    q.append(v)
        return total, reached


def check(m, fixed_p):
    T, _ = O.t_family(m)
    poly = T.forest_independence_polynomial()
    x = O.first_strict_descent(poly)
    p = fixed_p if fixed_p is not None else x + 2
    row = O.aggregate_row(T, p)
    assert x + 2 <= p and 3 * p < 2 * (len(poly) - 1) + 1
    favorable = set(row['favorable_leaves'])
    arm_leaves = set(T.leaves()) - {2}
    assert not (favorable & arm_leaves) or arm_leaves <= favorable
    select_special = int(2 in favorable)
    select_arm = int(arm_leaves <= favorable)
    upper, lower = layer(m, p + 1), layer(m, p)
    assert sum(upper.values()) == O.coefficient(poly, p + 1)
    assert sum(lower.values()) == O.coefficient(poly, p)
    uc = {s: mult * weight(s, select_special, select_arm) for s, mult in upper.items()}
    lc = {s: mult * weight(s, select_special, select_arm) for s, mult in lower.items()}
    supply, capacity = sum(uc.values()), sum(lc.values())
    assert supply - capacity == row['aggregate']
    upper_states, lower_states = sorted(uc), sorted(lc)
    uid = {s: i + 1 for i, s in enumerate(upper_states)}
    lid = {s: i + 1 + len(uid) for i, s in enumerate(lower_states)}
    sink = 1 + len(uid) + len(lid)
    network = Dinic(sink + 1)
    for s in upper_states:
        network.add(0, uid[s], uc[s])
    for s in lower_states:
        network.add(lid[s], sink, lc[s])
    arcs = []
    for s in upper_states:
        for t in sorted(neighbors(s)):
            assert t in lid
            f, b = network.add(uid[s], lid[t], supply + 1)
            arcs.append((s, t, b))
    flow, reached = network.run(0, sink, supply)
    positive = [(s, t, edge[1]) for s, t, edge in arcs if edge[1]]
    # Independent conservation/capacity validation of the emitted primal.
    source_out = {s: 0 for s in upper_states}
    sink_in = {s: 0 for s in lower_states}
    for s, t, amount in positive:
        assert amount > 0 and t in neighbors(s)
        source_out[s] += amount
        sink_in[t] += amount
    assert sum(source_out.values()) == sum(sink_in.values()) == flow
    assert all(source_out[s] <= uc[s] for s in uc)
    assert all(sink_in[t] <= lc[t] for t in lc)
    cut = [s for s in upper_states if uid[s] in reached]
    cut_neighbors = set().union(*(neighbors(s) for s in cut)) if cut else set()
    cut_deficit = sum(uc[s] for s in cut) - sum(lc[t] for t in cut_neighbors)
    assert supply - flow == cut_deficit
    artifact = {'m': m, 'p': p, 'graph_row': row, 'upper_states': len(upper),
                'lower_states': len(lower), 'deletion_orbit_arcs': len(arcs),
                'upper_supply': supply, 'lower_capacity': capacity, 'flow': flow,
                'saturates': flow == supply, 'cut_deficit': cut_deficit,
                'cut_upper_states': cut, 'positive_flow_arcs': positive,
                'evidence_grade': 'bounded_computation', 'formal_award': False}
    target = P / f'm{m}-p{p}.json'
    with target.open('x') as f:
        json.dump(artifact, f, sort_keys=True)
        f.write('\n')
    summary = {k: v for k, v in artifact.items() if k not in ('graph_row', 'cut_upper_states', 'positive_flow_arcs')}
    summary['artifact'] = target.name
    summary['sha256'] = hashlib.sha256(target.read_bytes()).hexdigest()
    print(json.dumps(summary), flush=True)
    return summary


if __name__ == '__main__':
    results = [check(m, p) for m, p in ((22, 34), (60, 90), (66, None))]
    with (P / 'RESULTS.json').open('x') as f:
        json.dump({'results': results, 'scope': 'three specified T_m trees and ranks only; orbit lift requires mathematical audit',
                   'formal_award': False}, f, indent=2)
        f.write('\n')
