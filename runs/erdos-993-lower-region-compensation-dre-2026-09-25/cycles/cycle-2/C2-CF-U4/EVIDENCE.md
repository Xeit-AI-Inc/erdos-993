# Independent audit evidence for C2-CF-U4

## Claim reviewed

`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, the single source claim in the sealed C2-U4 route case.

## Checked identities

For each original selected leaf `v`, with original support `s_v`, define `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\\{v}`, and `R_v=T-N_T[s_v]`. Direct set deletion gives `R_v=H_v-W_v`. Hence

`q_v(j)=i_j(H_v)-i_j(R_v)=|{A in I_j(H_v): A meets W_v}|`.

The map `A -> A union {v}` is a bijection from these sets to pairs `(v,B)` in which `B` is an independent `(j+1)`-set of the original `T`, `v in B`, and `(B minus {v})` meets `W_v`. The forward image is independent because `A` omits `s_v`, the only neighbor of `v`; the inverse deletes the tagged `v`. Distinct original leaves remain distinct tags if their supports agree. Therefore, with the fixed original selector,

`sum_(v in F(T,p)) q_v(j)=sum_(B in I_(j+1)(T)) w_F(B)`.

Subtracting the `j=p-1` identity from the `j=p` identity yields the route's formula for `S`, since each original leaf contribution is `q_v(p)-q_v(p-1)=Delta_(p-1)(H_v)-Delta_(p-1)(R_v)`. No rank-dependent selector is introduced.

## Checked flow/cut equivalence

All independent-set layers are finite. Supplies, capacities, and deletion-arc capacities are nonnegative integers. With deletion-arc capacity `M=total supply+total lower capacity+1`, a cut crossing a deletion arc costs more than total supply, so a minimum cut has no such crossing. For source-side upper set `X`, closure across deletion arcs forces all of `N_-(X)` onto the source side. The least cut with upper part `X` has capacity

`sum_(B notin X) w_F(B)+sum_(A in N_-(X)) w_F(A)`.

It is at least total supply iff the weighted neighborhood inequality holds for `X`. Max-flow/min-cut and integrality give exactly the stated saturating-flow equivalence. Zero total supply is satisfied by the zero flow.

For `X=I_(p+1)(T)`, the cut condition is `sum_(I_(p+1))w_F <= sum_(N_-(I_(p+1)))w_F`. This is not automatically the scalar layer comparison, whose right side sums weights over all of `I_p(T)`: a rank-`p` independent set need not be a one-vertex deletion of a rank-`p+1` independent set. A saturating flow nevertheless suffices for `S<=0`, since its total value is at most the total weight on the entire lower layer. The cut characterization is exact for existence of this flow, but its full-layer cut can be stronger than the desired scalar inequality. Failure of any cut is only failure of this proposed certificate, not a counterexample to `S<=0`.

## Scope and reproducibility

This audit is a direct finite combinatorial derivation. No source replay or computation was needed, and no bounded exhaustive conclusion is claimed. The primary guards `x(T)+2<=p` and `3p<2alpha(T)+1`, the strict original favorable selector, original supports/neighborhoods, and tag multiplicity remain as in the registered target. The identities themselves hold more broadly when the displayed finite-set definitions make sense, but this review makes no proposal to broaden the registered claim.
