import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition C4LA1.IsGraphLeaf 65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5
namespace C4LA1

variable {V : Type*}

/-- A graph leaf has exactly one adjacent vertex. -/
def IsGraphLeaf (G : SimpleGraph V) (v : V) : Prop :=
  ∃! u, G.Adj v u

end C4LA1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition C5LA1.support 8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The unique support (neighbour) of an original leaf `v`; unconstrained
(any value satisfying nothing further) off the leaf set. -/
noncomputable
def support (G : SimpleGraph V) (v : V) : V :=
  Classical.choose (p := fun u => C4LA1.IsGraphLeaf G v → G.Adj v u ∧ ∀ w, G.Adj v w → w = u)
    (by
      by_cases h : C4LA1.IsGraphLeaf G v
      · obtain ⟨u, hu, huniq⟩ := h
        exact ⟨u, fun _ => ⟨hu, huniq⟩⟩
      · exact ⟨v, fun hc => absurd hc h⟩)

end C5LA1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition C5LA1.H 55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `H_v = G - {v, s_v}`, realised as the deletion set for a leaf `v`. -/
noncomputable
def H (G : SimpleGraph V) (v : V) : Finset V :=
  {v, support G v}

end C5LA1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition C5LA1.R a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `R_v = G - N[s_v]`, realised as the deletion set for a leaf `v`. -/
noncomputable
def R (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  insert (support G v) (G.neighborFinset (support G v))

end C5LA1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition C5LA1.indepSetsAvoiding ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I_k(G - D)`: independent `k`-subsets of the original vertex type
avoiding the finite deletion set `D`. -/
def indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Finset (Finset V) :=
  ((Finset.univ \ D).powersetCard k).filter fun s : Finset V => G.IsIndepSet (s : Set V)

end C5LA1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition C5LA1.indepSetCount e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `i_k(G - D)`. -/
def indepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Nat :=
  (indepSetsAvoiding G D k).card

end C5LA1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition C5LA1.forwardDifferenceDel 60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `Delta_k(G - D) = i_(k+1)(G-D) - i_k(G-D)`. -/
def forwardDifferenceDel (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Int :=
  (indepSetCount G D (k + 1) : Int) - indepSetCount G D k

end C5LA1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition E993Interior.taggedFamily cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e
namespace E993Interior

noncomputable section

def taggedFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U W : Finset V) (k : ℕ) :
    Finset (Finset V) := by
  classical
  exact (U.powersetCard k).filter fun A =>
    G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W

end

end E993Interior
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition E993OrderBand.IsolateCoveredOn 5fea0a312d2a823a22457fa6ee7c4678dc213dc9769b28c8666a7e6076d40f86

universe u

namespace E993OrderBand

open Classical

def IsolateCoveredOn {V : Type*} (G : SimpleGraph V)
    (U W : Finset V) : Prop :=
  ∀ x, x ∈ U → (∀ y, y ∈ U → ¬ G.Adj x y) → x ∈ W

end E993OrderBand
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition E993OrderBand.IsolateCovered 9cd121085ef80e3bda770a14ae7cf7541fae5a60a393ad9c6ff6fdb5f597eb3e
namespace E993OrderBand

open Classical

def IsolateCovered {V : Type*} [Fintype V]
    (G : SimpleGraph V) (W : Finset V) : Prop :=
  IsolateCoveredOn G Finset.univ W

end E993OrderBand
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition E993OrderBand.markedCount 4796919f2d4d213861fb5945cc5714f975b5e35fc159dd2f79bac52317f5a96a
namespace E993OrderBand

open Classical

noncomputable
def markedCount {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (W : Finset V) (k : ℕ) : ℕ :=
  (E993Interior.taggedFamily G Finset.univ W k).card

end E993OrderBand
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition E993OrderBand.badFamily a5acd13e654713815689fc841b29df5c0d86080f4e187680fe8cb942e52ea501
namespace E993OrderBand

open Classical

noncomputable
def badFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) : Finset (Finset V) :=
  (E993Interior.taggedFamily G U W k).filter fun A =>
    ∀ x ∈ U, ∀ a ∈ A, ¬ G.Adj x a

end E993OrderBand
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition E993OrderBand.multiFamily 88a19664e1476ee366c6208b772713fb3edf9887bed94e488b2eac972157f983
namespace E993OrderBand

open Classical

noncomputable
def multiFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) : Finset (Finset V) :=
  (E993Interior.taggedFamily G U W (k + 1)).filter fun B =>
    2 ≤ (B ∩ W).card

end E993OrderBand
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition E993OrderBand.extensionSet 0ac43a1cff9e6eb8701df19a7df816ce9ef83a1cdcfea0891f5103151effb6eb
namespace E993OrderBand

open Classical

noncomputable
def extensionSet {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U A : Finset V) : Finset V :=
  U.filter fun y => y ∉ A ∧ G.IsIndepSet ((insert y A : Finset V) : Set V)

end E993OrderBand
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition E993OrderBand.goodFamily d021fafb8ef81ef622b83b32409613d0dd6dc501674422dc62edb0708f81a62e
namespace E993OrderBand

open Classical

noncomputable
def goodFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) : Finset (Finset V) :=
  (E993Interior.taggedFamily G U W k).filter fun A =>
    ∃ x ∈ U, ∃ a ∈ A, G.Adj x a

end E993OrderBand
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma E993OrderBand.bad_into_multi 1722e7c799d95719d57c8fb09320c3bb33a97ef4825a03636a051658ecc1464a
namespace E993OrderBand

open Classical

lemma bad_into_multi {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 2 ≤ k)
    (y : V) (hyU : y ∈ U) (hy : ∃ z ∈ U, G.Adj y z)
    (hcover : IsolateCoveredOn G U W) :
    (badFamily G U W k).card ≤ (multiFamily G U W k).card := by
  classical
  apply Finset.card_le_card_of_injOn (fun A : Finset V => insert y A)
  · intro A hA
    obtain ⟨hAtag, hbad⟩ := Finset.mem_filter.mp hA
    obtain ⟨⟨hAU, hcard⟩, hI, _⟩ :
        (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
      simpa only [badFamily, E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] using hAtag
    have hyA : y ∉ A := by
      obtain ⟨z, hzU, hyz⟩ := hy
      intro hya
      exact hbad z hzU y hya hyz.symm
    have hAI : G.IsIndepSet ((insert y A : Finset V) : Set V) := by
      rw [SimpleGraph.isIndepSet_iff] at hI ⊢
      intro a ha b hb hab hadj
      simp only [Finset.coe_insert, Set.mem_insert_iff, Finset.mem_coe] at ha hb
      rcases ha with ha | ha
      · rcases hb with hb | hb
        · subst a; subst b; exact hab rfl
        · subst a; exact hbad y hyU b hb hadj
      · rcases hb with hb | hb
        · subst b; exact hbad y hyU a ha hadj.symm
        · exact hI ha hb hab hadj
    have hmarks : A ⊆ W := by
      intro a ha
      apply hcover a (hAU ha)
      intro z hz hadj
      exact hbad z hz a ha hadj.symm
    have hmulti : 2 ≤ ((insert y A) ∩ W).card := by
      have hsub : A ⊆ (insert y A) ∩ W := by
        intro a ha
        simp only [Finset.mem_inter, Finset.mem_insert]
        exact ⟨Or.inr ha, hmarks ha⟩
      have hle := Finset.card_le_card hsub
      omega
    apply Finset.mem_filter.mpr
    constructor
    · simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
      refine ⟨⟨?_, ?_⟩, hAI, ?_⟩
      · exact Finset.insert_subset hyU hAU
      · rw [Finset.card_insert_of_notMem hyA, hcard]
      · exact Finset.not_disjoint_iff.mpr
          (by obtain ⟨a, ha, haw⟩ := Finset.not_disjoint_iff.mp ‹¬ Disjoint A W›
              exact ⟨a, Finset.mem_insert_of_mem ha, haw⟩)
    · exact hmulti
  · intro A hA B hB heq
    have hyA : y ∉ A := by
      obtain ⟨z, hzU, hyz⟩ := hy
      intro hya
      exact (Finset.mem_filter.mp hA).2 z hzU y hya hyz.symm
    have hyB : y ∉ B := by
      obtain ⟨z, hzU, hyz⟩ := hy
      intro hyb
      exact (Finset.mem_filter.mp hB).2 z hzU y hyb hyz.symm
    have herase := congrArg (fun S : Finset V => S.erase y) heq
    simpa [hyA, hyB] using herase

end E993OrderBand
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma E993OrderBand.multi_deletion_marked bbdedcdcc8715fc72b3eac7f6e64109398db34fc5ef78f27a8fd37a569089a01
namespace E993OrderBand

open Classical

lemma multi_deletion_marked {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (B : Finset V)
    (hB : B ∈ multiFamily G U W k) (v : V) (hv : v ∈ B) :
    B.erase v ∈ E993Interior.taggedFamily G U W k := by
  classical
  obtain ⟨hBtag, hmulti⟩ := Finset.mem_filter.mp hB
  obtain ⟨⟨hBU, hcard⟩, hI, _⟩ :
      (B ⊆ U ∧ B.card = k + 1) ∧ G.IsIndepSet (B : Set V) ∧ ¬ Disjoint B W := by
    simpa only [multiFamily, E993Interior.taggedFamily, Finset.mem_filter,
      Finset.mem_powersetCard] using hBtag
  obtain ⟨a, ha, b, hb, hab⟩ := Finset.one_lt_card.mp (show 1 < (B ∩ W).card by omega)
  have hmark : ¬ Disjoint (B.erase v) W := by
    apply Finset.not_disjoint_iff.mpr
    rcases eq_or_ne a v with haeq | hav
    · have hb' : b ≠ v := by
        intro h
        exact hab (haeq.trans h.symm)
      exact ⟨b, Finset.mem_erase.mpr ⟨hb', (Finset.mem_inter.mp hb).1⟩,
        (Finset.mem_inter.mp hb).2⟩
    · exact ⟨a, Finset.mem_erase.mpr ⟨hav, (Finset.mem_inter.mp ha).1⟩,
        (Finset.mem_inter.mp ha).2⟩
  simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
  refine ⟨⟨(Finset.erase_subset v B).trans hBU, ?_⟩,
    hI.mono (by exact_mod_cast Finset.erase_subset v B), hmark⟩
  rw [Finset.card_erase_of_mem hv]
  omega

end E993OrderBand
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma E993OrderBand.multi_lower_degree f76deeb36c2fbe0ebcc55b70cab9ab1b738ac5b8faaf15fa85d76885ca3c7fe7
namespace E993OrderBand

open Classical

lemma multi_lower_degree {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (B : Finset V)
    (hB : B ∈ multiFamily G U W k) :
    k + 1 ≤ ((E993Interior.taggedFamily G U W k).bipartiteAbove
      (fun B A => A ⊆ B) B).card := by
  classical
  have hcard : B.card = k + 1 := by
    have h := (Finset.mem_filter.mp hB).1
    simp only [E993Interior.taggedFamily, Finset.mem_filter,
      Finset.mem_powersetCard] at h
    exact h.1.2
  have hsub : (B.image B.erase) ⊆
      (E993Interior.taggedFamily G U W k).bipartiteAbove (fun B A => A ⊆ B) B := by
    intro A hA
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hA
    simp only [Finset.mem_bipartiteAbove]
    exact ⟨multi_deletion_marked G U W k B hB v hv, Finset.erase_subset v B⟩
  calc
    k + 1 = (B.image B.erase).card := by
      rw [Finset.card_image_of_injOn (Finset.erase_injOn B)]
      exact hcard.symm
    _ ≤ _ := Finset.card_le_card hsub

end E993OrderBand
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma E993OrderBand.lower_degree 09a61a2d71c81906e2e1ae9413431a5359cadf3f7b50dc07aaad58a4a091f5c3
namespace E993OrderBand

open Classical

lemma lower_degree {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (B : Finset V)
    (hB : B ∈ E993Interior.taggedFamily G U W (k + 1)) :
    k ≤ ((E993Interior.taggedFamily G U W k).bipartiteAbove
      (fun B A => A ⊆ B) B).card := by
  classical
  simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] at hB
  obtain ⟨⟨hBU, hBcard⟩, hBind, hBtag⟩ := hB
  obtain ⟨w, hwB, hwW⟩ := Finset.not_disjoint_iff.mp hBtag
  have hsub : (B.erase w).image B.erase ⊆
      (E993Interior.taggedFamily G U W k).bipartiteAbove (fun B A => A ⊆ B) B := by
    intro A hA
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hA
    have hvB : v ∈ B := (Finset.mem_erase.mp hv).2
    have hvw : v ≠ w := (Finset.mem_erase.mp hv).1
    have hcard : (B.erase v).card = k := by
      rw [Finset.card_erase_of_mem hvB]
      omega
    have htag : ¬ Disjoint (B.erase v) W :=
      Finset.not_disjoint_iff.mpr ⟨w, Finset.mem_erase.mpr ⟨Ne.symm hvw, hwB⟩, hwW⟩
    have hmem : B.erase v ∈ E993Interior.taggedFamily G U W k := by
      simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
      exact ⟨⟨(Finset.erase_subset v B).trans hBU, hcard⟩,
        hBind.mono (by exact_mod_cast Finset.erase_subset v B), htag⟩
    simp only [Finset.mem_bipartiteAbove]
    exact ⟨hmem, Finset.erase_subset v B⟩
  have hi : ((B.erase w).image B.erase).card = k := by
    rw [Finset.card_image_of_injOn ((Finset.erase_injOn B).mono (Finset.erase_subset w B))]
    rw [Finset.card_erase_of_mem hwB]
    omega
  calc
    k = ((B.erase w).image B.erase).card := hi.symm
    _ ≤ _ := Finset.card_le_card hsub

end E993OrderBand
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma E993OrderBand.upper_degree_le_extensions 6abf0ab0bf6a36d6dbd821de0bfedd3018c9640c8204fb34c72879fce1b7ef1c
namespace E993OrderBand

open Classical

lemma upper_degree_le_extensions {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (A : Finset V)
    (hA : A ∈ E993Interior.taggedFamily G U W k) :
    ((E993Interior.taggedFamily G U W (k + 1)).bipartiteBelow
      (fun B A => A ⊆ B) A).card ≤ (extensionSet G U A).card := by
  classical
  obtain ⟨⟨hAU, hAcard⟩, hAind, _⟩ :
      (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
    simpa only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] using hA
  have hmap : ((E993Interior.taggedFamily G U W (k + 1)).bipartiteBelow
      (fun B A => A ⊆ B) A).card ≤ ((extensionSet G U A).powersetCard 1).card := by
    apply Finset.card_le_card_of_injOn (fun B : Finset V => B \ A)
    · intro B hB
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hB
      obtain ⟨hB, hAB⟩ := hB
      obtain ⟨⟨hBU, hBcard⟩, hBind, _⟩ :
          (B ⊆ U ∧ B.card = k + 1) ∧ G.IsIndepSet (B : Set V) ∧ ¬ Disjoint B W := by
        simpa only [E993Interior.taggedFamily, Finset.mem_filter,
          Finset.mem_powersetCard] using hB
      apply Finset.mem_powersetCard.mpr
      constructor
      · intro y hy
        have hyB : y ∈ B := (Finset.mem_sdiff.mp hy).1
        have hyA : y ∉ A := (Finset.mem_sdiff.mp hy).2
        apply Finset.mem_filter.mpr
        refine ⟨hBU hyB, hyA, ?_⟩
        apply hBind.mono
        exact_mod_cast (show insert y A ⊆ B from Finset.insert_subset hyB hAB)
      · rw [Finset.card_sdiff_of_subset hAB]
        omega
    · intro B hB C hC hBC
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hB hC
      exact (Finset.superset_injOn_sdiff A) hB.2 hC.2 hBC
  simpa [Finset.card_powersetCard] using hmap

end E993OrderBand
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma E993OrderBand.extensionSet_subset ebfb7cfd6943e870450ef74275fc7d364d0c5f798523b8f830c1d7ea968e5b92
namespace E993OrderBand

open Classical

lemma extensionSet_subset {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U A : Finset V) :
    extensionSet G U A ⊆ U \ A := by
  intro y hy
  obtain ⟨hyU, hyA, _⟩ := Finset.mem_filter.mp hy
  exact Finset.mem_sdiff.mpr ⟨hyU, hyA⟩

end E993OrderBand
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma E993OrderBand.extensionSet_card_le e17e205121315f5ba7b647f3bb7945c7fa23a1ee418df7026e997f14186edfed
namespace E993OrderBand

open Classical

lemma extensionSet_card_le {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U A : Finset V) (hAU : A ⊆ U) :
    (extensionSet G U A).card + A.card ≤ U.card := by
  have h := Finset.card_le_card (extensionSet_subset G U A)
  rw [Finset.card_sdiff_of_subset hAU] at h
  have hcard := Finset.card_le_card hAU
  omega

end E993OrderBand
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma E993OrderBand.extensionSet_card_lt_of_neighbor 00bc8a3d1d27b6b01b905f0c139f3355899d6939aa210d8d3fe300753423c686
namespace E993OrderBand

open Classical

lemma extensionSet_card_lt_of_neighbor {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U A : Finset V) (hAU : A ⊆ U)
    (hI : G.IsIndepSet (A : Set V))
    (hx : ∃ x ∈ U, ∃ a ∈ A, G.Adj x a) :
    (extensionSet G U A).card + A.card < U.card := by
  obtain ⟨x, hxU, a, haA, hxa⟩ := hx
  have hxA : x ∉ A := by
    intro hxA
    exact (G.isIndepSet_iff.mp hI) hxA haA hxa.ne hxa
  have hxE : x ∉ extensionSet G U A := by
    intro hxE
    have hi : G.IsIndepSet ((insert x A : Finset V) : Set V) :=
      (Finset.mem_filter.mp hxE).2.2
    have hp := G.isIndepSet_iff.mp hi
    exact hp (by simp) (by simp [haA]) hxa.ne hxa
  have hsub := extensionSet_subset G U A
  have hssub : extensionSet G U A ⊂ U \ A :=
    (Finset.ssubset_iff_of_subset hsub).mpr
      ⟨x, Finset.mem_sdiff.mpr ⟨hxU, hxA⟩, hxE⟩
  have hlt := Finset.card_lt_card hssub
  rw [Finset.card_sdiff_of_subset hAU] at hlt
  have hcard := Finset.card_le_card hAU
  omega

end E993OrderBand
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma E993OrderBand.incidence_bound d511f56f022dbea03070935fcf325973e6efa9b5e5c684d70c7e05d520e4fe93
namespace E993OrderBand

open Classical

lemma incidence_bound {α β : Type*} [DecidableEq α] [DecidableEq β]
    (s : Finset α) (t : Finset β) (r : α → β → Prop)
    [∀ a b, Decidable (r a b)]
    (sm : Finset α) (tg : Finset β) (k m : ℕ)
    (hsm : sm ⊆ s) (htg : tg ⊆ t)
    (hlow : ∀ b ∈ s,
      k + (if b ∈ sm then 1 else 0) ≤ (t.bipartiteAbove r b).card)
    (hup : ∀ a ∈ t,
      (s.bipartiteBelow r a).card + k + (if a ∈ tg then 1 else 0) ≤ m) :
    k * s.card + sm.card + k * t.card + tg.card ≤ m * t.card := by
  classical
  have hleft := Finset.sum_le_sum (s := s) hlow
  have hright := Finset.sum_le_sum (s := t) hup
  have hdouble := Finset.sum_card_bipartiteAbove_eq_sum_card_bipartiteBelow
    (r := r) (s := s) (t := t)
  have hsm_sum : (∑ b ∈ s, if b ∈ sm then (1 : ℕ) else 0) = sm.card :=
    (Finset.card_eq_sum_ite hsm).symm
  have htg_sum : (∑ a ∈ t, if a ∈ tg then (1 : ℕ) else 0) = tg.card :=
    (Finset.card_eq_sum_ite htg).symm
  simp only [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul] at hleft hright
  simp only [hsm_sum, htg_sum] at hleft hright
  rw [hdouble] at hleft
  nlinarith

end E993OrderBand
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma E993OrderBand.marked_incidence_bound d3ec8a224a68536858a5391099ab826e63b9f08310dbf1b5019ea3ff3332ac69
namespace E993OrderBand

open Classical

lemma marked_incidence_bound {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) :
    k * (E993Interior.taggedFamily G U W (k + 1)).card +
      (multiFamily G U W k).card +
      k * (E993Interior.taggedFamily G U W k).card +
      (goodFamily G U W k).card ≤
      U.card * (E993Interior.taggedFamily G U W k).card := by
  classical
  apply incidence_bound
    (E993Interior.taggedFamily G U W (k + 1))
    (E993Interior.taggedFamily G U W k)
    (fun B A => A ⊆ B)
    (multiFamily G U W k) (goodFamily G U W k) k U.card
  · exact Finset.filter_subset _ _
  · exact Finset.filter_subset _ _
  · intro B hB
    by_cases hmulti : B ∈ multiFamily G U W k
    · simpa [hmulti] using multi_lower_degree G U W k B hmulti
    · simpa [hmulti] using lower_degree G U W k B hB
  · intro A hA
    obtain ⟨⟨hAU, hAcard⟩, hI, _⟩ :
        (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
      simpa only [E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] using hA
    have hdegree := upper_degree_le_extensions G U W k A hA
    by_cases hgood : A ∈ goodFamily G U W k
    · have hneighbor : ∃ x ∈ U, ∃ a ∈ A, G.Adj x a :=
        (Finset.mem_filter.mp hgood).2
      have hstrict := extensionSet_card_lt_of_neighbor G U A hAU hI hneighbor
      simp only [if_pos hgood]
      omega
    · have hweak := extensionSet_card_le G U A hAU
      simp only [if_neg hgood]
      omega

end E993OrderBand
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma E993OrderBand.bad_good_partition 946b286bc156c59793d33159c56eee5d7c99e41db971e2c08dc8ce43efc8e617
namespace E993OrderBand

open Classical

lemma bad_good_partition {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) :
    (badFamily G U W k).card + (goodFamily G U W k).card =
      (E993Interior.taggedFamily G U W k).card := by
  classical
  have hcomp : badFamily G U W k =
      (E993Interior.taggedFamily G U W k).filter
        (fun A => ¬ ∃ x ∈ U, ∃ a ∈ A, G.Adj x a) := by
    ext A
    simp only [badFamily, Finset.mem_filter]
    constructor
    · rintro ⟨hA, hbad⟩
      refine ⟨hA, ?_⟩
      rintro ⟨x, hx, a, ha, hadj⟩
      exact hbad x hx a ha hadj
    · rintro ⟨hA, hnot⟩
      refine ⟨hA, ?_⟩
      intro x hx a ha hadj
      exact hnot ⟨x, hx, a, ha, hadj⟩
  have hsplit := Finset.card_filter_add_card_filter_not
    (s := E993Interior.taggedFamily G U W k)
    (p := fun A : Finset V => ∃ x ∈ U, ∃ a ∈ A, G.Adj x a)
  rw [hcomp]
  simpa only [goodFamily, add_comm] using hsplit

end E993OrderBand
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma E993OrderBand.marked_bound_of_nonisolate 0bba14fac8f091cf3f58dbef60d4aea85e394b303e4cadf45d250aa55f979026
namespace E993OrderBand

open Classical

lemma marked_bound_of_nonisolate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 2 ≤ k)
    (hm : U.card ≤ 2 * k + 1)
    (hcover : IsolateCoveredOn G U W)
    (y : V) (hyU : y ∈ U) (hy : ∃ z ∈ U, G.Adj y z) :
    (E993Interior.taggedFamily G U W (k + 1)).card ≤
      (E993Interior.taggedFamily G U W k).card := by
  have hi := marked_incidence_bound G U W k
  have hpart := bad_good_partition G U W k
  have hbad := bad_into_multi G U W k hk y hyU hy hcover
  have hmul := Nat.mul_le_mul_right
    (E993Interior.taggedFamily G U W k).card hm
  have hkpos : 0 < k := by omega
  nlinarith

end E993OrderBand
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma E993OrderBand.marked_bound_below_even 68154e9aeec357883e1aa2f208f4cbf9f5d2e511d0e11ec801825dc308df4abb
namespace E993OrderBand

open Classical

lemma marked_bound_below_even {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 1 ≤ k)
    (hm : U.card ≤ 2 * k) :
    (E993Interior.taggedFamily G U W (k + 1)).card ≤
      (E993Interior.taggedFamily G U W k).card := by
  have hi := marked_incidence_bound G U W k
  have hmul := Nat.mul_le_mul_right
    (E993Interior.taggedFamily G U W k).card hm
  have hkpos : 0 < k := by omega
  nlinarith

end E993OrderBand
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma E993OrderBand.bad_into_multi_edgeless b84c1355702a253426d650a11e301f60f72fd4e5e00385c579e754be7e4ecbaa
namespace E993OrderBand

open Classical

lemma bad_into_multi_edgeless {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 2 ≤ k)
    (hm : U.card = 2 * k + 1)
    (hcover : IsolateCoveredOn G U W)
    (hno : ∀ y ∈ U, ∀ z ∈ U, ¬ G.Adj y z) :
    (badFamily G U W k).card ≤ (multiFamily G U W k).card := by
  classical
  have hUW : U ⊆ W := by
    intro y hy
    exact hcover y hy (hno y hy)
  apply Finset.card_le_card_of_injOn (fun A : Finset V => U \ A)
  · intro A hA
    have htag := (Finset.mem_filter.mp hA).1
    obtain ⟨⟨hAU, hcard⟩, _, _⟩ :
        (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
      simpa only [E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] using htag
    have hcard' : (U \ A).card = k + 1 := by
      rw [Finset.card_sdiff_of_subset hAU, hm, hcard]
      omega
    have hsub : U \ A ⊆ U := Finset.sdiff_subset
    have hI : G.IsIndepSet ((U \ A : Finset V) : Set V) := by
      rw [SimpleGraph.isIndepSet_iff]
      intro x hx y hy _ hxy
      exact hno x (hsub hx) y (hsub hy) hxy
    have hmarks : U \ A ⊆ W := hsub.trans hUW
    have hmark : ¬ Disjoint (U \ A) W := by
      have hpos : 0 < (U \ A).card := by omega
      obtain ⟨x, hx⟩ := Finset.card_pos.mp hpos
      exact Finset.not_disjoint_iff.mpr ⟨x, hx, hmarks hx⟩
    have hmulti : 2 ≤ ((U \ A) ∩ W).card := by
      have heq : (U \ A) ∩ W = U \ A :=
        Finset.inter_eq_left.mpr hmarks
      rw [heq, hcard']
      omega
    apply Finset.mem_filter.mpr
    constructor
    · simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
      exact ⟨⟨hsub, hcard'⟩, hI, hmark⟩
    · exact hmulti
  · intro A hA B hB heq
    have hAU : A ⊆ U := by
      have h := (Finset.mem_filter.mp hA).1
      simp only [E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] at h
      exact h.1.1
    have hBU : B ⊆ U := by
      have h := (Finset.mem_filter.mp hB).1
      simp only [E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] at h
      exact h.1.1
    have heq' := congrArg (fun S : Finset V => U \ S) heq
    simpa [Finset.sdiff_sdiff_eq_self hAU,
      Finset.sdiff_sdiff_eq_self hBU] using heq'

end E993OrderBand
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma E993OrderBand.relativeOrderBand 71eee2ccea0716b8d44683ae236bbadf9ccc692009fb99d7f79943ba854bcb6d
namespace E993OrderBand

open Classical

lemma relativeOrderBand {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 2 ≤ k)
    (hm : U.card ≤ 2 * k + 1)
    (hcover : IsolateCoveredOn G U W) :
    (E993Interior.taggedFamily G U W (k + 1)).card ≤
      (E993Interior.taggedFamily G U W k).card := by
  by_cases hsmall : U.card ≤ 2 * k
  · exact marked_bound_below_even G U W k (by omega) hsmall
  have heq : U.card = 2 * k + 1 := by omega
  by_cases hex : ∃ y ∈ U, ∃ z ∈ U, G.Adj y z
  · obtain ⟨y, hyU, z, hzU, hyz⟩ := hex
    exact marked_bound_of_nonisolate G U W k hk hm hcover y hyU ⟨z, hzU, hyz⟩
  · have hno : ∀ y ∈ U, ∀ z ∈ U, ¬ G.Adj y z := by
      intro y hy z hz hadj
      exact hex ⟨y, hy, z, hz, hadj⟩
    have hi := marked_incidence_bound G U W k
    have hpart := bad_good_partition G U W k
    have hbad := bad_into_multi_edgeless G U W k hk heq hcover hno
    have hmul := Nat.mul_le_mul_right
      (E993Interior.taggedFamily G U W k).card hm
    have hkpos : 0 < k := by omega
    nlinarith

end E993OrderBand
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma E993OrderBand.wholeGraphOrderBand 08d50aedb76096fe513793225ae035a0b0b9e4a661717aa89442c16929596bbf
namespace E993OrderBand

open Classical

lemma wholeGraphOrderBand {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (W : Finset V) (k : ℕ)
    (hcover : IsolateCovered G W) (hk : 2 ≤ k)
    (hm : Fintype.card V ≤ 2 * k + 1) :
    markedCount G W (k + 1) ≤ markedCount G W k := by
  have hcard : (Finset.univ : Finset V).card ≤ 2 * k + 1 := by
    simpa using hm
  exact relativeOrderBand G Finset.univ W k hk hcard hcover

end E993OrderBand
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma E993OrderBand.support_spec 06eb6e39a78dcc278cdbf39e88a7a80ccc95380429b923534af4aae2abcc0963
namespace E993OrderBand

open Classical

lemma support_spec {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) :
    C4LA1.IsGraphLeaf G v →
      G.Adj v (C5LA1.support G v) ∧
        ∀ w, G.Adj v w → w = C5LA1.support G v := by
  unfold C5LA1.support
  have hex : ∃ u, C4LA1.IsGraphLeaf G v →
      G.Adj v u ∧ ∀ w, G.Adj v w → w = u := by
    by_cases hv : C4LA1.IsGraphLeaf G v
    · obtain ⟨u, hu, huniq⟩ := hv
      exact ⟨u, fun _ => ⟨hu, huniq⟩⟩
    · exact ⟨v, fun hc => absurd hc hv⟩
  exact Classical.choose_spec hex

end E993OrderBand
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma E993OrderBand.support_adj b3951f0851be5056028203045c0270a2e3fcd32ea44ae32b99a40fe52cc12fc2
namespace E993OrderBand

open Classical

lemma support_adj {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    G.Adj v (C5LA1.support G v) :=
  (support_spec G v hv).1

end E993OrderBand
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma E993OrderBand.support_unique a2726530c4acfa5a926fe94b75980c80abf420115d327b532db4f95870e612dd
namespace E993OrderBand

open Classical

lemma support_unique {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    {w : V} (hw : G.Adj v w) : w = C5LA1.support G v :=
  (support_spec G v hv).2 w hw

end E993OrderBand
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma E993OrderBand.H_subset_R 920c66b4c98faa8fffbb4714d43c940bcbcb907df37e00df875e14783749143d
namespace E993OrderBand

open Classical

lemma H_subset_R {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v : V)
    (hv : C4LA1.IsGraphLeaf G v) : C5LA1.H G v ⊆ C5LA1.R G v := by
  intro x hx
  simp only [C5LA1.H, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with hx | hx
  · rw [hx]
    exact Finset.mem_insert_of_mem
      ((G.mem_neighborFinset (C5LA1.support G v) v).mpr
        ((support_adj G v hv).symm))
  · rw [hx]
    exact Finset.mem_insert_self _ _

end E993OrderBand
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma E993OrderBand.H_card 15b4dd5570b1695d5b599e0023d7b36f0cdc9500fe2a73d6214c37e6bf280a62
namespace E993OrderBand

open Classical

lemma H_card {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    (C5LA1.H G v).card = 2 := by
  have hne : v ≠ C5LA1.support G v := (support_adj G v hv).ne
  simp [C5LA1.H, hne]

end E993OrderBand
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma E993OrderBand.leaf_isolate_covered 4fb1045d210f79ea4055e3830b6e3175796bf93eb63bf38e4b2719f16a2c501e
namespace E993OrderBand

open Classical

lemma leaf_isolate_covered {V : Type*} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (v : V) (hT : T.IsTree) (hv : C4LA1.IsGraphLeaf T v) :
    IsolateCoveredOn T (Finset.univ \ C5LA1.H T v)
      (C5LA1.R T v \ C5LA1.H T v) := by
  intro x hx hnon
  let s := C5LA1.support T v
  have hvs : T.Adj v s := support_adj T v hv
  letI : Nontrivial V := nontrivial_of_ne v s hvs.ne
  obtain ⟨z, hxz⟩ := hT.connected.preconnected.exists_adj_of_nontrivial x
  have hxH : x ∉ C5LA1.H T v := (Finset.mem_sdiff.mp hx).2
  have hzH : z ∈ C5LA1.H T v := by
    by_contra hzH
    exact hnon z (Finset.mem_sdiff.mpr ⟨Finset.mem_univ z, hzH⟩) hxz
  have hz : z = v ∨ z = s := by
    simpa only [C5LA1.H, Finset.mem_insert, Finset.mem_singleton] using hzH
  have hzs : z = s := by
    rcases hz with hzv | hzs
    · have hxs : x = s := support_unique T v hv (by simpa only [hzv] using hxz.symm)
      have hsH : s ∈ C5LA1.H T v := by simp [C5LA1.H, s]
      exact False.elim (hxH (by simpa only [hxs] using hsH))
    · exact hzs
  have hxsadj : T.Adj s x := by simpa only [hzs] using hxz.symm
  apply Finset.mem_sdiff.mpr
  constructor
  · exact Finset.mem_insert_of_mem ((T.mem_neighborFinset s x).mpr hxsadj)
  · exact hxH

end E993OrderBand
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma E993OrderBand.retained_card 058f3891961e554c4e922ce094cc01daee41d94c14357e65ec567c5646312c89
namespace E993OrderBand

open Classical

lemma retained_card {V : Type*} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf T v) :
    (Finset.univ \ C5LA1.H T v).card + 2 = Fintype.card V := by
  have hsub : C5LA1.H T v ⊆ Finset.univ := Finset.subset_univ _
  rw [Finset.card_sdiff_of_subset hsub, H_card T v hv]
  have hle := Finset.card_le_card hsub
  rw [H_card T v hv] at hle
  simp only [Finset.card_univ] at *
  omega

end E993OrderBand
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma E993OrderBand.tagged_count_split 85527f25b4e7399f44404ebc52f3e95d34169f9a59e77955850efdac449e3203
namespace E993OrderBand

open Classical

lemma tagged_count_split {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (D E : Finset V) (hDE : D ⊆ E) (k : ℕ) :
    C5LA1.indepSetCount G D k =
      (E993Interior.taggedFamily G (Finset.univ \ D) E k).card +
        C5LA1.indepSetCount G E k := by
  classical
  let F := C5LA1.indepSetsAvoiding G D k
  have htag : F.filter (fun A => ¬ Disjoint A E) =
      E993Interior.taggedFamily G (Finset.univ \ D) E k := by
    ext A
    simp only [F, C5LA1.indepSetsAvoiding, E993Interior.taggedFamily,
      Finset.mem_filter, Finset.mem_powersetCard]
    tauto
  have hsubset (A : Finset V) :
      A ⊆ Finset.univ \ E ↔ A ⊆ Finset.univ \ D ∧ Disjoint A E := by
    constructor
    · intro hAE
      constructor
      · intro x hx
        have he := Finset.mem_sdiff.mp (hAE hx)
        exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, fun hd => he.2 (hDE hd)⟩
      · apply Finset.disjoint_left.mpr
        intro x hx
        exact (Finset.mem_sdiff.mp (hAE hx)).2
    · rintro ⟨_, hDis⟩
      intro x hx
      exact Finset.mem_sdiff.mpr
        ⟨Finset.mem_univ _, (Finset.disjoint_left.mp hDis) hx⟩
  have havoid : F.filter (fun A => ¬ ¬ Disjoint A E) =
      C5LA1.indepSetsAvoiding G E k := by
    ext A
    simp only [F, C5LA1.indepSetsAvoiding,
      Finset.mem_filter, Finset.mem_powersetCard]
    rw [hsubset]
    tauto
  have hsplit := Finset.card_filter_add_card_filter_not
    (s := F) (fun A : Finset V => ¬ Disjoint A E)
  rw [htag, havoid] at hsplit
  exact hsplit.symm

end E993OrderBand
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma E993OrderBand.tagged_marks_sdiff a72d9eb3d7c8053bf7c31173cdd8b6757caf27469d7552a8034330488ad23c22
namespace E993OrderBand

open Classical

lemma tagged_marks_sdiff {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (D E : Finset V) (k : ℕ) :
    E993Interior.taggedFamily G (Finset.univ \ D) E k =
      E993Interior.taggedFamily G (Finset.univ \ D) (E \ D) k := by
  classical
  ext A
  simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
  constructor
  · rintro ⟨⟨hAU, hcard⟩, hI, hmark⟩
    obtain ⟨x, hxA, hxE⟩ := Finset.not_disjoint_iff.mp hmark
    have hxD : x ∉ D := (Finset.mem_sdiff.mp (hAU hxA)).2
    exact ⟨⟨hAU, hcard⟩, hI,
      Finset.not_disjoint_iff.mpr
        ⟨x, hxA, Finset.mem_sdiff.mpr ⟨hxE, hxD⟩⟩⟩
  · rintro ⟨⟨hAU, hcard⟩, hI, hmark⟩
    obtain ⟨x, hxA, hxED⟩ := Finset.not_disjoint_iff.mp hmark
    exact ⟨⟨hAU, hcard⟩, hI,
      Finset.not_disjoint_iff.mpr ⟨x, hxA, (Finset.mem_sdiff.mp hxED).1⟩⟩

end E993OrderBand
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma E993OrderBand.leaf_count_split 9cc4366ab56b8b3b84d4dd65a3a06cc30bb1752d4fe2356c052a9fbe9d66cb67
namespace E993OrderBand

open Classical

lemma leaf_count_split {V : Type*} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (v : V) (hv : C4LA1.IsGraphLeaf T v) (k : ℕ) :
    C5LA1.indepSetCount T (C5LA1.H T v) k =
      (E993Interior.taggedFamily T
        (Finset.univ \ C5LA1.H T v)
        (C5LA1.R T v \ C5LA1.H T v) k).card +
      C5LA1.indepSetCount T (C5LA1.R T v) k := by
  rw [← tagged_marks_sdiff T (C5LA1.H T v) (C5LA1.R T v) k]
  exact tagged_count_split T (C5LA1.H T v) (C5LA1.R T v)
    (H_subset_R T v hv) k

end E993OrderBand
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma E993OrderBand.ordinaryLeafOrderBand 36984376ac07174dc88baa0e418e83ce85d66a4b4223b17dc2fd94662db16834
namespace E993OrderBand

open Classical

lemma ordinaryLeafOrderBand {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (v : V) (p : ℕ)
    (hT : T.IsTree) (hv : C4LA1.IsGraphLeaf T v)
    (hp : 3 ≤ p) (hn : Fintype.card V ≤ 2 * p + 1) :
    C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
      C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0 := by
  let U := Finset.univ \ C5LA1.H T v
  let W := C5LA1.R T v \ C5LA1.H T v
  let k := p - 1
  have hk : 2 ≤ k := by omega
  have hpk : k + 1 = p := by omega
  have hcard := retained_card T v hv
  have hm : U.card ≤ 2 * k + 1 := by
    dsimp [U, k]
    omega
  have hcover : IsolateCoveredOn T U W := leaf_isolate_covered T v hT hv
  have hq := relativeOrderBand T U W k hk hm hcover
  rw [hpk] at hq
  have hsplit0 := leaf_count_split T v hv (p - 1)
  have hsplit1 := leaf_count_split T v hv p
  have hpk' : p - 1 + 1 = p := by omega
  unfold C5LA1.forwardDifferenceDel
  rw [hpk', hsplit0, hsplit1]
  dsimp [U, W, k] at hq
  omega

end E993OrderBand
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN theorem E993OrderBand.markedIsolateAndOrdinaryLeafOrderBand 571afd1eb42d4f96f46beddddef9291fcf95470d10d2b97099b00545ad0fa9c3
namespace E993OrderBand

open Classical

theorem markedIsolateAndOrdinaryLeafOrderBand :
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (G : SimpleGraph V) [DecidableRel G.Adj]
      (W : Finset V) (k : ℕ),
      E993OrderBand.IsolateCovered G W →
      2 ≤ k →
      Fintype.card V ≤ 2 * k + 1 →
      E993OrderBand.markedCount G W (k + 1) ≤
        E993OrderBand.markedCount G W k) ∧
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj]
      (v : V) (p : ℕ),
      T.IsTree →
      C4LA1.IsGraphLeaf T v →
      3 ≤ p →
      Fintype.card V ≤ 2 * p + 1 →
      C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
        C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0) := by
  constructor
  · intro V _ _ G _ W k hcover hk hm
    exact wholeGraphOrderBand G W k hcover hk hm
  · intro V _ _ T _ v p hT hv hp hn
    exact ordinaryLeafOrderBand T v p hT hv hp hn

end E993OrderBand
-- VERITYOS ENTRY 43 END

