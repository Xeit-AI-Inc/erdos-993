import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount f6bc96fd41a76a97b28a866a483e2b1d637d371832690897422edeeb9b65bc2b
universe u

namespace Erdos993G1

noncomputable
def indepCount {V : Type u}
    (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

end Erdos993G1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.coeff 15ce5e3474a249e2ae5d727a1012a8f6bea52cbbf8188b13cfe247eb844d5cf8
namespace Erdos993G1

noncomputable
def coeff {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

end Erdos993G1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition Erdos993G1.delta d7dc776c79754ed209810ad69194b3b65d71e3bf718124b0133c53d1bee1a42c
namespace Erdos993G1

noncomputable
def delta {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

end Erdos993G1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma Erdos993G1.C1LA2.indepCount_eq_indepSetFinset_card 9de820061b3c3b837fdbf460b08552f52ea2d9f107b4085550891c6b0805cd7c
namespace Erdos993G1.C1LA2

lemma indepCount_eq_indepSetFinset_card {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (k : ℕ) :
    Erdos993G1.indepCount G k = ((G.indepSetFinset k).card : ℤ) := by
  simp only [Erdos993G1.indepCount, SimpleGraph.indepSetFinset, Nat.card_eq_fintype_card,
    Fintype.card_subtype]

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma Erdos993G1.C1LA2.coeff_nat_aux ce50e5fc1feb062985780abbfa2006982832e4b8c326e676cc380adb0f708e36
namespace Erdos993G1.C1LA2

lemma coeff_nat_aux {X : Type u} (G : SimpleGraph X) (k : ℕ) :
    Erdos993G1.coeff G (k : ℤ) = Erdos993G1.indepCount G k := by
  simp [Erdos993G1.coeff]

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma Erdos993G1.C1LA2.delta_nat_aux 05faba6e749ba1600d0867ed5ee18ff7b8a1eeefad41e37fa4ed6ab2357299d7
namespace Erdos993G1.C1LA2

lemma delta_nat_aux {X : Type u} (G : SimpleGraph X) (k : ℕ) :
    Erdos993G1.delta G (k : ℤ) =
      Erdos993G1.indepCount G (k + 1) - Erdos993G1.indepCount G k := by
  simpa only [Erdos993G1.delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (coeff_nat_aux G (k + 1)) (coeff_nat_aux G k)

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.C1LA2.indepCount_nonneg_aux 11ed40015164336b84c2bac5487c07d2ef0db5c4752febbd76348ed40f87c217
namespace Erdos993G1.C1LA2

lemma indepCount_nonneg_aux {X : Type u} (G : SimpleGraph X) (k : ℕ) :
    0 ≤ Erdos993G1.indepCount G k := by
  unfold Erdos993G1.indepCount
  exact Int.natCast_nonneg _

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_forbidden 13601af8e2a564e123ea306c7eafc4060665c8d533309f7ddaf22dbaa2ed6670
namespace Erdos993G1.C1LA2

lemma perfectMatching_forbidden {X : Type u} [DecidableEq X] {m : ℕ}
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

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_endpoints_card ee3cb639da3a3c2ec92131ff1bc6a053bbb5911d55711a50d5175c4ff419e693
namespace Erdos993G1.C1LA2

lemma perfectMatching_endpoints_card {X : Type u} [DecidableEq X] {m : ℕ}
    (f : Fin m × Bool → X) (hf : Function.Injective f) :
    (Finset.univ.image f).card = 2 * m := by
  rw [Finset.card_image_of_injective _ hf, Finset.card_univ, Fintype.card_prod,
    Fintype.card_fin, Fintype.card_bool]
  ring

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_support c4e22fbc2574e4f6c188d91f1d31d64fb3bb9fdfc9e7e20335888d50a7513548
namespace Erdos993G1.C1LA2

lemma perfectMatching_support {X : Type u} [DecidableEq X] {m : ℕ}
    (G : SimpleGraph X) (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (S : Finset X) (hS : G.IsIndepSet S) :
    (S ∩ Finset.univ.image f).card ≤ m := by
  obtain ⟨Q, hQ, hc, _⟩ := perfectMatching_forbidden G f hf he S hS
  have hle := Finset.card_le_card hQ
  rw [hc, perfectMatching_endpoints_card f hf] at hle
  omega

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_endpoints_univ 72d538b704d72fe8624206abe831e764607afd79bf70ed5b5b96abbff52102b8
namespace Erdos993G1.C1LA2

lemma perfectMatching_endpoints_univ {X : Type u} [Fintype X] [DecidableEq X] {m : ℕ}
    (f : Fin m × Bool → X) (hf : Function.Injective f) (hn : Nat.card X = 2 * m) :
    Finset.univ.image f = (Finset.univ : Finset X) := by
  classical
  have hM : (Finset.univ.image f).card = 2 * m := perfectMatching_endpoints_card f hf
  have hu : (Finset.univ : Finset X).card = 2 * m := by
    rw [Finset.card_univ, ← Nat.card_eq_fintype_card, hn]
  exact Finset.eq_of_subset_of_card_le (Finset.subset_univ _) (by omega)

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_extend_card ba592a1b0d8778d23c497c5efbd1ed03c34aecf0d319e975e4afec4545b91c76
namespace Erdos993G1.C1LA2

lemma perfectMatching_extend_card {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (S : Finset X) (r : ℕ)
    (hS : S ∈ G.indepSetFinset (r + 1)) :
    r + 1 ≤ ((G.indepSetFinset r).filter (fun B => B ⊆ S)).card := by
  classical
  have hSmem := SimpleGraph.mem_indepSetFinset_iff.mp hS
  have hcard : S.card = r + 1 := hSmem.card_eq
  have hsub : S.image S.erase ⊆ (G.indepSetFinset r).filter (fun B => B ⊆ S) := by
    intro B hB
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hB
    have herase_sub : S.erase x ⊆ S := Finset.erase_subset x S
    have hindep : G.IsIndepSet (S.erase x : Finset X) :=
      hSmem.isIndepSet.mono (Finset.coe_subset.mpr herase_sub)
    have hcarderase : (S.erase x).card = r := by
      rw [Finset.card_erase_of_mem hx, hcard]
      omega
    have hmem : S.erase x ∈ G.indepSetFinset r :=
      SimpleGraph.mem_indepSetFinset_iff.mpr ⟨hindep, hcarderase⟩
    exact Finset.mem_filter.mpr ⟨hmem, herase_sub⟩
  calc
    r + 1 = S.card := hcard.symm
    _ = (S.image S.erase).card := (Finset.card_image_of_injOn (Finset.erase_injOn S)).symm
    _ ≤ ((G.indepSetFinset r).filter (fun B => B ⊆ S)).card := Finset.card_le_card hsub

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_extension_bound f16dfe87eaec5fea8d638d33b4a2598e7ca3dd7e9216b6b7f21c18794a712f00
namespace Erdos993G1.C1LA2

lemma perfectMatching_extension_bound {X : Type u} [Fintype X] [DecidableEq X]
    {m : ℕ} (G : SimpleGraph X) [DecidableRel G.Adj] (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (hn : Nat.card X = 2 * m)
    (B : Finset X) (r : ℕ) (hB : B ∈ G.indepSetFinset r) :
    ((G.indepSetFinset (r + 1)).filter (fun S => B ⊆ S)).card ≤ 2 * (m - r) := by
  classical
  have hBmem := SimpleGraph.mem_indepSetFinset_iff.mp hB
  obtain ⟨Q, hQM, hQc, hQforbid⟩ :=
    perfectMatching_forbidden G f hf he B hBmem.isIndepSet
  have hMuniv : Finset.univ.image f = (Finset.univ : Finset X) :=
    perfectMatching_endpoints_univ f hf hn
  rw [hMuniv, Finset.inter_univ, hBmem.card_eq] at hQc
  have hQuniv : Q ⊆ (Finset.univ : Finset X) := Finset.subset_univ Q
  have hcardX : (Finset.univ : Finset X).card = 2 * m := by
    rw [Finset.card_univ, ← Nat.card_eq_fintype_card, hn]
  have hsdiff := Finset.card_sdiff_of_subset hQuniv
  have hUQcard : (Finset.univ \ Q).card = 2 * (m - r) := by omega
  have hsub : (G.indepSetFinset (r + 1)).filter (fun S => B ⊆ S) ⊆
      (Finset.univ \ Q).image (fun z => insert z B) := by
    intro S hS
    obtain ⟨hSmemFS, hBS⟩ := Finset.mem_filter.mp hS
    have hSmem := SimpleGraph.mem_indepSetFinset_iff.mp hSmemFS
    have hcarddiff : (S \ B).card = 1 := by
      rw [Finset.card_sdiff_of_subset hBS, hSmem.card_eq, hBmem.card_eq]
      omega
    obtain ⟨z, hz⟩ := Finset.card_eq_one.mp hcarddiff
    have hzmemSB : z ∈ S \ B := by rw [hz]; exact Finset.mem_singleton_self z
    have hzS : z ∈ S := (Finset.mem_sdiff.mp hzmemSB).1
    have hzB : z ∉ B := (Finset.mem_sdiff.mp hzmemSB).2
    have hSeq : S = insert z B := by
      apply Finset.Subset.antisymm
      · intro w hw
        by_cases hwB : w ∈ B
        · exact Finset.mem_insert_of_mem hwB
        · have hwSB : w ∈ S \ B := Finset.mem_sdiff.mpr ⟨hw, hwB⟩
          rw [hz] at hwSB
          exact Finset.mem_insert.mpr (Or.inl (Finset.mem_singleton.mp hwSB))
      · intro w hw
        rcases Finset.mem_insert.mp hw with hw | hw
        · rw [hw]; exact hzS
        · exact hBS hw
    have hzQ : z ∉ Q := by
      intro hzQmem
      rcases hQforbid z hzQmem with hzB' | ⟨y, hyB, hyz⟩
      · exact hzB hzB'
      · have hSindep := hSmem.isIndepSet
        have hyS : y ∈ S := hBS hyB
        have hne : y ≠ z := fun h => hzB (h ▸ hyB)
        exact hSindep hyS hzS hne hyz
    have hzmem : z ∈ Finset.univ \ Q := Finset.mem_sdiff.mpr ⟨Finset.mem_univ z, hzQ⟩
    exact Finset.mem_image.mpr ⟨z, hzmem, hSeq.symm⟩
  calc
    ((G.indepSetFinset (r + 1)).filter (fun S => B ⊆ S)).card
        ≤ ((Finset.univ \ Q).image (fun z => insert z B)).card := Finset.card_le_card hsub
    _ ≤ (Finset.univ \ Q).card := Finset.card_image_le
    _ = 2 * (m - r) := hUQcard

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_containment_nat a064855c82f58ffe1bf20483429ffd76caec18d41cf3d59e11ff1297b4852505
namespace Erdos993G1.C1LA2

lemma perfectMatching_containment_nat {X : Type u} [Fintype X] [DecidableEq X]
    {m : ℕ} (G : SimpleGraph X) [DecidableRel G.Adj] (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (hn : Nat.card X = 2 * m) (r : ℕ) :
    (r + 1) * (G.indepSetFinset (r + 1)).card ≤
      (2 * (m - r)) * (G.indepSetFinset r).card := by
  classical
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := G.indepSetFinset (r + 1)) (t := G.indepSetFinset r)
    (m := r + 1) (n := 2 * (m - r)) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    exact perfectMatching_extend_card G S r hS
  · intro B hB
    exact perfectMatching_extension_bound G f hf he hn B r hB

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_indepCount_eq_zero 143b4289e70c539c7ab1aaa3506a5e439db125d947ce131c9ce6e5437e6ea829
namespace Erdos993G1.C1LA2

lemma perfectMatching_indepCount_eq_zero {X : Type u} [Finite X] {m : ℕ}
    (G : SimpleGraph X) (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (hn : Nat.card X = 2 * m) (k : ℕ) (hk : m < k) :
    Erdos993G1.indepCount G k = 0 := by
  classical
  letI := Fintype.ofFinite X
  have hMuniv : Finset.univ.image f = (Finset.univ : Finset X) :=
    perfectMatching_endpoints_univ f hf hn
  have hempty : G.indepSetFinset k = ∅ := by
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro S hS
    have hSmem := SimpleGraph.mem_indepSetFinset_iff.mp hS
    have hSsup := perfectMatching_support G f hf he S hSmem.isIndepSet
    rw [hMuniv, Finset.inter_univ, hSmem.card_eq] at hSsup
    omega
  have heq := indepCount_eq_indepSetFinset_card (G := G) k
  rw [hempty] at heq
  simpa using heq

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_containment e97fbc014149f5c60267db2cb3f55b43ad7766bd5855aee91d0abe9396a910e6
namespace Erdos993G1.C1LA2

lemma perfectMatching_containment {X : Type u} [Finite X] {m : ℕ}
    (G : SimpleGraph X) (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (hn : Nat.card X = 2 * m) (r : ℕ) :
    ((r : ℤ) + 1) * Erdos993G1.indepCount G (r + 1) ≤
      ((2 * (m - r) : ℕ) : ℤ) * Erdos993G1.indepCount G r := by
  classical
  letI := Fintype.ofFinite X
  have hnat := perfectMatching_containment_nat G f hf he hn r
  have hLeq : Erdos993G1.indepCount G (r + 1) = ((G.indepSetFinset (r + 1)).card : ℤ) :=
    indepCount_eq_indepSetFinset_card (G := G) (r + 1)
  have hReq : Erdos993G1.indepCount G r = ((G.indepSetFinset r).card : ℤ) :=
    indepCount_eq_indepSetFinset_card (G := G) r
  rw [hLeq, hReq]
  exact_mod_cast hnat

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.C1LA2.perfectMatching_threshold_arith 53e223343a40a27b3a5d4cbd403231a8277159fdd2ddd03585caf6247e13dd7d
namespace Erdos993G1.C1LA2

lemma perfectMatching_threshold_arith (m r : ℕ) (hr : 2 * m ≤ 3 * r + 1) :
    ((2 * (m - r) : ℕ) : ℤ) ≤ (r : ℤ) + 1 := by
  have h : 2 * (m - r) ≤ r + 1 := by omega
  exact_mod_cast h

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN theorem Erdos993G1.C1LA2.perfectMatching_delta_nonpos 1f0618389a64ee99e07ede8696c901d279aa414cc73f94c89ce92fb380d0513e
namespace Erdos993G1.C1LA2

theorem perfectMatching_delta_nonpos {X : Type u} [Finite X]
    (G : SimpleGraph X) (m r : ℕ) (hn : Nat.card X = 2 * m) (hr : 2 * m ≤ 3 * r + 1)
    (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (r : ℤ) ≤ 0 := by
  classical
  letI := Fintype.ofFinite X
  have hnn : (0 : ℤ) ≤ Erdos993G1.indepCount G r := indepCount_nonneg_aux G r
  by_cases hrm : r < m
  · have hcont := perfectMatching_containment G f hf he hn r
    have hthr := perfectMatching_threshold_arith m r hr
    have hstep : ((r : ℤ) + 1) * Erdos993G1.indepCount G (r + 1) ≤
        ((r : ℤ) + 1) * Erdos993G1.indepCount G r :=
      le_trans hcont (mul_le_mul_of_nonneg_right hthr hnn)
    have hpos : (0 : ℤ) < (r : ℤ) + 1 := by positivity
    have hle : Erdos993G1.indepCount G (r + 1) ≤ Erdos993G1.indepCount G r :=
      le_of_mul_le_mul_left hstep hpos
    rw [delta_nat_aux G r]
    linarith
  · have hrm : m ≤ r := by omega
    have hzero1 : Erdos993G1.indepCount G (r + 1) = 0 :=
      perfectMatching_indepCount_eq_zero G f hf he hn (r + 1) (by omega)
    rw [delta_nat_aux G r, hzero1]
    linarith

end Erdos993G1.C1LA2
-- VERITYOS ENTRY 18 END

