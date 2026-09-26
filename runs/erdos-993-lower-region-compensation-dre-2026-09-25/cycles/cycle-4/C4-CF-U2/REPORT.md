# C4-U2 independent critique (orientation F)

## Disposition

**retained_narrowed** for `C4-U2-MARKED-SHELL-REDUCTION`. The conditional implication and the stated method cutoff survive, with the exact scope recorded below. This is not a proof or refutation of the registered lower-region aggregate.

## Independent audit

Let `H=T-{v,s_v}`, `W=N_T(s_v)\\{v}`, and order the marked vertices with a non-isolated mark first. An independent `j`-set meeting `W` has a unique first mark `w_i`. Removing that mark leaves an independent `(j-1)`-set in `J_i=H-(N_H[w_i] union earlier marks)`, and conversely each such set gives a unique set in the `i`th block. Thus `q_j=sum_i i_(j-1)(J_i)` without overlap. The first deletion has at least two vertices because its mark is non-isolated; every later deletion has at least two because it contains the current mark and an earlier distinct mark. For an isolated later mark these vertices are distinct as well.

Write `ell_i=|V(H)\\V(J_i)|`. A cover of `J_i` together with all deleted vertices except `w_i` covers `H`: any edge outside `J_i` either has an endpoint among the added deleted vertices or is incident to `w_i`, in which case its other endpoint is in `N_H(w_i)`. Hence `tau(J_i)>=tau(H)-(ell_i-1)`. The tree leaf exchange gives `alpha(H)=alpha(T)-1`, and therefore `tau(H)=tau(T)-1`; the route's parent assumption yields `tau(H)>=c=ceil(3s/2)`. Also `W` meets every component of `H`, since each component attaches to the removed support in the original tree. Since `c>=3`, `H` has an edge, so at least one such marked vertex is non-isolated. These facts justify the ordered partition and its first-mark condition.

For a residual block put `r=p-2`, `d=s+2-ell_i`; then `|J_i|=2r+d`. If `d<=1`, the ordinary shadow count gives `(r+1)i_(r+1)(J_i) <= (|J_i|-r)i_r(J_i) <= (r+1)i_r(J_i)`. If `d>=2`, the required matching size is `m(d)=ceil(3d/2)-1`. With `t=ell_i-2`, `ell_i-1+m(d)=t+ceil(3(s-t)/2)<=ceil(3s/2)=c`; the cover-loss bound and `tau(J_i)=nu(J_i)` supply that many matching edges. The further requirement `r>=K(d)=2m(d)-d` is not implied by this calculation and must remain an explicit hypothesis. For `d=2`, `m=K=2`; the stated first-wide result handles `r=1`, while the general matching threshold applies for `r>=2`. The general matching implication for `d>=3` is an inherited theorem application under precisely these rank and matching conditions, not reproved here.

When all residual block inequalities `i_(r+1)(J_i)<=i_r(J_i)` hold, summing the partition at `j=p` gives `q_p<=q_(p-1)`. Since `q_t=i_t(H)-i_t(H-W)`, the difference is exactly `Delta_(p-1)(H)-Delta_(p-1)(H-W)`. Here `H-W=T-N_T[s_v]`. Thus every leaf term is nonpositive under the conditional hypotheses, and summing over any fixed subset preserves the sign; same-support leaves are still separate terms. Applied to the favorable selector this is a conditional pointwise route to a nonpositive sum, not evidence that every eligible tree meets the parent cover or residual-rank hypotheses.

The `s=5` cutoff arithmetic is correct: at `c=8` and `q=p-2>=1`, the outside size is `N=2p-3=2q+1`, so `binom(N,q+1)-binom(N,q)=0`; the first nonempty-fiber subtraction in the stated estimate is `8 Cat_(q-1)>0`, with negative sign. That lower bound is therefore negative and cannot establish the desired positive prehistory at that terminal rank. This is a failure of that estimate to force the cover threshold, not a counterexample to a shell statement.

## Exact surviving scope

For `n(T)=2p+s`, `p>=3`, `s>=2`, and a leaf `v`, assume `tau(T)>=ceil(3s/2)+1` and, for every first-mark residual block with `d>=3`, `p-2>=K(d)`. Using the stated inherited matching theorem and the exact `d=2` first-wide result, the report's argument proves

`Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N_T[s_v]) <= 0`.

It follows for any fixed subset of original leaves. The Catalan computation only establishes the stated limitation at `s=5`, terminal rank `p-2`.

## Limitations

- The parent cover threshold is conditional and is not established for every eligible tree; the `s=4`, `p=10..13` low-cover cases remain outside this reduction.
- The residual rank condition for blocks with `d>=3` is an independent hypothesis, not a consequence of cover loss.
- The large-rank matching theorem and the `d=2` first-wide boundary result are inherited dependencies; this critique checked their use against the stated thresholds but did not rebuild their proofs or formal artifacts.
- No new graph census or source-code replay was needed for this claim. No positive full aggregate or counterexample to the target is supplied.
