import C5T3Fixture.CBWitness

/-!
# C6-T3 — kernel-`decide` restatement of the `CB(1,2)` fixture

Charge (`control/CYCLE6-ALLOCATION.md` §"C6-T3"): "the kernel-`decide`
restatement of the CB(1,2) fixture where feasible". The sealed C5-T3
`CBWitness.lean` proves `cb12_C2_eq_closed`/`cb12_C1_eq_closed` (and the
supporting `IsLeaf`/`W` facts) via `native_decide` — compiled evaluation,
trusted via the `Lean.ofReduceBool` axiom, NOT kernel-checked. ADJ-T's C5
gate adjudication records that **both C5 critics independently recomputed
these counts without Lean and re-proved both identities with kernel
`decide` (no `native_decide`, no extra axiom)** and recommends "the
successor should restate it that way" (`ADJUDICATION.md`
`R23B-C5-T3-04` row). This file is that restatement, done fresh here
(not copied from either critic's unsealed scratch instrument), against
the same `cb12 : Graph 9` value carried unmutated from the sealed
C5-T3 bytes (`CBWitness.lean` in this folder, copy-out only).

Feasibility check performed before writing this file: `cb12` has 9
vertices, so every predicate below reduces over `Finset (Fin 9)` /
`Finset (Fin 9 × Fin 9)` — powersets of size ≤ `2^9 = 512`, well within
kernel `decide`'s reach without `maxRecDepth`/`maxHeartbeats` surgery
beyond what is set below. This mirrors exactly what both C5 critics
found; it is not a new mathematical result.
-/

namespace R23C5T3Fixture

set_option maxRecDepth 2000 in
set_option maxHeartbeats 800000 in
/-- Kernel-checked restatement of `cb12.IsLeaf 2` (native_decide in the
    sealed file). Axioms: none beyond the three Lean core axioms. -/
theorem cb12_isLeaf_two_decide : cb12.IsLeaf 2 := by decide

set_option maxRecDepth 2000 in
set_option maxHeartbeats 800000 in
theorem cb12_isLeaf_five_decide : cb12.IsLeaf 5 := by decide

set_option maxRecDepth 2000 in
set_option maxHeartbeats 800000 in
theorem cb12_isLeaf_eight_decide : cb12.IsLeaf 8 := by decide

set_option maxRecDepth 2000 in
set_option maxHeartbeats 800000 in
theorem cb12_W_two_decide : cb12.W 2 = {0} := by decide

set_option maxRecDepth 4000 in
set_option maxHeartbeats 1600000 in
/-- Kernel-checked restatement of `cb12_C2_eq_closed`
    (`(cb12.C 2 2).card = 4`), `native_decide`-free. -/
theorem cb12_C2_eq_closed_decide :
    (cb12.C 2 2).card = (2 : ℕ).choose 1 * 2 ^ 1 := by decide

set_option maxRecDepth 4000 in
set_option maxHeartbeats 1600000 in
/-- Kernel-checked restatement of `cb12_C1_eq_closed`
    (`(cb12.C 2 1).card = 1`), `native_decide`-free. -/
theorem cb12_C1_eq_closed_decide :
    (cb12.C 2 1).card = (2 : ℕ).choose 0 * 2 ^ 0 := by decide

set_option maxRecDepth 4000 in
set_option maxHeartbeats 1600000 in
/-- Kernel-checked restatement of the `g_arm > 0` sanity instance at
    `cb12`, `p = 2`. -/
theorem cb12_g_arm_pos_decide :
    (cb12.C 2 1).card < (cb12.C 2 2).card := by decide

end R23C5T3Fixture
