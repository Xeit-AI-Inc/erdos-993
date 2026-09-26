# C6-CF-T4 critique (orientation F)

## Scope and source integrity

I reviewed the three claims in the sealed `C6-T4` case against the solution contract and common handoff. The case pins for `REPORT.md`, `RETURN.json`, `evidence_t22.json`, and `replay_t22.py` matched the hashes in the case packet. Common-source pins also matched. I inspected the exact source-map references relevant to this route: `inputs/ordinary_tree_checked.py`, the `instruments/orbit-flow-twoforone` protocol, implementation, frozen results and smoke record, the `instruments/p6-switch-flow` protocol, and the T22 source-reconciliation replay. The graph and relation sources are available; I found no source-availability defect. I did not independently prove the universal orbit-lifting theorem, and the route does not use those finite flow certificates as a universal inference.

## Claim dispositions

### `C6-T4-MATCHING-SLACK-DECOMPOSITION` — retained

For each fixed selected tag `v` and marked independent `k`-set `A` in `H_v`, the addable-vertex graph `U_v(A)` is an induced forest. Write `e=|U_v(A)|`, `nu` for its maximum matching size and `u=e-2nu` for the unmatched vertices. Since `A` can be extended by any independent set in `U_v(A)`, `alpha(U_v(A)) <= h-k`. König's identity on this bipartite forest gives `alpha(U_v(A))=e-nu=nu+u`. Therefore

`2(h-k)-e = 2(h-k-alpha(U_v(A))) + u`.

Both terms on the right are nonnegative. This identity keeps the unmatched-addable contribution; no step drops it.

The extension incidence count also checks out. Every marked `k`-set contributes its `e` addable vertices. An upper `(k+1)`-set with exactly one mark has `k` deletions retaining a mark; one with at least two marks has `k+1` such deletions. Thus, with `C` counting multiply marked upper sets once per tag, `sum e = kU+C`. The leaf summand is `q_v(k+1)-q_v(k)`, so for the unchanged fixed selector, `kS=(2alpha(T)+1-3p)Q-D-C`. Since eligibility gives `p>=2`, `k>0`, and the target is equivalent to the stated weighted lower bound. The route correctly presents this as a reduction, not as a proof of the bound.

### `C6-T4-T22-ELIGIBLE-CROSS-TAG-CHECK` — retained

I copied the sealed replay into this scratch directory and ran it with the specified Python 3.11 executable. The output exactly matched the pinned evidence JSON. The constructor gives the stated 91-vertex tree; the computed values are `alpha=68`, `x=32`, `p=34`, hence `x+2<=p` and `3p=102<137=2alpha+1`. The fixed selector has 67 original leaves. The positive marked-arm summand is `212336130412243110`, each of the other 66 selected leaf summands is `-7560098737536570631`, and their complete sum is `S=-498754180547001418536`. Both the full leaf-term sum and the incidence identity replay checks pass; the compensation surplus is `16458887958051046811688`.

This is a valid eligible example of a positive selected term compensated by other tags. It is not a counterexample to the aggregate, and this one example does not prove a general compensation theorem. The fixed selector and the complete sum, rather than a pointwise or single-fibre sign, are the relevant checks here.

### `C6-T4-UNIFORM-COMPENSATION-OPEN` — retained_narrowed

The route proves the decomposition and reports no general estimate establishing `D+C >= (2alpha(T)+1-3p)Q`. Its T22 calculation and the finite flow diagnostics do not settle the universal lower-region claim. I retain this as a report of the route's unresolved proof obligation; it does not claim that no proof exists or independently award the canonical status. The contract and current handoff state that the primary remains OPEN.

## Limitations

The matching identity is valid, but the needed global lower bound remains unproved in this route. The T22 replay covers one tree and rank only. I did not prove the all-`m` orbit representation/lifting statement or any arbitrary-tree matching transport; these are mathematical obligations, not missing-source findings. No external theorem or literature was used.
