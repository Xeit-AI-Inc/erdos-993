# C1-F6 bounded search: rooted path-arm trees

## Result

I found no eligible tree with positive complete selected aggregate. This is a bounded search result only; the lower-region primary remains unresolved. The search does not replace the complete sum by positive local terms.

## Exact family and finite sample

The systematic family consists of ordinary trees formed by attaching 2 through 6 internally disjoint paths to one common root, with each arm length in 1 through 5. Arms are sorted to remove permutations, so the enumerated 456 arm multisets represent every spider in this parameter box. Exact tree-DP independence polynomials gave 53 rank rows satisfying both `x+2 <= p` and `3p < 2a+1`; all 53 complete selected sums were nonpositive. The greatest sum was `-230`, for arms `(1,3,3,3,3)`, with `(a,x,p)=(9,4,6)` and `18 < 19`.

For that tree the edge set is

`[(0,1),(0,2),(0,5),(0,8),(0,11),(2,3),(3,4),(5,6),(6,7),(8,9),(9,10),(11,12),(12,13)]`. Its full independence polynomial is `[1,14,78,226,371,355,202,70,13,1]`. Its original leaves are `1,4,7,10,13`; deleting each leaf gives selector values `Delta_6(T-v)=(-46,-67,-67,-67,-67)`, so all five leaves belong to the fixed selected set. The complete summands in that order are `(-86,-36,-36,-36,-36)`, giving `S=-230`. Each same-support leaf tag is counted separately.

A second bounded probe sampled 220 uniformly seeded labeled Prüfer sequences at each order `18,22,26,30,34,40,48,56`, using seed `9930601`. This generated 1,760 trees and 2,022 eligible rank rows; none had positive full aggregate. The largest sampled aggregate was `-2562` at order 18 with `(a,x,p)=(12,6,8)` and 8 favorable leaves. The exact edge list, coefficient vector, favorable tags, and individual summands are recorded in the replay output.

Both searches compute `x` using the first strict negative difference through rank `alpha`, including the terminal zero-extension difference. All checks use exact integer arithmetic, the original-tree leaf/support operations, and the entire selector-defined sum. The replay script imports the common pinned `ordinary_tree.py` helper for graph and tree-DP operations and explicitly implements the corrected descent scan.

## Failed bridge

Path-arm attachment gives a tractable cover/product family, but within this bounded range it does not create the proposed selector instability: every best spider row has only negative selected summands, and the sampled arbitrary trees likewise give no full-sum reversal. This does not establish that positive and negative selected fibres cannot be redistributed by a larger attachment, nor does it imply a universal sign for any summand. No matching or cover inequality controlling the complete selected sum was obtained.

## Replay and limits

From the repository root, run:

`python3 work/erdos-993-lower-region-compensation-dre-2026-09-25/scratchpad/C1-F6/evidence/replay_search.py`

The output in `evidence/search-results.json` records exact counts and the maximizing aggregate row for each bounded family, including the graph recipe, coefficient vector, guards, selected leaves, and summands. The Prüfer sample is seeded but not exhaustive. The spider family covers only the stated arm-count and arm-length box. These results neither prove nor refute the universal lower-region assertion.
