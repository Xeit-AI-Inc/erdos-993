# C2-CU-F5 critique — C2-F5-P6-SHELL-LP

## Disposition: retained

The single route claim is correct at its stated finite scope. I independently ran the pinned order-14 centroid generator from scratch copies, restricting the runner to order 14. It generated 3,159 distinct free-tree codes. For each code, the generated tree-DP polynomial agreed with the packed generator coefficients through rank 8. The full tree polynomial supplied alpha and the first strict descent, with the terminal coefficient compared against zero; applying `x+2<=6` and the strict guard `18<2alpha+1` selected 240 classes.

For every eligible class I independently counted independent sets by vertex subsets on the original tree and the distinct original-support deletion universes used in the selector and summands. This reproduced all 240 favorable-leaf lists and complete sums. The replayed values match the 240 `(tree_code,S)` records in the route evidence exactly. Their maximum is -222, attained by `U:(((((()))()))((((()))()))())`, with alpha=9, x=4, and five favorable leaves; their minimum is -404. No full aggregate is nonnegative.

The finite LP statement is exact but adds no stronger mathematical result: for nonnegative weights summing to one, the weighted objective is at most -222 because every column is at most -222. A realizable column attains -222, so the bound is sharp. This verifies the LP dual description for the enumerated columns.

The generator uses the standard unique-center split: rooted component multisets for trees with one centroid, and unordered pairs of rooted halves for bicentroidal trees. The recursive rooted multiset construction and the center characterization account for the finite boundary; code uniqueness and the exact 3,159 count were checked in replay. The original selector is evaluated leaf by leaf on `T-v`; the summands use each leaf's original support and original closed neighborhood. The replay retains leaf multiplicity when supports coincide. For p=6, the summand rank is p-1=5, safely within the ordinary rank domain.

This is only the fixed order-14, p=6 slice of `|T|=2p+2`. It proves no statement for other orders or ranks and gives no structural inequality for all shell trees or the primary target. The replay reused the pinned generator, so its independent check concerns arithmetic, selectors, and complete sums rather than an independent implementation of tree-class generation. See `EVIDENCE.json` for exact replay counts and limitations.
