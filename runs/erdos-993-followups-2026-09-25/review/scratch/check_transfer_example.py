from itertools import combinations
import json

# Vertices: v=0, s=1, rooted H-edges 2--3 and 4--5.
edges = {frozenset(e) for e in [(0, 1), (1, 2), (2, 3), (1, 4), (4, 5)]}


def rows(vertices, graph_edges, marked):
    result = []
    components = [{2, 3}, {4, 5}] if set(vertices) == {2, 3, 4, 5} else []
    for k in range(len(vertices) + 1):
        sets = [set(a) for a in combinations(vertices, k)
                if all(not edge <= set(a) for edge in graph_edges)]
        d = sum(sum(sum(x in edge for edge in graph_edges) for x in a) for a in sets)
        occupancy = {x: sum(x in a for a in sets) for x in vertices}
        root_max = sum(max(occupancy[x] for x in comp) for comp in components)
        result.append(dict(k=k, i=len(sets), D=d,
                           marked=sum(bool(a & marked) for a in sets), M=root_max))
    return result


T = rows(range(6), edges, {2, 4})
Tv = rows(range(1, 6), {e for e in edges if 0 not in e}, {2, 4})
H = rows(range(2, 6), {e for e in edges if not e & {0, 1}}, {2, 4})
assert Tv[3]['i'] - Tv[2]['i'] < 0
assert H[2]['marked'] - H[1]['marked'] == 1
assert all(H[k]['D'] + 2 * H[k]['M'] == 2 * k * H[k]['i'] for k in (1, 2))
print(json.dumps(dict(T=T, T_minus_v=Tv, H=H), indent=2))
