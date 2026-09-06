# r16-integration

Exported from the sealed r16 identification-constructor run (closed 2026-09-06; summary at
[`experiments/r16-identification-constructor.md`](../../../experiments/r16-identification-constructor.md); verification record at
[`evidence/verification-2026-09-06-r15-r16.md`](../../../evidence/verification-2026-09-06-r15-r16.md)).

Toolchain pin: Lean 4.32.2 (f3b06c70), Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`. Every checked declaration
within `[propext, Classical.choice, Quot.sound]`; sorry-free; sources
byte-identical to gated artifacts (vendored dependencies cross-verified
against published bytes; full tables in
[`R15R16-ASSEMBLY-RECEIPTS.md`](../R15R16-ASSEMBLY-RECEIPTS.md)).

## What this package proves

**The integration** (99 checked declarations):
`G1wide_closure_of_constructed_identification` and
`ambientTargetDeg2_of_KL_KSCOPE_HG2wide` — the r14 `G1wide` conclusion
with the identification premise DISCHARGED BY CONSTRUCTION, premise set
**exactly {Premise K, K-SCOPE}**, wired against the published r14 modules
byte-identically.

## What it does not prove, stated on its face

- The conditional face is undetachable: Premise K (the cited external
  ≤25 log-concavity computation, never kernel-imported) and K-SCOPE are
  live hypotheses of every consuming statement.
- **`AmbientTargetDeg2` is NOT proved**: the open obligation is exactly
  `HG2` on `G2 ∧ |U| ≥ 2p−2`. No headline target moves; nothing is
  `formally_verified`.
