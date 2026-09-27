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

-- VERITYOS ENTRY 14 BEGIN definition E993Transport.indepFamily 73df20a8511ea67885d45631688cf693e58cebe9cfd5413ee67e782c1030ef9e
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1504-1506. Author: r30 U2 (Claude Sonnet 5).
-- Freeze repair 3: the U2 wrapper's `open scoped Classical` is replaced, for definitions, by
-- `open Classical in` on `favorableLeaves` and `WeightedHall` only (mirroring entry 13); every
-- definition elaborates to the identical term (`set_option pp.all true` comparison, DRAFTS/defs-pp-all.log).
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- the independent `j`-subsets of `V`: the layer `I_j(G)` (SEMANTIC-CONTRACT §1.2). -/
def indepFamily (G : SimpleGraph V) [DecidableRel G.Adj] (j : ℕ) : Finset (Finset V) :=
  (Finset.univ.powersetCard j).filter fun s => G.IsIndepSet (s : Set V)

end E993Transport
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition E993Transport.tagWitnesses 113d952167528dfc045eb79961e8fbff0326da8f04277799436d6c8962022025
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1513-1516. Author: r30 U2 (Claude Sonnet 5).
-- Freeze repair 3: the U2 wrapper's `open scoped Classical` is replaced, for definitions, by
-- `open Classical in` on `favorableLeaves` and `WeightedHall` only (mirroring entry 13); every
-- definition elaborates to the identical term (`set_option pp.all true` comparison, DRAFTS/defs-pp-all.log).
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `W_v = N_G(s_v) \ {v}` (SEMANTIC-CONTRACT §1.2). -/
noncomputable
def tagWitnesses (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  (G.neighborFinset (C5LA1.support G v)).erase v

end E993Transport
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN definition E993Transport.activeWeight 074ed034729850d34722d0b1ceeb96d8362beaebf3b7a409cb3fab28a9850b93
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1518-1522. Author: r30 U2 (Claude Sonnet 5).
-- Freeze repair 3: the U2 wrapper's `open scoped Classical` is replaced, for definitions, by
-- `open Classical in` on `favorableLeaves` and `WeightedHall` only (mirroring entry 13); every
-- definition elaborates to the identical term (`set_option pp.all true` comparison, DRAFTS/defs-pp-all.log).
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- the active-tag weight of `B` w.r.t. the tag set `F`: `v ∈ F ∩ B` is counted
iff `B` contains another neighbour of `v`'s original support. -/
noncomputable
def activeWeight (G : SimpleGraph V) [DecidableRel G.Adj] (F B : Finset V) : ℕ :=
  ((F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v)).card

end E993Transport
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN definition E993Transport.layerWeight 5ca5792309be23276583ac42cef294618e2471c97d3f58e67f0ab7980a3a83c3
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1524-1527. Author: r30 U2 (Claude Sonnet 5).
-- Freeze repair 3: the U2 wrapper's `open scoped Classical` is replaced, for definitions, by
-- `open Classical in` on `favorableLeaves` and `WeightedHall` only (mirroring entry 13); every
-- definition elaborates to the identical term (`set_option pp.all true` comparison, DRAFTS/defs-pp-all.log).
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- total active weight of the layer `I_j(G)`. -/
noncomputable
def layerWeight (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (j : ℕ) : ℕ :=
  ∑ B ∈ indepFamily G j, activeWeight G F B

end E993Transport
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN definition E993Transport.favorableLeaves 16b0c7672ed66c4cb53ba24d853764df160d6694f63b231346a2eb71c390ec77
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1529-1532. Author: r30 U2 (Claude Sonnet 5).
-- Freeze repair 3: the U2 wrapper's `open scoped Classical` is replaced, for definitions, by
-- `open Classical in` on `favorableLeaves` and `WeightedHall` only (mirroring entry 13); every
-- definition elaborates to the identical term (`set_option pp.all true` comparison, DRAFTS/defs-pp-all.log).
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- the fixed original strict selector `F_p(G)`. -/
noncomputable
def favorableLeaves (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) : Finset V :=
  (C5LA1.leafSet G).filter fun v => C4LA1.IsFavorableAt G v p

end E993Transport
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN definition E993Transport.transportRel b1b9ac6c8de56fa740a37e5bac0fa628f1d817c2e33625ca34dcab33a1100d95
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1539-1542. Author: r30 U2 (Claude Sonnet 5).
-- Freeze repair 3: the U2 wrapper's `open scoped Classical` is replaced, for definitions, by
-- `open Classical in` on `favorableLeaves` and `WeightedHall` only (mirroring entry 13); every
-- definition elaborates to the identical term (`set_option pp.all true` comparison, DRAFTS/defs-pp-all.log).
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- the deletion / two-for-one relation from `(p+1)`-sets to `p`-sets. -/
def transportRel (G : SimpleGraph V) [DecidableRel G.Adj] (B A : Finset V) : Prop :=
  (∃ q ∈ B, A = B.erase q) ∨
  (∃ u, u ∉ B ∧ (G.neighborFinset u ∩ B).card = 2 ∧ A = insert u (B \ G.neighborFinset u))

end E993Transport
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN definition E993Transport.IsSaturatingFlow a9d81c260914024d38f46ff5b564749d34f640674f9e9116685b4e7c631a48ac
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1544-1549. Author: r30 U2 (Claude Sonnet 5).
-- Freeze repair 3: the U2 wrapper's `open scoped Classical` is replaced, for definitions, by
-- `open Classical in` on `favorableLeaves` and `WeightedHall` only (mirroring entry 13); every
-- definition elaborates to the identical term (`set_option pp.all true` comparison, DRAFTS/defs-pp-all.log).
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- a saturating integral flow of the network at rank `p` with tag set `F`. -/
def IsSaturatingFlow (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)
    (f : Finset V → Finset V → ℕ) : Prop :=
  (∀ B A, 0 < f B A → B ∈ indepFamily G (p + 1) ∧ A ∈ indepFamily G p ∧ transportRel G B A) ∧
  (∀ B ∈ indepFamily G (p + 1), ∑ A ∈ indepFamily G p, f B A = activeWeight G F B) ∧
  (∀ A ∈ indepFamily G p, ∑ B ∈ indepFamily G (p + 1), f B A ≤ activeWeight G F A)

end E993Transport
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN definition E993Transport.WeightedHall 63534ffbfcc4bb1297228e598da165dcf98732939cd51a5d7fda3e62bc518478
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1551-1555. Author: r30 U2 (Claude Sonnet 5).
-- Freeze repair 3: the U2 wrapper's `open scoped Classical` is replaced, for definitions, by
-- `open Classical in` on `favorableLeaves` and `WeightedHall` only (mirroring entry 13); every
-- definition elaborates to the identical term (`set_option pp.all true` comparison, DRAFTS/defs-pp-all.log).
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- weighted Hall for every source subfamily. -/
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

-- VERITYOS ENTRY 23 BEGIN lemma E993Transport.indepFamily_eq_indepSetsAvoiding 45d1a93e12e0f50a58b9efb7fe25fab2fcd0c2e31eff6b3ac74795bf6a27cfe8
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1508-1511. Author: r30 U2 (Claude Sonnet 5).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `indepFamily` at `D = ∅` is `C5LA1.indepSetsAvoiding G ∅`. -/
lemma indepFamily_eq_indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj] (j : ℕ) :
    indepFamily G j = C5LA1.indepSetsAvoiding G ∅ j := by
  simp [indepFamily, C5LA1.indepSetsAvoiding]

end E993Transport
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma E993Transport.isGraphLeaf_of_mem_favorableLeaves 8977fb83111a46cace690984e23e2ffd54e2ea5233712bfeeca579f1debf75c8
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1534-1537. Author: r30 U2 (Claude Sonnet 5).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma isGraphLeaf_of_mem_favorableLeaves (G : SimpleGraph V) [DecidableRel G.Adj]
    {p : ℕ} {v : V} (hv : v ∈ favorableLeaves G p) : C4LA1.IsGraphLeaf G v := by
  have h1 := (Finset.mem_filter.mp hv).1
  exact (Finset.mem_filter.mp h1).2

end E993Transport
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma E993Transport.tagWitnesses_subset_R 7a8528a04b10243adfa0e8488d21206bd9cfed44e18910e7ed810b7b8517baad
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1566-1569. Author: r30 U2 (Claude Sonnet 5).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `W_v ⊆ R_v` (SEMANTIC-CONTRACT §1.2 notes `R_v ∖ H_v = W_v`; in particular `W_v ⊆ R_v`). -/
lemma tagWitnesses_subset_R (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) :
    tagWitnesses G v ⊆ C5LA1.R G v :=
  (Finset.erase_subset _ _).trans (Finset.subset_insert _ _)

end E993Transport
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma E993Transport.card_active_eq_tagged 8823a71dad443ec51fdf34fc541c2c66aab7792d9520f8ef76665729ece12616
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1571-1645. Author: r30 U2 (Claude Sonnet 5).
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
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma E993Transport.layerWeight_eq_sum_card 6adece46210475286f5574371270d1f0cba414876eec5e7dd058ab2fa1993c8f
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1655-1677. Author: r30 U2 (Claude Sonnet 5).
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
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma E993Transport.layerWeight_sub_eq_sum 56e71a87c92f3d8435c1f8fb3b3e906cb037d78027b5bdfdf26b824a1fa8cc33
-- r30 C1-LA1 carry WITH REPAIR: declaration text from
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743), lines 1679-1706,
-- with exactly two synthesis-required freeze repairs: keyword `theorem` -> `lemma` (repair 1),
-- and the unused `hpk2` (its `have` line and simp argument, U2 Main.lean:1703-1704) removed (repair 2).
-- The explicit `G` binder is the frozen phrasing (repair 5). Author: r30 U2 (Claude Sonnet 5).
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
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma E993Transport.indepFamily_eq_draftText 859fd215281757ab00eab0256dc5848db081bacc88c352f33b0f12aa0447b5d2
-- r30 C1-LA1 companion (synthesis repair 9): a C-U2-T `CriticContract.lean` equivalence
-- (sources/c1-stage7-sources/C-U2-T-CriticContract.lean, sha256 a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82),
-- RE-DERIVED as a named lemma (C-U2-T stated it as an anonymous `example`): the SOLUTION-CONTRACT §2
-- draft text, elaborated as in C-U2-T's `ContractDraft` context (`noncomputable section`, no
-- `open scoped Classical`), agrees with the compiled definition. Critic-attributed: C-U2-T
-- (Claude Opus 5.5). A companion lemma carries no certificate of its own (R29-N-12).
namespace E993Transport

noncomputable section

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- §2 draft text of `indepFamily` (under the type ascription its `def` header supplies) = the
compiled `indepFamily`. -/
lemma indepFamily_eq_draftText (G : SimpleGraph V) [DecidableRel G.Adj] (j : ℕ) :
    indepFamily G j =
      ((Finset.univ.powersetCard j).filter fun s => G.IsIndepSet (s : Set V) : Finset (Finset V)) := by
  unfold indepFamily; congr

end

end E993Transport
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma E993Transport.tagWitnesses_eq_draftText 27e7de2bcde3d487dc59a91bef86c04dff61d379bf2d91d7d4153015d9b145cc
-- r30 C1-LA1 companion (synthesis repair 9): a C-U2-T `CriticContract.lean` equivalence
-- (sources/c1-stage7-sources/C-U2-T-CriticContract.lean, sha256 a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82),
-- RE-DERIVED as a named lemma (C-U2-T stated it as an anonymous `example`): the SOLUTION-CONTRACT §2
-- draft text, elaborated as in C-U2-T's `ContractDraft` context (`noncomputable section`, no
-- `open scoped Classical`), agrees with the compiled definition. Critic-attributed: C-U2-T
-- (Claude Opus 5.5). A companion lemma carries no certificate of its own (R29-N-12).
namespace E993Transport

noncomputable section

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- §2 draft text of `tagWitnesses` = the compiled `tagWitnesses`. -/
lemma tagWitnesses_eq_draftText (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) :
    tagWitnesses G v = (G.neighborFinset (C5LA1.support G v)).erase v := rfl

end

end E993Transport
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma E993Transport.activeWeight_eq_draftText 638604a63e8db6171c23dd971ab56adbba9cdfeea2349d299271f4688358c5f9
-- r30 C1-LA1 companion (synthesis repair 9): a C-U2-T `CriticContract.lean` equivalence
-- (sources/c1-stage7-sources/C-U2-T-CriticContract.lean, sha256 a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82),
-- RE-DERIVED as a named lemma (C-U2-T stated it as an anonymous `example`): the SOLUTION-CONTRACT §2
-- draft text, elaborated as in C-U2-T's `ContractDraft` context (`noncomputable section`, no
-- `open scoped Classical`), agrees with the compiled definition. Critic-attributed: C-U2-T
-- (Claude Opus 5.5). A companion lemma carries no certificate of its own (R29-N-12).
namespace E993Transport

noncomputable section

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- §2 draft text of `activeWeight` = the compiled `activeWeight`. -/
lemma activeWeight_eq_draftText (G : SimpleGraph V) [DecidableRel G.Adj] (F B : Finset V) :
    activeWeight G F B = ((F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v)).card := by
  unfold activeWeight; congr

end

end E993Transport
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma E993Transport.layerWeight_eq_draftText 4234555560234fa34d51ad4025e76d925f45845a836badbf43b3898e797af720
-- r30 C1-LA1 companion (synthesis repair 9): a C-U2-T `CriticContract.lean` equivalence
-- (sources/c1-stage7-sources/C-U2-T-CriticContract.lean, sha256 a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82),
-- RE-DERIVED as a named lemma (C-U2-T stated it as an anonymous `example`): the SOLUTION-CONTRACT §2
-- draft text, elaborated as in C-U2-T's `ContractDraft` context (`noncomputable section`, no
-- `open scoped Classical`), agrees with the compiled definition. Critic-attributed: C-U2-T
-- (Claude Opus 5.5). A companion lemma carries no certificate of its own (R29-N-12).
namespace E993Transport

noncomputable section

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- §2 draft text of `layerWeight` (with the draft `indepFamily` and `activeWeight` unfolded)
= the compiled `layerWeight`. -/
lemma layerWeight_eq_draftText (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (j : ℕ) :
    layerWeight G F j =
      ∑ B ∈ ((Finset.univ.powersetCard j).filter fun s => G.IsIndepSet (s : Set V) : Finset (Finset V)),
        ((F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v)).card := by
  rw [layerWeight, indepFamily_eq_draftText]
  exact Finset.sum_congr rfl fun B _ => activeWeight_eq_draftText G F B

end

end E993Transport
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma E993Transport.favorableLeaves_eq_draftText dc0b9bda7a584aca9e69c4494bb275ee820f1f05550726aef41836e0e169aab9
-- r30 C1-LA1 companion (synthesis repair 9): a C-U2-T `CriticContract.lean` equivalence
-- (sources/c1-stage7-sources/C-U2-T-CriticContract.lean, sha256 a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82),
-- RE-DERIVED as a named lemma (C-U2-T stated it as an anonymous `example`): the SOLUTION-CONTRACT §2
-- draft text, elaborated as in C-U2-T's `ContractDraft` context (`noncomputable section`, no
-- `open scoped Classical`), agrees with the compiled definition. Critic-attributed: C-U2-T
-- (Claude Opus 5.5). A companion lemma carries no certificate of its own (R29-N-12).
namespace E993Transport

noncomputable section

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- §2 draft text of `favorableLeaves` (with `open Classical in`, as C-U2-T compiled it) = the
compiled `favorableLeaves`. -/
lemma favorableLeaves_eq_draftText (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
    favorableLeaves G p = (C5LA1.leafSet G).filter fun v => C4LA1.IsFavorableAt G v p := rfl

end

end E993Transport
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma E993Transport.transportRel_iff_draftText 206411b8c4fcea9b5ce9700f41d5ed30d7d09258e2f6c10c70f9a35808bcb986
-- r30 C1-LA1 companion (synthesis repair 9): a C-U2-T `CriticContract.lean` equivalence
-- (sources/c1-stage7-sources/C-U2-T-CriticContract.lean, sha256 a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82),
-- RE-DERIVED as a named lemma (C-U2-T stated it as an anonymous `example`): the SOLUTION-CONTRACT §2
-- draft text, elaborated as in C-U2-T's `ContractDraft` context (`noncomputable section`, no
-- `open scoped Classical`), agrees with the compiled definition. Critic-attributed: C-U2-T
-- (Claude Opus 5.5). A companion lemma carries no certificate of its own (R29-N-12).
namespace E993Transport

noncomputable section

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- §2 draft text of `transportRel` (the literal (D) ∪ (S)) ↔ the compiled `transportRel`. -/
lemma transportRel_iff_draftText (G : SimpleGraph V) [DecidableRel G.Adj] (B A : Finset V) :
    transportRel G B A ↔
      ((∃ q ∈ B, A = B.erase q) ∨
        (∃ u, u ∉ B ∧ (G.neighborFinset u ∩ B).card = 2 ∧ A = insert u (B \ G.neighborFinset u))) :=
  Iff.rfl

end

end E993Transport
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma E993Transport.layerWeight_sub_eq_sum_draftBinders 3fb02d6f1afd985d1166f4d5e7a649695b5f8fb705513675af2f4fa355edd7d5
-- r30 C1-LA1 companion (synthesis repair 9): a C-U2-T `CriticContract.lean` equivalence
-- (sources/c1-stage7-sources/C-U2-T-CriticContract.lean, sha256 a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82),
-- RE-DERIVED as a named lemma (C-U2-T stated it as an anonymous `example`): the SOLUTION-CONTRACT §2
-- draft text, elaborated as in C-U2-T's `ContractDraft` context (`noncomputable section`, no
-- `open scoped Classical`), agrees with the compiled definition. Critic-attributed: C-U2-T
-- (Claude Opus 5.5). A companion lemma carries no certificate of its own (R29-N-12).
namespace E993Transport

noncomputable section

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The §2 draft binder text of the general (WID) (implicit `{G}`), discharged by the frozen
explicit-`G` phrasing `layerWeight_sub_eq_sum` (synthesis repair 5). -/
lemma layerWeight_sub_eq_sum_draftBinders {G : SimpleGraph V} [DecidableRel G.Adj] (F : Finset V)
    (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v) (p : ℕ) (hp : 1 ≤ p) :
    (layerWeight G F (p + 1) : ℤ) - layerWeight G F p =
      ∑ v ∈ F, (C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) -
                C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1)) :=
  layerWeight_sub_eq_sum G F hF p hp

end

end E993Transport
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN theorem E993Transport.activeWeightAggregateIdentity 939231f2cd9efcc41d345c3391fc8a6730ff5e8071fba0f7a5ee89d91dc743e0
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1708-1718. `hp : 1 ≤ p` is kept as in SOLUTION-CONTRACT §2; it is NOT
-- needed for this specialized form (no leaf is favorable at rank 0, so F_0 = ∅), but it IS
-- load-bearing for the general-F companion `layerWeight_sub_eq_sum` (K_{1,3}, p = 0: 0 vs 6). Author: r30 U2 (Claude Sonnet 5).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **(WID)** at the run's fixed selector: the aggregate `S(G, p)` equals the
layer-weight difference at the favorable-leaf tag set. -/
theorem activeWeightAggregateIdentity (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) :
    (layerWeight G (favorableLeaves G p) (p + 1) : ℤ) - layerWeight G (favorableLeaves G p) p =
      C5LA1.aggregate G p := by
  have hF : ∀ v ∈ favorableLeaves G p, C4LA1.IsGraphLeaf G v :=
    fun v hv => isGraphLeaf_of_mem_favorableLeaves G hv
  rw [layerWeight_sub_eq_sum G (favorableLeaves G p) hF p hp]
  unfold C5LA1.aggregate favorableLeaves
  rfl

end E993Transport
-- VERITYOS ENTRY 36 END

