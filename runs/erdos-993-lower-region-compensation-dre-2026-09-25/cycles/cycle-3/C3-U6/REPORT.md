# C3-U6 report: marked-face rank operators

## Scope and result

The 115 source entries listed in the common packet all matched their recorded SHA-256 values. The route packet lists no additional source files.

I investigated a down operator on the graded marked faces of an independence complex. This gives a precise sufficient condition for the primary aggregate, and an exact proof for the full star family. It does not establish that condition for arbitrary eligible trees, so the primary claim remains open.

Let `Delta(H)` be the independence complex of a finite graph `H`, let `W` be a marked vertex set, and define

`M_j(H,W) = span_Q { e_A : A is independent in H, |A|=j, A intersects W }`.

Then `dim M_j(H,W)=q_j`, where `q_j=i_j(H)-i_j(H-W)`. Define the mark-preserving incidence down map

`d_{j+1}: M_{j+1}(H,W) -> M_j(H,W)`,  
`d_{j+1}(e_A) = sum_{u in A, (A minus {u}) intersects W} e_(A minus {u})`.

If `d_{k+1}` is injective for every selected original leaf's pair `(H_v,W_v)`, then `q_v(k+1)<=q_v(k)` for every such leaf. Since the summand in the contract is `q_v(k+1)-q_v(k)` with `k=p-1`, this pointwise rank condition implies the full selected sum `S(T,p)<=0`. This is a concrete sufficient operator criterion; I have not proved it under the contract's general hypotheses.

## Exact star-family case

Take `T=K_{1,m}` with `m>=4`. Its independent-set counts are `i_0=1`, `i_1=m+1`, and `i_j=binom(m,j)` for `2<=j<=m`, with zero extension above `m`. Thus `Delta_0=m`, `Delta_1=binom(m,2)-(m+1)>=0`, and for `2<=j<m`,

`Delta_j = binom(m,j) * (m-2j-1)/(j+1)`.

Also `Delta_m=-1`. Consequently `x(T)=floor((m-1)/2)+1`. For any `p` satisfying the contract's `x+2<=p` and `3p<2m+1`, deletion of any original leaf gives `K_{1,m-1}` and `Delta_p(T-v)<0`; hence every original leaf belongs to the fixed selector `F(T,p)`.

For each such leaf, `H_v=T-{v,s_v}` is the edgeless graph on the other `m-1` leaves, `W_v` is all of those vertices, and `R_v` is empty. Therefore `q_v(j)=binom(m-1,j)` for `1<=j<=m-1` (and `q_v(0)=0`). With `k=p-1`, eligibility gives `k>=x+1>(m-1)/2`, so the adjacent binomial coefficients are decreasing. The complete sum is exactly

`S(T,p)=m*(binom(m-1,p)-binom(m-1,p-1)) < 0`.

For example, `m=20` has `x=10`; both `p=12` and `p=13` satisfy the guards. Their complete sums are respectively `-503880` and `-465120`.

On this star, `d_{k+1}` is the ordinary Boolean-lattice down operator on the nonempty subsets of an `(m-1)`-element set. For a Boolean lattice on `n` points, complement identifies the rank-`r` down map with the rank-`n-r+1` up map. The up map is injective below the middle rank: with the usual up/down operators, `D U-U D=(n-2r)I` on rank `r`, so `Ux=0` and `r<n/2` force `x=0` by taking the inner product with `x`. Thus the down map is injective when its source rank is above `n/2`. Here that source rank is `k+1`, which is above `n/2` from the guards, and this gives the displayed local inequality.

## Operator boundary and topology check

The injectivity criterion cannot be asserted at all ranks, even for the star's edgeless residual. For `m=20`, `H_v` has 19 isolated vertices and all are marked. At `j=5`, the source and target dimensions for `d_6` are `binom(19,6)=27132` and `binom(19,5)=11628`; injectivity is impossible. This rank is not selector-eligible for this tree, so it is an obstruction only to an unqualified all-rank claim, not to the primary assertion.

The independence complex of `K_{1,m}` itself is the disjoint union of the simplex on the leaves and the isolated center vertex. It is not pure or connected. Thus a theorem whose stated hypotheses require a pure or connected complex cannot be applied to all trees through this complex without an additional argument. No real-rootedness, matroid, Lefschetz, or negative-dependence premise was used here.

## Gap

For a general tree residual `(H_v,W_v)`, the allowed independent faces do not form a Boolean lattice: adding a vertex may violate independence, and deleting the last marked vertex leaves `M_j(H_v,W_v)`. The defined incidence map may therefore fail to have the Boolean operator's rank properties. I have no injectivity proof, aggregate rank inequality, or exact eligible full-sum counterexample for general trees. The star calculation is a proved subcase only; it does not resolve the registered lower-region aggregate.

## Evidence

`EVIDENCE.json` contains the exact star formulas, guard calculations, example arithmetic, and the dimension obstruction. No external literature result is needed for these elementary finite-dimensional arguments.
