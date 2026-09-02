/-
R9C3-B — Contracts.lean  (imported closure, elements DC-T1 … DC-T7)

FILE DISCIPLINE (frozen contract, `file_discipline`): this file STATES and never
ASSERTS.  Every declaration is `def … : Prop := …`.  No theorem, lemma, axiom,
example, instance, sorry, admit, native_decide.

This is a NEW file against the frozen contract and carries a C3 header
(C2A-G6's recorded deviation is not repeated).  Route C3-B builds these seven
propositions because D-1 forces them into its population, NOT because it claims
to have proved them: no proof-side declaration for DC-T1…DC-T7 appears anywhere
in this route's package.  `OB-C11-T1-QUOTIENT-DECODER` is Route C3-A's charge
and this route asserts nothing about it.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
-/
import Definitions

namespace Erdos993
namespace QDecoder
namespace Contracts

/-- DC-T1. -/
def RepIndependence : Prop :=
  ∀ q q' : RawState, RawEquiv q q' → MarkedEquiv q.marked q'.marked

/-- DC-T2. -/
def RecCongruence : Prop :=
  ∀ (I I' : Type) [Fintype I] [DecidableEq I] [Fintype I'] [DecidableEq I']
    (q : I → RawState) (q' : I' → RawState) (β : I ≃ I'),
    (∀ i : I, RawEquiv (q i) (q' (β i))) → RawEquiv (attachR q) (attachR q')

/-- DC-T3. -/
def DecoderDescends : Prop :=
  ∃ D : Carrier → MarkedQuot, ∀ q : RawState,
    D (Quotient.mk stateSetoid q) = Quotient.mk markedSetoid q.marked

/-- DC-T4. -/
def AttachDescends : Prop :=
  ∀ (I : Type) [Fintype I] [DecidableEq I],
    ∃ A : (I → Carrier) → Carrier, ∀ q : I → RawState,
      A (fun i => Quotient.mk stateSetoid (q i))
        = Quotient.mk stateSetoid (attachR q)

/-- DC-T5. -/
def EmptyFamilyBoundary : Prop :=
  ∀ q : PEmpty → RawState,
    (attachR q).core.sec.U = PX ∧ (attachR q).core.sec.V = 1
      ∧ (attachR q).core.sec.W = 0

/-- DC-T6.  REGISTERED_FALSIFIER_FOR_THE_REPAIR. -/
def DeltaS1Discharged : Prop :=
  ∀ (q q' : RawState) (σ : Fin q.n ≃ Fin q'.n),
    q.core.rootMk = none → q'.core.rootMk = none →
    q.core.cls = q'.core.cls → q.core.sec = q'.core.sec →
    (∀ a, q.core.del a = q'.core.del (σ a)) →
    (∀ a a', q.core.supp a a' = q'.core.supp (σ a) (σ a')) →
    (∀ a, q.core.rootSupp a = q'.core.rootSupp (σ a)) →
    RawEquiv q q'

/-- DC-T7. -/
def C3Bundle : Prop :=
  RepIndependence ∧ RecCongruence ∧ DecoderDescends ∧ AttachDescends
    ∧ EmptyFamilyBoundary ∧ DeltaS1Discharged

end Contracts
end QDecoder
end Erdos993
