# r15-beta-descent

Exported from the sealed r15 (β)-condition run (closed 2026-09-06; summary at
[`experiments/r15-beta-condition.md`](../../../experiments/r15-beta-condition.md); verification record at
[`evidence/verification-2026-09-06-r15-r16.md`](../../../evidence/verification-2026-09-06-r15-r16.md)).

Toolchain pin: Lean 4.32.2 (f3b06c70), Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`. Every checked declaration
within `[propext, Classical.choice, Quot.sound]`; sorry-free; sources
byte-identical to gated artifacts (vendored dependencies cross-verified
against published bytes; full tables in
[`R15R16-ASSEMBLY-RECEIPTS.md`](../R15R16-ASSEMBLY-RECEIPTS.md)).

## What this package proves

The six governed r15 auxiliaries (55 checked declarations with their
dependency chains): the (β) normalization pair — `beta_gap_eq_of_guard`
(the exact identity `b_v(p) − Bgen_s(p−1) = g_p − g_{p−1}` under its
guard) and its inequality equivalence — plus the C13 deletion-graph count,
a scoped acyclicity lemma, the support-degree-2 gap reduction, and the
component-extension bound `Δ_c(T) ≤ 0 ⟹ 1 ≤ c ∧ m ≤ 3c−2`.

## What it does not prove, stated on its face

- **(β) is neither proved nor refuted.** These are auxiliary-scope
  reductions and identities; support-degree 1 is closed by equality and
  degree 2 through `p ≤ 6` in the source run's record, degree ≥ 3 and
  `p ≥ 7` remain open. No headline obligation moves.
- One disclosed import-line repair during packaging (diffed in the
  receipts); all theorem-bearing content byte-identical.
