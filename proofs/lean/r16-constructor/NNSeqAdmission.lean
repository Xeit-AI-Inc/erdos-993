import ExtensionProfile
import Erdos993C8U1Base

open scoped Classical
noncomputable section

open Erdos993C8U1 (NNSeq PositiveIntervalSupport AdjacentLogConcave Toeplitz2 TRS2
  trs2_iff_adjacentLogConcave)

/-- The admission map: a rooted tree's ordinary independence sequence as an
`NNSeq` term. -/
def RTree.indepNNSeq (t : RTree) : NNSeq :=
  ∑ S ∈ t.vertices.powerset.filter (fun S => t.IndepSet S),
    AddMonoidAlgebra.single (S.card : ℤ) (1 : NNRat)

/-- General transport lemma. -/
theorem single_card_sum_coeff {β : Type*} (t : Finset β) (f : β → ℤ) (k : ℤ) :
    (∑ S ∈ t, AddMonoidAlgebra.single (f S) (1 : NNRat)).coeff k
      = ((t.filter (fun S => f S = k)).card : NNRat) := by
  classical
  simp [AddMonoidAlgebra.coeff_sum, Finset.sum_boole]

theorem RTree.indepNNSeq_coeff (t : RTree) (k : ℤ) :
    (t.indepNNSeq).coeff k
      = ((t.vertices.powerset.filter (fun S => t.IndepSet S ∧ (S.card : ℤ) = k)).card
          : NNRat) := by
  unfold RTree.indepNNSeq
  rw [single_card_sum_coeff]
  congr 1
  rw [Finset.filter_filter]

theorem RTree.indepNNSeq_ne_zero (t : RTree) : t.indepNNSeq ≠ 0 := by
  intro h
  have hc : t.indepNNSeq.coeff (0 : ℤ) = (0 : NNSeq).coeff (0 : ℤ) := by rw [h]
  rw [RTree.indepNNSeq_coeff, show (0 : NNSeq).coeff (0:ℤ) = 0 from rfl] at hc
  have hmem : (∅ : Finset (List ℕ)) ∈
      t.vertices.powerset.filter (fun S => t.IndepSet S ∧ (S.card : ℤ) = 0) := by
    simp [Finset.mem_filter, Finset.mem_powerset, RTree.IndepSet]
  have hcardpos : 0 < (t.vertices.powerset.filter
      (fun S => t.IndepSet S ∧ (S.card : ℤ) = 0)).card :=
    Finset.card_pos.mpr ⟨∅, hmem⟩
  have : (0 : NNRat) < ((t.vertices.powerset.filter
      (fun S => t.IndepSet S ∧ (S.card : ℤ) = 0)).card : NNRat) := by
    exact_mod_cast hcardpos
  rw [hc] at this
  exact lt_irrefl _ this

/-- The family of independent sets of `t`, as a Finset. -/
def RTree.indepFamily (t : RTree) : Finset (Finset (List ℕ)) :=
  t.vertices.powerset.filter (fun S => t.IndepSet S)

theorem RTree.mem_indepFamily_iff (t : RTree) (S : Finset (List ℕ)) :
    S ∈ t.indepFamily ↔ S ⊆ t.vertices ∧ t.IndepSet S := by
  unfold RTree.indepFamily
  simp only [Finset.mem_filter, Finset.mem_powerset]

theorem RTree.indepFamily_nonempty (t : RTree) : t.indepFamily.Nonempty := by
  refine ⟨∅, ?_⟩
  rw [RTree.mem_indepFamily_iff]
  exact ⟨Finset.empty_subset _, by simp [RTree.IndepSet]⟩

theorem RTree.indepNNSeq_positiveIntervalSupport (t : RTree) :
    PositiveIntervalSupport t.indepNNSeq := by
  classical
  set fam := t.indepFamily with hfam
  set sizes := fam.image Finset.card with hsizes
  have hfam_ne : fam.Nonempty := t.indepFamily_nonempty
  have hsizes_ne : sizes.Nonempty := hfam_ne.image _
  set u : ℕ := sizes.max' hsizes_ne with hu
  have hu_mem : u ∈ sizes := Finset.max'_mem sizes hsizes_ne
  obtain ⟨Smax, hSmax_mem, hSmax_card⟩ := Finset.mem_image.mp hu_mem
  refine ⟨0, (u : ℤ), by positivity, ?_⟩
  intro k
  rw [RTree.indepNNSeq_coeff]
  constructor
  · intro hpos
    have hcardpos : 0 < (t.vertices.powerset.filter
        (fun S => t.IndepSet S ∧ (S.card : ℤ) = k)).card := Nat.cast_pos.mp hpos
    obtain ⟨S, hS⟩ := Finset.card_pos.mp hcardpos
    rw [Finset.mem_filter, Finset.mem_powerset] at hS
    obtain ⟨hSsub, hSindep, hScard⟩ := hS
    have hSmem : S ∈ fam := (t.mem_indepFamily_iff S).mpr ⟨hSsub, hSindep⟩
    have hSle : S.card ≤ u := Finset.le_max' sizes S.card (Finset.mem_image.mpr ⟨S, hSmem, rfl⟩)
    have hSleZ : (S.card : ℤ) ≤ (u : ℤ) := by exact_mod_cast hSle
    exact ⟨by omega, by omega⟩
  · rintro ⟨hk0, hku⟩
    set n : ℕ := k.toNat with hn
    have hnk : (n : ℤ) = k := Int.toNat_of_nonneg hk0
    have hnu : n ≤ u := by
      have hnuZ : (n : ℤ) ≤ (u : ℤ) := by rw [hnk]; exact hku
      exact_mod_cast hnuZ
    have hSmaxIndep : t.IndepSet Smax := ((t.mem_indepFamily_iff Smax).mp hSmax_mem).2
    have hnSmax : n ≤ Smax.card := by rw [hSmax_card]; exact hnu
    obtain ⟨S', hS'sub, hS'card⟩ := Finset.exists_subset_card_eq hnSmax
    have hS'indep : t.IndepSet S' := hSmaxIndep.mono hS'sub
    have hS'vtx : S' ⊆ t.vertices := hS'sub.trans ((t.mem_indepFamily_iff Smax).mp hSmax_mem).1
    have hS'mem : S' ∈ t.vertices.powerset.filter
        (fun S => t.IndepSet S ∧ (S.card : ℤ) = k) := by
      rw [Finset.mem_filter, Finset.mem_powerset]
      refine ⟨hS'vtx, hS'indep, ?_⟩
      rw [hS'card]; exact hnk
    have hcardpos : 0 < (t.vertices.powerset.filter
        (fun S => t.IndepSet S ∧ (S.card : ℤ) = k)).card :=
      Finset.card_pos.mpr ⟨S', hS'mem⟩
    exact_mod_cast hcardpos

/-- **The admission payoff.** For any rooted tree `t`, `TRS2` of its
independence sequence (as an `NNSeq`) is EXACTLY adjacent log-concavity of
that sequence — the raw `mu_k >= 0` test fixed by ruling as the harness's
predicate. Nothing here asserts this holds for any `t`; it reduces the
open target to a definite, decidable-in-principle statement. -/
theorem RTree.TRS2_iff_adjacentLogConcave (t : RTree) :
    TRS2 t.indepNNSeq ↔ AdjacentLogConcave t.indepNNSeq :=
  trs2_iff_adjacentLogConcave t.indepNNSeq t.indepNNSeq_ne_zero
    t.indepNNSeq_positiveIntervalSupport
