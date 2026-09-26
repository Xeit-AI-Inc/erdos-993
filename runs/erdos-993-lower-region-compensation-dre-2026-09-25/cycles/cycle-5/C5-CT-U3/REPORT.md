# C5-CT-U3 critique report — orientation T

## Source control and coverage

The case packet assigns a critique of C5-U3, orientation T, and requires coverage of exactly `C5-U3-ALT-CUT` and `C5-U3-PRIMARY-GAP`. All 3 case-listed source hashes and all 237 common-source hashes match their packet pins. I read the common `read_first` files, the C5 critic brief, and the three case-listed files (`EVIDENCE.json`, `REPORT.md`, `RETURN.json`). No other worker, unlisted research file, computation, or literature result was used.

## Claim review

### C5-U3-ALT-CUT — retained

For each fixed selected original leaf, let `L` be the marked independent `k`-sets in `H`, and let `R` be the independent `(k+1)`-sets meeting `W`. A left vertex has one incident edge for each vertex that can actually be added, hence degree `e(A)`. If a right vertex has exactly one mark, deleting any of its `k` unmarked vertices preserves a mark, while deleting the unique marked vertex does not; its degree is `k`. If it has at least two marks, all `k+1` deletions preserve a mark; its degree is `k+1`. Counting edges by right endpoints therefore gives `E=kU+C`, with each multiply marked upper set counted once for this leaf tag. Constructing the graph separately for each selected original leaf correctly preserves distinct leaves that share a support.

The alternating-reachability argument is also valid. Starting from a set `S` of unmatched left vertices in a maximum matching, traverse nonmatching edges left-to-right and matching edges right-to-left. No reached right vertex is unmatched, since it would complete an augmenting path from a vertex of `S`. Every reached right vertex is matched to a reached left vertex outside `S`; conversely every reached left vertex outside `S` was reached along its matching edge. These matching edges give a bijection between `Y` and `X\\S`, and all neighbors of `X` are reached, so `N(X)=Y` and `|X|-|N(X)|=|S|`. This is a structural Hall deficit identity, not a weighted estimate.

For the bridge to the primary expression, put `q_j=i_j(H)-i_j(H-W)`. Directly expanding the two differences gives each summand as `q_{k+1}-q_k`, so, over the same fixed selector, `S=U-Q`. Thus `kS=E-C-kQ`. Since `h=alpha(H)=a-1`, the actual addable vertices for a fixed independent `k`-set induce a bipartite graph; each color class is independent and can have at most `h-k` vertices, because adjoining that color class to the fixed set remains independent. Hence `D=2(h-k)Q-E >= 0`, and substitution yields `kS=(2a+1-3p)Q-D-C`. These are exact identities and a valid nonnegativity observation; they do not imply the missing lower bound on `D+C`.

### C5-U3-PRIMARY-GAP — retained

The route accurately states the limitation of its argument. Alternating reachability supplies an unweighted cardinality deficit for a particular incidence graph. The contract, in the strict lower region, would require the weighted inequality `sum_F(D_v+C_v) >= (2a+1-3p)Q`, whose coefficient is positive. No comparison from the Hall cut to these weights is established. Also no map from the first-descent hypothesis or strict selector values to the unmatched sets, cuts, or their weighted boundary is given. The two exact rewrites therefore leave the primary claim unresolved; this is a proof gap, not a refutation.

## Limitations

The review verifies the displayed structural identities and their domains as presented, but supplies no new graph-specific certificate or across-tag charge. No conclusion is made about a T22 instance. The strict selector is correctly held fixed across the sum, but its coefficient condition is not used to prove the needed weighted budget. Both reviewed claims remain at their proposed worker statuses; no authoritative status is assigned.
