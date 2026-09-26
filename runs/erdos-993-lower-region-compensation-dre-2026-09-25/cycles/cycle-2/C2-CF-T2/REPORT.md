# C2-CF-T2 critique of C2-T2

## Disposition

**retained_narrowed** for `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: retain the exact weighted-rank identity and the conditional cross-tag matching criterion. The source supplies neither the needed matching/capacity theorem nor an eligible positive full-sum counterexample. Consequently its proposed-open status is appropriate; the primary inequality remains unresolved by this route.

## Independent algebra and domain audit

Fix an eligible ordinary tree `T` and its one selector `F=F(T,p)`. For each selected original leaf `v` with original support `s_v`, write `H_v=T-{v,s_v}`, `R_v=T-N_T[s_v]`, and `W_v=N_T(s_v)\setminus {v}`. Since `H_v` is obtained from `T` by deleting the leaf and support, `R_v=H_v-W_v`. Thus independent sets of `H_v` partition according to whether they meet `W_v`, giving

`q_v(j)=i_j(H_v)-i_j(R_v) = number of independent j-sets of H_v meeting W_v`.

For every integer `j`, including zero-extended ranks, `Delta_j(H_v)-Delta_j(R_v)=q_v(j+1)-q_v(j)`. The summand in the target is therefore `q_v(p)-q_v(p-1)`, since `k=p-1`; hence

`S(T,p)=sum_{v in F}(q_v(p)-q_v(p-1))`.

This uses the contract's `p>=x(T)+2` with `x(T)>=0`, so `p>=2` and `k>=1`. The strict lower-region condition `3p<2a+1` is not needed for this identity; neither is favorable status. Those hypotheses remain necessary for the target theorem and for identifying `F`. No part of the derivation changes the selector: it is always the original set defined by `Delta_p(T-v)<0`.

For an independent set `B` of the original `T`, define `w_F(B)` exactly as in the source. For each individual tag `v`, `A -> A union {v}` bijects the independent `j`-sets of `H_v` meeting `W_v` with independent `(j+1)`-sets `B` containing `v` and meeting `W_v` after `v` is removed. The support `s_v` is absent, and `v` has no other neighbors, so this is independent in `T`; conversely independence of `B` forces `s_v` absent and deletion of `v` recovers `A`. Summing over tags (rather than supports) yields

`sum_F q_v(j)=sum_{B independent, |B|=j+1} w_F(B)`

and thus `S(T,p)=sum_{|B|=p+1}w_F(B)-sum_{|B|=p}w_F(B)`. Tags sharing a support correctly contribute with multiplicity. The identity keeps `F(T,p)` fixed across both ranks; it does not replace it by `F(T,p+1)`. This independently checks the assigned global-coordinate identity.

## Transport criterion and gap

The token sets `U_r` have size equal to the rank-`r` weighted total. The described edge relation is well-defined: each lower token `(A,u)` is reachable from `(B,v)` only when `A` is obtained by deleting one vertex of `B`, with `u` still counted in `w_F(A)`. A matching saturating `U_{p+1}` would inject its tokens into `U_p`, proving `S<=0`. Likewise, a flow sending one unit from each upper token to lower-token sinks of capacity one would prove the same cardinality inequality; a finite bipartite unit-capacity flow has an integral maximum, so this is not a stronger unproved escape hatch.

No matching or flow is constructed in the route, and no Hall inequalities are shown. The existence of deletion edges alone does not establish that every upper token reaches a lower token or that neighborhoods have sufficient capacity. In particular, the selector inequalities `Delta_p(T-v)<0` are not converted to a capacity bound. The neutral handoff records that the 91- and 243-vertex controls rule out a universal within-tag matching argument; that does not refute this more permissive cross-tag graph. The source claims no such refutation, which is correct.

There is no realizable tree, independence-count vector, selector list, or complete sum offered as a counterexample, and no bounded census is asserted. Nor is a proof of `S<=0` obtained from the coordinate identity or from the stated pointwise weight bound. All contract scope requirements (finite ordinary tree, zero-extended counts, original supports/neighborhoods, strict selector, strict lower-region guard, same fixed selector, complete sum, and same-support leaf multiplicity) are stated correctly in the source. Since its only mathematical conclusion is conditional and the critical premise is open, there is no claim to upgrade beyond the narrowed conditional reformulation.

## Limitations

- No cross-tag Hall inequality, matching, or fractional capacity estimate is proved under the fixed favorable selector.
- No eligible positive full-sum counterexample is supplied; failure of this proposed matching, if later found, would not by itself refute the primary assertion.
- No external theorem or computation is used or needed for the route's stated identities; this critique does not claim a universal verdict.
