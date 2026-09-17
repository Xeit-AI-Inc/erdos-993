import R23Groundwork.Tree

/-!
# Mandatory controls, `decide`-checked (`SOLUTION-CONTRACT.md` §6)

C1-T6 charge: "a compiling file of the K_{1,3} … CONTROL facts proved by
`decide`/`Decidable` instances where feasible." This file covers exactly two
of the standing controls with genuine, no-`sorry`, no-extra-axiom `decide`
proofs:

1. `K_{1,3}`'s `i`/`Delta` vector and `xOf`, on THIS file's `Graph`/`Tree`
   encoding (independent of, and not read from, `C1-F5`'s adversarial
   control battery or `C1-T2`/`T3`'s evaluators).
2. The `(1,4,3,5,1)` mode-convention trap ("first strict descent" `x` versus
   "first global mode" `m_+` are different objects), formalized directly on
   an integer sequence — no graph needed for this one, it is a claim about
   sequences, not about any particular tree.

The **P30 `hKSCOPE` control is NOT reproduced here** — see the "P30 control:
not attempted" remark below and **C1-T6's** `RETURN.md` finding F-6
(`cycles/cycle-1/stage3/routes/T6/RETURN.md`) for why, stated plainly rather
than silently skipped. (Cross-reference qualified C3-T2 per ADJ-T F-7(c):
the unqualified "`RETURN.md` finding F-6" was ambiguous — in C2-T1's own
`RETURN.md`, F-6 is a different, broadened-scope finding.)
-/

namespace R23
namespace Graph

/-- `K_{1,3}`: center `0`, leaves `1,2,3`. -/
def k13 : Graph 4 where
  edges := {(0,1),(1,0),(0,2),(2,0),(0,3),(3,0)}
  symm := by decide
  irrefl := by decide

/-- `i`-vector of `K_{1,3}`: `(i_0,i_1,i_2,i_3,i_4) = (1,4,3,1,0)`. Matches
    the hand count in `RETURN.md`: `{}`; any single vertex (4); any pair of
    leaves (3, the center conflicts with every leaf); the all-leaves triple
    (1); nothing at rank 4 (the full vertex set has edges). -/
theorem k13_i_vector :
    (k13.i 0, k13.i 1, k13.i 2, k13.i 3, k13.i 4) = (1, 4, 3, 1, 0) := by
  decide

/-- `Delta`-vector of `K_{1,3}`: `(3, -1, -2, -1)`. -/
theorem k13_delta_vector :
    (k13.Delta 0, k13.Delta 1, k13.Delta 2, k13.Delta 3) = (3, -1, -2, -1) := by
  decide

/-- `x(K_{1,3}) = 1` (first strict descent, `Delta_1 = -1 < 0`), on this
    file's bounded-search `xOf` stand-in. -/
theorem k13_xOf : k13.xOf = 1 := by decide

/-! ## Mode-convention trap: `(1,4,3,5,1)` -/

/-- The `SEMANTIC-CONTRACT.md` §6 example sequence. A sequence of `i_k`-like
    values, NOT claimed to be any tree's actual independence sequence — it
    is a minimal witness that "first strict descent" and "first global
    mode" are different notions, full stop. -/
def modeTrapVals : List ℤ := [1, 4, 3, 5, 1]

/-- Consecutive differences, i.e. this sequence's own `Delta_k` analogue. -/
def modeTrapDiffs : List ℤ :=
  (modeTrapVals.zip modeTrapVals.tail).map (fun q => q.2 - q.1)

/-- First strict-descent index: least `k` with `modeTrapDiffs[k] < 0`
    (`List.findIdx` returns the list length, here `4`, if none is found —
    not the case here). -/
def modeTrapFirstStrictDescent : ℕ :=
  modeTrapDiffs.findIdx (fun d => decide (d < 0))

/-- The sequence's global maximum value. -/
def modeTrapMax : ℤ := modeTrapVals.foldl max (modeTrapVals.headI)

/-- First global-mode index: least `k` with `modeTrapVals[k]` equal to the
    global maximum. -/
def modeTrapFirstGlobalMode : ℕ :=
  modeTrapVals.findIdx (fun v => decide (v = modeTrapMax))

/-- `x = 1` (the drop `4 → 3` at index `1`), while `m_+ = 3` (the maximum
    `5` first occurs at index `3`) — so `x ≠ m_+` on this sequence, exactly
    `SEMANTIC-CONTRACT.md` §6's claim that first mode / last mode / first
    strict descent are three different objects (this checks the
    first-mode-vs-first-strict-descent pair of that triple). -/
theorem modeTrap_indices :
    modeTrapFirstStrictDescent = 1 ∧ modeTrapFirstGlobalMode = 3 := by
  decide

theorem modeTrap_x_ne_m_plus :
    modeTrapFirstStrictDescent ≠ modeTrapFirstGlobalMode := by decide

/-! ## P30 control: NOT attempted here (recorded, not silently skipped)

`SOLUTION-CONTRACT.md` §6's P30 witness (`v=0,s=1,g=2`, residual `P26`,
order 30) is used ONLY as a numeric counterexample to the r16 `hKSCOPE`
bound in the cited sources; neither `SOLUTION-CONTRACT.md` nor
`SEMANTIC-CONTRACT.md` (my binding reads) gives P30's edge list, so building
its `Graph 30` value here would require either (a) reading it from an r16/r20
source outside this route's charge and `EXTERNAL-PATH-ALLOWLIST.txt`, which
this route does not do, or (b) guessing a 30-vertex tree, which
`SOLUTION-CONTRACT.md` §2 forbids ("never fill a missing canonical
definition with a guessed replacement"). (LC-11 repair, C2-T1: this
paragraph previously cross-referenced `RETURN.md` finding "F-4" — the
finding actually discussing the P30 non-attempt is **C1-T6's** `RETURN.md`
F-6, `cycles/cycle-1/stage3/routes/T6/RETURN.md`; reference qualified
C3-T2 per ADJ-T F-7(c).) Independently of that gap: at
`n=30`, `r≈10`, this file's `Finset.powersetCard`-based `Ind`/`i` would
enumerate on the order of `C(30,10) ≈ 3.0×10^7` candidate `10`-subsets purely
to evaluate ONE `i_10` value, and the intended check needs several such
values across several deletions — `decide`'s kernel-level `Decidable`
evaluation is not a feasible way to do that (this is exactly the
"where feasible" carve-out in the C1-T6 charge). The P30 numeric evidence
already exists, independently, as exact-integer Python computation in
`control/STAGE0-AUDIT-VERIFICATION-RESULTS.json` (check B) — that is
computation, never Lean-kernel proof, and this file does not duplicate or
re-certify it.
-/

end Graph
end R23
