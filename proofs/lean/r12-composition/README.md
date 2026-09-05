# r12-composition

One of four governed Lean packages exported from the sealed r12
Δ-comparison run (closed 2026-09-04; summary at
[`experiments/r12-delta-comparison.md`](../../../experiments/r12-delta-comparison.md);
verification record at
[`evidence/verification-2026-09-05-r12.md`](../../../evidence/verification-2026-09-05-r12.md)).

Toolchain pin: Lean 4.32.2 (f3b06c70), Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`. Every checked declaration
reports axioms exactly `[propext, Classical.choice, Quot.sound]`;
sorry-free; source files byte-identical to the run's gated artifacts
(full digest tables, build transcripts, and axiom outputs in
[`R12-ASSEMBLY-RECEIPTS.md`](../R12-ASSEMBLY-RECEIPTS.md)).

## What this package proves

The composition slate: **if `AlphaTarget` (the `k_A = 1` slack inequality)
and `BetaTarget` (the `k_A ≥ 2` condition inequality) hold, then THEOREM
(A) holds in full** — `adj_TheoremA_of_alpha_beta`, with the supporting
equivalences (`stmtA_leafWitnessed_of_alpha_beta`, `AdjQ`,
`adjQ_iff_TheoremA_unconditional`, `alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one`,
counterexample-form Iffs, `K_A`), plus the r12 `BR-FACT-1` root-stratum
disjoint-union convolution identities.

## What it does not prove, stated on its face

- **`AlphaTarget` and `BetaTarget` are HYPOTHESES — unproved proof
  targets.** No proof of either was delivered or attempted in the source
  run; nothing here asserts (A), (α), or (β). The awards are for the
  LOGICAL RELATIONS only.
- The zero-counterexample search behind the targets (all trees ≤ 21,
  adversarial families, Kadrawi–Levit fixtures) is a bounded zero and is
  evidence of nothing.
- `BR-FACT-1` is formalized at the root stratum (`s = []`) only; the
  general-vertex statement remains computational.
- One import line was repointed during packaging (disclosed with diff in
  the assembly receipts); all theorem-bearing content is byte-identical to
  the gated sources.

Grade under the source run's rubric: `governed`. NOT `formally_verified`.
