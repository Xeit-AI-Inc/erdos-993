import Erdos993C8U1Base

/-!
# R16C2Base — world-neutral witness and helper layer (r16 Cycle 2, route R16C2-T)

PROTOTYPE (grade `RG` AT BEST after critics and a gate act; nothing here is
`governed`; nothing is ever `formally_verified`).

## Ceiling honesty (undetachable)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open before and after.
`AmbientTargetDeg2`, (α), (β), (A), (B) are targets never asserted. This file
proves nothing about any tree or forest: it defines and analyses closed
abstract `NNSeq` terms and pure-`Finset` helpers. `AdjacentLogConcave` is
never concluded of anything (PREMISE K's slot; never kernel-imported). NO
SHIMS: this module assumes no cross-world correspondence — it is neutral
ground BOTH sealed worlds already import (`Erdos993C8U1Base`), on which each
world proves its own kernel facts. The witness terms `oneVertexSeq` and
`twoPathSeq` are re-authored here under the `R16C2` namespace (the C1
fragment's `R16C1F.oneVertexSeq` is sealed with C1 and is not consumed;
syntactic identity of the order-1 witness with C1's is disclosed on the face
of the route deliverable).

## Invariance

Every definition below is a closed term or a function of its stated
arguments only; no vertex ordering, address convention, or index choice
enters. `single_card_coeff` is the L4-analogue coefficient-extraction lemma
approved FRESH by the C1 adjudication's consume-vs-re-derive ruling §5(a)
(the L4/L6 analogues of the r10 FC-6 lemmas over T-world vertex subsets);
it is world-neutral and so lives here, visible to both worlds.

## Fence check

No computation, `#eval`, `decide`, `native_decide`, search, or sampling.
F1/F2 not approached: no unimodality or log-concavity is CONCLUDED of any
object. Reserved I/A/B zone: not mentioned.
-/

open scoped Classical
noncomputable section

namespace R16C2

open Erdos993C8U1

/-! ## §1 — Coefficient extraction for single-card sums (world-neutral) -/

/-- Coefficient of a finite sum of single-support terms: the number of
indices landing on that exponent. World-neutral algebra; the engine behind
LAW L4 on the T-side and the shape already governing the P-side admission
map. Approved fresh per C1 adjudication ruling §5(a). -/
theorem single_card_coeff {β : Type*} (T : Finset β) (fc : β → ℤ) (k : ℤ) :
    (∑ S ∈ T, AddMonoidAlgebra.single (fc S) (1 : NNRat)).coeff k
      = ((T.filter (fun S => fc S = k)).card : NNRat) := by
  classical
  simp [AddMonoidAlgebra.coeff_sum, Finset.sum_boole]

/-! ## §2 — Pure-Finset helper: the four subsets of a pair -/

/-- Every subset of a two-element set is one of the four obvious ones.
Pure `Finset` combinatorics, world-neutral; used by both world modules to
enumerate independent sets on order-≤2 blocks. -/
theorem subset_pair_cases {α : Type*} [DecidableEq α] {a b : α}
    {S : Finset α} (hS : S ⊆ ({a, b} : Finset α)) :
    S = ∅ ∨ S = {a} ∨ S = {b} ∨ S = ({a, b} : Finset α) := by
  by_cases ha : a ∈ S
  · by_cases hb : b ∈ S
    · refine Or.inr (Or.inr (Or.inr ?_))
      apply Finset.Subset.antisymm hS
      intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx'
      · exact ha
      · rw [Finset.mem_singleton] at hx'
        exact hx' ▸ hb
    · refine Or.inr (Or.inl ?_)
      ext x
      rw [Finset.mem_singleton]
      constructor
      · intro hx
        rcases Finset.mem_insert.mp (hS hx) with rfl | hx'
        · rfl
        · rw [Finset.mem_singleton] at hx'
          exact absurd (hx' ▸ hx) hb
      · rintro rfl
        exact ha
  · by_cases hb : b ∈ S
    · refine Or.inr (Or.inr (Or.inl ?_))
      ext x
      rw [Finset.mem_singleton]
      constructor
      · intro hx
        rcases Finset.mem_insert.mp (hS hx) with rfl | hx'
        · exact absurd hx ha
        · rw [Finset.mem_singleton] at hx'
          exact hx'
      · rintro rfl
        exact hb
    · refine Or.inl ?_
      rw [Finset.eq_empty_iff_forall_notMem]
      intro x hx
      rcases Finset.mem_insert.mp (hS hx) with rfl | hx'
      · exact ha hx
      · rw [Finset.mem_singleton] at hx'
        exact hb (hx' ▸ hx)

/-! ## §3 — The closed abstract witnesses (order-1 and order-2 components) -/

/-- **The shared abstract witness for the order-1 component**: `1 + x`.
Both worlds can see this term because both import the base; neither world's
`RTree` is mentioned. -/
def oneVertexSeq : NNSeq :=
  AddMonoidAlgebra.single (0 : ℤ) (1 : NNRat) + AddMonoidAlgebra.single (1 : ℤ) (1 : NNRat)

/-- **The shared abstract witness for the order-2 (adjacent-pair) component**:
`1 + 2x` — one empty independent set, two singletons, no independent pair. -/
def twoPathSeq : NNSeq :=
  AddMonoidAlgebra.single (0 : ℤ) (1 : NNRat) + AddMonoidAlgebra.single (1 : ℤ) (2 : NNRat)

theorem oneVertexSeq_coeff (k : ℤ) :
    oneVertexSeq.coeff k
      = (if (0 : ℤ) = k then (1 : NNRat) else 0) + (if (1 : ℤ) = k then (1 : NNRat) else 0) := by
  unfold oneVertexSeq
  rw [AddMonoidAlgebra.coeff_add, Finsupp.add_apply, AddMonoidAlgebra.coeff_single,
    AddMonoidAlgebra.coeff_single, Finsupp.single_apply, Finsupp.single_apply]

theorem twoPathSeq_coeff (k : ℤ) :
    twoPathSeq.coeff k
      = (if (0 : ℤ) = k then (1 : NNRat) else 0) + (if (1 : ℤ) = k then (2 : NNRat) else 0) := by
  unfold twoPathSeq
  rw [AddMonoidAlgebra.coeff_add, Finsupp.add_apply, AddMonoidAlgebra.coeff_single,
    AddMonoidAlgebra.coeff_single, Finsupp.single_apply, Finsupp.single_apply]

/-- The square of the order-1 witness, expanded: `(1+x)² = 1 + 2x + x²`.
Pure base algebra; the coefficient source for the W5 non-adjacent-pair
anchors. -/
theorem oneVertexSeq_sq :
    oneVertexSeq * oneVertexSeq
      = AddMonoidAlgebra.single (0 : ℤ) (1 : NNRat)
        + AddMonoidAlgebra.single (1 : ℤ) (2 : NNRat)
        + AddMonoidAlgebra.single (2 : ℤ) (1 : NNRat) := by
  unfold oneVertexSeq
  rw [add_mul, mul_add, mul_add, AddMonoidAlgebra.single_mul_single,
    AddMonoidAlgebra.single_mul_single, AddMonoidAlgebra.single_mul_single,
    AddMonoidAlgebra.single_mul_single, mul_one]
  have e0 : (0 : ℤ) + 0 = 0 := by norm_num
  have e1 : (0 : ℤ) + 1 = 1 := by norm_num
  have e1' : (1 : ℤ) + 0 = 1 := by norm_num
  have e2 : (1 : ℤ) + 1 = 2 := by norm_num
  have e11 : (1 : NNRat) + 1 = 2 := by norm_num
  rw [e0, e1, e1', e2, add_assoc,
    ← add_assoc (AddMonoidAlgebra.single (1 : ℤ) (1 : NNRat))
      (AddMonoidAlgebra.single (1 : ℤ) (1 : NNRat))
      (AddMonoidAlgebra.single (2 : ℤ) (1 : NNRat)),
    ← AddMonoidAlgebra.single_add, e11, ← add_assoc]

theorem oneVertexSeq_sq_coeff (k : ℤ) :
    (oneVertexSeq * oneVertexSeq).coeff k
      = (if (0 : ℤ) = k then (1 : NNRat) else 0)
        + (if (1 : ℤ) = k then (2 : NNRat) else 0)
        + (if (2 : ℤ) = k then (1 : NNRat) else 0) := by
  rw [oneVertexSeq_sq, AddMonoidAlgebra.coeff_add, Finsupp.add_apply,
    AddMonoidAlgebra.coeff_add, Finsupp.add_apply,
    AddMonoidAlgebra.coeff_single, AddMonoidAlgebra.coeff_single,
    AddMonoidAlgebra.coeff_single, Finsupp.single_apply, Finsupp.single_apply,
    Finsupp.single_apply]

/-! ## §4 — Closed data triples for the concrete stratum witnesses

The pack fields stay at BASE TYPES (FC-R16-1's rider), so the SAME closed
terms feed the T-world lawfulness theorems and the P-world LAW IV′ module.
`ordCard` is the frozen `ord C := C.card` binding as a closed function. -/

/-- The frozen `ord` binding, as a closed base-level function. -/
def ordCard : Finset (List ℕ) → ℕ := fun C => C.card

/-- Constant order-1 family map (every block gets the order-1 witness). -/
def fOne : Finset (List ℕ) → NNSeq := fun _ => oneVertexSeq

/-- Constant order-2 family map (every block gets the adjacent-pair witness). -/
def fTwo : Finset (List ℕ) → NNSeq := fun _ => twoPathSeq

/-- σ0 concrete block set: no blocks (empty residual). -/
def sSigma0 : Finset (Finset (List ℕ)) := ∅

/-- σ1 concrete block set: one order-1 block at address `[0,0]`
(the `P₃`-rooted-at-an-end residual of record). -/
def sSigma1 : Finset (Finset (List ℕ)) := {({([0, 0] : List ℕ)} : Finset (List ℕ))}

/-- σ2 concrete block set: two order-1 blocks at `[0,0]` and `[1,0]`
(the two-legged spider residual). -/
def sSigma2 : Finset (Finset (List ℕ)) :=
  {({([0, 0] : List ℕ)} : Finset (List ℕ)), ({([1, 0] : List ℕ)} : Finset (List ℕ))}

/-- σ3 concrete block set: one order-2 block `{[0,0],[0,0,0]}`
(the `P₄`-rooted-at-an-end residual). -/
def sSigma3 : Finset (Finset (List ℕ)) :=
  {({([0, 0] : List ℕ), ([0, 0, 0] : List ℕ)} : Finset (List ℕ))}

end R16C2
