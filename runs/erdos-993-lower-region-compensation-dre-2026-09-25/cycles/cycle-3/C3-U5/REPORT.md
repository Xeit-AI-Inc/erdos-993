# C3-U5 search report — earlier descent to selected-tag budget

## Scope and result

I investigated the primary claim `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` through the U5 lens. The first strict descent supplies an exact earlier-layer shortage in addable vertices. I obtained a sufficient conditional transfer inequality from that shortage to the marked rank `p-1` sets of the selected leaves. The transfer inequality is not proved for all trees, so the primary remains open in this report. No universal recovery, unimodality, or rank monotonicity was assumed.

## Earlier-layer inequality

For an independent `j`-set `B` in a graph `G`, let `e_G(B)` be the number of vertices of `G` outside `B` that can be added while preserving independence. Count pairs `(B,z)` where `|B|=x` and `z` is addable. Every independent `(x+1)`-set has exactly `x+1` deletions, so

`sum_{B in I_x(T)} e_T(B) = (x+1)i_{x+1}(T)`.

By the definition of the first strict descent, `Delta_x(T)=i_{x+1}(T)-i_x(T)<0`, hence `i_x(T)>0` and

`E_x(T) := (1/i_x(T)) sum_{B in I_x(T)} e_T(B) = (x+1)i_{x+1}(T)/i_x(T) < x+1 <= p-1 = k`.

The last inequality is exactly the eligibility guard `x+2<=p`. This uses only the descent at rank `x`; it makes no assertion about later ranks.

## Marked-set transfer condition and implication

For each original leaf `v` in the fixed strict-selector set `F(T,p)`, use the contract's `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, and `R_v=H_v-W_v`. Let `q_v(k)` count independent `k`-sets of `H_v` meeting `W_v`, and let

`E_v(k) = sum_{A independent in H_v, |A|=k, A intersect W_v nonempty} e_{H_v}(A)`.

Set `Q=sum_{v in F}q_v(k)` and `E=sum_{v in F}E_v(k)`, counting each original leaf tag separately, even when supports coincide. A concrete conditional bridge is

`(CT_x)  E <= E_x(T) Q`.

This condition compares an explicitly defined marked occupancy average at the selector rank with an explicitly defined unmarked average at the first-descent rank. It does not mention `S(T,p)` and is independently checkable from the tree, selector, and marked sets.

For completeness, the tagged identity follows by counting extension pairs. In any bipartite `H` with `alpha(H)=h`, each of the two color classes contributes at most `h-k` addable vertices to a fixed independent `k`-set `A`: the addable vertices from that class together with `A` form an independent set. Thus `e_H(A)<=2(h-k)` and `D=2(h-k)q_k-sum_A e_H(A)>=0`. Count pairs `(A,z)` where `A` is a marked independent `k`-set and `z` is addable. Each such pair gives an independent `(k+1)`-set meeting `W`. A resulting set with exactly one marked vertex has `k` deletions that leave a marked `k`-set; a set with at least two marked vertices has `k+1`. If `C` counts the latter once each, the pair count is `k*q_(k+1)+C`. Equating it to `sum_A e_H(A)=2(h-k)q_k-D` proves the identity and `C>=0`.

Applying this exact count to each `(H_v,W_v)`, with `h=alpha(H_v)=a-1` and `k=p-1`, gives

`k*S(T,p) = (2a+1-3p)Q - sum_{v in F}(D_v+C_v)`,

where `D_v=2(h-k)q_v(k)-E_v(k)` and `C_v>=0` counts the multiply marked extensions as in the contract. Summing the definition of `D_v` gives `sum D_v=2(h-k)Q-E`. Under `(CT_x)`, the strict descent calculation gives `E < kQ` when `Q>0`, since `E_x(T)<x+1<=k`. Therefore

`sum D_v > (2(h-k)-k)Q = (2a+1-3p)Q`.

The coefficient is positive in the strict lower region, but the displayed strict inequality already supplies the needed budget. Since each `C_v>=0`, the identity yields `S(T,p)<0` when `Q>0`. If `Q=0`, it yields `kS=-sum(D_v+C_v)<=0`, so the desired weak inequality follows as well. Thus `(CT_x)` for an eligible tree is a sufficient conditional bridge to the full selected sum, retaining every original leaf tag.

## Exact binomial-component form for checking the bridge

For a bipartite graph `G=L union R` and `A subset L`, put `R_A=R\N(A)`. Every independent set has a unique representation `A union B` with `B subset R_A`. Consequently

`i_j(G)=sum_{A subset L} binom(|R_A|, j-|A|)`

(with zero outside the usual binomial range). For such a set, its actual addable-vertex count is

`e_G(A union B)=|L\N(B)|+|R_A|-j`.

These give exact finite formulas for `i_x(T)` and `sum e_T(B)` in the earlier-layer condition. For `(CT_x)`, apply the same representation to each `H_v` and retain only pairs `(A,B)` with `|A|+|B|=k` and `(A union B) intersect W_v` nonempty. The numerator is the sum of the displayed actual addability formula over those retained pairs, summed over leaf tags. This is a direct finite audit recipe; no coefficientwise comparison of binomial terms has been established here.

## Gap

The missing assertion is `(CT_x)` for every eligible ordinary tree, or a weaker independently proved inequality sufficient for `E < kQ`. The marked rank-`k` distribution is conditioned on meeting leaf-neighbor tags in deletion graphs `H_v`; the earlier descent controls the unmarked rank-`x` distribution in `T`. The pair-count identity alone does not compare these different conditional distributions. Tree bipartition and the exact binomial expansion give representations but no automatic stochastic ordering. No census or outside theorem was used, and no counterexample to `(CT_x)` was produced. Accordingly this is a conditional reduction, not a resolution of the primary claim.
