# r18 Abstract Exchange-Lemma Package

Proves `R18C4T3.exchangeLemma_dominationCriterion` — the sorted-domination
criterion in COUNTING FORM at ABSTRACT-SEQUENCE scope — plus the
transcription defs `GovernedDeletionIdentity`, `RemnantClosedForm`,
`BandEligible`, over the vendored r12/r14 source chain.

Build with `lake build R18C4T3`, then `lake build Check`.
Toolchain: Lean 4.32.2; Mathlib pinned at `905b95818eb32af7874a58b427f50c1711a5e96c`.
Axioms within `[propext, Classical.choice, Quot.sound]` at the pin.

SCOPE CAVEATS (binding on consumers, from the r18 C4 gate record — all four
refusal legs): (1) these declarations do NOT formalize the registered
tree-bound Exchange Lemma (`E993-EXCHANGE-LEMMA`), which is strictly
stronger; the registered sub-key is `E993-EXCHANGE-LEMMA-SEQ`. (2) The
carrier is severed: `n : ℕ` is free and no instance antecedents are bound.
(3) The counting-form ⟺ sorted-domination equivalence is kernel-checked by
NO ONE. (4) The deletion-identity theorem at `tCount = 0` has zero
discriminating power over its Σ term (mutant receipts sealed with the
award). Grade: `RG` at this severed scope. This package does not prove
TREE, FOREST, TRANSFER, a counterexample, or Erdős #993.
Source: sealed r18 run `erdos-993-hg2-dre-2026-09-06`, C4-GATE-RECORD §1.
