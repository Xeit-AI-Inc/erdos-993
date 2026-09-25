import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition C4LA1.vertexDeletionIndepSetCount 7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The coefficient `i_k(G-v)`, represented without changing vertex types:
independent `k`-subsets of the original finite vertex type that avoid `v`. -/
def vertexDeletionIndepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (v : V) (k : Nat) : Nat :=
  (((Finset.univ.erase v).powersetCard k).filter fun s : Finset V =>
    G.IsIndepSet (s : Set V)).card

end C4LA1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition C4LA1.vertexDeletionForwardDifference c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880
namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The forward coefficient difference `i_(p+1)(G-v) - i_p(G-v)`, with
natural counts embedded in the integers. -/
def vertexDeletionForwardDifference (G : SimpleGraph V) [DecidableRel G.Adj]
    (v : V) (p : Nat) : Int :=
  (vertexDeletionIndepSetCount G v (p + 1) : Int) -
    vertexDeletionIndepSetCount G v p

end C4LA1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition C4LA1.IsFavorableAt 25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db
namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Literal strict favorability of an original leaf at rank `p`. -/
def IsFavorableAt (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (p : Nat) : Prop :=
  vertexDeletionForwardDifference G v p < 0

end C4LA1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition C4LA1.IsGraphLeaf 65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5
namespace C4LA1

variable {V : Type*}

/-- A graph leaf has exactly one adjacent vertex. -/
def IsGraphLeaf (G : SimpleGraph V) (v : V) : Prop :=
  ∃! u, G.Adj v u

end C4LA1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition C5LA1.support 8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4
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
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition C5LA1.leafSet 78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- The set of original leaves of `G`. -/
noncomputable
def leafSet (G : SimpleGraph V) : Finset V :=
  Finset.univ.filter (C4LA1.IsGraphLeaf G)

end C5LA1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition C5LA1.leafDegree ccfc9b2f549aa8c9986931152d249096ce49e3ccd3b67f4afd8678a749d93a68
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `lambda(s)`: the number of leaves of `G` adjacent to `s`, zero off
supports. -/
noncomputable
def leafDegree (G : SimpleGraph V) [DecidableRel G.Adj] (s : V) : Nat :=
  ((leafSet G).filter fun v => G.Adj v s).card

end C5LA1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition C5LA1.H 55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `H_v = G - {v, s_v}`, realised as the deletion set for a leaf `v`. -/
noncomputable
def H (G : SimpleGraph V) (v : V) : Finset V :=
  {v, support G v}

end C5LA1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition C5LA1.R a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `R_v = G - N[s_v]`, realised as the deletion set for a leaf `v`. -/
noncomputable
def R (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  insert (support G v) (G.neighborFinset (support G v))

end C5LA1
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition C5LA1.indepSetsAvoiding ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I_k(G - D)`: independent `k`-subsets of the original vertex type
avoiding the finite deletion set `D`. -/
def indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Finset (Finset V) :=
  ((Finset.univ \ D).powersetCard k).filter fun s : Finset V => G.IsIndepSet (s : Set V)

end C5LA1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition C5LA1.indepSetCount e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `i_k(G - D)`. -/
def indepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Nat :=
  (indepSetsAvoiding G D k).card

end C5LA1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition C5LA1.forwardDifferenceDel 60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `Delta_k(G - D) = i_(k+1)(G-D) - i_k(G-D)`. -/
def forwardDifferenceDel (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Int :=
  (indepSetCount G D (k + 1) : Int) - indepSetCount G D k

end C5LA1
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition C5LA1.aggregate d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- `S(G,p) = sum_{v in F} (b_v - B_v)`, the literal top-rank residual
aggregate, summed over the favorable filter of the leaf set. -/
noncomputable
def aggregate (G : SimpleGraph V) [DecidableRel G.Adj] (p : Nat) : Int :=
  ∑ v ∈ (leafSet G).filter fun v => C4LA1.IsFavorableAt G v p,
    (forwardDifferenceDel G (H G v) (p - 1) - forwardDifferenceDel G (R G v) (p - 1))

end C5LA1
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition C5LA1.crossingIndex 378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- `x(G)`: the least `k` with `Delta_k(G) < 0`; exists because
`Delta_(alpha)(G) = -i_alpha(G) < 0`. -/
noncomputable
def crossingIndex (G : SimpleGraph V) [DecidableRel G.Adj] : Nat :=
  Nat.find (p := fun k => forwardDifferenceDel G ∅ k < 0)
    (by
      classical
      obtain ⟨s, hs⟩ := G.exists_isNIndepSet_indepNum
      refine ⟨G.indepNum, ?_⟩
      have hzero : indepSetCount G ∅ (G.indepNum + 1) = 0 := by
        have hempty : indepSetsAvoiding G ∅ (G.indepNum + 1) = ∅ := by
          rw [Finset.eq_empty_iff_forall_notMem]
          intro t ht
          simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at ht
          have hle : t.card ≤ G.indepNum := ht.2.card_le_indepNum
          omega
        rw [indepSetCount, hempty, Finset.card_empty]
      have hpos : 0 < indepSetCount G ∅ G.indepNum := by
        rw [indepSetCount, Finset.card_pos]
        refine ⟨s, ?_⟩
        simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
        refine ⟨⟨?_, hs.card_eq⟩, hs.isIndepSet⟩
        intro x _
        simp
      simp only [forwardDifferenceDel, hzero]
      omega)

end C5LA1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition E993Interior.taggedFamily cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e
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
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma E993Interior.taggedShadowBound 50dcce4a7ad13fbb73361ff1235996a7bb79eeea2cf9435a752b1eab50d8583f
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
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma E993Interior.highTailAggregateFromShadow 972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d
namespace E993Interior.Leaf

open Classical

private lemma support_spec {V : Type*} [Fintype V] [DecidableEq V]
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

private lemma support_adj {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    G.Adj v (C5LA1.support G v) :=
  (support_spec G v hv).1

private lemma support_unique {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    {w : V} (hw : G.Adj v w) : w = C5LA1.support G v :=
  (support_spec G v hv).2 w hw

private lemma H_subset_R {V : Type*} [Fintype V] [DecidableEq V]
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

private lemma leaf_insert_indep {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    (A : Finset V) (hAH : Disjoint A (C5LA1.H G v))
    (hAI : G.IsIndepSet (A : Set V)) :
    G.IsIndepSet (insert v A : Set V) := by
  have hvA : v ∉ A := by
    intro h
    exact (Finset.disjoint_left.mp hAH h) (by simp [C5LA1.H])
  have hsA : C5LA1.support G v ∉ A := by
    intro h
    exact (Finset.disjoint_left.mp hAH h) (by simp [C5LA1.H])
  change G.IsIndepSet (insert v (A : Set V))
  letI : Std.Symm (fun x y : V => ¬ G.Adj x y) :=
    ⟨fun _ _ h h' => h h'.symm⟩
  rw [SimpleGraph.isIndepSet_iff, Set.pairwise_insert_of_symm_of_notMem]
  · refine ⟨hAI, ?_⟩
    intro w hw
    intro hadj
    exact hsA ((support_unique G v hv hadj) ▸ (Finset.mem_coe.mp hw))
  · simpa using hvA

private lemma leaf_indep_cap {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v : V)
    (hv : C4LA1.IsGraphLeaf G v)
    (A : Finset V) (hAU : A ⊆ Finset.univ \ C5LA1.H G v)
    (hAI : G.IsIndepSet (A : Set V)) :
    A.card ≤ G.indepNum - 1 := by
  have hAH : Disjoint A (C5LA1.H G v) := by
    apply Finset.disjoint_left.mpr
    intro x hx
    exact (Finset.mem_sdiff.mp (hAU hx)).2
  have hvA : v ∉ A := by
    intro h
    exact (Finset.disjoint_left.mp hAH h) (by simp [C5LA1.H])
  have hI := leaf_insert_indep G v hv A hAH hAI
  have hI' : G.IsIndepSet (↑(insert v A) : Set V) := by
    simpa only [Finset.coe_insert] using hI
  have hcard := hI'.card_le_indepNum
  rw [Finset.card_insert_of_notMem hvA] at hcard
  omega

private lemma tagged_count_split {V : Type*} [Fintype V] [DecidableEq V]
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

private lemma tagged_zero_above_leaf_cap {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v : V)
    (hv : C4LA1.IsGraphLeaf G v) (W : Finset V) (j : ℕ)
    (hj : G.indepNum - 1 < j) :
    (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W j).card = 0 := by
  apply Finset.card_eq_zero.mpr
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro A hA
  have hm := Finset.mem_filter.mp hA
  have hpow := Finset.mem_powersetCard.mp hm.1
  have hcap := leaf_indep_cap G v hv A hpow.1 hm.2.1
  omega

private lemma leaf_tagged_monotone {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (hShadow : ∀ (U W : Finset V) (a k : ℕ),
      (∀ A : Finset V, A ⊆ U → G.IsIndepSet (A : Set V) → A.card ≤ a) →
      1 ≤ k → k * (E993Interior.taggedFamily G U W (k + 1)).card ≤
        2 * (a - k) * (E993Interior.taggedFamily G U W k).card)
    (v : V) (hv : C4LA1.IsGraphLeaf G v) (W : Finset V)
    (p : ℕ) (hp : 2 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W p).card ≤
      (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W (p - 1)).card := by
  let k := p - 1
  have hk : 1 ≤ k := by omega
  have hpk : k + 1 = p := by omega
  have hcoeff : 2 * ((G.indepNum - 1) - k) ≤ k := by omega
  by_cases hbig : G.indepNum - 1 < k
  · have hzero := tagged_zero_above_leaf_cap G v hv W k hbig
    have hzero' := tagged_zero_above_leaf_cap G v hv W p (by omega)
    simpa only [k] using (show
      (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W p).card ≤
      (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W k).card by
        rw [hzero, hzero'])
  · have hs := hShadow (Finset.univ \ C5LA1.H G v) W
        (G.indepNum - 1) k (leaf_indep_cap G v hv) hk
    rw [hpk] at hs
    have hm : 2 * ((G.indepNum - 1) - k) *
        (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W k).card ≤
        k * (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W k).card :=
      Nat.mul_le_mul_right _ hcoeff
    have hmul := le_trans hs hm
    have hq : (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W p).card ≤
        (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W k).card := by
      by_contra hn
      have hlt : (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W k).card <
          (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) W p).card := by omega
      nlinarith
    simpa only [k] using hq

private lemma leaf_term_nonpos {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (hShadow : ∀ (U W : Finset V) (a k : ℕ),
      (∀ A : Finset V, A ⊆ U → G.IsIndepSet (A : Set V) → A.card ≤ a) →
      1 ≤ k → k * (E993Interior.taggedFamily G U W (k + 1)).card ≤
        2 * (a - k) * (E993Interior.taggedFamily G U W k).card)
    (v : V) (hv : C4LA1.IsGraphLeaf G v)
    (p : ℕ) (hp : 2 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) -
      C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0 := by
  have hsub := H_subset_R G v hv
  have hsplit0 := tagged_count_split G (C5LA1.H G v) (C5LA1.R G v) hsub (p - 1)
  have hsplit1 := tagged_count_split G (C5LA1.H G v) (C5LA1.R G v) hsub p
  have hq := leaf_tagged_monotone G hShadow v hv (C5LA1.R G v) p hp hTail
  have hpk : p - 1 + 1 = p := by omega
  unfold C5LA1.forwardDifferenceDel
  rw [hpk, hsplit0, hsplit1]
  omega

end E993Interior.Leaf

namespace E993Interior

lemma highTailAggregateFromShadow {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (hShadow : ∀ (U W : Finset V) (a k : ℕ),
      (∀ A : Finset V, A ⊆ U → G.IsIndepSet (A : Set V) → A.card ≤ a) →
      1 ≤ k → k * (taggedFamily G U W (k + 1)).card ≤
        2 * (a - k) * (taggedFamily G U W k).card)
    (p : ℕ) (hp : 2 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.aggregate G p ≤ 0 := by
  classical
  unfold C5LA1.aggregate
  apply Finset.sum_nonpos
  intro v hv
  have hLeaf : C4LA1.IsGraphLeaf G v := by
    have h := (Finset.mem_filter.mp hv).1
    exact (Finset.mem_filter.mp h).2
  exact Leaf.leaf_term_nonpos G hShadow v hLeaf p hp hTail

end E993Interior
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma E993HighTail.indepSetCount_zero cb21770bef2e789994531f4d5b6202d165f81ba9eba30dfdea7e92d581dbb417
namespace E993HighTail

open SimpleGraph E993Interior

lemma indepSetCount_zero {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V) :
    C5LA1.indepSetCount G D 0 = 1 := by
  classical
  have he : G.IsIndepSet ((∅ : Finset V) : Set V) := by
    simp [SimpleGraph.isIndepSet_iff, Set.Pairwise]
  have hset : C5LA1.indepSetsAvoiding G D 0 = {∅} := by
    ext s
    simp only [C5LA1.indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard,
      Finset.mem_singleton]
    constructor
    · rintro ⟨⟨_, hcard⟩, _⟩
      exact Finset.card_eq_zero.mp hcard
    · rintro rfl
      exact ⟨⟨Finset.empty_subset _, rfl⟩, he⟩
  unfold C5LA1.indepSetCount
  rw [hset, Finset.card_singleton]

end E993HighTail
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma E993HighTail.indepSetCount_one f952dc4f0da45dba4b94e228f1c59382a07c24d82e66f12aeeb88ee65045017b
namespace E993HighTail

open SimpleGraph E993Interior

lemma indepSetCount_one {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V) :
    C5LA1.indepSetCount G D 1 = (Finset.univ \ D).card := by
  classical
  have hset : C5LA1.indepSetsAvoiding G D 1 = (Finset.univ \ D).powersetCard 1 := by
    ext s
    simp only [C5LA1.indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
    constructor
    · exact fun h => h.1
    · intro hs
      refine ⟨hs, ?_⟩
      obtain ⟨v, rfl⟩ := Finset.card_eq_one.mp hs.2
      simp [SimpleGraph.isIndepSet_iff, Set.Pairwise]
  unfold C5LA1.indepSetCount
  rw [hset, Finset.card_powersetCard, Nat.choose_one_right]

end E993HighTail
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma E993HighTail.forwardDifferenceDel_zero_eq 24b1a2c58bdc0409577b8150697430d59e956210639b7b2ef0a4564b40b7716a
namespace E993HighTail

open SimpleGraph E993Interior

/-- `Δ_0(G − D) = |V| − |D| − 1` on any graph and any deletion set. -/
lemma forwardDifferenceDel_zero_eq {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V) :
    C5LA1.forwardDifferenceDel G D 0 = (Fintype.card V : ℤ) - D.card - 1 := by
  classical
  unfold C5LA1.forwardDifferenceDel
  rw [indepSetCount_zero, indepSetCount_one]
  have hDle : D.card ≤ Fintype.card V := by simpa using Finset.card_le_univ D
  have hcard : (Finset.univ \ D).card = Fintype.card V - D.card := by
    rw [Finset.card_sdiff, Finset.inter_univ, Finset.card_univ]
  have hcast : ((Fintype.card V - D.card : ℕ) : ℤ) = (Fintype.card V : ℤ) - D.card :=
    Nat.cast_sub hDle
  rw [hcard, hcast]
  norm_num

end E993HighTail
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma E993HighTail.leafTermAtOne_eq_degSubOne 6fd1056e4ed4d841532f979d03ea4a85ccc91fd07d836e9a578d9d5bab8cb56f
namespace E993HighTail

open SimpleGraph E993Interior

/-- The general `p = 1` formula on ANY graph with an original leaf: term `= deg(s) − 1`. -/
lemma leafTermAtOne_eq_degSubOne {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) 0 -
      C5LA1.forwardDifferenceDel G (C5LA1.R G v) 0 =
      (G.degree (C5LA1.support G v) : ℤ) - 1 := by
  classical
  rw [forwardDifferenceDel_zero_eq, forwardDifferenceDel_zero_eq]
  have hvs : v ≠ C5LA1.support G v :=
    (E993Interior.Leaf.support_adj G v hv).ne
  have hHcard : (C5LA1.H G v).card = 2 := by
    unfold C5LA1.H
    rw [Finset.card_insert_of_notMem (Finset.notMem_singleton.mpr hvs),
      Finset.card_singleton]
  have hnotmem : C5LA1.support G v ∉ G.neighborFinset (C5LA1.support G v) := by
    rw [SimpleGraph.mem_neighborFinset]
    exact G.irrefl
  have hRcard : (C5LA1.R G v).card = G.degree (C5LA1.support G v) + 1 := by
    unfold C5LA1.R
    rw [Finset.card_insert_of_notMem hnotmem, SimpleGraph.card_neighborFinset_eq_degree]
  rw [hHcard, hRcard]
  push_cast
  ring

end E993HighTail
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma E993HighTail.leafEndpointAtOne a83504da29f4f4c9aec12fe1336e45f86e5c4ee7aad5eefd410ac3c6ef8abd75
namespace E993HighTail

open SimpleGraph E993Interior

/-- `p = 1` endpoint on ANY graph (no bipartiteness): an original leaf and `α(G) ≤ 1` force
`N(s) = {v}`, hence term `= 0`. -/
lemma leafEndpointAtOne {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (hv : C4LA1.IsGraphLeaf G v)
    (hα : G.indepNum ≤ 1) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) 0 -
      C5LA1.forwardDifferenceDel G (C5LA1.R G v) 0 = 0 := by
  classical
  rw [leafTermAtOne_eq_degSubOne G v hv]
  have hvs : G.Adj v (C5LA1.support G v) := E993Interior.Leaf.support_adj G v hv
  have hsub : G.neighborFinset (C5LA1.support G v) ⊆ {v} := by
    intro w hw
    rw [Finset.mem_singleton]
    by_contra hwv
    have hsw : G.Adj (C5LA1.support G v) w := (G.mem_neighborFinset _ w).mp hw
    have hws : w ≠ C5LA1.support G v := (G.ne_of_adj hsw).symm
    have hnadj : ¬ G.Adj v w := fun h => hws (E993Interior.Leaf.support_unique G v hv h)
    have hI : G.IsIndepSet (({v, w} : Finset V) : Set V) := by
      rw [Finset.coe_pair, SimpleGraph.isIndepSet_iff, Set.pairwise_pair]
      intro _
      exact ⟨hnadj, fun h => hnadj h.symm⟩
    have hc := hI.card_le_indepNum
    rw [Finset.card_pair (Ne.symm hwv)] at hc
    omega
  have hmem : v ∈ G.neighborFinset (C5LA1.support G v) :=
    (G.mem_neighborFinset _ v).mpr hvs.symm
  have hN : G.neighborFinset (C5LA1.support G v) = {v} :=
    Finset.Subset.antisymm hsub (Finset.singleton_subset_iff.mpr hmem)
  have hdeg : G.degree (C5LA1.support G v) = 1 := by
    rw [← SimpleGraph.card_neighborFinset_eq_degree, hN, Finset.card_singleton]
  rw [hdeg]
  norm_num

end E993HighTail
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma E993HighTail.leafHighTailPointwiseAux ed61127e3aa89e465560d12d8cb98f7c84e73387794096b06a7386a04acec62e
namespace E993HighTail

open SimpleGraph E993Interior

lemma leafHighTailPointwiseAux {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite) (v : V)
    (hv : C4LA1.IsGraphLeaf G v) (p : ℕ) (hp : 1 ≤ p)
    (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) -
      C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0 := by
  rcases Nat.lt_or_ge p 2 with hp1 | hp2
  · have hpeq : p = 1 := by omega
    subst hpeq
    show C5LA1.forwardDifferenceDel G (C5LA1.H G v) 0 -
      C5LA1.forwardDifferenceDel G (C5LA1.R G v) 0 ≤ 0
    exact le_of_eq (leafEndpointAtOne G v hv (by omega))
  · exact E993Interior.Leaf.leaf_term_nonpos G
      (fun U W a k hcap hk => E993Interior.taggedShadowBound G hBip U W a k hcap hk)
      v hv p hp2 hTail

end E993HighTail
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma E993HighTail.bipartiteHighTailAggregateAllRanks 8cde34c757ba33710ba6e89fcf6d407f7eb70675eaa55be6f7f3a54ea10d10c1
namespace E993HighTail

open SimpleGraph E993Interior

lemma bipartiteHighTailAggregateAllRanks {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.aggregate G p ≤ 0 := by
  classical
  unfold C5LA1.aggregate
  apply Finset.sum_nonpos
  intro v hv
  have hLeaf : C4LA1.IsGraphLeaf G v := (Finset.mem_filter.mp (Finset.mem_filter.mp hv).1).2
  exact leafHighTailPointwiseAux G hBip v hLeaf p hp hTail

end E993HighTail
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN theorem E993HighTail.bipartiteLeafHighTailPointwise 5c49ba5cccd1cefc03bdc9e2d75f4465bd1e0df4d6db5c6526292c48459a4a19
namespace E993HighTail

open SimpleGraph E993Interior

theorem bipartiteLeafHighTailPointwise {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) - C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0 :=
  leafHighTailPointwiseAux G hBip v hv p hp hTail

end E993HighTail
-- VERITYOS ENTRY 25 END

