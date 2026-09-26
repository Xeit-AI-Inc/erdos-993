# C4-CU-T3 independent critique (orientation U)

## Disposition

**Retained** `C4-T3-MATCHING-SECTOR-DELETION-BOUND` exactly at its stated scope: ordinary one-element deletion boundary in the rank-491 level of 736 disjoint two-choice color classes. The claim is an exact combinatorial statement about that sector. The supplied C4 direction identifies this colored family as the matching sector obtained after fixing the central root and arm leaf in `CB(8,92)`; `8*92=736`.

## Independent proof and arithmetic

Represent a level member as a choice of 491 distinct colors and one of two vertices in each chosen color. It has exactly 491 distinct one-element deletion targets. A target of size 490 has at most `2*(736-490)=492` extensions in the rank-491 level: choose one of its 246 unused colors and one of two vertices. For any subfamily `A`, count incidence pairs `(X,Y)` with `X in A` and `Y` a deletion of `X`. The incidence count is `491|A|` and is at most `492|D(A)|`, proving the claimed arbitrary-subfamily inequality without a compression or regularity assumption.

For the full levels the exact sizes are `C(736,491)2^491` and `C(736,490)2^490`. Their ratio (source/target) is `492/491`, so the edge count is tight and the shortfall `source-target` is `source/492`. I independently recomputed both full integers and the shortfall using Python's exact integer binomial coefficient in `audit.py`; all three values agree with the route evidence, `source` is divisible by 492, and the identities `491*source=492*target` and `492*(source-target)=source` hold. Exact outputs are recorded in `EVIDENCE.json`.

## Scope, standing controls, and usefulness

No proof gap was found in the edge-count argument or its arithmetic. It establishes only a deletion-boundary lower bound. The matching-sector source does not count the additional hub-insertion targets, their actual selected-tag capacities, or competition from sources outside this sector. Accordingly the deficit is a necessary accounting amount for deletion-only routing, not a Hall obstruction for the mixed boundary and not a positive term or counterexample for the complete favorable-leaf aggregate.

The route does not claim an independence polynomial, selector membership, a complete original-leaf census, a full tree sum, or an imported theorem. Those primary-claim checks are therefore outside this sector claim. In particular, the exact color-family incidence proof does not by itself establish that the corresponding sources pass the fixed favorable selector in a particular full tree; no such inference is needed for the retained statement. No outside result was used.

## Limitations

- Only ordinary deletions within the specified matching level are analyzed.
- Insertion arcs, selected-tag multiplicity/capacity, and external competing demands remain unbounded here.
- The result neither proves nor refutes the complete selected sum, and it has no universal all-tree conclusion.
