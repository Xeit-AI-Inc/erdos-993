# C2-CF-U4 cross-orientation critique

## Disposition

**E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE — retained_narrowed.** The fixed-selector weighted-layer identity and the finite weighted deletion-flow / cut equivalence are correct for each eligible instance. A saturating flow is sufficient for the scalar sign. However, the route identifies the full-upper-layer cut with the scalar inequality; that identification is not established. The full-layer cut sees only lower sets that are deletions of upper sets, and a lower independent set need not extend to rank `p+1`.

## Independent audit

Fix an eligible ordinary tree `T`, its original leaf selector `F(T,p)`, and a selected leaf `v` with support `s`. Put `H=T-{v,s}`, `W=N_T(s)\\{v}`, and `R=T-N_T[s]`. Then `R=H-W`. Independent `j`-sets of `H` not counted in `R` are exactly those meeting `W`, so `q_v(j)=i_j(H)-i_j(R)` counts those sets.

For each such set `A`, adjoining `v` yields an independent set `B=A union {v}` in the original tree: `s` is absent from `H`, and `s` is the only neighbor of the original leaf `v`. Conversely, a set `B` counted with tag `v` contains `v`; deleting it recovers `A`, which lies in `H` and meets `W`. These maps are inverse. Thus every tag contributes once, even when selected leaves share a support, and

`sum_(v in F) q_v(j) = sum_(B in I_(j+1)(T)) w_F(B)`.

The selector is the one fixed original set `F(T,p)` at both ranks. Also

`q_v(p)-q_v(p-1) = [i_p(H)-i_(p-1)(H)]-[i_p(R)-i_(p-1)(R)]`,

which is exactly the leaf summand because `Delta_(p-1)(G)=i_p(G)-i_(p-1)(G)`. Summing gives `S=sum_(I_(p+1))w_F-sum_(I_p)w_F`. Zero extension handles empty or out-of-range layers; under the primary guards no such convention changes the argument. The eligibility conditions define the target scope and the selector; they are not used to infer any sign in this identity.

For the flow formulation, let each upper set `B` have supply `u(B)=w_F(B)`, each lower set `A` have capacity `c(A)=w_F(A)`, and connect `B` to each one-element deletion `A subset B`. Choose deletion-arc capacity `M=sum_B u(B)+sum_A c(A)+1`. Any cut crossing such an arc costs more than the total source capacity, so a minimum cut does not cross one. If its source-side upper vertices are `X`, it must include all lower neighbors `N_-(X)`; the least-cost choice includes exactly those. Its capacity is therefore `sum_(B notin X)u(B)+sum_(A in N_-(X))c(A)`. Requiring every cut to have capacity at least total source supply is equivalent to `sum_X u(B)<=sum_(N_-(X))c(A)` for every `X`. This is the claimed weighted Hall/min-cut condition. Integral capacities imply an integral saturating flow when it exists. If total supply is zero, the zero flow handles the case directly.

## Scope, usefulness, and limitations

This is an exact certificate characterization for a fixed finite instance, not a proof that all its cuts hold for every eligible ordinary tree. A saturating flow implies `S<=0`, since its total value is the upper weight and its terminal capacity is bounded by the total weight on all rank-`p` sets. The full-upper-layer cut uses only `N_-(I_(p+1)(T))`; it is generally a potentially stronger condition than `S<=0` unless all omitted lower sets have zero weight. Proper-cut validity is also an additional demand of this particular flow certificate, not a necessary condition for the scalar inequality. Failure of any cut shows only that this certificate fails, not that `S>0`.

No positive complete sum, eligible tree counterexample, universal cut proof, or numerical census is asserted in the route. The fixed original selector, original neighborhoods, and repeated leaf multiplicities are preserved. The result is useful as a precise potential certificate and obstruction language, but it does not reduce the main open inequality without a separate argument establishing the cuts or another direct proof. The route's exact representation and flow equivalence survive; the claim that the full-layer cut equals the primary scalar inequality is narrowed away.
