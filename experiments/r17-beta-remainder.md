# r17 Beta-Remainder Experiment (Codex)

Completed: 2026-09-06 (decisive event; run then paused its own cycle 2 on
registry-drift detection, correctly). Terminal ledger and successor
handoff sealed.

## Charter and outcome — A DECISIVE EVENT

The run chartered the remainder of (β) — the `k_A ≥ 2` condition
inequality — after r15 had closed support-degree 1 by equality and
degree 2 through `p ≤ 6`. Cycle 1 closed with (β) still open. The run
then produced the **exact order-243 counterexample**
`R17-BETA-CE-ORDER243-STAR60`:

- **The tree:** root `y`; one arm `y–s–v` (marked leaf `v`, degree-two
  support `s`); sixty additional children of `y`, each a three-leaf star.
  243 vertices. Closed forms with `P = (1+4x+3x²+x³)⁶⁰`, `Q = (1+x)¹⁸⁰`:
  `I(T) = (1+2x)P + x(1+x)Q`, `I(T−v) = (1+x)P + xQ`,
  `I(T−{v,s}) = P + xQ`, `I(T−N[s]) = P`.
- **The witness:** crossing index 87; at `p = 90`: `K_A = 3 ≥ 2`,
  `a_v(90) < 0` (antecedents hold), and
  `b_v(90) − Bgen_s(89) = +2.935…×10⁵¹ > 0` — the conclusion strictly
  violated, in exact integers.
- **Verification chain:** exact computation, independent reconstruction,
  structural review, neutral adjudication (terminal refutation at exact
  reproducible-counterexample scope), and an **independent end-to-end
  verification by the r18 controller** (independent tree rebuild + DP;
  every stated integer matched).
- **Honest boundary:** the Lean headline was correctly WITHHELD at close
  (formalization prepared, not kernel-verified); the frozen target is
  `Order243.T60_not_BetaTarget : ¬ RTree.BetaTarget`. KERNEL-VERIFIED 2026-09-07 and awarded
  `governed` (controller closeout; independent fidelity review
  PASS-WITH-NOTES; D9 scope caveat on ordinary-tree phrasings):
  `proofs/lean/r17-order243-beta-counterexample`.

**Consequence:** `E993-BETA-TARGET` is REFUTED at universal scope and at
the degree-2 / `p ≥ 7` stratum (registered monotone-safe,
`smallest_witness_order: 243`). The chartered composition
(α) ∧ (β) ⟹ (A) can no longer deliver THEOREM (A); the master ledger's
path section is re-drawn accordingly. This is the program's first genuine
headline-target refutation, and it validates the search-bound doctrine:
every census through order 22 was clean, and the witness lives at 243.
