# C4-T5 independent critique (orientation U)

## Dispositions

- **C4-T5-TM80-BOUNDED — retained_narrowed.** The bounded conclusion is correct for the specified family after correcting an error in the source replay's claw-leaf deletion polynomial. Under the stated labeled graph recipe, deleting one claw leaf leaves the path component with polynomial `1+2z` when the root `r` is absent. Thus
  `I(T_m-v)=(1+2z)(1+3z+z^2)B^(m-1)+z(1+z)^(3m)`,
  as the route report itself states. Its `replay.py` omits the factor `(1+2z)` in `Dclaw`. On every one of the 1,749 eligible rows for `m=1,...,80`, the omitted factor changes the reported claw selector difference, but the independently recomputed arm and claw selectors remain strictly negative; the complete selected sums agree with the source table and are all negative. Revised claim: for this family and this exact finite range, every eligible lower-region rank has both leaf orbits favorable and a strictly negative complete selected sum, as independently recomputed from the graph-derived polynomials. The route's reported claw-difference entries are not reliable evidence for their exact values.
- **C4-T5-TM-ALL-OPEN — retained.** The derivative identity is a valid coefficient identity, but it neither proves the fixed-selector hypotheses for all `m` nor yields the required uniform coefficient comparison. No all-parameter `T_m` sign proof or refutation is provided. This is a statement about the route's proof gap, not a verdict on the infinite-family assertion.
  Algebra check: differentiating `P_m=(1+2z)B^m+zL^(3m+1)` gives `P_m' = 2B^m + m(1+2z)B^(m-1)B' + L^(3m+1) +(3m+1)zL^(3m)`. Since `B' - 4 = 3z(2+z)`, subtracting the three terms displayed in the route identity yields exactly `Q_m=(3m+1)zL^(3m)+3mz(2+z)(1+2z)B^(m-1)`. The selector caveat remains: this all-leaf polynomial agrees with the selected marked polynomial only if both strict orbit tests pass.

## Independent checks

I derived the root-split and component-product polynomials independently from the labeled tree recipe and used exact integer convolution for all `m=1,...,80`. I recomputed `alpha`, the first strict negative difference `x` through terminal zero extension, every eligible `p` satisfying `x+2<=p<=alpha` and `3p<2alpha+1`, both deletion-based selector differences, and the complete sum with each of the `3m` claw leaves counted separately. The audit covers 1,749 eligible rows: both selectors are favorable in every row, and all 1,749 complete sums are strictly negative.

As an independent graph-level check, I reconstructed all edges and original degree-one vertices and counted independent subsets literally for `m=1,2,3` (orders 7, 11, 15). The full polynomial, arm and claw one-leaf-deletion polynomials, and both `q=I(H)-I(R)` marked differences match the derived formulas. The support and closed-neighborhood deletions use the original graph; the three claw leaves in each star remain separate tags. At `m=3,p=7`, the corrected claw selector difference is `-110` (not the source replay's `-56`); the arm difference is `-141`, the arm term is `-42`, one claw term is `-125`, and the full sum is `-1167`.

The source replay was executed only from the scratch copy `source-replay.py`. Comparing its 1,749 rows against the independent computation finds 1,749 incorrect claw-difference entries, zero selector-flag changes, and zero complete-sum changes. Thus the finite conclusion survives, but the replay does not verify its claimed exact claw differences. The audit and its compact results are in `audit.py` and `audit-evidence.json`; the copied producer replay output is preserved in `source-replay-evidence.json` for comparison.

## Limits

This is a bounded result on one infinite family, not a census of ordinary trees. It proves nothing for `m>80`, does not prove either selector universally, and supplies no proof of the all-parameter family sign or the primary lower-region aggregate. No external theorem was used. All statuses below are proposed worker-only dispositions.
