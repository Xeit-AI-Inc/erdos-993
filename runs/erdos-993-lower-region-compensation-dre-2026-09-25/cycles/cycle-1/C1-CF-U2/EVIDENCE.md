# Audit evidence for C1-U2-1

## Disposition

**Retained.** The conditional necessary criterion is valid on the exact eligible ordinary-tree domain stated. It is not a proof or refutation of the primary aggregate inequality.

## Domain and graph operations

Fix an eligible pair `(T,p)` from the contract and an original leaf tag `v` with original support `s_v`. Since `x(T)>=0` and `x(T)+2<=p`, `p>=2`, so `k=p-1>=1`. The strict lower-region condition gives `c=2a+1-3p`, a positive integer. In particular `p<a`, so the capacities below are nonnegative.

Put `H=T-{v,s_v}`, `W=N_T(s_v) minus {v}`, and `R=T-N_T[s_v]=H-W`. Then `alpha(H)=a-1`: a maximum independent set of `T` may be chosen to contain `v` and omit `s_v` (replace `s_v` by `v` if necessary, and add `v` if neither is present), so deleting `{v,s_v}` leaves an independent set of size `a-1` in `H`; conversely every independent set of `H` extends by `v` in `T`, so `alpha(H)+1<=a`. Thus equality holds. These are exactly the original support and neighborhood operations; nothing changes the selector `F`.

For `q_j=i_j(H)-i_j(R)`, `q_j` counts independent `j`-sets meeting `W`. The selected summand is exactly

`Delta_k(H)-Delta_k(R)=q_(k+1)-q_k`.

## Incidence identity and implication

For each independent marked `k`-set `A` of `H`, let `e(A)` count its actual addable vertices and set `d(A)=2(a-p)-e(A)`. Split addable vertices by the two color classes of the forest `H`. Within either class they are pairwise nonadjacent and each is nonadjacent to every vertex of `A`. Since `alpha(H)=a-1`, each class has size at most `(a-1)-k=a-p`; hence `e(A)<=2(a-p)` and `d(A)>=0`.

Count pairs `(A,z)` with `z` addable to `A`. The sum is `2(a-p)q_k-D`, where `D=sum_A d(A)`. Each independent `(k+1)`-set meeting `W` exactly once contributes `k` such pairs (delete one of its `k` unmarked vertices); each meeting `W` at least twice contributes `k+1`. If `C` counts the latter sets once each, the count is also `k*q_(k+1)+C`. Therefore

`k*(q_(k+1)-q_k)= [2(a-p)-k]q_k-D-C = c*q_k-D-C`,

since `2(a-p)-k=2a+1-3p=c`.

Summing over the fixed original favorable-leaf tags gives `(p-1)S=cQ-E`, with `Q=sum_F q_v(k)` and `E=sum_F(D_v+C_v)`. All sums preserve separate leaf tags, including tags sharing a support. If `S>0`, then `Q>0` and `E<cQ`. Since `E>=D` and all individual deficits are nonnegative, at least one selected `(v,A)` has `d_v(A)<c`; otherwise `D>=cQ`. Rearrangement gives

`2(a-p)-e_v(A)<2a+1-3p`, hence `e_v(A)>p-1`, and integrality gives `e_v(A)>=p`.

Conversely, if every such selected marked set has `e_v(A)<=p-1`, each deficit is at least `c`, so `D>=cQ`, `E>=D`, and `S<=0`. This establishes both directions of the stated necessary criterion/sufficient obstruction. It does not show that a set with at least `p` addable vertices exists in any positive aggregate, or that one such set suffices for positivity.

## Controls and limits

The supplied `K_(1,12)` control and the order-91 `T_22` and order-243 `T_60` controls have negative full selected sums (the latter two also have positive individual marked terms). They do not contradict this implication: its antecedent `S>0` is false on those controls. Their positive terms also do not prove the addability condition sufficient for positivity. No transport, pruning, or universal slot-dominance claim is made here. No source computation was replayed or used as proof; the result above is an exact counting argument. No primary aggregate verdict follows.
