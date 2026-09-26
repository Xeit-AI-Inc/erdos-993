# C6-T6 search report

## Result and exact scope

I investigated the equal-length-three spider family: for each integer `m >= 2`, take a root `r` and `m` disjoint arms `r-a_i-b_i-c_i`. It is a non-star ordinary tree with `3m+1` vertices, independence number `2m`, and exactly the `m` original leaves `c_i`. The route produced a useful exact reduction and an eligible full-sum instance, but did not prove a family theorem or resolve the arbitrary-tree aggregate.

With `Q=1+3z+z^2` and `V=1+2z`, root conditioning gives

`P_m(z)=Q^m+zV^m`.

Deleting one endpoint gives

`A_m(z)=VQ^(m-1)+z(1+z)V^(m-1)`.

For an endpoint `c_i` supported at `b_i`, write `H_i=T-{b_i,c_i}` and `R_i=T-N[b_i]`. The remaining `r-a_i` edge in `H_i` contributes `V` when the root is absent, while in `R_i` that arm is removed. The root-included parts of both polynomials are `zV^(m-1)`. Hence `I(H_i)-I(R_i)=zQ^(m-1)`, and each original-leaf summand at rank `p` equals `Delta_(p-2)(Q^(m-1))`. If every endpoint is favorable, the full selected sum is therefore `m Delta_(p-2)(Q^(m-1))`.

This gives a precise conditional sufficient route for this class: prove `x(P_m)>=m` and prove `Delta_p(A_m)<0` for every rank satisfying `p>=x(P_m)+2` and `3p<4m+1`. Then every original endpoint is selected; eligible `p` has `p-2>=m`, and symmetry plus strict log-concavity of `Q^(m-1)` makes the complete sum strictly negative. Those two uniform inequalities are not established here. The root-conditioned formulas themselves do not establish them.

## Exact bounded evidence

`EVIDENCE.py` uses integer polynomial convolution, zero-extended differences, and the corrected terminal-inclusive first-descent helper. It evaluates every eligible integer rank for `m=2,...,60`: 59 family members and 532 eligible `(m,p)` rows. On all 532 rows it found `x(P_m)=m`, every tip favorable, and a negative full sum. This is a bounded check, not evidence of a universal crossing or selector theorem. A literal forest-DP calculation from the pinned `ordinary_tree_checked.py` independently matched `P_m` and all endpoint-deletion polynomials for `m=2,...,8`.

The complete witness `m=6,p=8` has vertices `0,...,18`, root `0`, and for `i=0,...,5` arm vertices `(a_i,b_i,c_i)=(1+3i,2+3i,3+3i)` with edges `(0,a_i),(a_i,b_i),(b_i,c_i)`. Its independence polynomial is

`[1,19,153,690,1930,3498,4181,3322,1770,630,141,18,1]`.

Thus `alpha=12`, `x=6`, `p=x+2=8`, and `3p=24<25=2alpha+1`. The common endpoint-deletion polynomial is `[1,18,136,570,1465,2403,2543,1732,755,205,31,2]`, with `Delta_8=-550`; all six original leaves are in the fixed selector. Each has `Delta_7(I(H_i))=-590`, `Delta_7(I(R_i))=-235`, and summand `-355`, giving the complete sum `S=-2130`. This confirms one eligible non-star instance; it is not a counterexample or a family proof.

## Gaps and disposition

The proposed root-excluded/root-included injection in the source lead has a genuine unresolved disjoint-image issue. No symmetric-chain or rank-monotonicity theorem is inferred from it. The finite census does not prove `x(P_m)>=m`, selector propagation, or a universal result. No broader rooted-branch class beyond this one precisely defined family was resolved. No claim is made that a review not performed establishes a mathematical defect.

Hash check: all 237 source entries listed in `C6-COMMON.json` matched their listed SHA-256 values. The case packet lists no source worker files and no `required_covered_claim_ids`; this search return therefore records one route-local partial claim and no covered IDs.
