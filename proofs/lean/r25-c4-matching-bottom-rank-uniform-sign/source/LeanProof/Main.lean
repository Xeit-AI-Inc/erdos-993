import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount 6e46f86cf9548db488d204763ba1febaf95b21cb4bd833efab9e0844b49bd232
universe u

namespace Erdos993G1

noncomputable
def indepCount {V : Type u}
    (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

noncomputable
def coeff {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

noncomputable
def delta {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

end Erdos993G1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.FirstWide.stratum 8754f629736edd86925794cc3e0fe10b71c8a42e4f22fc956d5a0bbc2c5bc5ee
namespace Erdos993G1.FirstWide

noncomputable
def stratum {X : Type u} [Fintype X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ) : Finset (Finset X) := by
  classical
  exact (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 5c7b9ca8b1ef2a46cbf2f581f074ef0afa87447e598473dd3255d37c3f927e63
namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} (F : SimpleGraph V) [Fintype V]
    [DecidableEq V] [DecidableRel F.Adj] (k : ℕ) :
    indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma Erdos993G1.FirstWide.stratum_mem 678b0ab75d73632b045c6e42ba6f1c7961ed9766825e02701b6bb55c41dcbc10
namespace Erdos993G1.FirstWide

lemma stratum_mem {X : Type u} [Fintype X] [dX : DecidableEq X]
    (G : SimpleGraph X) (M S : Finset X) (k j : ℕ) :
    S ∈ stratum G M k j ↔ G.IsNIndepSet k S ∧ (S ∩ M).card = j := by
  classical
  simp only [stratum, Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff]
  have hd : (fun a b : X => Classical.propDecidable (a = b)) =
      dX := Subsingleton.elim _ _
  cases hd
  rfl

lemma erase_inter_eq {X : Type u} [DecidableEq X] (S M : Finset X) (a : X) :
    S.erase a ∩ M = (S ∩ M).erase a := by ext x; simp

lemma subset_fiber_eq_image {X : Type u} [DecidableEq X]
    (F : Finset (Finset X)) (S : Finset X) (k : ℕ)
    (hF : ∀ B ∈ F, B.card = k) (hS : S.card = k + 1) :
    F.filter (fun B => B ⊆ S) = (S.filter (fun a => S.erase a ∈ F)).image S.erase := by
  classical
  ext B
  simp only [Finset.mem_filter, Finset.mem_image]
  constructor
  · rintro ⟨hBF, hBS⟩
    obtain ⟨a, ha, he⟩ := Finset.exists_eq_insert_iff.mpr ⟨hBS, by rw [hF B hBF, hS]⟩
    have he' : S.erase a = B := by rw [← he, Finset.erase_insert ha]
    exact ⟨a, ⟨by rw [← he]; simp, by simpa [he'] using hBF⟩, he'⟩
  · rintro ⟨a, ⟨ha, he⟩, rfl⟩
    exact ⟨he, Finset.erase_subset _ _⟩

lemma erase_image_card {X : Type u} [DecidableEq X] (S T : Finset X)
    (hT : T ⊆ S) : (T.image S.erase).card = T.card := by
  apply Finset.card_image_of_injOn
  intro a ha b hb he
  exact (Finset.erase_inj S (hT ha)).mp he

lemma extension_fiber_bound {X : Type u} [DecidableEq X]
    (U : Finset (Finset X)) (B Q : Finset X) (k : ℕ)
    (hU : ∀ S ∈ U, S.card = k+1) (hB : B.card = k)
    (hQ : ∀ a, a ∉ B → insert a B ∈ U → a ∈ Q) :
    (U.filter (fun S => B ⊆ S)).card ≤ Q.card := by
  classical
  calc
    _ ≤ (Q.image (fun a => insert a B)).card := Finset.card_le_card (by
      intro S hS
      obtain ⟨hSU, hBS⟩ := Finset.mem_filter.mp hS
      obtain ⟨a, ha, he⟩ := Finset.exists_eq_insert_iff.mpr ⟨hBS, by rw [hB, hU S hSU]⟩
      exact Finset.mem_image.mpr ⟨a, hQ a ha (by simpa [he] using hSU), he⟩)
    _ ≤ _ := Finset.card_image_le

lemma stratum_erase_outside_iff {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M S : Finset X) (k j : ℕ)
    (hS : S ∈ stratum G M (k+1) j) (a : X) (ha : a ∈ S) :
    S.erase a ∈ stratum G M k j ↔ a ∉ M := by
  have hs := (stratum_mem G M S (k+1) j).mp hS
  rw [stratum_mem]
  constructor
  · intro h haM
    have hc := Finset.card_erase_add_one (Finset.mem_inter.mpr ⟨ha, haM⟩)
    rw [← erase_inter_eq, h.2, hs.2] at hc
    omega
  · intro haM
    refine ⟨⟨hs.1.isIndepSet.mono (by exact Finset.erase_subset a S), ?_⟩, ?_⟩
    · have hc := Finset.card_erase_add_one ha
      rw [hs.1.card_eq] at hc
      omega
    · rw [erase_inter_eq, Finset.erase_eq_of_notMem (by simp [haM]), hs.2]

lemma stratum_erase_inside {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M S : Finset X) (k j : ℕ)
    (hS : S ∈ stratum G M (k+1) (j+1)) (a : X) (ha : a ∈ S ∩ M) :
    S.erase a ∈ stratum G M k j := by
  have hs := (stratum_mem G M S (k+1) (j+1)).mp hS
  apply (stratum_mem G M (S.erase a) k j).mpr
  refine ⟨⟨hs.1.isIndepSet.mono (by exact Finset.erase_subset a S), ?_⟩, ?_⟩
  · have hc := Finset.card_erase_add_one (Finset.mem_inter.mp ha).1
    rw [hs.1.card_eq] at hc
    omega
  · have hc := Finset.card_erase_add_one ha
    rw [← erase_inter_eq, hs.2] at hc
    omega

lemma stratum_insert_same_outside {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M B : Finset X) (k j : ℕ)
    (hB : B ∈ stratum G M k j) (a : X) (ha : a ∉ B)
    (hS : insert a B ∈ stratum G M (k+1) j) : a ∉ M := by
  intro haM
  have hb := (stratum_mem G M B k j).mp hB
  have hs := (stratum_mem G M (insert a B) (k+1) j).mp hS
  have he : insert a B ∩ M = insert a (B ∩ M) := by
    ext x; simp only [Finset.mem_inter, Finset.mem_insert]; aesop
  have hc := Finset.card_insert_of_notMem (s := B ∩ M) (a := a) (by simp [ha])
  rw [← he, hb.2, hs.2] at hc
  omega

lemma stratum_insert_cross_inside {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M B : Finset X) (k j : ℕ)
    (hB : B ∈ stratum G M k j) (a : X)
    (hS : insert a B ∈ stratum G M (k+1) (j+1)) : a ∈ M := by
  by_contra haM
  have hb := (stratum_mem G M B k j).mp hB
  have hs := (stratum_mem G M (insert a B) (k+1) (j+1)).mp hS
  have he : insert a B ∩ M = B ∩ M := by
    ext x; simp only [Finset.mem_inter, Finset.mem_insert]; aesop
  rw [he, hb.2] at hs
  omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma Erdos993G1.UniformMatching.matching_endpoints_card 20c6a5e4dd7220390403ea5ae868ce48ea5572756d9ccdd6b67d34a46f689376
namespace Erdos993G1.UniformMatching
open Erdos993G1 Erdos993G1.FirstWide

/-- Endpoint count of an abstract `m`-matching (generalises C3 entry 154 /
the Cycle 1 award's `sevenMatching_endpoints_card`). -/
lemma matching_endpoints_card {X : Type u} [DecidableEq X] (m : ℕ)
    (f : Fin m × Bool → X) (hf : Function.Injective f) :
    (Finset.univ.image f).card = 2 * m := by
  rw [Finset.card_image_of_injective _ hf, Finset.card_univ, Fintype.card_prod,
    Fintype.card_fin, Fintype.card_bool]
  ring

/-- The forbidden-set / flip argument bounding how an independent set can meet
an `m`-matching (generalises C3 entry 155 / `sevenMatching_forbidden`). -/
lemma matching_forbidden {X : Type u} [DecidableEq X] (m : ℕ)
    (G : SimpleGraph X) (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (S : Finset X) (hS : G.IsIndepSet S) :
    ∃ Q : Finset X, Q ⊆ Finset.univ.image f ∧
      Q.card = 2 * (S ∩ Finset.univ.image f).card ∧
      ∀ x ∈ Q, x ∈ S ∨ ∃ y ∈ S, G.Adj y x := by
  classical
  let C : Finset (Fin m × Bool) := Finset.univ.filter (fun p => f p ∈ S)
  let flip : Fin m × Bool → Fin m × Bool := fun p => (p.1, !p.2)
  have hflip (p : Fin m × Bool) : flip (flip p) = p := by
    rcases p with ⟨i, b⟩
    cases b <;> rfl
  have hflipinj : Function.Injective flip := Function.LeftInverse.injective hflip
  have hadj (p : Fin m × Bool) : G.Adj (f p) (f (flip p)) := by
    rcases p with ⟨i, b⟩
    cases b
    · exact he i
    · exact (he i).symm
  have himage : C.image f = S ∩ Finset.univ.image f := by
    ext x
    simp only [C, Finset.mem_image, Finset.mem_filter, Finset.mem_univ,
      true_and, Finset.mem_inter]
    constructor
    · rintro ⟨p, hp, rfl⟩
      exact ⟨hp, p, rfl⟩
    · rintro ⟨hx, p, rfl⟩
      exact ⟨p, hx, rfl⟩
  have hCcard : C.card = (S ∩ Finset.univ.image f).card := by
    rw [← himage, Finset.card_image_of_injective _ hf]
  have hdis : Disjoint C (C.image flip) := by
    apply Finset.disjoint_left.mpr
    intro p hp hp'
    obtain ⟨q, hq, rfl⟩ := Finset.mem_image.mp hp'
    have hqS : f q ∈ S := (Finset.mem_filter.mp hq).2
    have hpS : f (flip q) ∈ S := (Finset.mem_filter.mp hp).2
    exact hS hqS hpS (hadj q).ne (hadj q)
  refine ⟨(C ∪ C.image flip).image f, ?_, ?_, ?_⟩
  · exact Finset.image_subset_image (Finset.subset_univ _)
  · rw [Finset.card_image_of_injective _ hf, Finset.card_union_of_disjoint hdis,
      Finset.card_image_of_injective _ hflipinj, hCcard]
    omega
  · intro x hx
    obtain ⟨p, hp, rfl⟩ := Finset.mem_image.mp hx
    rcases Finset.mem_union.mp hp with hp | hp
    · exact Or.inl (Finset.mem_filter.mp hp).2
    · obtain ⟨q, hq, rfl⟩ := Finset.mem_image.mp hp
      exact Or.inr ⟨f q, (Finset.mem_filter.mp hq).2, hadj q⟩

/-- `j ≤ m` for every independent set (generalises C3 entry 156 /
`sevenMatching_support`). -/
lemma matching_support {X : Type u} [DecidableEq X] (m : ℕ)
    (G : SimpleGraph X) (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (S : Finset X) (hS : G.IsIndepSet S) :
    (S ∩ Finset.univ.image f).card ≤ m := by
  obtain ⟨Q, hQ, hc, _⟩ := matching_forbidden m G f hf he S hS
  have hle := Finset.card_le_card hQ
  rw [hc, matching_endpoints_card m f hf] at hle
  omega

/-- The stratum partition `i_k = Σ_{j=0}^{m} |S(k,j)|`, generalising the
hard-coded 6-term (C3, m=5) and 8-term (Cycle 1 award, m=7) sums to a
`Finset.sum` over `Finset.range (m+1)` for arbitrary `m` (generalises C3
entry 157 / `sevenMatching_stratum_partition`). -/
lemma matching_stratum_partition {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (m : ℕ)
    (hM : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ m) (k : ℕ) :
    indepCount G k = ∑ j ∈ Finset.range (m + 1), ((stratum G M k j).card : ℤ) := by
  classical
  have hp := Finset.card_eq_sum_card_fiberwise
    (s := G.indepSetFinset k) (t := Finset.range (m + 1))
    (f := fun S : Finset X => (S ∩ M).card) (by
      intro S hS
      have hle := hM S (SimpleGraph.mem_indepSetFinset_iff.mp hS).isIndepSet
      simp only [Finset.mem_coe, Finset.mem_range]
      omega)
  have hfiber (j : ℕ) : (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j) =
      stratum G M k j := by
    ext S
    simp only [Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff, stratum_mem]
  simp only [hfiber] at hp
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  exact_mod_cast hp

/-- Emptiness fact 1 (cardinality budget): generalises C3 entry 158 /
`fiveMatching_stratum_empty`. Already fully general in `M`; restated here
only because this project cannot import the frozen C3 declaration. -/
lemma stratum_empty_of_card_lt {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ)
    (h : Nat.card X + j < M.card + k) : stratum G M k j = ∅ := by
  classical
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro S hS
  have hs := (stratum_mem G M S k j).mp hS
  have hc := Finset.card_union_add_card_inter S M
  have hle := Finset.card_le_card (Finset.subset_univ (S ∪ M))
  rw [hs.1.card_eq, hs.2] at hc
  simp only [Finset.card_univ, ← Nat.card_eq_fintype_card] at hle
  omega

/-- Emptiness fact 2 (index budget, `j ≤ k` since `S ∩ M ⊆ S`): the second
of the two elementary emptiness facts the small-rank closure needs (used
ad hoc, once, for `stratum(6,7)` in the Cycle 1 award proof; stated here as
its own reusable general lemma). -/
lemma stratum_empty_of_index_gt {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ) (h : k < j) :
    stratum G M k j = ∅ := by
  classical
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro S hS
  have hs := (stratum_mem G M S k j).mp hS
  have hcard := hs.2
  have hle : (S ∩ M).card ≤ S.card := Finset.card_le_card Finset.inter_subset_left
  rw [hs.1.card_eq] at hle
  omega

/-- Emptiness fact 3 (matching budget, `j ≤ m`): generalises the support
bound (`matching_support`) into the same "stratum vanishes" shape as the
other two emptiness facts, for uniform citation. -/
lemma stratum_empty_of_index_gt_matching {X : Type u} [Fintype X] [DecidableEq X]
    (m : ℕ) (G : SimpleGraph X) (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true))) (k j : ℕ) (h : m < j) :
    stratum G (Finset.univ.image f) k j = ∅ := by
  classical
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro S hS
  have hs := (stratum_mem G (Finset.univ.image f) S k j).mp hS
  have hcard := hs.2
  have hle := matching_support m G f hf he S hs.1.isIndepSet
  omega

/-- Outside incidence, arbitrary `(m,d)`, `K := 2*m-d` carried additively via
`hK`: `(r+1-j)·|S(r+1,j)| ≤ (r+j-K)·|S(r,j)|` in `ℕ` with the natural
truncation kept exactly as in the two fixed instances (generalises C3 entry
159 / `sevenMatching_outside_incidence`). This is the only place `d` and `m`
enter, and only through `K = 2m-d`. -/
lemma matching_outside_incidence {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (m d K : ℕ) (hM : M.card = 2 * m)
    (hK : K + d = 2 * m) (r : ℕ) (hn : Nat.card X = 2 * r + d) (j : ℕ) :
    (r + 1 - j) * (stratum G M (r+1) j).card ≤
      (r + j - K) * (stratum G M r j).card := by
  classical
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) j) (t := stratum G M r j)
    (m := r + 1 - j) (n := r + j - K) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change r + 1 - j ≤ ((stratum G M r j).filter (fun B => B ⊆ S)).card
    have hs := (stratum_mem G M S (r+1) j).mp hS
    rw [subset_fiber_eq_image _ S r
      (fun B hB => ((stratum_mem G M B r j).mp hB).1.card_eq) hs.1.card_eq]
    have hfilter : S.filter (fun a => S.erase a ∈ stratum G M r j) = S \ M := by
      ext a
      simp only [Finset.mem_filter, Finset.mem_sdiff]
      exact and_congr_right (fun ha => stratum_erase_outside_iff G M S r j hS a ha)
    rw [hfilter, erase_image_card S (S \ M) Finset.sdiff_subset]
    have hc := Finset.card_sdiff_add_card_inter S M
    rw [hs.2, hs.1.card_eq] at hc
    omega
  · intro B hB
    change ((stratum G M (r+1) j).filter (fun S => B ⊆ S)).card ≤ r + j - K
    have hb := (stratum_mem G M B r j).mp hB
    have hbound := extension_fiber_bound (stratum G M (r+1) j) B
      (Finset.univ \ (M ∪ B)) r
      (fun S hS => ((stratum_mem G M S (r+1) j).mp hS).1.card_eq) hb.1.card_eq
      (fun a ha hS => by
        have haM := stratum_insert_same_outside G M B r j hB a ha hS
        simp [ha, haM])
    have hc := Finset.card_union_add_card_inter M B
    have hi : (M ∩ B).card = j := by rw [Finset.inter_comm, hb.2]
    rw [hM, hb.1.card_eq, hi] at hc
    have hn' : (Finset.univ : Finset X).card = 2 * r + d := by
      simpa [Nat.card_eq_fintype_card] using hn
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ _), hn'] at hbound
    have hsame : 2 * r + d - (M ∪ B).card = r + j - K := by omega
    simpa only [hsame] using hbound

/-- Inside incidence, arbitrary `m`: `(j+1)·|S(r+1,j+1)| ≤ 2(m-j)·|S(r,j)|`
(generalises C3 entry 160 / `sevenMatching_inside_incidence`). `d` (hence
`K`) never enters this inequality at all — the excess is entirely absorbed
by the outside-incidence lemma above. -/
lemma matching_inside_incidence {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (m : ℕ) (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (r j : ℕ) (hj : j + 1 ≤ m) :
    (j + 1) * (stratum G (Finset.univ.image f) (r+1) (j+1)).card ≤
      (2 * (m - j)) * (stratum G (Finset.univ.image f) r j).card := by
  classical
  let M : Finset X := Finset.univ.image f
  have hM : M.card = 2 * m := matching_endpoints_card m f hf
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) (j+1)) (t := stratum G M r j)
    (m := j + 1) (n := 2 * (m - j)) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change j + 1 ≤ ((stratum G M r j).filter (fun B => B ⊆ S)).card
    have hs := (stratum_mem G M S (r+1) (j+1)).mp hS
    calc
      j + 1 = (S ∩ M).card := hs.2.symm
      _ = ((S ∩ M).image S.erase).card :=
        (erase_image_card S (S ∩ M) Finset.inter_subset_left).symm
      _ ≤ _ := Finset.card_le_card (by
        intro B hB
        obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hB
        exact Finset.mem_filter.mpr ⟨stratum_erase_inside G M S r j hS x hx,
          Finset.erase_subset x S⟩)
  · intro B hB
    change ((stratum G M (r+1) (j+1)).filter (fun S => B ⊆ S)).card ≤ 2 * (m - j)
    have hb := (stratum_mem G M B r j).mp hB
    obtain ⟨Q, hQM, hQc, hQforbid⟩ := matching_forbidden m G f hf he B hb.1.isIndepSet
    change Q ⊆ M at hQM
    change Q.card = 2 * (B ∩ M).card at hQc
    rw [hb.2] at hQc
    have hQsize : (M \ Q).card = 2 * (m - j) := by
      rw [Finset.card_sdiff_of_subset hQM, hM, hQc]
      omega
    apply le_trans (b := (M \ Q).card) ?_ hQsize.le
    apply extension_fiber_bound (stratum G M (r+1) (j+1)) B (M \ Q) r
      (fun S hS => ((stratum_mem G M S (r+1) (j+1)).mp hS).1.card_eq) hb.1.card_eq
    intro z hz hS
    have hzM := stratum_insert_cross_inside G M B r j hB z hS
    have hzQ : z ∉ Q := by
      intro hzQ
      rcases hQforbid z hzQ with hzB | ⟨y, hy, hyz⟩
      · exact hz hzB
      · have hs := ((stratum_mem G M (insert z B) (r+1) (j+1)).mp hS).1.isIndepSet
        exact hs (by simp [hy]) (by simp) hyz.ne hyz
    exact Finset.mem_sdiff.mpr ⟨hzM, hzQ⟩

/-- `ℤ`-cast of outside incidence (generalises C3 entry 162 pattern, before
re-centring). -/
lemma matching_outside_incidence_int {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (m d K : ℕ) (hM : M.card = 2 * m)
    (hK : K + d = 2 * m) (r : ℕ) (hn : Nat.card X = 2 * r + d) (j : ℕ) :
    ((r + 1 - j : ℕ) : ℤ) * ((stratum G M (r+1) j).card : ℤ) ≤
      ((r + j - K : ℕ) : ℤ) * ((stratum G M r j).card : ℤ) := by
  exact_mod_cast matching_outside_incidence G M m d K hM hK r hn j

/-- `ℤ`-cast of inside incidence (generalises C3 entry 161 /
`sevenMatching_inside_incidence_int`). -/
lemma matching_inside_incidence_int {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (m : ℕ) (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (r j : ℕ) (hj : j + 1 ≤ m) :
    ((j + 1 : ℕ) : ℤ) * ((stratum G (Finset.univ.image f) (r+1) (j+1)).card : ℤ) ≤
      ((2 * (m - j) : ℕ) : ℤ) * ((stratum G (Finset.univ.image f) r j).card : ℤ) := by
  exact_mod_cast matching_inside_incidence G m f hf he r j hj

/-- The `ℕ`/`ℤ` re-centring `r = t + K`, `j ≤ K+1` (the step the Cycle 1
award's informal proof marks "not skippable": a prior route was refuted for
silently dropping it). Generalises C3 entry 162 /
`sevenMatching_outside_incidence_large_int` to arbitrary `(m,d,K)`. -/
lemma matching_outside_incidence_recentred {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (m d K : ℕ) (hM : M.card = 2 * m)
    (hK : K + d = 2 * m) (t : ℕ) (hn : Nat.card X = 2 * (t + K) + d)
    (j : ℕ) (hj : j ≤ K + 1) :
    ((t : ℤ) + ((K + 1 - j : ℕ) : ℤ)) * ((stratum G M (t+K+1) j).card : ℤ) ≤
      ((t : ℤ) + (j : ℤ)) * ((stratum G M (t+K) j).card : ℤ) := by
  have h := matching_outside_incidence G M m d K hM hK (t + K) hn j
  have hl : t + K + 1 - j = t + (K + 1 - j) := by omega
  have hr : t + K + j - K = t + j := by omega
  rw [hl, hr] at h
  exact_mod_cast h

end Erdos993G1.UniformMatching
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma Erdos993G1.UniformMatching.stratum_sum_two 2a5c372edfa1ae1fc3039fa75207092666dfd662166ad1c0f847e21fd2505277
namespace Erdos993G1.UniformMatching
open Erdos993G1 Erdos993G1.FirstWide

lemma stratum_sum_two {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (m k j1 j2 : ℕ)
    (hj12 : j1 ≠ j2) (hsub : ({j1, j2} : Finset ℕ) ⊆ Finset.range (m + 1))
    (hzero : ∀ x ∈ Finset.range (m + 1), x ∉ ({j1, j2} : Finset ℕ) →
      stratum G M k x = ∅) :
    (∑ j ∈ Finset.range (m + 1), ((stratum G M k j).card : ℤ)) =
      ((stratum G M k j1).card : ℤ) + ((stratum G M k j2).card : ℤ) := by
  have hz : ∀ x ∈ Finset.range (m + 1), x ∉ ({j1, j2} : Finset ℕ) →
      ((stratum G M k x).card : ℤ) = 0 := fun x hx hxn => by rw [hzero x hx hxn]; simp
  rw [← Finset.sum_subset hsub hz, Finset.sum_pair hj12]

lemma stratum_sum_three {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (m k j1 j2 j3 : ℕ)
    (h12 : j1 ≠ j2) (h13 : j1 ≠ j3) (h23 : j2 ≠ j3)
    (hsub : ({j1, j2, j3} : Finset ℕ) ⊆ Finset.range (m + 1))
    (hzero : ∀ x ∈ Finset.range (m + 1), x ∉ ({j1, j2, j3} : Finset ℕ) →
      stratum G M k x = ∅) :
    (∑ j ∈ Finset.range (m + 1), ((stratum G M k j).card : ℤ)) =
      ((stratum G M k j1).card : ℤ) + ((stratum G M k j2).card : ℤ)
        + ((stratum G M k j3).card : ℤ) := by
  have hz : ∀ x ∈ Finset.range (m + 1), x ∉ ({j1, j2, j3} : Finset ℕ) →
      ((stratum G M k x).card : ℤ) = 0 := fun x hx hxn => by rw [hzero x hx hxn]; simp
  rw [← Finset.sum_subset hsub hz,
    show ({j1, j2, j3} : Finset ℕ) = insert j1 (insert j2 {j3}) from rfl,
    Finset.sum_insert (by simp [h12, h13]), Finset.sum_insert (by simp [h23]),
    Finset.sum_singleton]
  ring

end Erdos993G1.UniformMatching
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.UniformMatching.bottomRank_odd_delta_nonpos 3ccf3c9b11a484999bd671fb60d183ed86a10cb62e1829a9377e5b46a965c83e
namespace Erdos993G1.UniformMatching
open Erdos993G1 Erdos993G1.FirstWide

lemma bottomRank_odd_delta_nonpos {X : Type u} [Finite X] (e : ℕ) (he : 1 ≤ e)
    (G : SimpleGraph X) (hn : Nat.card X = 3 * (2 * e + 1))
    (f : Fin (3 * e + 1) × Bool → X) (hf : Function.Injective f)
    (hadj : ∀ i : Fin (3 * e + 1), G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G ((2 * e + 1 : ℕ) : ℤ) ≤ 0 := by
  classical
  letI := Fintype.ofFinite X
  set M : Finset X := Finset.univ.image f with hMdef
  have hM : M.card = 2 * (3 * e + 1) := matching_endpoints_card (3 * e + 1) f hf
  have hsupport : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 3 * e + 1 :=
    fun S hS => matching_support (3 * e + 1) G f hf hadj S hS
  have hdelta : Erdos993G1.delta G ((2 * e + 1 : ℕ) : ℤ) =
      Erdos993G1.indepCount G (2 * e + 2) - Erdos993G1.indepCount G (2 * e + 1) := by
    unfold Erdos993G1.delta Erdos993G1.coeff
    norm_num
    rfl
  -- live-window reduction
  have hApart := matching_stratum_partition G M (3 * e + 1) hsupport (2 * e + 1)
  have hBpart := matching_stratum_partition G M (3 * e + 1) hsupport (2 * e + 2)
  have hA : Erdos993G1.indepCount G (2 * e + 1) =
      ((stratum G M (2 * e + 1) (2 * e)).card : ℤ)
        + ((stratum G M (2 * e + 1) (2 * e + 1)).card : ℤ) := by
    rw [hApart]
    apply stratum_sum_two G M (3 * e + 1) (2 * e + 1) (2 * e) (2 * e + 1) (by omega)
    · intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      simp only [Finset.mem_range]; omega
    · intro x hx hxn
      simp only [Finset.mem_range] at hx
      simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at hxn
      by_cases hlt : x < 2 * e
      · exact stratum_empty_of_card_lt G M (2 * e + 1) x (by rw [hn, hM]; omega)
      · exact stratum_empty_of_index_gt G M (2 * e + 1) x (by omega)
  have hB : Erdos993G1.indepCount G (2 * e + 2) =
      ((stratum G M (2 * e + 2) (2 * e + 1)).card : ℤ)
        + ((stratum G M (2 * e + 2) (2 * e + 2)).card : ℤ) := by
    rw [hBpart]
    apply stratum_sum_two G M (3 * e + 1) (2 * e + 2) (2 * e + 1) (2 * e + 2) (by omega)
    · intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      simp only [Finset.mem_range]; omega
    · intro x hx hxn
      simp only [Finset.mem_range] at hx
      simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at hxn
      by_cases hlt : x < 2 * e + 1
      · exact stratum_empty_of_card_lt G M (2 * e + 2) x (by rw [hn, hM]; omega)
      · exact stratum_empty_of_index_gt G M (2 * e + 2) x (by omega)
  -- the three raw incidence facts at the live indices, normalised to the
  -- `2*e+2` rank form
  have hOraw := matching_outside_incidence G M (3 * e + 1) (2 * e + 1) (4 * e + 1)
    hM (by omega) (2 * e + 1) (by omega) (2 * e + 1)
  have hO : (stratum G M (2 * e + 2) (2 * e + 1)).card ≤
      (stratum G M (2 * e + 1) (2 * e + 1)).card := by
    have c1 : (2 * e + 1 + 1 - (2 * e + 1) : ℕ) = 1 := by omega
    have c2 : (2 * e + 1 + (2 * e + 1) - (4 * e + 1) : ℕ) = 1 := by omega
    rw [c1, c2, one_mul, one_mul] at hOraw
    have cshift : (2 * e + 1 + 1 : ℕ) = 2 * e + 2 := by omega
    rwa [cshift] at hOraw
  have hI1raw := matching_inside_incidence G (3 * e + 1) f hf hadj (2 * e + 1) (2 * e) (by omega)
  have hI1 : (2 * e + 1) * (stratum G M (2 * e + 2) (2 * e + 1)).card ≤
      2 * (e + 1) * (stratum G M (2 * e + 1) (2 * e)).card := by
    have cshift : (2 * e + 1 + 1 : ℕ) = 2 * e + 2 := by omega
    have cm : (3 * e + 1 - 2 * e : ℕ) = e + 1 := by omega
    rw [cshift, cm] at hI1raw
    exact hI1raw
  have hI2raw := matching_inside_incidence G (3 * e + 1) f hf hadj (2 * e + 1) (2 * e + 1) (by omega)
  have hI2 : (2 * e + 2) * (stratum G M (2 * e + 2) (2 * e + 2)).card ≤
      2 * e * (stratum G M (2 * e + 1) (2 * e + 1)).card := by
    have cshift1 : (2 * e + 1 + 1 : ℕ) = 2 * e + 2 := by omega
    have cm : (3 * e + 1 - (2 * e + 1) : ℕ) = e := by omega
    rw [cshift1, cm] at hI2raw
    exact hI2raw
  -- cast to ℤ and assemble the certificate
  have hOz : ((stratum G M (2 * e + 2) (2 * e + 1)).card : ℤ) ≤
      ((stratum G M (2 * e + 1) (2 * e + 1)).card : ℤ) := by exact_mod_cast hO
  have hI1z : ((2 * e + 1 : ℕ) : ℤ) * ((stratum G M (2 * e + 2) (2 * e + 1)).card : ℤ) ≤
      ((2 * (e + 1) : ℕ) : ℤ) * ((stratum G M (2 * e + 1) (2 * e)).card : ℤ) := by
    exact_mod_cast hI1
  have hI2z : ((2 * e + 2 : ℕ) : ℤ) * ((stratum G M (2 * e + 2) (2 * e + 2)).card : ℤ) ≤
      ((2 * e : ℕ) : ℤ) * ((stratum G M (2 * e + 1) (2 * e + 1)).card : ℤ) := by
    exact_mod_cast hI2
  push_cast at hI1z hI2z
  have ha1nonneg : (0:ℤ) ≤ ((stratum G M (2 * e + 1) (2 * e + 1)).card : ℤ) := by positivity
  have hDpos : (0:ℤ) < 2 * (e:ℤ) + 2 := by positivity
  have hkey : (2 * (e:ℤ) + 2) *
      (((stratum G M (2 * e + 2) (2 * e + 1)).card : ℤ)
        + ((stratum G M (2 * e + 2) (2 * e + 2)).card : ℤ)) ≤
      (2 * (e:ℤ) + 2) *
      (((stratum G M (2 * e + 1) (2 * e)).card : ℤ)
        + ((stratum G M (2 * e + 1) (2 * e + 1)).card : ℤ)) := by
    nlinarith [hOz, hI1z, hI2z, ha1nonneg]
  have hfinal := le_of_mul_le_mul_left hkey hDpos
  linarith [hdelta, hA, hB, hfinal]

end Erdos993G1.UniformMatching
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.UniformMatching.bottomRank_even_delta_nonpos fea43ed90781392e0679e4a88eb6332bd7b1e3d4001a43f83a4085dfdeedabfb
namespace Erdos993G1.UniformMatching
open Erdos993G1 Erdos993G1.FirstWide

set_option maxHeartbeats 4000000 in
lemma bottomRank_even_delta_nonpos {X : Type u} [Finite X] (e : ℕ) (he : 2 ≤ e)
    (G : SimpleGraph X) (hn : Nat.card X = 3 * (2 * e))
    (f : Fin (3 * e - 1) × Bool → X) (hf : Function.Injective f)
    (hadj : ∀ i : Fin (3 * e - 1), G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G ((2 * e : ℕ) : ℤ) ≤ 0 := by
  classical
  obtain ⟨e', rfl⟩ : ∃ e', e = e' + 2 := ⟨e - 2, by omega⟩
  letI := Fintype.ofFinite X
  set M : Finset X := Finset.univ.image f with hMdef
  have hM : M.card = 2 * (3 * (e' + 2) - 1) := matching_endpoints_card (3 * (e' + 2) - 1) f hf
  have hsupport : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 3 * (e' + 2) - 1 :=
    fun S hS => matching_support (3 * (e' + 2) - 1) G f hf hadj S hS
  have hdelta : Erdos993G1.delta G ((2 * (e' + 2) : ℕ) : ℤ) =
      Erdos993G1.indepCount G (2 * e' + 5) - Erdos993G1.indepCount G (2 * e' + 4) := by
    have hcast : ((2 * (e' + 2) : ℕ) : ℤ) = ((2 * e' + 4 : ℕ) : ℤ) := by norm_num; ring
    rw [hcast]
    unfold Erdos993G1.delta Erdos993G1.coeff
    norm_num
    rfl
  have hApart := matching_stratum_partition G M (3 * (e' + 2) - 1) hsupport (2 * e' + 4)
  have hBpart := matching_stratum_partition G M (3 * (e' + 2) - 1) hsupport (2 * e' + 5)
  have hA : Erdos993G1.indepCount G (2 * e' + 4) =
      ((stratum G M (2 * e' + 4) (2 * e' + 2)).card : ℤ)
        + ((stratum G M (2 * e' + 4) (2 * e' + 3)).card : ℤ)
        + ((stratum G M (2 * e' + 4) (2 * e' + 4)).card : ℤ) := by
    rw [hApart]
    apply stratum_sum_three G M (3 * (e' + 2) - 1) (2 * e' + 4)
      (2 * e' + 2) (2 * e' + 3) (2 * e' + 4) (by omega) (by omega) (by omega)
    · intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      simp only [Finset.mem_range]; omega
    · intro x hx hxn
      simp only [Finset.mem_range] at hx
      simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at hxn
      by_cases hlt : x < 2 * e' + 2
      · exact stratum_empty_of_card_lt G M (2 * e' + 4) x (by rw [hn, hM]; omega)
      · exact stratum_empty_of_index_gt G M (2 * e' + 4) x (by omega)
  have hB : Erdos993G1.indepCount G (2 * e' + 5) =
      ((stratum G M (2 * e' + 5) (2 * e' + 3)).card : ℤ)
        + ((stratum G M (2 * e' + 5) (2 * e' + 4)).card : ℤ)
        + ((stratum G M (2 * e' + 5) (2 * e' + 5)).card : ℤ) := by
    rw [hBpart]
    apply stratum_sum_three G M (3 * (e' + 2) - 1) (2 * e' + 5)
      (2 * e' + 3) (2 * e' + 4) (2 * e' + 5) (by omega) (by omega) (by omega)
    · intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      simp only [Finset.mem_range]; omega
    · intro x hx hxn
      simp only [Finset.mem_range] at hx
      simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at hxn
      by_cases hlt : x < 2 * e' + 3
      · exact stratum_empty_of_card_lt G M (2 * e' + 5) x (by rw [hn, hM]; omega)
      · exact stratum_empty_of_index_gt G M (2 * e' + 5) x (by omega)
  -- the five raw incidence facts at the live indices
  have hOaraw := matching_outside_incidence G M (3 * (e' + 2) - 1) (2 * (e' + 2)) (4 * e' + 6)
    hM (by omega) (2 * e' + 4) (by omega) (2 * e' + 3)
  have hOa : 2 * (stratum G M (2 * e' + 5) (2 * e' + 3)).card ≤
      (stratum G M (2 * e' + 4) (2 * e' + 3)).card := by
    have c1 : (2 * e' + 4 + 1 - (2 * e' + 3) : ℕ) = 2 := by omega
    have c2 : (2 * e' + 4 + (2 * e' + 3) - (4 * e' + 6) : ℕ) = 1 := by omega
    rw [c1, c2, one_mul] at hOaraw
    have cshift : (2 * e' + 4 + 1 : ℕ) = 2 * e' + 5 := by omega
    rwa [cshift] at hOaraw
  have hObraw := matching_outside_incidence G M (3 * (e' + 2) - 1) (2 * (e' + 2)) (4 * e' + 6)
    hM (by omega) (2 * e' + 4) (by omega) (2 * e' + 4)
  have hOb : (stratum G M (2 * e' + 5) (2 * e' + 4)).card ≤
      2 * (stratum G M (2 * e' + 4) (2 * e' + 4)).card := by
    have c1 : (2 * e' + 4 + 1 - (2 * e' + 4) : ℕ) = 1 := by omega
    have c2 : (2 * e' + 4 + (2 * e' + 4) - (4 * e' + 6) : ℕ) = 2 := by omega
    rw [c1, c2, one_mul] at hObraw
    have cshift : (2 * e' + 4 + 1 : ℕ) = 2 * e' + 5 := by omega
    rwa [cshift] at hObraw
  have hIcraw := matching_inside_incidence G (3 * (e' + 2) - 1) f hf hadj
    (2 * e' + 4) (2 * e' + 2) (by omega)
  have hIc : (2 * e' + 3) * (stratum G M (2 * e' + 5) (2 * e' + 3)).card ≤
      (2 * e' + 6) * (stratum G M (2 * e' + 4) (2 * e' + 2)).card := by
    have c1 : (2 * e' + 2 + 1 : ℕ) = 2 * e' + 3 := by omega
    have c2 : (2 * (3 * (e' + 2) - 1 - (2 * e' + 2)) : ℕ) = 2 * e' + 6 := by omega
    have cshift : (2 * e' + 4 + 1 : ℕ) = 2 * e' + 5 := by omega
    rw [c1, c2, cshift] at hIcraw
    exact hIcraw
  have hIdraw := matching_inside_incidence G (3 * (e' + 2) - 1) f hf hadj
    (2 * e' + 4) (2 * e' + 3) (by omega)
  have hId : (2 * e' + 4) * (stratum G M (2 * e' + 5) (2 * e' + 4)).card ≤
      (2 * e' + 4) * (stratum G M (2 * e' + 4) (2 * e' + 3)).card := by
    have c1 : (2 * e' + 3 + 1 : ℕ) = 2 * e' + 4 := by omega
    have c2 : (2 * (3 * (e' + 2) - 1 - (2 * e' + 3)) : ℕ) = 2 * e' + 4 := by omega
    have cshift : (2 * e' + 4 + 1 : ℕ) = 2 * e' + 5 := by omega
    rw [c1, c2, cshift] at hIdraw
    exact hIdraw
  have hIeraw := matching_inside_incidence G (3 * (e' + 2) - 1) f hf hadj
    (2 * e' + 4) (2 * e' + 4) (by omega)
  have hIe : (2 * e' + 5) * (stratum G M (2 * e' + 5) (2 * e' + 5)).card ≤
      (2 * e' + 2) * (stratum G M (2 * e' + 4) (2 * e' + 4)).card := by
    have c1 : (2 * e' + 4 + 1 : ℕ) = 2 * e' + 5 := by omega
    have c2 : (2 * (3 * (e' + 2) - 1 - (2 * e' + 4)) : ℕ) = 2 * e' + 2 := by omega
    have cshift : (2 * e' + 4 + 1 : ℕ) = 2 * e' + 5 := by omega
    rw [c1, c2, cshift] at hIeraw
    exact hIeraw
  -- cast to ℤ
  have hOaz : (2 : ℤ) * ((stratum G M (2 * e' + 5) (2 * e' + 3)).card : ℤ) ≤
      ((stratum G M (2 * e' + 4) (2 * e' + 3)).card : ℤ) := by exact_mod_cast hOa
  have hObz : ((stratum G M (2 * e' + 5) (2 * e' + 4)).card : ℤ) ≤
      (2 : ℤ) * ((stratum G M (2 * e' + 4) (2 * e' + 4)).card : ℤ) := by exact_mod_cast hOb
  have hIcz : ((2 * e' + 3 : ℕ) : ℤ) * ((stratum G M (2 * e' + 5) (2 * e' + 3)).card : ℤ) ≤
      ((2 * e' + 6 : ℕ) : ℤ) * ((stratum G M (2 * e' + 4) (2 * e' + 2)).card : ℤ) := by
    exact_mod_cast hIc
  have hIdz : ((2 * e' + 4 : ℕ) : ℤ) * ((stratum G M (2 * e' + 5) (2 * e' + 4)).card : ℤ) ≤
      ((2 * e' + 4 : ℕ) : ℤ) * ((stratum G M (2 * e' + 4) (2 * e' + 3)).card : ℤ) := by
    exact_mod_cast hId
  have hIez : ((2 * e' + 5 : ℕ) : ℤ) * ((stratum G M (2 * e' + 5) (2 * e' + 5)).card : ℤ) ≤
      ((2 * e' + 2 : ℕ) : ℤ) * ((stratum G M (2 * e' + 4) (2 * e' + 4)).card : ℤ) := by
    exact_mod_cast hIe
  push_cast at hIcz hIdz hIez
  have ha0nonneg : (0 : ℤ) ≤ ((stratum G M (2 * e' + 4) (2 * e' + 2)).card : ℤ) := by positivity
  have he'z : (0 : ℤ) ≤ (e' : ℤ) := by positivity
  have hwOa : (0 : ℤ) ≤ 12 * (e' : ℤ) ^ 2 + 42 * (e' : ℤ) + 36 := by positivity
  have hwIc : (0 : ℤ) ≤ 8 * (e' : ℤ) ^ 2 + 24 * (e' : ℤ) + 16 := by positivity
  have hwId : (0 : ℤ) ≤ 8 * (e' : ℤ) ^ 2 + 26 * (e' : ℤ) + 21 := by positivity
  have hwIe : (0 : ℤ) ≤ 8 * (e' : ℤ) ^ 2 + 28 * (e' : ℤ) + 24 := by positivity
  have sOa := mul_le_mul_of_nonneg_left hOaz hwOa
  have sOb := mul_le_mul_of_nonneg_left hObz hwOa
  have sIc := mul_le_mul_of_nonneg_left hIcz hwIc
  have sId := mul_le_mul_of_nonneg_left hIdz hwId
  have sIe := mul_le_mul_of_nonneg_left hIez hwIe
  have hslack : (0 : ℤ) ≤ (12 * (e' : ℤ) + 24) * ((stratum G M (2 * e' + 4) (2 * e' + 2)).card : ℤ) := by
    positivity
  have hDpos : (0 : ℤ) < 16 * (e' : ℤ) ^ 3 + 96 * (e' : ℤ) ^ 2 + 188 * (e' : ℤ) + 120 := by positivity
  have hkey : (16 * (e' : ℤ) ^ 3 + 96 * (e' : ℤ) ^ 2 + 188 * (e' : ℤ) + 120) *
      (((stratum G M (2 * e' + 5) (2 * e' + 3)).card : ℤ)
        + ((stratum G M (2 * e' + 5) (2 * e' + 4)).card : ℤ)
        + ((stratum G M (2 * e' + 5) (2 * e' + 5)).card : ℤ)) ≤
      (16 * (e' : ℤ) ^ 3 + 96 * (e' : ℤ) ^ 2 + 188 * (e' : ℤ) + 120) *
      (((stratum G M (2 * e' + 4) (2 * e' + 2)).card : ℤ)
        + ((stratum G M (2 * e' + 4) (2 * e' + 3)).card : ℤ)
        + ((stratum G M (2 * e' + 4) (2 * e' + 4)).card : ℤ)) := by
    nlinarith [sOa, sOb, sIc, sId, sIe, hslack]
  have hfinal := le_of_mul_le_mul_left hkey hDpos
  linarith [hdelta, hA, hB, hfinal]

end Erdos993G1.UniformMatching
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN theorem Erdos993G1.UniformMatching.bottomRank_delta_nonpos 3a6541965d93294799e42ff7c677b55284d9ae50443a1d7f86e6ade0b2c1ea47
namespace Erdos993G1.UniformMatching
open Erdos993G1 Erdos993G1.FirstWide

set_option maxHeartbeats 4000000 in
theorem bottomRank_delta_nonpos {X : Type u} [Finite X]
    (d : ℕ) (hd : 3 ≤ d) (G : SimpleGraph X)
    (hn : Nat.card X = 3 * d)
    (f : Fin ((3 * d + 1) / 2 - 1) × Bool → X) (hf : Function.Injective f)
    (he : ∀ i, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (d : ℤ) ≤ 0 := by
  obtain ⟨e, heq⟩ := Nat.even_or_odd' d
  rcases heq with rfl | rfl
  · -- d = 2*e, even branch
    have he2 : 2 ≤ e := by omega
    have hidx : (3 * (2 * e) + 1) / 2 - 1 = 3 * e - 1 := by omega
    have hf' : Function.Injective (fun p : Fin (3 * e - 1) × Bool =>
        f (Fin.cast hidx.symm p.1, p.2)) := by
      have hcast : Function.Injective (Fin.cast hidx.symm) := Fin.cast_injective _
      have hmap : Function.Injective (Prod.map (Fin.cast hidx.symm) (id : Bool → Bool)) :=
        hcast.prodMap Function.injective_id
      exact hf.comp hmap
    have hadj' : ∀ i : Fin (3 * e - 1),
        G.Adj ((fun p : Fin (3 * e - 1) × Bool => f (Fin.cast hidx.symm p.1, p.2)) (i, false))
          ((fun p : Fin (3 * e - 1) × Bool => f (Fin.cast hidx.symm p.1, p.2)) (i, true)) := by
      intro i; exact he (Fin.cast hidx.symm i)
    have hresult := bottomRank_even_delta_nonpos e he2 G (by omega)
      (fun p : Fin (3 * e - 1) × Bool => f (Fin.cast hidx.symm p.1, p.2)) hf' hadj'
    exact_mod_cast hresult
  · -- d = 2*e+1, odd branch
    have he1 : 1 ≤ e := by omega
    have hidx : (3 * (2 * e + 1) + 1) / 2 - 1 = 3 * e + 1 := by omega
    have hf' : Function.Injective (fun p : Fin (3 * e + 1) × Bool =>
        f (Fin.cast hidx.symm p.1, p.2)) := by
      have hcast : Function.Injective (Fin.cast hidx.symm) := Fin.cast_injective _
      have hmap : Function.Injective (Prod.map (Fin.cast hidx.symm) (id : Bool → Bool)) :=
        hcast.prodMap Function.injective_id
      exact hf.comp hmap
    have hadj' : ∀ i : Fin (3 * e + 1),
        G.Adj ((fun p : Fin (3 * e + 1) × Bool => f (Fin.cast hidx.symm p.1, p.2)) (i, false))
          ((fun p : Fin (3 * e + 1) × Bool => f (Fin.cast hidx.symm p.1, p.2)) (i, true)) := by
      intro i; exact he (Fin.cast hidx.symm i)
    have hresult := bottomRank_odd_delta_nonpos e he1 G (by omega)
      (fun p : Fin (3 * e + 1) × Bool => f (Fin.cast hidx.symm p.1, p.2)) hf' hadj'
    exact_mod_cast hresult


end Erdos993G1.UniformMatching
-- VERITYOS ENTRY 9 END

