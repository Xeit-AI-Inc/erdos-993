# r14-forest-dichotomy

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

The r14 forest-corollary dichotomy chain (46 declarations), headlined by
`dichotomy_premise_free` and the FOR-COR-II dichotomy of record: composed
from the governed r12 `P1_NNSeq` machinery, with the premise-free items
((i)/(iii-a)/(iii-b)) at abstract scope and the Premise-K items carrying
their premise as an explicit hypothesis.

## What it does not prove, stated on its face

- **Premise K (the cited Kadrawi–Levit/Radcliffe ≤25 log-concavity
  computation) is an external computational premise, never kernel-imported
  and never upgraded**; every Premise-K statement carries it on its face.
- The floors of record are premise-labelled: 26 / 27 / 52, with "52" the
  floor ONLY for the all-components-unimodal disjunct (`order_ge_52` is a
  pure lower bound).
- FOREST does not move; no headline obligation closes.

Grade under the source run's rubric: `RG` at the recorded scopes. NOT
`formally_verified`.
