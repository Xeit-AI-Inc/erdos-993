# r14-reduction-perimeter

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

The completed r14 reduction and premise-free perimeter (16 declarations):
the corrected S1-folded reduction of record (completed at the r14 C3 gate
on adversarially re-issued evidence), the S4/S5 closures,
`deficit_location`, the chain lemma, and split-at-p.

## What it does not prove, stated on its face

- The reduction is an IMPLICATION; neither side is asserted.
- Nothing here proves `AmbientTargetDeg2`, (α), (β), (A), (B), or any
  headline target; the consistency row is determined-by-exhibition at
  bounded scope only (exhibits license exactly their existentials).

Grade under the source run's rubric: `RG`. NOT `formally_verified`.
