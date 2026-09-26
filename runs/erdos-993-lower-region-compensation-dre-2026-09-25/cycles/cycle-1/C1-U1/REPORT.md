# C1-U1: tagged incidence identity and exact budget reformulation

## Findings

I independently verified the registered bipartite tagged-incidence identity, including its boundary cases. It is an exact counting identity, with each multiply marked extension counted once in `C`; it does not itself prove the selected tree aggregate.

For every selected leaf tag in the primary problem, put `H_v=T-{v,s_v}`, `W_v=N_T(s_v) with v removed`, `R_v=H_v-W_v`, `h=a-1`, and `k=p-1`. Then `alpha(H_v)=a-1`: a maximum independent set of `T` can be chosen to contain the leaf `v` (replace its support if needed), giving a set of size `a-1` in `H_v`; conversely any independent set in `H_v` can be enlarged by `v` in `T`. In the lower region, `p>=2` and `3p<2a+1` imply `p<a`, hence `1<=k<=h`. The forest `H_v` is bipartite, and independent sets of `H_v` meeting `W_v` are counted by `q_v(j)=i_j(H_v)-i_j(R_v)`.

Write `E(A)` for the actual vertices of `H` addable to an independent `k`-set `A`. Fix the bipartition `(L,R)`. Each of `A union (E(A) intersect L)` and `A union (E(A) intersect R)` is independent, so each has size at most `h`; therefore both color-side slacks are nonnegative and

`2(h-k)-e(A) = (h-k-|E(A) intersect L|) + (h-k-|E(A) intersect R|) >= 0`.

Summing over marked `A` gives `D>=0`. Count incidences `(A,y)` where `A` is a marked independent `k`-set and `y` is actually addable. An independent `(k+1)`-set `B` meeting `W` once contributes `k` incidences (delete any unmarked vertex); one meeting `W` at least twice contributes `k+1` (every deletion leaves a mark). Thus the incidence count is exactly `k q_(k+1)+C`, with each multiply marked `B` represented once in `C`, not once per pair of marks. It is also `sum_A e(A)=2(h-k)q_k-D`. This proves the identity and `C>=0` by definition.

The endpoint `k=h` is valid: no marked `h`-set has an addable vertex, and there are no independent `(h+1)`-sets, so `D=C=q_(h+1)=0`; the identity reads `0=0`. If `q_k=0`, all sums over marked `k`-sets vanish, and the identity still holds. The proof uses only `h>=alpha(H)`, so it also covers a non-tight `h`.

## Exact tree reduction and limitation

For each original leaf, `Delta_k(H_v)-Delta_k(R_v)=q_v(k+1)-q_v(k)`. The incidence identity therefore gives

`k S = (2h-3k) sum_F q_v(k) - sum_F(D_v+C_v)`

with `2h-3k=2a+1-3p`. Equivalently, the exact budget margin is

`sum_F(D_v+C_v) - (2a+1-3p)sum_F q_v(k) = k sum_F(q_v(k)-q_v(k+1)) = -kS`.

Consequently the requested budget and the original aggregate are exactly equivalent to the monotonicity statement `sum_F q_v(k+1) <= sum_F q_v(k)` for this fixed, original-tree selector. This is a useful audit form: it identifies the precise missing bridge and preserves all original leaf tags, including repeated tags with the same support. It does not turn `D,C>=0` into the required lower bound. In the strict lower region the coefficient `2a+1-3p` is a positive integer; nonnegativity of the deficit terms alone supplies no comparison to that positive multiple of `sum_F q_v(k)`. No proof of the aggregate, global budget, or counterexample is obtained here.

The slack decomposition gives exact equality conditions for the auxiliary terms: `D=0` iff every marked `A` has exactly `h-k` addable vertices in each color class, and `C=0` iff no independent `(k+1)`-set is multiply marked. These conditions describe equality in the identity, not a route to the lower-region budget. Same-support original leaves retain their multiplicity in every sum; isomorphism between their deleted trees can make terms equal, but does not permit deduplication.

## Scope and verification

This is a direct finite counting proof, not a literature-dependent claim or bounded computation. I did not use sibling outputs, controller notes, or external sources. The primary remains unresolved at the exact registered scope. The statement above is only an identity/reformulation; it contains no assertion that the selector-level aggregate monotonicity holds universally.
