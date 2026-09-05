# r12-reduction-identities

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

The corrected r12 reduction layer over the governed r11
`CorridorIngredients` chain: **T1**, the combined identity
`a_s(p) = a_v(p) + (b_v(p) − Bgen_s((p:ℤ)−1))` for a leaf `v` with
`support v = s` (an equation), and **T2**, the witnessed-leaf conditional
corollary.

## What it does not prove, stated on its face

- T2 is a hypothesis-conditioned corollary, not (A), not `CMP-A`, not a
  reduction: its hypothesis **fails on 26,082 exhaustively enumerated
  instances at `k_A = 1`** (all known failures; the conclusion survives on
  every one via the leaf's own slack — a bounded observation, evidence of
  nothing).
- The unwitnessed printed variant (any leaf of the support) is a SEPARATE,
  UNPROVED statement not covered by this package.
- No headline obligation moves. Endpoint guards are hypotheses asserted
  nowhere.

Grade under the source run's rubric: `governed`. NOT `formally_verified`.
