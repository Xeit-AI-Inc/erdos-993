#!/usr/bin/env python3
"""Replayable witness check: universal tree TRS2 is refuted at order 26.

Builds the Kadrawi-Levit spider T(3,4,4) (arXiv:2305.01784): a center vertex
with three children, carrying 3, 4, and 4 pendant 2-paths respectively
(26 vertices), plus family members and controls. For each tree it computes
the exact independence sequence by dynamic programming and checks:

  * positive interval support (so, by the kernel-checked r8 theorem
    `trs2_iff_adjacentLogConcave`, TRS2 of the sequence is exactly adjacent
    log-concavity: i_k^2 >= i_{k-1} * i_{k+1} for 1 <= k < alpha);
  * adjacent log-concavity, reporting every failing rank and its deficit;
  * weak unimodality (no strict drop followed by a strict rise);
  * the r11 ingredient targets on the same trees:
      (A) for p >= x(T)+1: PFavorableAt(p, s) -> a_p(s) < 0, where
          a_r(v) = Delta_r(T - v), Delta_r = i_{r+1} - i_r,
          x(T) = min { r : Delta_r(T) < 0 }, support(v) = the leaf's neighbor,
          PFavorableAt(p, s) = some leaf v with support s has a_p(v) < 0;
      (B) for every leaf v: x(T - v) >= x(T) - 1 (truncated subtraction).

Deterministic, stdlib only, exact integer arithmetic. Run:

    python3 check_kl_witness.py > witness-report.json
"""
import json
import sys

sys.setrecursionlimit(10000)


def build_spider(ks):
    """Center 0; child u_i per entry of ks; u_i carries ks[i] pendant 2-paths."""
    adj = {0: []}
    nxt = 1
    for k in ks:
        u = nxt
        nxt += 1
        adj[u] = [0]
        adj[0].append(u)
        for _ in range(k):
            a, b = nxt, nxt + 1
            nxt += 2
            adj[a] = [u, b]
            adj[u].append(a)
            adj[b] = [a]
    return adj


def polymul(p, q):
    r = [0] * (len(p) + len(q) - 1)
    for i, pi in enumerate(p):
        for j, qj in enumerate(q):
            r[i + j] += pi * qj
    return r


def padd(p, q):
    m = max(len(p), len(q))
    return [(p[i] if i < len(p) else 0) + (q[i] if i < len(q) else 0)
            for i in range(m)]


def indep_poly(adj, removed=frozenset()):
    """Exact independence-sequence coefficients of the induced forest."""
    vset = {v for v in adj if v not in removed}
    total = [1]
    seen = set()
    for root in vset:
        if root in seen:
            continue
        comp = {root}
        stack = [root]
        while stack:
            x = stack.pop()
            for y in adj[x]:
                if y in vset and y not in comp:
                    comp.add(y)
                    stack.append(y)
        seen |= comp

        def dp(v, parent):
            excl, incl = [1], [0, 1]
            for w in adj[v]:
                if w == parent or w not in comp:
                    continue
                ew, iw = dp(w, v)
                excl = polymul(excl, padd(ew, iw))
                incl = polymul(incl, ew)
            return excl, incl

        e, i = dp(root, None)
        total = polymul(total, padd(e, i))
    return total


def delta(seq):
    """Delta_r = i_{r+1} - i_r, with i_{alpha+1} = 0 supplying the final drop."""
    return [seq[r + 1] - seq[r] for r in range(len(seq) - 1)] + [-seq[-1]]


def crossing_index(seq):
    for r, val in enumerate(delta(seq)):
        if val < 0:
            return r
    return len(seq)


def analyze(ks):
    adj = build_spider(ks)
    seq = indep_poly(adj)
    alpha = len(seq) - 1
    lc_failures = [
        {"rank": k, "i_k_sq": seq[k] ** 2, "i_km1_i_kp1": seq[k - 1] * seq[k + 1],
         "deficit": seq[k - 1] * seq[k + 1] - seq[k] ** 2}
        for k in range(1, alpha) if seq[k] ** 2 < seq[k - 1] * seq[k + 1]
    ]
    dropped, nonuni = False, False
    for r in range(alpha):
        d = seq[r + 1] - seq[r]
        if d < 0:
            dropped = True
        if d > 0 and dropped:
            nonuni = True
    xT = crossing_index(seq)
    leaves = [v for v in adj if len(adj[v]) == 1]
    supports = {v: adj[v][0] for v in leaves}
    profiles = {v: delta(indep_poly(adj, frozenset([v])))
                for v in set(leaves) | set(supports.values())}
    b_violations = [
        {"leaf": v, "x_T": xT, "x_T_minus_v": crossing_index(indep_poly(adj, frozenset([v])))}
        for v in leaves
        if crossing_index(indep_poly(adj, frozenset([v]))) < max(xT - 1, 0)
    ]
    a_violations = []
    for p in range(xT + 1, alpha + 2):
        for s in sorted(set(supports.values())):
            p_favorable = any(
                supports[v] == s and p < len(profiles[v]) and profiles[v][p] < 0
                for v in leaves)
            if p_favorable:
                a_sp = profiles[s][p] if p < len(profiles[s]) else 0
                if not a_sp < 0:
                    a_violations.append({"p": p, "support": s, "a_p_s": a_sp})
    return {
        "family_parameters": list(ks),
        "order": len(adj),
        "alpha": alpha,
        "independence_sequence": seq,
        "positive_interval_support": all(c > 0 for c in seq),
        "log_concavity_failures": lc_failures,
        "trs2": not lc_failures,
        "weakly_unimodal": not nonuni,
        "crossing_index": xT,
        "r11_theorem_B_violations": b_violations,
        "r11_theorem_A_violations": a_violations,
    }


if __name__ == "__main__":
    cases = [(3, 3, 3), (3, 3, 4), (2, 4, 4),       # controls: TRS2 holds
             (3, 4, 4),                              # Kadrawi-Levit order-26 witness
             (3, 4, 5), (3, 5, 5), (3, 5, 6), (4, 4, 4)]  # larger family members
    report = {"description": "TRS2 (= adjacent log-concavity on positive interval "
                             "support) witness check on Kadrawi-Levit spiders",
              "witness_refutes": "forall trees T, TRS2(independence sequence of T)",
              "cases": [analyze(ks) for ks in cases]}
    json.dump(report, sys.stdout, indent=1)
    print()
