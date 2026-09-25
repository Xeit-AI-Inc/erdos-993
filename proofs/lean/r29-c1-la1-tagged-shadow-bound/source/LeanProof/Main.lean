import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition E993Interior.taggedFamily cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e
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
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN lemma E993Interior.taggedShadowBound 50dcce4a7ad13fbb73361ff1235996a7bb79eeea2cf9435a752b1eab50d8583f
namespace E993Interior

open SimpleGraph

namespace Core

private lemma indep_union_color {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (c : G.Coloring (Fin 2))
    (A E : Finset V) (hA : G.IsIndepSet (A : Set V))
    (hcross : ∀ v ∈ E, ∀ u ∈ A, ¬ G.Adj v u)
    (z : Fin 2) :
    G.IsIndepSet ((A ∪ E.filter (fun v => c v = z) : Finset V) : Set V) := by
  rw [SimpleGraph.isIndepSet_iff] at hA ⊢
  intro v hv w hw hvw
  simp only [Finset.coe_union, Finset.coe_filter, Set.mem_union, Set.mem_setOf_eq,
    Finset.mem_coe] at hv hw
  rcases hv with hv | ⟨hvE, hvc⟩
  · rcases hw with hw | ⟨hwE, hwc⟩
    · exact hA hv hw hvw
    · exact fun hadj => hcross w hwE v hv (G.adj_symm hadj)
  · rcases hw with hw | ⟨hwE, hwc⟩
    · exact hcross v hvE w hw
    · exact fun hadj => c.valid hadj (hvc.trans hwc.symm)

private lemma card_extension_le {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (U A E : Finset V) (a : ℕ)
    (hAU : A ⊆ U) (hEU : E ⊆ U) (hAE : Disjoint A E)
    (hA : G.IsIndepSet (A : Set V))
    (hcross : ∀ v ∈ E, ∀ u ∈ A, ¬ G.Adj v u)
    (hcap : ∀ B : Finset V, B ⊆ U → G.IsIndepSet (B : Set V) → B.card ≤ a) :
    E.card ≤ 2 * (a - A.card) := by
  classical
  obtain ⟨c⟩ := hBip
  let P : Finset V := E.filter (fun v => c v = 0)
  let Q : Finset V := E.filter (fun v => c v ≠ 0)
  have hP : (A ∪ P).card ≤ a :=
    hcap (A ∪ P) (Finset.union_subset hAU (Finset.Subset.trans (Finset.filter_subset _ _) hEU))
      (indep_union_color G c A E hA hcross 0)
  have hQind : G.IsIndepSet ((A ∪ Q : Finset V) : Set V) := by
    have hq : Q = E.filter (fun v => c v = 1) := by
      ext v
      simp only [Q, Finset.mem_filter]
      constructor
      · rintro ⟨hv, hne⟩
        exact ⟨hv, by have hlt := (c v).isLt; omega⟩
      · rintro ⟨hv, heq⟩
        exact ⟨hv, by simp [heq]⟩
    rw [hq]
    exact indep_union_color G c A E hA hcross 1
  have hQ : (A ∪ Q).card ≤ a :=
    hcap (A ∪ Q) (Finset.union_subset hAU (Finset.Subset.trans (Finset.filter_subset _ _) hEU)) hQind
  have hdP : Disjoint A P := hAE.mono_right (Finset.filter_subset _ _)
  have hdQ : Disjoint A Q := hAE.mono_right (Finset.filter_subset _ _)
  have hp : A.card + P.card ≤ a := by simpa [Finset.card_union_of_disjoint hdP] using hP
  have hq : A.card + Q.card ≤ a := by simpa [Finset.card_union_of_disjoint hdQ] using hQ
  have he : P.card + Q.card = E.card := by
    simpa only [P, Q] using Finset.card_filter_add_card_filter_not (s := E) (p := fun v => c v = 0)
  omega


private lemma tagged_deletions_lower {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (B : Finset V)
    (hB : B ∈ taggedFamily G U W (k + 1)) :
    k ≤ ((taggedFamily G U W k).bipartiteAbove (fun B A => A ⊆ B) B).card := by
  classical
  simp only [taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] at hB
  obtain ⟨⟨hBU, hBcard⟩, hBind, hBtag⟩ := hB
  obtain ⟨w, hwB, hwW⟩ := Finset.not_disjoint_iff.mp hBtag
  have hsub : (B.erase w).image B.erase ⊆
      (taggedFamily G U W k).bipartiteAbove (fun B A => A ⊆ B) B := by
    intro A hA
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hA
    have hvB : v ∈ B := (Finset.mem_erase.mp hv).2
    have hvw : v ≠ w := (Finset.mem_erase.mp hv).1
    have hcard : (B.erase v).card = k := by
      rw [Finset.card_erase_of_mem hvB]
      omega
    have htag : ¬ Disjoint (B.erase v) W :=
      Finset.not_disjoint_iff.mpr ⟨w, Finset.mem_erase.mpr ⟨Ne.symm hvw, hwB⟩, hwW⟩
    have hmem : B.erase v ∈ taggedFamily G U W k := by
      simp only [taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
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

private lemma tagged_extensions_upper {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (U W : Finset V) (a k : ℕ)
    (hcap : ∀ B : Finset V, B ⊆ U → G.IsIndepSet (B : Set V) → B.card ≤ a)
    (A : Finset V) (hA : A ∈ taggedFamily G U W k) :
    ((taggedFamily G U W (k + 1)).bipartiteBelow (fun B A => A ⊆ B) A).card ≤
      2 * (a - k) := by
  classical
  obtain ⟨⟨hAU, hAcard⟩, hAind, _⟩ :
      (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
    simpa only [taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] using hA
  let E : Finset V := U.filter (fun v => v ∉ A ∧ G.IsIndepSet ((insert v A : Finset V) : Set V))
  have hEU : E ⊆ U := Finset.filter_subset _ _
  have hAE : Disjoint A E := by
    apply Finset.disjoint_left.mpr
    intro v hvA hvE
    exact (Finset.mem_filter.mp hvE).2.1 hvA
  have hcross : ∀ v ∈ E, ∀ u ∈ A, ¬ G.Adj v u := by
    intro v hvE u huA
    obtain ⟨hvn, hvI⟩ := (Finset.mem_filter.mp hvE).2
    rw [SimpleGraph.isIndepSet_iff] at hvI
    exact hvI (by simp) (by simp [huA]) (by intro heq; exact hvn (heq ▸ huA))
  have hEcard : E.card ≤ 2 * (a - k) := by
    simpa [hAcard] using card_extension_le G hBip U A E a hAU hEU hAE hAind hcross hcap
  have hmap : ((taggedFamily G U W (k + 1)).bipartiteBelow
      (fun B A => A ⊆ B) A).card ≤ (E.powersetCard 1).card := by
    apply Finset.card_le_card_of_injOn (fun B : Finset V => B \ A)
    · intro B hB
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hB
      obtain ⟨hB, hAB⟩ := hB
      obtain ⟨⟨hBU, hBcard⟩, hBind, _⟩ :
          (B ⊆ U ∧ B.card = k + 1) ∧ G.IsIndepSet (B : Set V) ∧ ¬ Disjoint B W := by
        simpa only [taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] using hB
      apply Finset.mem_powersetCard.mpr
      constructor
      · intro v hv
        have hvB : v ∈ B := (Finset.mem_sdiff.mp hv).1
        have hvA : v ∉ A := (Finset.mem_sdiff.mp hv).2
        apply Finset.mem_filter.mpr
        refine ⟨hBU hvB, hvA, ?_⟩
        apply hBind.mono
        exact_mod_cast (show insert v A ⊆ B from Finset.insert_subset hvB hAB)
      · rw [Finset.card_sdiff_of_subset hAB]
        omega
    · intro B hB C hC hBC
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hB
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hC
      have hAB : A ⊆ B := hB.2
      have hAC : A ⊆ C := hC.2
      exact (Finset.superset_injOn_sdiff A) hAB hAC hBC
  simpa [Finset.card_powersetCard] using hmap.trans (by simpa using hEcard)

end Core

lemma taggedShadowBound {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (U W : Finset V) (a k : ℕ)
    (hcap : ∀ A : Finset V, A ⊆ U → G.IsIndepSet (A : Set V) → A.card ≤ a)
    (hk : 1 ≤ k) :
    k * (taggedFamily G U W (k + 1)).card ≤
      2 * (a - k) * (taggedFamily G U W k).card := by
  classical
  have hcount := Finset.card_nsmul_le_card_nsmul (R := ℕ)
    (r := fun B A : Finset V => A ⊆ B)
    (s := taggedFamily G U W (k + 1)) (t := taggedFamily G U W k)
    (m := k) (n := 2 * (a - k))
    (fun B hB => Core.tagged_deletions_lower G U W k B hB)
    (fun A hA => Core.tagged_extensions_upper G hBip U W a k hcap A hA)
  simp only [nsmul_eq_mul] at hcount
  nlinarith [hcount]

end E993Interior
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN lemma E993HighTail.bipartiteTaggedShadowBoundNat 2d6d3dda0e8c081d6093f85288f5478d3aff1b9cc45a93ff8e415966dfec3143
namespace E993HighTail

open E993Interior

-- Declaration carried byte-identically from sources/c1-stage7-sources/ADJ-U-awards-LA1-Main.lean
-- (SHA-256 d88f6043e9b8e1587daa1495a1e7a8792f9cd3400529c159e46c5021ba5862ce; U adjudicator base candidate).
/-- Companion (ℕ form, no `k ≤ a`): the carried entry-41 bound at `U = univ`, `a = α(H)`. -/
lemma bipartiteTaggedShadowBoundNat {V : Type*} [Fintype V] [DecidableEq V]
    (H : SimpleGraph V) [DecidableRel H.Adj] (hBip : H.IsBipartite) (W : Finset V) (k : ℕ)
    (hk : 1 ≤ k) :
    k * (taggedFamily H Finset.univ W (k + 1)).card ≤
      2 * (H.indepNum - k) * (taggedFamily H Finset.univ W k).card :=
  taggedShadowBound H hBip Finset.univ W H.indepNum k (fun _ _ hA => hA.card_le_indepNum) hk

end E993HighTail
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN theorem E993HighTail.bipartiteTaggedShadowBound 02f727a3ab9cea4a594ffcc4ecbfb10e5beb05b6ecfeda1151c77c5c53b1d9f5
namespace E993HighTail

open E993Interior

-- Declaration carried byte-identically from sources/c1-stage7-sources/ADJ-U-awards-LA1-Main.lean
-- (SHA-256 d88f6043e9b8e1587daa1495a1e7a8792f9cd3400529c159e46c5021ba5862ce; U adjudicator base candidate).
-- `hk : 1 ≤ k` is statement scope: it is passed to entry 41, whose body does not use it.
theorem bipartiteTaggedShadowBound {V : Type*} [Fintype V] [DecidableEq V]
    (H : SimpleGraph V) [DecidableRel H.Adj] (hBip : H.IsBipartite) (W : Finset V) (k : ℕ)
    (hk : 1 ≤ k) (hka : k ≤ H.indepNum) :
    (k : ℤ) * (taggedFamily H Finset.univ W (k + 1)).card ≤
      2 * ((H.indepNum : ℤ) - k) * (taggedFamily H Finset.univ W k).card := by
  have hnat := bipartiteTaggedShadowBoundNat H hBip W k hk
  have hcastle : ((k * (taggedFamily H Finset.univ W (k + 1)).card : ℕ) : ℤ) ≤
      ((2 * (H.indepNum - k) * (taggedFamily H Finset.univ W k).card : ℕ) : ℤ) :=
    Int.ofNat_le.mpr hnat
  have hsub : ((H.indepNum - k : ℕ) : ℤ) = (H.indepNum : ℤ) - k := Nat.cast_sub hka
  push_cast [hsub] at hcastle
  linarith [hcastle]

end E993HighTail
-- VERITYOS ENTRY 4 END

