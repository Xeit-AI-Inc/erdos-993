# C2-CF-T6 critique — relative-chain rank reduction

## Disposition

**C2-T6.relative-chain-rank-reduction: retained.** The stated dimension and rank–homology identities are correct for the fixed original favorable set and preserve one summand for each selected original leaf. They are exact algebraic reformulations, not a proof or refutation of the primary aggregate.

## Independent audit

Fix an eligible ordinary tree `T`, `p`, and the selector `F(T,p)` from the original tree. For each selected leaf `v`, write `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\\{v}`, `R_v=H_v-W_v`, and `q_v(j)=i_j(H_v)-i_j(R_v)`. Since `R_v` is induced in `H_v`, `Ind(R_v)` is a subcomplex of `Ind(H_v)`. In relative simplicial degree `j-1` for `j>=1`, the quotient basis consists exactly of independent `j`-sets not in `R_v`, equivalently sets meeting `W_v`. Thus its dimension is `q_v(j)`. This remains true if `R_v` or `W_v` is empty under the ordinary relative-complex convention; the eligible primary scope has `p>=2`, so the two relevant set sizes are positive.

Take the direct sum of these pair complexes over the fixed set `F(T,p)`. It has degree-`j-1` dimension `Q_j=sum_{v in F}q_v(j)`. The direct sum retains distinct leaf tags, including equal-support leaves. The standard simplicial boundary descends to each quotient and does not change tags; no selector is recomputed at another rank.

The original summand at `v` is `Delta_k(H_v)-Delta_k(R_v)=q_v(k+1)-q_v(k)` for `k=p-1`, by expanding both zero-extended differences. Hence the full sum is `Q_(k+1)-Q_k`. If `b_r=rank(d_r:C_r->C_(r-1))` and `beta_r=dim H_r`, then `dim C_r=b_r+b_(r+1)+beta_r`. Applying this at degrees `k` and `k-1` gives

`S=b_(k+1)-b_(k-1)+beta_k-beta_(k-1)`.

Therefore `S<=0` is equivalent to `b_(k+1)+beta_k <= b_(k-1)+beta_(k-1)` for this complex. These are valid rank–nullity calculations; the formula is field-independent as an equality, although individual ranks and Betti numbers may depend on the field.

## Scope and usefulness boundary

The identity itself needs only finite induced graphs and positive ranks; the route's tree and eligibility assumptions enter through the selected tags and the primary contract. All three primary guards remain untouched: `x(T)+2<=p`, strict `3p<2alpha(T)+1`, and the original strict test `Delta_p(T-v)<0`. In particular, the strict selector does not imply the displayed boundary-rank/Betti inequality by any argument supplied here. Expanding `I(T-v)=I(H_v)+zI(R_v)` yields

`Delta_p(T-v)=q_v(p+1)-q_v(p)+i_(p+1)(R_v)-i_(p-1)(R_v)`,

which is a condition on count differences, not on the relative complex's boundary ranks or homology.

The construction is a direct sum: it preserves multiplicities and aggregates dimensions, but has no cross-tag differential and provides no cancellation map, capacity bound, or rank/homology comparison. It makes no pointwise-sign or within-tag Hall claim, so the standing order-91/order-243 controls and the refuted universal within-tag matching do not contradict it. Conversely, it does not resolve those controls or supply a useful compensation mechanism for them. The empty selected set gives the zero complex and `S=0` as required.

No tree counterexample, computation, literature result, or source replay is offered. There is no finite-generation claim. The primary therefore remains open on this route evidence; the retained claim is only the exact reduction and its explicitly unproved inequality.

## Limitations

- No argument derives the rank/Betti budget from the selector or the ordinary-tree structure.
- Direct-sum dimensions do not themselves implement cross-tag cancellation.
- No eligible full-sum counterexample, bounded census, or theorem application was produced.
