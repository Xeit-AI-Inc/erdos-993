# Critique of C4-T3: matching-sector deletion bound

## Disposition

**retained** — `C4-T3-MATCHING-SECTOR-DELETION-BOUND` is correct in its stated sector-only scope. It is an exact ordinary-deletion boundary bound, not a mixed-boundary result and not evidence for the full favorable-leaf aggregate.

## Independent check

For CB(8,92), the allowed sector description has `8*92 = 736` disjoint two-vertex support-leaf edges. Fixing the central root and arm leaf and stripping them leaves a rank-491 family of choices of 491 distinct colors and one of two vertices in each chosen color. A source has 491 one-vertex deletion incidences. A rank-490 target leaves 246 colors unused, so has at most `2*246 = 492` extensions. For any subfamily `A`, counting incidences from `A` into its deletion union `D(A)` gives

`491 |A| <= 492 |D(A)|`.

For the full rank levels, each rank-490 target has exactly 492 extensions. Their sizes are `binom(736,491) 2^491` and `binom(736,490) 2^490`, with source-to-target ratio `492/491`. Thus `|A|-|D(A)| = |A|/492` at the full level. I recomputed both exact level-size integers, their difference, and divisibility by 492 using integer binomial arithmetic; they match EVIDENCE.json and the source values.

The sector realization and rank are consistent with the allowed CB direction: the active arm is one selected tag, and deletions retaining the two fixed vertices land in the colored rank-490 shadow. The proof itself requires no colored-shadow theorem.

## Limits

The bound counts only ordinary deletions that retain the two fixed vertices. It gives no count or capacity bound for hub-insertion targets, no control of competing demands, and no Hall inequality for the union of both boundary types. It therefore neither proves nor refutes the complete selected-tag sum. No full-tree selector, favorable-leaf set, or positive aggregate is claimed here, and no such conclusion is inferred.
