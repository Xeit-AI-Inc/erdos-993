# C2-CU-T4 critique (orientation U)

## Scope and source integrity

I audited the two claims in the sealed C2-T4 return against its report and evidence, the solution contract, cycle-2 handoff, protocol, global fixed-selector coordinates, and the assigned critic brief. All entries in both packet hash lists matched their stated SHA-256 values. No outside theorem or source was used. The bounded path arithmetic was replayed from the local audit copy `path_replay.py`; the sealed route files were not modified.

## Dispositions

### `C2-T4-PATH-OCCUPANCY` — retained

The occupancy bijection is exact with the original selector fixed. For each selected original leaf `v`, `q_v(j)=i_j(H_v)-i_j(R_v)` counts independent `j`-sets of `H_v` meeting `W_v`. Sending `A` to `A union {v}` is bijective onto the independent `(j+1)`-sets of the original tree counted by the `v`-tag in `w_F`: the support is absent, and the leaf is present. The inverse deletes that same leaf. Therefore `Q(j)=sum_F q_v(j)=sum_{|B|=j+1}w_F(B)`. Since the original summand is `q_v(p)-q_v(p-1)`, the aggregate is exactly the difference of weighted layers `p+1` and `p`. Multiplicities for leaves sharing a support are preserved because `w_F` counts tags individually. The selector is not changed as rank varies.

For paths `P_n`, `n>=4`, the original leaves are the two endpoints and have distinct supports. Reflection gives equal deleted-tree profiles, so either both endpoints are selected or neither is. The path coefficient formula is `i_j(P_m)=binom(m-j+1,j)` on the support and zero outside it. Its ratio is

`i_(j+1)(P_m)/i_j(P_m) = ((m-2j+1)(m-2j))/((j+1)(m-j+1))`.

On its positive domain this ratio decreases with `j` and increases with `m`; cross-multiplication of adjacent ratios verifies both comparisons. If the path eligibility set is nonempty, the strict lower-region guard gives `p<=alpha(P_n)-1` and `p<=alpha(P_(n-1))`. Also `x(P_(n-1))<=x(P_n)`: at `j=x(P_n)` the ratio for `P_n` is below one, and the fixed-rank ratio for the shorter path is no larger. Thus `Delta_p(P_(n-1))<0`, so both endpoints belong to the exact fixed selector.

For either endpoint, `H_v=P_(n-2)`, `R_v=P_(n-3)`, and the path recurrence gives `q_v(j)=i_(j-1)(P_(n-4))`. Hence the complete sum is

`S(P_n,p)=2*(i_(p-1)(P_(n-4))-i_(p-2)(P_(n-4)))`.

Writing `x=x(P_n)`, eligibility gives `p-2>=x`, and therefore the relevant ratio on `P_(n-4)` is below one whenever its denominator is nonzero: it is at most the corresponding ratio on `P_n`, already below one at rank `x`, and ratios decrease with rank. If the numerator rank is beyond support, zero extension gives the same nonpositive difference (including the terminal descent). Thus the full path sum is nonpositive. This proves the claimed path-class result; it makes no assertion about branching trees.

The route's deterministic path loop was independently replayed for `4<=n<=150`. It produced 449 eligible `(n,p)` rows over 117 orders, all nonpositive, with minimum `-140598451215242502192647212080` and maximum `-38896`, agreeing with the route. This is a bounded arithmetic cross-check only; the path argument supplies the class proof.

### `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — retained_narrowed

Retain the exact fixed-selector occupancy identity and the proved path subcase above. The route does not establish the required adjacent weighted-rank inequality for arbitrary branching trees and supplies no complete-sum counterexample. Its own report correctly leaves the registered universal assertion open. Neither the pointwise bound on `w_F` nor a local or support-fibre sign would close that gap. The disposition narrows what this route demonstrates; it does not refute or affirm the universal assertion.

## Limitations

- No weighted-rank comparison for general branching trees is proved.
- No eligible branching-tree full-sum counterexample is supplied.
- The finite replay covers paths only through order 150 and is not a generation or exhaustiveness claim about ordinary trees.
- No external literature or computation beyond the specified bounded path replay supports a universal conclusion.
