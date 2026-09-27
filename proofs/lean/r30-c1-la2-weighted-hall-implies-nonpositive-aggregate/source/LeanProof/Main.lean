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

-- VERITYOS ENTRY 7 BEGIN definition C5LA1.H 55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `H_v = G - {v, s_v}`, realised as the deletion set for a leaf `v`. -/
noncomputable
def H (G : SimpleGraph V) (v : V) : Finset V :=
  {v, support G v}

end C5LA1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition C5LA1.R a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `R_v = G - N[s_v]`, realised as the deletion set for a leaf `v`. -/
noncomputable
def R (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  insert (support G v) (G.neighborFinset (support G v))

end C5LA1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition C5LA1.indepSetsAvoiding ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I_k(G - D)`: independent `k`-subsets of the original vertex type
avoiding the finite deletion set `D`. -/
def indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Finset (Finset V) :=
  ((Finset.univ \ D).powersetCard k).filter fun s : Finset V => G.IsIndepSet (s : Set V)

end C5LA1
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition C5LA1.indepSetCount e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `i_k(G - D)`. -/
def indepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Nat :=
  (indepSetsAvoiding G D k).card

end C5LA1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition C5LA1.forwardDifferenceDel 60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `Delta_k(G - D) = i_(k+1)(G-D) - i_k(G-D)`. -/
def forwardDifferenceDel (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Int :=
  (indepSetCount G D (k + 1) : Int) - indepSetCount G D k

end C5LA1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition C5LA1.aggregate d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b
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
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition E993Interior.taggedFamily cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e
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
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition E993Transport.indepFamily 44216498bbe3324a64df3ee4f65184b802b5fb8f23d79c451d87d9664b0e1d6e
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

def indepFamily (G : SimpleGraph V) [DecidableRel G.Adj] (j : ℕ) : Finset (Finset V) :=
  (Finset.univ.powersetCard j).filter fun s => G.IsIndepSet (s : Set V)

end E993Transport
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition E993Transport.tagWitnesses d4433856af0125cfbb09af79b0456ea9372eddf7e7503b01c69a35a9c9a8e76c
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable
def tagWitnesses (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  (G.neighborFinset (C5LA1.support G v)).erase v

end E993Transport
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN definition E993Transport.activeWeight 42d2db545d0f9bd575df61d31894536287b4abceb30312e7913769fc01aaf7cb
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable
def activeWeight (G : SimpleGraph V) [DecidableRel G.Adj] (F B : Finset V) : ℕ :=
  ((F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v)).card

end E993Transport
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN definition E993Transport.layerWeight 29f2d7c4665526f0255c706cc857e1293db75edafa3dc04a94af3b47bf966f26
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable
def layerWeight (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (j : ℕ) : ℕ :=
  ∑ B ∈ indepFamily G j, activeWeight G F B

end E993Transport
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN definition E993Transport.favorableLeaves ead7713bdab4303e72c13a9cfc386b92485cc3900354c8f5d1b4fdf3847476f3
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable
def favorableLeaves (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) : Finset V :=
  (C5LA1.leafSet G).filter fun v => C4LA1.IsFavorableAt G v p

end E993Transport
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN definition E993Transport.transportRel aebc72a4015fecf4c7364686ea8e2ece96e3f378c5f2a4c94012f4d30edf8c3a
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

def transportRel (G : SimpleGraph V) [DecidableRel G.Adj] (B A : Finset V) : Prop :=
  (∃ q ∈ B, A = B.erase q) ∨
  (∃ u, u ∉ B ∧ (G.neighborFinset u ∩ B).card = 2 ∧ A = insert u (B \ G.neighborFinset u))

end E993Transport
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN definition E993Transport.IsSaturatingFlow 4646aaa58137cbeae90624ac3d1fa736b7f3cd1e6fc53bb9c1d3a37041f516a6
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

def IsSaturatingFlow (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)
    (f : Finset V → Finset V → ℕ) : Prop :=
  (∀ B A, 0 < f B A → B ∈ indepFamily G (p + 1) ∧ A ∈ indepFamily G p ∧ transportRel G B A) ∧
  (∀ B ∈ indepFamily G (p + 1), ∑ A ∈ indepFamily G p, f B A = activeWeight G F B) ∧
  (∀ A ∈ indepFamily G p, ∑ B ∈ indepFamily G (p + 1), f B A ≤ activeWeight G F A)

end E993Transport
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN definition E993Transport.WeightedHall 542c0fc39601c6798f8ea39c8632963c798dcf13d5bfa28a1d24215299d5fc5f
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

def WeightedHall (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ) : Prop :=
  ∀ X ⊆ indepFamily G (p + 1),
    ∑ B ∈ X, activeWeight G F B ≤
      ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A), activeWeight G F A

end E993Transport
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma E993Interior.highTailAggregateFromShadow 972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d
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
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma E993Transport.isGraphLeaf_of_mem_favorableLeaves 41608d49994a60d25084e05143af612779b4cc493f0dde8757e78343c16db2c3
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma isGraphLeaf_of_mem_favorableLeaves (G : SimpleGraph V) [DecidableRel G.Adj]
    {p : ℕ} {v : V} (hv : v ∈ favorableLeaves G p) : C4LA1.IsGraphLeaf G v := by
  have h1 := (Finset.mem_filter.mp hv).1
  exact (Finset.mem_filter.mp h1).2

end E993Transport
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma E993Transport.tagWitnesses_subset_R 282a0bdfd09e1cb7fa05c13de65384ed031afb4a789cdab596062bb5d69151bc
namespace E993Transport

open SimpleGraph
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `W_v ⊆ R_v` (SEMANTIC-CONTRACT §1.2 notes `R_v ∖ H_v = W_v`; in particular `W_v ⊆ R_v`). -/
lemma tagWitnesses_subset_R (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) :
    tagWitnesses G v ⊆ C5LA1.R G v :=
  (Finset.erase_subset _ _).trans (Finset.subset_insert _ _)

end E993Transport
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma E993Transport.card_active_eq_tagged fa77c6e94e539dcd9254e2ba822b6328d5be125445cb2aa8936d5cd8a6796b8a
namespace E993Transport

open SimpleGraph
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The tagging bijection `B ↦ B.erase v`: it carries the layer-`j` sets that
contain `v` as an active tag onto `E993Interior.taggedFamily` at rank `j - 1`
(SEMANTIC-CONTRACT §1.2, the WID proof of record). -/
lemma card_active_eq_tagged (G : SimpleGraph V) [DecidableRel G.Adj]
    {v : V} (hv : C4LA1.IsGraphLeaf G v) (j : ℕ) (hj : 1 ≤ j) :
    ((indepFamily G j).filter
        (fun B => v ∈ B ∧ ¬ Disjoint (B.erase v) (tagWitnesses G v))).card =
      (E993Interior.taggedFamily G (Finset.univ \ C5LA1.H G v) (C5LA1.R G v) (j - 1)).card := by
  classical
  have hsv : G.Adj v (C5LA1.support G v) := E993Interior.Leaf.support_adj G v hv
  have hne : v ≠ C5LA1.support G v := G.ne_of_adj hsv
  have hWR : tagWitnesses G v ⊆ C5LA1.R G v := tagWitnesses_subset_R G v
  apply Finset.card_nbij' (fun B => B.erase v) (fun A => insert v A)
  · -- MapsTo forward: an active-`j`-set restricts to a tagged `(j-1)`-set of `H_v`.
    intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter, indepFamily, Finset.mem_powersetCard] at hB
    obtain ⟨⟨⟨_, hBcard⟩, hBind⟩, hvB, hact⟩ := hB
    have hnotsv : C5LA1.support G v ∉ B := by
      intro hmem
      exact (G.isIndepSet_iff.mp hBind (Finset.mem_coe.mpr hvB) (Finset.mem_coe.mpr hmem) hne) hsv
    have hcard : (B.erase v).card = j - 1 := by rw [Finset.card_erase_of_mem hvB, hBcard]
    have hDR : ¬ Disjoint (B.erase v) (C5LA1.R G v) := fun hD => hact (hD.mono_right hWR)
    simp only [Finset.mem_coe, E993Interior.taggedFamily, Finset.mem_filter,
      Finset.mem_powersetCard]
    refine ⟨⟨?_, hcard⟩, hBind.mono (Finset.erase_subset _ _), hDR⟩
    intro x hx
    have hxB : x ∈ B := (Finset.mem_erase.mp hx).2
    have hxv : x ≠ v := (Finset.mem_erase.mp hx).1
    have hxsv : x ≠ C5LA1.support G v := fun h => hnotsv (h ▸ hxB)
    simp only [Finset.mem_sdiff, Finset.mem_univ, true_and, C5LA1.H, Finset.mem_insert,
      Finset.mem_singleton]
    exact not_or.mpr ⟨hxv, hxsv⟩
  · -- MapsTo backward: `insert v A` is an active-`j`-set for a tagged `(j-1)`-set `A` of `H_v`.
    intro A hA
    simp only [Finset.mem_coe, E993Interior.taggedFamily, Finset.mem_filter,
      Finset.mem_powersetCard] at hA
    obtain ⟨⟨hAU, hAcard⟩, hAind, hAtag⟩ := hA
    have hvA : v ∉ A := fun hmem => (Finset.mem_sdiff.mp (hAU hmem)).2 (by simp [C5LA1.H])
    have hsvA : C5LA1.support G v ∉ A :=
      fun hmem => (Finset.mem_sdiff.mp (hAU hmem)).2 (by simp [C5LA1.H])
    have hAH : Disjoint A (C5LA1.H G v) := by
      apply Finset.disjoint_left.mpr
      intro x hx hxH
      simp only [C5LA1.H, Finset.mem_insert, Finset.mem_singleton] at hxH
      rcases hxH with rfl | rfl
      · exact hvA hx
      · exact hsvA hx
    have hIns : G.IsIndepSet ((insert v A : Finset V) : Set V) := by
      rw [Finset.coe_insert]
      exact E993Interior.Leaf.leaf_insert_indep G v hv A hAH hAind
    simp only [Finset.mem_coe, indepFamily, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨⟨Finset.subset_univ _, ?_⟩, hIns⟩, Finset.mem_insert_self _ _, ?_⟩
    · rw [Finset.card_insert_of_notMem hvA, hAcard]; omega
    · rw [Finset.erase_insert hvA]
      apply Finset.not_disjoint_iff.mpr
      obtain ⟨w, hwA, hwR⟩ := Finset.not_disjoint_iff.mp hAtag
      have hwv : w ≠ v := fun h => hvA (h ▸ hwA)
      have hwsv : w ≠ C5LA1.support G v := fun h => hsvA (h ▸ hwA)
      refine ⟨w, hwA, ?_⟩
      simp only [tagWitnesses, Finset.mem_erase]
      refine ⟨hwv, ?_⟩
      simp only [C5LA1.R, Finset.mem_insert] at hwR
      rcases hwR with rfl | hwR
      · exact absurd rfl hwsv
      · exact hwR
  · -- left inverse
    intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter, indepFamily, Finset.mem_powersetCard] at hB
    exact Finset.insert_erase hB.2.1
  · -- right inverse
    intro A hA
    simp only [Finset.mem_coe, E993Interior.taggedFamily, Finset.mem_filter,
      Finset.mem_powersetCard] at hA
    have hvA : v ∉ A := fun hmem => (Finset.mem_sdiff.mp (hA.1.1 hmem)).2 (by simp [C5LA1.H])
    exact Finset.erase_insert hvA

end E993Transport
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma E993Transport.layerWeight_eq_sum_card d25dec81b940c30ab6765963b8eb1d3d7f3a52f6684a251d563baa6cc430aaee
namespace E993Transport

open SimpleGraph
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `layerWeight` as a sum, term by term, over the tag set `F` (double-counting
the active-tag incidences of the layer `I_j(G)`). -/
lemma layerWeight_eq_sum_card (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (j : ℕ) :
    layerWeight G F j =
      ∑ v ∈ F, ((indepFamily G j).filter
        (fun B => v ∈ B ∧ ¬ Disjoint (B.erase v) (tagWitnesses G v))).card := by
  classical
  have hact : ∀ B : Finset V, activeWeight G F B =
      ∑ v ∈ F, (if v ∈ B ∧ ¬ Disjoint (B.erase v) (tagWitnesses G v) then 1 else 0) := by
    intro B
    have heq : activeWeight G F B =
        (F.filter (fun v => v ∈ B ∧ ¬ Disjoint (B.erase v) (tagWitnesses G v))).card := by
      unfold activeWeight
      congr 1
      ext v
      simp only [Finset.mem_filter, Finset.mem_inter]
      tauto
    rw [heq, Finset.card_filter]
  unfold layerWeight
  simp_rw [hact]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl (fun v _ => ?_)
  exact (Finset.card_filter _ _).symm

end E993Transport
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma E993Transport.layerWeight_sub_eq_sum 962be93db610da74b0bc0f5251b02889b8ae90dea7b58beeec438693dcdb1cc1
namespace E993Transport

open SimpleGraph
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **(WID), general form.** For any finite set `F` of degree-one vertices and any
`p ≥ 1`, the layer-weight difference equals the sum, over `F`, of the per-tag
forward-difference gap between `H_v` and `R_v` (SEMANTIC-CONTRACT §1.2). -/
lemma layerWeight_sub_eq_sum (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V)
    (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v) (p : ℕ) (hp : 1 ≤ p) :
    (layerWeight G F (p + 1) : ℤ) - layerWeight G F p =
      ∑ v ∈ F, (C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) -
                C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1)) := by
  classical
  have hstep : ∀ j : ℕ, 1 ≤ j → layerWeight G F j =
      ∑ v ∈ F, (E993Interior.taggedFamily G
        (Finset.univ \ C5LA1.H G v) (C5LA1.R G v) (j - 1)).card := by
    intro j hj
    rw [layerWeight_eq_sum_card]
    exact Finset.sum_congr rfl (fun v hv => card_active_eq_tagged G (hF v hv) j hj)
  have hp1 : 1 ≤ p + 1 := by omega
  rw [hstep (p + 1) hp1, hstep p hp]
  push_cast
  rw [← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl (fun v hv => ?_)
  have hsub : C5LA1.H G v ⊆ C5LA1.R G v := E993Interior.Leaf.H_subset_R G v (hF v hv)
  have hsplit0 := E993Interior.Leaf.tagged_count_split G (C5LA1.H G v) (C5LA1.R G v) hsub (p - 1)
  have hsplit1 := E993Interior.Leaf.tagged_count_split G (C5LA1.H G v) (C5LA1.R G v) hsub p
  have hpk : p - 1 + 1 = p := by omega
  simp only [C5LA1.forwardDifferenceDel, hpk]
  push_cast [hsplit0, hsplit1]
  ring

end E993Transport
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma E993Transport.activeWeightAggregateIdentity a46bc240f057f105a825a963dee4d806d3adb228dd0a8bcbeeb4c5e6c60092e8
namespace E993Transport

open SimpleGraph
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **(WID)** at the run's fixed selector: the aggregate `S(G, p)` equals the
layer-weight difference at the favorable-leaf tag set. -/
lemma activeWeightAggregateIdentity (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) :
    (layerWeight G (favorableLeaves G p) (p + 1) : ℤ) - layerWeight G (favorableLeaves G p) p =
      C5LA1.aggregate G p := by
  have hF : ∀ v ∈ favorableLeaves G p, C4LA1.IsGraphLeaf G v :=
    fun v hv => isGraphLeaf_of_mem_favorableLeaves G hv
  rw [layerWeight_sub_eq_sum G (favorableLeaves G p) hF p hp]
  unfold C5LA1.aggregate favorableLeaves
  rfl

end E993Transport
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma E993Transport.aggregate_nonpos_of_saturatingFlow ce01183cc56349c832b3626edb125bdffae41d91412371271d18104ee3795f30
namespace E993Transport

open SimpleGraph
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **(FLOW⇒SIGN).** On any finite simple graph, a saturating integral flow of the
network at rank `p` forces the complete aggregate `S(G, p)` to be nonpositive; the
proof only uses (WID) and the flow's supply/capacity sums, never the relation
`transportRel` itself (SEMANTIC-CONTRACT §2: "uses (HALL-COND) only at `X = I_{p+1}`"). -/
lemma aggregate_nonpos_of_saturatingFlow (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) (f : Finset V → Finset V → ℕ)
    (hf : IsSaturatingFlow G (favorableLeaves G p) p f) :
    C5LA1.aggregate G p ≤ 0 := by
  classical
  obtain ⟨-, hsat, hcap⟩ := hf
  have hsupply : ∑ B ∈ indepFamily G (p + 1), ∑ A ∈ indepFamily G p, f B A =
      layerWeight G (favorableLeaves G p) (p + 1) := by
    unfold layerWeight
    exact Finset.sum_congr rfl (fun B hB => hsat B hB)
  have hflow_le : ∑ B ∈ indepFamily G (p + 1), ∑ A ∈ indepFamily G p, f B A ≤
      layerWeight G (favorableLeaves G p) p := by
    rw [Finset.sum_comm]
    unfold layerWeight
    exact Finset.sum_le_sum (fun A hA => hcap A hA)
  have hle : layerWeight G (favorableLeaves G p) (p + 1) ≤
      layerWeight G (favorableLeaves G p) p := hsupply ▸ hflow_le
  have hid := activeWeightAggregateIdentity G p hp
  have hcast : (layerWeight G (favorableLeaves G p) (p + 1) : ℤ) ≤
      (layerWeight G (favorableLeaves G p) p : ℤ) := Nat.cast_le.mpr hle
  linarith [hid, hcast]

end E993Transport
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma E993Transport.card_sigma_fiber_filter e8c6b0d12256a6e44f3550cdd7c1eccf10d32930c3f5ccb3b4b5def291be83fe
namespace E993Transport

open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Generic fact used for the clone expansion: the clones of a weighted family,
restricted to bases lying in a finset `S`, number exactly the sum of the weights
over `S`. -/
lemma card_sigma_fiber_filter {ι : Type*} [Fintype ι] [DecidableEq ι] (w : ι → ℕ)
    (S : Finset ι) :
    (Finset.univ.filter (fun x : Σ i : ι, Fin (w i) => x.1 ∈ S)).card = ∑ i ∈ S, w i := by
  classical
  have hset : Finset.univ.filter (fun x : Σ i : ι, Fin (w i) => x.1 ∈ S) =
      S.sigma (fun i => (Finset.univ : Finset (Fin (w i)))) := by
    ext x
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_sigma]
    tauto
  rw [hset, Finset.card_sigma]
  exact Finset.sum_congr rfl (fun i _ => by simp)

end E993Transport
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma E993Transport.exists_saturatingFlow_of_weightedHall ec521065a45bda39199f86d965ea609fb472adb341061ca5d6bb44b0d31a2ac2
namespace E993Transport

open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **(HALL⇒FLOW).** Weighted Hall's condition on every source subfamily implies a
saturating integral flow exists, via Hall's Marriage Theorem
(`Fintype.all_card_le_filter_rel_iff_exists_injective`) on the clone expansion:
`activeWeight G F B` clones of each source `B` (zero clones if `B` is not a
source), `activeWeight G F A` clones of each target `A`, related exactly when
their bases are `transportRel`-linked. -/
lemma exists_saturatingFlow_of_weightedHall (G : SimpleGraph V) [DecidableRel G.Adj]
    (F : Finset V) (p : ℕ) (h : WeightedHall G F p) :
    ∃ f, IsSaturatingFlow G F p f := by
  classical
  set wSrc : Finset V → ℕ := fun B => if B ∈ indepFamily G (p + 1) then activeWeight G F B else 0
    with hwSrc
  set wTgt : Finset V → ℕ := fun A => if A ∈ indepFamily G p then activeWeight G F A else 0
    with hwTgt
  let α := Σ B : Finset V, Fin (wSrc B)
  let β := Σ A : Finset V, Fin (wTgt A)
  let r : α → β → Prop := fun x y => transportRel G x.1 y.1
  have hwSrc_pos : ∀ B, 0 < wSrc B → B ∈ indepFamily G (p + 1) := by
    intro B hB; by_contra hcon; simp [hwSrc, hcon] at hB
  have hwTgt_pos : ∀ A, 0 < wTgt A → A ∈ indepFamily G p := by
    intro A hA; by_contra hcon; simp [hwTgt, hcon] at hA
  have hHall : ∀ A : Finset α,
      A.card ≤ (Finset.univ.filter (fun b : β => ∃ a ∈ A, r a b)).card := by
    intro A
    set X : Finset (Finset V) := A.image (fun a => a.1) with hXdef
    have hXsub : X ⊆ indepFamily G (p + 1) := by
      intro B hB
      obtain ⟨a, _, rfl⟩ := Finset.mem_image.mp hB
      exact hwSrc_pos a.1 a.2.pos
    have hAsub : A ⊆ Finset.univ.filter (fun a : α => a.1 ∈ X) := by
      intro a ha
      simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      exact Finset.mem_image_of_mem _ ha
    have hstep1 : A.card ≤ ∑ B ∈ X, wSrc B :=
      (Finset.card_le_card hAsub).trans_eq (card_sigma_fiber_filter wSrc X)
    have hwSrcX : ∑ B ∈ X, wSrc B = ∑ B ∈ X, activeWeight G F B :=
      Finset.sum_congr rfl (fun B hB => by simp [hwSrc, hXsub hB])
    set N : Finset (Finset V) :=
      (indepFamily G p).filter (fun A' => ∃ B ∈ X, transportRel G B A') with hNdef
    have hstep2 : ∑ B ∈ X, activeWeight G F B ≤ ∑ A' ∈ N, activeWeight G F A' := h X hXsub
    have hset2 : Finset.univ.filter (fun b : β => ∃ a ∈ A, r a b) =
        Finset.univ.filter (fun b : β => b.1 ∈ N) := by
      ext b
      simp only [Finset.mem_filter, Finset.mem_univ, true_and, hNdef, r]
      constructor
      · rintro ⟨a, haA, hrel⟩
        exact ⟨hwTgt_pos b.1 b.2.pos, a.1, Finset.mem_image_of_mem _ haA, hrel⟩
      · rintro ⟨_, B, hBX, hrel⟩
        obtain ⟨a, haA, rfl⟩ := Finset.mem_image.mp hBX
        exact ⟨a, haA, hrel⟩
    have hcardimg : (Finset.univ.filter (fun b : β => ∃ a ∈ A, r a b)).card =
        ∑ A' ∈ N, activeWeight G F A' := by
      rw [hset2, card_sigma_fiber_filter wTgt N]
      exact Finset.sum_congr rfl (fun A' hA' => by
        simp only [hNdef, Finset.mem_filter] at hA'
        simp [hwTgt, hA'.1])
    calc A.card ≤ ∑ B ∈ X, wSrc B := hstep1
      _ = ∑ B ∈ X, activeWeight G F B := hwSrcX
      _ ≤ ∑ A' ∈ N, activeWeight G F A' := hstep2
      _ = (Finset.univ.filter (fun b : β => ∃ a ∈ A, r a b)).card := hcardimg.symm
  obtain ⟨f, hfinj, hfrel⟩ :=
    (Fintype.all_card_le_filter_rel_iff_exists_injective r).mp hHall
  refine ⟨fun B A => (Finset.univ.filter (fun x : α => x.1 = B ∧ (f x).1 = A)).card, ?_, ?_, ?_⟩
  · -- support: a positive flow value forces both endpoints and the relation.
    intro B A hpos
    obtain ⟨x, hx⟩ := Finset.card_pos.mp hpos
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hx
    obtain ⟨hx1, hx2⟩ := hx
    refine ⟨hx1 ▸ hwSrc_pos x.1 x.2.pos, hx2 ▸ hwTgt_pos (f x).1 (f x).2.pos, ?_⟩
    have hrel : transportRel G x.1 (f x).1 := hfrel x
    rwa [hx1, hx2] at hrel
  · -- saturation: the clones of each source are exactly distributed by `f`.
    intro B hB
    have hMaps : (↑(Finset.univ.filter (fun x : α => x.1 = B)) : Set α).MapsTo
        (fun x => (f x).1) (indepFamily G p) := by
      intro x _; exact hwTgt_pos (f x).1 (f x).2.pos
    have hce := Finset.card_eq_sum_card_fiberwise
      (f := fun x : α => (f x).1) (s := Finset.univ.filter (fun x : α => x.1 = B))
      (t := indepFamily G p) hMaps
    have hEq1 : ∀ A, (Finset.univ.filter (fun x : α => x.1 = B)).filter (fun x => (f x).1 = A) =
        Finset.univ.filter (fun x : α => x.1 = B ∧ (f x).1 = A) := fun A =>
      Finset.filter_filter _ _ _
    have hEq2 : (Finset.univ.filter (fun x : α => x.1 = B)).card = wSrc B := by
      have := card_sigma_fiber_filter wSrc ({B} : Finset (Finset V))
      simpa using this
    have hfinal : ∑ A ∈ indepFamily G p,
        (Finset.univ.filter (fun x : α => x.1 = B ∧ (f x).1 = A)).card = wSrc B := by
      rw [← hEq2, hce]
      exact Finset.sum_congr rfl (fun A _ => by rw [hEq1])
    have hval : wSrc B = activeWeight G F B := if_pos hB
    rw [hfinal, hval]
  · -- capacity: injectivity of `f` bounds the clones landing on each target.
    intro A hA
    have hMaps : (↑(Finset.univ.filter (fun x : α => (f x).1 = A)) : Set α).MapsTo
        (fun x => x.1) (indepFamily G (p + 1)) := by
      intro x _; exact hwSrc_pos x.1 x.2.pos
    have hce := Finset.card_eq_sum_card_fiberwise
      (f := fun x : α => x.1) (s := Finset.univ.filter (fun x : α => (f x).1 = A))
      (t := indepFamily G (p + 1)) hMaps
    have hEq1 : ∀ B, (Finset.univ.filter (fun x : α => (f x).1 = A)).filter (fun x => x.1 = B) =
        Finset.univ.filter (fun x : α => x.1 = B ∧ (f x).1 = A) := by
      intro B
      rw [Finset.filter_filter]
      congr 1
      ext x
      exact and_comm
    have hsum_eq : ∑ B ∈ indepFamily G (p + 1),
        (Finset.univ.filter (fun x : α => x.1 = B ∧ (f x).1 = A)).card =
        (Finset.univ.filter (fun x : α => (f x).1 = A)).card := by
      rw [hce]
      exact Finset.sum_congr rfl (fun B _ => by rw [hEq1])
    rw [hsum_eq]
    have hle : (Finset.univ.filter (fun x : α => (f x).1 = A)).card ≤
        (Finset.univ.filter (fun y : β => y.1 = A)).card := by
      apply Finset.card_le_card_of_injOn f
      · intro x hx
        simp only [Finset.mem_coe, Finset.mem_filter, Finset.mem_univ, true_and] at hx ⊢
        exact hx
      · intro x _ y _ hxy; exact hfinj hxy
    have hwTgtA : (Finset.univ.filter (fun y : β => y.1 = A)).card = wTgt A := by
      have := card_sigma_fiber_filter wTgt ({A} : Finset (Finset V))
      simpa using this
    rw [hwTgtA] at hle
    have hval : wTgt A = activeWeight G F A := if_pos hA
    rw [hval] at hle
    exact hle

end E993Transport
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma E993Transport.transportRel_mem_indepFamily 445fcde0218f86547d5ffb35d84d81f7089c317ef03be2ba2477606b1e309e62
namespace E993Transport
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Both arc types of (REL) land in the target layer: a deletion or a two-for-one switch of an
independent `(p+1)`-set is an independent `p`-set (closes U2 fidelity note 1). -/
lemma transportRel_mem_indepFamily (G : SimpleGraph V) [DecidableRel G.Adj] {p : ℕ}
    {B A : Finset V} (hB : B ∈ indepFamily G (p + 1)) (h : transportRel G B A) :
    A ∈ indepFamily G p := by
  simp only [indepFamily, Finset.mem_filter, Finset.mem_powersetCard] at hB ⊢
  obtain ⟨⟨-, hcard⟩, hind⟩ := hB
  rcases h with ⟨q, hq, rfl⟩ | ⟨u, huB, hu2, rfl⟩
  · refine ⟨⟨Finset.subset_univ _, ?_⟩, hind.mono (Finset.erase_subset _ _)⟩
    rw [Finset.card_erase_of_mem hq, hcard]; omega
  · have hu : u ∉ B \ G.neighborFinset u := fun h => huB (Finset.mem_sdiff.mp h).1
    refine ⟨⟨Finset.subset_univ _, ?_⟩, ?_⟩
    · have hsplit := Finset.card_sdiff_add_card_inter B (G.neighborFinset u)
      rw [Finset.inter_comm] at hsplit
      rw [Finset.card_insert_of_notMem hu]; omega
    · have hind' := G.isIndepSet_iff.mp hind
      rw [G.isIndepSet_iff, Finset.coe_insert]
      intro x hx y hy hxy hadj
      simp only [Set.mem_insert_iff, Finset.coe_sdiff, Set.mem_sdiff, Finset.mem_coe,
        SimpleGraph.mem_neighborFinset] at hx hy
      rcases hx with rfl | ⟨hxB, hxN⟩ <;> rcases hy with rfl | ⟨hyB, hyN⟩
      · exact hxy rfl
      · exact hyN hadj
      · exact hxN hadj.symm
      · exact hind' hxB hyB hxy hadj

end E993Transport
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma E993Transport.weightedHall_of_saturatingFlow 89a7ffb8bc79b1d61290459a843fb8fa2ca73c6fc9e3b6affd8448933bf2d54c
namespace E993Transport
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (FLOW⇒HALL): the converse of U2's HALL⇒FLOW companion. -/
lemma weightedHall_of_saturatingFlow (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V)
    (p : ℕ) (f : Finset V → Finset V → ℕ) (hf : IsSaturatingFlow G F p f) :
    WeightedHall G F p := by
  obtain ⟨hsupp, hsat, hcap⟩ := hf
  intro X hX
  set N := (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A) with hN
  have h1 : ∑ B ∈ X, activeWeight G F B = ∑ B ∈ X, ∑ A ∈ N, f B A := by
    refine Finset.sum_congr rfl (fun B hB => ?_)
    rw [← hsat B (hX hB)]
    symm
    apply Finset.sum_subset (Finset.filter_subset _ _)
    intro A _ hAN
    by_contra hne
    obtain ⟨-, hA', hrel⟩ := hsupp B A (Nat.pos_of_ne_zero hne)
    exact hAN (Finset.mem_filter.mpr ⟨hA', B, hB, hrel⟩)
  have h2 : ∑ B ∈ X, ∑ A ∈ N, f B A ≤ ∑ A ∈ N, ∑ B ∈ indepFamily G (p + 1), f B A := by
    rw [Finset.sum_comm]
    exact Finset.sum_le_sum (fun A _ => Finset.sum_le_sum_of_subset hX)
  have h3 : ∑ A ∈ N, ∑ B ∈ indepFamily G (p + 1), f B A ≤ ∑ A ∈ N, activeWeight G F A :=
    Finset.sum_le_sum (fun A hA => hcap A (Finset.mem_filter.mp hA).1)
  rw [h1]; exact h2.trans h3

end E993Transport
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma E993Transport.weightedHall_iff_exists_saturatingFlow 0df85bacfecd75774c7f119b2f8ade1d4080d53f4ad1343a6455e8d459980eb0
namespace E993Transport
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (HALL-COND) ⇔ saturating integral flow, on any finite simple graph, any tag set, any `p`. -/
lemma weightedHall_iff_exists_saturatingFlow (G : SimpleGraph V) [DecidableRel G.Adj]
    (F : Finset V) (p : ℕ) : WeightedHall G F p ↔ ∃ f, IsSaturatingFlow G F p f :=
  ⟨exists_saturatingFlow_of_weightedHall G F p,
   fun ⟨f, hf⟩ => weightedHall_of_saturatingFlow G F p f hf⟩

end E993Transport
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN theorem E993Transport.aggregate_nonpos_of_weightedHall 8695d65f92f19a39648adfa9f1a87fc1125f86ec37f2bd3b2aa0300a70508013
namespace E993Transport
open scoped Classical
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (HALL-COND) at the fixed selector implies the sign (composition of U2's companions). -/
theorem aggregate_nonpos_of_weightedHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) (h : WeightedHall G (favorableLeaves G p) p) :
    C5LA1.aggregate G p ≤ 0 := by
  obtain ⟨f, hf⟩ := exists_saturatingFlow_of_weightedHall G _ p h
  exact aggregate_nonpos_of_saturatingFlow G p hp f hf

end E993Transport
-- VERITYOS ENTRY 35 END

