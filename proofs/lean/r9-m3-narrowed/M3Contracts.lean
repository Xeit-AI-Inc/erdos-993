/-
R9C5-B — M3Contracts.lean.  The OB-M3 contracted DEFINITIONS, built against the
FROZEN control/M3-CONTRACT-C5.yaml (sha256
c9f57f8244c1f8e5fc621a2cc9e03794494ac63ec54799810342cba671a6a3be, ten rows,
theorem-contract/v2-closed, M3-04 SPLIT).

SCOPE, per the frozen contract's `file_discipline`: THIS FILE STATES AND NEVER
ASSERTS.  M3-01, M3-02, M3-05 and M3-06 appear here as `def ... : Prop := ...`
and `def ... : A -> Prop := ...`.  There is no axiom, no example, no theorem and
no instance in this file.  M3-03, M3-04a, M3-04b, M3-07, M3-08 and M3-09 are
THEOREM SIGNATURES and belong to Proofs.lean, where a signature that is proved
is proved and a signature that is not proved is not written.

M3-06 IS FROZEN IN THE SCOPED FORM, and this file carries the scoped form.  What
`RootFibreIsClass` receipts is NON-VACUITY, never necessity: R-2.1(b) and
M3-CONTRACT-DISPOSITION.md A-2 struck "minimal" and "no weaker hypothesis
suffices", and this route does not restate them in any wording.  The necessity
content of record is M3-07 and the usability content is M3-08, both proved in
Proofs.lean.

RESTATED, NOT RENOMINATED (frozen contract, `restated_not_renominated`; BT-15).
Every object these four definitions read is a GATED element of
control/DECODER-CONTRACT-C3.yaml (sha256
1f0664b5c761beae2190b408228ecc4b9f24295602d7e04d4885effbc169a452), consumed AS
GATED through the byte-identical copy at lean/Definitions.lean (sha256
bfe43e837af64240b00d36866a19f7837d32dd1f30c95d51b2888f348a585502, the R9C3-A
nominated source the C3 gate governed).  No state field, no index and no
relation primitive is introduced here:

  * DC-07 `GenState`            -- `supp : A -> A -> Bool`, `rootSupp : A -> Bool`
  * DC-09 `GenState.pullback`   -- reindexing covariance
  * DC-11 `GenState.Equiv`      -- both support conjuncts of the repaired relation
  * DC-30 `attachSupp`          -- the attached sharing relation
  * DC-31 `attachRootSupp`      -- S2 section 4's sigma-prime

THE INDEX REQUIREMENT, ENACTED.  Every statement below is typed over the BUILT
index: the structure parameter `A` of `GenState A`, and `AMk q` for attached
states.  `q.iota` occurs nowhere in this file, because it occurs nowhere in any
gated element.

EVERY SPAN BODY BELOW WAS LIFTED FROM THE FROZEN CONTRACT'S OWN BYTES by
scripts/emit_sources.py.  Nothing between a `--@@BEGIN` and its `--@@END` was
typed by this route.  The DIFFER OF RECORD (scripts/differ_of_record.py v2,
sha256 e8b0aa8ebc5a16ccd30a9c1d52535655601392cff57fa3be5139e3cf073858f4) compares
each span's whitespace-collapse against the contract under end-boundary-anchored
exact equality.  This route runs that instrument; it does not author one.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
-/
import Definitions

namespace Erdos993
namespace QDecoder
namespace M3

/-- M3-01.  THE EQUIVALENCE-RELATION CONDITION AS A REQUIREMENT.  `Equivalence`
is the codomain; a bare relation would fail this row at fidelity audit, not at
the proof attempt.  Stated on the GATED DC-07 field `supp`, over the state's own
index `A`.  BYTE-IDENTICAL to the C4 row (4664fcaf...0feaf); not amended. -/
--@@BEGIN M3-01
def SupportSharing {A : Type} (g : GenState A) : Prop := Equivalence (fun a a' : A => g.supp a a' = true)
--@@END M3-01

/-- M3-02.  The root-support datum, read off the GATED DC-07 field `rootSupp`
over the SAME built index `A`, never off an ambient label.  BYTE-IDENTICAL to
the C4 row (21a0e53c...67de); not amended. -/
--@@BEGIN M3-02
def rootSupportFibre {A : Type} (g : GenState A) : A → Prop := fun a => g.rootSupp a = true
--@@END M3-02

/-- M3-06.  `RootFibreIsClass`, FROZEN IN THE SCOPED FORM (R-2.1(b)).  A
condition on the two GATED DC-07 fields over the state's own index: it
introduces no graph witness, no `eta`, no new state field, no new index and no
new relation primitive, so `restated_not_renominated` survives it intact.

WHAT IS NOT CLAIMED, and the route restates the strike rather than the struck
words: this hypothesis is NOT claimed minimal and NOT claimed necessary.  Both
C4-B critics refuted minimality independently, and the C5 contract records the
refutation on this row's own face. -/
--@@BEGIN M3-06
def RootFibreIsClass {A : Type} (g : GenState A) : Prop := ∀ a a', g.rootSupp a = true → (g.supp a a' = true ↔ g.rootSupp a' = true)
--@@END M3-06

/-- M3-05.  The bundle, after `Contracts.C3Bundle`.  Its four conjuncts make all
five gated rows load-bearing: DC-07, DC-09 (conjunct 2), DC-11 (conjunct 1),
DC-30 (conjunct 3), DC-31 (conjunct 4).

AMENDED AT C5: conjunct 3 acquires the SCOPED hypothesis enacted at M3-04a, so
the bundle and the transport lemma state the same thing.  The C4 row
(24623763...c191) is SUPERSEDED, not struck.

STATED, NOT ASSERTED.  Whether this proposition is TRUE is a separate question,
and Proofs.lean answers it. -/
--@@BEGIN M3-05
def M3Contract : Prop := (∀ {A B : Type} (g : GenState A) (h : GenState B), GenState.Equiv g h → (SupportSharing g ↔ SupportSharing h)) ∧ (∀ {A B : Type} (g : GenState A) (σ : B ≃ A), SupportSharing g → SupportSharing (g.pullback σ)) ∧ (∀ (I : Type) [Fintype I] [DecidableEq I] (q : I → RawState), (∀ i, SupportSharing (q i).core) → (Fintype.card I = 1 → ∀ i, RootFibreIsClass (q i).core) → SupportSharing (attach q)) ∧ (∀ (I : Type) [Fintype I] [DecidableEq I] (q : I → RawState) (x : AMk q), rootSupportFibre (attach q) x ↔ ∃ y : PromMk q, x = Sum.inr (Sum.inl y))
--@@END M3-05

end M3
end QDecoder
end Erdos993
