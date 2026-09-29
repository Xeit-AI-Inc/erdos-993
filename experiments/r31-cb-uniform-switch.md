# r31 — A Switch-Using Hall Certificate on an Infinite Tree Family

Chartered by Ashton on 2026-09-27 from the Code-successor prompt of the 2026-09-27 joint assessment. r30 had reduced the lower-region
favorable-leaf aggregate to a weighted Hall condition (HALL) on a transport network — sources the independent `(p+1)`-sets, targets the
independent `p`-sets, arcs a single deletion or a two-for-one switch, weights counting ACTIVE tags — and had certified (HALL) at fifteen
switch-necessary rows by exact certificates, but not on any infinite family where switch arcs are load-bearing. Its successor
recommendation named the smallest uniform object: the top sector-deficient rank `p* = (16m+4)/3` of the caterpillar-broom trees
`CB(8,m)` (a path `r–s–v`, `m` chokes on `r`, eight supports per choke, one private leaf per support).

Internal run `erdos-993-cb-uniform-switch-dre-2026-09-27`: 9 routes / 18 cross-orientation critics / 3 isolated adjudicators / 1 neutral
synthesis / governed Lean awards / isolated second reads before every registration (routes Claude Sonnet 5 high; critics Claude Opus 5.5
medium; adjudicators, synthesis, formalizers, reviewers and readers Claude Opus 5.5 high; independent checkpoint analyses Claude Fable
5.1 high; controller Claude Opus 5.5). decisive event (a) at Cycle 4 of the six-cycle ceiling — Tier 1 formally verified at full scope (award C4-LA1); the run ended at that Stage 7 close Terminal manifest `d2e90c374b4b3ca389c571f8ebc9ae6af26b365efef7a7f5efefd59a8984d9be`; controller review
[`CONTROLLER-REVIEW-R31.md`](../runs/erdos-993-cb-uniform-switch-dre-2026-09-27/CONTROLLER-REVIEW-R31.md).

## Outcome

For every integer `m ≥ 107` with `m ≡ 2 (mod 3)`, the rank `p* = (16m+4)/3` of the tree `CB(8,m)` is eligible under the actual first-descent definition, and the literal active-tag weighted deletion/two-for-one transport network at `p*`, with the favorable-leaf selector derived on the tree, satisfies the weighted Hall condition — a family theorem formally verified in Lean 4 (Mathlib pinned; axioms `propext`, `Classical.choice`, `Quot.sound`) as award C4-LA1 of run r31, at one rank per tree, on this one family only, and the first infinite Hall family in this programme's record whose certificate carries load-bearing switch arcs; full (HALL), the aggregate keys, TREE, FOREST, TRANSFER and Erdős #993 remain OPEN. By composition with r30's formally verified FLOW ⇒ SIGN award, `S(CB(8,m), p*) ≤ 0` on these rows only; no status transfers to any aggregate.

8 governed Lean packages closed `formally_verified`: `r31-c1-la1-cb8-sector-template-feasible` (`E993Transport.cb8_topRank_sectorTemplate_feasible` — E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107 (new; VERIFIED formally_verified)); `r31-c1-la2-cb8-definition-layer` (`E993Transport.cb8_topRank_of_descent_and_flow` — ledger record R31-C1-LA2 (the CB(8,m) layer and the terminal reduction; no key)); `r31-c1-la3-two-binomial-descent` (`E993Transport.cb8_block_descent_topRank` — E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-1-PLUS-X-TO-8J-TIMES-1-PLUS-2X-TO-8M-MINUS-8J-PLUS-1-COEFFICIENTS-STRICTLY-DESCEND-AT-INDEX-16M-MINUS-2-OVER-3-MINUS-J-FOR-5-LE-J-LE-M (new; VERIFIED formally_verified)); `r31-c2-la1-cb8-parent-descent-and-eligibility` (`E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3` — E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE (new; VERIFIED formally_verified)); `r31-c2-la2-cb8-leaf-deletion-closed-forms-descent` (`E993Transport.cb8_leafDeletion_closedForms_descent_topRank` — formal closed-form clause (scope note) on E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3); `r31-c2-la3-cb8-favorable-leaves-eq-leaf-set` (`E993Transport.cb8_favorableLeaves_eq_leafSet_topRank` — formal graph-level clause (scope note) on E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3); `r31-c3-la1-cb8-e1-clone-transport` (`E993Transport.cb8_E1_cloneTransport_topRank` — formal clone-level clause (scope note) on E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL); `r31-c4-la1-cb8-top-rank-eligible-and-weighted-hall` (`E993Transport.cb8_topRank_eligible_and_weightedHall` — E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL (new; VERIFIED formally_verified; TIER 1, decisive event (a))).

**How it was built.** Cycle 1 formalized the closed-form choke-local sector allocation (Out ≥ 1, In ≤ 1, switch and residual capacity)
on the whole class, the `CB(8,m)` layer and a block coefficient descent. Cycle 2 proved eligibility on the literal tree in Lean (the
parent descent, with a degree-50 polynomial positivity certificate kernel-checked) and that every leaf is favorable at `p*`, both
Darroch/Newton-free. Cycle 3 formalized the E1 deletion transport at the level of the clone product. The independent checkpoint then
recommended freezing the remaining conjunct as exact Lean statements; the Cycle 4 gate froze twenty leaf statements (the literal up-cover
counts, the E1 spec on `cbGraph m`, the sector flow's Out/In bridges and switch preimages, the weight formula, the per-class composition,
weighted Hall ⇒ flow). Routes and critics closed every one; two adjudicator merges covered all twenty; the terminal award integrated them
on 627 byte-identical, receipt-bound carries. Six isolated second reads re-read the underlying mathematics, all concordant.

**Fences.** One rank per tree; `d = 8`; the class `m ≥ 107`, `m ≡ 2 (mod 3)` only. (HALL) at full scope, the primary aggregate,
`E993-BETA-AGG`, FOREST, TREE, TRANSFER and Erdős #993 stay open; nothing transfers. The registry holds 521 identities (CONDITIONAL 26, OPEN 57, REFUTED 104, VERIFIED 334).

**Successor recommended** (terminal checkpoint): the residue-0 sibling `CB(8,m)`, `m ≡ 0 (mod 3)`, at `⌊(16m+4)/3⌋` — the same switch-using mechanism with a new closed-form per-state sector table and a new eligibility certificate; the smallest warm-up is the deletion-only lemma pair at `p* + 1` on this class.
