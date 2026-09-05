# r14-ambient-band

One of three governed Lean packages exported from the sealed r14
AmbientTargetDeg2 run (closed 2026-09-05; summary at
[`experiments/r14-ambient-target.md`](../../../experiments/r14-ambient-target.md);
verification record at
[`evidence/verification-2026-09-05-r14.md`](../../../evidence/verification-2026-09-05-r14.md)).

Toolchain pin: Lean 4.32.2 (f3b06c70), Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`. Every checked declaration at
exactly `[propext, Classical.choice, Quot.sound]`; sorry-free; sources
byte-identical to gated artifacts; the r11/r12 dependency chain is
vendored byte-identically (cross-verified against the published
`r12-deg2-reduction` bytes). Full tables in
[`R14-ASSEMBLY-RECEIPTS.md`](../R14-ASSEMBLY-RECEIPTS.md).

## What this package proves

The r14 award slate (13 declarations), headlined by **the band theorem**
`residual_nonpos_of_card_le_band`: `2 ≤ p ∧ |U| ≤ 2p−3 ⟹ D ≤ 0` — no
stratum condition, premise-free, carrying a seven-leg elaboration register
across four parties in the source run — and the adopted successor surface
`ambientTargetDeg2_of_G1wide_G2wide` with its weaker-or-equal bridges.

## What it does not prove, stated on its face

- **`AmbientTargetDeg2` is NOT proved.** The band theorem closes the
  `|U| ≤ 2p−3` band of the target unconditionally; the open obligation is
  exactly `HG2` on `G2 ∧ |U| ≥ 2p−2` (the source run's residue register).
- The `G1wide` side closes only under Premise K + K-SCOPE + the
  identification premise (representational reading); nothing here
  discharges those premises.
- The premise-free order constraint (`n ≥ 2x(T)+3` for any deg-2
  counterexample) narrows a proof obligation, never a search space.
- No headline obligation moves; every zero cited in the lineage is bounded
  evidence and never universal.

Grade under the source run's rubric: `RG` (premise-free items) at the
grades their gate acts record. NOT `formally_verified`.
