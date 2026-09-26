# C5-F2 search report — heterogeneous star factors

## Question and result

I investigated the F2 heterogeneous extension on the explicit tree family below, focusing on unequal branch arities, the original strict leaf selector, and whether a coefficient mixture issue appears in the actual independence polynomial. The result is a bounded exact audit, not a proof or refutation of the registered lower-region aggregate.

For every multiset profile of 1–5 branch arities from `{2,3,4}`, I checked every integer rank satisfying `x+2 <= p`, `3p < 2 alpha+1`, and `p <= alpha`. There are 55 profiles and 62 eligible profile/rank rows. All 62 have `S<0`; there is no positive summand in any of them. In every eligible row, all original leaves satisfy the strict selector, so this family and range did not produce a proper-selector example. A separate exact coefficient audit found no strict log-concavity failure of the whole-tree independence polynomial in these 55 profiles.

This does not verify the heterogeneous extension or the target for arbitrary trees. In particular, log-concavity of these whole-tree coefficient sequences does not establish the proposed distributed marked-polynomial/common-minor inequalities. The audit provides no across-tag bound for the global `D+C` budget.

## Family and exact computation

For a nondecreasing profile `(r_1,...,r_m)`, with `1 <= m <= 5` and every `r_i` in `{2,3,4}`, take the path `0-1-2`. Attach `m` branch centers to vertex `0`; center `c_i` has `r_i` pendant leaves. The graph has `3 + sum_i(1+r_i)` vertices. Profiles are multisets, so this exhausts the stated finite boundary without discarding branch multiplicity.

`COMPUTE.py` uses the exact recurrence `I(G;z)=I(G-v;z)+z I(G-N[v];z)` on bit-mask induced subgraphs. It computes the independence polynomial of the original graph, every original leaf deletion, and the two deletions in each selected summand. It finds `alpha` as the polynomial degree and finds `x` by scanning zero-extended differences through rank `alpha`, including the terminal difference `Delta_alpha=-i_alpha`. It tests every eligible `p`, forms `F` using the strict condition `Delta_p(T-v)<0`, and sums the original-support terms for every selected leaf, including repeated supports.

A second coefficient calculation uses the hub decomposition. For each branch of arity `r`, put `A_r=(1+z)^r` and `B_r=(1+z)^r+z`. The whole-tree polynomial is

`I(T;z)=z(1+z) product_i A_{r_i} + (1+2z) product_i B_{r_i}`.

Exact convolution from this formula was cross-checked against the deletion recurrence for all 55 profiles. The script then checked every interior coefficient for the log-concavity inequality `i_j^2 >= i_{j-1} i_{j+1}`. All integer operations are exact. `RESULTS.json` contains the full profile and eligible-rank records; running `python3 COMPUTE.py > RESULTS.json` reproduces it.

## Representative eligible row

For profile `(2,3,4)`, label branch centers `3,6,10` and their leaves respectively `4,5`; `7,8,9`; and `11,12,13,14`. The complete edge recipe is the path `0-1-2` together with `0-3`, `3-4`, `3-5`, `0-6`, `6-7`, `6-8`, `6-9`, `0-10`, `10-11`, `10-12`, `10-13`, `10-14`.

The exact independence vector is

`(1,15,91,299,601,798,737,480,218,66,12,1)`,

so `alpha=11`. Its consecutive differences start `14,76,208,302,197,-61`; hence `x=5`. Rank `p=7` is eligible since `p=x+2` and `21=3p < 23=2 alpha+1`.

All ten original leaves are favorable. In leaf order `(2,4,5,7,8,9,11,12,13,14)`, the selector deltas `Delta_7(T-v)` are `(-151,-133,-133,-119,-119,-119,-110,-110,-110,-110)`. Their original supports are `(1,3,3,6,6,6,10,10,10,10)`. The summands

`Delta_6(T-{v,s_v}) - Delta_6(T-N[s_v])`

are `(-42,-93,-93,-130,-130,-130,-150,-150,-150,-150)`, yielding the exact full sum `S=-1218`. This is an illustration of the bounded output, not a universal sign argument.

## What remains open

The finite family has all leaves selected at every eligible rank, so it does not test how a heterogeneous argument handles a selector that changes across leaf orbits. The coefficient check is for the whole-tree polynomial and is not a proof of curvature for the distributed marked polynomials or of any proposed common minors. No primary-literature result was needed or imported. No conclusion follows for larger branch counts, arities outside `{2,3,4}`, other attachment geometries, or arbitrary ordinary trees. The primary lower-region aggregate remains unresolved by this route.
