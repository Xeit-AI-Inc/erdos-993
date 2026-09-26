# C2-CF-T4 cross-orientation critique

## Scope and result

I audited both claims in the sealed C2-T4 return against the exact lower-region contract, from orientation F. The primary universal assertion remains an open obligation. The route’s fixed-selector occupancy identity and its eligible-path subcase survive audit. The path proof is a genuine exact subcase; its finite loop is only corroboration, not a tree census.

The packet’s listed source hashes all matched. I used the permitted common contract, protocol, policy, handoff, critic brief and listed controls, along with the single case C2-T4. The arithmetic replay was run from the local `replay_path.py` in this worker scratch directory.

## Claim dispositions

- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — **retained** as the exact registered open target, not as a proved inequality. The route itself does not claim a universal proof: it records no branch-tree rank comparison and no full-sum counterexample. The lower-region guards, original strict selector, original supports/neighborhoods and leaf multiplicity are preserved in its scope. The occupancy identity is a reformulation only and does not resolve the target.
- `C2-T4-PATH-OCCUPANCY` — **retained** on the stated path scope. For an endpoint leaf, `H=P_(n-2)`, `R=P_(n-3)`, and the path recurrence yields `q(j)=i_(j-1)(P_(n-4))`. Reflection makes the two endpoint contributions equal. The first-descent argument places both endpoints in the fixed selector: the path layer ratio decreases with rank and increases with path order, so `x(P_(n-1))<=x(P_n)`; after the first negative difference, all later differences through the terminal zero extension remain negative. Thus `p>=x(P_n)+2` implies `Delta_p(P_(n-1))<0`. The strict lower-region guard also ensures `p<=alpha(P_(n-1))` whenever eligibility is nonempty.

The path sum is therefore exactly `2*(i_(p-1)(P_(n-4))-i_(p-2)(P_(n-4)))`. With `k=p-1`, the ratio at rank `x(P_n)` for `P_(n-4)` is strictly below one whenever defined: it is smaller than the corresponding ratio for `P_n`, which is below one by the strict descent. Rank monotonicity then gives `i_k<=i_(k-1)`; zero extension covers ranks beyond support. Small orders without eligible parameters are vacuous.

## Occupancy audit and boundary

For each selected original leaf `v`, `q_v(j)=i_j(H_v)-i_j(R_v)` counts independent `j`-sets of `H_v` meeting `W_v`. Adding `v` bijects these with independent `(j+1)`-sets of `T` counted by the `v` tag in `w_F`. Since `F=F(T,p)` is fixed while ranks vary, summing tags gives `Q(j)=sum_{|B|=j+1}w_F(B)`. Also, the summand in `S` is `q_v(p)-q_v(p-1)`. Hence the claimed weighted-occupancy identity has the correct rank shift and is exact, including repeated supports as distinct tags. The measure form is valid with the stated zero-count convention. It supplies no adjacent-rank monotonicity for branching trees.

I found no path-proof defect, but it relies on the path coefficient formula and rank-ratio argument; it does not extend by itself to branching trees. The stated 449-row/117-order arithmetic and extrema replay exactly. This checks only the listed path range and the formula’s arithmetic. No broad graph-cardinality boundary, component-root, or generic marked-order theorem is asserted by this route, so none is inferred here. No imported theorem or universal correlation premise is needed or supplied.

## Limitations

The main missing step is still an aggregate weighted adjacent-rank inequality, or another complete proof, for eligible branching trees with the selector fixed at `p`. The route gives neither such a map/bound nor an ordinary-tree counterexample with a positive complete selected sum. A positive local term, if one arose, would not refute the full sum. The replay is finite path arithmetic only and makes no exhaustive-generation claim.
