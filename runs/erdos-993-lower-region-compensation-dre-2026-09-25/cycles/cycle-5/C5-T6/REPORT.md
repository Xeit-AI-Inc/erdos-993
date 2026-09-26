# C5-T6 search: third-shell six-cover obstruction

## Result

For the ordinary tree with a root joined to six centers, whose pendant-leaf counts are `(3,3,3,3,3,2)`, the center set is a vertex cover of size 6. At `n=24`, `p=10`, this is in the third shell `n=2p+4` and satisfies the lower-region eligibility guards: `x=8`, `alpha=18`, `x+2=10<=p`, and `3p=30<37=2alpha+1`. The full ordinary-tree aggregate is `S=-122805`, with all 17 original leaves selected. Thus this is a concrete obstruction to any proposed third-shell proof that requires `tau(T)>=7` throughout this rank range. It does not refute the primary aggregate; this instance has negative full sum.

The exact edge list, complete independence polynomial, strict selector, each selected leaf's support and summand, and aggregate are in `EVIDENCE.json`. The graph is fully specified there and by the construction above: label the root 0; consecutively label each center and then its 3 or 2 leaves; join each center to the root and to all leaves in its branch.

## Independent exact check

I evaluated this graph with the listed `inputs/ordinary_tree_checked.py` implementation. Its forest dynamic program computes independence polynomials by multiplying the excluded/included subtree recurrences. The selector is evaluated separately on each original leaf-deleted tree using the strict test `Delta_10(T-v)<0`; each summand is evaluated from the two specified induced forests `T-{v,s_v}` and `T-N[s_v]`. The evidence records the full polynomial and all per-leaf outputs, including repeated leaves at the same support as distinct tags. The listed implementation also has an independent brute-force polynomial routine, but I did not run a second evaluator here.

The cover certificate is immediate from the construction: every edge meets one of the six centers. The tree has 23 edges on 24 vertices and is connected by construction. Its computed independence polynomial has degree 18, hence `alpha=18`; its first strict descent is at rank 8. The recorded rank-10 tree difference is `i_11-i_10=-21766`.

## Corrected cover-state identity and gap

For any graph with a vertex cover `C` and independent complement `I=V\\C`, there is the exact identity

`P_G(z) = sum_{A subseteq C, A independent} z^|A| (1+z)^|I\\N(A)|`.

Indeed, an independent set intersects `C` in a unique independent `A`; its remaining vertices are an arbitrary subset of `I` with no neighbor in `A`. For `|C|<=6` this uses at most 64 cover states. This identity applies separately to each induced forest in a leaf summand after replacing `C` by its surviving intersection with that forest. It is an exact compression identity, not a sign estimate: the differences between the two deletion polynomials and the strict leaf selector do not by themselves give a nonpositive sum. I have not proved a uniform low-cover inequality, classified the remaining low-cover trees, or obtained a pointwise sign theorem beyond the finite instance above.

## Scope and limits

This is one exact obstruction to a cover-threshold sufficient method, not an exhaustive search, not an imported literature theorem, and not a resolution of either registered identity. No universal conclusion follows from it. No claim is made about other third-shell ranks, low-cover skeleton completeness, or the primary aggregate beyond this encoded tree.

All 237 source hashes listed in `packets/C5-COMMON.json` matched. The case packet has no case-specific source files or required review claim IDs. The common allocation's T6 lens was used.
