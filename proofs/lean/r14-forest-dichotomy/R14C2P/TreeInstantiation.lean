import Forest
import NNSeqAdmission
import R14C1P.ForestCorollaries

/-!
# R14C2P.TreeInstantiation — the forest-corollary chain, items (1)–(5)
# THE C2-R2 RE-ISSUE (r14 Cycle 3, route R14C3-P)

**RE-ISSUE NOTICE (repair C2-R2, adjudication §6.1/§6.3, synthesis row
C2-R2).** This file is the ordered recompile of the sealed C2 module
`cycles/cycle-2/lean/R14C2-P/LeanProject/R14C2P/TreeInstantiation.lean`
(sha256 `a79202fed0b89f542997735d1569ef403e9ad382931d46b0f6082c5c2fe6c41d`,
which stands UNEDITED on sealed disk). This is a NEW C3 artifact. Changes,
exactly the C2-R2 slate: (a) the `hKL` census corrected to ELEVEN names on the
C2 slate (the sealed issue said ten, omitting `hKL_transport` — a false
universal inside the compiled artifact, P MAJOR sustained); (b)
`reshaped_transfer` now DERIVED from `reshaped_transfer_sharp` by a one-line
weakening (P-STR Minor 3); (c) the invited optional items — the no-`hall`
"(b) alone ⟹ 52" (`RForest.order_ge_52_of_disjunct_b`) and the `26k` forest
numeral (`RForest.core_order_ge_26k`) — bringing the module to 34
declarations, TWELVE of them `hKL`-carrying (disclosed below; the census
remains exact); (d) disclosure lines for compiled-(b)-vs-card and for
`core_empty_of_small`'s two premises; (e) the R3.4 divergence sentence; (f)
the line-507 replacement wording of record on `RForest.order_ge_52`'s
docstring. RG eligibility attaches to THIS re-issued module with fresh
receipts (adjudication §4); nothing here re-grades anything — grades are the
controller's gate acts.

**R3.4 divergence sentence (adjudication §6.3, P-OPP Minor 5, sustained as
procedural; the route right on the merits):** repair R3.4 was discharged in
`R14C2-P-R3-CORRECTIONS.md` §2 where the C1-synthesis spec named §4.2; the
synthesis row had transcribed the wrong side of P-OPP F-4, and that
transcription slip is recorded for the controller — the discharge stands.

PROTOTYPE (grade `RG` AT BEST, and only after two critic legs and a controller
gate act; NOTHING here is `governed` and nothing is `formally_verified`).

## Ceiling honesty (undetachable)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE are open before and after this file.
`AmbientTargetDeg2`, (α), (β), (A), (B) are not mentioned and not touched: they
are targets, never asserted. No statement below asserts that any forest is
unimodal unconditionally: every one is a conditional whose hypotheses include
either `Unimodal`/`¬ TRS2` of a designated factor, or the Kadrawi–Levit ≤ 25
EXTERNAL COMPUTATIONAL PREMISE carried as an explicit Lean hypothesis (`hKL`).
That hypothesis is never discharged here and may never be discharged inside the
kernel; it is a citation, not a theorem. Atlas margins and bounded zeros are
evidence of nothing; none is used below.

## PREMISE K, on the face of every Premise-K item

> **PREMISE K (EXTERNAL COMPUTATIONAL PREMISE).** Every tree of order at most
> 25 has a log-concave independence sequence.

Provenance of record (per `control/C1-CONTROLLER-RECONCILIATION.md`): Kadrawi
and Levit, arXiv:2305.01784, which attributes the trees-≤ 25 verification to
**Radcliffe** ("Radcliffe further verified that independence polynomials of
trees up to 25 vertices are log-concave"). It is **Radcliffe-via-K–L**: cited,
not reproduced, never upgraded, registered at premise tier (`KL-25`), and
disclosed on the face of every statement that uses it. Every numeral (26, 27,
52) below is the premise's property, not this program's.

Statements carrying Premise K are exactly those with an `hKL` hypothesis —
**ELEVEN on the C2 slate (the C2-R2 census of record; the sealed C2 issue said
ten, omitting `hKL_transport`, whose own docstring opens "PREMISE K,
transported")**: `hKL_transport`, `dichotomy_LC`, `core_order_ge_26`,
`core_order_sum_ge`, `core_empty_of_small`, `unimodal_of_order_le_25`,
`RForest.dichotomy`, `RForest.dichotomy_LC`, `RForest.order_ge_26`,
`RForest.order_ge_27`, `RForest.order_ge_52` — plus, in this re-issue only,
the invited optional numeral `RForest.core_order_ge_26k`, for a module total
of TWELVE. Every other declaration in this file is PREMISE-FREE (in
particular the other new optional item, `RForest.order_ge_52_of_disjunct_b`,
whose numerals sit in its hypotheses). Premise K is used at exactly ONE
mathematical step in the entire chain — the contrapositive *non-log-concave
⟹ order ≥ 26* — and every `hKL`-carrying statement above traces its numerals
to that single step.

## Consumed, never re-derived (all byte-identical to their governed sources)

* `Erdos993C8U1Base.lean` (r10 governed, sha256 `a45c61b8…`);
* `Convolution.lean` (r10 governed transplant of the r8 governed source,
  sha256 `4795a926…`);
* `ExtensionProfile.lean` (r10 governed, sha256 `74037091…`) — `RTree`,
  `toPieces`/`fromPieces`, `card_fromPieces`, `RTree.root_mem_vertices`;
* `NNSeqAdmission.lean` (r10 governed, sha256 `185fc06d…`) —
  `RTree.indepNNSeq`, `RTree.indepNNSeq_ne_zero`,
  `RTree.indepNNSeq_positiveIntervalSupport`,
  `RTree.TRS2_iff_adjacentLogConcave`;
* `Forest.lean` (r10 governed, sha256 `828b2e68…`) — `RForest.vertices`,
  `RForest.indepNNSeq`, `RForest.indepNNSeq_eq_prod`, `transfer_to_forest`;
* `R12C2P/P1.lean` (r12, sha256 `0ccfe84d…`) — `Unimodal`, `P1_NNSeq`;
* `R14C1P/ForestCorollaries.lean` (r14 C1, RG at abstract scope, sha256
  `f62d36fd…`) — `core`, `mem_core`, `core_reduction`, `transfer_reshaped`,
  `forest_unimodal_of_at_most_one_nonTRS2`, `forest_counterexample_dichotomy`,
  `forest_counterexample_order_ge_52`, `forest_counterexample_order_ge_52_LC`,
  `nonTRS2_iff_nonAdjacentLogConcave`, `unimodal_of_TRS2`, `Unimodal.one`.

Nothing from those files is transplanted into this one; they are IMPORTED.
(The C1 module transplanted three declarations from `Forest.lean` because it
declined the tree-side imports. This module takes the imports, so the
transplant is not repeated — `R14C1P.trs2_finset_prod` and the root-level
`trs2_finset_prod` coexist without clash, and this file uses neither directly.)

## RESERVED ZONE

Nothing below mentions `Bgen`, the I/A/B state split, its subtraction, or any
inequality across it. No row of `control/REJECTED-MECHANISMS.md` is approached:
F1/F2 are not assumed anywhere (Premise K is a bounded ≤ 25 citation, never a
universal tree log-concavity claim); F12's lesson is respected — every object
here is a finite product of `NNSeq` terms and no closure candidate weaker than
`TRS2` is introduced or tested.

## INVARIANCE (one line per new object)

Every declaration below is a function of its stated arguments alone. At
abstract scope those are the index type `ι`, the finite index set `s`, the
component map `f : ι → NNSeq`, the order map `ord : ι → ℕ`, and the hypothesis
terms; at forest scope they are the component list `cs : List RTree` (and, where
present, a component index `i₀ : Fin cs.length`) and the hypothesis terms. No
vertex ordering, no address convention beyond r10's own governed
`toPieces`/`fromPieces`, no choice of unimodality witness `m`, and no ordering
of independent sets enters any statement. `coreList` depends on `cs` alone; the
conclusions at abstract scope are invariant under any relabelling of `ι`
preserving `f` and `ord`, and at forest scope under any permutation of `cs`
(the product and the vertex-count sum are both permutation-invariant).
-/

open Erdos993C8U1
open scoped Classical
noncomputable section

namespace R14C2P

open R14C1P

/-! ############################################################
## PART 1 — THE TREE-SIDE INSTANTIATION (C2 work item 1)

P §7.6's self-declared largest gap: the C1 module is abstract, and reading its
conclusions as statements about actual forests requires instantiating `ι` at
the components, `f` at `RTree.indepNNSeq`, `ord` at `t.vertices.card`, and
supplying r10's governed `RForest.indepNNSeq_eq_prod`,
`RTree.indepNNSeq_ne_zero`, `RTree.indepNNSeq_positiveIntervalSupport` and
`RTree.TRS2_iff_adjacentLogConcave`. That is what this part does.

Model adequacy (item 4 of §7.6) is NOT re-verified here and is NOT claimed: the
`RTree` address model's adequacy as a model of finite trees, and of
`t.vertices.card` as the order, is carried by the corpus's r10 claim C6 and is
cited, not re-established. Every statement below is a statement about `RTree` /
`RForest` objects.
############################################################ -/

variable {ι : Type*}

/-- The component sequence map of a forest. INVARIANCE: a function of `cs`. -/
def fseq (cs : List RTree) : Fin cs.length → NNSeq := fun i => (cs.get i).indepNNSeq

/-- The component order map of a forest. INVARIANCE: a function of `cs`. -/
def ford (cs : List RTree) : Fin cs.length → ℕ := fun i => (cs.get i).vertices.card

/-- The abstract product at the forest instantiation IS the forest's own
sequence (r10 `RForest.indepNNSeq_eq_prod`, consumed). -/
theorem prod_fseq (cs : List RTree) :
    (∏ i ∈ (Finset.univ : Finset (Fin cs.length)), fseq cs i) = RForest.indepNNSeq cs := by
  rw [RForest.indepNNSeq_eq_prod]; rfl

/-- The abstract order sum at the forest instantiation IS the forest's own
vertex count (r10 `card_fromPieces`, consumed). This is the bridge that lets an
order bound stated as `∑ ord` be read as a statement about `|V(F)|`. -/
theorem sum_ford (cs : List RTree) :
    (∑ i ∈ (Finset.univ : Finset (Fin cs.length)), ford cs i) = (RForest.vertices cs).card := by
  unfold RForest.vertices ford
  exact (card_fromPieces cs _).symm

/-- Every rooted tree has at least its root, so every component has order ≥ 1.
Premise-free; used only for the multi-component floor. -/
theorem order_pos (t : RTree) : 1 ≤ t.vertices.card :=
  Finset.card_pos.mpr ⟨[], t.root_mem_vertices⟩

/-- **PREMISE K, transported.** The premise as Kadrawi–Levit state it (adjacent
log-concavity of trees of order ≤ 25) feeds the abstract `hKL` slot directly,
via r10's UNCONDITIONAL `RTree.TRS2_iff_adjacentLogConcave`. This is where the
C1 route's F-6 asymmetry (structural theorem available only at the TRS2-form
premise) disappears at tree scope: on tree sequences the two forms coincide,
unconditionally. -/
theorem hKL_transport (cs : List RTree)
    (hKL : ∀ t ∈ cs, t.vertices.card ≤ 25 → AdjacentLogConcave t.indepNNSeq) :
    ∀ i ∈ (Finset.univ : Finset (Fin cs.length)), ford cs i ≤ 25 → TRS2 (fseq cs i) := by
  intro i _ hle
  exact (RTree.TRS2_iff_adjacentLogConcave (cs.get i)).mpr (hKL _ (List.get_mem cs i) hle)

/-! ### 1.1 The forest algebra: nil, cons, and the log-concave/core split -/

/-- The empty forest's sequence is the unit. PREMISE-FREE. -/
theorem RForest.indepNNSeq_nil : RForest.indepNNSeq [] = 1 := by
  rw [RForest.indepNNSeq_eq_prod]; simp

/-- Adjoining a component multiplies the sequence. PREMISE-FREE. -/
theorem RForest.indepNNSeq_cons (t : RTree) (cs : List RTree) :
    RForest.indepNNSeq (t :: cs) = t.indepNNSeq * RForest.indepNNSeq cs := by
  rw [RForest.indepNNSeq_eq_prod, RForest.indepNNSeq_eq_prod]
  simp [Fin.prod_univ_succ]

/-- **The empty forest is unimodal.** PREMISE-FREE. Stated separately because
`forest_unimodal_of_at_most_one_nonTRS2` requires an inhabitant `i₀ : ι` and so
does not apply when the index type is empty — the C1 record's F-7 / P-STR
Finding 5 correction, discharged here in Lean rather than in prose: the empty
case goes through `core_reduction` + `Unimodal.one`, and this theorem is the
forest-scope form of exactly that. -/
theorem RForest.unimodal_nil : Unimodal (RForest.indepNNSeq []) := by
  rw [RForest.indepNNSeq_nil]; exact Unimodal.one

/-- Splitting a forest by any Boolean property of its components multiplies the
sequences. PREMISE-FREE. INVARIANCE: a function of `cs` and `p` alone. -/
theorem RForest.split (cs : List RTree) (p : RTree → Bool) :
    RForest.indepNNSeq (cs.filter p) * RForest.indepNNSeq (cs.filter (fun t => ! p t))
      = RForest.indepNNSeq cs := by
  induction cs with
  | nil => simp [RForest.indepNNSeq_nil]
  | cons t cs ih =>
    by_cases h : p t
    · have h1 : (t :: cs).filter p = t :: cs.filter p := by simp [h]
      have h2 : (t :: cs).filter (fun t => ! p t) = cs.filter (fun t => ! p t) := by simp [h]
      rw [h1, h2, RForest.indepNNSeq_cons, RForest.indepNNSeq_cons, ← ih]; ring
    · have h1 : (t :: cs).filter p = cs.filter p := by simp [h]
      have h2 : (t :: cs).filter (fun t => ! p t) = t :: cs.filter (fun t => ! p t) := by simp [h]
      rw [h1, h2, RForest.indepNNSeq_cons, RForest.indepNNSeq_cons, ← ih]; ring

/-- **The core sub-forest**: the components whose sequences are not `TRS2`.
This is `R14C1P.core` made into an actual forest, which is what (iii-b)/(iii-d)
need at forest scope (an abstract sub-`Finset` of indices is not a forest).
INVARIANCE: a function of `cs` alone. -/
def coreList (cs : List RTree) : List RTree :=
  cs.filter (fun t => ! decide (TRS2 t.indepNNSeq))

theorem mem_coreList {cs : List RTree} {t : RTree} :
    t ∈ coreList cs ↔ t ∈ cs ∧ ¬ TRS2 t.indepNNSeq := by
  simp [coreList, List.mem_filter]

/-- Every component of the log-concave part is `TRS2`, so r10's governed
`transfer_to_forest` makes the log-concave part's whole sequence `TRS2`.
PREMISE-FREE. -/
theorem RForest.trs2_logConcavePart (cs : List RTree) :
    TRS2 (RForest.indepNNSeq (cs.filter (fun t => decide (TRS2 t.indepNNSeq)))) := by
  apply transfer_to_forest
  intro i
  have hm := List.get_mem (cs.filter (fun t => decide (TRS2 t.indepNNSeq))) i
  rw [List.mem_filter] at hm
  simpa using hm.2

/-! ### 1.2 The C1 corollaries, instantiated at `RTree`/`RForest` -/

/-- **(i) at forest scope.** A forest with at most one non-log-concave
component, that component's own sequence unimodal, has a unimodal sequence.
PREMISE-FREE. (Instantiation of `R14C1P.forest_unimodal_of_at_most_one_nonTRS2`;
the empty forest is `RForest.unimodal_nil`.) -/
theorem RForest.unimodal_of_at_most_one_nonTRS2 (cs : List RTree) (i₀ : Fin cs.length)
    (hrest : ∀ i : Fin cs.length, i ≠ i₀ → TRS2 (cs.get i).indepNNSeq)
    (hb : Unimodal (cs.get i₀).indepNNSeq) :
    Unimodal (RForest.indepNNSeq cs) := by
  rw [← prod_fseq]
  exact forest_unimodal_of_at_most_one_nonTRS2 _ (fseq cs) i₀ (fun i _ h => hrest i h) hb

/-- **(iii-a) at forest scope — THE CORE REDUCTION.** Log-concave components are
free: unimodality of the core sub-forest's sequence gives unimodality of the
whole forest's. PREMISE-FREE. -/
theorem RForest.core_reduction (cs : List RTree)
    (h : Unimodal (RForest.indepNNSeq (coreList cs))) :
    Unimodal (RForest.indepNNSeq cs) := by
  rw [← RForest.split cs (fun t => decide (TRS2 t.indepNNSeq))]
  exact P1_NNSeq _ _ (RForest.trs2_logConcavePart cs) h

/-- **(iii-b) at forest scope — THE EXACT RESHAPING.** FOREST reduces to FOREST
on core forests (every component non-log-concave). PREMISE-FREE. The converse
direction is the trivial restriction (core forests are forests) and is not
compiled; the label of record is "an implication between universal statements",
per the C1 record's N-5 correction. -/
theorem RForest.forest_of_core
    (h : ∀ ds : List RTree, (∀ t ∈ ds, ¬ TRS2 t.indepNNSeq) →
      Unimodal (RForest.indepNNSeq ds)) :
    ∀ cs : List RTree, Unimodal (RForest.indepNNSeq cs) :=
  fun cs => RForest.core_reduction cs (h (coreList cs) (fun _ ht => (mem_coreList.mp ht).2))

/-- **(ii) at forest scope — THE DICHOTOMY. CARRIES PREMISE K (`hKL`).**
A forest counterexample either has a component that is itself a TREE
counterexample, or has two distinct non-log-concave components, each of order
≥ 26. The disjunction is NOT exclusive and minimality is NOT used.

**DISCLOSURE (C2-R2; P-OPP Minor 3, sustained).** The compiled disjunct (b)
here — two distinct non-`TRS2` components with their order conjuncts — is NOT
the FC-R14-2 card's class "(b)" ("every component unimodal", the `hall`
hypothesis of `RForest.order_ge_52`). The two are different narrowings of a
non-exclusive disjunction, and that non-exclusivity is adopted on the face of
this statement, not silently. -/
theorem RForest.dichotomy (cs : List RTree)
    (hKL : ∀ t ∈ cs, t.vertices.card ≤ 25 → AdjacentLogConcave t.indepNNSeq)
    (hne : ¬ Unimodal (RForest.indepNNSeq cs)) :
    (∃ i : Fin cs.length, ¬ Unimodal (cs.get i).indepNNSeq) ∨
    (∃ i₁ i₂ : Fin cs.length, i₁ ≠ i₂ ∧
      ¬ TRS2 (cs.get i₁).indepNNSeq ∧ ¬ TRS2 (cs.get i₂).indepNNSeq ∧
      26 ≤ (cs.get i₁).vertices.card ∧ 26 ≤ (cs.get i₂).vertices.card) := by
  have h := forest_counterexample_dichotomy (Finset.univ : Finset (Fin cs.length))
    (fseq cs) (ford cs) (hKL_transport cs hKL) (by rw [prod_fseq]; exact hne)
  rcases h with ⟨i, -, hu⟩ | ⟨i₁, -, i₂, -, hne12, h1, h2, o1, o2⟩
  · exact Or.inl ⟨i, hu⟩
  · exact Or.inr ⟨i₁, i₂, hne12, h1, h2, o1, o2⟩

/-- **The order bound at forest scope, in the forest's OWN vertex count.
CARRIES PREMISE K (`hKL`).** The reading of record (the C2 adjudication §6.2
replacement wording, adopted verbatim): *"`RForest.order_ge_52` proves — under
Premise K, for forests all of whose components are unimodal — that
`|V(F)| ≥ 52`. Attainability at 52 is not proved and not claimed; the
falsifier tests candidates at that bound, and a miss is a bounded zero."*
FC-R14-2's "earliest possible order" is RULED to be read as a pure lower
bound, never as attainability. The `hall` hypothesis is the one the C1
record's §9.2 dropped (P-OPP F-1, sustained); it is load-bearing and is carried
here on the face of the statement. -/
theorem RForest.order_ge_52 (cs : List RTree)
    (hKL : ∀ t ∈ cs, t.vertices.card ≤ 25 → AdjacentLogConcave t.indepNNSeq)
    (hall : ∀ t ∈ cs, Unimodal t.indepNNSeq)
    (hne : ¬ Unimodal (RForest.indepNNSeq cs)) :
    52 ≤ (RForest.vertices cs).card := by
  rw [← sum_ford]
  refine forest_counterexample_order_ge_52 _ (fseq cs) (ford cs) (hKL_transport cs hKL)
    (fun i _ => hall _ (List.get_mem cs i)) ?_
  rw [prod_fseq]; exact hne

/-- **The no-`hall` "(b) alone ⟹ 52" (NEW IN THE C2-R2 RE-ISSUE; invited at
adjudication §6.3, optional). PREMISE-FREE — the numerals sit in the
HYPOTHESES.** Whenever two DISTINCT components each have order ≥ 26 — which is
exactly what disjunct (b) of `RForest.dichotomy` supplies under Premise K —
the forest has at least 52 vertices, with no `hall` hypothesis and no `hKL`.
Attainability at 52 is not proved and not claimed. INVARIANCE: a function of
`cs`, `i₁`, `i₂` and the hypothesis terms alone; invariant under permutation
of `cs` (the vertex-count sum is permutation-invariant). -/
theorem RForest.order_ge_52_of_disjunct_b (cs : List RTree) {i₁ i₂ : Fin cs.length}
    (hne12 : i₁ ≠ i₂)
    (h1 : 26 ≤ (cs.get i₁).vertices.card) (h2 : 26 ≤ (cs.get i₂).vertices.card) :
    52 ≤ (RForest.vertices cs).card := by
  rw [← sum_ford]
  have hpair : ∑ i ∈ ({i₁, i₂} : Finset (Fin cs.length)), ford cs i
      = ford cs i₁ + ford cs i₂ := Finset.sum_pair hne12
  have hle : ∑ i ∈ ({i₁, i₂} : Finset (Fin cs.length)), ford cs i
      ≤ ∑ i ∈ (Finset.univ : Finset (Fin cs.length)), ford cs i :=
    Finset.sum_le_sum_of_subset (Finset.subset_univ _)
  have e1 : ford cs i₁ = (cs.get i₁).vertices.card := rfl
  have e2 : ford cs i₂ = (cs.get i₂).vertices.card := rfl
  omega

/-- **The `26k` numeral at forest scope (NEW IN THE C2-R2 RE-ISSUE; invited at
adjudication §6.4, optional). CARRIES PREMISE K (`hKL`).** The core sub-forest
of any forest has at least `26·k` vertices, `k` its number of components —
(iii-c)(3) read in the core forest's OWN vertex count via `sum_ford`. The
numeral is the premise's property, not this program's. INVARIANCE: a function
of `cs` and the hypothesis term alone. -/
theorem RForest.core_order_ge_26k (cs : List RTree)
    (hKL : ∀ t ∈ cs, t.vertices.card ≤ 25 → AdjacentLogConcave t.indepNNSeq) :
    26 * (coreList cs).length ≤ (RForest.vertices (coreList cs)).card := by
  rw [← sum_ford]
  have h26 : ∀ i ∈ (Finset.univ : Finset (Fin (coreList cs).length)),
      26 ≤ ford (coreList cs) i := by
    intro i _
    by_contra hlt
    have hm := mem_coreList.mp (List.get_mem (coreList cs) i)
    have hle25 : ((coreList cs).get i).vertices.card ≤ 25 := by
      simp only [ford] at hlt; omega
    exact hm.2 ((RTree.TRS2_iff_adjacentLogConcave _).mpr (hKL _ hm.1 hle25))
  have h := Finset.card_nsmul_le_sum
    (Finset.univ : Finset (Fin (coreList cs).length)) (ford (coreList cs)) 26 h26
  have hcard : (Finset.univ : Finset (Fin (coreList cs).length)).card
      = (coreList cs).length := by simp
  calc 26 * (coreList cs).length
      = (Finset.univ : Finset (Fin (coreList cs).length)).card * 26 := by
        rw [hcard, Nat.mul_comm]
    _ ≤ ∑ i ∈ (Finset.univ : Finset (Fin (coreList cs).length)), ford (coreList cs) i := by
        simpa [smul_eq_mul] using h

/-! ############################################################
## PART 2 — `dichotomy_premise_free` (C2 work item 2; P-OPP F-5)

The C1 record's §4.2 claims "the dichotomy itself is premise-free"; the claim
was true but established only by reading the tactic block, since the compiled
`forest_counterexample_dichotomy` folds `26 ≤ ord` into its conclusion. This is
that claim's own receipt: a statement with NO `hKL` and NO order arithmetic.
PREMISE-FREE.
############################################################ -/

theorem dichotomy_premise_free (s : Finset ι) (f : ι → NNSeq)
    (hne : ¬ Unimodal (∏ j ∈ s, f j)) :
    (∃ j ∈ s, ¬ Unimodal (f j)) ∨
    (∃ j₁ ∈ s, ∃ j₂ ∈ s, j₁ ≠ j₂ ∧ ¬ TRS2 (f j₁) ∧ ¬ TRS2 (f j₂)) := by
  rcases forest_counterexample_dichotomy s f (fun _ => 26)
      (fun _ _ h => absurd h (by omega)) hne with h | ⟨j₁, h₁, j₂, h₂, hne12, hn1, hn2, -, -⟩
  · exact Or.inl h
  · exact Or.inr ⟨j₁, h₁, j₂, h₂, hne12, hn1, hn2⟩

/-- The forest-scope form of the same. PREMISE-FREE. -/
theorem RForest.dichotomy_premise_free (cs : List RTree)
    (hne : ¬ Unimodal (RForest.indepNNSeq cs)) :
    (∃ i : Fin cs.length, ¬ Unimodal (cs.get i).indepNNSeq) ∨
    (∃ i₁ i₂ : Fin cs.length, i₁ ≠ i₂ ∧
      ¬ TRS2 (cs.get i₁).indepNNSeq ∧ ¬ TRS2 (cs.get i₂).indepNNSeq) := by
  rcases R14C2P.dichotomy_premise_free (Finset.univ : Finset (Fin cs.length)) (fseq cs)
      (by rw [prod_fseq]; exact hne) with ⟨i, -, hu⟩ | ⟨i₁, -, i₂, -, hne12, h1, h2⟩
  · exact Or.inl ⟨i, hu⟩
  · exact Or.inr ⟨i₁, i₂, hne12, h1, h2⟩

/-! ############################################################
## PART 3 — the `_LC` dichotomy variant (C2 work item 3; P-OPP F-6)

At C1 only the ORDER BOUND had an LC-form variant; the structural theorem was
available only at the (in the abstract `NNSeq` setting, strictly stronger)
TRS2-form premise. This closes the asymmetry: hypothesis AND conclusion in the
adjacent-log-concavity form in which Kadrawi–Levit actually state the premise.
CARRIES PREMISE K (`hKL`).
############################################################ -/

theorem dichotomy_LC (s : Finset ι) (f : ι → NNSeq) (ord : ι → ℕ)
    (h0 : ∀ j ∈ s, f j ≠ 0)
    (hpis : ∀ j ∈ s, PositiveIntervalSupport (f j))
    (hKL : ∀ j ∈ s, ord j ≤ 25 → AdjacentLogConcave (f j))
    (hne : ¬ Unimodal (∏ j ∈ s, f j)) :
    (∃ j ∈ s, ¬ Unimodal (f j)) ∨
    (∃ j₁ ∈ s, ∃ j₂ ∈ s, j₁ ≠ j₂ ∧
      ¬ AdjacentLogConcave (f j₁) ∧ ¬ AdjacentLogConcave (f j₂) ∧
      26 ≤ ord j₁ ∧ 26 ≤ ord j₂) := by
  have hKL' : ∀ j ∈ s, ord j ≤ 25 → TRS2 (f j) := fun j hj hle =>
    (trs2_iff_adjacentLogConcave (f j) (h0 j hj) (hpis j hj)).mpr (hKL j hj hle)
  rcases forest_counterexample_dichotomy s f ord hKL' hne with
    h | ⟨j₁, h₁, j₂, h₂, hne12, hn1, hn2, o1, o2⟩
  · exact Or.inl h
  · exact Or.inr ⟨j₁, h₁, j₂, h₂, hne12,
      (nonTRS2_iff_nonAdjacentLogConcave (f j₁) (h0 j₁ h₁) (hpis j₁ h₁)).mp hn1,
      (nonTRS2_iff_nonAdjacentLogConcave (f j₂) (h0 j₂ h₂) (hpis j₂ h₂)).mp hn2, o1, o2⟩

/-- The forest-scope `_LC` dichotomy: on tree sequences the two forms coincide
unconditionally (r10 `RTree.indepNNSeq_ne_zero`,
`RTree.indepNNSeq_positiveIntervalSupport`), so at forest scope the LC form
needs no side conditions at all. CARRIES PREMISE K (`hKL`). -/
theorem RForest.dichotomy_LC (cs : List RTree)
    (hKL : ∀ t ∈ cs, t.vertices.card ≤ 25 → AdjacentLogConcave t.indepNNSeq)
    (hne : ¬ Unimodal (RForest.indepNNSeq cs)) :
    (∃ i : Fin cs.length, ¬ Unimodal (cs.get i).indepNNSeq) ∨
    (∃ i₁ i₂ : Fin cs.length, i₁ ≠ i₂ ∧
      ¬ AdjacentLogConcave (cs.get i₁).indepNNSeq ∧
      ¬ AdjacentLogConcave (cs.get i₂).indepNNSeq ∧
      26 ≤ (cs.get i₁).vertices.card ∧ 26 ≤ (cs.get i₂).vertices.card) := by
  have h := R14C2P.dichotomy_LC (Finset.univ : Finset (Fin cs.length)) (fseq cs) (ford cs)
    (fun i _ => RTree.indepNNSeq_ne_zero _)
    (fun i _ => RTree.indepNNSeq_positiveIntervalSupport _)
    (fun i _ hle => hKL _ (List.get_mem cs i) hle)
    (by rw [prod_fseq]; exact hne)
  rcases h with ⟨i, -, hu⟩ | ⟨i₁, -, i₂, -, hne12, h1, h2, o1, o2⟩
  · exact Or.inl ⟨i, hu⟩
  · exact Or.inr ⟨i₁, i₂, hne12, h1, h2, o1, o2⟩

/-! ############################################################
## PART 4 — (iii-c) and (iii-d) AS LEAN DECLARATIONS (C2 work item 4; P-OPP F-3)

At C1 these were prose-only and A16 row 11 was re-marked accordingly. Here they
are declarations. (iii-c)(1)–(4) CARRY PREMISE K; (iii-d) is premise-free in its
structural content and acquires the numerals only through (iii-c).
############################################################ -/

/-- **(iii-c)(1). CARRIES PREMISE K.** Every component of a core family has
order ≥ 26 — the contrapositive of Premise K, and the SOLE step at which the
premise is used anywhere in this chain. -/
theorem core_order_ge_26 (s : Finset ι) (f : ι → NNSeq) (ord : ι → ℕ)
    (hKL : ∀ j ∈ s, ord j ≤ 25 → TRS2 (f j)) :
    ∀ j ∈ core s f, 26 ≤ ord j := by
  intro j hj
  rw [mem_core] at hj
  by_contra hlt
  exact hj.2 (hKL j hj.1 (by omega))

/-- **(iii-c)(2). PREMISE-FREE.** A one-component core family is a single
non-`TRS2` term: the one-component case of the reshaped statement is exactly the
restriction of TREE to non-log-concave trees. (The order bound on that term is
(iii-c)(1); this statement is the structural half.) -/
theorem core_prod_singleton (s : Finset ι) (f : ι → NNSeq) {j₀ : ι}
    (h : core s f = {j₀}) : (∏ j ∈ core s f, f j) = f j₀ ∧ ¬ TRS2 (f j₀) := by
  refine ⟨by rw [h, Finset.prod_singleton], ?_⟩
  have hj₀ : j₀ ∈ core s f := by rw [h]; exact Finset.mem_singleton_self j₀
  exact (mem_core.mp hj₀).2

/-- **(iii-c)(3). CARRIES PREMISE K.** A core family with `k` members has total
order ≥ 26k — in particular ≥ 52 for `k = 2`. -/
theorem core_order_sum_ge (s : Finset ι) (f : ι → NNSeq) (ord : ι → ℕ)
    (hKL : ∀ j ∈ s, ord j ≤ 25 → TRS2 (f j)) :
    26 * (core s f).card ≤ ∑ j ∈ core s f, ord j := by
  have h := Finset.card_nsmul_le_sum (core s f) ord 26 (core_order_ge_26 s f ord hKL)
  simpa [smul_eq_mul, Nat.mul_comm] using h

/-- **(iii-c)(4). CARRIES PREMISE K.** Below total order 26 the core is empty.

**DISCLOSURE (C2-R2; P-OPP Minor 4, sustained).** Every use of this statement,
in prose or in proof, carries BOTH premises on its face: it holds **under
Premise K** and only for families of **total order ≤ 25**. Neither qualifier
is droppable; the sealed C2 prose dropped them at two uses, and this line is
the ordered cure. -/
theorem core_empty_of_small (s : Finset ι) (f : ι → NNSeq) (ord : ι → ℕ)
    (hKL : ∀ j ∈ s, ord j ≤ 25 → TRS2 (f j))
    (hsmall : ∑ j ∈ s, ord j ≤ 25) : core s f = ∅ := by
  rw [Finset.eq_empty_iff_forall_notMem]
  intro j hj
  have h26 := core_order_ge_26 s f ord hKL j hj
  have hjs : j ∈ s := (mem_core.mp hj).1
  have hle : ord j ≤ ∑ k ∈ s, ord k :=
    Finset.single_le_sum (fun k _ => Nat.zero_le (ord k)) hjs
  omega

/-- **(iii-c)(4), the consequence. CARRIES PREMISE K.** Every family of total
order ≤ 25 has a unimodal product. Contrapositive: **26, not 52, is the
unconditional floor for a counterexample under Premise K** — the C1 record's
P-OPP F-1 correction, here as a theorem rather than a prose repair. -/
theorem unimodal_of_order_le_25 (s : Finset ι) (f : ι → NNSeq) (ord : ι → ℕ)
    (hKL : ∀ j ∈ s, ord j ≤ 25 → TRS2 (f j))
    (hsmall : ∑ j ∈ s, ord j ≤ 25) : Unimodal (∏ j ∈ s, f j) := by
  apply core_reduction
  rw [core_empty_of_small s f ord hKL hsmall, Finset.prod_empty]
  exact Unimodal.one

/-- **FLOOR 26 at forest scope. CARRIES PREMISE K.** Every forest counterexample
has at least 26 vertices. This is FC-R14-2's unconditional floor, mechanized. -/
theorem RForest.order_ge_26 (cs : List RTree)
    (hKL : ∀ t ∈ cs, t.vertices.card ≤ 25 → AdjacentLogConcave t.indepNNSeq)
    (hne : ¬ Unimodal (RForest.indepNNSeq cs)) : 26 ≤ (RForest.vertices cs).card := by
  by_contra hlt
  apply hne
  rw [← prod_fseq]
  exact unimodal_of_order_le_25 _ (fseq cs) (ford cs) (hKL_transport cs hKL)
    (by rw [sum_ford]; omega)

/-- **FLOOR 27 at forest scope for a MULTI-COMPONENT forest. CARRIES PREMISE K.**
The other numeral of record in FC-R14-2: a multi-component forest counterexample
has at least 27 vertices. (26 from the core component that must exist; ≥ 1 from
each remaining component, via `order_pos`.) NOT 52 — 52 is the floor only for
the strictly narrower class in `RForest.order_ge_52`. -/
theorem RForest.order_ge_27 (cs : List RTree)
    (hKL : ∀ t ∈ cs, t.vertices.card ≤ 25 → AdjacentLogConcave t.indepNNSeq)
    (hlen : 2 ≤ cs.length)
    (hne : ¬ Unimodal (RForest.indepNNSeq cs)) : 27 ≤ (RForest.vertices cs).card := by
  classical
  set s : Finset (Fin cs.length) := Finset.univ with hs
  have hcore : (core s (fseq cs)).Nonempty := by
    rcases Finset.eq_empty_or_nonempty (core s (fseq cs)) with hemp | hne'
    · exact absurd (by
        rw [← prod_fseq]
        exact R14C1P.core_reduction s (fseq cs)
          (by rw [hemp, Finset.prod_empty]; exact Unimodal.one)) hne
    · exact hne'
  obtain ⟨j₀, hj₀⟩ := hcore
  have h26 : 26 ≤ ford cs j₀ :=
    core_order_ge_26 s (fseq cs) (ford cs) (hKL_transport cs hKL) j₀ hj₀
  have hsplit : ford cs j₀ + ∑ i ∈ s.erase j₀, ford cs i = ∑ i ∈ s, ford cs i :=
    Finset.add_sum_erase s (ford cs) (Finset.mem_univ j₀)
  have hrest : (s.erase j₀).card ≤ ∑ i ∈ s.erase j₀, ford cs i := by
    simpa using Finset.card_nsmul_le_sum (s.erase j₀) (ford cs) 1
      (fun i _ => order_pos (cs.get i))
  have hcard : (s.erase j₀).card = cs.length - 1 := by
    rw [Finset.card_erase_of_mem (Finset.mem_univ j₀)]
    simp
  have htot : ∑ i ∈ s, ford cs i = (RForest.vertices cs).card := sum_ford cs
  omega

/-! **(iii-d) `reshaped_transfer` — RELOCATED (C2-R2).** In the sealed C2
issue, (iii-d) was proved here by its own tactic block, duplicating the
sharper Part-5 argument (P-STR Minor 3, sustained). In this re-issue it is
DERIVED from `reshaped_transfer_sharp` by a one-line hypothesis weakening —
see Part 5, immediately after the sharp form — so "strictly weaker" is a
kernel fact rather than prose. Its statement is unchanged. -/

/-! ############################################################
## PART 5 — the SHARPER (iii-d) (C2 work item 5; P-OPP N-4)

(iii-c)(2) shows the one-component core case is exactly TREE RESTRICTED TO
non-log-concave trees, so the blunt `TREE` hypothesis in (iii-d) can be
weakened. Since (iii) is offered as "the reshaped TRANSFER, MADE EXACT", using
the blunt hypothesis where the sharp one is available was a missed exactness.
PREMISE-FREE.
############################################################ -/

theorem reshaped_transfer_sharp (f : ι → NNSeq)
    (hTREEnonLC : ∀ j : ι, ¬ TRS2 (f j) → Unimodal (f j))
    (hcore2 : ∀ s : Finset ι, 2 ≤ s.card → (∀ j ∈ s, ¬ TRS2 (f j)) →
      Unimodal (∏ j ∈ s, f j)) :
    ∀ s : Finset ι, Unimodal (∏ j ∈ s, f j) := by
  refine transfer_reshaped f ?_
  intro s hs
  rcases Nat.lt_or_ge s.card 2 with hlt | hge
  · interval_cases h : s.card
    · rw [Finset.card_eq_zero.mp h, Finset.prod_empty]; exact Unimodal.one
    · obtain ⟨j₀, hj₀⟩ := Finset.card_eq_one.mp h
      have hmem : j₀ ∈ s := by rw [hj₀]; exact Finset.mem_singleton_self j₀
      rw [hj₀, Finset.prod_singleton]; exact hTREEnonLC j₀ (hs j₀ hmem)
  · exact hcore2 s hge hs

/-- **(iii-d) AS A LEAN DECLARATION. PREMISE-FREE.** The reshaped TRANSFER: TREE
(unimodality of every single term) together with unimodality of every ≥ 2-member
core family gives unimodality of every family. The dead classical route asked
for LOG-CONCAVITY of every tree and was refuted at order 26 (fence F1); this
asks only for unimodality of convolutions of two or more non-log-concave terms.
It is a RESTATEMENT of the open target, not progress on it.

**C2-R2 cure (P-STR Minor 3):** derived from `reshaped_transfer_sharp` by the
one-line weakening `fun j _ => hTREE j` — the blunt hypothesis implies the
sharp one, so the derivation IS the "strictly weaker" claim, kernel-checked. -/
theorem reshaped_transfer (f : ι → NNSeq)
    (hTREE : ∀ j : ι, Unimodal (f j))
    (hcore2 : ∀ s : Finset ι, 2 ≤ s.card → (∀ j ∈ s, ¬ TRS2 (f j)) →
      Unimodal (∏ j ∈ s, f j)) :
    ∀ s : Finset ι, Unimodal (∏ j ∈ s, f j) :=
  reshaped_transfer_sharp f (fun j _ => hTREE j) hcore2

/-- **The sharper (iii-d) at forest scope. PREMISE-FREE.** TREE restricted to
non-log-concave trees, plus unimodality of every core forest with ≥ 2
components, gives FOREST. Under Premise K every tree in the first hypothesis has
order ≥ 26 and every forest in the second has order ≥ 52
(`RForest.order_ge_26`, `RForest.order_ge_52`) — but those numerals are the
premise's, and this implication itself needs none of them. -/
theorem RForest.reshaped_transfer_sharp
    (hTREEnonLC : ∀ t : RTree, ¬ TRS2 t.indepNNSeq → Unimodal t.indepNNSeq)
    (hcore2 : ∀ ds : List RTree, 2 ≤ ds.length → (∀ t ∈ ds, ¬ TRS2 t.indepNNSeq) →
      Unimodal (RForest.indepNNSeq ds)) :
    ∀ cs : List RTree, Unimodal (RForest.indepNNSeq cs) := by
  refine RForest.forest_of_core ?_
  intro ds hds
  match ds, hds with
  | [], _ => exact RForest.unimodal_nil
  | [t], h =>
      rw [RForest.indepNNSeq_cons, RForest.indepNNSeq_nil, mul_one]
      exact hTREEnonLC t (h t (by simp))
  | (t₁ :: t₂ :: r), h => exact hcore2 _ (by simp) h

end R14C2P
