import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount 6ab32636f04a91282d3209765a4f0a928d74dabaf346e2d027e5ab336ad59704
universe u

namespace Erdos993G1
noncomputable section
def indepCount {V : Type u}
    (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

end
end Erdos993G1

-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition C4LA1.IsGraphLeaf 65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5
namespace C4LA1

variable {V : Type*}

/-- A graph leaf has exactly one adjacent vertex. -/
def IsGraphLeaf (G : SimpleGraph V) (v : V) : Prop :=
  ∃! u, G.Adj v u

end C4LA1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition C5LA1.support 8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4
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
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition C5LA1.H 55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `H_v = G - {v, s_v}`, realised as the deletion set for a leaf `v`. -/
noncomputable
def H (G : SimpleGraph V) (v : V) : Finset V :=
  {v, support G v}

end C5LA1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition C5LA1.R a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `R_v = G - N[s_v]`, realised as the deletion set for a leaf `v`. -/
noncomputable
def R (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  insert (support G v) (G.neighborFinset (support G v))

end C5LA1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition C5LA1.indepSetsAvoiding ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I_k(G - D)`: independent `k`-subsets of the original vertex type
avoiding the finite deletion set `D`. -/
def indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Finset (Finset V) :=
  ((Finset.univ \ D).powersetCard k).filter fun s : Finset V => G.IsIndepSet (s : Set V)

end C5LA1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition C5LA1.indepSetCount e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `i_k(G - D)`. -/
def indepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Nat :=
  (indepSetsAvoiding G D k).card

end C5LA1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition C5LA1.forwardDifferenceDel 60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `Delta_k(G - D) = i_(k+1)(G-D) - i_k(G-D)`. -/
def forwardDifferenceDel (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Int :=
  (indepSetCount G D (k + 1) : Int) - indepSetCount G D k

end C5LA1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition E993Interior.taggedFamily cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e
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
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition E993OrderBand.multiFamily 88a19664e1476ee366c6208b772713fb3edf9887bed94e488b2eac972157f983
namespace E993OrderBand

open Classical

noncomputable
def multiFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) : Finset (Finset V) :=
  (E993Interior.taggedFamily G U W (k + 1)).filter fun B =>
    2 ≤ (B ∩ W).card

end E993OrderBand
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition E993OrderBand.extensionSet 0ac43a1cff9e6eb8701df19a7df816ce9ef83a1cdcfea0891f5103151effb6eb
namespace E993OrderBand

open Classical

noncomputable
def extensionSet {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U A : Finset V) : Finset V :=
  U.filter fun y => y ∉ A ∧ G.IsIndepSet ((insert y A : Finset V) : Set V)

end E993OrderBand
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition E993OrderBand.goodFamily d021fafb8ef81ef622b83b32409613d0dd6dc501674422dc62edb0708f81a62e
namespace E993OrderBand

open Classical

noncomputable
def goodFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) : Finset (Finset V) :=
  (E993Interior.taggedFamily G U W k).filter fun A =>
    ∃ x ∈ U, ∃ a ∈ A, G.Adj x a

end E993OrderBand
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition C4LA1.vertexDeletionIndepSetCount 7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48
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
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition C4LA1.vertexDeletionForwardDifference c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880
namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The forward coefficient difference `i_(p+1)(G-v) - i_p(G-v)`, with
natural counts embedded in the integers. -/
def vertexDeletionForwardDifference (G : SimpleGraph V) [DecidableRel G.Adj]
    (v : V) (p : Nat) : Int :=
  (vertexDeletionIndepSetCount G v (p + 1) : Int) -
    vertexDeletionIndepSetCount G v p

end C4LA1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition C4LA1.IsFavorableAt 25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db
namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Literal strict favorability of an original leaf at rank `p`. -/
def IsFavorableAt (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (p : Nat) : Prop :=
  vertexDeletionForwardDifference G v p < 0

end C4LA1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN definition C5LA1.leafSet 78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- The set of original leaves of `G`. -/
noncomputable
def leafSet (G : SimpleGraph V) : Finset V :=
  Finset.univ.filter (C4LA1.IsGraphLeaf G)

end C5LA1
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN definition C5LA1.leafDegree ccfc9b2f549aa8c9986931152d249096ce49e3ccd3b67f4afd8678a749d93a68
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `lambda(s)`: the number of leaves of `G` adjacent to `s`, zero off
supports. -/
noncomputable
def leafDegree (G : SimpleGraph V) [DecidableRel G.Adj] (s : V) : Nat :=
  ((leafSet G).filter fun v => G.Adj v s).card

end C5LA1
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN definition C5LA1.aggregate d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b
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
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN definition C5LA1.crossingIndex 378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb
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
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN definition Erdos993G1.coeff fd7a956fc01783ff109e206552e7bc571584c88039b40029a11cd20ddd20b28a
namespace Erdos993G1
noncomputable section
def coeff {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

end
end Erdos993G1

-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN definition Erdos993G1.delta 013e775e4b1194e6e7c9dc70cfaec2593b9163165a064bdb4b20599fffd7adfa
namespace Erdos993G1
noncomputable section
def delta {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

end
end Erdos993G1

-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN definition Erdos993G1.firstDescent 893c02723036d41ed09c3eb8966d59e9eb62c16ceb091d6fcbf6fe1b56330b11
namespace Erdos993G1
noncomputable section
def firstDescent {V : Type u}
    (F : SimpleGraph V) : ℕ :=
  sInf {k : ℕ | Erdos993G1.delta F (k : ℤ) < 0}

end
end Erdos993G1

-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN definition Erdos993G1.vertexDegree e8f654346ff5e15332cfd26dc44ccba9afa14a6166e957d16f235ac897706bef
namespace Erdos993G1
noncomputable section
def vertexDegree {V : Type u}
    (F : SimpleGraph V) (v : V) : ℕ :=
  Nat.card (F.neighborSet v)

end
end Erdos993G1

-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN definition Erdos993G1.closedNeighborhood c3593a9de34cd8cab1551bed5cb9bb478574491e1aa08f9a091dad27ad5a8716
namespace Erdos993G1
def closedNeighborhood {V : Type u}
    (T : SimpleGraph V) (v : V) : Set V :=
  {w | w = v ∨ T.Adj v w}
end Erdos993G1

-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN definition Erdos993G1.deleteVerts 643e484297870529d9fcccc265dea8599915e50d10e80c85f3c3ea6275d244aa
namespace Erdos993G1
def deleteVerts {V : Type u}
    (F : SimpleGraph V) (S : Set V) : SimpleGraph {w : V // w ∉ S} :=
  F.induce Sᶜ
end Erdos993G1

-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN definition Erdos993G1.ambientA 7f780dad54dddaa68aa659ef685868ad431f19bb180300f5cd10cdb0bcd3f625
namespace Erdos993G1
def ambientA {V : Type u}
    (T : SimpleGraph V) (v : V) :=
  Erdos993G1.deleteVerts T (Erdos993G1.closedNeighborhood T v)
end Erdos993G1

-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN definition Erdos993G1.ambientH c415b7dead12776dc745ca597a1663a31e54b42ccddfd1428df4d03ad4050f86
namespace Erdos993G1
def ambientH {V : Type u}
    (T : SimpleGraph V) (v g : V) :=
  Erdos993G1.deleteVerts T (Erdos993G1.closedNeighborhood T v ∪ {g})
end Erdos993G1

-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN definition Erdos993G1.residual ac013bb38a4660cdada730ca28ea875d769d8f61ce9165f716e693e6ebe36d44
namespace Erdos993G1
def residual {V : Type u}
    (T : SimpleGraph V) (v g : V) :=
  Erdos993G1.deleteVerts T
    (Erdos993G1.closedNeighborhood T v ∪ Erdos993G1.closedNeighborhood T g)
end Erdos993G1

-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN definition Erdos993G1.residualOrder 60164fcbfb57829e63047355d6db2a181c36ecfa5bf8efa1765d084bd055b07e
namespace Erdos993G1
noncomputable section
def residualOrder {V : Type u}
    (T : SimpleGraph V) (v g : V) : ℕ :=
  Nat.card {w : V //
    w ∉ Erdos993G1.closedNeighborhood T v ∪ Erdos993G1.closedNeighborhood T g}

end
end Erdos993G1

-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN definition Erdos993G1.ordinaryG1Guards 39463183c614224e9c468c65bad4062c229a0b5e869f3d58c991557579172bdf
namespace Erdos993G1
def ordinaryG1Guards {V : Type u}
    (T : SimpleGraph V) (v s g : V) (p : ℕ) : Prop :=
  T.IsTree ∧
  Erdos993G1.vertexDegree T v = 1 ∧ T.Adj v s ∧
  Erdos993G1.vertexDegree T s = 2 ∧ T.Adj s g ∧ g ≠ v ∧
  p = Erdos993G1.firstDescent T + 1 ∧
  Erdos993G1.delta (Erdos993G1.ambientA T v) (p : ℤ) +
    Erdos993G1.delta (Erdos993G1.ambientH T v g) ((p : ℤ) - 1) < 0 ∧
  2 * p - 3 < Erdos993G1.residualOrder T v g ∧
  Erdos993G1.firstDescent (Erdos993G1.residual T v g) < p - 2
end Erdos993G1

namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN definition Erdos993G1.FirstWide.stratum ca77bfab90e90b229bebedda0cd5bdefbc71073100c1b5d50088538aff52c80e
namespace FirstWide

noncomputable section
def stratum {X : Type u} [Fintype X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ) : Finset (Finset X) := by
  classical
  exact (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j)

end

end FirstWide
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN definition Erdos993G1.FirstWide.binomCoeff 15be04fe3358ec671f28da2db52c757627e101992d8d40791181b1b1e5f06a6d
namespace FirstWide

def binomCoeff (n : ℕ) (k : ℤ) : ℤ :=
  if 0 ≤ k then (n.choose k.toNat : ℤ) else 0

end FirstWide
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma Erdos993G1.isNIndepSet_zero_iff 9df9b861d801c09b5ab131b483e26dacc5056eb6ffb7867c7523a51e8ed843fb
lemma isNIndepSet_zero_iff (S : Finset V) :
    F.IsNIndepSet 0 S ↔ S = ∅ := by
  simpa only [SimpleGraph.isNClique_compl] using
    (SimpleGraph.isNClique_zero (G := Fᶜ) (s := S))

-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma Erdos993G1.isNIndepSet_one_iff b12f77f59d3690c92c7c8bada90d9b4c5f1449b5b17c2e5574308cfbf54a0536
lemma isNIndepSet_one_iff (S : Finset V) :
    F.IsNIndepSet 1 S ↔ ∃ a, S = {a} := by
  classical
  simpa only [SimpleGraph.isNClique_compl] using
    (SimpleGraph.isNClique_one (G := Fᶜ) (s := S))

-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4c59444af666076a0ce8c355415235545a1d9c97ae721113599f63dcfb489a31
lemma indepCount_eq_card_indepSetFinset [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma Erdos993G1.indepCount_nonneg d5a62e3c3455c4d50f47db7e930f327551be59af8aaf1acfb08fff9a88e86136
lemma indepCount_nonneg (k : ℕ) : 0 ≤ indepCount F k := by
  exact Int.natCast_nonneg _

-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma Erdos993G1.indepCount_zero acffad838916a1b13c96fef7c654f39104b03af428110c4da5e9d500b0e07674
lemma indepCount_zero [Finite V] : indepCount F 0 = 1 := by
  classical
  letI := Fintype.ofFinite V
  rw [indepCount_eq_card_indepSetFinset]
  have h : F.indepSetFinset 0 = {∅} := by
    ext S
    simp [SimpleGraph.mem_indepSetFinset_iff, isNIndepSet_zero_iff]
  simp [h]

-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma Erdos993G1.indepCount_one 2c3536cb34ec79e12b8147cd94b40ec4f4c21269c2fc1c9efd90a558e487a31e
lemma indepCount_one [Finite V] : indepCount F 1 = (Nat.card V : ℤ) := by
  classical
  letI := Fintype.ofFinite V
  rw [indepCount_eq_card_indepSetFinset]
  have h : F.indepSetFinset 1 = Finset.univ.image (fun a : V => ({a} : Finset V)) := by
    ext S
    simp only [SimpleGraph.mem_indepSetFinset_iff, isNIndepSet_one_iff,
      Finset.mem_image, Finset.mem_univ, true_and]
    exact ⟨fun ⟨a, ha⟩ => ⟨a, ha.symm⟩, fun ⟨a, ha⟩ => ⟨a, ha.symm⟩⟩
  rw [h, Finset.card_image_of_injective _ Finset.singleton_injective,
    Finset.card_univ, Nat.card_eq_fintype_card]

-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma Erdos993G1.indepCount_eq_zero_of_indepNum_lt 123be264ea42836f1785056098a62c5d48fa1d801d8b6a9393f0f5b0f96e0bb6
lemma indepCount_eq_zero_of_indepNum_lt [Finite V] {k : ℕ}
    (hk : F.indepNum < k) : indepCount F k = 0 := by
  haveI : IsEmpty {S : Finset V // F.IsNIndepSet k S} :=
    ⟨fun S => by
      have h := S.property.isIndepSet.card_le_indepNum
      rw [S.property.card_eq] at h
      exact (not_le_of_gt hk) h⟩
  simp [indepCount]

-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma Erdos993G1.indepCount_indepNum_pos c554d650c08283f9a98deb95737d52a97e95ae100d09a228280fd7cd658e6202
lemma indepCount_indepNum_pos [Finite V] :
    0 < indepCount F F.indepNum := by
  obtain ⟨S, hS⟩ := F.exists_isNIndepSet_indepNum
  haveI : Nonempty {S : Finset V // F.IsNIndepSet F.indepNum S} := ⟨⟨S, hS⟩⟩
  unfold indepCount
  exact_mod_cast (Nat.card_pos (α := {S : Finset V // F.IsNIndepSet F.indepNum S}))

-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma Erdos993G1.coeff_nat 03f00ca029c7e10a6278ad907c2d6e5891668cdff802ec6768f9f93e51ed47f7
lemma coeff_nat (k : ℕ) : coeff F (k : ℤ) = indepCount F k := by
  simp [coeff]

-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma Erdos993G1.coeff_of_neg bcf669545ab3401ca5ba88ac2a8cf77144df87049057892e19b7f7728b3174fc
lemma coeff_of_neg {k : ℤ} (hk : k < 0) : coeff F k = 0 := by
  simp [coeff, not_le_of_gt hk]

-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma Erdos993G1.delta_nat a7a02236294541ef40fa02c9d9f0dd02052d13536f6523f462e2d5b96ff04f9e
lemma delta_nat (k : ℕ) :
    delta F (k : ℤ) = indepCount F (k + 1) - indepCount F k := by
  simpa only [delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (coeff_nat F (k + 1)) (coeff_nat F k)

-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma Erdos993G1.delta_zero c43a89269ad4d7bad8f5c8faa0222710d3815a826516edd0955a80bef67ebcb8
lemma delta_zero [Finite V] : delta F 0 = (Nat.card V : ℤ) - 1 := by
  simpa [indepCount_zero, indepCount_one] using (delta_nat F 0)

-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma Erdos993G1.delta_neg_one bfc4d805f6742022ecad22b2e0a4815d4b9dbdf74ee1a0c0d9029447718946dc
lemma delta_neg_one [Finite V] : delta F (-1) = 1 := by
  simp [delta, coeff, indepCount_zero]

-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma Erdos993G1.descentSet_nonempty a350a656e5d6dc22c0ce9c46cfdf112a3e20b1d02183576c24f5e68684fb6e37
lemma descentSet_nonempty [Finite V] :
    {k : ℕ | delta F (k : ℤ) < 0}.Nonempty := by
  refine ⟨F.indepNum, ?_⟩
  change delta F (F.indepNum : ℤ) < 0
  rw [delta_nat, indepCount_eq_zero_of_indepNum_lt F (Nat.lt_succ_self _)]
  have h := indepCount_indepNum_pos F
  omega

-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma Erdos993G1.delta_firstDescent_neg 89b0cab7b8771183c2d0b5ac70403180c74b49b516232480839218649f06509c
lemma delta_firstDescent_neg [Finite V] :
    delta F (firstDescent F : ℤ) < 0 := by
  exact Nat.sInf_mem (descentSet_nonempty F)

-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma Erdos993G1.delta_nonneg_of_lt_firstDescent 3392871c932e55446fbc42daf9e9c43a4e1cb08354049e72cb027cb6d19bf932
lemma delta_nonneg_of_lt_firstDescent {k : ℕ} (hk : k < firstDescent F) :
    0 ≤ delta F (k : ℤ) := by
  exact le_of_not_gt (Nat.notMem_of_lt_sInf hk)

-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma Erdos993G1.firstDescent_le_of_delta_neg 28265626e5cf310d23d33068a703ee3331532a0e2606bec2f98f236af0c037d9
lemma firstDescent_le_of_delta_neg {k : ℕ} (hk : delta F (k : ℤ) < 0) :
    firstDescent F ≤ k :=
  Nat.sInf_le hk

end Erdos993G1


universe w

namespace Erdos993G1

variable {V : Type u} {W : Type w} {F : SimpleGraph V} {G : SimpleGraph W}

-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma Erdos993G1.isNIndepSet_map_iso bd57ae9ed83550b3ae866881446b3f65e474c92abf31958c2ec9fceb1ecebea4
lemma isNIndepSet_map_iso (e : F ≃g G) (k : ℕ) (S : Finset V) :
    G.IsNIndepSet k (S.map e.toEquiv.toEmbedding) ↔ F.IsNIndepSet k S := by
  constructor
  · intro h
    refine ⟨?_, by simpa using h.card_eq⟩
    intro a ha b hb hab hAdj
    exact h.isIndepSet (by simpa using ha) (by simpa using hb)
      (e.injective.ne hab) (e.map_adj_iff.mpr hAdj)
  · intro h
    refine ⟨?_, by simpa using h.card_eq⟩
    intro a ha b hb hab hAdj
    obtain ⟨x, hx, rfl⟩ := Finset.mem_map.mp ha
    obtain ⟨y, hy, rfl⟩ := Finset.mem_map.mp hb
    exact h.isIndepSet hx hy (fun hxy => hab (congrArg e hxy))
      (e.map_adj_iff.mp hAdj)

-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma Erdos993G1.indepCount_iso f71434b13438181169e26ebd673578c3c4195847c1f0e972ecc94516cacde2c6
lemma indepCount_iso (e : F ≃g G) (k : ℕ) :
    indepCount F k = indepCount G k := by
  let eS : {S : Finset V // F.IsNIndepSet k S} ≃
      {S : Finset W // G.IsNIndepSet k S} :=
    { toFun := fun S => ⟨S.val.map e.toEquiv.toEmbedding,
        (isNIndepSet_map_iso e k S.val).mpr S.property⟩
      invFun := fun S => ⟨S.val.map e.symm.toEquiv.toEmbedding,
        (isNIndepSet_map_iso e.symm k S.val).mpr S.property⟩
      left_inv := fun S => by
        apply Subtype.ext
        simp [Finset.map_map]
      right_inv := fun S => by
        apply Subtype.ext
        simp [Finset.map_map] }
  exact congrArg (fun n : ℕ => (n : ℤ)) (Nat.card_congr eS)

-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma Erdos993G1.coeff_iso 3631b58dff1d09b36ceb6d30994a98a373baa90c430e6b6848fce34a00f7c1a9
lemma coeff_iso (e : F ≃g G) (k : ℤ) : coeff F k = coeff G k := by
  simp only [coeff, indepCount_iso e]

-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma Erdos993G1.delta_iso 6827baaeefaade9988a5b47db939fb51b758021e44a3205b90ae8ca504f80599
lemma delta_iso (e : F ≃g G) (k : ℤ) : delta F k = delta G k := by
  simp only [delta, coeff_iso e]

-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma Erdos993G1.firstDescent_iso f953a9d539a63b112ee6ea9442f78bdee854281e3ae2a6ab9c778bea34fe54dc
lemma firstDescent_iso (e : F ≃g G) : firstDescent F = firstDescent G := by
  simp only [firstDescent, delta_iso e]

-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma Erdos993G1.vertexDegree_eq_degree 1d25716bb2cfa9c9539a083cbf0540c1058822084e51f30235b21366df7eec48
lemma vertexDegree_eq_degree (a : V) [Fintype (F.neighborSet a)] :
    vertexDegree F a = F.degree a := by
  rw [vertexDegree, Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]

-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma Erdos993G1.deleteVerts_isAcyclic fa008ac82c212d1670b3452bfae66fd9cdc7d0daf5cf0730113bca4db67f24d6
lemma deleteVerts_isAcyclic (h : F.IsAcyclic) (S : Set V) :
    (deleteVerts F S).IsAcyclic :=
  h.induce _

-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma Erdos993G1.residual_isAcyclic 171132e213d52d4989b295159e09daa1eaaf63f1c17c19916ef0fd2154c70202
lemma residual_isAcyclic (h : F.IsAcyclic) (v g : V) :
    (residual F v g).IsAcyclic :=
  h.induce _

-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma Erdos993G1.residualOrder_eq_card 849a5567c708fcc6b316d35358f7d832501d64d77ea0e18262b92d5a4e589d95
lemma residualOrder_eq_card (v g : V) :
    residualOrder F v g =
      Nat.card {a : V // a ∉ closedNeighborhood F v ∪ closedNeighborhood F g} :=
  rfl

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma Erdos993G1.isNIndepSet_pair_iff c7fe22b14d4127788420f1fc872c6908e1c8e03d5089db1a4512366a1c6011cd
lemma isNIndepSet_pair_iff [DecidableEq V] (a b : V) :
    F.IsNIndepSet 2 {a, b} ↔ a ≠ b ∧ ¬F.Adj a b := by
  by_cases h : a = b
  · subst b
    simp [SimpleGraph.isNIndepSet_iff]
  · simp [SimpleGraph.isNIndepSet_iff, SimpleGraph.isIndepSet_iff, Set.Pairwise, h, F.adj_comm] <;> tauto

-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma Erdos993G1.sym2_toFinset_injective b6bb80d1fc0be2dc048f714854ea2d7ae9649fbceb0e5bbffbd1fae3d1947acd
lemma sym2_toFinset_injective [DecidableEq V] :
    Function.Injective (Sym2.toFinset : Sym2 V → Finset V) := by
  intro a b h
  apply Sym2.ext
  intro v
  simpa only [Sym2.mem_toFinset] using iff_of_eq (congrArg (v ∈ ·) h)

-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma Erdos993G1.indepSetFinset_two_eq 39a4bb3841ed900d0110289548de64819de9508cc2754cd12dd313c2afe30cc8
lemma indepSetFinset_two_eq [Fintype V] [DecidableEq V] [DecidableRel F.Adj] :
    F.indepSetFinset 2 = (Fᶜ.edgeFinset).image Sym2.toFinset := by
  ext S
  constructor
  · intro h
    have hS := SimpleGraph.mem_indepSetFinset_iff.mp h
    obtain ⟨a, b, hab, rfl⟩ := Finset.card_eq_two.mp hS.card_eq
    refine Finset.mem_image.mpr ⟨s(a, b), ?_, Sym2.toFinset_mk_eq⟩
    simpa only [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet,
      SimpleGraph.compl_adj] using (isNIndepSet_pair_iff F a b).mp hS
  · intro h
    obtain ⟨e, he, rfl⟩ := Finset.mem_image.mp h
    induction e using Sym2.inductionOn with
    | hf a b =>
      rw [SimpleGraph.mem_indepSetFinset_iff, Sym2.toFinset_mk_eq,
        isNIndepSet_pair_iff]
      simpa only [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet,
        SimpleGraph.compl_adj] using he

-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma Erdos993G1.indepCount_two_add_edges a01f026068c216985f79412914a708de863f8d52ac60d7369e2b85a21c58c014
lemma indepCount_two_add_edges [Finite V] :
    indepCount F 2 + (Nat.card F.edgeSet : ℤ) = ((Nat.card V).choose 2 : ℤ) := by
  classical
  letI := Fintype.ofFinite V
  have hd : Disjoint F.edgeFinset Fᶜ.edgeFinset :=
    SimpleGraph.disjoint_edgeFinset.mpr disjoint_compl_right
  have hu : F.edgeFinset ∪ Fᶜ.edgeFinset = (⊤ : SimpleGraph V).edgeFinset := by
    ext e
    induction e using Sym2.inductionOn with
    | hf a b =>
      by_cases hab : a = b
      · subst b
        simp
      · simp [SimpleGraph.compl_adj, hab]
        exact Classical.em _
  have ht : F.edgeFinset.card + Fᶜ.edgeFinset.card = (Fintype.card V).choose 2 := by
    rw [← Finset.card_union_of_disjoint hd, hu,
      SimpleGraph.card_edgeFinset_top_eq_card_choose_two]
  rw [indepCount_eq_card_indepSetFinset, indepSetFinset_two_eq,
    Finset.card_image_of_injective _ sym2_toFinset_injective,
    Nat.card_eq_fintype_card, Nat.card_eq_fintype_card,
    ← SimpleGraph.edgeFinset_card]
  exact_mod_cast (by omega : Fᶜ.edgeFinset.card + F.edgeFinset.card = (Fintype.card V).choose 2)

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma Erdos993G1.indepSetFinset_eq_filter_powersetCard ec9d1ede162d82ed94a34a38672bad65fc69ea0b778b5162ae78c5fec73a5628
lemma indepSetFinset_eq_filter_powersetCard [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    F.indepSetFinset k = ((Finset.univ : Finset V).powersetCard k).filter
      (fun B : Finset V => F.IsIndepSet B) := by
  ext B
  simp [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff, and_comm]

-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma Erdos993G1.card_nonindep_pairs 96c84ad8516cd9224be112085b17e6b4dceb988fd19ce9e39ffaad28a4804cbc
lemma card_nonindep_pairs [Fintype V] [DecidableEq V] [DecidableRel F.Adj] :
    (((Finset.univ : Finset V).powersetCard 2).filter
      (fun E : Finset V => ¬F.IsIndepSet E)).card = Nat.card F.edgeSet := by
  have hp := Finset.card_filter_add_card_filter_not
    (s := (Finset.univ : Finset V).powersetCard 2)
    (fun E : Finset V => F.IsIndepSet E)
  rw [← indepSetFinset_eq_filter_powersetCard, Finset.card_powersetCard,
    Finset.card_univ] at hp
  have he := indepCount_two_add_edges F
  rw [indepCount_eq_card_indepSetFinset,
    Nat.card_eq_fintype_card (α := V)] at he
  omega

-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma Erdos993G1.sum_card_filter_swap db506bda8bc6b666134551b5bc0fd50e22daf1b537ec59f21be1da84eb4ffe98
lemma sum_card_filter_swap {A : Type u} {B : Type w}
    (s : Finset A) (t : Finset B) (p : A → B → Prop)
    [DecidableRel p] :
    ∑ a ∈ s, (t.filter (p a)).card =
      ∑ b ∈ t, (s.filter (fun a => p a b)).card := by
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]
  exact Finset.sum_comm

-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma Erdos993G1.sum_nonindep_pair_incidence da829ee128471804d3016cd47dc81dc700c969ffe760cdfe792d805388f36292
lemma sum_nonindep_pair_incidence [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
      ((B.powersetCard 2).filter (fun E : Finset V => ¬F.IsIndepSet E)).card =
        Nat.card F.edgeSet * (Fintype.card V - 2) := by
  classical
  let E := ((Finset.univ : Finset V).powersetCard 2).filter
    (fun S : Finset V => ¬F.IsIndepSet S)
  have hlocal (B : Finset V) :
      (B.powersetCard 2).filter (fun S : Finset V => ¬F.IsIndepSet S) =
        E.filter (fun S => S ⊆ B) := by
    ext S
    simp [E, and_assoc, and_left_comm, and_comm]
  calc
    _ = ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
        (E.filter (fun S => S ⊆ B)).card := by
      apply Finset.sum_congr rfl
      intro B _
      rw [hlocal]
    _ = ∑ S ∈ E, (((Finset.univ : Finset V).powersetCard 3).filter
        (fun B => S ⊆ B)).card :=
      sum_card_filter_swap _ _ (fun B S : Finset V => S ⊆ B)
    _ = ∑ S ∈ E, (Fintype.card V - 2) := by
      apply Finset.sum_congr rfl
      intro S hS
      have hcard : S.card = 2 := (Finset.mem_powersetCard.mp
        (Finset.mem_filter.mp hS).1).2
      rw [Finset.card_filter_powersetCard_subset S Finset.univ 3
        (Finset.subset_univ _) (by omega), hcard, Finset.card_univ]
      simp
    _ = E.card * (Fintype.card V - 2) := by simp
    _ = _ := by rw [show E.card = Nat.card F.edgeSet from card_nonindep_pairs F]

-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma Erdos993G1.sum_indep_indicator e8656c5832d89388faa9e5fbe465d97c9212944d86545795e43360d7cf446d54
lemma sum_indep_indicator [Fintype V] [DecidableEq V] [DecidableRel F.Adj]
    (k : ℕ) :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard k,
      (if F.IsIndepSet B then 1 else 0) = (F.indepSetFinset k).card := by
  rw [indepSetFinset_eq_filter_powersetCard]
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma Erdos993G1.triple_local_identity 1987228dfddb76922331fd7897112e6fbb9500d655adc833b004028ebafcd53d
lemma triple_local_identity [DecidableEq V] [DecidableRel F.Adj]
    (hF : F.IsAcyclic) (B : Finset V) (hB : B.card = 3) :
    (if F.IsIndepSet B then 1 else 0) +
        ((B.powersetCard 2).filter (fun E : Finset V => ¬F.IsIndepSet E)).card =
      1 + ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2 := by
  classical
  obtain ⟨a, b, c, hab, hac, hbc, rfl⟩ := Finset.card_eq_three.mp hB
  have hn : ¬(F.Adj a b ∧ F.Adj a c ∧ F.Adj b c) := by
    intro h
    exact (hF.cliqueFree (by omega : 3 ≤ 3)) {a, b, c}
      ((F.is3Clique_triple_iff).mpr h)
  have hsingle : ({c} : Finset V).powerset = {∅, {c}} := by
    change (insert c ∅ : Finset V).powerset = _
    rw [Finset.powerset_insert]
    simp
  have hpabac : ({a, b} : Finset V) ≠ {a, c} := by
    intro h
    have h' := congrArg (fun S : Finset V => b ∈ S) h
    simp [hab.symm, hbc] at h'
  have hpabbc : ({a, b} : Finset V) ≠ {b, c} := by
    intro h
    have h' := congrArg (fun S : Finset V => a ∈ S) h
    simp [hab, hac] at h'
  have hpacbc : ({a, c} : Finset V) ≠ {b, c} := by
    intro h
    have h' := congrArg (fun S : Finset V => a ∈ S) h
    simp [hab, hac] at h'
  have hp : ({a, b, c} : Finset V).powersetCard 2 =
      {{a, b}, {a, c}, {b, c}} := by
    simp [Finset.powersetCard_eq_filter, Finset.powerset_insert,
      hsingle, Finset.filter_insert, Finset.filter_singleton, Finset.insert_comm,
      hab, hac, hbc, hab.symm, hac.symm, hbc.symm]
  rw [hp]
  by_cases hab' : F.Adj a b <;> by_cases hac' : F.Adj a c <;>
    by_cases hbc' : F.Adj b c
  all_goals simp_all [SimpleGraph.isIndepSet_iff, Set.Pairwise, F.adj_comm,
    Finset.filter_insert, Finset.filter_singleton, hpabac, hpabbc, hpacbc,
    hab, hac, hbc, hab.symm, hac.symm, hbc.symm]

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma Erdos993G1.indepSetFinset_three_incidence 80322d36a50c5f8eedef153e69e935eaf0bebd0f6e842e96267c37f5a18cb932
lemma indepSetFinset_three_incidence [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (hF : F.IsAcyclic) :
    (F.indepSetFinset 3).card + Nat.card F.edgeSet * (Fintype.card V - 2) =
      (Fintype.card V).choose 3 +
        ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
          ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2 := by
  have hs :
      (∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
        ((if F.IsIndepSet B then 1 else 0) +
          ((B.powersetCard 2).filter (fun E : Finset V => ¬F.IsIndepSet E)).card)) =
      ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
        (1 + ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2) := by
    apply Finset.sum_congr rfl
    intro B hB
    exact triple_local_identity F hF B (Finset.mem_powersetCard.mp hB).2
  simp only [Finset.sum_add_distrib] at hs
  rw [sum_indep_indicator, sum_nonindep_pair_incidence] at hs
  simpa only [Finset.sum_const, smul_eq_mul, mul_one,
    Finset.card_powersetCard, Finset.card_univ] using hs

-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma Erdos993G1.indepCount_three_incidence 3adc3e522766311fc9fcd178eccb3be21853afe0f6f45f08e276fee0469da6e6
lemma indepCount_three_incidence [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (hF : F.IsAcyclic) :
    indepCount F 3 + (Nat.card F.edgeSet : ℤ) * ((Fintype.card V - 2 : ℕ) : ℤ) =
      ((Fintype.card V).choose 3 : ℤ) +
        ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
          ∑ a ∈ B, (((B.filter (F.Adj a)).card).choose 2 : ℤ) := by
  rw [indepCount_eq_card_indepSetFinset]
  exact_mod_cast indepSetFinset_three_incidence F hF

end Erdos993G1

namespace Erdos993G1

-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma Erdos993G1.sum_triple_centered_neighbor_pairs 5d6d13f96ef2b45f6ff273927629e027fd51f7516517e36611d6551eb587a326
lemma sum_triple_centered_neighbor_pairs {V : Type u}
    [Fintype V] [DecidableEq V] (F : SimpleGraph V) [DecidableRel F.Adj] :
    (∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
      ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2) =
      ∑ a : V, (F.degree a).choose 2 := by
  let L : Finset (Σ _B : Finset V, Σ _a : V, Finset V) :=
    ((Finset.univ : Finset V).powersetCard 3).sigma fun B =>
      B.sigma fun a => (B.filter (F.Adj a)).powersetCard 2
  let R : Finset (Σ _a : V, Finset V) :=
    (Finset.univ : Finset V).sigma fun a => (F.neighborFinset a).powersetCard 2
  have hcard : L.card = R.card := by
    refine Finset.card_bij'
      (fun x _ => x.2)
      (fun y _ => ⟨insert y.1 y.2, y⟩) ?_ ?_ ?_ ?_
    · rintro ⟨B, a, N⟩ hx
      simp only [L, Finset.mem_sigma, Finset.mem_powersetCard,
        Finset.subset_univ, true_and] at hx
      obtain ⟨hB, ha, hN, hn⟩ := hx
      simp only [R, Finset.mem_sigma, Finset.mem_univ, true_and,
        Finset.mem_powersetCard]
      refine ⟨?_, hn⟩
      intro w hw
      exact (F.mem_neighborFinset a w).mpr (Finset.mem_filter.mp (hN hw)).2
    · rintro ⟨a, N⟩ hy
      simp only [R, Finset.mem_sigma, Finset.mem_univ, true_and,
        Finset.mem_powersetCard] at hy
      obtain ⟨hN, hn⟩ := hy
      have ha : a ∉ N := by
        intro h
        exact F.irrefl ((F.mem_neighborFinset a a).mp (hN h))
      simp only [L, Finset.mem_sigma, Finset.mem_powersetCard,
        Finset.subset_univ, true_and]
      refine ⟨?_, Finset.mem_insert_self a N, ?_, hn⟩
      · simp [Finset.card_insert_of_notMem ha, hn]
      · intro w hw
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_insert_of_mem hw, (F.mem_neighborFinset a w).mp (hN hw)⟩
    · rintro ⟨B, a, N⟩ hx
      simp only [L, Finset.mem_sigma, Finset.mem_powersetCard,
        Finset.subset_univ, true_and] at hx
      obtain ⟨hB, haB, hN, hn⟩ := hx
      have ha : a ∉ N := by
        intro h
        exact F.irrefl (Finset.mem_filter.mp (hN h)).2
      have hNB : insert a N ⊆ B := by
        intro w hw
        obtain rfl | hw := Finset.mem_insert.mp hw
        · exact haB
        · exact (Finset.mem_filter.mp (hN hw)).1
      have hEq : insert a N = B := by
        apply Finset.eq_of_subset_of_card_le hNB
        simp [hB, Finset.card_insert_of_notMem ha, hn]
      simp only [hEq]
    · rintro ⟨a, N⟩ _
      rfl
  simpa only [L, R, Finset.card_sigma, Finset.card_powersetCard,
    SimpleGraph.card_neighborFinset_eq_degree] using hcard

end Erdos993G1


namespace Erdos993G1

-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma Erdos993G1.indepCount_three_add_edge_incidence b398a1f04b7b79977e8c1fc91c4eff3e3af0fec8c9def9962f181c902fe781da
lemma indepCount_three_add_edge_incidence {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (hF : F.IsAcyclic) :
    indepCount F 3 + (Nat.card F.edgeSet : ℤ) * ((Fintype.card V - 2 : ℕ) : ℤ) =
      ((Fintype.card V).choose 3 : ℤ) +
        ∑ a : V, ((F.degree a).choose 2 : ℤ) := by
  have h := indepSetFinset_three_incidence F hF
  rw [sum_triple_centered_neighbor_pairs] at h
  rw [indepCount_eq_card_indepSetFinset]
  exact_mod_cast h

end Erdos993G1


-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma Erdos993G1.pathEight_indepCount_three bb524232ab0abbb6fcce49130ad7c622cc560864e90d1ba5c875b31fcdb7df1d
namespace Erdos993G1
lemma pathEight_indepCount_three :
    Erdos993G1.indepCount (SimpleGraph.pathGraph 8) 3 = 20 := by
  letI : DecidableRel (SimpleGraph.pathGraph 8).Adj := fun v w =>
    decidable_of_iff (v.val + 1 = w.val ∨ w.val + 1 = v.val) SimpleGraph.pathGraph_adj.symm
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  decide
end Erdos993G1

-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma Erdos993G1.pathEight_indepCount_four 96f4931df8a78e0f60c1b1f2322a6b9df970fb1c9816c354bb19cdede9b73f58
namespace Erdos993G1
lemma pathEight_indepCount_four :
    Erdos993G1.indepCount (SimpleGraph.pathGraph 8) 4 = 5 := by
  letI : DecidableRel (SimpleGraph.pathGraph 8).Adj := fun v w =>
    decidable_of_iff (v.val + 1 = w.val ∨ w.val + 1 = v.val) SimpleGraph.pathGraph_adj.symm
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  decide
end Erdos993G1

-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma Erdos993G1.pathEight_delta_three 5b7d299be8eb5f63b157c579b84373229ed0f906deeec0d7f2908a2eb3a1af3e
namespace Erdos993G1
lemma pathEight_delta_three :
    Erdos993G1.delta (SimpleGraph.pathGraph 8) 3 = -15 := by
  have h := Erdos993G1.delta_nat (SimpleGraph.pathGraph 8) 3
  norm_num [Erdos993G1.pathEight_indepCount_three,
    Erdos993G1.pathEight_indepCount_four] at h
  exact h
end Erdos993G1

namespace Erdos993G1

-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma Erdos993G1.forest_card_edges_add_components 0c2fc141909dd6efa072639e3071ed6f5e6b14787697f3dd2ee2579560bb017f
lemma forest_card_edges_add_components {V : Type u} [Finite V]
    (F : SimpleGraph V) (hF : F.IsAcyclic) :
    Nat.card F.edgeSet + Nat.card F.ConnectedComponent = Nat.card V := by
  classical
  letI := Fintype.ofFinite V
  have hvertices :
      (∑ c : F.ConnectedComponent, Fintype.card c) = Fintype.card V := by
    have hv := Fintype.sum_fiberwise F.connectedComponentMk (fun _ : V => (1 : ℕ))
    simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul, mul_one] at hv
    calc
      _ = ∑ c : F.ConnectedComponent,
          Fintype.card {v : V // F.connectedComponentMk v = c} := by
        apply Finset.sum_congr rfl
        intro c _
        exact Fintype.card_congr (Equiv.refl _)
      _ = _ := hv
  have hdegrees :
      (∑ c : F.ConnectedComponent, ∑ v : c, F.degree v.val) =
        ∑ v : V, F.degree v := by
    exact Fintype.sum_fiberwise F.connectedComponentMk (fun v : V => F.degree v)
  have hcomponent (c : F.ConnectedComponent) :
      (∑ v : c, F.degree v.val) + 2 = 2 * Fintype.card c := by
    have ht := (hF.isTree_connectedComponent c).card_edgeFinset
    have hd := c.toSimpleGraph.sum_degrees_eq_twice_card_edges
    have heq : (∑ v : c, F.degree v.val) =
        ∑ v : c, c.toSimpleGraph.degree v := by
      apply Finset.sum_congr rfl
      intro v _
      symm
      rw [← SimpleGraph.card_neighborSet_eq_degree,
        ← SimpleGraph.card_neighborSet_eq_degree]
      exact Fintype.card_congr
        { toFun := fun w => ⟨w.val.val, w.property⟩
          invFun := fun w =>
            ⟨⟨w.val, c.mem_supp_of_adj_mem_supp v.property w.property⟩, w.property⟩
          left_inv := fun _ => rfl
          right_inv := fun _ => rfl }
    rw [heq, hd]
    omega
  have hsum := congrArg
    (fun f : F.ConnectedComponent → ℕ => ∑ c, f c) (funext hcomponent)
  simp only [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
    smul_eq_mul, ← Finset.mul_sum] at hsum
  rw [hdegrees, hvertices, F.sum_degrees_eq_twice_card_edges] at hsum
  have hcount : F.edgeFinset.card + Fintype.card F.ConnectedComponent =
      Fintype.card V := by omega
  simpa only [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card] using hcount

-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma Erdos993G1.components_card_pos_of_card_pos bd55e00b7dabf7179733a98d36feec04246ff14e0711a9213ddea4545442ebba
lemma components_card_pos_of_card_pos {V : Type u} [Finite V]
    (F : SimpleGraph V) (hV : 0 < Nat.card V) :
    0 < Nat.card F.ConnectedComponent := by
  haveI : Nonempty V := (Finite.card_pos_iff).mp hV
  exact Nat.card_pos

-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma Erdos993G1.connected_of_components_card_eq_one d1fa40fce26c4bacfa1c0213caf51f70364e8df2ff028548f79d089919d34f6a
lemma connected_of_components_card_eq_one {V : Type u}
    (F : SimpleGraph V) (hc : Nat.card F.ConnectedComponent = 1) :
    F.Connected := by
  obtain ⟨hsub, hnonempty⟩ := Nat.card_eq_one_iff_unique.mp hc
  letI := hsub
  obtain ⟨c⟩ := hnonempty
  haveI : Nonempty V := ⟨c.out⟩
  exact ⟨fun v w => SimpleGraph.ConnectedComponent.exact (Subsingleton.elim _ _)⟩

end Erdos993G1


namespace Erdos993G1.PathClassification

open SimpleGraph

-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma Erdos993G1.PathClassification.longestPath_support_closed eb014ed9e3bba006ccd1bfec10b3c8919996695ec39461ac245621e58d2bc87f
lemma longestPath_support_closed {V : Type u} [Finite V] {G : SimpleGraph V}
    {a b : V} (p : G.Walk a b) (hp : p.IsPath)
    (hmax : ∀ (a' b' : V) (q : G.Walk a' b'), q.IsPath → q.length ≤ p.length)
    (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    ∀ v ∈ p.support, ∀ w, G.Adj v w → w ∈ p.support := by
  classical
  intro v hv w hadj
  by_contra hw
  obtain ⟨i, hi, hil⟩ := Walk.mem_support_iff_exists_getVert.mp hv
  by_cases hi0 : i = 0
  · have hva : v = a := by simpa [hi0] using hi.symm
    rw [hva] at hadj
    have hq := hmax w b (p.cons hadj.symm) (hp.cons hw)
    simp only [Walk.length_cons] at hq
    omega
  by_cases hie : i = p.length
  · have hvb : v = b := by simpa [hie] using hi.symm
    rw [hvb] at hadj
    have hq := hmax a w (p.concat hadj) (hp.concat hw hadj)
    simp only [Walk.length_concat] at hq
    omega
  have hit : i < p.length := lt_of_le_of_ne hil hie
  have hcard := hp.ncard_neighborSet_toSubgraph_internal_eq_two hi0 hit
  have hsub : p.toSubgraph.neighborSet (p.getVert i) ⊆ G.neighborSet (p.getVert i) :=
    fun _ h => p.toSubgraph.adj_sub h
  have heq := Set.eq_of_subset_of_ncard_le hsub (by
    rw [hcard]
    exact hdeg (p.getVert i))
  have hin : w ∈ p.toSubgraph.neighborSet (p.getVert i) := by
    rw [heq, hi]
    exact hadj
  exact hw (p.mem_support_of_adj_toSubgraph hin.symm)

-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma Erdos993G1.PathClassification.longestPath_spanning 36b63e828d4fb832735cac7939db6767d6c1bda373c2c2e1903de4ee5e0d00bf
lemma longestPath_spanning {V : Type u} [Finite V] {G : SimpleGraph V}
    (hc : G.Connected) {a b : V} (p : G.Walk a b) (hp : p.IsPath)
    (hmax : ∀ (a' b' : V) (q : G.Walk a' b'), q.IsPath → q.length ≤ p.length)
    (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    p.toSubgraph.IsSpanning := by
  have hclosed := longestPath_support_closed p hp hmax hdeg
  have hwalk : ∀ {v w : V} (q : G.Walk v w), v ∈ p.support → w ∈ p.support := by
    intro v w q
    induction q with
    | nil => exact id
    | cons hadj q ih => exact fun hv => ih (hclosed _ hv _ hadj)
  intro v
  exact p.mem_verts_toSubgraph.mpr (hwalk (hc a v).some p.start_mem_support)

-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma Erdos993G1.PathClassification.tree_maxDegreeTwo_iso_pathGraph_card 29ac2e202882dce5f177871f54ca5f2de2b04889ab0c3c813bc2c99d6e75d30b
lemma tree_maxDegreeTwo_iso_pathGraph_card {V : Type u} [Finite V] {G : SimpleGraph V}
    (hG : G.IsTree) (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    Nonempty (G ≃g SimpleGraph.pathGraph (Nat.card V)) := by
  classical
  letI : Nonempty V := hG.connected.nonempty
  obtain ⟨a, b, p, hp, hmax⟩ := Walk.exists_isPath_forall_isPath_length_le_length G
  have hspan := longestPath_spanning hG.connected p hp hmax hdeg
  let e := p.toSubgraph.spanningCoeEquivCoeOfSpanning hspan
  have hc : p.toSubgraph.spanningCoe.Connected :=
    e.connected_iff.mpr p.toSubgraph_connected.coe
  have heq : p.toSubgraph.spanningCoe = G := le_antisymm
    p.toSubgraph.spanningCoe_le ((isTree_iff_minimal_connected.mp hG).2 hc
      p.toSubgraph.spanningCoe_le)
  let e2 : G ≃g p.toSubgraph.coe :=
    cast (congrArg (fun H : SimpleGraph V => H ≃g p.toSubgraph.coe) heq) e
  let e3 : G ≃g SimpleGraph.pathGraph (p.length + 1) :=
    e2.trans hp.pathGraphIsoToSubgraph.symm
  have hlen : Nat.card V = p.length + 1 := by
    simpa using Nat.card_congr e3.toEquiv
  exact ⟨cast (congrArg (fun n => G ≃g SimpleGraph.pathGraph n) hlen.symm) e3⟩

-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma Erdos993G1.PathClassification.tree_order_eight_maxDegreeTwo_iso_pathGraph 532fc845394e40f375e4dfd3b0fe4d6cb419a03f6e0ce849a7f2ede4000acc3b
lemma tree_order_eight_maxDegreeTwo_iso_pathGraph {V : Type u} [Finite V]
    {G : SimpleGraph V} (hG : G.IsTree) (horder : Nat.card V = 8)
    (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    Nonempty (G ≃g SimpleGraph.pathGraph 8) := by
  exact cast (congrArg (fun n => Nonempty (G ≃g SimpleGraph.pathGraph n)) horder)
    (tree_maxDegreeTwo_iso_pathGraph_card hG hdeg)

end Erdos993G1.PathClassification


-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN lemma Erdos993G1.lowRankArithmetic 515412067b7b41b7875cdd462f9bead64db5c8518928deac575bd901634dba68
namespace Erdos993G1
lemma lowRankArithmetic
    (m p x : ℕ) (c S d0 d1 d2 : ℤ)
    (hp : p ≤ 5) (hm : 2 * p - 3 < m) (hx : x < p - 2)
    (hc : 1 ≤ c) (hS : 0 ≤ S) (hSdeg : (m : ℤ) - 2 * c ≤ S)
    (hd0 : d0 = (m : ℤ) - 1)
    (hd1 : 2 * d1 = (m : ℤ) * ((m : ℤ) - 5) + 2 * c)
    (hd2 : 6 * d2 = (m : ℤ) * ((m : ℤ) - 1) * ((m : ℤ) - 5) -
      6 * ((m : ℤ) - c) * ((m : ℤ) - 3) + 6 * S)
    (hneg : (if x = 0 then d0 else if x = 1 then d1 else d2) < 0) :
    p = 5 ∧ m = 8 ∧ c = 1 ∧ S = 6 ∧ x = 2 := by
  have hp3 : 3 ≤ p := by omega
  have hm4 : 4 ≤ m := by omega
  have hm4z : (4 : ℤ) ≤ m := by exact_mod_cast hm4
  have hx2 : x ≤ 2 := by omega
  have hx0 : x ≠ 0 := by
    intro h
    simp only [h, ↓reduceIte] at hneg
    omega
  have hx1 : x ≠ 1 := by
    intro h
    have hp4 : 4 ≤ p := by omega
    have hm6 : 6 ≤ m := by omega
    have hm6z : (6 : ℤ) ≤ m := by exact_mod_cast hm6
    have hmul : (0 : ℤ) < (m : ℤ) * ((m : ℤ) - 5) :=
      mul_pos (by omega) (by omega)
    simp only [h, Nat.one_ne_zero, ↓reduceIte] at hneg
    nlinarith
  have hxeq : x = 2 := by omega
  have hpeq : p = 5 := by omega
  have hm8 : 8 ≤ m := by omega
  have hm8z : (8 : ℤ) ≤ m := by exact_mod_cast hm8
  have hd2neg : d2 < 0 := by simpa [hxeq] using hneg
  have hmle : m ≤ 8 := by
    by_contra h
    have hm9 : 9 ≤ m := by omega
    have hm9z : (9 : ℤ) ≤ m := by exact_mod_cast hm9
    have ht : 0 ≤ ((m : ℤ) - 1) * ((m : ℤ) - 2) * ((m : ℤ) - 9) :=
      mul_nonneg (mul_nonneg (by omega) (by omega)) (by omega)
    have he : 0 ≤ (c - 1) * ((m : ℤ) - 3) :=
      mul_nonneg (by omega) (by omega)
    nlinarith
  have hmeq : m = 8 := by omega
  have hd2eight : d2 = 5 * c - 12 + S := by
    norm_num [hmeq] at hd2
    omega
  have hSdeg8 : (8 : ℤ) - 2 * c ≤ S := by simpa [hmeq] using hSdeg
  have hceq : c = 1 := by omega
  have hSeq : S = 6 := by omega
  exact ⟨hpeq, hmeq, hceq, hSeq, hxeq⟩
end Erdos993G1

-- VERITYOS ENTRY 83 END

-- VERITYOS ENTRY 84 BEGIN lemma Erdos993G1.degreeDefect_nonneg c0af78d44dfd3885ca0064f109b826be321d95cc05ed318d6fd89b3a7ea8ab34
namespace Erdos993G1
lemma degreeDefect_nonneg (d : ℕ) :
    (0 : ℤ) ≤ (d.choose 2 : ℤ) - (d : ℤ) + 1 := by
  cases d with
  | zero => norm_num
  | succ n =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    have h := (Nat.cast_nonneg (n.choose 2) : (0 : ℤ) ≤ n.choose 2)
    omega
end Erdos993G1

-- VERITYOS ENTRY 84 END

-- VERITYOS ENTRY 85 BEGIN lemma Erdos993G1.degreeDefect_eq_zero_iff 31a83e1f7701c3f1e87d3432b23ed0c0cbffe6643c7a578fa4f4fd79d6ccc1b3
namespace Erdos993G1
lemma degreeDefect_eq_zero_iff (d : ℕ) :
    (d.choose 2 : ℤ) - (d : ℤ) + 1 = 0 ↔ d = 1 ∨ d = 2 := by
  cases d with
  | zero => norm_num
  | succ n =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    change ((n : ℤ) + (n.choose 2 : ℤ)) - ((n : ℤ) + 1) + 1 = 0 ↔
      n + 1 = 1 ∨ n + 1 = 2
    have hz : (n.choose 2 : ℤ) = 0 ↔ n < 2 := by
      exact_mod_cast (Nat.choose_eq_zero_iff (n := n) (k := 2))
    constructor
    · intro h
      have hn : n < 2 := hz.mp (by omega)
      omega
    · intro h
      have hn : n < 2 := by omega
      have he := hz.mpr hn
      omega
end Erdos993G1

-- VERITYOS ENTRY 85 END

-- VERITYOS ENTRY 86 BEGIN lemma Erdos993G1.degreeChoose_sum_lower 534ca40000aad1c52fea971962489fb49930590d87823de935d8c3306f2c9a7d
namespace Erdos993G1
lemma degreeChoose_sum_lower {V : Type*} [Fintype V] (d : V → ℕ) :
    (∑ v, (d v : ℤ)) - Fintype.card V ≤ ∑ v, ((d v).choose 2 : ℤ) := by
  have h : 0 ≤ ∑ v, (((d v).choose 2 : ℤ) - (d v : ℤ) + 1) :=
    Finset.sum_nonneg (fun v _ => Erdos993G1.degreeDefect_nonneg (d v))
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, mul_one] at h
  omega
end Erdos993G1

-- VERITYOS ENTRY 86 END

-- VERITYOS ENTRY 87 BEGIN lemma Erdos993G1.degreeChoose_sum_equality 6ba9da504873bbc5d30dc556748dde4808e240fc2a48ac21ec9b09f41b543032
namespace Erdos993G1
lemma degreeChoose_sum_equality {V : Type*} [Fintype V] (d : V → ℕ)
    (h : (∑ v, ((d v).choose 2 : ℤ)) = (∑ v, (d v : ℤ)) - Fintype.card V) :
    ∀ v, d v = 1 ∨ d v = 2 := by
  have hsum : ∑ v, (((d v).choose 2 : ℤ) - (d v : ℤ) + 1) = 0 := by
    simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
      Finset.card_univ, nsmul_eq_mul, mul_one]
    omega
  have hz := (Finset.sum_eq_zero_iff_of_nonneg
    (fun v (_ : v ∈ (Finset.univ : Finset V)) =>
      Erdos993G1.degreeDefect_nonneg (d v))).mp hsum
  intro v
  exact (Erdos993G1.degreeDefect_eq_zero_iff (d v)).mp (hz v (Finset.mem_univ v))
end Erdos993G1

-- VERITYOS ENTRY 87 END

-- VERITYOS ENTRY 88 BEGIN lemma Erdos993G1.scaledChooseTwo 6b105703a92fa66970f1d3d7f53f590ea3432cd2c0cde23a3782c2fe174267b6
namespace Erdos993G1
lemma scaledChooseTwo (n : ℕ) :
    2 * (n.choose 2 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    change 2 * ((n : ℤ) + (n.choose 2 : ℤ)) =
      ((n : ℤ) + 1) * ((n : ℤ) + 1 - 1)
    nlinarith
end Erdos993G1

-- VERITYOS ENTRY 88 END

-- VERITYOS ENTRY 89 BEGIN lemma Erdos993G1.scaledChooseThree 656d1844e1e3e7c162344f203df73ecc67fb345a6cb1fd0f14f187e87385b15e
namespace Erdos993G1
lemma scaledChooseThree (n : ℕ) :
    6 * (n.choose 3 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) * ((n : ℤ) - 2) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.cast_add, Nat.cast_succ]
    change 6 * ((n.choose 2 : ℤ) + (n.choose 3 : ℤ)) =
      ((n : ℤ) + 1) * ((n : ℤ) + 1 - 1) * ((n : ℤ) + 1 - 2)
    nlinarith [Erdos993G1.scaledChooseTwo n]
end Erdos993G1

-- VERITYOS ENTRY 89 END

-- VERITYOS ENTRY 90 BEGIN lemma Erdos993G1.lowRankForestClassification_of_count_identities 15ceb7feeb88dfeeb4f3178bff36a9308fc8c95e56f8eb6e60962e7a9f3a69fa
namespace Erdos993G1
lemma lowRankForestClassification_of_count_identities
    {V : Type u} [Fintype V] [DecidableEq V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (p : ℕ) (hF : F.IsAcyclic) (hp : p ≤ 5)
    (hm : 2 * p - 3 < Nat.card V) (hx : Erdos993G1.firstDescent F < p - 2)
    (hpair : Erdos993G1.indepCount F 2 + (Nat.card F.edgeSet : ℤ) =
      ((Nat.card V).choose 2 : ℤ))
    (htriple : Erdos993G1.indepCount F 3 +
      (Nat.card F.edgeSet : ℤ) * ((Fintype.card V - 2 : ℕ) : ℤ) =
      ((Fintype.card V).choose 3 : ℤ) + ∑ a : V, ((F.degree a).choose 2 : ℤ)) :
    p = 5 ∧ Nonempty (F ≃g SimpleGraph.pathGraph 8) ∧ Erdos993G1.delta F 3 = -15 := by
  let m : ℕ := Nat.card V
  let c : ℤ := Nat.card F.ConnectedComponent
  let S : ℤ := ∑ a : V, ((F.degree a).choose 2 : ℤ)
  have hncard : Fintype.card V = m := by
    exact Nat.card_eq_fintype_card.symm
  have hp3 : 3 ≤ p := by omega
  have hm4 : 4 ≤ m := by dsimp [m]; omega
  have hc : 1 ≤ c := by
    have h := Erdos993G1.components_card_pos_of_card_pos F (show 0 < Nat.card V by omega)
    dsimp [c]
    exact_mod_cast h
  have he : (Nat.card F.edgeSet : ℤ) = (m : ℤ) - c := by
    have h : (Nat.card F.edgeSet : ℤ) + (Nat.card F.ConnectedComponent : ℤ) =
        (Nat.card V : ℤ) := by
      exact_mod_cast Erdos993G1.forest_card_edges_add_components F hF
    exact eq_sub_iff_add_eq.mpr h
  have hS : 0 ≤ S := Finset.sum_nonneg (fun _ _ => Nat.cast_nonneg _)
  have hdegreeSum : (∑ v, (F.degree v : ℤ)) = 2 * (Nat.card F.edgeSet : ℤ) := by
    rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
    exact_mod_cast F.sum_degrees_eq_twice_card_edges
  have hSdeg : (m : ℤ) - 2 * c ≤ S := by
    have h := Erdos993G1.degreeChoose_sum_lower (fun v : V => F.degree v)
    rw [hdegreeSum, hncard] at h
    change 2 * (Nat.card F.edgeSet : ℤ) - (m : ℤ) ≤ S at h
    omega
  have hd0 : Erdos993G1.delta F 0 = (m : ℤ) - 1 := Erdos993G1.delta_zero F
  have hi1 : Erdos993G1.indepCount F 1 = (m : ℤ) := Erdos993G1.indepCount_one F
  have hd1raw : Erdos993G1.delta F 1 =
      Erdos993G1.indepCount F 2 - Erdos993G1.indepCount F 1 := by
    simpa using Erdos993G1.delta_nat F 1
  have hd2raw : Erdos993G1.delta F 2 =
      Erdos993G1.indepCount F 3 - Erdos993G1.indepCount F 2 := by
    simpa using Erdos993G1.delta_nat F 2
  change Erdos993G1.indepCount F 2 + (Nat.card F.edgeSet : ℤ) = (m.choose 2 : ℤ) at hpair
  rw [hncard] at htriple
  have hsub : ((m - 2 : ℕ) : ℤ) = (m : ℤ) - 2 := Nat.cast_sub (by omega)
  rw [hsub] at htriple
  change Erdos993G1.indepCount F 3 + (Nat.card F.edgeSet : ℤ) * ((m : ℤ) - 2) =
    (m.choose 3 : ℤ) + S at htriple
  have hd1 : 2 * Erdos993G1.delta F 1 = (m : ℤ) * ((m : ℤ) - 5) + 2 * c := by
    nlinarith [Erdos993G1.scaledChooseTwo m]
  have hd2 : 6 * Erdos993G1.delta F 2 =
      (m : ℤ) * ((m : ℤ) - 1) * ((m : ℤ) - 5) -
      6 * ((m : ℤ) - c) * ((m : ℤ) - 3) + 6 * S := by
    nlinarith [Erdos993G1.scaledChooseTwo m, Erdos993G1.scaledChooseThree m]
  have hneg : (if Erdos993G1.firstDescent F = 0 then Erdos993G1.delta F 0
      else if Erdos993G1.firstDescent F = 1 then Erdos993G1.delta F 1
      else Erdos993G1.delta F 2) < 0 := by
    have h := Erdos993G1.delta_firstDescent_neg F
    by_cases h0 : Erdos993G1.firstDescent F = 0
    · simpa [h0] using h
    by_cases h1 : Erdos993G1.firstDescent F = 1
    · simpa [h1] using h
    have h2 : Erdos993G1.firstDescent F = 2 := by omega
    simpa [h2] using h
  obtain ⟨hp5, hm8, hc1, hS6, _⟩ := Erdos993G1.lowRankArithmetic m p
    (Erdos993G1.firstDescent F) c S (Erdos993G1.delta F 0)
    (Erdos993G1.delta F 1) (Erdos993G1.delta F 2)
    hp hm hx hc hS hSdeg hd0 hd1 hd2 hneg
  have hc1nat : Nat.card F.ConnectedComponent = 1 := by
    dsimp [c] at hc1
    exact_mod_cast hc1
  have htree : F.IsTree := ⟨Erdos993G1.connected_of_components_card_eq_one F hc1nat, hF⟩
  have hsumEq : (∑ a : V, ((F.degree a).choose 2 : ℤ)) =
      (∑ a : V, (F.degree a : ℤ)) - Fintype.card V := by
    rw [hdegreeSum, hncard]
    change S = 2 * (Nat.card F.edgeSet : ℤ) - (m : ℤ)
    omega
  have hdeg := Erdos993G1.degreeChoose_sum_equality (fun v : V => F.degree v) hsumEq
  have hdegCard : ∀ v, Nat.card (F.neighborSet v) ≤ 2 := by
    intro v
    rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]
    rcases hdeg v with h | h <;> omega
  obtain ⟨e⟩ := Erdos993G1.PathClassification.tree_order_eight_maxDegreeTwo_iso_pathGraph
    htree hm8 hdegCard
  refine ⟨hp5, ⟨e⟩, ?_⟩
  rw [Erdos993G1.delta_iso e, Erdos993G1.pathEight_delta_three]
end Erdos993G1

namespace Erdos993G1.Deletion

open SimpleGraph

-- VERITYOS ENTRY 90 END

-- VERITYOS ENTRY 91 BEGIN lemma Erdos993G1.Deletion.deleteVerts_union_iso 84567459ae6e5bc695dfa19c17afc6bb310c8826f9edac168b186ef817a46594
lemma deleteVerts_union_iso {V : Type u} (F : SimpleGraph V) (S Q : Set V) :
    Nonempty (deleteVerts F (S ∪ Q) ≃g
      deleteVerts (deleteVerts F S) {a | a.val ∈ Q}) := by
  refine ⟨{
    toFun := fun a => ⟨⟨a.val, fun hs => a.prop (Or.inl hs)⟩,
      fun hq => a.prop (Or.inr hq)⟩
    invFun := fun a => ⟨a.val.val, fun h => h.elim a.val.prop a.prop⟩
    left_inv := by intro a; rfl
    right_inv := by intro a; rfl
    map_rel_iff' := by intros; rfl
  }⟩

-- VERITYOS ENTRY 91 END

-- VERITYOS ENTRY 92 BEGIN lemma Erdos993G1.Deletion.ambientH_iso_delete_ambientA 769b68f49bb5a60a0b07c05242ca0c137d2384e08b8244b46302a6ebf4c54759
lemma ambientH_iso_delete_ambientA {V : Type u} (T : SimpleGraph V) (v g : V) :
    Nonempty (ambientH T v g ≃g
      deleteVerts (ambientA T v) {a | a.val = g}) := by
  exact deleteVerts_union_iso T (closedNeighborhood T v) {g}

-- VERITYOS ENTRY 92 END

-- VERITYOS ENTRY 93 BEGIN lemma Erdos993G1.Deletion.original_residual_deletion_set_eq 8e7124c437efa47597a6ff309c3511759132571e7f6e12f8c10af4890b741a42
lemma original_residual_deletion_set_eq {V : Type u} (T : SimpleGraph V)
    (v s g : V) (hvs : T.Adj v s) :
    (closedNeighborhood T v ∪ {g}) ∪ {w | T.Adj g w ∧ w ≠ s} =
      closedNeighborhood T v ∪ closedNeighborhood T g := by
  ext w
  simp only [closedNeighborhood, Set.mem_union, Set.mem_singleton_iff, Set.mem_setOf_eq]
  by_cases hws : w = s <;> aesop

-- VERITYOS ENTRY 93 END

-- VERITYOS ENTRY 94 BEGIN lemma Erdos993G1.Deletion.residual_iso_delete_ambientH 36d14d97e9d35db700fda92549e71479c33ef1c5144afedcd7f7c30dafcf9ffd
lemma residual_iso_delete_ambientH {V : Type u} (T : SimpleGraph V)
    (v s g : V) (hvs : T.Adj v s) :
    Nonempty (residual T v g ≃g
      deleteVerts (ambientH T v g) {a | T.Adj g a.val ∧ a.val ≠ s}) := by
  obtain ⟨e⟩ := deleteVerts_union_iso T (closedNeighborhood T v ∪ {g})
    {w | T.Adj g w ∧ w ≠ s}
  exact ⟨cast (congrArg (fun S : Set V =>
    deleteVerts T S ≃g
      deleteVerts (ambientH T v g) {a | T.Adj g a.val ∧ a.val ≠ s})
    (original_residual_deletion_set_eq T v s g hvs)) e⟩

-- VERITYOS ENTRY 94 END

-- VERITYOS ENTRY 95 BEGIN lemma Erdos993G1.Deletion.other_support_neighbor_survives 759d52f4d9f8cfa0ac2ee0493e3e1ff7003954d01a5e8ce54da8fa6bbb7a4dbd
lemma other_support_neighbor_survives {V : Type u} [Finite V] (T : SimpleGraph V)
    (v s g : V) (hleaf : vertexDegree T v = 1)
    (hvs : T.Adj v s) (hsg : T.Adj s g) (hgv : g ≠ v) :
    g ∉ closedNeighborhood T v := by
  have hset : ({s} : Set V) = T.neighborSet v := Set.eq_of_subset_of_ncard_le
    (Set.singleton_subset_iff.mpr hvs) (by
      rw [Set.ncard_singleton, ← Nat.card_coe_set_eq]
      exact hleaf.le)
  rintro (heq | hadj)
  · exact hgv heq
  · have hmem : g ∈ T.neighborSet v := hadj
    rw [← hset] at hmem
    exact hsg.ne (Set.mem_singleton_iff.mp hmem).symm

-- VERITYOS ENTRY 95 END

-- VERITYOS ENTRY 96 BEGIN lemma Erdos993G1.Deletion.ambientH_iso_delete_typed_survivor ea96d8a8c373dc902349ab1bbe029041639fc399ea5006f88346305fea97a1fe
lemma ambientH_iso_delete_typed_survivor {V : Type u} (T : SimpleGraph V) (v g : V)
    (hg : g ∉ closedNeighborhood T v) :
    Nonempty (ambientH T v g ≃g
      deleteVerts (ambientA T v) {⟨g, hg⟩}) := by
  have hset : ({a : {w : V // w ∉ closedNeighborhood T v} | a.val = g}) =
      {⟨g, hg⟩} := by
    ext a
    simp only [Set.mem_setOf_eq, Set.mem_singleton_iff, Subtype.ext_iff]
  obtain ⟨e⟩ := ambientH_iso_delete_ambientA T v g
  exact ⟨cast (congrArg (fun S => ambientH T v g ≃g deleteVerts (ambientA T v) S)
    hset) e⟩

-- VERITYOS ENTRY 96 END

-- VERITYOS ENTRY 97 BEGIN lemma Erdos993G1.Deletion.leaf_ambientH_iso_delete_typed_survivor 5e04878ee268c444211ced7b140695f5d81c75d0207a1892d19938d73463f14a
lemma leaf_ambientH_iso_delete_typed_survivor {V : Type u} [Finite V]
    (T : SimpleGraph V) (v s g : V) (hleaf : vertexDegree T v = 1)
    (hvs : T.Adj v s) (hsg : T.Adj s g) (hgv : g ≠ v) :
    Nonempty (ambientH T v g ≃g deleteVerts (ambientA T v)
      {⟨g, other_support_neighbor_survives T v s g hleaf hvs hsg hgv⟩}) :=
  ambientH_iso_delete_typed_survivor T v g
    (other_support_neighbor_survives T v s g hleaf hvs hsg hgv)

end Erdos993G1.Deletion


-- VERITYOS ENTRY 97 END

-- VERITYOS ENTRY 98 BEGIN lemma Erdos993G1.lowRankForestClassification 8a99c9870a3dda614b71724a41fbe81cde8fcc51f82bdb87405ee8246443a0a4
namespace Erdos993G1
lemma lowRankForestClassification {V : Type u} [Finite V]
    (F : SimpleGraph V) (p : ℕ) (hF : F.IsAcyclic) (hp : p ≤ 5)
    (hm : 2 * p - 3 < Nat.card V) (hx : Erdos993G1.firstDescent F < p - 2) :
    p = 5 ∧ Nonempty (F ≃g SimpleGraph.pathGraph 8) ∧
      Erdos993G1.delta F 3 = -15 := by
  classical
  letI := Fintype.ofFinite V
  exact Erdos993G1.lowRankForestClassification_of_count_identities F p hF hp hm hx
    (Erdos993G1.indepCount_two_add_edges F)
    (Erdos993G1.indepCount_three_add_edge_incidence F hF)
end Erdos993G1

-- VERITYOS ENTRY 98 END

-- VERITYOS ENTRY 99 BEGIN lemma Erdos993G1.ordinaryG1_lowRank bacd1dc41c780497e70669674e2fca3693cd01535afa5e23cfe014aab0048681
namespace Erdos993G1
lemma ordinaryG1_lowRank {W : Type u} [Finite W]
    (T : SimpleGraph W) (v s g : W) (pT : ℕ)
    (hG : Erdos993G1.ordinaryG1Guards T v s g pT) (hp : pT ≤ 5) :
    Erdos993G1.delta (Erdos993G1.residual T v g) ((pT : ℤ) - 2) ≤ 0 := by
  rcases hG with ⟨hT, hleaf, hvs, hsupport, hsg, hgv, hpT, hgamma, hsize, hcross⟩
  have hF := Erdos993G1.residual_isAcyclic hT.isAcyclic v g
  obtain ⟨hp5, hiso, hdelta⟩ := Erdos993G1.lowRankForestClassification
    (Erdos993G1.residual T v g) pT hF hp hsize hcross
  have hr : (pT : ℤ) - 2 = 3 := by omega
  rw [hr, hdelta]
  norm_num
end Erdos993G1

-- VERITYOS ENTRY 99 END

-- VERITYOS ENTRY 100 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_nat 586e57d9bbf57356d8d3f141a64048b60b0025dd334aa3cb43cf0c05b86fd40b
namespace Erdos993G1.FirstWide

lemma binomCoeff_nat (n k : ℕ) : binomCoeff n (k : ℤ) = (n.choose k : ℤ) := by
  simp [binomCoeff]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 100 END

-- VERITYOS ENTRY 101 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_neg 0fd093d56b6fbbc606c172582bf0269994ddb4b44a43255450640e15ac99592f
namespace Erdos993G1.FirstWide

lemma binomCoeff_neg (n : ℕ) {k : ℤ} (hk : k < 0) : binomCoeff n k = 0 := by
  simp [binomCoeff, not_le.mpr hk]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 101 END

-- VERITYOS ENTRY 102 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_nat_add_one 76f6bc26fab79b1f54a080fdcc272777f055775d5150d9b65db3ba4ebe8c4f1a
namespace Erdos993G1.FirstWide

lemma binomCoeff_nat_add_one (n k : ℕ) :
    binomCoeff n ((k : ℤ) + 1) = (n.choose (k + 1) : ℤ) := by
  simpa only [Nat.cast_add, Nat.cast_one] using binomCoeff_nat n (k + 1)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 102 END

-- VERITYOS ENTRY 103 BEGIN lemma Erdos993G1.FirstWide.binomCoeff_nat_sub_one fa5eacaa79aa247673c3bd77e20ab7280a3496796f6c6fe1d9bca152cf171c62
namespace Erdos993G1.FirstWide

lemma binomCoeff_nat_sub_one (n k : ℕ) (hk : 1 ≤ k) :
    binomCoeff n ((k : ℤ) - 1) = (n.choose (k - 1) : ℤ) := by
  have h : (k : ℤ) - 1 = ((k - 1 : ℕ) : ℤ) := by omega
  rw [h, binomCoeff_nat]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 103 END

-- VERITYOS ENTRY 104 BEGIN lemma Erdos993G1.FirstWide.choose_step_strict a77a46e8e0db35c873c8c5bcfe3054e7201a5ddde6de100392fa5146d748b0a2
namespace Erdos993G1.FirstWide

lemma choose_step_strict {n k : ℕ} (h : 2 * k + 1 < n) :
    n.choose k < n.choose (k + 1) := by
  have hp : 0 < n.choose k := Nat.choose_pos (by omega)
  have he := Nat.choose_succ_right_eq n k
  have hd : k + 1 < n - k := by omega
  have hm := Nat.mul_lt_mul_of_pos_left hd hp
  rw [← he] at hm
  exact Nat.lt_of_mul_lt_mul_right hm

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 104 END

-- VERITYOS ENTRY 105 BEGIN lemma Erdos993G1.FirstWide.choose_step_nonpos 708d7e4957a1c64891a918c1199c643b3442f186a588790b914669abafaa6a4b
namespace Erdos993G1.FirstWide

lemma choose_step_nonpos {n k : ℕ} (h : n ≤ 2 * k + 1) :
    n.choose (k + 1) ≤ n.choose k := by
  have he := Nat.choose_succ_right_eq n k
  have hd : n - k ≤ k + 1 := by omega
  have hm := Nat.mul_le_mul_left (n.choose k) hd
  rw [← he] at hm
  exact Nat.le_of_mul_le_mul_right hm (by omega)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 105 END

-- VERITYOS ENTRY 106 BEGIN lemma Erdos993G1.FirstWide.choose_step_strict_down 305669e8111e1d6db019e3060bddd15634031e5adaec725c4093fb24e2ef154f
namespace Erdos993G1.FirstWide

lemma choose_step_strict_down {n k : ℕ} (hk : k ≤ n) (h : n < 2 * k + 1) :
    n.choose (k + 1) < n.choose k := by
  have hp : 0 < n.choose k := Nat.choose_pos hk
  have he := Nat.choose_succ_right_eq n k
  have hd : n - k < k + 1 := by omega
  have hm := Nat.mul_lt_mul_of_pos_left hd hp
  rw [← he] at hm
  exact Nat.lt_of_mul_lt_mul_right hm

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 106 END

-- VERITYOS ENTRY 107 BEGIN lemma Erdos993G1.FirstWide.edgeless_expression_pos 59973140081fcd6f5a79d037bb406542ef7339ee2c5626efcad1b6652747a85e
namespace Erdos993G1.FirstWide

lemma edgeless_expression_pos {r k : ℕ} (hk : k ≤ r) :
    0 < binomCoeff (2 * r + 2) ((k : ℤ) + 1) -
      binomCoeff (2 * r + 2) (k : ℤ) := by
  rw [binomCoeff_nat_add_one, binomCoeff_nat]
  have h := choose_step_strict (n := 2 * r + 2) (k := k) (by omega)
  exact sub_pos.mpr (by exact_mod_cast h)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 107 END

-- VERITYOS ENTRY 108 BEGIN lemma Erdos993G1.FirstWide.one_edge_expression_pos cf9dea25b395f63394ba326710679e7151f6777e79be14e92ee54b872628e186
namespace Erdos993G1.FirstWide

lemma one_edge_expression_pos {r k : ℕ} (hr : 1 ≤ r) (hk : k ≤ r) :
    0 < (binomCoeff (2 * r) ((k : ℤ) + 1) +
      2 * binomCoeff (2 * r) (k : ℤ)) -
      (binomCoeff (2 * r) (k : ℤ) +
        2 * binomCoeff (2 * r) ((k : ℤ) - 1)) := by
  by_cases hk0 : k = 0
  · subst k
    simp [binomCoeff]
    omega
  have hk1 : 1 ≤ k := by omega
  rw [binomCoeff_nat_add_one, binomCoeff_nat, binomCoeff_nat_sub_one _ _ hk1]
  by_cases hkr : k = r
  · subst k
    have he : (2 * r).choose (r + 1) = (2 * r).choose (r - 1) :=
      Nat.choose_symm_of_eq_add (by omega)
    have hp := choose_step_strict (n := 2 * r) (k := r - 1) (by omega)
    have hpred : r - 1 + 1 = r := by omega
    rw [hpred] at hp
    rw [he]
    have hp' : ((2 * r).choose (r - 1) : ℤ) < ((2 * r).choose r : ℤ) := by
      exact_mod_cast hp
    linarith
  · have hc := choose_step_strict (n := 2 * r) (k := k) (by omega)
    have hp := choose_step_strict (n := 2 * r) (k := k - 1) (by omega)
    have hpred : k - 1 + 1 = k := by omega
    rw [hpred] at hp
    have hc' : ((2 * r).choose k : ℤ) < ((2 * r).choose (k + 1) : ℤ) := by
      exact_mod_cast hc
    have hp' : ((2 * r).choose (k - 1) : ℤ) < ((2 * r).choose k : ℤ) := by
      exact_mod_cast hp
    linarith

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 108 END

-- VERITYOS ENTRY 109 BEGIN lemma Erdos993G1.FirstWide.center_expression_nonpos b895ef3085345a90b75294f9d1e35cbeadb516c06c0b7b3513d5b8f6939cd6ed
namespace Erdos993G1.FirstWide

lemma center_expression_nonpos {r q : ℕ} (hr : 1 ≤ r) (hq : q ≤ 2 * r - 1) :
    (binomCoeff (2 * r + 1) ((r : ℤ) + 1) + binomCoeff q (r : ℤ)) -
      (binomCoeff (2 * r + 1) (r : ℤ) + binomCoeff q ((r : ℤ) - 1)) ≤ 0 := by
  rw [binomCoeff_nat_add_one, binomCoeff_nat, binomCoeff_nat,
    binomCoeff_nat_sub_one _ _ hr, Nat.choose_symm_half]
  have h := choose_step_nonpos (n := q) (k := r - 1) (by omega)
  have hpred : r - 1 + 1 = r := by omega
  rw [hpred] at h
  have h' : (q.choose r : ℤ) ≤ (q.choose (r - 1) : ℤ) := by exact_mod_cast h
  linarith

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 109 END

-- VERITYOS ENTRY 110 BEGIN lemma Erdos993G1.FirstWide.triangle_expression_neg 0d48996514007adc12fa19659b5b5ad485218f6d6764d136ef85229c475a9f9e
namespace Erdos993G1.FirstWide

lemma triangle_expression_neg {r : ℕ} (hr : 1 ≤ r) :
    (binomCoeff (2 * r - 1) ((r : ℤ) + 1) +
      3 * binomCoeff (2 * r - 1) (r : ℤ)) -
      (binomCoeff (2 * r - 1) (r : ℤ) +
        3 * binomCoeff (2 * r - 1) ((r : ℤ) - 1)) < 0 := by
  rw [binomCoeff_nat_add_one, binomCoeff_nat, binomCoeff_nat_sub_one _ _ hr]
  have he : (2 * r - 1).choose r = (2 * r - 1).choose (r - 1) :=
    Nat.choose_symm_of_eq_add (by omega)
  have h := choose_step_strict_down (n := 2 * r - 1) (k := r) (by omega) (by omega)
  have h' : ((2 * r - 1).choose (r + 1) : ℤ) < ((2 * r - 1).choose r : ℤ) := by
    exact_mod_cast h
  rw [he] at h' ⊢
  linarith

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 110 END

-- VERITYOS ENTRY 111 BEGIN lemma Erdos993G1.FirstWide.delta_pos_of_edgeless_counts c30bada5713a560a315d3aa627387479a741f4fc16240a009a035ebe456372f1
namespace Erdos993G1.FirstWide

lemma delta_pos_of_edgeless_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hn : Nat.card Y = 2 * r + 2)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (Nat.card Y) (j : ℤ))
    {k : ℕ} (hk : k ≤ r) : 0 < delta G (k : ℤ) := by
  rw [delta_nat, hc, hc, hn]
  simpa only [Nat.cast_add, Nat.cast_one] using edgeless_expression_pos hk

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 111 END

-- VERITYOS ENTRY 112 BEGIN lemma Erdos993G1.FirstWide.delta_pos_of_one_edge_counts f74414a03a900086794954e466ea63fc1e2bf77d023ebaf28de34f29b60ce9bb
namespace Erdos993G1.FirstWide

lemma delta_pos_of_one_edge_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card Y = 2 * r + 2)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (Nat.card Y - 2) (j : ℤ) +
      2 * binomCoeff (Nat.card Y - 2) ((j : ℤ) - 1))
    {k : ℕ} (hk : k ≤ r) : 0 < delta G (k : ℤ) := by
  have hn' : Nat.card Y - 2 = 2 * r := by omega
  rw [delta_nat, hc, hc, hn']
  simpa only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] using
    one_edge_expression_pos hr hk

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 112 END

-- VERITYOS ENTRY 113 BEGIN lemma Erdos993G1.FirstWide.delta_nonpos_of_center_counts cfeea82027a48154c86e8e65aef0d0424e543f6b7558edc837a2ea5eb3129d1e
namespace Erdos993G1.FirstWide

lemma delta_nonpos_of_center_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r q : ℕ) (hr : 1 ≤ r) (hq : q ≤ 2 * r - 1)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (2 * r + 1) (j : ℤ) +
      binomCoeff q ((j : ℤ) - 1)) : delta G (r : ℤ) ≤ 0 := by
  rw [delta_nat, hc, hc]
  simpa only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] using
    center_expression_nonpos hr hq

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 113 END

-- VERITYOS ENTRY 114 BEGIN lemma Erdos993G1.FirstWide.delta_neg_of_triangle_counts 68fad36276c13facb0b04954b337de9a124051a465e50f88b2bceb1bdfdeefc2
namespace Erdos993G1.FirstWide

lemma delta_neg_of_triangle_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (2 * r - 1) (j : ℤ) +
      3 * binomCoeff (2 * r - 1) ((j : ℤ) - 1)) : delta G (r : ℤ) < 0 := by
  rw [delta_nat, hc, hc]
  simpa only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] using
    triangle_expression_neg hr

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 114 END

-- VERITYOS ENTRY 115 BEGIN lemma Erdos993G1.FirstWide.firstDescent_gt_of_positive_history bd19f6ab2d00df81b8aad74fd5e3dcfecee3812230f5080376e7b4d2aa1327d9
namespace Erdos993G1.FirstWide

lemma firstDescent_gt_of_positive_history {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ)
    (hpos : ∀ k : ℕ, k ≤ r → 0 < delta G (k : ℤ)) :
    r < firstDescent G := by
  by_contra h
  have hle : firstDescent G ≤ r := by omega
  have hp := hpos (firstDescent G) hle
  have hn := delta_firstDescent_neg G
  omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 115 END

-- VERITYOS ENTRY 116 BEGIN lemma Erdos993G1.FirstWide.ordinaryG1_firstWide_rank a0779e97094008be3df4fb829485a0bab6b18a0e338b9a7588e6fe0ce08675a3
namespace Erdos993G1.FirstWide

lemma ordinaryG1_firstWide_rank {Y : Type u} [Finite Y]
    (T : SimpleGraph Y) (v s g : Y) (p : ℕ)
    (hG : ordinaryG1Guards T v s g p)
    (hn : residualOrder T v g = 2 * p - 2) :
    1 ≤ p - 2 ∧
      Nat.card {a : Y // a ∉ closedNeighborhood T v ∪ closedNeighborhood T g} =
        2 * (p - 2) + 2 ∧
      ((p - 2 : ℕ) : ℤ) = (p : ℤ) - 2 ∧
      firstDescent (residual T v g) < p - 2 := by
  rcases hG with ⟨hT, hleaf, hvs, hsupport, hsg, hgv, hp, hgamma, hsize, hcross⟩
  have hp3 : 3 ≤ p := by omega
  change Nat.card {a : Y // a ∉ closedNeighborhood T v ∪ closedNeighborhood T g} =
    2 * p - 2 at hn
  refine ⟨by omega, ?_, by omega, hcross⟩
  omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 116 END

-- VERITYOS ENTRY 117 BEGIN lemma Erdos993G1.FirstWide.edgeSet_natCard_eq_edgeFinset_card 173afaea29333238363411afefbda96929468184e2246a92b678b19529e126e1
namespace Erdos993G1.FirstWide

lemma edgeSet_natCard_eq_edgeFinset_card {Y : Type u}
    (G : SimpleGraph Y) [Fintype G.edgeSet] :
    Nat.card G.edgeSet = G.edgeFinset.card := by
  rw [Nat.card_eq_fintype_card, G.edgeFinset_card]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 117 END

-- VERITYOS ENTRY 118 BEGIN lemma Erdos993G1.FirstWide.indepCount_edgeless 65f447028fbab531a1ab9d37c8485f02dc5b12b52002d438703c6308017fe3bd
namespace Erdos993G1.FirstWide

lemma indepCount_edgeless {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (he : Nat.card G.edgeSet = 0) (k : ℕ) :
    indepCount G k = binomCoeff (Nat.card Y) (k : ℤ) := by
  classical
  letI := Fintype.ofFinite Y
  letI : IsEmpty G.edgeSet := Finite.card_eq_zero_iff.mp he
  have hi : ∀ S : Finset Y, G.IsIndepSet S := by
    intro S a ha b hb hab hadj
    exact isEmptyElim (⟨s(a, b), hadj⟩ : G.edgeSet)
  rw [indepCount_eq_card_indepSetFinset, indepSetFinset_eq_filter_powersetCard,
    Finset.filter_eq_self.mpr (fun S _ => hi S), Finset.card_powersetCard,
    Finset.card_univ, binomCoeff_nat, Nat.card_eq_fintype_card]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 118 END

-- VERITYOS ENTRY 119 BEGIN lemma Erdos993G1.FirstWide.edgeSet_one_endpoints 6e97c5b582b476b8ea43649632fffd288f4baabb9e24dc0f6a6d5a86a534a4e6
namespace Erdos993G1.FirstWide

lemma edgeSet_one_endpoints {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (hc : Nat.card G.edgeSet = 1) :
    ∃ a b : Y, a ≠ b ∧ G.edgeSet = {s(a, b)} := by
  classical
  letI := Fintype.ofFinite Y
  have hc' : G.edgeFinset.card = 1 := by
    rw [← edgeSet_natCard_eq_edgeFinset_card]
    exact hc
  obtain ⟨e, he⟩ := Finset.card_eq_one.mp hc'
  obtain ⟨a, b⟩ := e
  have hmem : s(a, b) ∈ G.edgeFinset := by rw [he]; simp
  have hadj : G.Adj a b := by
    simpa only [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet] using hmem
  refine ⟨a, b, hadj.ne, ?_⟩
  have hset := congrArg (fun t : Finset (Sym2 Y) => (t : Set (Sym2 Y))) he
  simpa only [SimpleGraph.coe_edgeFinset, Finset.coe_singleton] using hset

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 119 END

-- VERITYOS ENTRY 120 BEGIN lemma Erdos993G1.FirstWide.indepSet_iff_omit_unique_endpoints 0cc04950f0336870793246695e3513f0241182363d502893c08033fc6146414b
namespace Erdos993G1.FirstWide

lemma indepSet_iff_omit_unique_endpoints {Y : Type u}
    (G : SimpleGraph Y) (a b : Y) (hab : a ≠ b)
    (he : G.edgeSet = {s(a, b)}) (S : Finset Y) :
    G.IsIndepSet S ↔ a ∉ S ∨ b ∉ S := by
  classical
  have hadj : G.Adj a b := by
    change s(a, b) ∈ G.edgeSet
    rw [he]
    exact Set.mem_singleton _
  constructor
  · intro hS
    by_cases ha : a ∈ S
    · right
      intro hb
      exact hS ha hb hab hadj
    · exact Or.inl ha
  · intro h x hx y hy hxy hAdj
    have hmem : s(x, y) ∈ G.edgeSet := hAdj
    have hexy : s(x, y) = s(a, b) := by simpa only [he, Set.mem_singleton_iff] using hmem
    have haS : a ∈ S := by
      have hm : a ∈ s(x, y) := by rw [hexy]; simp
      rcases Sym2.mem_iff.mp hm with rfl | rfl <;> assumption
    have hbS : b ∈ S := by
      have hm : b ∈ s(x, y) := by rw [hexy]; simp
      rcases Sym2.mem_iff.mp hm with rfl | rfl <;> assumption
    rcases h with ha | hb
    · exact ha haS
    · exact hb hbS

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 120 END

-- VERITYOS ENTRY 121 BEGIN lemma Erdos993G1.FirstWide.indepCount_one_edge 07f1da65efa1980dd45e15eed8b0d3b5e6faa30ea20f7afb1c60836cb4f135d6
namespace Erdos993G1.FirstWide

lemma indepCount_one_edge {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (hc : Nat.card G.edgeSet = 1) (k : ℕ) :
    indepCount G k = binomCoeff (Nat.card Y - 2) (k : ℤ) +
      2 * binomCoeff (Nat.card Y - 2) ((k : ℤ) - 1) := by
  classical
  letI := Fintype.ofFinite Y
  by_cases hk0 : k = 0
  · subst k
    simp [indepCount_zero, binomCoeff]
  have hk1 : 1 ≤ k := by omega
  obtain ⟨a, b, hab, he⟩ := edgeSet_one_endpoints G hc
  have hn2 : 2 ≤ Fintype.card Y := by
    have h := Finset.card_le_card (Finset.subset_univ ({a, b} : Finset Y))
    simpa [hab] using h
  let A := ((Finset.univ : Finset Y).erase a).powersetCard k
  let B := ((Finset.univ : Finset Y).erase b).powersetCard k
  let C := (((Finset.univ : Finset Y).erase a).erase b).powersetCard k
  have hu : G.indepSetFinset k = A ∪ B := by
    ext S
    simp only [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff,
      indepSet_iff_omit_unique_endpoints G a b hab he, A, B, Finset.mem_union,
      Finset.mem_powersetCard, Finset.subset_erase, Finset.subset_univ, true_and]
    tauto
  have hi : A ∩ B = C := by
    ext S
    simp only [A, B, C, Finset.mem_inter, Finset.mem_powersetCard,
      Finset.subset_erase, Finset.subset_univ, true_and]
    tauto
  have hAc : A.card = (Fintype.card Y - 1).choose k := by simp [A]
  have hBc : B.card = (Fintype.card Y - 1).choose k := by simp [B]
  have hCc : C.card = (Fintype.card Y - 2).choose k := by
    simp [C, Finset.card_erase_of_mem (show b ∈ (Finset.univ : Finset Y).erase a by
      simp [hab.symm]), Nat.sub_sub]
  have hcard := Finset.card_union_add_card_inter A B
  rw [← hu, hi, hAc, hBc, hCc] at hcard
  have hcount : indepCount G k + ((Fintype.card Y - 2).choose k : ℤ) =
      2 * ((Fintype.card Y - 1).choose k : ℤ) := by
    rw [indepCount_eq_card_indepSetFinset]
    exact_mod_cast (by omega : (G.indepSetFinset k).card +
      (Fintype.card Y - 2).choose k = 2 * (Fintype.card Y - 1).choose k)
  have hrec := Nat.choose_succ_left (Fintype.card Y - 2) k (by omega : 0 < k)
  have hnminus : Fintype.card Y - 2 + 1 = Fintype.card Y - 1 := by omega
  rw [hnminus] at hrec
  have hrec' : ((Fintype.card Y - 1).choose k : ℤ) =
      ((Fintype.card Y - 2).choose (k - 1) : ℤ) +
      ((Fintype.card Y - 2).choose k : ℤ) := by exact_mod_cast hrec
  rw [binomCoeff_nat, binomCoeff_nat_sub_one _ _ hk1, Nat.card_eq_fintype_card]
  linarith

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 121 END

-- VERITYOS ENTRY 122 BEGIN lemma Erdos993G1.FirstWide.matching_distinct a449a8fd573a2b348e91e1610f6f79a685e38909fe0739a27b72066a59de837d
namespace Erdos993G1.FirstWide

lemma matching_distinct {X : Type u} (G : SimpleGraph X) (a b c d : X)
    (hab : G.Adj a b) (hcd : G.Adj c d)
    (hdis : Disjoint ({a,b} : Set X) {c,d}) :
    a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d := by
  have h := Set.disjoint_left.mp hdis
  have hac : a ≠ c := by intro e; exact h (a := a) (by simp) (by simp [e])
  have had : a ≠ d := by intro e; exact h (a := a) (by simp) (by simp [e])
  have hbc : b ≠ c := by intro e; exact h (a := b) (by simp) (by simp [e])
  have hbd : b ≠ d := by intro e; exact h (a := b) (by simp) (by simp [e])
  exact ⟨hab.ne, hac, had, hbc, hbd, hcd.ne⟩

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 122 END

-- VERITYOS ENTRY 123 BEGIN lemma Erdos993G1.FirstWide.matching_endpoints_card ce4e0346c857d4aeb91938f538f0b180ff8c28c85b5e927b85f0e3e3b9e4cbd6
namespace Erdos993G1.FirstWide

lemma matching_endpoints_card {X : Type u} [DecidableEq X]
    (G : SimpleGraph X) (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (hdis : Disjoint ({a,b} : Set X) {c,d}) : ({a,b,c,d} : Finset X).card = 4 := by
  obtain ⟨h1,h2,h3,h4,h5,h6⟩ := matching_distinct G a b c d hab hcd hdis
  simp [h1,h2,h3,h4,h5,h6]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 123 END

-- VERITYOS ENTRY 124 BEGIN lemma Erdos993G1.FirstWide.indep_inter_matching_le_two 997ea066a7aff492e2c104d8916155048fa7e5e7403f8e064ccc69587b207acb
namespace Erdos993G1.FirstWide

lemma indep_inter_matching_le_two {X : Type u} [DecidableEq X]
    (G : SimpleGraph X) (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (S : Finset X) (hS : G.IsIndepSet S) : (S ∩ {a,b,c,d}).card ≤ 2 := by
  have hedge (x y : X) (hxy : G.Adj x y) : (S ∩ {x,y}).card ≤ 1 := by
    apply Finset.card_le_one.mpr
    intro p hp q hq
    have hpS := (Finset.mem_inter.mp hp).1
    have hqS := (Finset.mem_inter.mp hq).1
    have hp' := (Finset.mem_inter.mp hp).2
    have hq' := (Finset.mem_inter.mp hq).2
    simp only [Finset.mem_insert,Finset.mem_singleton] at hp' hq'
    rcases hp' with rfl | rfl <;> rcases hq' with rfl | rfl
    · rfl
    · exact False.elim (hS hpS hqS hxy.ne hxy)
    · exact False.elim (hS hqS hpS hxy.ne hxy)
    · rfl
  have he : S ∩ {a,b,c,d} = (S ∩ {a,b}) ∪ (S ∩ {c,d}) := by
    ext x
    simp only [Finset.mem_inter,Finset.mem_insert,Finset.mem_singleton,Finset.mem_union]
    tauto
  rw [he]
  exact (Finset.card_union_le _ _).trans (by have h1 := hedge a b hab; have h2 := hedge c d hcd; omega)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 124 END

-- VERITYOS ENTRY 125 BEGIN lemma Erdos993G1.FirstWide.stratum_mem 504d4af084832f88d2563028e2faf28c0bb1338a3f4b6a51a6fcff6564656f73
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

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 125 END

-- VERITYOS ENTRY 126 BEGIN lemma Erdos993G1.FirstWide.stratum_partition 6d086dd15c11fe70589d5707d757c100ef39058297f73df4b5446c345068440b
namespace Erdos993G1.FirstWide

lemma stratum_partition {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X)
    (hM : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 2) (k : ℕ) :
    indepCount G k = ((stratum G M k 0).card : ℤ) +
      ((stratum G M k 1).card : ℤ) + ((stratum G M k 2).card : ℤ) := by
  classical
  have hp := Finset.card_eq_sum_card_fiberwise
    (s := G.indepSetFinset k) (t := ({0,1,2} : Finset ℕ))
    (f := fun S : Finset X => (S ∩ M).card) (by
      intro S hS
      have hle := hM S (SimpleGraph.mem_indepSetFinset_iff.mp hS).isIndepSet
      simp only [Finset.mem_coe, Finset.mem_insert, Finset.mem_singleton]
      omega)
  have hf (j : ℕ) : (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j) =
      stratum G M k j := by
    ext S
    simp only [Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff, stratum_mem]
  simp only [hf] at hp
  rw [indepCount_eq_card_indepSetFinset]
  have hp' : (G.indepSetFinset k).card = (stratum G M k 0).card +
      (stratum G M k 1).card + (stratum G M k 2).card := by
    simpa [add_assoc] using hp
  exact_mod_cast hp'

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 126 END

-- VERITYOS ENTRY 127 BEGIN lemma Erdos993G1.FirstWide.erase_inter_eq 80fd100398812f2e356dc20bec0b214775918fcc2b6d277d944b97f58dc20dd1
namespace Erdos993G1.FirstWide

lemma erase_inter_eq {X : Type u} [DecidableEq X] (S M : Finset X) (a : X) :
    S.erase a ∩ M = (S ∩ M).erase a := by ext x; simp

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 127 END

-- VERITYOS ENTRY 128 BEGIN lemma Erdos993G1.FirstWide.subset_fiber_eq_image e80b8cbb8d4e06d57ce70402981d36db3353854c32af7e06a56f22ed2af0f310
namespace Erdos993G1.FirstWide

lemma subset_fiber_eq_image {X : Type u} [DecidableEq X]
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
-- VERITYOS ENTRY 128 END

-- VERITYOS ENTRY 129 BEGIN lemma Erdos993G1.FirstWide.erase_image_card bce886ffb6829c7053b6b56d89c1adfe62f5407b0a58185245bded59618aee00
namespace Erdos993G1.FirstWide

lemma erase_image_card {X : Type u} [DecidableEq X] (S T : Finset X)
    (hT : T ⊆ S) : (T.image S.erase).card = T.card := by
  apply Finset.card_image_of_injOn
  intro a ha b hb he
  exact (Finset.erase_inj S (hT ha)).mp he

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 129 END

-- VERITYOS ENTRY 130 BEGIN lemma Erdos993G1.FirstWide.extension_fiber_bound 77c89a89044242a6a606c8e315ed0195a061f1e9df5ffd54ca1bba94b0cee8cb
namespace Erdos993G1.FirstWide

lemma extension_fiber_bound {X : Type u} [DecidableEq X]
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
-- VERITYOS ENTRY 130 END

-- VERITYOS ENTRY 131 BEGIN lemma Erdos993G1.FirstWide.stratum_erase_outside_iff 757fa20557947ef6c340f03672327a4d2e51c127821d73a88a4c0eb1a4f4c51b
namespace Erdos993G1.FirstWide

lemma stratum_erase_outside_iff {X : Type u} [Fintype X] [DecidableEq X]
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
-- VERITYOS ENTRY 131 END

-- VERITYOS ENTRY 132 BEGIN lemma Erdos993G1.FirstWide.stratum_erase_inside d08583874e7cb5bc39103f6cbe245aaf447740802812596ba5eee7d19484efd9
namespace Erdos993G1.FirstWide

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

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 132 END

-- VERITYOS ENTRY 133 BEGIN lemma Erdos993G1.FirstWide.stratum_insert_same_outside 4912eb459f7be5241cab85f68d8e0ba38e15b28b2bc499e53fbaac3995017df0
namespace Erdos993G1.FirstWide

lemma stratum_insert_same_outside {X : Type u} [Fintype X] [DecidableEq X]
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
-- VERITYOS ENTRY 133 END

-- VERITYOS ENTRY 134 BEGIN lemma Erdos993G1.FirstWide.stratum_insert_cross_inside 6812c84b0d422aaeefc22bc3abeac557902e65ec37c3e6d767f380ae3ba07b3b
namespace Erdos993G1.FirstWide

lemma stratum_insert_cross_inside {X : Type u} [Fintype X] [DecidableEq X]
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
-- VERITYOS ENTRY 134 END

-- VERITYOS ENTRY 135 BEGIN lemma Erdos993G1.FirstWide.outside_incidence_bound cc9d1f4b9812be6d690e03db3481726c1e9fa303be0790d6a54e04d47f006fd2
namespace Erdos993G1.FirstWide

lemma outside_incidence_bound {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (M : Finset X) (hM : M.card = 4)
    (r : ℕ) (hr : 2 ≤ r) (hn : Nat.card X = 2*r+2) (j : ℕ) (hj : j ≤ 2) :
    (r+1-j) * (stratum G M (r+1) j).card ≤
      (r+j-2) * (stratum G M r j).card := by
  classical
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) j) (t := stratum G M r j)
    (m := r+1-j) (n := r+j-2) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change r+1-j ≤ ((stratum G M r j).filter (fun B => B ⊆ S)).card
    have hs := (stratum_mem G M S (r+1) j).mp hS
    rw [subset_fiber_eq_image _ S r
      (fun B hB => ((stratum_mem G M B r j).mp hB).1.card_eq) hs.1.card_eq]
    have he : S.filter (fun a => S.erase a ∈ stratum G M r j) = S \ M := by
      ext a
      simp only [Finset.mem_filter,Finset.mem_sdiff]
      exact and_congr_right (fun ha => stratum_erase_outside_iff G M S r j hS a ha)
    rw [he,erase_image_card S (S \ M) Finset.sdiff_subset]
    have hc := Finset.card_sdiff_add_card_inter S M
    rw [hs.2,hs.1.card_eq] at hc
    omega
  · intro B hB
    change ((stratum G M (r+1) j).filter (fun S => B ⊆ S)).card ≤ r+j-2
    have hb := (stratum_mem G M B r j).mp hB
    have hbound := extension_fiber_bound (stratum G M (r+1) j) B
      (Finset.univ \ (M ∪ B)) r
      (fun S hS => ((stratum_mem G M S (r+1) j).mp hS).1.card_eq) hb.1.card_eq
      (fun a ha hS => by
        have haM := stratum_insert_same_outside G M B r j hB a ha hS
        simp [ha,haM])
    have hc := Finset.card_union_add_card_inter M B
    have hi : (M ∩ B).card = j := by rw [Finset.inter_comm,hb.2]
    rw [hM,hb.1.card_eq,hi] at hc
    have hn' : (Finset.univ : Finset X).card = 2*r+2 := by simpa [Nat.card_eq_fintype_card] using hn
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ _),hn'] at hbound
    have he : 2*r+2 - (M ∪ B).card = r+j-2 := by omega
    simpa only [he] using hbound


end Erdos993G1.FirstWide
-- VERITYOS ENTRY 135 END

-- VERITYOS ENTRY 136 BEGIN lemma Erdos993G1.FirstWide.matching_partner 259d75877bc12cbbc42be914263de232da90e97e15b3690baa0fc9ef8d418759
namespace Erdos993G1.FirstWide

lemma matching_partner {X : Type u} [DecidableEq X]
    (G : SimpleGraph X) (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (x : X) (hx : x ∈ ({a,b,c,d} : Finset X)) :
    ∃ y ∈ ({a,b,c,d} : Finset X), G.Adj x y := by
  simp only [Finset.mem_insert,Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl
  · exact ⟨b,by simp,hab⟩
  · exact ⟨a,by simp,hab.symm⟩
  · exact ⟨d,by simp,hcd⟩
  · exact ⟨c,by simp,hcd.symm⟩

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 136 END

-- VERITYOS ENTRY 137 BEGIN lemma Erdos993G1.FirstWide.matching_cross_incidence_bound 12af7ed015f585a0312634023f0a0684d50afa6857b54d1580d6ab0d45f38801
namespace Erdos993G1.FirstWide

lemma matching_cross_incidence_bound {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (hdis : Disjoint ({a,b} : Set X) {c,d}) (r : ℕ) :
    2 * (stratum G {a,b,c,d} (r+1) 2).card ≤
      2 * (stratum G {a,b,c,d} r 1).card := by
  classical
  let M : Finset X := {a,b,c,d}
  have hM : M.card = 4 := matching_endpoints_card G a b c d hab hcd hdis
  have hcount := Finset.card_mul_le_card_mul (fun S B : Finset X => B ⊆ S)
    (s := stratum G M (r+1) 2) (t := stratum G M r 1) (m := 2) (n := 2) ?_ ?_
  · simpa only [Nat.mul_comm] using hcount
  · intro S hS
    change 2 ≤ ((stratum G M r 1).filter (fun B => B ⊆ S)).card
    have hs := (stratum_mem G M S (r+1) 2).mp hS
    calc
      2 = (S ∩ M).card := hs.2.symm
      _ = ((S ∩ M).image S.erase).card :=
        (erase_image_card S (S ∩ M) Finset.inter_subset_left).symm
      _ ≤ _ := Finset.card_le_card (by
        intro B hB
        obtain ⟨x,hx,rfl⟩ := Finset.mem_image.mp hB
        exact Finset.mem_filter.mpr ⟨stratum_erase_inside G M S r 1 hS x hx,
          Finset.erase_subset x S⟩)
  · intro B hB
    change ((stratum G M (r+1) 2).filter (fun S => B ⊆ S)).card ≤ 2
    have hb := (stratum_mem G M B r 1).mp hB
    obtain ⟨x,hx⟩ := Finset.card_pos.mp (show 0 < (B ∩ M).card by omega)
    have hxB := (Finset.mem_inter.mp hx).1
    have hxM := (Finset.mem_inter.mp hx).2
    obtain ⟨y,hyM,hxy⟩ := matching_partner G a b c d hab hcd x hxM
    have hpair : ({x,y} : Finset X) ⊆ M := by
      intro z hz
      simp only [Finset.mem_insert,Finset.mem_singleton] at hz
      rcases hz with rfl | rfl <;> assumption
    have hQ : (M \ {x,y}).card = 2 := by
      rw [Finset.card_sdiff_of_subset hpair,hM,Finset.card_pair hxy.ne]
    apply le_trans (b := (M \ {x,y}).card) ?_ hQ.le
    apply extension_fiber_bound (stratum G M (r+1) 2) B (M \ {x,y}) r
      (fun S hS => ((stratum_mem G M S (r+1) 2).mp hS).1.card_eq) hb.1.card_eq
    intro z hz hS
    have hzM := stratum_insert_cross_inside G M B r 1 hB z hS
    have hzx : z ≠ x := by intro he; exact hz (he ▸ hxB)
    have hzy : z ≠ y := by
      intro he
      have hs := ((stratum_mem G M (insert z B) (r+1) 2).mp hS).1.isIndepSet
      have hy : y ∈ insert z B := by simp [he]
      exact hs (by simp [hxB]) hy hxy.ne hxy
    simp [hzM,hzx,hzy]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 137 END

-- VERITYOS ENTRY 138 BEGIN lemma Erdos993G1.FirstWide.stratum_univ_empty fc80060f69804a645caad6e008c8d8371e942720ab9fbcf49c9028bb3f77e41d
namespace Erdos993G1.FirstWide

lemma stratum_univ_empty {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (k j : ℕ) (h : k ≠ j) : stratum G Finset.univ k j = ∅ := by
  classical
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro S hS
  have hs := (stratum_mem G Finset.univ S k j).mp hS
  have hc := hs.1.card_eq
  simp only [Finset.inter_univ] at hs
  exact h (hc.symm.trans hs.2)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 138 END

-- VERITYOS ENTRY 139 BEGIN lemma Erdos993G1.FirstWide.delta_nonpos_of_disjoint_edges bc5f1254c9d31ae39347aa6af57b869504a2c26e0ec9e99aa67b3b4298f64da2
namespace Erdos993G1.FirstWide

lemma delta_nonpos_of_disjoint_edges {X : Type u} [Finite X]
    (G : SimpleGraph X) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+2)
    (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (hdis : Disjoint ({a,b} : Set X) {c,d}) : delta G (r : ℤ) ≤ 0 := by
  classical
  letI := Fintype.ofFinite X
  let M : Finset X := {a,b,c,d}
  have hM : M.card = 4 := matching_endpoints_card G a b c d hab hcd hdis
  have hle : ∀ S : Finset X, G.IsIndepSet S → (S ∩ M).card ≤ 2 :=
    fun S hS => indep_inter_matching_le_two G a b c d hab hcd S hS
  have hL := stratum_partition G M hle r
  have hV := stratum_partition G M hle (r+1)
  have hcross := matching_cross_incidence_bound G a b c d hab hcd hdis r
  have hcross' : (stratum G M (r+1) 2).card ≤ (stratum G M r 1).card := by
    change 2 * (stratum G M (r+1) 2).card ≤ 2 * (stratum G M r 1).card at hcross
    omega
  rw [delta_nat,hL,hV]
  by_cases hr1 : r = 1
  · subst r
    have hn' : (Finset.univ : Finset X).card = 4 := by simpa [Nat.card_eq_fintype_card] using hn
    have hMu : M = Finset.univ := Finset.eq_of_subset_of_card_le (Finset.subset_univ _) (by omega)
    have e10 := stratum_univ_empty G 1 0 (by omega)
    have e12 := stratum_univ_empty G 1 2 (by omega)
    have e20 := stratum_univ_empty G 2 0 (by omega)
    have e21 := stratum_univ_empty G 2 1 (by omega)
    rw [hMu] at hcross' ⊢
    simp only [e10,e12,e20,e21,Finset.card_empty,Nat.cast_zero,zero_add,add_zero]
    have hc : ((stratum G Finset.univ 2 2).card : ℤ) ≤
        (stratum G Finset.univ 1 1).card := by exact_mod_cast hcross'
    omega
  · have hr2 : 2 ≤ r := by omega
    have h0 := outside_incidence_bound G M hM r hr2 hn 0 (by omega)
    have h1 := outside_incidence_bound G M hM r hr2 hn 1 (by omega)
    have h2 := outside_incidence_bound G M hM r hr2 hn 2 (by omega)
    have he1 : r+1-1 = r := by omega
    have he2 : r+1-2 = r-1 := by omega
    have he3 : r+2-2 = r := by omega
    simp only [Nat.add_zero,Nat.sub_zero] at h0
    rw [he1,he2] at h1
    rw [he2,he3] at h2
    have hv0 : (stratum G M (r+1) 0).card ≤ (stratum G M r 0).card := by
      have hrm : r-2 ≤ r+1 := by omega
      nlinarith [Nat.mul_le_mul_right (stratum G M r 0).card hrm]
    have hv12 : (stratum G M (r+1) 1).card + (stratum G M (r+1) 2).card ≤
        (stratum G M r 1).card + (stratum G M r 2).card := by
      have he : r-1+1=r := by omega
      nlinarith
    have h0z : ((stratum G M (r+1) 0).card : ℤ) ≤ (stratum G M r 0).card := by exact_mod_cast hv0
    have h12z : ((stratum G M (r+1) 1).card : ℤ) + (stratum G M (r+1) 2).card ≤
        (stratum G M r 1).card + (stratum G M r 2).card := by exact_mod_cast hv12
    omega

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 139 END

-- VERITYOS ENTRY 140 BEGIN lemma Erdos993G1.firstWide_exceptional_history 506ab09da3de1e0387a46ccbff9b1a9de819df991c9e4c46565e2277bf6b2d35
namespace Erdos993G1
lemma firstWide_exceptional_history {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card Y = 2 * r + 2)
    (he : Nat.card G.edgeSet ≤ 1) (k : ℕ) (hk : k ≤ r) :
    0 < Erdos993G1.delta G (k : ℤ) := by
  by_cases he0 : Nat.card G.edgeSet = 0
  · exact Erdos993G1.FirstWide.delta_pos_of_edgeless_counts G r hn
      (Erdos993G1.FirstWide.indepCount_edgeless G he0) hk
  · have he1 : Nat.card G.edgeSet = 1 := by omega
    exact Erdos993G1.FirstWide.delta_pos_of_one_edge_counts G r hr hn
      (Erdos993G1.FirstWide.indepCount_one_edge G he1) hk
end Erdos993G1

-- VERITYOS ENTRY 140 END

-- VERITYOS ENTRY 141 BEGIN lemma Erdos993G1.FirstWide.shape_edges_overlap c7a18cb14f679409132fad56f06cda44eec7dd3a5b84519f848ab596aa3aad7f
namespace Erdos993G1.FirstWide

lemma shape_edges_overlap {V : Type u} (G : SimpleGraph V)
    (hnone : ¬ ∃ a b c d : V, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a,b} : Set V) {c,d})
    {a b c d : V} (hab : G.Adj a b) (hcd : G.Adj c d) :
    a = c ∨ a = d ∨ b = c ∨ b = d := by
  by_contra h
  apply hnone
  refine ⟨a,b,c,d,hab,hcd,?_⟩
  simp only [Set.disjoint_left, Set.mem_insert_iff, Set.mem_singleton_iff]
  aesop

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 141 END

-- VERITYOS ENTRY 142 BEGIN lemma Erdos993G1.FirstWide.shape_two_incident a347e4eb45f7d367392f11b85662c6b3c734264865cdb89aa40a5944fbf2fbdc
namespace Erdos993G1.FirstWide

lemma shape_two_incident {V : Type u} [Finite V] (G : SimpleGraph V)
    (hedge : 2 ≤ Nat.card G.edgeSet)
    (hnone : ¬ ∃ a b c d : V, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a,b} : Set V) {c,d}) :
    ∃ a b c : V, G.Adj a b ∧ G.Adj a c ∧ b ≠ c := by
  classical
  letI : Nontrivial G.edgeSet := Finite.one_lt_card_iff_nontrivial.mp (by omega)
  obtain ⟨e,f,hef⟩ := exists_pair_ne G.edgeSet
  obtain ⟨e,he⟩ := e
  obtain ⟨f,hf⟩ := f
  have hne : e ≠ f := by simpa using hef
  induction e using Sym2.inductionOn with | _ a b =>
  induction f using Sym2.inductionOn with | _ c d =>
  have hab : G.Adj a b := he
  have hcd : G.Adj c d := hf
  have ho := shape_edges_overlap G hnone hab hcd
  have hne' := (mt Sym2.eq_iff.mpr hne)
  rcases ho with h | h | h | h
  · subst c; exact ⟨a,b,d,hab,hcd,by aesop⟩
  · subst d; exact ⟨a,b,c,hab,hcd.symm,by aesop⟩
  · subst c; exact ⟨b,a,d,hab.symm,hcd,by aesop⟩
  · subst d; exact ⟨b,a,c,hab.symm,hcd.symm,by aesop⟩

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 142 END

-- VERITYOS ENTRY 143 BEGIN lemma Erdos993G1.FirstWide.intersecting_edges_center_or_triangle 1cd4ea3d6eb1664face4bc3a848c07c50ea76be77e3f3d629f8b7c073058d207
namespace Erdos993G1.FirstWide

lemma intersecting_edges_center_or_triangle {V : Type u} [Finite V]
    (G : SimpleGraph V) (hedge : 2 ≤ Nat.card G.edgeSet)
    (hnone : ¬ ∃ a b c d : V, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a,b} : Set V) {c,d}) :
    (∃ a b c : V, G.Adj a b ∧ G.Adj a c ∧ b ≠ c ∧
      ∀ x y : V, G.Adj x y → x = a ∨ y = a) ∨
    (∃ a b c : V, a ≠ b ∧ a ≠ c ∧ b ≠ c ∧
      ∀ x y : V, G.Adj x y ↔ x ≠ y ∧
        (x = a ∨ x = b ∨ x = c) ∧ (y = a ∨ y = b ∨ y = c)) := by
  classical
  obtain ⟨a,b,c,hab,hac,hbc⟩ := shape_two_incident G hedge hnone
  by_cases hc : ∀ x y : V, G.Adj x y → x = a ∨ y = a
  · exact Or.inl ⟨a,b,c,hab,hac,hbc,hc⟩
  push Not at hc
  obtain ⟨x,y,hxy,hxa,hya⟩ := hc
  have hb := shape_edges_overlap G hnone hab hxy
  have hc := shape_edges_overlap G hnone hac hxy
  have hadj : G.Adj b c := by
    have hyx := hxy.symm
    clear hnone hedge
    aesop
  clear hb hc hxy hxa hya
  right
  refine ⟨a,b,c,hab.ne,hac.ne,hbc,?_⟩
  intro x y
  constructor
  · intro h
    have h1 := shape_edges_overlap G hnone h hab
    have h2 := shape_edges_overlap G hnone h hac
    have h3 := shape_edges_overlap G hnone h hadj
    have hn := h.ne
    have habn := hab.ne
    have hacn := hac.ne
    clear hnone hedge hab hac hadj
    aesop
  · rintro ⟨hne,hx,hy⟩
    have hba := hab.symm
    have hca := hac.symm
    have hcb := hadj.symm
    clear hnone hedge
    aesop

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 143 END

-- VERITYOS ENTRY 144 BEGIN lemma Erdos993G1.FirstWide.shape_indep_on_edgeless 8d1f03b1dd503525f9843dfda50dd92574a58231497237fca86e4cf3494e8bee
namespace Erdos993G1.FirstWide

lemma shape_indep_on_edgeless {V : Type u} [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (hU : G.IsIndepSet U) (j : ℕ) :
    ((U.powersetCard j).filter (fun S : Finset V => G.IsIndepSet S)).card = U.card.choose j := by
  rw [Finset.filter_eq_self.mpr, Finset.card_powersetCard]
  intro S hS
  exact hU.mono (by simpa using (Finset.mem_powersetCard.mp hS).1)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 144 END

-- VERITYOS ENTRY 145 BEGIN lemma Erdos993G1.FirstWide.shape_indep_on_succ 8bce84601f17028aa6b5281a6709b267fc112a5de410ed07a0bcef70f551c148
namespace Erdos993G1.FirstWide

lemma shape_indep_on_succ {V : Type u} [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (a : V)
    (ha : a ∈ U) (j : ℕ) :
    ((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card =
      (((U.erase a).powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card +
      ((((U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)).powersetCard j)).filter
        (fun S : Finset V => G.IsIndepSet S)).card := by
  classical
  let N := U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)
  let A := (U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)
  have hexclude : A.filter (fun S => a ∉ S) =
      ((U.erase a).powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S) := by
    ext S
    simp only [A, Finset.mem_filter, Finset.mem_powersetCard]
    constructor
    · rintro ⟨⟨⟨hSU,hcard⟩,hind⟩,hnot⟩
      exact ⟨⟨by intro x hx; exact Finset.mem_erase.mpr ⟨by aesop,hSU hx⟩,hcard⟩,hind⟩
    · rintro ⟨⟨hSU,hcard⟩,hind⟩
      exact ⟨⟨⟨fun x hx => (Finset.mem_erase.mp (hSU hx)).2,hcard⟩,hind⟩,
        by intro h; simpa using hSU h⟩
  have hinclude : (A.filter (fun S => a ∈ S)).card =
      ((N.powersetCard j).filter (fun S : Finset V => G.IsIndepSet S)).card := by
    apply Finset.card_bij (fun S _ => S.erase a)
    · intro S hS
      obtain ⟨hS,haS⟩ := Finset.mem_filter.mp hS
      obtain ⟨hS,hind⟩ := Finset.mem_filter.mp hS
      obtain ⟨hSU,hcard⟩ := Finset.mem_powersetCard.mp hS
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_powersetCard.mpr ⟨?_,?_⟩,?_⟩
      · intro x hx
        obtain ⟨hxa,hxS⟩ := Finset.mem_erase.mp hx
        exact Finset.mem_filter.mpr ⟨hSU hxS,hxa,hind haS hxS (Ne.symm hxa)⟩
      · simpa [hcard] using Finset.card_erase_of_mem haS
      · exact hind.mono (by simpa using Finset.erase_subset a S)
    · intro S hS T hT hST
      have haS := (Finset.mem_filter.mp hS).2
      have haT := (Finset.mem_filter.mp hT).2
      calc S = insert a (S.erase a) := (Finset.insert_erase haS).symm
           _ = insert a (T.erase a) := by rw [hST]
           _ = T := Finset.insert_erase haT
    · intro S hS
      obtain ⟨hS,hind⟩ := Finset.mem_filter.mp hS
      obtain ⟨hSN,hcard⟩ := Finset.mem_powersetCard.mp hS
      have hnot : a ∉ S := by intro h; exact (Finset.mem_filter.mp (hSN h)).2.1 rfl
      have hSU : S ⊆ U := fun x hx => (Finset.mem_filter.mp (hSN hx)).1
      have hnew : G.IsIndepSet (↑(insert a S) : Set V) := by
        intro x hx y hy hxy hAdj
        simp only [Finset.mem_coe, Finset.mem_insert] at hx hy
        rcases hx with rfl | hx
        · rcases hy with rfl | hy
          · exact hxy rfl
          · exact (Finset.mem_filter.mp (hSN hy)).2.2 hAdj
        · rcases hy with rfl | hy
          · exact (Finset.mem_filter.mp (hSN hx)).2.2 hAdj.symm
          · exact hind hx hy hxy hAdj
      refine ⟨insert a S,?_,Finset.erase_insert hnot⟩
      apply Finset.mem_filter.mpr
      refine ⟨?_,Finset.mem_insert_self a S⟩
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_powersetCard.mpr ⟨Finset.insert_subset ha hSU,?_⟩,hnew⟩
      rw [Finset.card_insert_of_notMem hnot,hcard]
  have hp := Finset.card_filter_add_card_filter_not (s := A) (fun S => a ∈ S)
  rw [hinclude,hexclude] at hp
  exact hp.symm.trans (Nat.add_comm _ _)

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 145 END

-- VERITYOS ENTRY 146 BEGIN lemma Erdos993G1.FirstWide.shape_indep_on_center 0fa259df3c1afda8858ce7e3e9effea405b4e5ff2e39fe173dc207168776fb4f
namespace Erdos993G1.FirstWide

lemma shape_indep_on_center {V : Type u} [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (a : V)
    (ha : a ∈ U)
    (hc : ∀ x ∈ U, ∀ y ∈ U, G.Adj x y → x = a ∨ y = a) (j : ℕ) :
    ((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card =
      (U.card-1).choose (j+1) +
        (U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)).card.choose j := by
  have hi : G.IsIndepSet (↑(U.erase a) : Set V) := by
    intro x hx y hy hxy hAdj
    obtain ⟨hxa,hxU⟩ := Finset.mem_erase.mp hx
    obtain ⟨hya,hyU⟩ := Finset.mem_erase.mp hy
    rcases hc x hxU y hyU hAdj with h | h
    · exact hxa h
    · exact hya h
  have hN : G.IsIndepSet (↑(U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)) : Set V) := by
    apply hi.mono
    intro x hx
    obtain ⟨hxU,hxa,_⟩ := Finset.mem_filter.mp hx
    exact Finset.mem_erase.mpr ⟨hxa,hxU⟩
  rw [shape_indep_on_succ G U a ha j, shape_indep_on_edgeless G _ hi,
    shape_indep_on_edgeless G _ hN, Finset.card_erase_of_mem ha]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 146 END

-- VERITYOS ENTRY 147 BEGIN lemma Erdos993G1.FirstWide.coeff_center ebb0a7aec5871bfe38c9779ca5ca49c878c4fb83f4c2b0e09f3e0500fe186868
namespace Erdos993G1.FirstWide

lemma coeff_center {V : Type u} [Finite V] (G : SimpleGraph V)
    {a b c : V} (hab : G.Adj a b) (hac : G.Adj a c) (hbc : b ≠ c)
    (hc : ∀ x y : V, G.Adj x y → x = a ∨ y = a) :
    ∃ q : ℕ, q ≤ Nat.card V - 3 ∧ ∀ j : ℕ,
      Erdos993G1.indepCount G j = binomCoeff (Nat.card V - 1) (j : ℤ) +
        binomCoeff q ((j : ℤ)-1) := by
  classical
  letI := Fintype.ofFinite V
  let U : Finset V := Finset.univ
  let N := U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)
  have hN : N ⊆ U \ {a,b,c} := by
    intro x hx
    obtain ⟨hxU,hxa,hna⟩ := Finset.mem_filter.mp hx
    apply Finset.mem_sdiff.mpr
    refine ⟨hxU,?_⟩
    simp only [Finset.mem_insert,Finset.mem_singleton]
    rintro (rfl | rfl | rfl)
    · exact hxa rfl
    · exact hna hab
    · exact hna hac
  have hthree : ({a,b,c} : Finset V).card = 3 := by
    simp [hab.ne,hac.ne,hbc]
  have hcardU : U.card = Nat.card V := by simp [U,Nat.card_eq_fintype_card]
  have hbound : N.card ≤ Nat.card V - 3 := by
    have h := Finset.card_le_card hN
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ _), hthree, hcardU] at h
    exact h
  refine ⟨N.card,hbound,?_⟩
  intro j
  cases j with
  | zero => simp [Erdos993G1.indepCount_zero,binomCoeff]
  | succ j =>
    have hcount := shape_indep_on_center G U a (Finset.mem_univ a)
      (fun x _ y _ h => hc x y h) j
    rw [hcardU] at hcount
    rw [Erdos993G1.indepCount_eq_card_indepSetFinset,
      Erdos993G1.indepSetFinset_eq_filter_powersetCard]
    change (((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card : ℤ) = _
    rw [hcount, Nat.cast_add]
    simp [binomCoeff, Nat.cast_add, N, show (0 : ℤ) ≤ (j : ℤ)+1 by omega]

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 147 END

-- VERITYOS ENTRY 148 BEGIN lemma Erdos993G1.FirstWide.coeff_triangle 68801e620bc92e155e0a73688a6f255bdd45798379f051be63a9236b3e1ea258
namespace Erdos993G1.FirstWide

lemma coeff_triangle {V : Type u} [Finite V] (G : SimpleGraph V)
    {a b c : V} (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (hG : ∀ x y : V, G.Adj x y ↔ x ≠ y ∧
      (x = a ∨ x = b ∨ x = c) ∧ (y = a ∨ y = b ∨ y = c)) :
    ∀ j : ℕ, Erdos993G1.indepCount G j =
      binomCoeff (Nat.card V-3) (j : ℤ) +
        3 * binomCoeff (Nat.card V-3) ((j : ℤ)-1) := by
  classical
  letI := Fintype.ofFinite V
  let U : Finset V := Finset.univ
  let A := U.erase a
  let I := U \ {a,b,c}
  have habG : G.Adj a b := (hG a b).mpr ⟨hab,Or.inl rfl,Or.inr (Or.inl rfl)⟩
  have hacG : G.Adj a c := (hG a c).mpr ⟨hac,Or.inl rfl,Or.inr (Or.inr rfl)⟩
  have hbcG : G.Adj b c := (hG b c).mpr ⟨hbc,Or.inr (Or.inl rfl),Or.inr (Or.inr rfl)⟩
  have hmemI (x : V) : x ∈ I ↔ x ≠ a ∧ x ≠ b ∧ x ≠ c := by
    simp [I,U]
  have hcardU : U.card = Nat.card V := by simp [U,Nat.card_eq_fintype_card]
  have hthree : ({a,b,c} : Finset V).card = 3 := by simp [hab,hac,hbc]
  have hn : 3 ≤ Nat.card V := by
    have h := Finset.card_le_card (show ({a,b,c} : Finset V) ⊆ U from Finset.subset_univ _)
    rwa [hthree,hcardU] at h
  have hcardI : I.card = Nat.card V-3 := by
    exact (Finset.card_sdiff_of_subset (Finset.subset_univ _)).trans (by rw [hthree,hcardU])
  have hcardA : A.card = Nat.card V-1 := by simp [A,U,Nat.card_eq_fintype_card]
  have hIa : U.filter (fun x => x ≠ a ∧ ¬G.Adj a x) = I := by
    ext x
    rw [hmemI]
    simp only [Finset.mem_filter, U, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨hxa,hno⟩
      exact ⟨hxa,by intro h; subst x; exact hno habG,
        by intro h; subst x; exact hno hacG⟩
    · rintro ⟨hxa,hxb,hxc⟩
      refine ⟨hxa,?_⟩
      intro h
      rcases (hG a x).mp h with ⟨_,_,h | h | h⟩
      · exact hxa h
      · exact hxb h
      · exact hxc h
  have hIb : A.filter (fun x => x ≠ b ∧ ¬G.Adj b x) = I := by
    ext x
    rw [hmemI]
    simp only [Finset.mem_filter, A, Finset.mem_erase, U, Finset.mem_univ, and_true]
    constructor
    · rintro ⟨hxa,hxb,hno⟩
      exact ⟨hxa,hxb,by intro h; subst x; exact hno hbcG⟩
    · rintro ⟨hxa,hxb,hxc⟩
      refine ⟨hxa,hxb,?_⟩
      intro h
      rcases (hG b x).mp h with ⟨_,_,h | h | h⟩
      · exact hxa h
      · exact hxb h
      · exact hxc h
  have hi : G.IsIndepSet (↑I : Set V) := by
    intro x hx y hy hxy hAdj
    obtain ⟨hxa,hxb,hxc⟩ := (hmemI x).mp hx
    rcases ((hG x y).mp hAdj).2.1 with h | h | h
    · exact hxa h
    · exact hxb h
    · exact hxc h
  have hcenter : ∀ x ∈ A, ∀ y ∈ A, G.Adj x y → x = b ∨ y = b := by
    intro x hx y hy hAdj
    have hxa := (Finset.mem_erase.mp hx).1
    have hya := (Finset.mem_erase.mp hy).1
    obtain ⟨hne,hx,hy⟩ := (hG x y).mp hAdj
    clear hG
    aesop
  intro j
  cases j with
  | zero => simp [Erdos993G1.indepCount_zero,binomCoeff]
  | succ j =>
    have hcount := shape_indep_on_succ G U a (Finset.mem_univ a) j
    have hc := shape_indep_on_center G A b (by simp [A,U,Ne.symm hab]) hcenter j
    rw [hIb,hcardA,hcardI] at hc
    change ((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card =
      ((A.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card + _ at hcount
    rw [hc,hIa,shape_indep_on_edgeless G I hi,hcardI] at hcount
    have hn' : Nat.card V-1-1 = (Nat.card V-3)+1 := by omega
    rw [hn',Nat.choose_succ_succ'] at hcount
    rw [Erdos993G1.indepCount_eq_card_indepSetFinset,
      Erdos993G1.indepSetFinset_eq_filter_powersetCard]
    change (((U.powersetCard (j+1)).filter (fun S : Finset V => G.IsIndepSet S)).card : ℤ) = _
    rw [hcount]
    simp [binomCoeff, Nat.cast_add, show (0 : ℤ) ≤ (j : ℤ)+1 by omega]
    ring

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 148 END

-- VERITYOS ENTRY 149 BEGIN lemma Erdos993G1.FirstWide.intersecting_edges_count_shapes 2ef1af9291a95162818c1c19180c72a1fa95692f5f9b7af236a5f7c0078da68a
namespace Erdos993G1.FirstWide

lemma intersecting_edges_count_shapes {V : Type u} [Finite V]
    (G : SimpleGraph V) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card V = 2*r+2)
    (hedge : 2 ≤ Nat.card G.edgeSet)
    (hnone : ¬ ∃ a b c d : V, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a,b} : Set V) {c,d}) :
    (∃ q : ℕ, q ≤ 2*r-1 ∧ ∀ j : ℕ,
      Erdos993G1.indepCount G j = binomCoeff (2*r+1) (j : ℤ) +
        binomCoeff q ((j : ℤ)-1)) ∨
    (∀ j : ℕ, Erdos993G1.indepCount G j =
      binomCoeff (2*r-1) (j : ℤ) + 3*binomCoeff (2*r-1) ((j : ℤ)-1)) := by
  rcases intersecting_edges_center_or_triangle G hedge hnone with h | h
  · obtain ⟨a,b,c,hab,hac,hbc,hc⟩ := h
    obtain ⟨q,hq,hqcount⟩ := coeff_center G hab hac hbc hc
    left
    refine ⟨q,by omega,?_⟩
    have hn' : Nat.card V-1 = 2*r+1 := by omega
    simpa [hn'] using hqcount
  · obtain ⟨a,b,c,hab,hac,hbc,hG⟩ := h
    right
    have hn' : Nat.card V-3 = 2*r-1 := by omega
    simpa [hn'] using coeff_triangle G hab hac hbc hG

end Erdos993G1.FirstWide
-- VERITYOS ENTRY 149 END

-- VERITYOS ENTRY 150 BEGIN lemma Erdos993G1.firstWide_nonpos_of_two_edges f4c479083c23cfb7820634ee453a048cadba8959dcffe87bab7998c7d728e857
namespace Erdos993G1
lemma firstWide_nonpos_of_two_edges {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card Y = 2 * r + 2)
    (he : 2 ≤ Nat.card G.edgeSet) : Erdos993G1.delta G (r : ℤ) ≤ 0 := by
  classical
  by_cases hm : ∃ a b c d : Y, G.Adj a b ∧ G.Adj c d ∧
      Disjoint ({a, b} : Set Y) {c, d}
  · obtain ⟨a, b, c, d, hab, hcd, hdis⟩ := hm
    exact Erdos993G1.FirstWide.delta_nonpos_of_disjoint_edges G r hr hn a b c d hab hcd hdis
  · rcases Erdos993G1.FirstWide.intersecting_edges_count_shapes G r hr hn he hm with hc | hc
    · obtain ⟨q, hq, hc⟩ := hc
      exact Erdos993G1.FirstWide.delta_nonpos_of_center_counts G r q hr hq hc
    · exact (Erdos993G1.FirstWide.delta_neg_of_triangle_counts G r hr hc).le
end Erdos993G1

-- VERITYOS ENTRY 150 END

-- VERITYOS ENTRY 151 BEGIN lemma E993OrderBand.multi_deletion_marked bbdedcdcc8715fc72b3eac7f6e64109398db34fc5ef78f27a8fd37a569089a01
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
-- VERITYOS ENTRY 151 END

-- VERITYOS ENTRY 152 BEGIN lemma E993OrderBand.multi_lower_degree f76deeb36c2fbe0ebcc55b70cab9ab1b738ac5b8faaf15fa85d76885ca3c7fe7
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
-- VERITYOS ENTRY 152 END

-- VERITYOS ENTRY 153 BEGIN lemma E993OrderBand.lower_degree 09a61a2d71c81906e2e1ae9413431a5359cadf3f7b50dc07aaad58a4a091f5c3
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
-- VERITYOS ENTRY 153 END

-- VERITYOS ENTRY 154 BEGIN lemma E993OrderBand.upper_degree_le_extensions 6abf0ab0bf6a36d6dbd821de0bfedd3018c9640c8204fb34c72879fce1b7ef1c
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
-- VERITYOS ENTRY 154 END

-- VERITYOS ENTRY 155 BEGIN lemma E993OrderBand.extensionSet_subset ebfb7cfd6943e870450ef74275fc7d364d0c5f798523b8f830c1d7ea968e5b92
namespace E993OrderBand

open Classical

lemma extensionSet_subset {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U A : Finset V) :
    extensionSet G U A ⊆ U \ A := by
  intro y hy
  obtain ⟨hyU, hyA, _⟩ := Finset.mem_filter.mp hy
  exact Finset.mem_sdiff.mpr ⟨hyU, hyA⟩

end E993OrderBand
-- VERITYOS ENTRY 155 END

-- VERITYOS ENTRY 156 BEGIN lemma E993OrderBand.extensionSet_card_le e17e205121315f5ba7b647f3bb7945c7fa23a1ee418df7026e997f14186edfed
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
-- VERITYOS ENTRY 156 END

-- VERITYOS ENTRY 157 BEGIN lemma E993OrderBand.extensionSet_card_lt_of_neighbor 00bc8a3d1d27b6b01b905f0c139f3355899d6939aa210d8d3fe300753423c686
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
-- VERITYOS ENTRY 157 END

-- VERITYOS ENTRY 158 BEGIN lemma E993OrderBand.incidence_bound d511f56f022dbea03070935fcf325973e6efa9b5e5c684d70c7e05d520e4fe93
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
-- VERITYOS ENTRY 158 END

-- VERITYOS ENTRY 159 BEGIN lemma E993OrderBand.marked_incidence_bound d3ec8a224a68536858a5391099ab826e63b9f08310dbf1b5019ea3ff3332ac69
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
-- VERITYOS ENTRY 159 END

-- VERITYOS ENTRY 160 BEGIN lemma E993OrderBand.marked_bound_below_even 68154e9aeec357883e1aa2f208f4cbf9f5d2e511d0e11ec801825dc308df4abb
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
-- VERITYOS ENTRY 160 END

-- VERITYOS ENTRY 161 BEGIN lemma E993OrderBand.support_spec 06eb6e39a78dcc278cdbf39e88a7a80ccc95380429b923534af4aae2abcc0963
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
-- VERITYOS ENTRY 161 END

-- VERITYOS ENTRY 162 BEGIN lemma E993OrderBand.support_adj b3951f0851be5056028203045c0270a2e3fcd32ea44ae32b99a40fe52cc12fc2
namespace E993OrderBand

open Classical

lemma support_adj {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    G.Adj v (C5LA1.support G v) :=
  (support_spec G v hv).1

end E993OrderBand
-- VERITYOS ENTRY 162 END

-- VERITYOS ENTRY 163 BEGIN lemma E993OrderBand.support_unique a2726530c4acfa5a926fe94b75980c80abf420115d327b532db4f95870e612dd
namespace E993OrderBand

open Classical

lemma support_unique {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    {w : V} (hw : G.Adj v w) : w = C5LA1.support G v :=
  (support_spec G v hv).2 w hw

end E993OrderBand
-- VERITYOS ENTRY 163 END

-- VERITYOS ENTRY 164 BEGIN lemma E993OrderBand.H_subset_R 920c66b4c98faa8fffbb4714d43c940bcbcb907df37e00df875e14783749143d
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
-- VERITYOS ENTRY 164 END

-- VERITYOS ENTRY 165 BEGIN lemma E993OrderBand.H_card 15b4dd5570b1695d5b599e0023d7b36f0cdc9500fe2a73d6214c37e6bf280a62
namespace E993OrderBand

open Classical

lemma H_card {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    (C5LA1.H G v).card = 2 := by
  have hne : v ≠ C5LA1.support G v := (support_adj G v hv).ne
  simp [C5LA1.H, hne]

end E993OrderBand
-- VERITYOS ENTRY 165 END

-- VERITYOS ENTRY 166 BEGIN lemma E993OrderBand.retained_card 058f3891961e554c4e922ce094cc01daee41d94c14357e65ec567c5646312c89
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
-- VERITYOS ENTRY 166 END

-- VERITYOS ENTRY 167 BEGIN lemma E993OrderBand.tagged_count_split 85527f25b4e7399f44404ebc52f3e95d34169f9a59e77955850efdac449e3203
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
-- VERITYOS ENTRY 167 END

-- VERITYOS ENTRY 168 BEGIN lemma E993OrderBand.tagged_marks_sdiff a72d9eb3d7c8053bf7c31173cdd8b6757caf27469d7552a8034330488ad23c22
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
-- VERITYOS ENTRY 168 END

-- VERITYOS ENTRY 169 BEGIN lemma E993OrderBand.leaf_count_split 9cc4366ab56b8b3b84d4dd65a3a06cc30bb1752d4fe2356c052a9fbe9d66cb67
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
-- VERITYOS ENTRY 169 END

-- VERITYOS ENTRY 170 BEGIN lemma Erdos993G1.ThirdWide.cover_fiber_count f116c6f46472401183d37aacb3ca4ac49a46a273a39aa70a473affe783dbf073
namespace Erdos993G1.ThirdWide

open Finset Classical

variable {X : Type u} [Fintype X] [DecidableEq X]

lemma cover_fiber_count (F : SimpleGraph X) [DecidableRel F.Adj] (C S : Finset X)
    (hSC : S ⊆ C) (hS : F.IsIndepSet S)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ) :
    (((F.indepSetFinset k).filter (fun T => T ∩ C = S)).card : ℤ) =
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card) := by
  classical
  let B := (univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)
  let A := (F.indepSetFinset k).filter (fun T => T ∩ C = S)
  by_cases hsk : S.card ≤ k
  · have hcount : A.card = (B.powersetCard (k-S.card)).card := by
      apply Finset.card_bij (fun T _ => T \ C)
      · intro T hT
        obtain ⟨hT,hTC⟩ := mem_filter.mp hT
        have hind := (SimpleGraph.mem_indepSetFinset_iff.mp hT).isIndepSet
        have htcard := (SimpleGraph.mem_indepSetFinset_iff.mp hT).card_eq
        refine mem_powersetCard.mpr ⟨?_,?_⟩
        · intro x hx
          obtain ⟨hxT,hxC⟩ := mem_sdiff.mp hx
          refine mem_filter.mpr ⟨mem_univ _, hxC, ?_⟩
          intro y hy hadj
          have hyT : y ∈ T := (mem_inter.mp (hTC ▸ hy)).1
          exact hind hyT hxT hadj.ne hadj
        · have hc := card_sdiff_add_card_inter T C
          rw [hTC,htcard] at hc
          omega
      · intro T hT U hU heq
        have hTC := (mem_filter.mp hT).2
        have hUC := (mem_filter.mp hU).2
        have hTdec : T \ C ∪ S = T := by rw [← hTC]; exact sdiff_union_inter _ _
        have hUdec : U \ C ∪ S = U := by rw [← hUC]; exact sdiff_union_inter _ _
        rw [← hTdec, ← hUdec, heq]
      · intro J hJ
        obtain ⟨hJB,hJcard⟩ := mem_powersetCard.mp hJ
        have hJC : Disjoint J C := disjoint_left.mpr (by
          intro x hx hxC
          exact (mem_filter.mp (hJB hx)).2.1 hxC)
        have hJS : Disjoint J S := hJC.mono_right hSC
        have hind : F.IsIndepSet (↑(J ∪ S) : Set X) := by
          intro x hx y hy hxy hadj
          rcases mem_union.mp hx with hx | hx <;> rcases mem_union.mp hy with hy | hy
          · rcases hcover x y hadj with hxC | hyC
            · exact (mem_filter.mp (hJB hx)).2.1 hxC
            · exact (mem_filter.mp (hJB hy)).2.1 hyC
          · exact (mem_filter.mp (hJB hx)).2.2 y hy hadj.symm
          · exact (mem_filter.mp (hJB hy)).2.2 x hx hadj
          · exact hS hx hy hxy hadj
        refine ⟨J ∪ S, mem_filter.mpr ⟨?_,?_⟩, ?_⟩
        · apply SimpleGraph.mem_indepSetFinset_iff.mpr
          refine ⟨hind,?_⟩
          rw [card_union_of_disjoint hJS,hJcard]
          omega
        · ext x
          simp only [mem_inter,mem_union]
          constructor
          · rintro ⟨hx,hxC⟩
            rcases hx with hx | hx
            · exact False.elim ((disjoint_left.mp hJC hx) hxC)
            · exact hx
          · intro hx
            exact ⟨Or.inr hx,hSC hx⟩
        · ext x
          simp only [mem_sdiff,mem_union]
          constructor
          · rintro ⟨hx,hxC⟩
            rcases hx with hx | hx
            · exact hx
            · exact False.elim (hxC (hSC hx))
          · intro hx
            exact ⟨Or.inl hx,fun hxC => disjoint_left.mp hJC hx hxC⟩
    rw [card_powersetCard] at hcount
    have hz : (k : ℤ) - S.card = ((k-S.card : ℕ) : ℤ) := by omega
    change (A.card : ℤ) = FirstWide.binomCoeff B.card _
    rw [hcount,hz,FirstWide.binomCoeff_nat]
  · have hA : A = ∅ := by
      apply eq_empty_iff_forall_notMem.mpr
      intro T hT
      obtain ⟨hT,hTC⟩ := mem_filter.mp hT
      have hc := card_le_card (inter_subset_left (s₁ := T) (s₂ := C))
      rw [hTC,(SimpleGraph.mem_indepSetFinset_iff.mp hT).card_eq] at hc
      exact hsk hc
    have hz : (k : ℤ) - S.card < 0 := by omega
    change (A.card : ℤ) = FirstWide.binomCoeff B.card _
    rw [hA,card_empty,FirstWide.binomCoeff_neg _ hz]
    rfl

-- ENTRY 166
-- VERITYOS ENTRY 170 END

-- VERITYOS ENTRY 171 BEGIN lemma Erdos993G1.ThirdWide.cover_indepCount_partition b07bb93880d9e22709580b3cc614a8735d135737350237777a0d0ff9e440791e
lemma cover_indepCount_partition (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ) :
    indepCount F k =
      ∑ S ∈ C.powerset.filter (fun S : Finset X => F.IsIndepSet S),
        FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card) := by
  classical
  rw [indepCount_eq_card_indepSetFinset]
  have hc := card_eq_sum_card_fiberwise
    (s := F.indepSetFinset k)
    (t := C.powerset.filter (fun S : Finset X => F.IsIndepSet S))
    (f := fun T => T ∩ C) (by
      intro T hT
      apply mem_filter.mpr
      refine ⟨mem_powerset.mpr (inter_subset_right),?_⟩
      exact (SimpleGraph.mem_indepSetFinset_iff.mp hT).isIndepSet.mono
        (by simpa using (inter_subset_left (s₁ := T) (s₂ := C))))
  rw [hc,Nat.cast_sum]
  apply sum_congr rfl
  intro S hS
  obtain ⟨hSC,hS⟩ := mem_filter.mp hS
  exact cover_fiber_count F C S (mem_powerset.mp hSC) hS hcover k

-- ENTRY 167
-- VERITYOS ENTRY 171 END

-- VERITYOS ENTRY 172 BEGIN lemma Erdos993G1.ThirdWide.cover_delta_partition 09c1f3f34ab5dbcc4dae97d966a7770ed4333dbdf28e5d46244742a62f8e2a36
lemma cover_delta_partition (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ) :
    delta F (k : ℤ) =
      ∑ S ∈ C.powerset.filter (fun S : Finset X => F.IsIndepSet S),
        (FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card + 1) -
        FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card)) := by
  rw [delta_nat,cover_indepCount_partition F C hcover,
    cover_indepCount_partition F C hcover,← sum_sub_distrib]
  apply sum_congr rfl
  intro S hS
  congr 2
  push_cast
  ring

-- ENTRY 168
-- VERITYOS ENTRY 172 END

-- VERITYOS ENTRY 173 BEGIN lemma Erdos993G1.ThirdWide.cover_sum_bound b4e87862e9788db0daf198f185cfca272be47f545a217cd8d7b4e5e53fa869da
lemma cover_sum_bound (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ)
    (f : Finset X → ℤ)
    (hmiss : ∀ S ⊆ C, ¬F.IsIndepSet S → f S ≤ 0)
    (hterm : ∀ S ⊆ C, F.IsIndepSet S → f S ≤
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card + 1) -
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card)) :
    ∑ S ∈ C.powerset, f S ≤ delta F (k : ℤ) := by
  rw [cover_delta_partition F C hcover]
  calc
    ∑ S ∈ C.powerset, f S ≤
        ∑ S ∈ C.powerset.filter (fun S : Finset X => F.IsIndepSet S), f S := by
      rw [sum_filter]
      apply sum_le_sum
      intro S hSC
      by_cases hS : F.IsIndepSet S
      · simp [hS]
      · simpa [hS] using hmiss S (mem_powerset.mp hSC) hS
    _ ≤ _ := by
      apply sum_le_sum
      intro S hS
      obtain ⟨hSC,hS⟩ := mem_filter.mp hS
      exact hterm S (mem_powerset.mp hSC) hS

-- ENTRY 172
-- VERITYOS ENTRY 173 END

-- VERITYOS ENTRY 174 BEGIN lemma Erdos993G1.ThirdWide.cover_available_empty e530a0c86d03a7daf7dcc9bca71300d330a0693013b22bbfd409192a8e2bc75d
lemma cover_available_empty (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) :
    ((univ : Finset X).filter
      (fun x => x ∉ C ∧ ∀ y ∈ (∅ : Finset X), ¬F.Adj y x)).card =
      Fintype.card X - C.card := by
  have he : (univ : Finset X).filter
      (fun x => x ∉ C ∧ ∀ y ∈ (∅ : Finset X), ¬F.Adj y x) = univ \ C := by
    ext x
    simp
  rw [he,card_sdiff_of_subset (subset_univ _),card_univ]

-- Seat U3 Main.lean Step 1: renamed card-5 lemmas (rename done FIRST per charter)
-- VERITYOS ENTRY 174 END

-- VERITYOS ENTRY 175 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_pascal 97582ee01344b775cbe4d15b278588880e446c1b491d210a40f7eb6e6da88bb7
lemma binomDelta_pascal (m j : ℕ) :
    ((m+1).choose (j+2) : ℤ) - (m+1).choose (j+1) =
      ((m.choose (j+2) : ℤ) - m.choose (j+1)) +
      ((m.choose (j+1) : ℤ) - m.choose j) := by
  rw [show j+2=(j+1)+1 by omega, Nat.choose_succ_succ', Nat.choose_succ_succ']
  push_cast
  ring
-- VERITYOS ENTRY 175 END

-- VERITYOS ENTRY 176 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_step_up 6e4d10c62c7e80d9268bbabe83b13ec5d482348abd4ecf2d97e9454e3541a72d
lemma binomDelta_step_up (m k : ℕ) (hm : 2*k ≤ m) :
    (m.choose (k+1) : ℤ) - m.choose k ≤
      ((m+1).choose (k+1) : ℤ) - (m+1).choose k := by
  cases k with
  | zero => simp
  | succ j =>
    have hc := FirstWide.choose_step_strict (n := m) (k := j) (by omega)
    have hc' : (m.choose j : ℤ) ≤ m.choose (j+1) := by exact_mod_cast hc.le
    have hp := binomDelta_pascal m j
    linarith
-- VERITYOS ENTRY 176 END

-- VERITYOS ENTRY 177 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_step_down 1611ccdf6868d476632bba9978c3c9a1d6ba1594c44a902be1f4eddb3e031f06
lemma binomDelta_step_down (m k : ℕ) (hk : 1 ≤ k) (hm : m < 2*k) :
    ((m+1).choose (k+1) : ℤ) - (m+1).choose k ≤
      (m.choose (k+1) : ℤ) - m.choose k := by
  obtain ⟨j, rfl⟩ := Nat.exists_eq_add_of_le' hk
  have hc := FirstWide.choose_step_nonpos (n := m) (k := j) (by omega)
  have hc' : (m.choose (j+1) : ℤ) ≤ m.choose j := by exact_mod_cast hc
  have hp := binomDelta_pascal m j
  linarith
-- VERITYOS ENTRY 177 END

-- VERITYOS ENTRY 178 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_mono_center ec321ef0044a12f64c517c4af2506fa241a7c6c9d5fedf84304b4e337b0bfcc6
lemma binomDelta_mono_center {k a b : ℕ} (h : 2*k ≤ a) (hab : a ≤ b) :
    (a.choose (k+1) : ℤ) - a.choose k ≤
      (b.choose (k+1) : ℤ) - b.choose k := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih => exact ih.trans (binomDelta_step_up b k (by omega))
-- VERITYOS ENTRY 178 END

-- VERITYOS ENTRY 179 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_antitone e00587a59d623ae970a2e6b8449c42a95bcba7b09e722a7455893bea790fbc84
lemma binomDelta_antitone {k a b : ℕ} (hk : 1 ≤ k) (hb : b ≤ 2*k) (hab : a ≤ b) :
    (b.choose (k+1) : ℤ) - b.choose k ≤
      (a.choose (k+1) : ℤ) - a.choose k := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih =>
    exact (binomDelta_step_down b k hk (by omega)).trans (ih (by omega))
-- VERITYOS ENTRY 179 END

-- VERITYOS ENTRY 180 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_central a9a0866e169a567f704ba70c3f94a3326b556a5d4d5e708757df0b069c9ab0b5
lemma binomDelta_central (j : ℕ) :
    ((2*j).choose (j+1) : ℤ) - (2*j).choose j = -(catalan j : ℤ) := by
  have hn : 2*j-j=j := by omega
  have he := Nat.choose_succ_right_eq (2*j) j
  rw [hn] at he
  have he' : ((2*j).choose (j+1) : ℤ) * (j+1) = (2*j).choose j * (j : ℤ) := by exact_mod_cast he
  have hc : ((j:ℤ)+1) * catalan j = (2*j).choose j := by
    exact_mod_cast succ_mul_catalan_eq_centralBinom j
  apply (mul_right_cancel₀ (show (j : ℤ)+1 ≠ 0 by omega))
  nlinarith
-- VERITYOS ENTRY 180 END

-- VERITYOS ENTRY 181 BEGIN lemma Erdos993G1.ThirdWide.binomDelta_floor a37ec000d0863f2d11fa44028722398d17cfaaad4ddfe20362bca6a82637fea3
lemma binomDelta_floor (m j : ℕ) :
    -(catalan j : ℤ) ≤ (m.choose (j+1) : ℤ) - m.choose j := by
  by_cases hj : j=0
  · subst j; simp; omega
  rw [← binomDelta_central j]
  rcases le_total m (2*j) with hm | hm
  · exact binomDelta_antitone (by omega) le_rfl hm
  · exact binomDelta_mono_center le_rfl hm
-- VERITYOS ENTRY 181 END

-- VERITYOS ENTRY 182 BEGIN lemma Erdos993G1.ThirdWide.binom_shift_floor 875036d201efb347c88459ed5f9d5a72884325d270546cfa0b040e4cbda19f37
lemma binom_shift_floor (m k t : ℕ) :
    -(if t ≤ k then (catalan (k-t) : ℤ) else 0) ≤
      FirstWide.binomCoeff m ((k : ℤ)-t+1) -
        FirstWide.binomCoeff m ((k : ℤ)-t) := by
  by_cases htk : t ≤ k
  · have hz : (k : ℤ)-t = ((k-t : ℕ) : ℤ) := by omega
    rw [hz,FirstWide.binomCoeff_nat_add_one,FirstWide.binomCoeff_nat,if_pos htk]
    exact binomDelta_floor m (k-t)
  · rw [if_neg htk,neg_zero]
    by_cases he : t = k+1
    · have hz : (k : ℤ)-t = -1 := by omega
      norm_num [hz,FirstWide.binomCoeff]
    · have hz : (k : ℤ)-t+1 < 0 := by omega
      rw [FirstWide.binomCoeff_neg _ hz,
        FirstWide.binomCoeff_neg _ (show (k : ℤ)-t < 0 by omega)]
      omega

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 182 END

-- VERITYOS ENTRY 183 BEGIN lemma E993FirstShell.leaf_term_eq_tagged_delta 4ff2c279248ff18a94a46e4d269d600c1ab99e83a27759d255f84f6f2b48d440
namespace E993FirstShell
open Classical

lemma leaf_term_eq_tagged_delta {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (v : V)
    (hv : C4LA1.IsGraphLeaf T v) (k : ℕ) :
    C5LA1.forwardDifferenceDel T (C5LA1.H T v) k -
      C5LA1.forwardDifferenceDel T (C5LA1.R T v) k =
    ((E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
        (C5LA1.R T v \ C5LA1.H T v) (k + 1)).card : ℤ) -
      (E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
        (C5LA1.R T v \ C5LA1.H T v) k).card := by
  simp only [C5LA1.forwardDifferenceDel]
  rw [E993OrderBand.leaf_count_split T v hv (k + 1),
    E993OrderBand.leaf_count_split T v hv k]
  push_cast
  ring

end E993FirstShell
-- VERITYOS ENTRY 183 END

-- VERITYOS ENTRY 184 BEGIN lemma E993FirstShell.aggregate_nonpos_of_leaf_terms 5fef9b6d518030c82309917a2146ef251e91e69501fb2b9e97740535c7c3784a
namespace E993FirstShell
open Classical

lemma aggregate_nonpos_of_leaf_terms {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (p : ℕ)
    (h : ∀ v, C4LA1.IsGraphLeaf T v →
      C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
        C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0) :
    C5LA1.aggregate T p ≤ 0 := by
  unfold C5LA1.aggregate
  apply Finset.sum_nonpos
  intro v hv
  have hleaf : C4LA1.IsGraphLeaf T v := by
    have hmem := (Finset.mem_filter.mp hv).1
    exact (Finset.mem_filter.mp hmem).2
  exact h v hleaf

end E993FirstShell
-- VERITYOS ENTRY 184 END

-- VERITYOS ENTRY 185 BEGIN lemma Erdos993G1.ThirdWide.powerset_three_sum 8a82fc3fad65fcc8757eaf59b7f9de09e7499e943cd7401137ba7ae27d1ecf34
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma powerset_three_sum {X : Type u} [DecidableEq X]
    (C : Finset X) (hC : C.card = 3) (b : ℕ → ℤ) :
    ∑ S ∈ C.powerset, b S.card = b 0 + 3 * b 1 + 3 * b 2 + b 3 := by
  rw [sum_powerset]
  simp_rw [sum_powersetCard]
  rw [hC]
  norm_num [sum_range_succ, Nat.choose]

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 185 END

-- VERITYOS ENTRY 186 BEGIN lemma Erdos993G1.ThirdWide.cover_rank_bound_three e84adfe1cdd0161265a4d9325380fc9e187ae7bd3da2cd1f8b8b0dd67ac145be
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma cover_rank_bound_three {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 3)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ)
    (b : ℕ → ℤ) (hb : ∀ t, 0 < t → b t ≤ 0)
    (hterm : ∀ S ⊆ C, F.IsIndepSet S → b S.card ≤
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card + 1) -
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card)) :
    b 0 + 3 * b 1 + 3 * b 2 + b 3 ≤ delta F (k : ℤ) := by
  rw [← powerset_three_sum C hC b]
  apply cover_sum_bound F C hcover k (fun S => b S.card) ?_ hterm
  intro S hSC hS
  apply hb
  by_contra h
  have : S = ∅ := card_eq_zero.mp (by omega)
  subst S
  exact hS (by simp [SimpleGraph.IsIndepSet])

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 186 END

-- VERITYOS ENTRY 187 BEGIN lemma Erdos993G1.ThirdWide.cover_catalan_bound_three 42c1d262f687b1768fa8e8675c024919fe34f614daf80daa171c35b95af80149
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma cover_catalan_bound_three {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 3)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C)
    (n k : ℕ) (hn : Fintype.card X = n + 3) :
    (n.choose (k + 1) : ℤ) - n.choose k -
      3 * (if 1 ≤ k then (catalan (k - 1) : ℤ) else 0) -
      3 * (if 2 ≤ k then (catalan (k - 2) : ℤ) else 0) -
      (if 3 ≤ k then (catalan (k - 3) : ℤ) else 0) ≤
      delta F (k : ℤ) := by
  let b : ℕ → ℤ := fun t => if t = 0 then
    (n.choose (k + 1) : ℤ) - n.choose k else
    -(if t ≤ k then (catalan (k - t) : ℤ) else 0)
  have h := cover_rank_bound_three F C hC hcover k b ?_ ?_
  · convert h using 1 <;> dsimp [b] <;> ring
  · intro t ht
    simp only [b, if_neg (by omega : t ≠ 0)]
    split_ifs <;> omega
  · intro S hSC hS
    by_cases hzero : S.card = 0
    · have he : S = ∅ := card_eq_zero.mp hzero
      subst S
      rw [cover_available_empty F C, hn, hC]
      norm_num only [Nat.add_sub_cancel, card_empty, Nat.cast_zero, sub_zero]
      simp [b, FirstWide.binomCoeff_nat_add_one, FirstWide.binomCoeff_nat]
    · simpa only [b, if_neg hzero] using binom_shift_floor
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card k S.card

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 187 END

-- VERITYOS ENTRY 188 BEGIN lemma Erdos993G1.ThirdWide.exists_card_three_cover e81231be8390cc251b06685fa26fd8f92f584a0355afba45049ddbeba9890157
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma exists_card_three_cover {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj]
    (C0 : Finset X) (hC0 : C0.card ≤ 3) (hX : 3 ≤ Fintype.card X)
    (hcover0 : ∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) :
    ∃ C : Finset X, C.card = 3 ∧ C0 ⊆ C ∧
      ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C := by
  obtain ⟨C, hC0C, hCcard⟩ := Finset.exists_superset_card_eq hC0
    (by simpa using hX)
  refine ⟨C, hCcard, hC0C, fun x y hxy => ?_⟩
  rcases hcover0 x y hxy with h | h
  · exact Or.inl (hC0C h)
  · exact Or.inr (hC0C h)

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 188 END

-- VERITYOS ENTRY 189 BEGIN lemma Erdos993G1.ThirdWide.catalan_recurrence_int 8b560ff89f825f0129846d52fcf311a61532509729ed379538b87c2dd2659e36
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma catalan_recurrence_int (n : ℕ) :
    ((n:ℤ)+2) * catalan (n+1) = (4*n+2) * catalan n := by
  have hc := Nat.succ_mul_centralBinom_succ n
  rw [← succ_mul_catalan_eq_centralBinom (n+1),
    ← succ_mul_catalan_eq_centralBinom n] at hc
  have he : ((n:ℤ)+1) * (((n:ℤ)+2) * catalan (n+1)) =
      2*(2*n+1)*(((n:ℤ)+1)*catalan n) := by exact_mod_cast hc
  apply (mul_left_cancel₀ (show (n:ℤ)+1 ≠ 0 by omega))
  nlinarith [he]

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 189 END

-- VERITYOS ENTRY 190 BEGIN lemma Erdos993G1.ThirdWide.catalan_succ_ge 550f3de5f6ce3f3ee5c57ccc4141a51c2b4c179a44f0f5531a5e217387bd51dc
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma catalan_succ_ge (n : ℕ) : (catalan n : ℤ) ≤ catalan (n + 1) := by
  have h := catalan_recurrence_int n
  have hc : 0 ≤ (catalan n : ℤ) := Nat.cast_nonneg _
  have hn : 0 ≤ (n : ℤ) := Nat.cast_nonneg _
  have hnext : 0 ≤ (catalan (n + 1) : ℤ) := Nat.cast_nonneg _
  nlinarith [mul_nonneg (show 0 ≤ (3 * (n : ℤ)) by omega) hc]

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 190 END

-- VERITYOS ENTRY 191 BEGIN lemma Erdos993G1.ThirdWide.catalan_mono 3eb2d219212c68e5d42408c0156386b2e548d4ae85716f8302a27d77dd3ee4bb
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma catalan_mono {a b : ℕ} (hab : a ≤ b) :
    (catalan a : ℤ) ≤ catalan b := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih => exact ih.trans (catalan_succ_ge b)

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 191 END

-- VERITYOS ENTRY 192 BEGIN lemma Erdos993G1.ThirdWide.catalan_succ_ge_double 0ea492ad67ce482c8e110c3031cfc497ece65f20fae6ea0edba1cfeb6861b27e
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma catalan_succ_ge_double (n : ℕ) (hn : 1 ≤ n) :
    2 * (catalan n : ℤ) ≤ catalan (n + 1) := by
  have h := catalan_recurrence_int n
  have hc : 0 ≤ (catalan n : ℤ) := Nat.cast_nonneg _
  have hnext : 0 ≤ (catalan (n + 1) : ℤ) := Nat.cast_nonneg _
  have hn' : 1 ≤ (n : ℤ) := by exact_mod_cast hn
  nlinarith [mul_nonneg (show 0 ≤ (2 * (n : ℤ) - 2) by omega) hc]

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 192 END

-- VERITYOS ENTRY 193 BEGIN lemma Erdos993G1.ThirdWide.binom_gap_two_catalan 8d340556c12cbecebfa352831706b4c5b405c416b117c2d9a3c4e343f6f71b82
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma binom_gap_two_catalan (r : ℕ) :
    2 * (catalan (r + 1) : ℤ) ≤
      ((2*r+3).choose (r+1) : ℤ) - (2*r+3).choose r := by
  let A : ℤ := (2*r+3).choose (r+1)
  let B : ℤ := (2*r+3).choose r
  let C : ℤ := (2*r+2).choose (r+1)
  let D : ℤ := (2*r+2).choose r
  have hp : A = C + D := by
    have h := Nat.choose_succ_succ' (2*r+2) r
    dsimp [A,C,D]
    convert congrArg (fun x : ℕ => (x : ℤ)) h using 1 <;> omega
  have hchoose : C * ((r:ℤ)+1) = D * ((r:ℤ)+2) := by
    have h := Nat.choose_succ_right_eq (2*r+2) r
    have hr : 2*r+2-r = r+2 := by omega
    rw [hr] at h
    dsimp [C,D]
    exact_mod_cast h
  have hc : ((r:ℤ)+2) * catalan (r+1) = C := by
    have h := succ_mul_catalan_eq_centralBinom (r+1)
    have h' : (r+2) * catalan (r+1) = (2*r+2).choose (r+1) := by
      dsimp [Nat.centralBinom] at h
      have ha : r + 1 + 1 = r + 2 := by omega
      have hb : 2 * (r + 1) = 2 * r + 2 := by omega
      rw [ha, hb] at h
      exact h
    dsimp [C]
    exact_mod_cast h'
  have hD : D = ((r:ℤ)+1) * catalan (r+1) := by
    apply (mul_left_cancel₀ (show (r:ℤ)+2 ≠ 0 by omega))
    have hcm := congrArg (fun x : ℤ => x*((r:ℤ)+1)) hc
    nlinarith [hchoose, hcm]
  have hA : A = (2*(r:ℤ)+3) * catalan (r+1) := by
    nlinarith [hp,hc,hD]
  have hab : A * ((r:ℤ)+1) = B * ((r:ℤ)+3) := by
    have h := Nat.choose_succ_right_eq (2*r+3) r
    have hr : 2*r+3-r = r+3 := by omega
    rw [hr] at h
    dsimp [A,B]
    exact_mod_cast h
  have hid : ((r:ℤ)+3) * (A-B) = 2*(2*(r:ℤ)+3)*catalan (r+1) := by
    nlinarith [hab,hA]
  have hcat : 0 ≤ (catalan (r+1) : ℤ) := Nat.cast_nonneg _
  have hnonneg : 0 ≤ (2*(r:ℤ)) * catalan (r+1) :=
    mul_nonneg (by omega) hcat
  have hmult : ((r:ℤ)+3) * (2*(catalan (r+1):ℤ)) ≤
      ((r:ℤ)+3) * (A-B) := by nlinarith [hid,hnonneg]
  have hpos : (0:ℤ) < (r:ℤ)+3 := by omega
  have hres : 2*(catalan (r+1):ℤ) ≤ A-B := by
    by_contra hn
    have hlt : A-B < 2*(catalan (r+1):ℤ) := lt_of_not_ge hn
    have hprod := mul_lt_mul_of_pos_left hlt hpos
    omega
  exact hres

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 193 END

-- VERITYOS ENTRY 194 BEGIN lemma Erdos993G1.ThirdWide.catalan_pos_int 89c4eab27064ab323042ce71757c7485ea707c757c30ce4f98b54017728f85f4
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma catalan_pos_int (n : ℕ) : 0 < (catalan n : ℤ) := by
  induction n with
  | zero => norm_num [catalan_zero]
  | succ n ih =>
    have h := catalan_recurrence_int n
    have hcoeff : 0 < (4 * (n : ℤ) + 2) := by omega
    have hrhs : 0 < (4 * (n : ℤ) + 2) * catalan n := mul_pos hcoeff ih
    have hnext : 0 ≤ (catalan (n+1) : ℤ) := Nat.cast_nonneg _
    nlinarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 194 END

-- VERITYOS ENTRY 195 BEGIN lemma Erdos993G1.ThirdWide.catalan_gap_three_pos 8630a15c2d78e76e9baeebfd30a6821bdc5872cb2b850baca4b401f0ab0e29b4
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma catalan_gap_three_pos (r : ℕ) :
    0 < ((2*r+3).choose (r+1) : ℤ) - (2*r+3).choose r -
      3 * (if 1 ≤ r then (catalan (r-1) : ℤ) else 0) -
      3 * (if 2 ≤ r then (catalan (r-2) : ℤ) else 0) -
      (if 3 ≤ r then (catalan (r-3) : ℤ) else 0) := by
  by_cases hr0 : r = 0
  · subst r
    norm_num [Nat.choose]
  by_cases hr1 : r = 1
  · subst r
    norm_num [Nat.choose, catalan_zero]
  have hr : 2 ≤ r := by omega
  have h1 : 1 ≤ r := by omega
  have hE := binom_gap_two_catalan r
  have hm1 := catalan_mono (a := r-2) (b := r-1) (by omega)
  have hd1 := catalan_succ_ge_double (r-1) (by omega)
  have hd2 := catalan_succ_ge_double r (by omega)
  have heq : r-1+1 = r := by omega
  rw [heq] at hd1
  have hcat := catalan_pos_int (r-1)
  by_cases h3 : 3 ≤ r
  · have hm2 := catalan_mono (a := r-3) (b := r-1) (by omega)
    simp only [if_pos h1, if_pos hr, if_pos h3]
    linarith
  · simp only [if_pos h1, if_pos hr, if_neg h3]
    linarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 195 END

-- VERITYOS ENTRY 196 BEGIN lemma Erdos993G1.ThirdWide.cover_three_early_pos 88a8e10e458f1356ddc4f5c8c653e689666dfda7d07505dd7001eec1f658336d
namespace Erdos993G1.ThirdWide
open Finset Classical

lemma cover_three_early_pos {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 3)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C)
    (p r : ℕ) (hp : 3 ≤ p) (horder : Fintype.card X = 2*p+2)
    (hr : r ≤ p-2) :
    0 < delta F (r : ℤ) := by
  have hn : Fintype.card X = (2*p-1)+3 := by omega
  have hlower := cover_catalan_bound_three F C hC hcover (2*p-1) r hn
  have hmono := binomDelta_mono_center (k := r)
    (a := 2*r+3) (b := 2*p-1) (by omega) (by omega)
  have hpos := catalan_gap_three_pos r
  linarith

end Erdos993G1.ThirdWide
-- VERITYOS ENTRY 196 END

-- VERITYOS ENTRY 197 BEGIN lemma E993FirstShell.crossingIndex_negative df858ce587b4004becb01ab0ea3a63b1068f7f2185abf1b7667b311ef4c3e019
namespace E993FirstShell

lemma crossingIndex_negative {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] :
    C5LA1.forwardDifferenceDel T ∅ (C5LA1.crossingIndex T) < 0 := by
  classical
  unfold C5LA1.crossingIndex
  exact Nat.find_spec (p := fun k : ℕ => C5LA1.forwardDifferenceDel T ∅ k < 0) _

end E993FirstShell
-- VERITYOS ENTRY 197 END

-- VERITYOS ENTRY 198 BEGIN lemma E993FirstShell.indepSetCount_empty_eq 05277a8c2e0559cf1dc7626f414d380dbf0d9214e7e95a55eeaa276f1ef3fbae
namespace E993FirstShell

lemma indepSetCount_empty_eq {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (k : ℕ) :
    (C5LA1.indepSetCount T ∅ k : ℤ) = Erdos993G1.indepCount T k := by
  have hsets : C5LA1.indepSetsAvoiding T ∅ k = T.indepSetFinset k := by
    rw [Erdos993G1.indepSetFinset_eq_filter_powersetCard]
    simp [C5LA1.indepSetsAvoiding]
  rw [C5LA1.indepSetCount, hsets,
    Erdos993G1.indepCount_eq_card_indepSetFinset]

end E993FirstShell
-- VERITYOS ENTRY 198 END

-- VERITYOS ENTRY 199 BEGIN lemma E993FirstShell.empty_forwardDifference_eq_delta cbb7d42db28d7b563e4691733ca471a2885997aa115a9f7ab5e90be0fc06d707
namespace E993FirstShell

lemma empty_forwardDifference_eq_delta {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (k : ℕ) :
    C5LA1.forwardDifferenceDel T ∅ k = Erdos993G1.delta T (k : ℤ) := by
  rw [C5LA1.forwardDifferenceDel, Erdos993G1.delta_nat,
    indepSetCount_empty_eq, indepSetCount_empty_eq]

end E993FirstShell
-- VERITYOS ENTRY 199 END

-- VERITYOS ENTRY 200 BEGIN lemma E993FirstShell.no_three_cover_of_early_crossing e312420502ec439ba2c0ffbb6cd39b93282d5c47028b004fcf2a9391d6fd7a7c
namespace E993FirstShell

lemma no_three_cover_of_early_crossing {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (p : ℕ)
    (hp : 3 ≤ p) (horder : Fintype.card V = 2*p+2)
    (hcross : C5LA1.crossingIndex T + 2 ≤ p)
    (C0 : Finset V) (hC0 : C0.card ≤ 3) :
    ¬ (∀ x y, T.Adj x y → x ∈ C0 ∨ y ∈ C0) := by
  intro hcover0
  obtain ⟨C,hC,_,hcover⟩ :=
    Erdos993G1.ThirdWide.exists_card_three_cover T C0 hC0 (by omega) hcover0
  have hr : C5LA1.crossingIndex T ≤ p-2 := by omega
  have hpos := Erdos993G1.ThirdWide.cover_three_early_pos T C hC hcover
    p (C5LA1.crossingIndex T) hp horder hr
  have hneg := crossingIndex_negative T
  rw [empty_forwardDifference_eq_delta] at hneg
  omega

end E993FirstShell
-- VERITYOS ENTRY 200 END

-- VERITYOS ENTRY 201 BEGIN lemma E993FirstShell.leaf_retained_cover_transfer f22f1adb3feae88adc505330b25689ed71957a9502a070b3b0287c02f0f5ac7b
namespace E993FirstShell

lemma leaf_retained_cover_transfer {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (v : V)
    (hv : C4LA1.IsGraphLeaf T v) (C : Finset V)
    (hret : ∀ a b, T.Adj a b → a ∉ C5LA1.H T v → b ∉ C5LA1.H T v →
      a ∈ C ∨ b ∈ C) :
    ∀ a b, T.Adj a b →
      a ∈ insert (C5LA1.support T v) C ∨
      b ∈ insert (C5LA1.support T v) C := by
  intro a b hab
  by_cases has : a = C5LA1.support T v
  · exact Or.inl (by simp [has])
  by_cases hbs : b = C5LA1.support T v
  · exact Or.inr (by simp [hbs])
  have hav : a ≠ v := by
    intro h
    subst a
    exact hbs (E993OrderBand.support_unique T v hv hab)
  have hbv : b ≠ v := by
    intro h
    subst b
    exact has (E993OrderBand.support_unique T v hv hab.symm)
  have haH : a ∉ C5LA1.H T v := by simp [C5LA1.H, hav, has]
  have hbH : b ∉ C5LA1.H T v := by simp [C5LA1.H, hbv, hbs]
  rcases hret a b hab haH hbH with haC | hbC
  · exact Or.inl (Finset.mem_insert_of_mem haC)
  · exact Or.inr (Finset.mem_insert_of_mem hbC)

end E993FirstShell
-- VERITYOS ENTRY 201 END

-- VERITYOS ENTRY 202 BEGIN lemma E993FirstShell.no_two_cover_retained 3b1017f6d5226599ef779d3d769ea8ea632ddc831d7eb6962e5fc16931716d2b
namespace E993FirstShell

lemma no_two_cover_retained {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (v : V) (p : ℕ)
    (hv : C4LA1.IsGraphLeaf T v)
    (hp : 3 ≤ p) (horder : Fintype.card V = 2*p+2)
    (hcross : C5LA1.crossingIndex T + 2 ≤ p)
    (C : Finset V) (hC : C.card ≤ 2) :
    ¬ (∀ a b, T.Adj a b → a ∉ C5LA1.H T v → b ∉ C5LA1.H T v →
      a ∈ C ∨ b ∈ C) := by
  intro hret
  have hcard : (insert (C5LA1.support T v) C).card ≤ 3 := by
    have h := Finset.card_insert_le (C5LA1.support T v) C
    omega
  exact no_three_cover_of_early_crossing T p hp horder hcross
    (insert (C5LA1.support T v) C) hcard
    (leaf_retained_cover_transfer T v hv C hret)

end E993FirstShell
-- VERITYOS ENTRY 202 END

-- VERITYOS ENTRY 203 BEGIN lemma E993FirstShell.crossingIndex_pos_of_order f43a8ccbc90c5c16caa6ad8e8a6aca3c2b5f8ec08e19c2c343809e6f5c0a00a6
namespace E993FirstShell

lemma crossingIndex_pos_of_order {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (horder : 2 ≤ Fintype.card V) :
    0 < C5LA1.crossingIndex T := by
  have hneg := crossingIndex_negative T
  rw [empty_forwardDifference_eq_delta] at hneg
  have hzero : Erdos993G1.delta T 0 = (Fintype.card V : ℤ) - 1 := by
    simpa [Nat.card_eq_fintype_card] using Erdos993G1.delta_zero T
  by_contra h
  have hx : C5LA1.crossingIndex T = 0 := by omega
  rw [hx] at hneg
  norm_num only [Nat.cast_zero] at hneg
  rw [hzero] at hneg
  omega

end E993FirstShell
-- VERITYOS ENTRY 203 END

-- VERITYOS ENTRY 204 BEGIN lemma E993FirstShell.three_le_of_early_crossing 117f4a2afc2ae6c76eefc09c395a0d5270ebcaa018e3abcfea51a5277ad87ed8
namespace E993FirstShell

lemma three_le_of_early_crossing {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (p : ℕ)
    (horder : Fintype.card V = 2*p+2)
    (hcross : C5LA1.crossingIndex T + 2 ≤ p) : 3 ≤ p := by
  have hx := crossingIndex_pos_of_order T (by omega)
  omega

end E993FirstShell
-- VERITYOS ENTRY 204 END

-- VERITYOS ENTRY 205 BEGIN lemma E993FirstShell.retained_has_edge b92f83a4b03fd0b0688cfc91e5e3d1b27ac27e202f148ca62518b3451c9c79ae
namespace E993FirstShell

lemma retained_has_edge {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (v : V) (p : ℕ)
    (hv : C4LA1.IsGraphLeaf T v)
    (hp : 3 ≤ p) (horder : Fintype.card V = 2*p+2)
    (hcross : C5LA1.crossingIndex T + 2 ≤ p) :
    ∃ a b, T.Adj a b ∧ a ∉ C5LA1.H T v ∧ b ∉ C5LA1.H T v := by
  by_contra h
  have hnocover := no_two_cover_retained T v p hv hp horder hcross
    (∅ : Finset V) (by simp)
  apply hnocover
  intro a b hab ha hb
  exfalso
  exact h ⟨a,b,hab,ha,hb⟩

end E993FirstShell
-- VERITYOS ENTRY 205 END

-- VERITYOS ENTRY 206 BEGIN lemma E993FirstShell.leaf_retained_card_firstWide 2f448992a7172f501f45f3acccaf30a2e49f5bdd10249235c228dee71c0dabfd
namespace E993FirstShell

lemma leaf_retained_card_firstWide {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) (v : V) (p : ℕ)
    (hv : C4LA1.IsGraphLeaf T v) (hp : 1 ≤ p)
    (horder : Fintype.card V = 2*p+2) :
    (Finset.univ \ C5LA1.H T v).card = 2*(p-1)+2 := by
  have hcard := E993OrderBand.retained_card T v hv
  omega

end E993FirstShell
-- VERITYOS ENTRY 206 END

-- VERITYOS ENTRY 207 BEGIN lemma E993FirstShell.no_three_cover_from_shell ef668ad5e1e33316aafb1f3a4ba1687ad5581cbe97cbb3b94ad65c6936607966
namespace E993FirstShell

lemma no_three_cover_from_shell {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (p : ℕ)
    (horder : Fintype.card V = 2*p+2)
    (hcross : C5LA1.crossingIndex T + 2 ≤ p)
    (C0 : Finset V) (hC0 : C0.card ≤ 3) :
    ¬ (∀ x y, T.Adj x y → x ∈ C0 ∨ y ∈ C0) := by
  exact no_three_cover_of_early_crossing T p
    (three_le_of_early_crossing T p horder hcross) horder hcross C0 hC0

end E993FirstShell
-- VERITYOS ENTRY 207 END

-- VERITYOS ENTRY 208 BEGIN lemma E993FirstShell.leaf_term_nonpos_of_marked_shadow 3bfaceae4e4859ab281e09820375f8e80f588f69c94338c735ca63654fe2627c
namespace E993FirstShell

lemma leaf_term_nonpos_of_marked_shadow {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (v : V) (p : ℕ)
    (hv : C4LA1.IsGraphLeaf T v) (hp : 1 ≤ p)
    (hshadow :
      (E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
        (C5LA1.R T v \ C5LA1.H T v) p).card ≤
      (E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
        (C5LA1.R T v \ C5LA1.H T v) (p-1)).card) :
    C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p-1) -
      C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p-1) ≤ 0 := by
  have heq := leaf_term_eq_tagged_delta T v hv (p-1)
  have hpn : p-1+1=p := Nat.sub_add_cancel hp
  rw [hpn] at heq
  rw [heq]
  exact sub_nonpos.mpr (by exact_mod_cast hshadow)

end E993FirstShell
-- VERITYOS ENTRY 208 END

-- VERITYOS ENTRY 209 BEGIN lemma E993FirstShell.aggregate_nonpos_of_marked_shadows 555efe04905f58c33c9b25d7847235989ce62ce5e8cf449d8b57daca5de17711
namespace E993FirstShell

lemma aggregate_nonpos_of_marked_shadows {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (p : ℕ) (hp : 1 ≤ p)
    (hshadow : ∀ v, C4LA1.IsGraphLeaf T v →
      (E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
        (C5LA1.R T v \ C5LA1.H T v) p).card ≤
      (E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
        (C5LA1.R T v \ C5LA1.H T v) (p-1)).card) :
    C5LA1.aggregate T p ≤ 0 := by
  apply aggregate_nonpos_of_leaf_terms T p
  intro v hv
  exact leaf_term_nonpos_of_marked_shadow T v p hv hp (hshadow v hv)

end E993FirstShell
-- VERITYOS ENTRY 209 END

-- VERITYOS ENTRY 210 BEGIN lemma E993FirstShell.tagged_self e278254eee44c5f0ac65c5e656cd6c11a8ba639bf23407774c80786e467775ee
namespace E993FirstShell

open Classical

/-- Positive-size independent subsets of `U` automatically meet the mark set `U`. -/
lemma tagged_self {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (j : ℕ) (hj : 0 < j) :
    E993Interior.taggedFamily G U U j =
      (U.powersetCard j).filter (fun A : Finset V => G.IsIndepSet (A : Set V)) := by
  classical
  ext A
  simp only [E993Interior.taggedFamily, Finset.mem_filter,
    Finset.mem_powersetCard]
  constructor
  · rintro ⟨⟨hAU, hcard⟩, hI, _⟩
    exact ⟨⟨hAU, hcard⟩, hI⟩
  · rintro ⟨⟨hAU, hcard⟩, hI⟩
    have hpos : 0 < A.card := by omega
    obtain ⟨a, ha⟩ := Finset.card_pos.mp hpos
    exact ⟨⟨hAU, hcard⟩, hI,
      Finset.not_disjoint_iff.mpr ⟨a, ha, hAU ha⟩⟩

end E993FirstShell
-- VERITYOS ENTRY 210 END

-- VERITYOS ENTRY 211 BEGIN lemma E993FirstShell.ordinary_bound_below_even 4d8c92217c134d7cb2383bff1533e9d86724aed5c1807ff4390c5ee7f41702bc
namespace E993FirstShell

open Classical

/-- The elementary ordinary shadow inequality at an even-size bound. -/
lemma ordinary_bound_below_even {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (k : ℕ) (hk : 1 ≤ k) (hU : U.card ≤ 2 * k) :
    ((U.powersetCard (k + 1)).filter
      (fun A : Finset V => G.IsIndepSet (A : Set V))).card ≤
    ((U.powersetCard k).filter
      (fun A : Finset V => G.IsIndepSet (A : Set V))).card := by
  have h := E993OrderBand.marked_bound_below_even G U U k hk hU
  rw [tagged_self G U (k+1) (by omega), tagged_self G U k (by omega)] at h
  exact h

end E993FirstShell
-- VERITYOS ENTRY 211 END

-- VERITYOS ENTRY 212 BEGIN lemma E993FirstShell.tagged_split_mark 2dcedcacdd0b8fd1d6ae459dcfd073c19db400842fab42baeae7ba98ba2d92e1
namespace E993FirstShell

open Classical

/-- Split a marked independent family at a chosen mark. -/
lemma tagged_split_mark {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U W : Finset V)
    (a : V) (haU : a ∈ U) (haW : a ∈ W) (j : ℕ) :
    (E993Interior.taggedFamily G U W (j+1)).card =
      (E993Interior.taggedFamily G (U.erase a) (W.erase a) (j+1)).card +
      (((U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)).powersetCard j).filter
        (fun S : Finset V => G.IsIndepSet (S : Set V))).card := by
  classical
  let N := U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)
  let A := E993Interior.taggedFamily G U W (j+1)
  have hexclude : A.filter (fun S => a ∉ S) =
      E993Interior.taggedFamily G (U.erase a) (W.erase a) (j+1) := by
    ext S
    simp only [A, E993Interior.taggedFamily, Finset.mem_filter,
      Finset.mem_powersetCard]
    constructor
    · rintro ⟨⟨⟨hSU, hcard⟩, hind, hmark⟩, hnot⟩
      refine ⟨⟨?_, hcard⟩, hind, ?_⟩
      · intro x hx
        exact Finset.mem_erase.mpr ⟨fun h => hnot (h ▸ hx), hSU hx⟩
      · obtain ⟨x, hxS, hxW⟩ := Finset.not_disjoint_iff.mp hmark
        exact Finset.not_disjoint_iff.mpr
          ⟨x, hxS, Finset.mem_erase.mpr ⟨fun h => hnot (h ▸ hxS), hxW⟩⟩
    · rintro ⟨⟨hSU, hcard⟩, hind, hmark⟩
      have hnot : a ∉ S := by
        intro haS
        exact (Finset.mem_erase.mp (hSU haS)).1 rfl
      refine ⟨⟨⟨?_, hcard⟩, hind, ?_⟩, hnot⟩
      · intro x hx
        exact (Finset.mem_erase.mp (hSU hx)).2
      · obtain ⟨x, hxS, hxW⟩ := Finset.not_disjoint_iff.mp hmark
        exact Finset.not_disjoint_iff.mpr
          ⟨x, hxS, (Finset.mem_erase.mp hxW).2⟩
  have hinclude : (A.filter (fun S => a ∈ S)).card =
      ((N.powersetCard j).filter
        (fun S : Finset V => G.IsIndepSet (S : Set V))).card := by
    apply Finset.card_bij (fun S _ => S.erase a)
    · intro S hS
      obtain ⟨hS, haS⟩ := Finset.mem_filter.mp hS
      obtain ⟨⟨hSU, hcard⟩, hind, _⟩ :
          (S ⊆ U ∧ S.card = j+1) ∧ G.IsIndepSet (S : Set V) ∧
            ¬ Disjoint S W := by
        simpa only [A, E993Interior.taggedFamily, Finset.mem_filter,
          Finset.mem_powersetCard] using hS
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_powersetCard.mpr ⟨?_, ?_⟩, ?_⟩
      · intro x hx
        obtain ⟨hxa, hxS⟩ := Finset.mem_erase.mp hx
        exact Finset.mem_filter.mpr
          ⟨hSU hxS, hxa, hind haS hxS (Ne.symm hxa)⟩
      · simpa [hcard] using Finset.card_erase_of_mem haS
      · exact hind.mono (by simpa using Finset.erase_subset a S)
    · intro S hS T hT hST
      have haS := (Finset.mem_filter.mp hS).2
      have haT := (Finset.mem_filter.mp hT).2
      calc S = insert a (S.erase a) := (Finset.insert_erase haS).symm
           _ = insert a (T.erase a) := by rw [hST]
           _ = T := Finset.insert_erase haT
    · intro S hS
      obtain ⟨hSN, hind⟩ := Finset.mem_filter.mp hS
      obtain ⟨hSN, hcard⟩ := Finset.mem_powersetCard.mp hSN
      have hnot : a ∉ S := by
        intro h
        exact (Finset.mem_filter.mp (hSN h)).2.1 rfl
      have hSU : S ⊆ U := fun x hx => (Finset.mem_filter.mp (hSN hx)).1
      have hnew : G.IsIndepSet (↑(insert a S) : Set V) := by
        intro x hx y hy hxy hAdj
        simp only [Finset.mem_coe, Finset.mem_insert] at hx hy
        rcases hx with rfl | hx
        · rcases hy with rfl | hy
          · exact hxy rfl
          · exact (Finset.mem_filter.mp (hSN hy)).2.2 hAdj
        · rcases hy with rfl | hy
          · exact (Finset.mem_filter.mp (hSN hx)).2.2 hAdj.symm
          · exact hind hx hy hxy hAdj
      refine ⟨insert a S, ?_, Finset.erase_insert hnot⟩
      apply Finset.mem_filter.mpr
      refine ⟨?_, Finset.mem_insert_self a S⟩
      simp only [A, E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard]
      refine ⟨⟨Finset.insert_subset haU hSU, ?_⟩, hnew, ?_⟩
      · rw [Finset.card_insert_of_notMem hnot, hcard]
      · exact Finset.not_disjoint_iff.mpr
          ⟨a, Finset.mem_insert_self a S, haW⟩
  have hp := Finset.card_filter_add_card_filter_not (s := A) (fun S => a ∈ S)
  rw [hinclude, hexclude] at hp
  exact hp.symm.trans (Nat.add_comm _ _)

end E993FirstShell
-- VERITYOS ENTRY 212 END

-- VERITYOS ENTRY 213 BEGIN lemma E993FirstShell.ordinary_bound_below_odd 6187268d9a84895c6c0cf339b96fd5bf485c295f7e1657ba1b3862db77352407
namespace E993FirstShell

open Classical

/-- The ordinary independent-set shadow bound up to the odd middle rank. -/
lemma ordinary_bound_below_odd {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (k : ℕ) (hk : 1 ≤ k) (hU : U.card ≤ 2 * k + 1) :
    ((U.powersetCard (k + 1)).filter
      (fun A : Finset V => G.IsIndepSet (A : Set V))).card ≤
    ((U.powersetCard k).filter
      (fun A : Finset V => G.IsIndepSet (A : Set V))).card := by
  classical
  have hmulti : E993OrderBand.multiFamily G U U k =
      E993Interior.taggedFamily G U U (k+1) := by
    unfold E993OrderBand.multiFamily
    apply Finset.filter_eq_self.mpr
    intro B hB
    obtain ⟨⟨hBU, hcard⟩, _, _⟩ :
        (B ⊆ U ∧ B.card = k+1) ∧ G.IsIndepSet (B : Set V) ∧
          ¬ Disjoint B U := by
      simpa only [E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] using hB
    have hinter : B ∩ U = B := Finset.inter_eq_left.mpr hBU
    rw [hinter, hcard]
    omega
  have hi := E993OrderBand.marked_incidence_bound G U U k
  rw [hmulti] at hi
  have hkpos : 0 < k+1 := by omega
  have hbound :
      (E993Interior.taggedFamily G U U (k+1)).card ≤
        (E993Interior.taggedFamily G U U k).card := by
    have hm := Nat.mul_le_mul_right
      (E993Interior.taggedFamily G U U k).card hU
    nlinarith
  rw [tagged_self G U (k+1) hkpos, tagged_self G U k (by omega)] at hbound
  exact hbound

end E993FirstShell
-- VERITYOS ENTRY 213 END

-- VERITYOS ENTRY 214 BEGIN lemma E993FirstShell.tagged_bound_below_odd_of_adj 86adc6b85b54517993d0be0ac9437b65abc4ddab152953a4a38a2c0345c67608
namespace E993FirstShell

open Classical

/-- An odd-order marked shadow bound when a mark has a neighbor. -/
lemma tagged_bound_below_odd_of_adj {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U W : Finset V)
    (k : ℕ) (hk : 2 ≤ k) (hU : U.card ≤ 2*k+1)
    (a b : V) (haU : a ∈ U) (haW : a ∈ W)
    (hbU : b ∈ U) (hab : G.Adj a b) :
    (E993Interior.taggedFamily G U W (k+1)).card ≤
      (E993Interior.taggedFamily G U W k).card := by
  classical
  let N := U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)
  have hbne : b ≠ a := hab.ne.symm
  have hbUa : b ∈ U.erase a := Finset.mem_erase.mpr ⟨hbne, hbU⟩
  have hNU : N ⊆ (U.erase a).erase b := by
    intro x hx
    obtain ⟨hxU, hxa, hnotAdj⟩ := Finset.mem_filter.mp hx
    apply Finset.mem_erase.mpr
    refine ⟨?_, Finset.mem_erase.mpr ⟨hxa, hxU⟩⟩
    intro hxb
    exact (hxb ▸ hnotAdj) hab
  have hNcard : N.card ≤ 2*(k-1)+1 := by
    have hsub := Finset.card_le_card hNU
    rw [Finset.card_erase_of_mem hbUa, Finset.card_erase_of_mem haU] at hsub
    omega
  have hUcard : (U.erase a).card ≤ 2*k := by
    rw [Finset.card_erase_of_mem haU]
    omega
  have habsent := E993OrderBand.marked_bound_below_even
    G (U.erase a) (W.erase a) k (by omega) hUcard
  have hpresent := ordinary_bound_below_odd G N (k-1) (by omega) hNcard
  have htop := tagged_split_mark G U W a haU haW k
  have hbottom := tagged_split_mark G U W a haU haW (k-1)
  have hk' : k-1+1=k := by omega
  rw [hk'] at hbottom hpresent
  dsimp only [N] at hpresent
  rw [htop, hbottom]
  omega

end E993FirstShell
-- VERITYOS ENTRY 214 END

-- VERITYOS ENTRY 215 BEGIN lemma E993FirstShell.induced_count_bridge 538c5154242fc7e65005b81beaeb5f5089782a285be6fbcac29c049111ad17ac
namespace E993FirstShell

open Classical

/-- Count independent subsets of a vertex set as independent sets of its induced graph. -/
lemma induced_count_bridge {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (j : ℕ) :
    ((G.induce (U : Set V)).indepSetFinset j).card =
      ((U.powersetCard j).filter
        (fun A : Finset V => G.IsIndepSet (A : Set V))).card := by
  classical
  let H := G.induce (U : Set V)
  let e : U → V := Subtype.val
  apply Finset.card_bij (fun S _ => S.image e)
  · intro S hS
    obtain ⟨hI, hcard⟩ := SimpleGraph.mem_indepSetFinset_iff.mp hS
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_powersetCard.mpr ⟨?_, ?_⟩, ?_⟩
    · intro x hx
      obtain ⟨y, _, rfl⟩ := Finset.mem_image.mp hx
      exact y.property
    · rw [Finset.card_image_of_injective]
      · exact hcard
      · exact Subtype.val_injective
    · intro x hx y hy hxy hadj
      obtain ⟨x', hx', rfl⟩ := Finset.mem_image.mp hx
      obtain ⟨y', hy', rfl⟩ := Finset.mem_image.mp hy
      have hne : x' ≠ y' := by
        intro he
        exact hxy (congrArg e he)
      exact hI hx' hy' hne hadj
  · intro S hS T hT hST
    exact (Finset.image_injective Subtype.val_injective) hST
  · intro A hA
    obtain ⟨hAU, hcard⟩ := Finset.mem_powersetCard.mp (Finset.mem_filter.mp hA).1
    have hI := (Finset.mem_filter.mp hA).2
    let S : Finset U := Finset.univ.filter (fun x : U => (x : V) ∈ A)
    have himage : S.image e = A := by
      ext x
      constructor
      · intro hx
        obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hx
        exact (Finset.mem_filter.mp hy).2
      · intro hx
        exact Finset.mem_image.mpr
          ⟨⟨x, hAU hx⟩, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hx⟩, rfl⟩
    have hSind : H.IsIndepSet (S : Set U) := by
      intro x hx y hy hxy hadj
      have hxA : (x : V) ∈ A := (Finset.mem_filter.mp hx).2
      have hyA : (y : V) ∈ A := (Finset.mem_filter.mp hy).2
      exact hI hxA hyA (fun he => hxy (Subtype.ext he)) hadj
    have hScard : S.card = j := by
      have hi : (S.image e).card = S.card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      rw [himage, hcard] at hi
      exact hi.symm
    refine ⟨S, SimpleGraph.mem_indepSetFinset_iff.mpr ⟨hSind, hScard⟩, himage⟩

end E993FirstShell
-- VERITYOS ENTRY 215 END

-- VERITYOS ENTRY 216 BEGIN lemma E993FirstShell.ordinary_bound_firstWide 63fed620f1d2b30fcf6e5e87ae26cb863a242b2559a779ef27e9899eb19151e4
namespace E993FirstShell

open Classical

/-- Transport the exact first-wide two-edge theorem to a retained vertex set. -/
lemma ordinary_bound_firstWide {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (k : ℕ) (hk : 1 ≤ k) (hU : U.card = 2*k+2)
    (he : 2 ≤ Nat.card (G.induce (U : Set V)).edgeSet) :
    ((U.powersetCard (k+1)).filter
      (fun A : Finset V => G.IsIndepSet (A : Set V))).card ≤
    ((U.powersetCard k).filter
      (fun A : Finset V => G.IsIndepSet (A : Set V))).card := by
  classical
  let H := G.induce (U : Set V)
  have hn : Nat.card U = 2*k+2 := by
    simpa [Nat.card_eq_fintype_card] using hU
  have hd := Erdos993G1.firstWide_nonpos_of_two_edges H k hk hn he
  rw [Erdos993G1.delta_nat, Erdos993G1.indepCount_eq_card_indepSetFinset,
    Erdos993G1.indepCount_eq_card_indepSetFinset] at hd
  have hnat : (H.indepSetFinset (k+1)).card ≤ (H.indepSetFinset k).card := by
    exact_mod_cast (sub_nonpos.mp hd)
  rw [induced_count_bridge G U (k+1), induced_count_bridge G U k] at hnat
  exact hnat

end E993FirstShell
-- VERITYOS ENTRY 216 END

-- VERITYOS ENTRY 217 BEGIN lemma E993FirstShell.two_edges_of_no_one_cover 4bdfc008e9e084d85686a1b18e67f8db32fca437d3ca571e35ea3961bd46d8af
namespace E993FirstShell

open Classical

/-- A graph with no one-vertex cover inside `U` has at least two induced edges. -/
lemma two_edges_of_no_one_cover {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (hno : ∀ C : Finset V, C.card ≤ 1 →
      ¬ (∀ x y, G.Adj x y → x ∈ U → y ∈ U → x ∈ C ∨ y ∈ C)) :
    2 ≤ Nat.card (G.induce (U : Set V)).edgeSet := by
  classical
  let H := G.induce (U : Set V)
  change 2 ≤ Nat.card H.edgeSet
  by_contra h
  have hle : Nat.card H.edgeSet ≤ 1 := by omega
  by_cases hzero : Nat.card H.edgeSet = 0
  · letI : IsEmpty H.edgeSet := Finite.card_eq_zero_iff.mp hzero
    apply hno ∅ (by simp)
    intro x y hxy hx hy
    exfalso
    exact isEmptyElim (⟨s((⟨x,hx⟩ : U), (⟨y,hy⟩ : U)), hxy⟩ : H.edgeSet)
  · have hone : Nat.card H.edgeSet = 1 := by omega
    obtain ⟨a,b,_,he⟩ := Erdos993G1.FirstWide.edgeSet_one_endpoints H hone
    apply hno ({(a : V)} : Finset V) (by simp)
    intro x y hxy hx hy
    have hmem : s((⟨x,hx⟩ : U), (⟨y,hy⟩ : U)) ∈ H.edgeSet := hxy
    have hexy : s((⟨x,hx⟩ : U), (⟨y,hy⟩ : U)) = s(a,b) := by
      simpa only [he, Set.mem_singleton_iff] using hmem
    have ha : a ∈ s((⟨x,hx⟩ : U), (⟨y,hy⟩ : U)) := by
      rw [hexy]
      simp
    rcases Sym2.mem_iff.mp ha with hax | hay
    · left
      have hv : (a : V) = x := congrArg Subtype.val hax
      simp [hv]
    · right
      have hv : (a : V) = y := congrArg Subtype.val hay
      simp [hv]

end E993FirstShell
-- VERITYOS ENTRY 217 END

-- VERITYOS ENTRY 218 BEGIN lemma E993FirstShell.no_one_cover_after_erase 40a180cfc84f2ffe7e854fee771bb375fa9ed1f740b954f2120c7a7ec5b7a0e0
namespace E993FirstShell

/-- Removing one vertex from a graph without a two-vertex cover leaves no one-vertex cover. -/
lemma no_one_cover_after_erase {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (hno : ∀ C : Finset V, C.card ≤ 2 →
      ¬ (∀ x y, G.Adj x y → x ∈ U → y ∈ U → x ∈ C ∨ y ∈ C))
    (a : V) :
    ∀ C : Finset V, C.card ≤ 1 →
      ¬ (∀ x y, G.Adj x y → x ∈ U.erase a → y ∈ U.erase a →
        x ∈ C ∨ y ∈ C) := by
  intro C hC hcov
  have hcard : (insert a C).card ≤ 2 := by
    have hi := Finset.card_insert_le a C
    omega
  apply hno (insert a C) hcard
  intro x y hxy hx hy
  by_cases hxa : x = a
  · left
    simp [hxa]
  by_cases hya : y = a
  · right
    simp [hya]
  rcases hcov x y hxy (Finset.mem_erase.mpr ⟨hxa,hx⟩)
      (Finset.mem_erase.mpr ⟨hya,hy⟩) with hxC | hyC
  · exact Or.inl (Finset.mem_insert_of_mem hxC)
  · exact Or.inr (Finset.mem_insert_of_mem hyC)

end E993FirstShell
-- VERITYOS ENTRY 218 END

-- VERITYOS ENTRY 219 BEGIN lemma E993FirstShell.no_one_cover_erase_isolated 2df78e66f50564868a2de152a152add1a7ab75978ae61c0104d7e988756ed09b
namespace E993FirstShell

/-- Removing an isolated vertex preserves the absence of a one-vertex cover. -/
lemma no_one_cover_erase_isolated {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (a : V)
    (hiso : ∀ b ∈ U, ¬ G.Adj a b)
    (hno : ∀ C : Finset V, C.card ≤ 1 →
      ¬ (∀ x y, G.Adj x y → x ∈ U → y ∈ U → x ∈ C ∨ y ∈ C)) :
    ∀ C : Finset V, C.card ≤ 1 →
      ¬ (∀ x y, G.Adj x y → x ∈ U.erase a → y ∈ U.erase a →
        x ∈ C ∨ y ∈ C) := by
  intro C hC hcov
  apply hno C hC
  intro x y hxy hx hy
  have hxa : x ≠ a := by
    intro he
    exact hiso y hy (he ▸ hxy)
  have hya : y ≠ a := by
    intro he
    exact hiso x hx (by simpa [he] using hxy.symm)
  exact hcov x y hxy (Finset.mem_erase.mpr ⟨hxa,hx⟩)
    (Finset.mem_erase.mpr ⟨hya,hy⟩)

end E993FirstShell
-- VERITYOS ENTRY 219 END

-- VERITYOS ENTRY 220 BEGIN lemma E993FirstShell.tagged_bound_below_odd_no_cover 6b63ebd6b71dac100079db538a927706ffd28079f8a9f2b09c0d93eb16985ffe
namespace E993FirstShell

open Classical

/-- Odd-order marked shadow from the absence of a one-vertex cover. -/
lemma tagged_bound_below_odd_no_cover {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U W : Finset V)
    (k : ℕ) (hk : 2 ≤ k) (hU : U.card ≤ 2*k+1)
    (hWU : W ⊆ U)
    (hno : ∀ C : Finset V, C.card ≤ 1 →
      ¬ (∀ x y, G.Adj x y → x ∈ U → y ∈ U → x ∈ C ∨ y ∈ C)) :
    (E993Interior.taggedFamily G U W (k+1)).card ≤
      (E993Interior.taggedFamily G U W k).card := by
  classical
  by_cases hW : W.Nonempty
  · obtain ⟨a,haW⟩ := hW
    have haU : a ∈ U := hWU haW
    by_cases hnon : ∃ b ∈ U, G.Adj a b
    · obtain ⟨b,hbU,hab⟩ := hnon
      exact tagged_bound_below_odd_of_adj G U W k hk hU a b haU haW hbU hab
    · have hiso : ∀ b ∈ U, ¬G.Adj a b := by
        intro b hb hab
        exact hnon ⟨b,hb,hab⟩
      let N := U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)
      have hN : N = U.erase a := by
        ext x
        simp only [N, Finset.mem_filter, Finset.mem_erase]
        constructor
        · rintro ⟨hxU,hxa,_⟩
          exact ⟨hxa,hxU⟩
        · rintro ⟨hxa,hxU⟩
          exact ⟨hxU,hxa,hiso x hxU⟩
      have hUerase : (U.erase a).card ≤ 2*k := by
        rw [Finset.card_erase_of_mem haU]
        omega
      have habsent := E993OrderBand.marked_bound_below_even
        G (U.erase a) (W.erase a) k (by omega) hUerase
      have hpresent :
          ((N.powersetCard k).filter
            (fun S : Finset V => G.IsIndepSet (S : Set V))).card ≤
          ((N.powersetCard (k-1)).filter
            (fun S : Finset V => G.IsIndepSet (S : Set V))).card := by
        rw [hN]
        by_cases heq : (U.erase a).card = 2*k
        · have hno' := no_one_cover_erase_isolated G U a hiso hno
          have hedge := two_edges_of_no_one_cover G (U.erase a) hno'
          have hsize : (U.erase a).card = 2*(k-1)+2 := by omega
          have hw := ordinary_bound_firstWide G (U.erase a) (k-1)
            (by omega) hsize hedge
          have hk' : k-1+1=k := by omega
          simpa only [hk'] using hw
        · have hsize : (U.erase a).card ≤ 2*(k-1)+1 := by omega
          have hw := ordinary_bound_below_odd G (U.erase a) (k-1)
            (by omega) hsize
          have hk' : k-1+1=k := by omega
          simpa only [hk'] using hw
      have htop := tagged_split_mark G U W a haU haW k
      have hbottom := tagged_split_mark G U W a haU haW (k-1)
      have hk' : k-1+1=k := by omega
      rw [hk'] at hbottom
      rw [htop, hbottom]
      dsimp only [N] at hpresent
      omega
  · have hempty : W = ∅ := Finset.not_nonempty_iff_eq_empty.mp hW
    simp [E993Interior.taggedFamily, hempty]

end E993FirstShell
-- VERITYOS ENTRY 220 END

-- VERITYOS ENTRY 221 BEGIN lemma E993FirstShell.no_one_cover_residual_at_equality 1c7bbdcd8b3c04a2ee8107f9c85da02c0d5f7b82b766aa1004acd68924321c9e
namespace E993FirstShell

open Classical

/-- At the two-vertex deletion boundary, a cover of the residual extends to a
two-vertex cover of the original graph. -/
lemma no_one_cover_residual_at_equality {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (k : ℕ) (hU : U.card = 2*k+2)
    (hno : ∀ C : Finset V, C.card ≤ 2 →
      ¬ (∀ x y, G.Adj x y → x ∈ U → y ∈ U → x ∈ C ∨ y ∈ C))
    (a b : V) (haU : a ∈ U) (hbU : b ∈ U) (hab : G.Adj a b)
    (hNcard : (U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)).card = 2*k) :
    ∀ C : Finset V, C.card ≤ 1 →
      ¬ (∀ x y, G.Adj x y →
          x ∈ U.filter (fun z => z ≠ a ∧ ¬G.Adj a z) →
          y ∈ U.filter (fun z => z ≠ a ∧ ¬G.Adj a z) →
          x ∈ C ∨ y ∈ C) := by
  classical
  let N := U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)
  change N.card = 2*k at hNcard
  have hbUa : b ∈ U.erase a :=
    Finset.mem_erase.mpr ⟨hab.ne.symm, hbU⟩
  have hsub : N ⊆ (U.erase a).erase b := by
    intro x hx
    obtain ⟨hxU,hxa,hnot⟩ := Finset.mem_filter.mp hx
    refine Finset.mem_erase.mpr ⟨?_, Finset.mem_erase.mpr ⟨hxa,hxU⟩⟩
    intro hxb
    exact (hxb ▸ hnot) hab
  have hEq : N = (U.erase a).erase b := by
    apply Finset.eq_of_subset_of_card_le hsub
    rw [Finset.card_erase_of_mem hbUa, Finset.card_erase_of_mem haU]
    omega
  have hneigh : ∀ x ∈ U, G.Adj a x → x = b := by
    intro x hx hax
    by_contra hxb
    have hxN : x ∉ N := by
      intro hxN
      exact (Finset.mem_filter.mp hxN).2.2 hax
    have hxE : x ∈ (U.erase a).erase b := by
      exact Finset.mem_erase.mpr
        ⟨hxb, Finset.mem_erase.mpr ⟨hax.ne.symm,hx⟩⟩
    exact hxN (hEq.symm ▸ hxE)
  intro C hC hcov
  have hcard : (insert b C).card ≤ 2 := by
    have hi := Finset.card_insert_le b C
    omega
  apply hno (insert b C) hcard
  intro x y hxy hx hy
  by_cases hxb : x = b
  · left; simp [hxb]
  by_cases hyb : y = b
  · right; simp [hyb]
  have hxa : x ≠ a := by
    intro he
    exact hyb (hneigh y hy (he ▸ hxy))
  have hya : y ≠ a := by
    intro he
    exact hxb (hneigh x hx (by simpa [he] using hxy.symm))
  have hxN : x ∈ N := by
    rw [hEq]
    exact Finset.mem_erase.mpr ⟨hxb, Finset.mem_erase.mpr ⟨hxa,hx⟩⟩
  have hyN : y ∈ N := by
    rw [hEq]
    exact Finset.mem_erase.mpr ⟨hyb, Finset.mem_erase.mpr ⟨hya,hy⟩⟩
  rcases hcov x y hxy hxN hyN with hxC | hyC
  · exact Or.inl (Finset.mem_insert_of_mem hxC)
  · exact Or.inr (Finset.mem_insert_of_mem hyC)

end E993FirstShell
-- VERITYOS ENTRY 221 END

-- VERITYOS ENTRY 222 BEGIN lemma E993FirstShell.tagged_bound_firstWide_no_two_cover 431a692d871047b43d671ca7cf320be017bf6d3f113bbad8d8ee85ca105b29ca
namespace E993FirstShell

open Classical

/-- Exact first-wide marked shadow under a two-vertex-cover obstruction. -/
lemma tagged_bound_firstWide_no_two_cover {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U W : Finset V)
    (k : ℕ) (hk : 2 ≤ k) (hU : U.card = 2*k+2)
    (hWU : W ⊆ U)
    (hno : ∀ C : Finset V, C.card ≤ 2 →
      ¬ (∀ x y, G.Adj x y → x ∈ U → y ∈ U → x ∈ C ∨ y ∈ C))
    (a b : V) (haU : a ∈ U) (haW : a ∈ W)
    (hbU : b ∈ U) (hab : G.Adj a b) :
    (E993Interior.taggedFamily G U W (k+1)).card ≤
      (E993Interior.taggedFamily G U W k).card := by
  classical
  let N := U.filter (fun x => x ≠ a ∧ ¬G.Adj a x)
  have hUa : (U.erase a).card ≤ 2*k+1 := by
    rw [Finset.card_erase_of_mem haU]
    omega
  have hWUa : W.erase a ⊆ U.erase a := by
    intro x hx
    obtain ⟨hxa,hxW⟩ := Finset.mem_erase.mp hx
    exact Finset.mem_erase.mpr ⟨hxa,hWU hxW⟩
  have hno1 := no_one_cover_after_erase G U hno a
  have habsent := tagged_bound_below_odd_no_cover G (U.erase a) (W.erase a)
    k hk hUa hWUa hno1
  have hbUa : b ∈ U.erase a :=
    Finset.mem_erase.mpr ⟨hab.ne.symm,hbU⟩
  have hNsub : N ⊆ (U.erase a).erase b := by
    intro x hx
    obtain ⟨hxU,hxa,hnot⟩ := Finset.mem_filter.mp hx
    refine Finset.mem_erase.mpr ⟨?_, Finset.mem_erase.mpr ⟨hxa,hxU⟩⟩
    intro hxb
    exact (hxb ▸ hnot) hab
  have hNcard : N.card ≤ 2*k := by
    have hc := Finset.card_le_card hNsub
    rw [Finset.card_erase_of_mem hbUa, Finset.card_erase_of_mem haU] at hc
    omega
  have hpresent :
      ((N.powersetCard k).filter
        (fun S : Finset V => G.IsIndepSet (S : Set V))).card ≤
      ((N.powersetCard (k-1)).filter
        (fun S : Finset V => G.IsIndepSet (S : Set V))).card := by
    by_cases heq : N.card = 2*k
    · have hnoN := no_one_cover_residual_at_equality G U k hU hno
        a b haU hbU hab heq
      have hedge := two_edges_of_no_one_cover G N hnoN
      have hsize : N.card = 2*(k-1)+2 := by omega
      have hw := ordinary_bound_firstWide G N (k-1) (by omega) hsize hedge
      have hk' : k-1+1=k := by omega
      simpa only [hk'] using hw
    · have hsize : N.card ≤ 2*(k-1)+1 := by omega
      have hw := ordinary_bound_below_odd G N (k-1) (by omega) hsize
      have hk' : k-1+1=k := by omega
      simpa only [hk'] using hw
  have htop := tagged_split_mark G U W a haU haW k
  have hbottom := tagged_split_mark G U W a haU haW (k-1)
  have hk' : k-1+1=k := by omega
  rw [hk'] at hbottom
  rw [htop, hbottom]
  dsimp only [N] at hpresent
  omega

end E993FirstShell
-- VERITYOS ENTRY 222 END

-- VERITYOS ENTRY 223 BEGIN lemma E993FirstShell.leaf_nonisolated_mark a16befecb213c0922c77e6ae46eb38477e3afd5b72e801ee4a4b8fc186600546
namespace E993FirstShell

open Classical

/-- Connectivity forces an original neighbor of the support to meet a retained
edge once the retained graph contains an edge. -/
lemma leaf_nonisolated_mark {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (v : V) (p : ℕ)
    (hT : T.IsTree) (hv : C4LA1.IsGraphLeaf T v)
    (hp : 3 ≤ p) (horder : Fintype.card V = 2*p+2)
    (hcross : C5LA1.crossingIndex T + 2 ≤ p) :
    ∃ a ∈ C5LA1.R T v \ C5LA1.H T v,
      ∃ b ∈ Finset.univ \ C5LA1.H T v, T.Adj a b := by
  classical
  let s := C5LA1.support T v
  let H := C5LA1.H T v
  let R := C5LA1.R T v
  let U := Finset.univ \ H
  have hsR : s ∈ R := Finset.mem_insert_self _ _
  by_contra hnone
  have hclosed : ∀ x ∈ R, ∀ y, T.Adj x y → y ∈ R := by
    intro x hx y hxy
    change x ∈ insert s (T.neighborFinset s) at hx
    change y ∈ insert s (T.neighborFinset s)
    rcases Finset.mem_insert.mp hx with hxs | hxN
    · subst x
      exact Finset.mem_insert_of_mem ((T.mem_neighborFinset s y).mpr hxy)
    · have hsx : T.Adj s x := (T.mem_neighborFinset s x).mp hxN
      by_cases hxv : x = v
      · have hy : y = s := E993OrderBand.support_unique T v hv (hxv ▸ hxy)
        exact Finset.mem_insert.mpr (Or.inl hy)
      · have hxH : x ∉ H := by
          simp only [H, C5LA1.H, Finset.mem_insert, Finset.mem_singleton]
          intro h
          rcases h with h | h
          · exact hxv h
          · exact hsx.ne.symm h
        have hxW : x ∈ R \ H := Finset.mem_sdiff.mpr ⟨by
          change x ∈ insert s (T.neighborFinset s)
          exact Finset.mem_insert_of_mem hxN, hxH⟩
        by_cases hyH : y ∈ H
        · exact E993OrderBand.H_subset_R T v hv hyH
        · have hyU : y ∈ U := Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hyH⟩
          exfalso
          exact hnone ⟨x,hxW,y,hyU,hxy⟩
  have hreach : ∀ y : V, y ∈ R := by
    intro y
    have hwalk := (hT.1 s y).some
    have hwalk_closed : ∀ {x z : V} (q : T.Walk x z), x ∈ R → z ∈ R := by
      intro x z q
      induction q with
      | nil => exact id
      | cons hadj q ih => exact fun hx => ih (hclosed _ hx _ hadj)
    exact hwalk_closed hwalk hsR
  obtain ⟨a,b,hab,haH,hbH⟩ := retained_has_edge T v p hv hp horder hcross
  have haR : a ∈ R := hreach a
  have haW : a ∈ R \ H := Finset.mem_sdiff.mpr ⟨haR,haH⟩
  have hbU : b ∈ U := Finset.mem_sdiff.mpr ⟨Finset.mem_univ _,hbH⟩
  exact hnone ⟨a,haW,b,hbU,hab⟩

end E993FirstShell
-- VERITYOS ENTRY 223 END

-- VERITYOS ENTRY 224 BEGIN lemma E993FirstShell.leaf_marked_shadow_of_shell b39b6c192d061b82455e8b637eebd230dcb14b7163118126f7c04b7142eccdb1
namespace E993FirstShell

open Classical

/-- The marked shadow inequality for every original leaf under the shell guards. -/
lemma leaf_marked_shadow_of_shell {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (v : V) (p : ℕ)
    (hT : T.IsTree) (hv : C4LA1.IsGraphLeaf T v)
    (hp : 3 ≤ p) (horder : Fintype.card V = 2*p+2)
    (hcross : C5LA1.crossingIndex T + 2 ≤ p) :
    (E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
      (C5LA1.R T v \ C5LA1.H T v) p).card ≤
    (E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
      (C5LA1.R T v \ C5LA1.H T v) (p-1)).card := by
  classical
  let U := Finset.univ \ C5LA1.H T v
  let W := C5LA1.R T v \ C5LA1.H T v
  have hWU : W ⊆ U := by
    intro x hx
    exact Finset.mem_sdiff.mpr
      ⟨Finset.mem_univ _, (Finset.mem_sdiff.mp hx).2⟩
  have hno : ∀ C : Finset V, C.card ≤ 2 →
      ¬ (∀ x y, T.Adj x y → x ∈ U → y ∈ U → x ∈ C ∨ y ∈ C) := by
    intro C hC hc
    apply no_two_cover_retained T v p hv hp horder hcross C hC
    intro x y hxy hx hy
    exact hc x y hxy
      (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _,hx⟩)
      (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _,hy⟩)
  have hU : U.card = 2*(p-1)+2 :=
    leaf_retained_card_firstWide T v p hv (by omega) horder
  obtain ⟨a,haW,b,hbU,hab⟩ := leaf_nonisolated_mark T v p hT hv hp horder hcross
  have haU : a ∈ U := hWU haW
  have hshadow := tagged_bound_firstWide_no_two_cover T U W (p-1)
    (by omega) hU hWU hno a b haU haW hbU hab
  have hp' : p-1+1=p := by omega
  simpa only [U, W, hp'] using hshadow

end E993FirstShell
-- VERITYOS ENTRY 224 END

-- VERITYOS ENTRY 225 BEGIN theorem E993FirstShell.firstShellPointwiseAndAggregate 211838f924340a3209ed49583ea5c8e06dd7797cafa67998e93af0da3398f498
namespace E993FirstShell

/-- Original-leaf pointwise sign and the favorable-leaf aggregate sign. -/
theorem firstShellPointwiseAndAggregate :
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj]
      (v : V) (p : ℕ),
      T.IsTree → C4LA1.IsGraphLeaf T v → 3 ≤ p →
      Fintype.card V = 2 * p + 2 →
      C5LA1.crossingIndex T + 2 ≤ p →
      C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
        C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0) ∧
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj] (p : ℕ),
      T.IsTree → Fintype.card V = 2 * p + 2 →
      C5LA1.crossingIndex T + 2 ≤ p →
      3 * p < 2 * T.indepNum + 1 → C5LA1.aggregate T p ≤ 0) := by
  constructor
  · intro V _ _ T _ v p hT hv hp horder hcross
    exact leaf_term_nonpos_of_marked_shadow T v p hv (by omega)
      (leaf_marked_shadow_of_shell T v p hT hv hp horder hcross)
  · intro V _ _ T _ p hT horder hcross _halpha
    have hp : 3 ≤ p := three_le_of_early_crossing T p horder hcross
    apply aggregate_nonpos_of_marked_shadows T p (by omega)
    intro v hv
    exact leaf_marked_shadow_of_shell T v p hT hv hp horder hcross

end E993FirstShell
-- VERITYOS ENTRY 225 END

