# C2-CF-T5 independent critique evidence

## Claim: `C2-T5-PENDANT-P2-RECURRENCE`

Let `T` be obtained from a finite ordinary tree `U` by adding `r-s-v`, where `r` is the distinguished vertex of `U`. Partition independent sets by the status of `s`. With `P=I(U;z)` and `Q=I(U-r;z)`, sets omitting `s` contribute `(1+z)P`; sets containing `s` omit `r,v` and contribute `zQ`. Thus

`I(T;z)=(1+z)P+zQ`.

The same partition after deleting the new leaf gives `I(T-v;z)=P+zQ`. In the original tree, `s_v=s`, `T-{v,s}=U`, and `T-N_T[s]=U-r`; hence the new leaf's summand is exactly `Delta_(p-1)(P-Q)`. This uses the original support and closed neighborhood, as required. The formula is valid for every finite `U`, including a one-vertex `U`.

For independence number, the `s`-absent class has maximum size `alpha(U)+1`, attained by a maximum independent set of `U` together with `v`. The `s`-present class has maximum `1+alpha(U-r)<=1+alpha(U)`. Therefore `alpha(T)=alpha(U)+1`. There is no hidden assumption that `r` is a leaf or that `U-r` has a particular independence number.

The new leaf's selector remains the strict test `Delta_p(T-v)<0`, i.e. the difference of coefficients at ranks `p+1` and `p` in `P+zQ`. It is not the rank-`p-1` selector on `U`. The recurrence proves the submitted exact claim; it does not assert that the new leaf is selected.

## Independent check of the descent diagnostic

For `U=K_(1,4)` rooted at its center, `P=(1+z)^4+z` and `Q=(1+z)^4`. Their coefficient vectors are `(1,5,6,4,1)` and `(1,4,6,4,1)`. The adjacent differences of `P` begin `4,1,-2`, so `x(U)=2` (the later zero-extended terminal difference does not change the first descent).

The attachment gives coefficient vector `(1,7,15,16,9,2)`. Its adjacent differences begin `6,8,1,-7`, so `x(T)=3`. Also `|T|=7` and `alpha(T)=5`. No integer `p` makes this an eligible primary instance: the lower-region guard `3p<2alpha(T)+1=11` forces `p<=3`, while `x(T)+2<=p` forces `p>=5`. It is therefore a valid guard-instability diagnostic and not a counterexample or shell instance.

## Claim: `E993-LOWER-REGION-FIRST-ORDER-SHELL`

For the shell attachment with `|U|=2p`, the recurrence yields `|T|=2p+2` and `alpha(T)=alpha(U)+1`. The alpha guard transfers only one way: the child's rank-`p-1` strict inequality implies the parent's rank-`p` inequality, while the parent guard can hold at the integer boundary `3p=2alpha(U)+3` where the child guard fails. More importantly, the recurrence alone supplies no implication for `x(T)+2<=p` versus `x(U)+2<=p-1`.

Even with those guards, a shell proof needs the strict selector for each original leaf of `T`, including changes in the deletion polynomials of retained leaves, and a comparison of the complete sum with one summand per original leaf. The recurrence identifies the new leaf's contribution but supplies neither those selector correspondences nor a bound on the retained-leaf contributions. The route correctly leaves these bridges open. This is a limitation of the proposed recurrence argument; it is not a proof that the shell assertion is false or unprovable by another method.

## Source and replay limits

The two sealed source files and return were read as pinned by the case packet; all three case hashes and all 27 common-source hashes matched their packet entries. The permitted contract, protocol, execution policy, neutral handoff, critic brief, and relevant common order-band/standing-control materials were consulted for scope and fences. No sealed source was modified. No source computation was replayed; the small polynomial arithmetic above was independently recomputed from the displayed graph description. No finite-generation or universal result is claimed.
