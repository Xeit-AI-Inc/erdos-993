# C2-U4 search report: cross-tag weighted deletion flow

## Exact target and result

This route addresses `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` under its registered scope: a finite ordinary tree `T`, `a=alpha(T)`, first strict descent `x(T)` of the zero-extended independence sequence, and integer `p` with `x(T)+2<=p` and `3p<2a+1`. The selected set is the fixed set

`F={v original leaf: Delta_p(T-v)<0}`.

Each leaf remains a distinct tag, including leaves with a common support. This search gives an exact weighted-flow primal and cut dual for the provided global weight coordinates. It does not prove the necessary cut inequalities for every eligible tree and does not refute the scalar aggregate.

## Audit of the fixed-selector weight identity

For each original leaf `v` with support `s_v`, put `H_v=T-{v,s_v}`, `R_v=T-N_T[s_v]`, and `W_v=N_T(s_v) minus {v}`. Since `H_v-W_v=R_v`, the number `q_v(j)=i_j(H_v)-i_j(R_v)` counts precisely independent `j`-sets `A` of `H_v` that meet `W_v`.

For any such `A`, the set `B=A union {v}` is independent in the original tree: `A` omits `s_v`, the sole neighbor of `v`. Conversely, if an independent set `B` contains `v` and `(B minus {v})` meets `W_v`, deleting `v` gives such an `A`. Thus this is a bijection, tag by tag, at every rank `j`.

Keep the one fixed selector `F` while changing rank, and define for every independent set `B` of `T`

`w_F(B)=|{v in F intersect B : (B minus {v}) intersect W_v is nonempty}|`.

Summing the tagwise bijections gives `sum_{v in F} q_v(j)=sum_{B in I_{j+1}(T)} w_F(B)`. As each original leaf contributes separately, this remains true when supports coincide. Taking `j=p` and `j=p-1` yields exactly

`S(T,p)=sum_{B in I_{p+1}(T)} w_F(B)-sum_{A in I_p(T)} w_F(A)`.

In particular, no selector at rank `p+1` has been substituted. The selector condition itself remains the strict original `Delta_p(T-v)<0`; the identity is algebraic and does not establish that condition or either primary guard.

## Flow primal and cut dual

Construct a finite network from the two layers `I_{p+1}(T)` and `I_p(T)`. Give each upper vertex `B` supply `w_F(B)` and each lower vertex `A` capacity `w_F(A)`. Join `B` to `A` exactly when `A subset B` (one-vertex deletion). Put capacity `w_F(B)` on the source-to-`B` arc, an effectively infinite capacity on every deletion arc, and capacity `w_F(A)` on each `A`-to-sink arc.

A flow saturating all source arcs is a weighted cross-tag deletion certificate. Its total value is `sum_{I_{p+1}}w_F`; its terminal capacity is `sum_{I_p}w_F`, so it proves `S<=0`. The arcs carry anonymous weight units: a unit originating from the contribution of one selected leaf may be routed to a lower set whose weight comes from another selected leaf. This is the permitted cross-support transfer; no within-tag matching is imposed. Since all capacities are integers, a feasible saturating flow can be chosen integral.

For `X subset I_{p+1}(T)`, write

`N_-(X)={A in I_p(T): A subset B for some B in X}`.

The weighted Hall/min-cut condition is exactly

`sum_{B in X} w_F(B) <= sum_{A in N_-(X)} w_F(A)` for every `X subset I_{p+1}(T)`.

Indeed, a finite source-side cut that places upper vertices `X` on the source side must also place all their lower neighbors `N_-(X)` there. Its minimum such capacity is `sum_{B notin X} w_F(B)+sum_{A in N_-(X)}w_F(A)`. Requiring this to be at least the total source supply gives the displayed cut inequality. Conversely these inequalities make every source-sink cut at least the total source capacity, so max-flow/min-cut supplies the flow. This is a tree-realizable cut characterization for the proposed certificate for every concrete eligible `(T,p)`, once its exact `F` and weights are evaluated.

## What the cut criterion does and does not say

The cut `X=I_{p+1}(T)` gives `sum_{I_{p+1}}w_F <= sum_{I_p}w_F`, which is precisely the desired scalar sign. The other cuts are additional requirements of this particular deletion-flow certificate. Their validity is not implied by the scalar sign alone, and failure of one would show only that this certificate cannot work, not that `S>0`. Conversely, satisfying all cuts for an eligible tree proves its scalar inequality by an explicit flow.

No general proof of these tree-realizable cuts was found in this route. No eligible ordinary-tree cut failure was computed here. Hence this supplies a precise primal/dual target and audits its connection to the fixed-selector identity, but leaves the registered universal aggregate OPEN. The requirements to preserve `x`, `a`, `p`, every strict favorable test, original neighborhoods, and complete tag multiplicity are not bypassed by the flow reduction.
