# C6-CF-U2 critique of C6-U2-CENSUS-M1-40

## Disposition

**retained** as an exact bounded computation for the specified family. The submission does not claim, and this review does not infer, a result for arbitrary ordinary trees or for the larger heterogeneous prefixes.

## Independent checks

I checked the full census replay from a copy of `census.py` in this scratch directory, with its output redirected here, and a copy of the pinned `inputs/ordinary_tree_checked.py`. The replay independently reproduced 12,340 unordered profiles, 191,016 eligible profile/rank pairs, and 19,131,028 selected original-leaf tags. All full sums were strictly negative (191,016 negative; zero positive and zero zero). All six graph-DP profile checks had zero mismatches over 164 polynomial comparisons. The exact replay output is `REPLAY-EVIDENCE.json`; the local replay and evaluator copies are `census_replay.py` and `ordinary_tree_checked.py`.

The profile count is exhaustive for the stated boundary: at each `m`, `combinations_with_replacement((2,3,4),m)` enumerates every unordered multiset once, and `sum_{m=1}^{40} binom(m+2,2)=12,340`. The `p` loop uses `x+2` through `floor(2 alpha/3)`, equivalent for integer `p` to the two contract guards `x+2<=p` and `3p<2alpha+1`. The first descent loop includes rank `alpha` through zero extension.

## Formula and selector audit

For each branch, its center and `r` private leaves have independence polynomial `B_r=(1+z)^r+z`; write `Q=prod_i B_{r_i}`, `N=sum_i r_i`, and `L=1+z`. Splitting on root 0 gives `P=(1+2z)Q+zL^(N+1)`, so the stated independence number is `alpha=N+2`. Deleting endpoint 2 gives `A_0=LQ+zL^N`. Deleting one private leaf on an arity-`r` branch gives `A_r=(1+2z)B_(r-1)H_r+zL^N`, where `H_r` omits one such branch. Thus the strict selector tests `Delta_p(A_0)<0` and `Delta_p(A_r)<0` match the original-tree leaf-deletion definition.

For a private leaf with support the branch center, `H_v=T-{v,s_v}` and `R_v=T-N[s_v]` differ by independent sets meeting the other neighbors of that center. Splitting according to root 0 and whether this nonempty neighbor set is used gives `i(H_v)-i(R_v)=zZ_r`, where `Z_r=(1+2z)F_rH_r+L^N` and `F_r=((1+z)^(r-1)-1)/z`. For endpoint 2, `H_v` has polynomial `Q+zL^N`, while `R_v` has polynomial `Q`, giving difference `zL^N`; hence `Z_0=L^N`. Since `Delta_(p-1)(zZ)=Z[p-1]-Z[p-2]`, the replay's per-tag summand is the contract summand. It weights each selected private leaf by `r` per branch and by the number of arity-`r` branches, preserving distinct tags even when supports are shared.

The six explicit graph checks independently construct the path-and-branches trees and compare the full, endpoint-deleted, and private-leaf-deleted tree-DP polynomials, plus each `H_v-R_v` difference against the recurrence. They are a fidelity check on those six profiles, not an exhaustive graph verification for all profiles; exhaustive coverage within the finite family rests on the recurrence derivation and replay enumeration.

The 5,253,954 central-margin checks reported by the replay are also finite checks of the listed polynomials and rank interval. They do not establish the uniform analytic argument or missing mixed-minor bounds, and they are not needed to validate the bounded census claim.

## Scope and limitations

This is useful bounded evidence on the path `0-1-2` with root-adjacent centers of arities 2, 3, or 4, for `1<=m<=40`. It does not cover all `m<2000`, an infinite family, or arbitrary ordinary trees. It supplies no universal proof of the lower-region aggregate. No mathematical defect was found in the submitted bounded claim; the distinction between this finite result and the primary target is a scope limitation, not an unresolved review of the bounded arithmetic.
