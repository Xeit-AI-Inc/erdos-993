# C1-SYNTHESIS evidence and exact checks

## Source integrity and coverage

SHA-256 of the bytes of every `allowed_source_files` member in `packets/C1-SYNTHESIS.json` (10 files, all and only C1-AT/C1-AF/C1-AU files) and `packets/C1-COMMON.json` (16 files) matched the corresponding packet digest. The case's `required_covered_claim_ids` set equals the union of the three sealed adjudicator `RETURN.json` claim-ID sets: 8 T-origin including the registered primary, 6 F-origin, and 9 U-origin, 23 distinct IDs. RETURN.json carries one disposition for each.

## Direct incidence proof

Let `A` range over marked independent `k`-sets of a finite bipartite graph `H` with bipartition `(L,R)`. Every actual addable vertex in `L` avoids `A`, and two vertices in `L` are nonadjacent. Thus `A` together with all addable `L` vertices is independent, so there are at most `h-k` of them; the same holds in `R`. Hence `e(A)<=2(h-k)`, each summand of `D` is nonnegative, and `D>=0`. This remains valid for `h>alpha(H)` and `k=h`.

Count incidences `(A,u)` where `u` is addable to marked `A`. From below, the count is `sum_A e(A)=2(h-k)q_k-D`. From above, each independent `(k+1)`-set meeting `W` once has exactly `k` deletions that preserve a mark; one meeting `W` at least twice has `k+1`. Since `C` counts each latter upper set once, the count is `kq_(k+1)+C`. This proves the registered identity without an external theorem. If `q_k=0`, an upper marked set would have a marked lower deletion, so the upper count is zero; the formula still holds.

For a tree leaf `v`, any independent set of `H_v` extends by `v`, giving `alpha(H_v)<=a-1`. A maximum independent set of `T` can be chosen to contain `v`: if it contains `s_v`, replace `s_v` by `v`; if it contains neither, add `v`, contradicting maximality. Deleting `v` then yields an independent `(a-1)`-set of `H_v`, so equality holds. Eligibility gives `1<=k=p-1<=a-1`. Substituting `h=a-1` into the identity, subtracting `kq_v(k)`, and summing over the unchanged `F` yields `kS=(2a+1-3p)sum_F q_v(k)-sum_F(D_v+C_v)`. The budget margin is `-kS`. This algebra supplies no sign for that margin.

## Independent coefficient and finite-control checks

From `I(T-v,z)=I(H_v,z)+zI(R_v,z)=q_v(z)+(1+z)I(R_v,z)` with `r_j=i_j(R_v)`, the coefficient at rank `j` is `q_j+r_j+r_(j-1)`. Subtracting ranks `p+1` and `p` gives the exact strict-selector expression `q_(p+1)-q_p+r_(p+1)-r_(p-1)`. The `r_p` terms cancel. The rank-`p-1` summand is `q_p-q_(p-1)`. These expressions use integer zero extension.

The two packet-listed standing-control JSON rows were read directly and all stored `g` terms re-summed:

| Control | `(a,x,p)` | Guard checks | Selected terms | Positive terms | Exact complete sum |
| --- | --- | --- | ---: | ---: | ---: |
| order-91 `T_22` | `(68,32,34)` | `34<=34`, `102<137` | 67 | 1 | `-498754180547001418536` |
| order-243 `T_60` | `(182,87,90)` | `89<=90`, `270<365` | 181 | 1 | `-1058142362147652597702654588268394677176033202323316960380` |

Each term count equals the stored favorable-leaf count, and each exact sum equals its stored complete aggregate. This is a row-arithmetic audit, not an independent replay of graph construction, independent-set vectors, or every selector value. The adjudicators report deeper checks at their respective bounded scopes. The order-22 `T22` cited in the common handoff is a different R28 slot-dominance case.

## Proof and dependence boundary

The incidence identity, tree rank domain, fixed-selector specialization, and corrected coefficient identity above are direct symbolic checks. The star theorem and support-core/support-fibre formulas are carried with the adjudicators' elementary proofs; their application is limited to the scopes stated in REPORT.md. The F1/F2/F3/F4/F6 counts and sums are carried as adjudicated finite computations, with F2's executable-rule correction. The F5 scalar point satisfies an equation but has no certified graph or eligible-tree realization. Neither the finite observations nor the symbolic identities prove the unbounded selected aggregate.
