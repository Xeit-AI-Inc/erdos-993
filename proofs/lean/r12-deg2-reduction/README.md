# r12-deg2-reduction

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

The r12 terminal-cycle reduction: **(α) restricted to `deg(s) = 2` — the
stratum carrying ≥ 99.3% of every exceptional instance found in the source
run — is equivalent to one open statement, `AmbientTargetDeg2`, about the
single derived forest `T∖N[v]`** (`alphaCounterexampleDeg2_iff` and the
substitution chain). Proved by fence-legal means only: the proof terms
never touch the extension-profile state split, verified by adversarial
term-level trace in the source run.

## What it does not prove, stated on its face

- **`AmbientTargetDeg2` is NOT proved, NOT asserted, and was not
  attempted.** It is the source run's sharpest residue and a successor's
  first target. The award is for the reduction only.
- Nothing here proves (α), (β), (A), (B), TREE, FOREST, TRANSFER, or a
  counterexample; no bounded zero cited anywhere in the lineage is
  universal evidence.

Grade under the source run's rubric: `governed`. NOT `formally_verified`.
