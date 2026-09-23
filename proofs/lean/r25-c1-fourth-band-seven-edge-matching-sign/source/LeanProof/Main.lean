import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount e8918a3a30bdd13a45a0f2e30ad6bad1df2b0d67351d7ab987d8127aeffceb7c
namespace Erdos993G1

noncomputable
def indepCount {V : Type*} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

end Erdos993G1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.coeff f86bc3610cd14b9969be7e4d2af8635c3d6d58d944326122c31af80d82dd7ea8
namespace Erdos993G1

noncomputable
def coeff {V : Type*} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

end Erdos993G1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition Erdos993G1.delta 3547eef3c592a80e52286d44969e91ae7537a98a7e241cc1e700647cea9a4234
namespace Erdos993G1

noncomputable
def delta {V : Type*} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

end Erdos993G1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition Erdos993G1.FirstWide.stratum c0d35574192862169f09ba5e6cc3dd4f3e843a4582807d2bfbd1b7a5dbd57305
namespace Erdos993G1.FirstWide

noncomputable
def stratum {X : Type*} [Fintype X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ) : Finset (Finset X) := by
  classical
  exact (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma Erdos993G1.FirstWide.stratum_mem a62986796c454fa039ec63466c8546781abaa612d553f499a3ff05f5cd13ed22
namespace Erdos993G1.FirstWide

lemma stratum_mem {X : Type*} [Fintype X] [dX : DecidableEq X]
    (G : SimpleGraph X) (M S : Finset X) (k j : ℕ) :
    S ∈ stratum G M k j ↔ G.IsNIndepSet k S ∧ (S ∩ M).card = j := by
  classical
  simp only [stratum, Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff]
  have hd : (fun a b : X => Classical.propDecidable (a = b)) =
      dX := Subsingleton.elim _ _
  cases hd
  rfl

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma Erdos993G1.FirstWide.erase_inter_eq 9177659e2fd2028caf1e4ecfe84f04c2a54121d146bd8ab9667388aa960a7bc8
namespace Erdos993G1.FirstWide

lemma erase_inter_eq {X : Type*} [DecidableEq X] (S M : Finset X) (a : X) :
    S.erase a ∩ M = (S ∩ M).erase a := by ext x; simp

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.FirstWide.subset_fiber_eq_image cb6e90ff09a387fc0edf4d5158ebafad7c7845e96ebefe78f0e7d6c1fb57ef69
namespace Erdos993G1.FirstWide

lemma subset_fiber_eq_image {X : Type*} [DecidableEq X]
    (F : Finset (Finset X)) (S : Finset X) (k : ℕ)
    (hF : ∀ B ∈ F, B.card = k) (hS : S.card = k + 1) :
    F.filter (fun B => B ⊆ S) = (S.filter (fun a => S.erase a ∈ F)).image S.erase := by
  classical
  ext B
  simp only [Finset.mem_filter, Finset.mem_image]
  constructor
  · rintro ⟨hBF,hBS⟩
    obtain ⟨a,ha,he⟩ := Finset.exists_eq_insert_iff.mpr ⟨hBS, by rw [hF B hBF,hS]⟩
    have he' : S.erase a = B := by rw [← he,Finset.erase_insert ha]
    exact ⟨a,⟨by rw [← he]; simp,by simpa [he'] using hBF⟩,he'⟩
  · rintro ⟨a,⟨ha,he⟩,rfl⟩
    exact ⟨he,Finset.erase_subset _ _⟩

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.FirstWide.erase_image_card 52741a43b502a84292f096e047128415727084b5395a59dd2b28c680174e56f0
namespace Erdos993G1.FirstWide

lemma erase_image_card {X : Type*} [DecidableEq X] (S T : Finset X)
    (hT : T ⊆ S) : (T.image S.erase).card = T.card := by
  apply Finset.card_image_of_injOn
  intro a ha b hb he
  exact (Finset.erase_inj S (hT ha)).mp he

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.FirstWide.extension_fiber_bound fca5ca8723de243695ee15088e58b5608369cb11d0ad7794cca005493d196f81
namespace Erdos993G1.FirstWide

lemma extension_fiber_bound {X : Type*} [DecidableEq X]
    (U : Finset (Finset X)) (B Q : Finset X) (k : ℕ)
    (hU : ∀ S ∈ U, S.card = k+1) (hB : B.card = k)
    (hQ : ∀ a, a ∉ B → insert a B ∈ U → a ∈ Q) :
    (U.filter (fun S => B ⊆ S)).card ≤ Q.card := by
  classical
  calc
    _ ≤ (Q.image (fun a => insert a B)).card := Finset.card_le_card (by
      intro S hS
      obtain ⟨hSU,hBS⟩ := Finset.mem_filter.mp hS
      obtain ⟨a,ha,he⟩ := Finset.exists_eq_insert_iff.mpr ⟨hBS,by rw [hB,hU S hSU]⟩
      exact Finset.mem_image.mpr ⟨a,hQ a ha (by simpa [he] using hSU),he⟩)
    _ ≤ _ := Finset.card_image_le

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.FirstWide.stratum_erase_outside_iff 3f32776f6498c7708675e12d20682e3b1a2a38f8d3851fb967a73a1de83674bb
namespace Erdos993G1.FirstWide

lemma stratum_erase_outside_iff {X : Type*} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M S : Finset X) (k j : ℕ)
    (hS : S ∈ stratum G M (k+1) j) (a : X) (ha : a ∈ S) :
    S.erase a ∈ stratum G M k j ↔ a ∉ M := by
  have hs := (stratum_mem G M S (k+1) j).mp hS
  rw [stratum_mem]
  constructor
  · intro h haM
    have hc := Finset.card_erase_add_one (Finset.mem_inter.mpr ⟨ha,haM⟩)
    rw [← erase_inter_eq, h.2, hs.2] at hc
    omega
  · intro haM
    refine ⟨⟨hs.1.isIndepSet.mono (by exact Finset.erase_subset a S), ?_⟩, ?_⟩
    · have hc := Finset.card_erase_add_one ha
      rw [hs.1.card_eq] at hc
      omega
    · rw [erase_inter_eq,Finset.erase_eq_of_notMem (by simp [haM]),hs.2]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.FirstWide.stratum_erase_inside c134625ef542a6a7dbbfc693323adc4fc2a551828df6f346e7bda4f8b4bafb69
namespace Erdos993G1.FirstWide

lemma stratum_erase_inside {X : Type*} [Fintype X] [DecidableEq X]
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

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.FirstWide.stratum_insert_same_outside 7032b17cc64a43efc6d4666b507a49d9496d83c08e88f80c91fcc4add134f6e0
namespace Erdos993G1.FirstWide

lemma stratum_insert_same_outside {X : Type*} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M B : Finset X) (k j : ℕ)
    (hB : B ∈ stratum G M k j) (a : X) (ha : a ∉ B)
    (hS : insert a B ∈ stratum G M (k+1) j) : a ∉ M := by
  intro haM
  have hb := (stratum_mem G M B k j).mp hB
  have hs := (stratum_mem G M (insert a B) (k+1) j).mp hS
  have he : insert a B ∩ M = insert a (B ∩ M) := by ext x; simp only [Finset.mem_inter, Finset.mem_insert]; aesop
  have hc := Finset.card_insert_of_notMem (s := B ∩ M) (a := a) (by simp [ha])
  rw [← he, hb.2, hs.2] at hc
  omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.FirstWide.stratum_insert_cross_inside 71561dfb7c03321557d674b834025cedac923247a4ed13dcb7d12a163bcbbd34
namespace Erdos993G1.FirstWide

lemma stratum_insert_cross_inside {X : Type*} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M B : Finset X) (k j : ℕ)
    (hB : B ∈ stratum G M k j) (a : X)
    (hS : insert a B ∈ stratum G M (k+1) (j+1)) : a ∈ M := by
  by_contra haM
  have hb := (stratum_mem G M B k j).mp hB
  have hs := (stratum_mem G M (insert a B) (k+1) (j+1)).mp hS
  have he : insert a B ∩ M = B ∩ M := by ext x; simp only [Finset.mem_inter, Finset.mem_insert]; aesop
  rw [he,hb.2] at hs
  omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.FirstWide.stratum_univ_empty 8f82929a0f6bb5c61ea916dca40287b4479474b0e96405d6f6361d48fa606e99
namespace Erdos993G1.FirstWide

lemma stratum_univ_empty {X : Type*} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (k j : ℕ) (h : k ≠ j) : stratum G Finset.univ k j = ∅ := by
  classical
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro S hS
  have hs := (stratum_mem G Finset.univ S k j).mp hS
  have hc := hs.1.card_eq
  simp only [Finset.inter_univ] at hs
  exact h (hc.symm.trans hs.2)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.ThirdWide.fiveMatching_stratum_empty a570fff48f10ad5bf1ba81c059c384283a52b9d5adf90ae87b7a815877184558
namespace Erdos993G1.ThirdWide
open FirstWide

lemma fiveMatching_stratum_empty {X : Type*} [Fintype X] [DecidableEq X]
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

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_endpoints_card af43e5fdc28dc0f4c86b6c16d86f6dde8eef815a85d8d2a3d47055e633c69845
namespace Erdos993G1.FourthWideMatching
open FirstWide

lemma sevenMatching_endpoints_card {X : Type*} [DecidableEq X]
    (f : Fin 7 × Bool → X) (hf : Function.Injective f) :
    (Finset.univ.image f).card = 14 := by
  rw [Finset.card_image_of_injective _ hf]
  simp

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_forbidden 65b58541f31441ce1871d964e00a85c13a3ca13085679a516f75719bc5d939bb
namespace Erdos993G1.FourthWideMatching
open FirstWide

lemma sevenMatching_forbidden {X : Type*} [DecidableEq X]
    (G : SimpleGraph X) (f : Fin 7 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true)))
    (S : Finset X) (hS : G.IsIndepSet S) :
    ∃ Q : Finset X, Q ⊆ Finset.univ.image f ∧
      Q.card = 2 * (S ∩ Finset.univ.image f).card ∧
      ∀ x ∈ Q, x ∈ S ∨ ∃ y ∈ S, G.Adj y x := by
  classical
  let C : Finset (Fin 7 × Bool) := Finset.univ.filter (fun p => f p ∈ S)
  let flip : Fin 7 × Bool → Fin 7 × Bool := fun p => (p.1, !p.2)
  have hflip (p : Fin 7 × Bool) : flip (flip p) = p := by
    rcases p with ⟨i, b⟩
    cases b <;> rfl
  have hflipinj : Function.Injective flip := Function.LeftInverse.injective hflip
  have hadj (p : Fin 7 × Bool) : G.Adj (f p) (f (flip p)) := by
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

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_support fe01b090153e4c0c5e64febc032ac61bff16a19caab8d6fa97d2e73453117cc3
namespace Erdos993G1.FourthWideMatching
open FirstWide

lemma sevenMatching_support {X : Type*} [DecidableEq X]
    (G : SimpleGraph X) (f : Fin 7 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true)))
    (S : Finset X) (hS : G.IsIndepSet S) :
    (S ∩ Finset.univ.image f).card ≤ 7 := by
  obtain ⟨Q, hQ, hc, _⟩ := sevenMatching_forbidden G f hf he S hS
  have hle := Finset.card_le_card hQ
  rw [hc, sevenMatching_endpoints_card f hf] at hle
  omega

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_stratum_partition 2b9602198bc597ebbed7fecd10c964c4413f0c14ab3ba0e71b396dc38890bb08
namespace Erdos993G1.FourthWideMatching
open FirstWide

lemma sevenMatching_stratum_partition {X : Type*} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X)
    (hM : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 7) (k : ℕ) :
    Erdos993G1.indepCount G k = ((stratum G M k 0).card : ℤ) +
      ((stratum G M k 1).card : ℤ) + ((stratum G M k 2).card : ℤ) +
      ((stratum G M k 3).card : ℤ) + ((stratum G M k 4).card : ℤ) +
      ((stratum G M k 5).card : ℤ) + ((stratum G M k 6).card : ℤ) +
      ((stratum G M k 7).card : ℤ) := by
  classical
  have hp := Finset.card_eq_sum_card_fiberwise
    (s := G.indepSetFinset k) (t := ({0,1,2,3,4,5,6,7} : Finset ℕ))
    (f := fun S : Finset X => (S ∩ M).card) (by
      intro S hS
      have hle := hM S (SimpleGraph.mem_indepSetFinset_iff.mp hS).isIndepSet
      simp only [Finset.mem_coe, Finset.mem_insert, Finset.mem_singleton]
      omega)
  have hfiber (j : ℕ) : (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j) =
      stratum G M k j := by
    ext S
    simp only [Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff, stratum_mem]
  simp only [hfiber] at hp
  have hcard : Erdos993G1.indepCount G k = ((G.indepSetFinset k).card : ℤ) := by
    simp only [Erdos993G1.indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
      SimpleGraph.indepSetFinset]
  rw [hcard]
  have hp' : (G.indepSetFinset k).card = (stratum G M k 0).card +
      (stratum G M k 1).card + (stratum G M k 2).card +
      (stratum G M k 3).card + (stratum G M k 4).card +
      (stratum G M k 5).card + (stratum G M k 6).card +
      (stratum G M k 7).card := by
    simpa [add_assoc] using hp
  exact_mod_cast hp'

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_outside_incidence dc3e73679ef39eccf8b04387fb3dec6deb50f65fdc09d3a8a94189051062a474
namespace Erdos993G1.FourthWideMatching
open FirstWide

lemma sevenMatching_outside_incidence {X : Type*} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (hM : M.card = 14)
    (r : ℕ) (hn : Nat.card X = 2*r+5) (j : ℕ) :
    (r+1-j) * (stratum G M (r+1) j).card ≤
      (r+j-9) * (stratum G M r j).card := by
  classical
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) j) (t := stratum G M r j)
    (m := r+1-j) (n := r+j-9) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change r+1-j ≤ ((stratum G M r j).filter (fun B => B ⊆ S)).card
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
    change ((stratum G M (r+1) j).filter (fun S => B ⊆ S)).card ≤ r+j-9
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
    have hn' : (Finset.univ : Finset X).card = 2*r+5 := by
      simpa [Nat.card_eq_fintype_card] using hn
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ _), hn'] at hbound
    have hsame : 2*r+5 - (M ∪ B).card = r+j-9 := by omega
    simpa only [hsame] using hbound

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_inside_incidence 2887ee26927e55dce1e6c5890aba9d13231bcc074cb597c9b5b0ccf4ca343c0c
namespace Erdos993G1.FourthWideMatching
open FirstWide

lemma sevenMatching_inside_incidence {X : Type*} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (f : Fin 7 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true)))
    (r j : ℕ) (hj : j ≤ 6) :
    (j+1) * (stratum G (Finset.univ.image f) (r+1) (j+1)).card ≤
      (2*(7-j)) * (stratum G (Finset.univ.image f) r j).card := by
  classical
  let M : Finset X := Finset.univ.image f
  have hM : M.card = 14 := sevenMatching_endpoints_card f hf
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) (j+1)) (t := stratum G M r j)
    (m := j+1) (n := 2*(7-j)) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change j+1 ≤ ((stratum G M r j).filter (fun B => B ⊆ S)).card
    have hs := (stratum_mem G M S (r+1) (j+1)).mp hS
    calc
      j+1 = (S ∩ M).card := hs.2.symm
      _ = ((S ∩ M).image S.erase).card :=
        (erase_image_card S (S ∩ M) Finset.inter_subset_left).symm
      _ ≤ _ := Finset.card_le_card (by
        intro B hB
        obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hB
        exact Finset.mem_filter.mpr ⟨stratum_erase_inside G M S r j hS x hx,
          Finset.erase_subset x S⟩)
  · intro B hB
    change ((stratum G M (r+1) (j+1)).filter (fun S => B ⊆ S)).card ≤ 2*(7-j)
    have hb := (stratum_mem G M B r j).mp hB
    obtain ⟨Q, hQM, hQc, hQforbid⟩ := sevenMatching_forbidden G f hf he B hb.1.isIndepSet
    change Q ⊆ M at hQM
    change Q.card = 2 * (B ∩ M).card at hQc
    rw [hb.2] at hQc
    have hQsize : (M \ Q).card = 2*(7-j) := by
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

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_inside_incidence_int c1f88bdadcf1c8b817eca41ca88724e691ca5d02c41d845cf45ba4f73711ee02
namespace Erdos993G1.FourthWideMatching
open FirstWide

lemma sevenMatching_inside_incidence_int {X : Type*} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (f : Fin 7 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true)))
    (r j : ℕ) (hj : j ≤ 6) :
    ((j+1 : ℕ) : ℤ) * ((stratum G (Finset.univ.image f) (r+1) (j+1)).card : ℤ) ≤
      ((2*(7-j) : ℕ) : ℤ) * ((stratum G (Finset.univ.image f) r j).card : ℤ) := by
  exact_mod_cast sevenMatching_inside_incidence G f hf he r j hj

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_outside_incidence_large_int 0886739f9b4d03006df3aedf9c83bf88e597d610969e44e53e3aa8b756a34eea
namespace Erdos993G1.FourthWideMatching
open FirstWide

lemma sevenMatching_outside_incidence_large_int {X : Type*} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (hM : M.card = 14)
    (t : ℕ) (hn : Nat.card X = 2*(t+9)+5) (j : ℕ) (hj : j ≤ 7) :
    ((t : ℤ) + ((10-j : ℕ) : ℤ)) * ((stratum G M (t+9+1) j).card : ℤ) ≤
      ((t : ℤ) + (j : ℤ)) * ((stratum G M (t+9) j).card : ℤ) := by
  have h := sevenMatching_outside_incidence G M hM (t+9) hn j
  have hl : t+9+1-j = t+(10-j) := by omega
  have hr : t+9+j-9 = t+j := by omega
  rw [hl, hr] at h
  exact_mod_cast h

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_integer_certificate bcbf2ca9de00a80d65d7b218f16ad867d8b739d5603ee9bdf4784633aa56cf20
namespace Erdos993G1.FourthWideMatching
open FirstWide

lemma sevenMatching_integer_certificate
    (t a0 a1 a2 a3 a4 a5 a6 a7 b0 b1 b2 b3 b4 b5 b6 b7 : ℤ)
    (ht : 0 ≤ t) (ha0 : 0 ≤ a0) (ha1 : 0 ≤ a1) (ha2 : 0 ≤ a2) (ha3 : 0 ≤ a3)
    (O0 : (t+10)*b0 ≤ t*a0)
    (O1 : (t+9)*b1 ≤ (t+1)*a1)
    (O2 : (t+8)*b2 ≤ (t+2)*a2)
    (O3 : (t+7)*b3 ≤ (t+3)*a3)
    (O4 : (t+6)*b4 ≤ (t+4)*a4)
    (O5 : (t+5)*b5 ≤ (t+5)*a5)
    (O6 : (t+4)*b6 ≤ (t+6)*a6)
    (O7 : (t+3)*b7 ≤ (t+7)*a7)
    (I1 : 1*b1 ≤ 14*a0)
    (I2 : 2*b2 ≤ 12*a1)
    (I3 : 3*b3 ≤ 10*a2)
    (I4 : 4*b4 ≤ 8*a3)
    (I5 : 5*b5 ≤ 6*a4)
    (I6 : 6*b6 ≤ 4*a5)
    (I7 : 7*b7 ≤ 2*a6)
    : b0+b1+b2+b3+b4+b5+b6+b7 ≤ a0+a1+a2+a3+a4+a5+a6+a7 := by
  let L : ℤ := 127008000 + 139154400*t + 64250760*t^2 + 16217040*t^3 + 2418150*t^4 + 213150*t^5 + 10290*t^6 + 210*t^7
  let A0 : ℤ := 12700800 + 12645360*t + 5160540*t^2 + 1105650*t^3 + 131250*t^4 + 8190*t^5 + 210*t^6
  let A1 : ℤ := 14112000 + 13893600*t + 5595240*t^2 + 1180200*t^3 + 137550*t^4 + 8400*t^5 + 210*t^6
  let A2 : ℤ := 15876000 + 15409800*t + 6105120*t^2 + 1263990*t^3 + 144270*t^4 + 8610*t^5 + 210*t^6
  let A3 : ℤ := 18144000 + 17287200*t + 6709080*t^2 + 1358280*t^3 + 151410*t^4 + 8820*t^5 + 210*t^6
  let A4 : ℤ := 20520000 + 18928200*t + 7154760*t^2 + 1417854*t^3 + 155334*t^4 + 8922*t^5 + 210*t^6
  let A5 : ℤ := 17913600 + 17094560*t + 6647320*t^2 + 1348800*t^3 + 150710*t^4 + 8800*t^5 + 210*t^6
  let A6 : ℤ := 17712000 + 16947600*t + 6605940*t^2 + 1343130*t^3 + 150330*t^4 + 8790*t^5 + 210*t^6
  let A7 : ℤ := 18144000 + 17287200*t + 6709080*t^2 + 1358280*t^3 + 151410*t^4 + 8820*t^5 + 210*t^6
  let B4 : ℤ := 972000 + 1266300*t + 598500*t^2 + 138789*t^3 + 17073*t^4 + 1071*t^5 + 27*t^6
  let B5 : ℤ := 7488000 + 7153600*t + 2783920*t^2 + 565144*t^3 + 63160*t^4 + 3688*t^5 + 88*t^6
  let B6 : ℤ := 9360000 + 8942000*t + 3479900*t^2 + 706430*t^3 + 78950*t^4 + 4610*t^5 + 110*t^6
  let B7 : ℤ := 10368000 + 9878400*t + 3833760*t^2 + 776160*t^3 + 86520*t^4 + 5040*t^5 + 120*t^6
  let E0 : ℤ := 127008000 + 126453600*t + 51605400*t^2 + 11056500*t^3 + 1312500*t^4 + 81900*t^5 + 2100*t^6
  let E1 : ℤ := 112896000 + 111148800*t + 44761920*t^2 + 9441600*t^3 + 1100400*t^4 + 67200*t^5 + 1680*t^6
  let E2 : ℤ := 95256000 + 92458800*t + 36630720*t^2 + 7583940*t^3 + 865620*t^4 + 51660*t^5 + 1260*t^6
  let E3 : ℤ := 64800000 + 59018400*t + 22048320*t^2 + 4322808*t^3 + 469056*t^4 + 26712*t^5 + 624*t^6
  have hL : 0 < L := by dsimp [L]; positivity
  have hE0 : 0 ≤ E0*a0 := mul_nonneg (by dsimp [E0]; positivity) ha0
  have hE1 : 0 ≤ E1*a1 := mul_nonneg (by dsimp [E1]; positivity) ha1
  have hE2 : 0 ≤ E2*a2 := mul_nonneg (by dsimp [E2]; positivity) ha2
  have hE3 : 0 ≤ E3*a3 := mul_nonneg (by dsimp [E3]; positivity) ha3
  have hO0 := mul_le_mul_of_nonneg_left O0 (show 0 ≤ A0 by dsimp [A0]; positivity)
  have hO1 := mul_le_mul_of_nonneg_left O1 (show 0 ≤ A1 by dsimp [A1]; positivity)
  have hO2 := mul_le_mul_of_nonneg_left O2 (show 0 ≤ A2 by dsimp [A2]; positivity)
  have hO3 := mul_le_mul_of_nonneg_left O3 (show 0 ≤ A3 by dsimp [A3]; positivity)
  have hO4 := mul_le_mul_of_nonneg_left O4 (show 0 ≤ A4 by dsimp [A4]; positivity)
  have hO5 := mul_le_mul_of_nonneg_left O5 (show 0 ≤ A5 by dsimp [A5]; positivity)
  have hO6 := mul_le_mul_of_nonneg_left O6 (show 0 ≤ A6 by dsimp [A6]; positivity)
  have hO7 := mul_le_mul_of_nonneg_left O7 (show 0 ≤ A7 by dsimp [A7]; positivity)
  have hI4 := mul_le_mul_of_nonneg_left I4 (show 0 ≤ B4 by dsimp [B4]; positivity)
  have hI5 := mul_le_mul_of_nonneg_left I5 (show 0 ≤ B5 by dsimp [B5]; positivity)
  have hI6 := mul_le_mul_of_nonneg_left I6 (show 0 ≤ B6 by dsimp [B6]; positivity)
  have hI7 := mul_le_mul_of_nonneg_left I7 (show 0 ≤ B7 by dsimp [B7]; positivity)
  have H := (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add hO0 hO1) hO2) hO3) hO4) hO5) hO6) hO7) hI4) hI5) hI6) hI7)
  have Hsum : L*(b0+b1+b2+b3+b4+b5+b6+b7) + (E0*a0+E1*a1+E2*a2+E3*a3) ≤
      L*(a0+a1+a2+a3+a4+a5+a6+a7) := by
    have Heq1 :
        L*(b0+b1+b2+b3+b4+b5+b6+b7) + (E0*a0+E1*a1+E2*a2+E3*a3) =
        A0*((t+10)*b0) + A1*((t+9)*b1) + A2*((t+8)*b2) + A3*((t+7)*b3) +
          A4*((t+6)*b4) + A5*((t+5)*b5) + A6*((t+4)*b6) + A7*((t+3)*b7) +
          B4*(4*b4) + B5*(5*b5) + B6*(6*b6) + B7*(7*b7) +
          (E0*a0+E1*a1+E2*a2+E3*a3) := by
      dsimp [L, E0, E1, E2, E3, A0, A1, A2, A3, A4, A5, A6, A7, B4, B5, B6, B7]
      ring
    have Heq2 :
        A0*(t*a0) + A1*((t+1)*a1) + A2*((t+2)*a2) + A3*((t+3)*a3) +
          A4*((t+4)*a4) + A5*((t+5)*a5) + A6*((t+6)*a6) + A7*((t+7)*a7) +
          B4*(8*a3) + B5*(6*a4) + B6*(4*a5) + B7*(2*a6) +
          (E0*a0+E1*a1+E2*a2+E3*a3) = L*(a0+a1+a2+a3+a4+a5+a6+a7) := by
      dsimp [L, E0, E1, E2, E3, A0, A1, A2, A3, A4, A5, A6, A7, B4, B5, B6, B7]
      ring
    have Hmid :
        A0*((t+10)*b0) + A1*((t+9)*b1) + A2*((t+8)*b2) + A3*((t+7)*b3) +
          A4*((t+6)*b4) + A5*((t+5)*b5) + A6*((t+4)*b6) + A7*((t+3)*b7) +
          B4*(4*b4) + B5*(5*b5) + B6*(6*b6) + B7*(7*b7) +
          (E0*a0+E1*a1+E2*a2+E3*a3) ≤
        A0*(t*a0) + A1*((t+1)*a1) + A2*((t+2)*a2) + A3*((t+3)*a3) +
          A4*((t+4)*a4) + A5*((t+5)*a5) + A6*((t+6)*a6) + A7*((t+7)*a7) +
          B4*(8*a3) + B5*(6*a4) + B6*(4*a5) + B7*(2*a6) +
          (E0*a0+E1*a1+E2*a2+E3*a3) := by
      linarith [H]
    calc
      L*(b0+b1+b2+b3+b4+b5+b6+b7) + (E0*a0+E1*a1+E2*a2+E3*a3)
          = _ := Heq1
      _ ≤ _ := Hmid
      _ = L*(a0+a1+a2+a3+a4+a5+a6+a7) := Heq2
  have Hfinal : L*(b0+b1+b2+b3+b4+b5+b6+b7) ≤ L*(a0+a1+a2+a3+a4+a5+a6+a7) := by
    linarith only [Hsum, hE0, hE1, hE2, hE3]
  exact (mul_le_mul_iff_right₀ hL).mp Hfinal

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_delta_nonpos_ge9 f48dba346c6a4357d70be961224dfcb69f3faeecaf20c0a322b5171ed2a99c11
namespace Erdos993G1.FourthWideMatching
open FirstWide

set_option maxHeartbeats 4000000 in
lemma sevenMatching_delta_nonpos_ge9 {X : Type*} [Finite X]
    (G : SimpleGraph X) (r : ℕ) (hr9 : 9 ≤ r) (hn : Nat.card X = 2*r+5)
    (f : Fin 7 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (r : ℤ) ≤ 0 := by
  classical
  letI := Fintype.ofFinite X
  let M : Finset X := Finset.univ.image f
  have hM : M.card = 14 := sevenMatching_endpoints_card f hf
  have hsupport : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 7 :=
    fun S hS => sevenMatching_support G f hf he S hS
  have hc1 : Erdos993G1.coeff G (((r+1:ℕ)):ℤ) = Erdos993G1.indepCount G (r+1) := by
    unfold Erdos993G1.coeff
    rw [if_pos (show (0:ℤ) ≤ ((r+1:ℕ):ℤ) by positivity)]
    congr 1
  have hc2 : Erdos993G1.coeff G ((r:ℕ):ℤ) = Erdos993G1.indepCount G r := by
    unfold Erdos993G1.coeff
    rw [if_pos (show (0:ℤ) ≤ ((r:ℕ):ℤ) by positivity)]
    congr 1
  have hdelta : Erdos993G1.delta G (r:ℤ) =
      Erdos993G1.indepCount G (r+1) - Erdos993G1.indepCount G r := by
    rw [Erdos993G1.delta]
    rw [show (r:ℤ)+1 = ((r+1:ℕ):ℤ) by push_cast; ring]
    rw [hc1, hc2]
  rw [hdelta]
  obtain ⟨t, rfl⟩ : ∃ t : ℕ, r = t+9 := ⟨r-9, by omega⟩
  rw [sevenMatching_stratum_partition G M hsupport (t+9),
      sevenMatching_stratum_partition G M hsupport (t+9+1)]
  have i1 : (1:ℤ)*((stratum G M (t+9+1) 1).card:ℤ) ≤ 14*((stratum G M (t+9) 0).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he (t+9) 0 (by omega)
  have i2 : (2:ℤ)*((stratum G M (t+9+1) 2).card:ℤ) ≤ 12*((stratum G M (t+9) 1).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he (t+9) 1 (by omega)
  have i3 : (3:ℤ)*((stratum G M (t+9+1) 3).card:ℤ) ≤ 10*((stratum G M (t+9) 2).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he (t+9) 2 (by omega)
  have i4 : (4:ℤ)*((stratum G M (t+9+1) 4).card:ℤ) ≤ 8*((stratum G M (t+9) 3).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he (t+9) 3 (by omega)
  have i5 : (5:ℤ)*((stratum G M (t+9+1) 5).card:ℤ) ≤ 6*((stratum G M (t+9) 4).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he (t+9) 4 (by omega)
  have i6 : (6:ℤ)*((stratum G M (t+9+1) 6).card:ℤ) ≤ 4*((stratum G M (t+9) 5).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he (t+9) 5 (by omega)
  have i7 : (7:ℤ)*((stratum G M (t+9+1) 7).card:ℤ) ≤ 2*((stratum G M (t+9) 6).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he (t+9) 6 (by omega)
  have o0 := sevenMatching_outside_incidence_large_int G M hM t hn 0 (by omega)
  have o1 := sevenMatching_outside_incidence_large_int G M hM t hn 1 (by omega)
  have o2 := sevenMatching_outside_incidence_large_int G M hM t hn 2 (by omega)
  have o3 := sevenMatching_outside_incidence_large_int G M hM t hn 3 (by omega)
  have o4 := sevenMatching_outside_incidence_large_int G M hM t hn 4 (by omega)
  have o5 := sevenMatching_outside_incidence_large_int G M hM t hn 5 (by omega)
  have o6 := sevenMatching_outside_incidence_large_int G M hM t hn 6 (by omega)
  have o7 := sevenMatching_outside_incidence_large_int G M hM t hn 7 (by omega)
  try rw [show ((10-0:ℕ):ℤ) = 10 by decide] at o0
  try rw [show ((0:ℕ):ℤ) = 0 by decide] at o0
  try rw [add_zero] at o0
  try rw [show ((10-1:ℕ):ℤ) = 9 by decide] at o1
  try rw [show ((1:ℕ):ℤ) = 1 by decide] at o1
  try rw [show ((10-2:ℕ):ℤ) = 8 by decide] at o2
  try rw [show ((2:ℕ):ℤ) = 2 by decide] at o2
  try rw [show ((10-3:ℕ):ℤ) = 7 by decide] at o3
  try rw [show ((3:ℕ):ℤ) = 3 by decide] at o3
  try rw [show ((10-4:ℕ):ℤ) = 6 by decide] at o4
  try rw [show ((4:ℕ):ℤ) = 4 by decide] at o4
  try rw [show ((10-5:ℕ):ℤ) = 5 by decide] at o5
  try rw [show ((5:ℕ):ℤ) = 5 by decide] at o5
  try rw [show ((10-6:ℕ):ℤ) = 4 by decide] at o6
  try rw [show ((6:ℕ):ℤ) = 6 by decide] at o6
  try rw [show ((10-7:ℕ):ℤ) = 3 by decide] at o7
  try rw [show ((7:ℕ):ℤ) = 7 by decide] at o7
  -- Name every stratum cardinality once, folding it into every hypothesis
  -- (i1..i7, o0..o7) and the goal that already mentions it, so the
  -- certificate application below is a plain syntactic match with no
  -- `stratum`/`Finset`/`Fintype` unfolding needed.
  set a0 : ℕ := (stratum G M (t+9) 0).card with ha0_def
  set a1 : ℕ := (stratum G M (t+9) 1).card with ha1_def
  set a2 : ℕ := (stratum G M (t+9) 2).card with ha2_def
  set a3 : ℕ := (stratum G M (t+9) 3).card with ha3_def
  set a4 : ℕ := (stratum G M (t+9) 4).card with ha4_def
  set a5 : ℕ := (stratum G M (t+9) 5).card with ha5_def
  set a6 : ℕ := (stratum G M (t+9) 6).card with ha6_def
  set a7 : ℕ := (stratum G M (t+9) 7).card with ha7_def
  set b0 : ℕ := (stratum G M (t+9+1) 0).card with hb0_def
  set b1 : ℕ := (stratum G M (t+9+1) 1).card with hb1_def
  set b2 : ℕ := (stratum G M (t+9+1) 2).card with hb2_def
  set b3 : ℕ := (stratum G M (t+9+1) 3).card with hb3_def
  set b4 : ℕ := (stratum G M (t+9+1) 4).card with hb4_def
  set b5 : ℕ := (stratum G M (t+9+1) 5).card with hb5_def
  set b6 : ℕ := (stratum G M (t+9+1) 6).card with hb6_def
  set b7 : ℕ := (stratum G M (t+9+1) 7).card with hb7_def
  -- Forget the connection to `stratum`/`M`/`X` entirely: from here on,
  -- a0..a7, b0..b7 are plain opaque natural numbers, so the certificate
  -- application below is exactly the self-contained integer-arithmetic
  -- problem `sevenMatching_integer_certificate` itself states, with no
  -- `Finset`/`Fintype`/`stratum` unfolding possible or needed.
  clear_value a0 a1 a2 a3 a4 a5 a6 a7 b0 b1 b2 b3 b4 b5 b6 b7
  clear hM hsupport hc1 hc2 hdelta hn
  have ht' : (0:ℤ) ≤ (t:ℤ) := by positivity
  have ha0' : (0:ℤ) ≤ (a0:ℤ) := by positivity
  have ha1' : (0:ℤ) ≤ (a1:ℤ) := by positivity
  have ha2' : (0:ℤ) ≤ (a2:ℤ) := by positivity
  have ha3' : (0:ℤ) ≤ (a3:ℤ) := by positivity
  have hc := sevenMatching_integer_certificate
    (t:ℤ) (a0:ℤ) (a1:ℤ) (a2:ℤ) (a3:ℤ) (a4:ℤ) (a5:ℤ) (a6:ℤ) (a7:ℤ)
    (b0:ℤ) (b1:ℤ) (b2:ℤ) (b3:ℤ) (b4:ℤ) (b5:ℤ) (b6:ℤ) (b7:ℤ)
    ht' ha0' ha1' ha2' ha3'
    o0 o1 o2 o3 o4 o5 o6 o7 i1 i2 i3 i4 i5 i6 i7
  exact sub_nonpos.mpr hc

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma Erdos993G1.FourthWideMatching.sevenMatching_delta_nonpos_small a01868ba86575ba67a2767a35270939442bbb77be9b89b90e9041bb5c3a23935
namespace Erdos993G1.FourthWideMatching
open FirstWide
open Erdos993G1.ThirdWide

set_option maxHeartbeats 4000000 in
lemma sevenMatching_delta_nonpos_small {X : Type*} [Finite X]
    (G : SimpleGraph X) (r : ℕ) (hr5 : 5 ≤ r) (hr9 : r < 9) (hn : Nat.card X = 2*r+5)
    (f : Fin 7 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (r : ℤ) ≤ 0 := by
  classical
  letI := Fintype.ofFinite X
  let M : Finset X := Finset.univ.image f
  have hM : M.card = 14 := sevenMatching_endpoints_card f hf
  have hsupport : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 7 :=
    fun S hS => sevenMatching_support G f hf he S hS
  have hL := sevenMatching_stratum_partition G M hsupport r
  have hU := sevenMatching_stratum_partition G M hsupport (r+1)
  have i1 : (1:ℤ)*((stratum G M (r+1) 1).card:ℤ) ≤ 14*((stratum G M r 0).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he r 0 (by omega)
  have i2 : (2:ℤ)*((stratum G M (r+1) 2).card:ℤ) ≤ 12*((stratum G M r 1).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he r 1 (by omega)
  have i3 : (3:ℤ)*((stratum G M (r+1) 3).card:ℤ) ≤ 10*((stratum G M r 2).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he r 2 (by omega)
  have i4 : (4:ℤ)*((stratum G M (r+1) 4).card:ℤ) ≤ 8*((stratum G M r 3).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he r 3 (by omega)
  have i5 : (5:ℤ)*((stratum G M (r+1) 5).card:ℤ) ≤ 6*((stratum G M r 4).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he r 4 (by omega)
  have i6 : (6:ℤ)*((stratum G M (r+1) 6).card:ℤ) ≤ 4*((stratum G M r 5).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he r 5 (by omega)
  have i7 : (7:ℤ)*((stratum G M (r+1) 7).card:ℤ) ≤ 2*((stratum G M r 6).card:ℤ) :=
    sevenMatching_inside_incidence_int G f hf he r 6 (by omega)
  have hc1 : Erdos993G1.coeff G (((r+1:ℕ)):ℤ) = Erdos993G1.indepCount G (r+1) := by
    unfold Erdos993G1.coeff
    rw [if_pos (show (0:ℤ) ≤ ((r+1:ℕ):ℤ) by positivity)]
    congr 1
  have hc2 : Erdos993G1.coeff G ((r:ℕ):ℤ) = Erdos993G1.indepCount G r := by
    unfold Erdos993G1.coeff
    rw [if_pos (show (0:ℤ) ≤ ((r:ℕ):ℤ) by positivity)]
    congr 1
  have hdelta : Erdos993G1.delta G (r:ℤ) =
      Erdos993G1.indepCount G (r+1) - Erdos993G1.indepCount G r := by
    rw [Erdos993G1.delta]
    rw [show (r:ℤ)+1 = ((r+1:ℕ):ℤ) by push_cast; ring]
    rw [hc1, hc2]
  rw [hdelta, hL, hU]
  have hcases : r = 5 ∨ r = 6 ∨ r = 7 ∨ r = 8 := by omega
  have o0 := sevenMatching_outside_incidence G M hM r hn 0
  have o1 := sevenMatching_outside_incidence G M hM r hn 1
  have o2 := sevenMatching_outside_incidence G M hM r hn 2
  have o3 := sevenMatching_outside_incidence G M hM r hn 3
  have o4 := sevenMatching_outside_incidence G M hM r hn 4
  have o5 := sevenMatching_outside_incidence G M hM r hn 5
  have o6 := sevenMatching_outside_incidence G M hM r hn 6
  have o7 := sevenMatching_outside_incidence G M hM r hn 7
  have j1 : (stratum G M (r+1) 1).card ≤ 14*(stratum G M r 0).card := by
    have := i1; omega
  have j2 : 2*(stratum G M (r+1) 2).card ≤ 12*(stratum G M r 1).card := by
    have := i2; omega
  have j3 : 3*(stratum G M (r+1) 3).card ≤ 10*(stratum G M r 2).card := by
    have := i3; omega
  have j4 : 4*(stratum G M (r+1) 4).card ≤ 8*(stratum G M r 3).card := by
    have := i4; omega
  have j5 : 5*(stratum G M (r+1) 5).card ≤ 6*(stratum G M r 4).card := by
    have := i5; omega
  have j6 : 6*(stratum G M (r+1) 6).card ≤ 4*(stratum G M r 5).card := by
    have := i6; omega
  have j7 : 7*(stratum G M (r+1) 7).card ≤ 2*(stratum G M r 6).card := by
    have := i7; omega
  rcases hcases with rfl | rfl | rfl | rfl
  · -- r = 5
    have e50 : stratum G M 5 0 = ∅ := fiveMatching_stratum_empty G M 5 0 (by rw [hn, hM]; omega)
    have e51 : stratum G M 5 1 = ∅ := fiveMatching_stratum_empty G M 5 1 (by rw [hn, hM]; omega)
    have e52 : stratum G M 5 2 = ∅ := fiveMatching_stratum_empty G M 5 2 (by rw [hn, hM]; omega)
    have e53 : stratum G M 5 3 = ∅ := fiveMatching_stratum_empty G M 5 3 (by rw [hn, hM]; omega)
    have e67 : stratum G M (5+1) 7 = ∅ := by
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro S hS
      have hs := (stratum_mem G M S (5+1) 7).mp hS
      have hsub : (S ∩ M).card ≤ S.card := Finset.card_le_card Finset.inter_subset_left
      rw [hs.1.card_eq, hs.2] at hsub
      omega
    simp only [e50, e51, e52, e53, e67, Finset.card_empty] at o0 o1 o2 o3 o4 o5 o6 o7 j1 j2 j3 j4 j5 j6 j7 ⊢
    omega
  · -- r = 6
    have e60 : stratum G M 6 0 = ∅ := fiveMatching_stratum_empty G M 6 0 (by rw [hn, hM]; omega)
    have e61 : stratum G M 6 1 = ∅ := fiveMatching_stratum_empty G M 6 1 (by rw [hn, hM]; omega)
    have e62 : stratum G M 6 2 = ∅ := fiveMatching_stratum_empty G M 6 2 (by rw [hn, hM]; omega)
    have e70 : stratum G M (6+1) 0 = ∅ := fiveMatching_stratum_empty G M (6+1) 0 (by rw [hn, hM]; omega)
    have e71 : stratum G M (6+1) 1 = ∅ := fiveMatching_stratum_empty G M (6+1) 1 (by rw [hn, hM]; omega)
    have e72 : stratum G M (6+1) 2 = ∅ := fiveMatching_stratum_empty G M (6+1) 2 (by rw [hn, hM]; omega)
    have e73 : stratum G M (6+1) 3 = ∅ := fiveMatching_stratum_empty G M (6+1) 3 (by rw [hn, hM]; omega)
    simp only [e60, e61, e62, e70, e71, e72, e73, Finset.card_empty] at o0 o1 o2 o3 o4 o5 o6 o7 j1 j2 j3 j4 j5 j6 j7 ⊢
    omega
  · -- r = 7
    have e70 : stratum G M 7 0 = ∅ := fiveMatching_stratum_empty G M 7 0 (by rw [hn, hM]; omega)
    have e71 : stratum G M 7 1 = ∅ := fiveMatching_stratum_empty G M 7 1 (by rw [hn, hM]; omega)
    have e80 : stratum G M (7+1) 0 = ∅ := fiveMatching_stratum_empty G M (7+1) 0 (by rw [hn, hM]; omega)
    have e81 : stratum G M (7+1) 1 = ∅ := fiveMatching_stratum_empty G M (7+1) 1 (by rw [hn, hM]; omega)
    have e82 : stratum G M (7+1) 2 = ∅ := fiveMatching_stratum_empty G M (7+1) 2 (by rw [hn, hM]; omega)
    simp only [e70, e71, e80, e81, e82, Finset.card_empty] at o0 o1 o2 o3 o4 o5 o6 o7 j1 j2 j3 j4 j5 j6 j7 ⊢
    omega
  · -- r = 8
    have e80 : stratum G M 8 0 = ∅ := fiveMatching_stratum_empty G M 8 0 (by rw [hn, hM]; omega)
    have e90 : stratum G M (8+1) 0 = ∅ := fiveMatching_stratum_empty G M (8+1) 0 (by rw [hn, hM]; omega)
    have e91 : stratum G M (8+1) 1 = ∅ := fiveMatching_stratum_empty G M (8+1) 1 (by rw [hn, hM]; omega)
    simp only [e80, e90, e91, Finset.card_empty] at o0 o1 o2 o3 o4 o5 o6 o7 j1 j2 j3 j4 j5 j6 j7 ⊢
    omega

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN theorem Erdos993G1.FourthWideMatching.sevenMatching_delta_nonpos 3fcd3b9d3a6c355b3d821b7de22017e96f2f3ad651bea9504a3da6448b73995c
namespace Erdos993G1.FourthWideMatching
open FirstWide

theorem sevenMatching_delta_nonpos {X : Type*} [Finite X]
    (G : SimpleGraph X) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+5)
    (f : Fin 7 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (r : ℤ) ≤ 0 := by
  classical
  letI := Fintype.ofFinite X
  have hM : (Finset.univ.image f).card = 14 := sevenMatching_endpoints_card f hf
  have hMle : (Finset.univ.image f).card ≤ (Finset.univ : Finset X).card :=
    Finset.card_le_card (Finset.subset_univ _)
  have hn' : (Finset.univ : Finset X).card = 2*r+5 := by
    simpa [Nat.card_eq_fintype_card] using hn
  have hr5 : 5 ≤ r := by omega
  by_cases hr9 : 9 ≤ r
  · exact sevenMatching_delta_nonpos_ge9 G r hr9 hn f hf he
  · exact sevenMatching_delta_nonpos_small G r hr5 (by omega) hn f hf he

end Erdos993G1.FourthWideMatching
-- VERITYOS ENTRY 27 END

