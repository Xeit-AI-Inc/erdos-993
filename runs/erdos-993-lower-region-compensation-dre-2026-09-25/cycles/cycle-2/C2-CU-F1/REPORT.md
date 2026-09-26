# C2-CU-F1 critique of C2-F1

## Disposition

**E993-LOWER-REGION-FIRST-ORDER-SHELL — retained_narrowed.** The route's universal assertion remains open. Its bounded result is reproducible and supports the narrower statement below:

> For every ordinary-tree isomorphism class on 16 vertices, at p=7, if x(T)+2<=p and 3p<2alpha(T)+1, the complete original-favorable-leaf sum is strictly negative. Of the 19,320 generated classes, 1,696 pass both guards; all 1,696 have alpha=11, x=5, and S in [-1759,-906].

The finite computation gives no proof for another order or rank, much less the registered universal first-order-shell claim |T|=2p+2.

## Independent audit and replay

I verified every SHA-256 pin in both packets (31 listed files; all matched). The source route's `COMPUTE.py`, `RESULT.json`, and its two pinned dependencies were copied into this scratch directory. `COMPUTE_REPLAY.py` changes only the base/import paths and output filename so replay cannot write sealed evidence. It imports the local byte copies `ordinary_tree_checked_replay.py` and `forest24_replay.py`; source files remain untouched. Replay command: `python3 COMPUTE_REPLAY.py`.

The replay generated 19,320 distinct centroid codes and matched the generator's order-16 free-tree count. The construction covers unicentroid trees by multisets of rooted branches of order at most 7 and bicentroid trees by unordered pairs of rooted half-trees of order 8. The code parser reconstructs these center-rooted encodings as ordinary trees. It checks all generated classes, not just eligible classes.

For each class, the tree-DP polynomial is computed with exact integer coefficients. The first descent scan includes the terminal zero-extended difference at alpha. Eligibility is tested as x+2<=7 and 21<2alpha+1; every eligible row has x=5 and alpha=11, so both guards hold (7<=7 and 21<23). For every original leaf, the selector is the strict test Delta_7(T-v)<0. For selected leaves, the replay separately counts independent subsets on the full tree and each needed original deletion universe, checks both Delta_6 values, and sums each selected leaf once. Repeated supports remain separate tags. The subset replay visits all 2^16 masks per eligible tree and checks the whole-tree polynomial, every leaf decision, every selected summand, and the full sum.

The complete replay output is exactly equal as parsed JSON to the route's sealed `RESULT.json`. It confirms 1,696 eligible rows, no nonnegative sum, maximum -906, and minimum -1,759. The bounded arithmetic, selector scope, original supports and neighborhoods, and multiplicities are internally consistent. The centroid generator and evaluator are pinned common sources; the finite computation depends on trusting their implementation together with the independent subset replay as implemented.

## Proof gap, usefulness, and controls

No argument bridges this one order/rank census to every shell rank. The result cannot resolve the target claim. There is no pointwise-to-global inference or matching/capacity claim in the route, and a positive local term would not by itself refute its full-sum assertion. The listed order-22 and order-60 Hall-deficient standing controls therefore do not contradict this census; they remain warnings against an unproved same-tag transport approach. The separately listed order-252, p=125 shell record is consistent with the target and supplies another bounded datapoint, but I did not replay it and do not rely on it here.

No imported theorem or analytical lemma is claimed. Status remains proposed and worker-only.

## Limitations

- The replay covers only |T|=16 and p=7, with 1,696 eligible isomorphism classes.
- Finite exact enumeration does not prove the universal shell assertion or any other shell rank.
- Generator and evaluator code are source-pinned; this critique is not a formal proof or a separate implementation of the generator.
- The order-252 record was inspected as a permitted control but not replayed.
