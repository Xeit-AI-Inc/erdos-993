#!/usr/bin/env python3
"""Independent bounded validator for the pinned p=6 literal switch flows.

Reads only the task brief and its pinned source data. Does not import or run a
producer and does not solve a new max-flow problem.
"""

from __future__ import annotations

from collections import Counter
from hashlib import sha256
import json
from pathlib import Path


ROOT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
BRIEF = ROOT / 'control/C2-PREP-P6-SWITCH-AUDIT.json'
SCRATCH = Path(__file__).resolve().parent


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def graph_from_code(code):
    require(code.startswith(('U:', 'B:')), 'unrecognized centroid recipe')
    pieces = [code[2:]] if code.startswith('U:') else code[2:].split('|')
    require(len(pieces) == (1 if code.startswith('U:') else 2), 'recipe pieces')
    edges = []
    number = 0

    def parse(piece, offset, parent):
        nonlocal number
        require(offset < len(piece) and piece[offset] == '(', 'opening parenthesis')
        vertex = number
        number += 1
        if parent is not None:
            edges.append((parent, vertex))
        offset += 1
        while offset < len(piece) and piece[offset] == '(':
            offset = parse(piece, offset, vertex)
        require(offset < len(piece) and piece[offset] == ')', 'closing parenthesis')
        return offset + 1

    require(parse(pieces[0], 0, None) == len(pieces[0]), 'first recipe consumed')
    if len(pieces) == 2:
        require(parse(pieces[1], 0, 0) == len(pieces[1]), 'second recipe consumed')
    require(len(edges) == number - 1, 'tree edge count')
    adjacency = [0] * number
    for u, v in edges:
        require(u != v and not (adjacency[u] & (1 << v)), 'simple edges')
        adjacency[u] |= 1 << v
        adjacency[v] |= 1 << u
    return edges, adjacency


def independent_masks(adjacency):
    n = len(adjacency)
    flags = bytearray(1 << n)
    flags[0] = 1
    counts = [0] * (n + 1)
    counts[0] = 1
    masks = [0]
    for mask in range(1, 1 << n):
        bit = mask & -mask
        vertex = bit.bit_length() - 1
        rest = mask ^ bit
        if flags[rest] and not (adjacency[vertex] & rest):
            flags[mask] = 1
            masks.append(mask)
            counts[mask.bit_count()] += 1
    return flags, masks, counts


def leaf_statistics(adjacency, masks, n, p):
    leaves = [v for v in range(n) if adjacency[v].bit_count() == 1]
    candidates = []
    for leaf in leaves:
        support = adjacency[leaf].bit_length() - 1
        H_forbidden = (1 << leaf) | (1 << support)
        R_forbidden = (1 << support) | adjacency[support]
        D = [0] * (n + 1)
        H = [0] * (n + 1)
        R = [0] * (n + 1)
        for mask in masks:
            rank = mask.bit_count()
            if not (mask & (1 << leaf)):
                D[rank] += 1
            if not (mask & H_forbidden):
                H[rank] += 1
            if not (mask & R_forbidden):
                R[rank] += 1
        delta = D[p + 1] - D[p]
        if delta < 0:
            q_previous = H[p - 1] - R[p - 1]
            q_rank = H[p] - R[p]
            candidates.append({
                'leaf': leaf,
                'support': support,
                'witness_vertices': [v for v in range(n) if v != leaf and adjacency[support] & (1 << v)],
                'h_order': n - 2,
                'r_order': n - R_forbidden.bit_count(),
                'c_previous': q_previous,
                'c_rank': q_rank,
                'g': q_rank - q_previous,
                'pointwise_delta': delta,
            })
    return candidates


def weight(mask, summands, adjacency):
    return sum(bool(mask & (1 << item['leaf'])) and
               bool(mask & (adjacency[item['support']] & ~(1 << item['leaf'])))
               for item in summands)


def relation(s, t, adjacency):
    removed = s & ~t
    added = t & ~s
    if added == 0 and removed.bit_count() == 1:
        return 'deletion'
    if added.bit_count() == 1 and removed.bit_count() == 2:
        v = added.bit_length() - 1
        if removed == (adjacency[v] & s):
            return 'switch'
    return None


def check_case(census, saved):
    code = census['centroid_code']
    label = code
    edges, adjacency = graph_from_code(code)
    n, p = len(adjacency), census['rank']
    require(n in (14, 15) and p == 6, f'{label}: scope')
    require(census['order'] == n and saved['order'] == n and saved['rank'] == p, f'{label}: order/rank')
    require(saved['edges'] == [list(e) for e in edges], f'{label}: graph edges')
    flags, masks, counts = independent_masks(adjacency)
    alpha = max(i for i, count in enumerate(counts) if count)
    # Zero extension at n+1 is explicit; x is the first strict descent.
    extended = counts + [0]
    x = next((i for i in range(n + 1) if extended[i + 1] < extended[i]), None)
    require(x is not None and x + 2 <= p and 3 * p < 2 * alpha + 1, f'{label}: guards')
    require(alpha == census['alpha'] == saved['alpha'], f'{label}: alpha')
    require(x == census['first_strict_descent'] == saved['x'], f'{label}: first descent')
    summands = leaf_statistics(adjacency, masks, n, p)
    selected = [item['leaf'] for item in summands]
    require(selected == census['favorable_leaves'] == saved['favorable_leaves'], f'{label}: selector')
    require(len(selected) == census['favorable_count'], f'{label}: selector count')
    require(summands == census['summands'], f'{label}: full q summands')
    aggregate = sum(item['g'] for item in summands)
    require(aggregate == census['aggregate'] == saved['aggregate'], f'{label}: aggregate')

    upper = {}
    lower = {}
    for mask in masks:
        rank = mask.bit_count()
        if rank == p or rank == p + 1:
            w = weight(mask, summands, adjacency)
            if w:
                (upper if rank == p + 1 else lower)[mask] = w
    supply, capacity = sum(upper.values()), sum(lower.values())
    require(supply - capacity == aggregate, f'{label}: weighted identity')
    require(supply == sum(item['c_rank'] for item in summands), f'{label}: q rank total')
    require(capacity == sum(item['c_previous'] for item in summands), f'{label}: q previous total')
    require(supply == saved['upper_supply'] and capacity == saved['lower_capacity'], f'{label}: weighted totals')
    require(len(upper) == saved['positive_weight_upper_sets'] and
            len(lower) == saved['positive_weight_lower_sets'], f'{label}: weighted set counts')

    possible = set()
    for s in upper:
        for v in range(n):
            bit = 1 << v
            if s & bit:
                t = s ^ bit
                if t in lower:
                    possible.add((s, t))
            else:
                hit = adjacency[v] & s
                if hit.bit_count() == 2:
                    t = (s ^ hit) | bit
                    if t in lower:
                        possible.add((s, t))
    require(len(possible) == saved['arcs'], f'{label}: complete positive-weight adjacency count')

    outgoing = Counter()
    incoming = Counter()
    seen = set()
    move_counts = Counter()
    for arc in saved['positive_flow_arcs']:
        require(isinstance(arc, list) and len(arc) == 3, f'{label}: arc record')
        s, t, amount = arc
        require(type(s) is int and type(t) is int and type(amount) is int and amount > 0,
                f'{label}: positive integer arc')
        require((s, t) not in seen and (s, t) in possible, f'{label}: unique permitted arc')
        require(s in upper and t in lower and flags[s] and flags[t], f'{label}: independent endpoints')
        move = relation(s, t, adjacency)
        require(move is not None, f'{label}: literal move')
        move_counts[move] += 1
        seen.add((s, t))
        outgoing[s] += amount
        incoming[t] += amount
    require(all(outgoing[s] <= upper[s] for s in upper), f'{label}: source capacities')
    require(all(incoming[t] <= lower[t] for t in lower), f'{label}: lower capacities')
    flow = sum(outgoing.values())
    require(flow == sum(incoming.values()) == saved['flow'] == supply, f'{label}: conservation and saturation')
    require(saved['deficit'] == supply - flow == 0, f'{label}: deficit')
    require(saved['cut_upper_masks'] == [], f'{label}: saturated cut')
    return {
        'centroid_code': code,
        'order': n,
        'rank': p,
        'independent_sets': len(masks),
        'alpha': alpha,
        'first_strict_descent': x,
        'favorable_count': len(selected),
        'aggregate': aggregate,
        'upper_supply': supply,
        'lower_capacity': capacity,
        'upper_weighted_sets': len(upper),
        'lower_weighted_sets': len(lower),
        'possible_arcs': len(possible),
        'positive_arcs': len(seen),
        'positive_deletions': move_counts['deletion'],
        'positive_switches': move_counts['switch'],
        'flow': flow,
    }


def main():
    brief = json.loads(BRIEF.read_text())
    source_hashes = {}
    for item in brief['allowed_source_files']:
        actual = sha256((ROOT / item['path']).read_bytes()).hexdigest()
        require(actual == item['sha256'], f"source hash: {item['path']}")
        source_hashes[item['path']] = actual
    census = json.loads((ROOT / 'instruments/p6-order14-15/RESULTS.json').read_text())
    saved = json.loads((ROOT / 'instruments/p6-switch-flow/RESULTS.json').read_text())
    blocks = census['results']
    require(len(blocks) == 2 and [b['order'] for b in blocks] == [14, 15], 'census blocks')
    require([len(b['rows']) for b in blocks] == [240, 1], 'census row counts')
    require(all(b['eligible_rows'] == len(b['rows']) for b in blocks), 'eligible row totals')
    census_rows = [r for b in blocks for r in b['rows']]
    saved_rows = saved['rows']
    require(saved['cases'] == len(saved_rows) == len(census_rows) == 241, 'certificate count')
    require(saved['failures'] == 0, 'reported failure count')
    require(saved['source_sha256'] == source_hashes['instruments/p6-order14-15/RESULTS.json'], 'census provenance')
    census_codes = [r['centroid_code'] for r in census_rows]
    saved_codes = [r['centroid_code'] for r in saved_rows]
    require(len(set(census_codes)) == 241 and saved_codes == census_codes, 'exact census coverage/order')
    rows = [check_case(c, s) for c, s in zip(census_rows, saved_rows)]
    result = {
        'worker_id': brief['worker_id'],
        'status': 'proposed_worker_only',
        'evidence_grade': 'bounded_computation',
        'formal_award': False,
        'scope': 'p=6; 240 pinned eligible order-14 trees and 1 pinned eligible order-15 tree',
        'source_hashes_verified': source_hashes,
        'cases': len(rows),
        'orders': dict(sorted(Counter(r['order'] for r in rows).items())),
        'all_saved_flows_saturate': True,
        'positive_flow_arcs_checked': sum(r['positive_arcs'] for r in rows),
        'positive_deletion_arcs_checked': sum(r['positive_deletions'] for r in rows),
        'positive_switch_arcs_checked': sum(r['positive_switches'] for r in rows),
        'possible_positive_weight_arcs_reconstructed': sum(r['possible_arcs'] for r in rows),
        'min_aggregate': min(r['aggregate'] for r in rows),
        'max_aggregate': max(r['aggregate'] for r in rows),
        'rows': rows,
        'limitations': [
            'No independent generation of all tree classes to orders 14 and 15; completeness is relative to the pinned census.',
            'Saved primal flows are checked directly; no producer or independent maximum-flow solver is run.',
            'Finite rank-6 certificates do not prove a universal tree theorem or a governed RTree transfer.'
        ],
    }
    (SCRATCH / 'RESULTS.json').write_text(json.dumps(result, indent=2, sort_keys=True) + '\n')
    print(json.dumps({k: v for k, v in result.items() if k not in ('rows', 'source_hashes_verified', 'limitations')}, sort_keys=True))


if __name__ == '__main__':
    main()
