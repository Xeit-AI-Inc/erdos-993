"""Independent small-witness enumeration and complete receipt comparison."""
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent.parent / "cycles/cycle-1/C1-F3"

def polynomial(vertices, edges):
    counts = [0] * (len(vertices) + 1)
    for mask in range(1 << len(vertices)):
        selected = {v for bit, v in enumerate(vertices) if mask & (1 << bit)}
        if all(not (u in selected and v in selected) for u, v in edges):
            counts[len(selected)] += 1
    while len(counts) > 1 and counts[-1] == 0:
        counts.pop()
    return counts

def delta(counts, k):
    def get(j):
        return counts[j] if 0 <= j < len(counts) else 0
    return get(k + 1) - get(k)

def small_witness():
    row = json.loads((SOURCE / "nonresidual_target.json").read_text())
    edges = [tuple(e) for e in row["edges"]]
    vertices = list(range(10))
    adj = {v: set() for v in vertices}
    for u, v in edges:
        adj[u].add(v)
        adj[v].add(u)
    seen = {0}
    fringe = [0]
    while fringe:
        for v in adj[fringe.pop()] - seen:
            seen.add(v)
            fringe.append(v)
    assert len(edges) == 9 and len(seen) == 10
    poly = polynomial(vertices, edges)
    a = len(poly) - 1
    p = a - 2
    x = next(k for k in range(len(poly) + 1) if delta(poly, k) < 0)
    leaves = sorted(v for v in vertices if len(adj[v]) == 1)
    summands = []
    for v in leaves:
        s = next(iter(adj[v]))
        closed = {s} | adj[s]
        pv = polynomial([u for u in vertices if u != v], edges)
        if delta(pv, p) >= 0:
            continue
        hp = polynomial([u for u in vertices if u not in {v, s}], edges)
        rp = polynomial([u for u in vertices if u not in closed], edges)
        dh, dr = delta(hp, p - 1), delta(rp, p - 1)
        summands.append(dict(leaf=v, support=s,
                             delta_p_T_minus_leaf=delta(pv, p),
                             delta_pminus1_H=dh, delta_pminus1_R=dr,
                             g=dh-dr))
    maximum = set(row["maximum_independent_set_containing_support_9_but_omitting_leaf_6"])
    assert len(maximum) == a and all(u not in maximum or v not in maximum for u, v in edges)
    assert 9 in maximum and 6 not in maximum
    result = dict(connected_acyclic=True, polynomial=poly, alpha=a, p=p, x=x,
                  eligible=(x+2<=p), leaves=leaves, summands=summands,
                  complete_sum=sum(q["g"] for q in summands),
                  maximum_set_valid=True)
    for key, value in [("independence_polynomial", poly), ("alpha", a), ("p", p),
                       ("x", x), ("eligible", result["eligible"]),
                       ("all_original_leaves", leaves),
                       ("favorable_original_leaves", [q["leaf"] for q in summands]),
                       ("selected_leaf_summands", summands),
                       ("complete_sum", result["complete_sum"])]:
        assert row[key] == value, key
    return result

def main():
    rows = json.loads((SOURCE / "C1-F3-fresh-examples.json").read_text())
    checks = json.loads((HERE / "C1-F3-independent-checks.json").read_text())
    assert len(rows) == len(checks) == 10
    for r, c in zip(rows, checks):
        n = r["vertices"]
        adj = {v: set() for v in range(n)}
        for u, v in r["edges"]:
            adj[u].add(v); adj[v].add(u)
        seen = {0}; fringe = [0]
        while fringe:
            for v in adj[fringe.pop()] - seen:
                seen.add(v); fringe.append(v)
        assert len(r["edges"]) == n-1 and len(seen) == n, r["label"]
        assert r["independence_polynomial"] == c["polynomial"], r["label"]
        assert r["leaves"] == c["leaves"], r["label"]
        assert r["favorable_leaves"] == c["favorable_leaves"], r["label"]
        assert r["summands"] == c["summands"], r["label"]
        assert r["aggregate"] == c["S"] == sum(q["g"] for q in c["summands"]), r["label"]
        assert r["alpha"] == c["alpha"] and r["p"] == c["p"] and r["eligible"] == c["eligible"], r["label"]
    random_source = json.loads((SOURCE / "C1-F3-random-summary.json").read_text())
    random_replay = json.loads((HERE / "C1-F3-random-summary.json").read_text())
    assert random_source == random_replay
    summary = {"structured_rows_fully_matched": len(rows),
               "structured_rows_all_trees": True,
               "random_summary_exact_match": True,
               "small_witness": small_witness()}
    (HERE / "audit.json").write_text(json.dumps(summary, indent=2) + "\n")
    print("audit passed")

if __name__ == "__main__":
    main()
