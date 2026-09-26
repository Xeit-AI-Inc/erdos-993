# C4-T2 search report — global addability budget

## Scope and result

This route examined the T2 lens: the flat/current addability budgets and the exact target identity, with attention to possible cancellation after summing the fixed favorable leaf tags. The result is an exact neighborhood-count reformulation and a trivial order subcase. It does not establish the universal lower-region aggregate or any of the proposed budgets.

Write `n=|V(T)|`, `k=p-1`, and retain the contract's one fixed selector `F=F(T,p)`. For each `v in F`, put `H_v=T-{v,s_v}`, `W_v=N_T(s_v)-{v}`, and let `q_v(j)` count independent `j`-sets of `H_v` meeting `W_v`. Set

- `Q = sum_{v in F} q_v(k)` and `U = sum_{v in F} q_v(k+1)`;
- `C` = the number, summed over leaf tags, of independent `(k+1)`-sets of `H_v` meeting `W_v` in at least two vertices, each upper set counted once for that tag;
- `M = sum_{v in F} sum_{A} |N_{H_v}(A)|`, where the inner sum is over independent `k`-sets `A` meeting `W_v`.

All neighborhoods here are open neighborhoods in `H_v`.

## Exact derivation

For a fixed tag `v`, every independent `(k+1)`-set `B` of `H_v` meeting `W_v` gives one addability incidence for each deletion `A=B-{u}` that still meets `W_v`. If `B` meets `W_v` once, precisely the `k` deletions other than its unique marked vertex preserve the mark. If it meets `W_v` at least twice, all `k+1` deletions preserve it. Thus the total addability incidence is exactly

`E = k U + C`.

This counts each tagged upper set separately when different leaf tags lead to different `H_v,W_v`; it does not identify tags or assume disjoint fibres.

For each independent `k`-set `A` of `H_v`, the addable vertices are exactly the vertices outside `A union N_{H_v}(A)`. Since `A` is independent, these two sets are disjoint, so

`e_{H_v}(A) = (n-2)-k-|N_{H_v}(A)|`.

Consequently `E=((n-2)-k)Q-M`. Separately, the summand in the primary target is

`Delta_k(H_v)-Delta_k(H_v-W_v) = q_v(k+1)-q_v(k)`,

because `H_v-W_v=T-N_T[s_v]`. Hence `S=U-Q`. Combining these identities gives the exact formula

`k S = E-C-kQ = (n-2p)Q-M-C`.

This recovers the primary target as the single aggregate inequality

`M+C >= (n-2p)Q`.

The derivation uses the same fixed selector at every rank and every sum. It needs no independence-sequence monotonicity and no per-leaf sign claim.

## Consequences and remaining gap

Since `M,C>=0`, the target follows in the subcase `n<=2p`. When `n>2p`, the identity isolates the needed compensation as a lower bound on the total neighborhood incidences `M` together with the multiply marked correction `C`. I found no argument from the strict selector condition `Delta_p(T-v)<0` that forces this bound.

For comparison, the current-rank budget `E<=kQ` is equivalent to `M>=(n-2p)Q`, so it omits the nonnegative `C` correction and is stronger than the target. The flat budget `E<=(x+1)Q` is equivalent to `M>=(n-p-x-2)Q`; because `p>=x+2`, this asks for at least as much neighborhood compensation as the current-rank budget. Thus neither sufficient budget follows merely from the exact identity. This route supplies no counterexample to either budget.

No computation or literature import was needed for this algebraic reduction. In particular, the derivation is not a universal proof for the `n>2p` cases.

## Source and authority notes

The scope and notation follow the admitted `SOLUTION-CONTRACT.md` and T2 lens in `control/C4-SEARCH-ALLOCATION.json`. The candidate implication hierarchy in `control/C4-OCCUPANCY-BRIDGE-HIERARCHY.md` was treated as a proposal, not as an awarded result. This report is a worker proposal only.
