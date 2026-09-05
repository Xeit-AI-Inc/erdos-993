# r12-p1-convolution

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

**`P1_NNSeq`** and its supporting lemmas: the convolution of a nonzero
`TRS2` sequence with a weakly unimodal nonnegative finitely-supported
sequence is weakly unimodal, at exact `NNSeq` scope — and the mechanized
content is stronger: the proof consumes only the `Toeplitz2` clause (the
interval-support hypothesis is unused).

## What it does not prove, stated on its face

- Attribution of record: *"the discrete strong-unimodality theorem
  attributed to Keilson–Gerber (1971); statement verified against
  Saumard–Wellner (2014); primary text unconfirmed."* It is never "the
  Keilson–Gerber theorem, verified."
- This is an abstract-sequence lemma. It does not prove TREE, FOREST,
  TRANSFER, a counterexample, or Erdős #993, and closes no headline
  obligation. Universal tree log-concavity remains REFUTED (order 26), so
  no universal-hypothesis use of this lemma is available.

Grade under the source run's rubric: `governed`. NOT `formally_verified`.
