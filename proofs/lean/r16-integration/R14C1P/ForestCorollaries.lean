import Erdos993C8U1Base
import Convolution
import R12C2P.P1

/-!
# R14C1-P — the forest corollaries, with the external computation as a hypothesis

PROTOTYPE (grade `RG` at best, and only after two critic legs and a controller
gate act; NOTHING here is `governed` and nothing is `formally_verified`).

Ceiling honesty: TREE / FOREST / TRANSFER / COUNTEREXAMPLE are open before and
after this file. `AmbientTargetDeg2`, (α), (β), (A), (B) are not mentioned and
not touched. No statement below asserts that any forest is unimodal
unconditionally: every one is a conditional whose hypotheses include either
`Unimodal` of a designated factor, or the Kadrawi–Levit ≤ 25 EXTERNAL
COMPUTATIONAL PREMISE carried as the explicit Lean hypothesis `hKL`. That
hypothesis is never discharged in this file and may never be discharged inside
the kernel; it is a citation, not a theorem.

Consumed, never re-derived:
* `Erdos993C8U1Base.lean` (r10 governed, sha256 `a45c61b8…`) — `NNSeq`,
  `PositiveIntervalSupport`, `AdjacentLogConcave`, `Toeplitz2`, `TRS2`,
  `trs2_iff_adjacentLogConcave`.
* `Convolution.lean` (r10 governed transplant of the r8 governed source,
  sha256 `4795a926…`) — `delta0`, `trs2_convolutionClosure`.
* `R12C2P/P1.lean` (r12 route module, sha256 `0ccfe84d…`) — `Unimodal`,
  `P1_NNSeq`, `witnessA`, `witnessA_not_TRS2`.
* `one_eq_delta0`, `trs2_one`, `trs2_finset_prod` below are transplanted
  CHARACTER-FOR-CHARACTER from the r10 governed `Forest.lean`
  (`erdos-993-trs2-bt-closure-dre-2026-09-02/cycles/cycle-4/evidence/R10C4-CA/lean/Forest.lean`,
  lines 157–179). They are reproduced here rather than imported only because
  `Forest.lean` also imports the tree-side `ExtensionProfile`/`NNSeqAdmission`
  stack, which this abstract module does not need. This is a transplant with
  disclosed provenance, not an independent re-derivation.

RESERVED ZONE: nothing below mentions `Bgen`, the I/A/B state split, its
subtraction, or any inequality across it. No row of `REJECTED-MECHANISMS.md`
is approached: every object is a finite product of abstract `NNSeq` terms.

INVARIANCE (every new object): each declaration is a function of its stated
arguments alone — the index type `ι`, the finite index set `s`, the component
map `f : ι → NNSeq`, the order map `ord : ι → ℕ`, and the hypothesis terms.
No vertex ordering, no component ordering, no address convention, and no
choice of unimodality witness `m` enters any statement; `core s f` depends on
`s` and `f` only, and the conclusions are invariant under any relabelling of
`ι` that preserves `f` and `ord`.
-/

open Erdos993C8U1
open scoped Classical
noncomputable section

namespace R14C1P

/-! ## Transplanted verbatim from the r10 governed `Forest.lean` (157–179) -/

theorem one_eq_delta0 : (1 : NNSeq) = delta0 := AddMonoidAlgebra.one_def

theorem trs2_one : TRS2 (1 : NNSeq) := by
  rw [one_eq_delta0]; exact trs2_convolutionClosure.2.1

theorem trs2_finset_prod {ι : Type*} (s : Finset ι) (f : ι → NNSeq)
    (hf : ∀ i ∈ s, TRS2 (f i)) : TRS2 (∏ i ∈ s, f i) := by
  classical
  induction s using Finset.induction with
  | empty => simpa using trs2_one
  | @insert a s' hx ih =>
    rw [Finset.prod_insert hx]
    exact trs2_convolutionClosure.2.2 (f a) (∏ i ∈ s', f i)
      (hf a (Finset.mem_insert_self a s'))
      (ih (fun i hi => hf i (Finset.mem_insert_of_mem hi)))

/-! ## The empty product is unimodal, and every `TRS2` term is unimodal -/

/-- Coefficients of the multiplicative unit of `NNSeq`. -/
theorem one_coeff (k : ℤ) : (1 : NNSeq).coeff k = if k = 0 then 1 else 0 := by
  rw [AddMonoidAlgebra.one_def, AddMonoidAlgebra.coeff_single, Finsupp.single_apply]
  by_cases h : k = 0
  · simp [h]
  · simp [h, Ne.symm h]

/-- The empty forest's sequence `(1)` is unimodal. Needed as the base case of
the core reduction: a forest with no non-log-concave component has empty
core. -/
theorem Unimodal.one : Unimodal (1 : NNSeq) := by
  refine ⟨0, ?_, ?_⟩
  · intro i hi
    rw [one_coeff i, one_coeff (i + 1)]
    have h1 : i ≠ 0 := by omega
    simp [h1]
  · intro i hi
    rw [one_coeff i, one_coeff (i + 1)]
    have h1 : i + 1 ≠ 0 := by omega
    simp [h1]

/-- `TRS2 ⟹ Unimodal`, by `P1_NNSeq` against the unit. -/
theorem unimodal_of_TRS2 (a : NNSeq) (ha : TRS2 a) : Unimodal a := by
  have h := P1_NNSeq a 1 ha Unimodal.one
  simpa using h

/-! ## The non-`TRS2` core, and the core reduction -/

variable {ι : Type*}

/-- The **core** of a forest presented as a finite index set of components:
the sub-family of components whose sequence is not `TRS2`. On tree
independence sequences (positive interval support, nonzero, both governed
unconditionally at r10) `¬ TRS2` is exactly `¬ AdjacentLogConcave`; see
`nonTRS2_iff_nonAdjacentLogConcave`. -/
def core (s : Finset ι) (f : ι → NNSeq) : Finset ι :=
  s.filter (fun i => ¬ TRS2 (f i))

theorem mem_core {s : Finset ι} {f : ι → NNSeq} {j : ι} :
    j ∈ core s f ↔ j ∈ s ∧ ¬ TRS2 (f j) := by
  simp [core, Finset.mem_filter]

/-- **The core reduction.** Unimodality of the core's product implies
unimodality of the whole product. No external premise is used. -/
theorem core_reduction (s : Finset ι) (f : ι → NNSeq)
    (h : Unimodal (∏ j ∈ core s f, f j)) : Unimodal (∏ j ∈ s, f j) := by
  classical
  have hsplit :
      (∏ j ∈ s.filter (fun i => TRS2 (f i)), f j) * (∏ j ∈ core s f, f j)
        = ∏ j ∈ s, f j :=
    Finset.prod_filter_mul_prod_filter_not s (fun i => TRS2 (f i)) f
  rw [← hsplit]
  exact P1_NNSeq _ _
    (trs2_finset_prod _ _ (fun j hj => (Finset.mem_filter.mp hj).2)) h

/-! ## (P-i) — at most one non-log-concave component

NO external premise. This is a pure composition of the governed
`trs2_convolutionClosure` with the r12 `P1_NNSeq`. -/

theorem forest_unimodal_of_at_most_one_nonTRS2
    (s : Finset ι) (f : ι → NNSeq) (i₀ : ι)
    (hrest : ∀ j ∈ s, j ≠ i₀ → TRS2 (f j))
    (hb : Unimodal (f i₀)) :
    Unimodal (∏ j ∈ s, f j) := by
  classical
  apply core_reduction
  have hsub : core s f ⊆ ({i₀} : Finset ι) := by
    intro j hj
    rw [mem_core] at hj
    rw [Finset.mem_singleton]
    by_contra hne
    exact hj.2 (hrest j hj.1 hne)
  rcases Finset.subset_singleton_iff.mp hsub with h | h
  · rw [h, Finset.prod_empty]; exact Unimodal.one
  · rw [h, Finset.prod_singleton]; exact hb

/-! ## (P-iii) — the reshaped TRANSFER, made exact

NO external premise. The universal statement over all finite families is
EQUIVALENT to its restriction to families all of whose members are non-`TRS2`
(the forward direction is the trivial restriction; this is the substantive
converse). -/

theorem transfer_reshaped (f : ι → NNSeq)
    (hcore : ∀ s : Finset ι, (∀ j ∈ s, ¬ TRS2 (f j)) → Unimodal (∏ j ∈ s, f j)) :
    ∀ s : Finset ι, Unimodal (∏ j ∈ s, f j) := by
  intro s
  exact core_reduction s f (hcore (core s f) (fun j hj => (mem_core.mp hj).2))

/-! ## (P-ii) — the counterexample dichotomy and the order bound

`hKL` IS THE EXTERNAL COMPUTATIONAL PREMISE (Kadrawi–Levit, arXiv:2305.01784:
every tree of order ≤ 25 has a log-concave independence sequence), carried as
an explicit hypothesis and never discharged. -/

theorem forest_counterexample_dichotomy
    (s : Finset ι) (f : ι → NNSeq) (ord : ι → ℕ)
    (hKL : ∀ j ∈ s, ord j ≤ 25 → TRS2 (f j))
    (hne : ¬ Unimodal (∏ j ∈ s, f j)) :
    (∃ j ∈ s, ¬ Unimodal (f j)) ∨
    (∃ j₁ ∈ s, ∃ j₂ ∈ s, j₁ ≠ j₂ ∧ ¬ TRS2 (f j₁) ∧ ¬ TRS2 (f j₂) ∧
      26 ≤ ord j₁ ∧ 26 ≤ ord j₂) := by
  classical
  by_cases hcex : ∃ j ∈ s, ¬ Unimodal (f j)
  · exact Or.inl hcex
  · right
    push Not at hcex
    by_cases hcard : 1 < (core s f).card
    · obtain ⟨j₁, hj₁, j₂, hj₂, hne12⟩ := Finset.one_lt_card.mp hcard
      rw [mem_core] at hj₁ hj₂
      refine ⟨j₁, hj₁.1, j₂, hj₂.1, hne12, hj₁.2, hj₂.2, ?_, ?_⟩
      · by_contra hle
        exact hj₁.2 (hKL j₁ hj₁.1 (by omega))
      · by_contra hle
        exact hj₂.2 (hKL j₂ hj₂.1 (by omega))
    · exfalso
      apply hne
      apply core_reduction
      push Not at hcard
      rcases (core s f).eq_empty_or_nonempty with hemp | ⟨i₀, hi₀⟩
      · rw [hemp, Finset.prod_empty]; exact Unimodal.one
      · have hsing : core s f = {i₀} :=
          Finset.eq_singleton_iff_unique_mem.mpr
            ⟨hi₀, fun x hx => Finset.card_le_one.mp hcard x hx i₀ hi₀⟩
        rw [hsing, Finset.prod_singleton]
        exact hcex i₀ (mem_core.mp hi₀).1

theorem forest_counterexample_order_ge_52
    (s : Finset ι) (f : ι → NNSeq) (ord : ι → ℕ)
    (hKL : ∀ j ∈ s, ord j ≤ 25 → TRS2 (f j))
    (hall : ∀ j ∈ s, Unimodal (f j))
    (hne : ¬ Unimodal (∏ j ∈ s, f j)) :
    52 ≤ ∑ j ∈ s, ord j := by
  classical
  rcases forest_counterexample_dichotomy s f ord hKL hne with ⟨j, hj, hu⟩ | h
  · exact absurd (hall j hj) hu
  · obtain ⟨j₁, hj₁, j₂, hj₂, hne12, _, _, ho₁, ho₂⟩ := h
    have hsub : ({j₁, j₂} : Finset ι) ⊆ s := by
      intro x hx
      rcases Finset.mem_insert.mp hx with h | h
      · rw [h]; exact hj₁
      · rw [Finset.mem_singleton.mp h]; exact hj₂
    have hpair : ∑ j ∈ ({j₁, j₂} : Finset ι), ord j = ord j₁ + ord j₂ :=
      Finset.sum_pair hne12
    have hle : ∑ j ∈ ({j₁, j₂} : Finset ι), ord j ≤ ∑ j ∈ s, ord j :=
      Finset.sum_le_sum_of_subset hsub
    omega

/-! ## The external premise in its log-concave form

On sequences that are nonzero with positive interval support — which every
tree independence sequence is, unconditionally, by the governed r10
`RTree.indepNNSeq_ne_zero` / `RTree.indepNNSeq_positiveIntervalSupport` — the
`TRS2` form and the adjacent-log-concavity form of the premise coincide, by
the governed `trs2_iff_adjacentLogConcave`. This is the form in which the
Kadrawi–Levit citation is actually stated. -/

theorem nonTRS2_iff_nonAdjacentLogConcave (a : NNSeq) (h0 : a ≠ 0)
    (hpis : PositiveIntervalSupport a) :
    ¬ TRS2 a ↔ ¬ AdjacentLogConcave a :=
  not_congr (trs2_iff_adjacentLogConcave a h0 hpis)

theorem forest_counterexample_order_ge_52_LC
    (s : Finset ι) (f : ι → NNSeq) (ord : ι → ℕ)
    (h0 : ∀ j ∈ s, f j ≠ 0)
    (hpis : ∀ j ∈ s, PositiveIntervalSupport (f j))
    (hKL : ∀ j ∈ s, ord j ≤ 25 → AdjacentLogConcave (f j))
    (hall : ∀ j ∈ s, Unimodal (f j))
    (hne : ¬ Unimodal (∏ j ∈ s, f j)) :
    52 ≤ ∑ j ∈ s, ord j := by
  refine forest_counterexample_order_ge_52 s f ord ?_ hall hne
  intro j hj hle
  exact (trs2_iff_adjacentLogConcave (f j) (h0 j hj) (hpis j hj)).mpr (hKL j hj hle)

/-! ## Counterexample gate against the FC-R12-4 witness `(1,0,0,1)`

`control/WITNESS-REGISTRY.md` row 7 / `FC-R12-4`'s load-bearing gate hit. The
witness is EXCLUDED from every statement above, twice over and independently:

* it is not `TRS2` (`witnessA_not_TRS2`, r12, machine-checked), so it can never
  instantiate `hrest`, `hKL`, or the `TRS2` side of the core split; and
* it is not `Unimodal` (`witnessA_not_Unimodal`, below, machine-checked here),
  so it can never instantiate `hb` in (P-i) or `hall` in (P-ii) either.

Both exclusions are structural, not numerical: the witness has a zero gap
between two positive coefficients, which no independence sequence of any graph
has (subsets of independent sets are independent, so the support is an
interval `[0, α]`). -/

theorem witnessA_coeff2 : witnessA.coeff 2 = 0 := by
  rw [witnessA_coeff, AddMonoidAlgebra.coeff_single, AddMonoidAlgebra.coeff_single]; simp

theorem witnessA_not_Unimodal : ¬ Unimodal witnessA := by
  rintro ⟨m, hUp, hDown⟩
  by_cases hm : m ≤ 2
  · have h := hDown 2 hm
    rw [show (2 : ℤ) + 1 = 3 from rfl, witnessA_coeff3, witnessA_coeff2] at h
    simp at h
  · have h := hUp 0 (by omega)
    rw [show (0 : ℤ) + 1 = 1 from rfl, witnessA_coeff1, witnessA_coeff0] at h
    simp at h

end R14C1P
