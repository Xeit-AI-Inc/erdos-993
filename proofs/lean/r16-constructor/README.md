# r16-constructor

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

**The identification constructor at general scope** (88 checked
declarations): `packGeneral_lawful` and `lawIVPrime_components`,
hypothesis-free over all finite vertex sets, with the full law set
(L1–L7 + LAW IV′) and the run's comprehensive check modules. Proven NOT a
shim under the source run's written five-head criterion; seven-leg
elaboration register.

## What it does not prove, stated on its face

The constructor discharges the IDENTIFICATION PREMISE of the r14 G1 line
only. Premise K and K-SCOPE remain live external premises; `HG2` on
`G2 ∧ |U| ≥ 2p−2`, (α), (β), (A), (B), and every headline target are
untouched and open.
