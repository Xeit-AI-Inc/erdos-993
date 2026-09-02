/-
R9C3-A — Contracts.lean
The C3 theorem contracts, STATED and never ASSERTED, against the FROZEN
control/DECODER-CONTRACT-C3.yaml (sha256
1f0664b5c761beae2190b408228ecc4b9f24295602d7e04d4885effbc169a452), elements
DC-T1…DC-T7.

THIS IS A NEW C3 FILE, NOT THE C2 FILE.  The C2 deliverable shipped a
`Contracts.lean` byte-identical to C1's and headed `R9C1-D1`; that is a
recorded deviation (C2A-G6, DEVIATIONS.md D-2) and this file supersedes it.
`C2Bundle` is NOT this proposition: `C3Bundle` is WIDER — `EmptyFamilyBoundary`
and `DeltaS1Discharged` are inside the bundle at C3, and no C2 receipt
discharges it.

FILE DISCIPLINE, from the contract's `file_discipline` block and machine-checked
by scripts/statement_diff.py (divergence class F-d):
  * every declaration in this file is a `Prop`-valued DEFINITION
    (`def … : Prop := …`);
  * this file contains no `theorem`, no `lemma`, no `axiom`, no `example`,
    no `instance`, no `sorry`, no `admit`, no `native_decide`;
  * therefore nothing in this file asserts that any contract holds.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
-/
import Definitions

namespace Erdos993
namespace QDecoder
namespace Contracts

open Erdos993.QDecoder

/-- **Representative independence.**

Source of record: `OB-C11-T1-QUOTIENT-DECODER` ("prove representative
independence"), S2 §7, S3 "Quotient and fidelity".

DIRECTION NOTE, carried from the contract: `RawEquiv` is the HYPOTHESIS, so a
COARSER hypothesis gives a STRONGER proposition.  DC-11's guard makes
`RawEquiv` strictly coarser than the C2 build's, so this contract is STRICTLY
STRONGER than the C2-proved one; the C2 proof does not transport and the result
is re-derived. -/
--@@BEGIN DC-T1
def RepIndependence : Prop :=
  ∀ q q' : RawState, RawEquiv q q' → MarkedEquiv q.marked q'.marked
--@@END DC-T1

/-- **`Rec_I` congruence.**

Source of record: `OB-C11-T1-QUOTIENT-DECODER` ("prove … recurrence
congruence"), S2 §6, S3's branchwise equivalence with reindexing `β : I ≃ I'`.

Quantified over ARBITRARY finite index types, empty family included, with a
reindexing between two DIFFERENT index types.  Mixed in direction under the
guard — coarser in both hypothesis and conclusion — so this too is
re-derivation, not transport. -/
--@@BEGIN DC-T2
def RecCongruence : Prop :=
  ∀ (I I' : Type) [Fintype I] [DecidableEq I] [Fintype I'] [DecidableEq I']
    (q : I → RawState) (q' : I' → RawState) (β : I ≃ I'),
    (∀ i : I, RawEquiv (q i) (q' (β i))) → RawEquiv (attachR q) (attachR q')
--@@END DC-T2

/-- **Descent of the decoder** — `OB-C11-T1-QUOTIENT-DECODER`'s `next_test`
"then prove quotient descent".  Existential over a COARSER `Carrier` means
fewer classes, so this is strictly stronger than the C2 statement. -/
--@@BEGIN DC-T3
def DecoderDescends : Prop :=
  ∃ D : Carrier → MarkedQuot,
    ∀ q : RawState,
      D (Quotient.mk stateSetoid q) = Quotient.mk markedSetoid q.marked
--@@END DC-T3

/-- **Descent of `Rec_I`** — quotient-valued attachment (`OB-C10-T1-QUOTIENT`). -/
--@@BEGIN DC-T4
def AttachDescends : Prop :=
  ∀ (I : Type) [Fintype I] [DecidableEq I],
    ∃ A : (I → Carrier) → Carrier,
      ∀ q : I → RawState,
        A (fun i => Quotient.mk stateSetoid (q i))
          = Quotient.mk stateSetoid (attachR q)
--@@END DC-T4

/-- **Empty-family boundary** — S2 §3 "Empty products give (A',B̂',C')=(x,1,0),
the correct one-vertex base state"; S3 "this also covers the empty family,
where 𝓕 = x + y". -/
--@@BEGIN DC-T5
def EmptyFamilyBoundary : Prop :=
  ∀ q : PEmpty → RawState,
    (attachR q).core.sec.U = PX
      ∧ (attachR q).core.sec.V = 1
      ∧ (attachR q).core.sec.W = 0
--@@END DC-T5

/-- **THE REGISTERED FALSIFIER FOR THE DELTA-S1 REPAIR.**

The DELTA-S1 subclass stated positively: two root-marker-free states agreeing
on every field S2's `equiv_Q` compares ARE `RawEquiv`.  FALSE against the C2
built `GenState.Equiv` — the C2 adjudicator's `adj_carrier_separates` witness
pair is exactly a counterexample to it.  TRUE under DC-11 and provable by
construction.  A C3 build that silently reverts the guard CANNOT prove this. -/
--@@BEGIN DC-T6
def DeltaS1Discharged : Prop :=
  ∀ (q q' : RawState) (σ : Fin q.n ≃ Fin q'.n),
    q.core.rootMk = none → q'.core.rootMk = none →
    q.core.cls = q'.core.cls → q.core.sec = q'.core.sec →
    (∀ a, q.core.del a = q'.core.del (σ a)) →
    (∀ a a', q.core.supp a a' = q'.core.supp (σ a) (σ a')) →
    (∀ a, q.core.rootSupp a = q'.core.rootSupp (σ a)) →
    RawEquiv q q'
--@@END DC-T6

/-- The bundle nominated for Cycle 3.  Renamed from `C2Bundle` deliberately and
WIDER. -/
--@@BEGIN DC-T7
def C3Bundle : Prop :=
  RepIndependence ∧ RecCongruence ∧ DecoderDescends ∧ AttachDescends
    ∧ EmptyFamilyBoundary ∧ DeltaS1Discharged
--@@END DC-T7

end Contracts
end QDecoder
end Erdos993
