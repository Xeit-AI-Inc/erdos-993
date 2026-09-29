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

-- VERITYOS ENTRY 22 BEGIN definition C5LA1.crossingIndex 378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb
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
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN definition E993Transport.cbEdge 84901458c1f299cbc7a74fca5dec1dec3dea642585242b696d6df7acb8a7fa7b
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- Labelling of record (FROZEN by the r31 Cycle 1 synthesis): 0 = r (root); 1 = s; 2 = v (leaf on r–s–v);
-- for i < m: u_i = 3+17i (choke), b_ij = u_i+1+2j (support, j < 8), c_ij = u_i+2+2j (private leaf, j < 8).
-- Edges: r–s, s–v, r–u_i, u_i–b_ij, b_ij–c_ij. Vertices: Fin (17*m+3) (n = 3 + m(2d+1), d = 8).
/-- The edge relation of `CB(8,m)` on `Fin (17*m+3)`: root `0`–`1`–`2` (`r`–`s`–`v`); `m` chokes
`u_i` at label `3+17i` adjacent to `r`; `8` supports `b_{ij}` at `3+17i+1+2j` adjacent to `u_i`;
one private leaf `c_{ij}` at `3+17i+2+2j` adjacent to `b_{ij}`. -/
def cbEdge (m : ℕ) (u v : Fin (17 * m + 3)) : Prop :=
  (u.val = 0 ∧ v.val = 1) ∨ (u.val = 1 ∧ v.val = 2) ∨
  ∃ i < m, (u.val = 0 ∧ v.val = 3 + 17 * i) ∨
    ∃ j < 8, (u.val = 3 + 17 * i ∧ v.val = 3 + 17 * i + 1 + 2 * j) ∨
             (u.val = 3 + 17 * i + 1 + 2 * j ∧ v.val = 3 + 17 * i + 2 + 2 * j)

end E993Transport
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN definition E993Transport.cbGraph 206cd48848e1208041e40cdd238a0c92f341ede8e257629cf468701ba4ebb52f
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- `CB(8,m)`, the tree of record for r31's target rank (`SEMANTIC-CONTRACT.md` §2). -/
def cbGraph (m : ℕ) : SimpleGraph (Fin (17 * m + 3)) := SimpleGraph.fromRel (cbEdge m)

end E993Transport
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN definition E993Transport.cbGraph_decAdj dabf806176a2765b998216113a73e1a57e7137165ce6410e32c38be98f94e52a
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- The decidable adjacency of `CB(8,m)`: `cbEdge` is a finite disjunction of equalities of
naturals and bounded `∃ i < m`, `∃ j < 8`, each decidable by the core instances, so no classical
choice is used (pattern: r30 C6-LA2 `spiderOneTwoThrees_decAdj`, r30 C4-LA1 `gkGraph_decAdj`). -/
@[reducible, instance]
def cbGraph_decAdj (m : ℕ) : DecidableRel (cbGraph m).Adj := fun u v =>
  haveI : ∀ a b : Fin (17 * m + 3), Decidable (cbEdge m a b) := fun a b => by
    unfold cbEdge
    infer_instance
  decidable_of_iff (u ≠ v ∧ (cbEdge m u v ∨ cbEdge m v u))
    (SimpleGraph.fromRel_adj (cbEdge m) u v).symm

end E993Transport
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN definition E993Transport.cbVertex 8a1b06d43ac1f07c0c1b81f814493fb47ff9f2e61b9fa806c80e0ab6c084dffa
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- the vertex of `CB(8,m)` with label `n` (labels `n < 17m+3` are the vertices of record). -/
def cbVertex (m n : ℕ) : Fin (17 * m + 3) := ⟨n % (17 * m + 3), Nat.mod_lt _ (by omega)⟩

end E993Transport
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN definition E993Transport.cbParentVal e262e5fafb047d648488e86957cc09f15369a3dce16c8ee2e1561583bea70a28
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- the label of the parent of a vertex of label `n ≥ 1`. -/
def cbParentVal (n : ℕ) : ℕ :=
  if n = 1 then 0
  else if n = 2 then 1
  else if (n - 3) % 17 = 0 then 0
  else if (n - 3) % 17 % 2 = 1 then 3 + 17 * ((n - 3) / 17)
  else 3 + 17 * ((n - 3) / 17) + ((n - 3) % 17 - 1)

end E993Transport
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN definition E993Transport.cbParent 0be56aa750a0050af1eb4f29ae549f14ffeed044869ef45071b2d4053cd80880
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- the parent of `v` in `CB(8,m)`. -/
def cbParent (m : ℕ) (v : Fin (17 * m + 3)) : Fin (17 * m + 3) := cbVertex m (cbParentVal v.val)

end E993Transport
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN definition E993Transport.cbChildEdge a6e14fbf86c38e0894188a49ae5ce5a8166227922b8074a0b3d037f40a4633ce
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- the child–parent edge of a non-root vertex, as a `Sym2`. -/
def cbChildEdge (m : ℕ) (v : {v : Fin (17 * m + 3) // v.val ≠ 0}) : Sym2 (Fin (17 * m + 3)) :=
  s(v.1, cbParent m v.1)

end E993Transport
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN definition E993Transport.cbLowerWitness 63cd89899c73f61092910ade4cd119cc6fb4dc0934846afcbf13e9a314c3fdeb
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- the explicit independent witness of size `9m+1`. -/
def cbLowerWitness (m : ℕ) : Finset (Fin (17 * m + 3)) :=
  insert (cbVertex m 1)
    ((Finset.range m).image (fun i => cbVertex m (3 + 17 * i)) ∪
      ((Finset.range m ×ˢ Finset.range 8).image
        (fun p => cbVertex m (3 + 17 * p.1 + 2 + 2 * p.2))))

end E993Transport
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma E993Transport.support_eq_of_isGraphLeaf_of_adj 16687f86fa9b55f6996ffb8d02fcf3cf1af6129033605d60c019f33c360b620d
namespace E993Transport

-- r30 C6-LA2 (F0), authored in-run by the C6-LA2 formalizer (Claude Opus 5.5): the support of a leaf is its neighbour
-- (graph-generic; the uniqueness clause of the carried definition `C5LA1.support`).
/-- the support of an original leaf `v` adjacent to `s` is `s`. -/
lemma support_eq_of_isGraphLeaf_of_adj {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v s : V) (hv : C4LA1.IsGraphLeaf G v) (hs : G.Adj v s) :
    C5LA1.support G v = s := by
  unfold C5LA1.support
  generalize_proofs h
  exact ((Classical.choose_spec h hv).2 s hs).symm

end E993Transport
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma E993Transport.mem_tagWitnesses_iff_of_adj 772a13c0522f1c4b7c8d93dc3920688ea5649302271cbd8799d1c575e8773de5
namespace E993Transport

-- r30 C6-LA2 (F0), authored in-run (C6-LA2 formalizer, Claude Opus 5.5); graph-generic.
/-- `W_v = N(s_v) ∖ {v}`, read at a leaf `v` with neighbour `s`. -/
lemma mem_tagWitnesses_iff_of_adj {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v s w : V) (hv : C4LA1.IsGraphLeaf G v)
    (hs : G.Adj v s) : w ∈ tagWitnesses G v ↔ w ≠ v ∧ G.Adj s w := by
  rw [tagWitnesses, support_eq_of_isGraphLeaf_of_adj G v s hv hs, Finset.mem_erase,
    SimpleGraph.mem_neighborFinset]

end E993Transport
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma E993Transport.cbVertex_val c6accdf2872bf41acb9ddf524f60282afed933a76da5fdb142a88e29d571e223
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbVertex_val (m n : ℕ) (h : n < 17 * m + 3) : (cbVertex m n).val = n :=
  Nat.mod_eq_of_lt h

end E993Transport
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma E993Transport.eq_cbVertex_iff e31d191c4e64507642d9e3cb70b9b13fae338e921de4968c9e69504a4d7ccd66
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma eq_cbVertex_iff (m n : ℕ) (h : n < 17 * m + 3) (v : Fin (17 * m + 3)) :
    v = cbVertex m n ↔ v.val = n := by
  rw [Fin.ext_iff, cbVertex_val m n h]

end E993Transport
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma E993Transport.cbGraph_adj_iff b462cedd206638d7cd619f9a0d7ad1ccb6f5e6f1c25e86a2b3814692d9a60d4b
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_iff (m : ℕ) (u v : Fin (17 * m + 3)) :
    (cbGraph m).Adj u v ↔ cbEdge m u v ∨ cbEdge m v u := by
  have hne : ∀ a b : Fin (17 * m + 3), cbEdge m a b → a ≠ b := by
    intro a b h hab
    subst hab
    unfold cbEdge at h
    rcases h with h | h | ⟨i, -, h | ⟨j, -, h | h⟩⟩ <;> omega
  rw [cbGraph, SimpleGraph.fromRel_adj]
  constructor
  · exact fun h => h.2
  · intro h
    refine ⟨?_, h⟩
    rcases h with h | h
    · exact hne u v h
    · exact fun huv => hne v u h huv.symm

end E993Transport
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma E993Transport.cbGraph_adj_iff_val 0d82fdf8407ffb57f4f7cb4e17f42bd15f2b5db9985cbd802c1f81b624c99912
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_iff_val (m : ℕ) (u v : Fin (17 * m + 3)) :
    (cbGraph m).Adj u v ↔ cbEdge m u v ∨ cbEdge m v u := cbGraph_adj_iff m u v

end E993Transport
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma E993Transport.cbGraph_adj_of_val 07d238df818cfdf7b573eaa17c924159094dabe9ef58829817fb4aee955eef21
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_of_val (m : ℕ) (u v : Fin (17 * m + 3)) (h : cbEdge m u v) :
    (cbGraph m).Adj u v := (cbGraph_adj_iff m u v).mpr (Or.inl h)

end E993Transport
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma E993Transport.cbGraph_adj_r_s fe0ea61f6049522a9452bcb38e333e98b92249c2de63e3542335e6f0af2c93ec
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_r_s (m : ℕ) : (cbGraph m).Adj (cbVertex m 0) (cbVertex m 1) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m 0 (by omega), cbVertex_val m 1 (by omega)]; exact Or.inl ⟨rfl, rfl⟩)

end E993Transport
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma E993Transport.cbGraph_adj_s_v 79bcebf1d707141783cac3436aaafbe0bf9f778de301fce76c7d572019dff008
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_s_v (m : ℕ) : (cbGraph m).Adj (cbVertex m 1) (cbVertex m 2) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m 1 (by omega), cbVertex_val m 2 (by omega)]
    exact Or.inr (Or.inl ⟨rfl, rfl⟩))

end E993Transport
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma E993Transport.cbGraph_adj_r_choke bf806398b632a71b8a77006b213fa2b9e5db1d44dcb2a400bcd6184162e5a570
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_r_choke (m i : ℕ) (hi : i < m) :
    (cbGraph m).Adj (cbVertex m 0) (cbVertex m (3 + 17 * i)) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m 0 (by omega), cbVertex_val m (3 + 17 * i) (by omega)]
    exact Or.inr (Or.inr ⟨i, hi, Or.inl ⟨rfl, rfl⟩⟩))

end E993Transport
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma E993Transport.cbGraph_adj_choke_support e9ba1eb05fffafad702a6b31518a800b974e91accd31b55b72d53853d50c3088
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_choke_support (m i j : ℕ) (hi : i < m) (hj : j < 8) :
    (cbGraph m).Adj (cbVertex m (3 + 17 * i)) (cbVertex m (3 + 17 * i + 1 + 2 * j)) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m (3 + 17 * i) (by omega), cbVertex_val m (3 + 17 * i + 1 + 2 * j) (by omega)]
    exact Or.inr (Or.inr ⟨i, hi, Or.inr ⟨j, hj, Or.inl ⟨rfl, rfl⟩⟩⟩))

end E993Transport
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma E993Transport.cbGraph_adj_support_leaf 2c41bee31dd97c88dfe6551f3e6fdf9c09c51c05982e37ee1fce58a8a4807859
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_support_leaf (m i j : ℕ) (hi : i < m) (hj : j < 8) :
    (cbGraph m).Adj (cbVertex m (3 + 17 * i + 1 + 2 * j)) (cbVertex m (3 + 17 * i + 2 + 2 * j)) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m (3 + 17 * i + 1 + 2 * j) (by omega),
        cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)]
    exact Or.inr (Or.inr ⟨i, hi, Or.inr ⟨j, hj, Or.inr ⟨rfl, rfl⟩⟩⟩))

end E993Transport
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma E993Transport.cbGraph_reachable_zero c4e279c449d558c4636739a04710049980ff27b9f048950bf725494bc4efeab2
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_reachable_zero (m : ℕ) (x : Fin (17 * m + 3)) :
    (cbGraph m).Reachable (cbVertex m 0) x := by
  have hx : x = cbVertex m x.val := (eq_cbVertex_iff m x.val x.isLt x).mpr rfl
  rw [hx]
  set n := x.val with hn
  have hlt : n < 17 * m + 3 := x.isLt
  have hcase : n = 0 ∨ n = 1 ∨ n = 2 ∨
      ∃ i < m, n = 3 + 17 * i ∨
        ∃ j < 8, n = 3 + 17 * i + 1 + 2 * j ∨ n = 3 + 17 * i + 2 + 2 * j := by
    by_cases h : n ≤ 2
    · omega
    · refine Or.inr (Or.inr (Or.inr ⟨(n - 3) / 17, by omega, ?_⟩))
      by_cases hq0 : (n - 3) % 17 = 0
      · left; omega
      · by_cases hqodd : (n - 3) % 17 % 2 = 1
        · right; exact ⟨((n - 3) % 17 - 1) / 2, by omega, Or.inl (by omega)⟩
        · right; exact ⟨((n - 3) % 17 - 2) / 2, by omega, Or.inr (by omega)⟩
  rcases hcase with h0 | h1 | h2 | ⟨i, hi, hc | ⟨j, hj, hb | hl⟩⟩
  · rw [h0]
  · rw [h1]; exact (cbGraph_adj_r_s m).reachable
  · rw [h2]; exact (cbGraph_adj_r_s m).reachable.trans (cbGraph_adj_s_v m).reachable
  · rw [hc]; exact (cbGraph_adj_r_choke m i hi).reachable
  · rw [hb]
    exact (cbGraph_adj_r_choke m i hi).reachable.trans (cbGraph_adj_choke_support m i j hi hj).reachable
  · rw [hl]
    exact ((cbGraph_adj_r_choke m i hi).reachable.trans
      (cbGraph_adj_choke_support m i j hi hj).reachable).trans
      (cbGraph_adj_support_leaf m i j hi hj).reachable

end E993Transport
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma E993Transport.cbGraph_connected 508223f9174f8bfbc7f4927978d8bc9dd17534700ea4bc762a0673cd9bc16416
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_connected (m : ℕ) : (cbGraph m).Connected :=
  (SimpleGraph.connected_iff_exists_forall_reachable (cbGraph m)).mpr
    ⟨cbVertex m 0, cbGraph_reachable_zero m⟩

end E993Transport
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma E993Transport.cbParentVal_lt 501c91a17802e752fe9c3762f566940a6afa2ea6e809a4cda0d5bb484e8a249a
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbParentVal_lt (n : ℕ) (hn : 1 ≤ n) : cbParentVal n < n := by
  unfold cbParentVal; split_ifs <;> omega

end E993Transport
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma E993Transport.cbParentVal_le 421fb390e1f4c7a6fa2dc4213318a7503c530547f523cbfe3cda13967108fac1
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbParentVal_le (n : ℕ) : cbParentVal n ≤ n := by
  unfold cbParentVal; split_ifs <;> omega

end E993Transport
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma E993Transport.cbParentVal_at_s 3ea49306762a577be10400b933443d17e34b862a7fa6e996958ebdd2494c9e7f
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbParentVal_at_s : cbParentVal 1 = 0 := by unfold cbParentVal; norm_num

end E993Transport
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma E993Transport.cbParentVal_at_v fd9229837bb6a65af3795d41ae0513ccfb1c00c7586ee1b489e00fd190a3c7cf
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbParentVal_at_v : cbParentVal 2 = 1 := by unfold cbParentVal; norm_num

end E993Transport
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma E993Transport.cbParentVal_at_choke 58bd58dafde280648cbcc9048fa449f7bf39cb58177743054b4ecb0731614412
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbParentVal_at_choke (i : ℕ) : cbParentVal (3 + 17 * i) = 0 := by
  unfold cbParentVal
  rw [if_neg (by omega : 3 + 17 * i ≠ 1), if_neg (by omega : 3 + 17 * i ≠ 2),
      if_pos (by omega : (3 + 17 * i - 3) % 17 = 0)]

end E993Transport
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma E993Transport.cbParentVal_at_support d8efdcd551f714f53d4719460141f03abda91e4058f52a1c02deae049e631e53
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbParentVal_at_support (i j : ℕ) (hj : j < 8) :
    cbParentVal (3 + 17 * i + 1 + 2 * j) = 3 + 17 * i := by
  unfold cbParentVal
  rw [if_neg (by omega : 3 + 17 * i + 1 + 2 * j ≠ 1),
      if_neg (by omega : 3 + 17 * i + 1 + 2 * j ≠ 2),
      if_neg (by omega : ¬ (3 + 17 * i + 1 + 2 * j - 3) % 17 = 0),
      if_pos (by omega : (3 + 17 * i + 1 + 2 * j - 3) % 17 % 2 = 1)]
  omega

end E993Transport
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma E993Transport.cbParentVal_at_leaf 78dbece94f5d5e67628023d91bf19d0ef3928f0d37454ecdae5f387921aabe4e
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbParentVal_at_leaf (i j : ℕ) (hj : j < 8) :
    cbParentVal (3 + 17 * i + 2 + 2 * j) = 3 + 17 * i + 1 + 2 * j := by
  unfold cbParentVal
  rw [if_neg (by omega : 3 + 17 * i + 2 + 2 * j ≠ 1),
      if_neg (by omega : 3 + 17 * i + 2 + 2 * j ≠ 2),
      if_neg (by omega : ¬ (3 + 17 * i + 2 + 2 * j - 3) % 17 = 0),
      if_neg (by omega : ¬ (3 + 17 * i + 2 + 2 * j - 3) % 17 % 2 = 1)]
  omega

end E993Transport
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma E993Transport.cbGraph_adj_parent 1de7991c6ee87d14be65af77fb6ed42c06945305778dbde333bdab5810bb85f7
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_parent (m : ℕ) (v : Fin (17 * m + 3)) (hv : v.val ≠ 0) :
    (cbGraph m).Adj v (cbParent m v) := by
  have hlt : v.val < 17 * m + 3 := v.isLt
  unfold cbParent
  by_cases h1 : v.val = 1
  · rw [h1, cbParentVal_at_s]
    have hveq : v = cbVertex m 1 := (eq_cbVertex_iff m 1 (by omega) v).mpr h1
    rw [hveq]; exact (cbGraph_adj_r_s m).symm
  by_cases h2 : v.val = 2
  · rw [h2, cbParentVal_at_v]
    have hveq : v = cbVertex m 2 := (eq_cbVertex_iff m 2 (by omega) v).mpr h2
    rw [hveq]; exact (cbGraph_adj_s_v m).symm
  -- v.val ≥ 3
  have hge3 : 3 ≤ v.val := by omega
  set q := (v.val - 3) % 17 with hqdef
  set i := (v.val - 3) / 17 with hidef
  have hilt : i < m := by
    have : v.val - 3 < 17 * m := by omega
    rw [hidef]; omega
  by_cases hq0 : q = 0
  · have hveq : v.val = 3 + 17 * i := by omega
    rw [hveq, cbParentVal_at_choke]
    have hveq' : v = cbVertex m (3 + 17 * i) := (eq_cbVertex_iff m (3 + 17 * i) (by omega) v).mpr hveq
    rw [hveq']; exact (cbGraph_adj_r_choke m i hilt).symm
  by_cases hqodd : q % 2 = 1
  · obtain ⟨j, hj, hqeq⟩ : ∃ j < 8, q = 1 + 2 * j := ⟨(q - 1) / 2, by omega, by omega⟩
    have hveq : v.val = 3 + 17 * i + 1 + 2 * j := by omega
    rw [hveq, cbParentVal_at_support i j hj]
    have hveq' : v = cbVertex m (3 + 17 * i + 1 + 2 * j) :=
      (eq_cbVertex_iff m (3 + 17 * i + 1 + 2 * j) (by omega) v).mpr hveq
    rw [hveq']; exact (cbGraph_adj_choke_support m i j hilt hj).symm
  · obtain ⟨j, hj, hqeq⟩ : ∃ j < 8, q = 2 + 2 * j := ⟨(q - 2) / 2, by omega, by omega⟩
    have hveq : v.val = 3 + 17 * i + 2 + 2 * j := by omega
    rw [hveq, cbParentVal_at_leaf i j hj]
    have hveq' : v = cbVertex m (3 + 17 * i + 2 + 2 * j) :=
      (eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) v).mpr hveq
    rw [hveq']; exact (cbGraph_adj_support_leaf m i j hilt hj).symm

end E993Transport
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma E993Transport.cbChildEdge_injective e5f898ec988338d2487469c332aad8ebb61e03c035b43e016b467dde11751989
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbChildEdge_injective (m : ℕ) : Function.Injective (cbChildEdge m) := by
  rintro ⟨v, hv⟩ ⟨w, hw⟩ h
  simp only [cbChildEdge, Sym2.eq_iff] at h
  rcases h with ⟨h1, _⟩ | ⟨h1, h2⟩
  · exact Subtype.ext h1
  · exfalso
    have hvlt := cbParentVal_lt v.val (by omega)
    have hwlt := cbParentVal_lt w.val (by omega)
    have e1 : v.val = cbParentVal w.val := by
      have h1' := congrArg Fin.val h1
      unfold cbParent at h1'
      rwa [cbVertex_val m (cbParentVal w.val) (by omega)] at h1'
    have e2 : w.val = cbParentVal v.val := by
      have h2' := congrArg Fin.val h2
      unfold cbParent at h2'
      rw [cbVertex_val m (cbParentVal v.val) (by omega)] at h2'
      exact h2'.symm
    omega

end E993Transport
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma E993Transport.cbChildEdge_range 9f54fb3c0abc7ddc4656d244f20caec0fb48685a23e2fcbb496f514ccb29c30f
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbChildEdge_range (m : ℕ) :
    Set.range (cbChildEdge m) = (cbGraph m).edgeSet := by
  ext e
  refine ⟨?_, ?_⟩
  · rintro ⟨⟨v, hv⟩, rfl⟩
    show s(v, cbParent m v) ∈ (cbGraph m).edgeSet
    rw [SimpleGraph.mem_edgeSet]
    exact cbGraph_adj_parent m v hv
  · refine Sym2.inductionOn e (fun a b hab => ?_)
    rw [SimpleGraph.mem_edgeSet, cbGraph_adj_iff] at hab
    have core : ∀ a b : Fin (17 * m + 3), cbEdge m a b →
        ∃ v : {v : Fin (17 * m + 3) // v.val ≠ 0}, cbChildEdge m v = s(a, b) := by
      intro a b hc
      have hbne : b.val ≠ 0 := by
        rcases hc with h | h | ⟨i, -, h | ⟨j, -, h | h⟩⟩ <;> omega
      refine ⟨⟨b, hbne⟩, ?_⟩
      show s(b, cbParent m b) = s(a, b)
      have haeq : cbParent m b = a := by
        apply Fin.ext
        show (cbVertex m (cbParentVal b.val)).val = a.val
        rcases hc with h | h | ⟨i, hi, h | ⟨j, hj, h | h⟩⟩
        · rw [h.2, cbParentVal_at_s, cbVertex_val m 0 (by omega)]; omega
        · rw [h.2, cbParentVal_at_v, cbVertex_val m 1 (by omega)]; omega
        · rw [h.2, cbParentVal_at_choke, cbVertex_val m 0 (by omega)]; omega
        · rw [h.2, cbParentVal_at_support i j hj, cbVertex_val m (3 + 17 * i) (by omega)]; omega
        · rw [h.2, cbParentVal_at_leaf i j hj,
              cbVertex_val m (3 + 17 * i + 1 + 2 * j) (by omega)]; omega
      rw [haeq, Sym2.eq_iff]; tauto
    rcases hab with h | h
    · exact core a b h
    · obtain ⟨v, hv⟩ := core b a h
      exact ⟨v, by rw [hv, Sym2.eq_swap]⟩

end E993Transport
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma E993Transport.cbGraph_card_nonroot d510e038b70eb857d4e88c26a8b6a3df65c22d4f8ce4051afc1d4c360582e7d3
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_card_nonroot (m : ℕ) :
    Fintype.card {v : Fin (17 * m + 3) // v.val ≠ 0} + 1 = Fintype.card (Fin (17 * m + 3)) := by
  have hbij : {v : Fin (17 * m + 3) // v.val ≠ 0} ≃ {v : Fin (17 * m + 3) // v ≠ cbVertex m 0} :=
    Equiv.subtypeEquivRight (fun v => by
      constructor
      · intro hv hcontra; exact hv ((eq_cbVertex_iff m 0 (by omega) v).mp hcontra)
      · intro hv hcontra; exact hv ((eq_cbVertex_iff m 0 (by omega) v).mpr hcontra))
  rw [Fintype.card_congr hbij, Fintype.card_subtype_compl (fun v => v = cbVertex m 0),
      Fintype.card_subtype_eq, Fintype.card_fin]
  omega

end E993Transport
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma E993Transport.cbGraph_isTree 020d263c597356d1073aa3644a3da2cac204a3011fdbc512111813c893e6afa4
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- **The CB(8,m) tree layer.** `CB(8,m)` is a tree: connected, with exactly `17m+2` edges on
`17m+3` vertices (the child–parent edge bijection). Method: r30 C5-LA1 `gkGraph_isTree` / C6-LA2
`spiderOneTwoThrees_isTree`, transcribed to CB's edge set. -/
lemma cbGraph_isTree (m : ℕ) : (cbGraph m).IsTree := by
  rw [SimpleGraph.isTree_iff_connected_and_card]
  refine ⟨cbGraph_connected m, ?_⟩
  rw [← cbChildEdge_range, Nat.card_range_of_injective (cbChildEdge_injective m)]
  rw [Nat.card_eq_fintype_card, Nat.card_eq_fintype_card]
  exact cbGraph_card_nonroot m

end E993Transport
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma E993Transport.cb_val_cases 5d74bbd3141e6d8811691fc06303c109616ecb9a372f00bb70e56f9ec54efaa6
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- exhaustive, label-level case split (0<m case: covers every label of `CB(8,m)`). -/
lemma cb_val_cases (m n : ℕ) (h : n < 17 * m + 3) :
    n = 0 ∨ n = 1 ∨ n = 2 ∨ (∃ i < m, n = 3 + 17 * i) ∨
    (∃ i < m, ∃ j < 8, n = 3 + 17 * i + 1 + 2 * j) ∨
    (∃ i < m, ∃ j < 8, n = 3 + 17 * i + 2 + 2 * j) := by
  by_cases h2 : n ≤ 2
  · omega
  · set i := (n - 3) / 17 with hidef
    set q := (n - 3) % 17 with hqdef
    have hi : i < m := by omega
    by_cases hq0 : q = 0
    · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨i, hi, by omega⟩)))
    · by_cases hqodd : q % 2 = 1
      · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ⟨i, hi, (q - 1) / 2, by omega, by omega⟩))))
      · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr ⟨i, hi, (q - 2) / 2, by omega, by omega⟩))))

end E993Transport
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma E993Transport.cb_leaf_cases c88c5b63b3eeb9356c3783b409f5a19e21bbed79875029585c18c643a7bcc9be
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- (F0) a leaf of `CB(8,m)` (`m ≥ 1`) is `v` (label `2`) or a private leaf `c_{ij}`. -/
lemma cb_leaf_cases (m : ℕ) (hm : 0 < m) (τ : Fin (17 * m + 3))
    (hleaf : C4LA1.IsGraphLeaf (cbGraph m) τ) :
    τ.val = 2 ∨ ∃ i < m, ∃ j < 8, τ.val = 3 + 17 * i + 2 + 2 * j := by
  obtain ⟨s, -, huniq⟩ := hleaf
  have two : ∀ u w, (cbGraph m).Adj τ u → (cbGraph m).Adj τ w → u.val = w.val := by
    intro u w hu hw; rw [huniq u hu, huniq w hw]
  have hlt := τ.isLt
  rcases cb_val_cases m τ.val hlt with h0 | h1 | h2 | ⟨i, hi, hc⟩ | ⟨i, hi, j, hj, hb⟩ |
    ⟨i, hi, j, hj, hl⟩
  · exfalso
    have hτeq : τ = cbVertex m 0 := (eq_cbVertex_iff m 0 (by omega) τ).mpr h0
    have hadj1 : (cbGraph m).Adj τ (cbVertex m 1) := by rw [hτeq]; exact cbGraph_adj_r_s m
    have hadj2 : (cbGraph m).Adj τ (cbVertex m (3 + 17 * 0)) := by
      rw [hτeq]; exact cbGraph_adj_r_choke m 0 hm
    have hval := two _ _ hadj1 hadj2
    rw [cbVertex_val m 1 (by omega), cbVertex_val m (3 + 17 * 0) (by omega)] at hval
    omega
  · exfalso
    have hτeq : τ = cbVertex m 1 := (eq_cbVertex_iff m 1 (by omega) τ).mpr h1
    have hadj1 : (cbGraph m).Adj τ (cbVertex m 0) := by
      rw [hτeq]; exact (cbGraph_adj_r_s m).symm
    have hadj2 : (cbGraph m).Adj τ (cbVertex m 2) := by rw [hτeq]; exact cbGraph_adj_s_v m
    have hval := two _ _ hadj1 hadj2
    rw [cbVertex_val m 0 (by omega), cbVertex_val m 2 (by omega)] at hval
    omega
  · exact Or.inl h2
  · exfalso
    have hτeq : τ = cbVertex m (3 + 17 * i) := (eq_cbVertex_iff m (3 + 17 * i) (by omega) τ).mpr hc
    have hadj1 : (cbGraph m).Adj τ (cbVertex m 0) := by
      rw [hτeq]; exact (cbGraph_adj_r_choke m i hi).symm
    have hadj2 : (cbGraph m).Adj τ (cbVertex m (3 + 17 * i + 1 + 2 * 0)) := by
      rw [hτeq]; exact cbGraph_adj_choke_support m i 0 hi (by omega)
    have hval := two _ _ hadj1 hadj2
    rw [cbVertex_val m 0 (by omega), cbVertex_val m (3 + 17 * i + 1 + 2 * 0) (by omega)] at hval
    omega
  · exfalso
    have hτeq : τ = cbVertex m (3 + 17 * i + 1 + 2 * j) :=
      (eq_cbVertex_iff m (3 + 17 * i + 1 + 2 * j) (by omega) τ).mpr hb
    have hadj1 : (cbGraph m).Adj τ (cbVertex m (3 + 17 * i)) := by
      rw [hτeq]; exact (cbGraph_adj_choke_support m i j hi hj).symm
    have hadj2 : (cbGraph m).Adj τ (cbVertex m (3 + 17 * i + 2 + 2 * j)) := by
      rw [hτeq]; exact cbGraph_adj_support_leaf m i j hi hj
    have hval := two _ _ hadj1 hadj2
    rw [cbVertex_val m (3 + 17 * i) (by omega),
        cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)] at hval
    omega
  · exact Or.inr ⟨i, hi, j, hj, hl⟩

end E993Transport
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma E993Transport.cb_isGraphLeaf_of_cases f138151e922a73bbc05816e8c1246588ac8eb57c0664737dca51575521c5ecb6
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- (F0) `v` and the private leaves `c_{ij}` are leaves of `CB(8,m)`. -/
lemma cb_isGraphLeaf_of_cases (m : ℕ) (τ : Fin (17 * m + 3))
    (h : τ.val = 2 ∨ ∃ i < m, ∃ j < 8, τ.val = 3 + 17 * i + 2 + 2 * j) :
    C4LA1.IsGraphLeaf (cbGraph m) τ := by
  have hlt := τ.isLt
  rcases h with h | ⟨i, hi, j, hj, h⟩
  · refine ⟨cbVertex m 1, by
      rw [(eq_cbVertex_iff m 2 (by omega) τ).mpr h]; exact (cbGraph_adj_s_v m).symm, ?_⟩
    intro w hw
    rw [(eq_cbVertex_iff m 2 (by omega) τ).mpr h, cbGraph_adj_iff_val] at hw
    apply Fin.ext
    rw [cbVertex_val m 1 (by omega)]
    unfold cbEdge at hw
    rw [cbVertex_val m 2 (by omega)] at hw
    rcases hw with (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) |
      (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) <;> omega
  · refine ⟨cbVertex m (3 + 17 * i + 1 + 2 * j), by
      rw [(eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) τ).mpr h]
      exact (cbGraph_adj_support_leaf m i j hi hj).symm, ?_⟩
    intro w hw
    rw [(eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) τ).mpr h, cbGraph_adj_iff_val] at hw
    apply Fin.ext
    rw [cbVertex_val m (3 + 17 * i + 1 + 2 * j) (by omega)]
    unfold cbEdge at hw
    rw [cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)] at hw
    rcases hw with (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) |
      (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) <;> omega

end E993Transport
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma E993Transport.mem_leafSet_cbGraph_iff d94a4323f5ed4b636c98e2147b5569f342f03438d92dc635594afede03baa0fd
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- **The CB(8,m) leaf layer.** `leafSet(CB(8,m)) = {v} ∪ {c_{ij} : i < m, j < 8}` (`m ≥ 1`;
`SEMANTIC-CONTRACT.md` §2, `leafSet = {v} ∪ C`). -/
lemma mem_leafSet_cbGraph_iff (m : ℕ) (hm : 0 < m) (τ : Fin (17 * m + 3)) :
    τ ∈ C5LA1.leafSet (cbGraph m) ↔
      τ.val = 2 ∨ ∃ i < m, ∃ j < 8, τ.val = 3 + 17 * i + 2 + 2 * j := by
  constructor
  · intro hτ
    have hleaf : C4LA1.IsGraphLeaf (cbGraph m) τ := by simpa [C5LA1.leafSet] using hτ
    exact cb_leaf_cases m hm τ hleaf
  · intro h
    have hleaf := cb_isGraphLeaf_of_cases m τ h
    simpa [C5LA1.leafSet] using hleaf

end E993Transport
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma E993Transport.mem_cbLowerWitness_iff 319200e9ebb6f7d803bd80ff9f5ff7985f2c6a41a32e424d4f4b99ba60d2f558
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma mem_cbLowerWitness_iff (m : ℕ) (x : Fin (17 * m + 3)) :
    x ∈ cbLowerWitness m ↔
      x.val = 1 ∨ (∃ i < m, x.val = 3 + 17 * i) ∨ (∃ i < m, ∃ j < 8, x.val = 3 + 17 * i + 2 + 2 * j) := by
  unfold cbLowerWitness
  simp only [Finset.mem_insert, Finset.mem_union, Finset.mem_image, Finset.mem_range,
    Finset.mem_product]
  constructor
  · rintro (h | ⟨i, hi, hix⟩ | ⟨⟨i, j⟩, ⟨hi, hj⟩, hix⟩)
    · exact Or.inl (h ▸ cbVertex_val m 1 (by omega))
    · exact Or.inr (Or.inl ⟨i, hi, by rw [← hix]; exact cbVertex_val m (3 + 17 * i) (by omega)⟩)
    · exact Or.inr (Or.inr ⟨i, hi, j, hj, by
        rw [← hix]; exact cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)⟩)
  · rintro (h | ⟨i, hi, h⟩ | ⟨i, hi, j, hj, h⟩)
    · exact Or.inl ((eq_cbVertex_iff m 1 (by omega) x).mpr h)
    · exact Or.inr (Or.inl ⟨i, hi, ((eq_cbVertex_iff m (3 + 17 * i) (by omega) x).mpr h).symm⟩)
    · exact Or.inr (Or.inr ⟨(i, j), ⟨hi, hj⟩,
        ((eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) x).mpr h).symm⟩)

end E993Transport
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma E993Transport.cbLowerWitness_card 81eb43e5d08e28a05864c8f97796e1cc447167fb12f3d2795ec974c9df7335d7
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbLowerWitness_card (m : ℕ) : (cbLowerWitness m).card = 9 * m + 1 := by
  unfold cbLowerWitness
  have hnotmem : cbVertex m 1 ∉
      ((Finset.range m).image (fun i => cbVertex m (3 + 17 * i)) ∪
        ((Finset.range m ×ˢ Finset.range 8).image
          (fun p => cbVertex m (3 + 17 * p.1 + 2 + 2 * p.2)))) := by
    simp only [Finset.mem_union, Finset.mem_image, Finset.mem_range, Finset.mem_product,
      not_or]
    constructor
    · rintro ⟨i, hi, hix⟩
      have := congrArg Fin.val hix
      rw [cbVertex_val m 1 (by omega), cbVertex_val m (3 + 17 * i) (by omega)] at this
      omega
    · rintro ⟨⟨i, j⟩, ⟨hi, hj⟩, hix⟩
      have := congrArg Fin.val hix
      rw [cbVertex_val m 1 (by omega), cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)] at this
      omega
  rw [Finset.card_insert_of_notMem hnotmem]
  have hdisj : Disjoint ((Finset.range m).image (fun i => cbVertex m (3 + 17 * i)))
      ((Finset.range m ×ˢ Finset.range 8).image
        (fun p => cbVertex m (3 + 17 * p.1 + 2 + 2 * p.2))) := by
    rw [Finset.disjoint_left]
    rintro x hx1 hx2
    simp only [Finset.mem_image, Finset.mem_range] at hx1
    simp only [Finset.mem_image, Finset.mem_range, Finset.mem_product] at hx2
    obtain ⟨i, hi, hix1⟩ := hx1
    obtain ⟨⟨i', j'⟩, ⟨hi', hj'⟩, hix2⟩ := hx2
    have e1 := congrArg Fin.val hix1
    have e2 := congrArg Fin.val hix2
    rw [cbVertex_val m (3 + 17 * i) (by omega)] at e1
    rw [cbVertex_val m (3 + 17 * i' + 2 + 2 * j') (by omega)] at e2
    omega
  rw [Finset.card_union_of_disjoint hdisj]
  have hc1 : ((Finset.range m).image (fun i => cbVertex m (3 + 17 * i))).card = m := by
    rw [Finset.card_image_of_injOn, Finset.card_range]
    intro a ha b hb hab
    simp only [Finset.coe_range, Set.mem_Iio] at ha hb
    have := congrArg Fin.val hab
    rw [cbVertex_val m (3 + 17 * a) (by omega), cbVertex_val m (3 + 17 * b) (by omega)] at this
    omega
  have hc2 : ((Finset.range m ×ˢ Finset.range 8).image
      (fun p => cbVertex m (3 + 17 * p.1 + 2 + 2 * p.2))).card = 8 * m := by
    rw [Finset.card_image_of_injOn]
    · rw [Finset.card_product, Finset.card_range, Finset.card_range]; ring
    · rintro ⟨a1, a2⟩ ha ⟨b1, b2⟩ hb hab
      simp only [Finset.coe_product, Finset.coe_range, Set.mem_prod, Set.mem_Iio] at ha hb
      have := congrArg Fin.val hab
      rw [cbVertex_val m (3 + 17 * a1 + 2 + 2 * a2) (by omega),
          cbVertex_val m (3 + 17 * b1 + 2 + 2 * b2) (by omega)] at this
      have : a1 = b1 ∧ a2 = b2 := by omega
      rw [this.1, this.2]
  rw [hc1, hc2]; ring

end E993Transport
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma E993Transport.cbLowerWitness_isIndepSet fba0ec3ac22a72f983f562fcd18c1e7e57508825c81e5a579a17cc912ad66fa8
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbLowerWitness_isIndepSet (m : ℕ) :
    (cbGraph m).IsIndepSet (cbLowerWitness m : Set (Fin (17 * m + 3))) := by
  intro x hx y hy hxy hadj
  rw [Finset.mem_coe, mem_cbLowerWitness_iff] at hx hy
  rw [cbGraph_adj_iff_val] at hadj
  unfold cbEdge at hadj
  rcases hx with hx | ⟨i, hi, hx⟩ | ⟨i, hi, j, hj, hx⟩ <;>
    rcases hy with hy | ⟨i', hi', hy⟩ | ⟨i', hi', j', hj', hy⟩ <;>
    rcases hadj with
      (h' | h' | ⟨k, hk, h' | ⟨l, hl, h' | h'⟩⟩) | (h' | h' | ⟨k, hk, h' | ⟨l, hl, h' | h'⟩⟩) <;>
    omega

end E993Transport
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma E993Transport.cbGraph_indepNum_ge bf927ff0d6741dfc9ba9b5cdd67289d0e30ce5c7e7a67878ee99a7984ad4b79e
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_indepNum_ge (m : ℕ) : 9 * m + 1 ≤ (cbGraph m).indepNum := by
  have h := (cbLowerWitness_isIndepSet m).card_le_indepNum
  rwa [cbLowerWitness_card] at h

end E993Transport
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma E993Transport.cbGraph_indepNum_le 7ad8cddfaefe335d060cf135661a92fe017181e48292d11778bef7809e4d3afa
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_indepNum_le (m : ℕ) (hm : 0 < m) (S : Finset (Fin (17 * m + 3)))
    (hS : (cbGraph m).IsIndepSet (S : Set (Fin (17 * m + 3)))) : S.card ≤ 9 * m + 1 := by
  classical
  have hnotadj : ∀ x ∈ S, ∀ y ∈ S, x ≠ y → ¬ (cbGraph m).Adj x y := by
    intro x hx y hy hxy hadj
    exact hS (Finset.mem_coe.mpr hx) (Finset.mem_coe.mpr hy) hxy hadj
  -- CellA := {r} ∪ {u_i : i<m}: |S ∩ CellA| ≤ m.
  set SA := S.filter (fun x => x.val = 0 ∨ ∃ i < m, x.val = 3 + 17 * i) with hSAdef
  have hSAcard : SA.card ≤ m := by
    by_cases hr : cbVertex m 0 ∈ S
    · have hsub : SA ⊆ {cbVertex m 0} := by
        intro x hx
        rw [hSAdef, Finset.mem_filter] at hx
        obtain ⟨hxS, hxcell⟩ := hx
        rcases hxcell with h0 | ⟨i, hi, hc⟩
        · exact Finset.mem_singleton.mpr ((eq_cbVertex_iff m 0 (by omega) x).mpr h0)
        · exfalso
          apply hnotadj (cbVertex m 0) hr x hxS
          · intro he
            have hval := congrArg Fin.val he
            rw [cbVertex_val m 0 (by omega)] at hval
            omega
          · have hxeq : x = cbVertex m (3 + 17 * i) :=
              (eq_cbVertex_iff m (3 + 17 * i) (by omega) x).mpr hc
            rw [hxeq]; exact cbGraph_adj_r_choke m i hi
      calc SA.card ≤ ({cbVertex m 0} : Finset _).card := Finset.card_le_card hsub
        _ = 1 := Finset.card_singleton _
        _ ≤ m := hm
    · have hsub : SA ⊆ (Finset.range m).image (fun i => cbVertex m (3 + 17 * i)) := by
        intro x hx
        rw [hSAdef, Finset.mem_filter] at hx
        obtain ⟨hxS, hxcell⟩ := hx
        rcases hxcell with h0 | ⟨i, hi, hc⟩
        · exfalso; exact hr (((eq_cbVertex_iff m 0 (by omega) x).mpr h0) ▸ hxS)
        · simp only [Finset.mem_image, Finset.mem_range]
          exact ⟨i, hi, ((eq_cbVertex_iff m (3 + 17 * i) (by omega) x).mpr hc).symm⟩
      calc SA.card ≤ ((Finset.range m).image (fun i => cbVertex m (3 + 17 * i))).card :=
            Finset.card_le_card hsub
        _ ≤ (Finset.range m).card := Finset.card_image_le
        _ = m := Finset.card_range m
  -- CellB := {s,v}: |S ∩ CellB| ≤ 1.
  set SB := S.filter (fun x => x.val = 1 ∨ x.val = 2) with hSBdef
  have hSBcard : SB.card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    rw [hSBdef, Finset.mem_filter] at hx hy
    by_contra hne
    rcases hx.2 with hx1 | hx1 <;> rcases hy.2 with hy1 | hy1
    · exact hne ((eq_cbVertex_iff m 1 (by omega) x).mpr hx1 ▸
        ((eq_cbVertex_iff m 1 (by omega) y).mpr hy1).symm ▸ rfl)
    · apply hnotadj x hx.1 y hy.1 hne
      have hxeq : x = cbVertex m 1 := (eq_cbVertex_iff m 1 (by omega) x).mpr hx1
      have hyeq : y = cbVertex m 2 := (eq_cbVertex_iff m 2 (by omega) y).mpr hy1
      rw [hxeq, hyeq]; exact cbGraph_adj_s_v m
    · apply hnotadj x hx.1 y hy.1 hne
      have hxeq : x = cbVertex m 2 := (eq_cbVertex_iff m 2 (by omega) x).mpr hx1
      have hyeq : y = cbVertex m 1 := (eq_cbVertex_iff m 1 (by omega) y).mpr hy1
      rw [hxeq, hyeq]; exact (cbGraph_adj_s_v m).symm
    · exact hne ((eq_cbVertex_iff m 2 (by omega) x).mpr hx1 ▸
        ((eq_cbVertex_iff m 2 (by omega) y).mpr hy1).symm ▸ rfl)
  -- the choke blocks: |S ∩ {b_{ij},c_{ij} : i<m,j<8}| ≤ 8m.
  haveI hSCdec : DecidablePred (fun x : Fin (17 * m + 3) => ∃ i < m, ∃ j < 8,
      x.val = 3 + 17 * i + 1 + 2 * j ∨ x.val = 3 + 17 * i + 2 + 2 * j) :=
    fun x => Classical.propDecidable _
  set SC := S.filter (fun x => ∃ i < m, ∃ j < 8, x.val = 3 + 17 * i + 1 + 2 * j ∨
      x.val = 3 + 17 * i + 2 + 2 * j) with hSCdef
  have hSCcard : SC.card ≤ 8 * m := by
    have hinj : Set.InjOn (fun x : Fin (17 * m + 3) =>
        ((x.val - 3) / 17, ((x.val - 3) % 17 - 1) / 2)) (SC : Set (Fin (17 * m + 3))) := by
      intro x hx y hy hexy
      rw [Finset.mem_coe, hSCdef, Finset.mem_filter] at hx hy
      obtain ⟨hxS, i, hi, j, hj, hx1 | hx1⟩ := hx
      · have hxd : (x.val - 3) / 17 = i ∧ ((x.val - 3) % 17 - 1) / 2 = j := by omega
        obtain ⟨hyS, i', hi', j', hj', hy1 | hy1⟩ := hy
        · have hyd : (y.val - 3) / 17 = i' ∧ ((y.val - 3) % 17 - 1) / 2 = j' := by omega
          simp only [Prod.mk.injEq] at hexy
          have hij : i = i' ∧ j = j' := by omega
          apply Fin.ext; omega
        · have hyd : (y.val - 3) / 17 = i' ∧ ((y.val - 3) % 17 - 1) / 2 = j' := by omega
          exfalso
          simp only [Prod.mk.injEq] at hexy
          have hij : i = i' ∧ j = j' := by omega
          rw [← hij.1, ← hij.2] at hy1
          apply hnotadj x hxS y hyS
          · intro he; have hv := congrArg Fin.val he; omega
          · have hxeqv : x = cbVertex m (3 + 17 * i + 1 + 2 * j) :=
              (eq_cbVertex_iff m (3 + 17 * i + 1 + 2 * j) (by omega) x).mpr hx1
            have hyeqv : y = cbVertex m (3 + 17 * i + 2 + 2 * j) :=
              (eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) y).mpr hy1
            rw [hxeqv, hyeqv]; exact cbGraph_adj_support_leaf m i j hi hj
      · have hxd : (x.val - 3) / 17 = i ∧ ((x.val - 3) % 17 - 1) / 2 = j := by omega
        obtain ⟨hyS, i', hi', j', hj', hy1 | hy1⟩ := hy
        · have hyd : (y.val - 3) / 17 = i' ∧ ((y.val - 3) % 17 - 1) / 2 = j' := by omega
          exfalso
          simp only [Prod.mk.injEq] at hexy
          have hij : i = i' ∧ j = j' := by omega
          rw [← hij.1, ← hij.2] at hy1
          apply hnotadj y hyS x hxS
          · intro he; have hv := congrArg Fin.val he; omega
          · have hxeqv : x = cbVertex m (3 + 17 * i + 2 + 2 * j) :=
              (eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) x).mpr hx1
            have hyeqv : y = cbVertex m (3 + 17 * i + 1 + 2 * j) :=
              (eq_cbVertex_iff m (3 + 17 * i + 1 + 2 * j) (by omega) y).mpr hy1
            rw [hyeqv, hxeqv]; exact cbGraph_adj_support_leaf m i j hi hj
        · have hyd : (y.val - 3) / 17 = i' ∧ ((y.val - 3) % 17 - 1) / 2 = j' := by omega
          simp only [Prod.mk.injEq] at hexy
          have hij : i = i' ∧ j = j' := by omega
          apply Fin.ext; omega
    have hmaps : ∀ x ∈ SC, ((x.val - 3) / 17, ((x.val - 3) % 17 - 1) / 2) ∈
        (Finset.range m ×ˢ Finset.range 8) := by
      intro x hx
      rw [hSCdef, Finset.mem_filter] at hx
      obtain ⟨-, i, hi, j, hj, hx1 | hx1⟩ := hx <;>
        · simp only [Finset.mem_product, Finset.mem_range]
          constructor <;> omega
    have hle := Finset.card_le_card_of_injOn _ hmaps hinj
    rw [Finset.card_product, Finset.card_range, Finset.card_range] at hle
    omega
  -- the three parts cover `S`.
  have hcover : S ⊆ SA ∪ SB ∪ SC := by
    intro x hx
    have hlt := x.isLt
    rcases cb_val_cases m x.val hlt with h0 | h1 | h2 | ⟨i, hi, hc⟩ | ⟨i, hi, j, hj, hb⟩ |
      ⟨i, hi, j, hj, hl⟩
    · exact Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_filter.mpr ⟨hx, Or.inl h0⟩))
    · exact Finset.mem_union_left _ (Finset.mem_union_right _ (Finset.mem_filter.mpr ⟨hx, Or.inl h1⟩))
    · exact Finset.mem_union_left _ (Finset.mem_union_right _ (Finset.mem_filter.mpr ⟨hx, Or.inr h2⟩))
    · exact Finset.mem_union_left _ (Finset.mem_union_left _
        (Finset.mem_filter.mpr ⟨hx, Or.inr ⟨i, hi, hc⟩⟩))
    · exact Finset.mem_union_right _ (Finset.mem_filter.mpr ⟨hx, i, hi, j, hj, Or.inl hb⟩)
    · exact Finset.mem_union_right _ (Finset.mem_filter.mpr ⟨hx, i, hi, j, hj, Or.inr hl⟩)
  calc S.card ≤ (SA ∪ SB ∪ SC).card := Finset.card_le_card hcover
    _ ≤ (SA ∪ SB).card + SC.card := Finset.card_union_le _ _
    _ ≤ SA.card + SB.card + SC.card := by
        have := Finset.card_union_le SA SB; omega
    _ ≤ m + 1 + 8 * m := by omega
    _ = 9 * m + 1 := by ring

end E993Transport
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma E993Transport.cbGraph_indepNum_eq 8ee971212cd8f3f6a5d6c4de8be5c30164846ccb835b2d0520e8bc80b4d6589e
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- **The CB(8,m) independence layer.** `α(CB(8,m)) = 9m+1` for `m ≥ 1`
(`SEMANTIC-CONTRACT.md` §2). -/
lemma cbGraph_indepNum_eq (m : ℕ) (hm : 0 < m) : (cbGraph m).indepNum = 9 * m + 1 := by
  refine le_antisymm ?_ (cbGraph_indepNum_ge m)
  obtain ⟨S, hS⟩ := (cbGraph m).exists_isNIndepSet_indepNum
  rw [← hS.card_eq]
  exact cbGraph_indepNum_le m hm S hS.isIndepSet

end E993Transport
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma E993Transport.cb_isGraphLeaf_v e49f1a84103beba2d285fc4efd8392f22de144fe0001be4ecfc310bc11bd75cc
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
lemma cb_isGraphLeaf_v (m : ℕ) : C4LA1.IsGraphLeaf (cbGraph m) (cbVertex m 2) :=
  cb_isGraphLeaf_of_cases m (cbVertex m 2) (Or.inl (cbVertex_val m 2 (by omega)))

end E993Transport
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma E993Transport.cb_isGraphLeaf_leaf 1ff1b6171b81dfe6ccb4ca414f26fd7a1586a8ca9e85be7eef4c2c7ecf904ec9
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
lemma cb_isGraphLeaf_leaf (m i j : ℕ) (hi : i < m) (hj : j < 8) :
    C4LA1.IsGraphLeaf (cbGraph m) (cbVertex m (3 + 17 * i + 2 + 2 * j)) :=
  cb_isGraphLeaf_of_cases m _
    (Or.inr ⟨i, hi, j, hj, cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)⟩)

end E993Transport
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma E993Transport.mem_cb_tagWitnesses_v_iff 8804e7929fd5f35670ec76606845bdecf3a8296c4874da5577ed4c86a8105c7e
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma`; the unused binder `(hm : 0 < m)` dropped (synthesis C1-LA2 statement set; U adjudicator AG-U-A precondition).
/-- **`W_v = {r}`.** -/
lemma mem_cb_tagWitnesses_v_iff (m : ℕ) (w : Fin (17 * m + 3)) :
    w ∈ tagWitnesses (cbGraph m) (cbVertex m 2) ↔ w.val = 0 := by
  rw [mem_tagWitnesses_iff_of_adj (cbGraph m) (cbVertex m 2) (cbVertex m 1) w
    (cb_isGraphLeaf_v m) (cbGraph_adj_s_v m).symm]
  have hne_iff : w ≠ cbVertex m 2 ↔ w.val ≠ 2 := by
    constructor
    · intro h he; exact h ((eq_cbVertex_iff m 2 (by omega) w).mpr he)
    · intro h he; exact h (he ▸ cbVertex_val m 2 (by omega))
  rw [hne_iff, cbGraph_adj_iff_val]
  unfold cbEdge
  rw [cbVertex_val m 1 (by omega)]
  constructor
  · rintro ⟨hne, (h' | h' | ⟨i, -, h' | ⟨j, -, h' | h'⟩⟩) | (h' | h' | ⟨i, -, h' | ⟨j, -, h' | h'⟩⟩)⟩
      <;> omega
  · intro h
    refine ⟨by omega, Or.inr (Or.inl ⟨h, rfl⟩)⟩

end E993Transport
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma E993Transport.mem_cb_tagWitnesses_leaf_iff 0760cb8c5f8d72481f0ddcaa8f6086dbd59e62adb6379126acb9c6942f749945
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- **`W_{c_{ij}} = {u_i}`.** -/
lemma mem_cb_tagWitnesses_leaf_iff (m i j : ℕ) (hi : i < m) (hj : j < 8)
    (w : Fin (17 * m + 3)) :
    w ∈ tagWitnesses (cbGraph m) (cbVertex m (3 + 17 * i + 2 + 2 * j)) ↔ w.val = 3 + 17 * i := by
  rw [mem_tagWitnesses_iff_of_adj (cbGraph m) (cbVertex m (3 + 17 * i + 2 + 2 * j))
    (cbVertex m (3 + 17 * i + 1 + 2 * j)) w (cb_isGraphLeaf_leaf m i j hi hj)
    (cbGraph_adj_support_leaf m i j hi hj).symm]
  have hne_iff : w ≠ cbVertex m (3 + 17 * i + 2 + 2 * j) ↔ w.val ≠ 3 + 17 * i + 2 + 2 * j := by
    constructor
    · intro h he
      exact h ((eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) w).mpr he)
    · intro h he; exact h (he ▸ cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega))
  rw [hne_iff, cbGraph_adj_iff_val]
  unfold cbEdge
  rw [cbVertex_val m (3 + 17 * i + 1 + 2 * j) (by omega)]
  constructor
  · rintro ⟨hne, (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) | (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩)⟩
      <;> omega
  · intro h
    refine ⟨by omega, Or.inr (Or.inr (Or.inr ⟨i, hi, Or.inr ⟨j, hj, Or.inl ⟨h, rfl⟩⟩⟩))⟩

end E993Transport
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma E993Transport.cb_lowWindow dc760df487315f1b58101f378894c5f517ed2e6f7462e2abf39945a34af90d0b
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- the third conjunct of the terminal, from `cbGraph_indepNum_eq` alone. -/
lemma cb_lowWindow (m : ℕ) (hm : 0 < m) :
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 := by
  rw [cbGraph_indepNum_eq m hm]
  omega

end E993Transport
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma E993Transport.cb_leafSet_eq_image faa4b7f4dfddb4189bad0e8fa5f5993f9342a3529872ebf68f291451dcff4c6e
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-T (Claude Opus 5.5), scratch in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cb_leafSet_eq_image (m : ℕ) (hm : 0 < m) :
    C5LA1.leafSet (cbGraph m) =
      insert (cbVertex m 2) ((Finset.range m ×ˢ Finset.range 8).image
        (fun p => cbVertex m (3 + 17 * p.1 + 2 + 2 * p.2))) := by
  ext τ
  rw [mem_leafSet_cbGraph_iff m hm τ, Finset.mem_insert, Finset.mem_image]
  have hlt := τ.isLt
  constructor
  · rintro (h | ⟨i, hi, j, hj, h⟩)
    · exact Or.inl ((eq_cbVertex_iff m 2 (by omega) τ).mpr h)
    · refine Or.inr ⟨(i, j), ?_, ?_⟩
      · simp only [Finset.mem_product, Finset.mem_range]; exact ⟨hi, hj⟩
      · exact ((eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) τ).mpr h).symm
  · rintro (h | ⟨⟨i, j⟩, hij, h⟩)
    · exact Or.inl (h ▸ cbVertex_val m 2 (by omega))
    · simp only [Finset.mem_product, Finset.mem_range] at hij
      refine Or.inr ⟨i, hij.1, j, hij.2, ?_⟩
      rw [← h]; exact cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)

end E993Transport
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma E993Transport.cb_leafSet_card a9128bd9ebf100d728c42691cf45362c0ee2abf8ef1ce2f39d8012e2eaa1ded4
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-T (Claude Opus 5.5), scratch in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
lemma cb_leafSet_card (m : ℕ) (hm : 0 < m) : (C5LA1.leafSet (cbGraph m)).card = 8 * m + 1 := by
  rw [cb_leafSet_eq_image m hm]
  have hnot : cbVertex m 2 ∉ (Finset.range m ×ˢ Finset.range 8).image
      (fun p => cbVertex m (3 + 17 * p.1 + 2 + 2 * p.2)) := by
    simp only [Finset.mem_image, Finset.mem_product, Finset.mem_range, not_exists, not_and]
    rintro ⟨i, j⟩ ⟨hi, hj⟩ h
    have := congrArg Fin.val h
    rw [cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega), cbVertex_val m 2 (by omega)] at this
    omega
  rw [Finset.card_insert_of_notMem hnot, Finset.card_image_of_injOn]
  · rw [Finset.card_product, Finset.card_range, Finset.card_range]; ring
  · rintro ⟨a1, a2⟩ ha ⟨b1, b2⟩ hb hab
    simp only [Finset.coe_product, Finset.coe_range, Set.mem_prod, Set.mem_Iio] at ha hb
    have := congrArg Fin.val hab
    rw [cbVertex_val m (3 + 17 * a1 + 2 + 2 * a2) (by omega),
        cbVertex_val m (3 + 17 * b1 + 2 + 2 * b2) (by omega)] at this
    have : a1 = b1 ∧ a2 = b2 := by omega
    rw [this.1, this.2]

end E993Transport
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma E993Transport.favorableLeaves_eq_leafSet_of_all dd382623d12aa41b616927c1fd5fc78b5f38325e09bae5cb8bbec83c639330a2
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-F (Claude Opus 5.5), scratch `Audit.lean` critic section (C-U1-F lean-check).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- critic (graph-generic): if every original leaf is strictly favorable at `p`, the selector is the whole leaf set.
This is the exact shape in which the favorability key must enter the terminal's fourth conjunct. -/
lemma favorableLeaves_eq_leafSet_of_all {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (h : ∀ v ∈ C5LA1.leafSet G, C4LA1.IsFavorableAt G v p) :
    favorableLeaves G p = C5LA1.leafSet G := by
  classical
  unfold favorableLeaves
  exact Finset.filter_true_of_mem h

end E993Transport
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma E993Transport.mem_neighborFinset_choke_iff 1cca2da81fcd6303f0df5590affc964b75473f52991d6b83102d10a27f11c124
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-F (Claude Opus 5.5), scratch `Audit.lean` critic section (C-U1-F lean-check).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- critic: the neighbourhood of a choke, `N(u_i) = {r} ∪ {b_{ij} : j < 8}` (consumed by the switch relation
`|N(u) ∩ B| = 2` of `transportRel`). -/
lemma mem_neighborFinset_choke_iff (m i : ℕ) (hi : i < m) (w : Fin (17 * m + 3)) :
    w ∈ (cbGraph m).neighborFinset (cbVertex m (3 + 17 * i)) ↔
      w.val = 0 ∨ ∃ j < 8, w.val = 3 + 17 * i + 1 + 2 * j := by
  rw [SimpleGraph.mem_neighborFinset, cbGraph_adj_iff_val]
  unfold cbEdge
  rw [cbVertex_val m (3 + 17 * i) (by omega)]
  have hlt := w.isLt
  constructor
  · rintro ((h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) | (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩))
    all_goals first
      | omega
      | (right; exact ⟨j', hj', by omega⟩)
  · rintro (h | ⟨j, hj, h⟩)
    · exact Or.inr (Or.inr (Or.inr ⟨i, hi, Or.inl ⟨h, rfl⟩⟩))
    · exact Or.inl (Or.inr (Or.inr ⟨i, hi, Or.inr ⟨j, hj, Or.inl ⟨rfl, h⟩⟩⟩))

end E993Transport
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma E993Transport.mem_neighborFinset_root_iff 8e28d4f326b15eda940000970abbeb1d3c5e08a32cfb576a5160c81b0a43f436
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-F (Claude Opus 5.5), scratch `Audit.lean` critic section (C-U1-F lean-check).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- critic: the neighbourhood of the root, `N(r) = {s} ∪ {u_i : i < m}`. -/
lemma mem_neighborFinset_root_iff (m : ℕ) (w : Fin (17 * m + 3)) :
    w ∈ (cbGraph m).neighborFinset (cbVertex m 0) ↔ w.val = 1 ∨ ∃ i < m, w.val = 3 + 17 * i := by
  rw [SimpleGraph.mem_neighborFinset, cbGraph_adj_iff_val]
  unfold cbEdge
  rw [cbVertex_val m 0 (by omega)]
  have hlt := w.isLt
  constructor
  · rintro ((h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) | (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩))
    all_goals first
      | omega
      | (right; exact ⟨i', hi', by omega⟩)
  · rintro (h | ⟨i, hi, h⟩)
    · exact Or.inl (Or.inl ⟨rfl, h⟩)
    · exact Or.inl (Or.inr (Or.inr ⟨i, hi, Or.inl ⟨rfl, h⟩⟩))

end E993Transport
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma E993Transport.choke_degree 65e31c48b81b8ee78c9b042ff74e06cfe31c46c4c4a5a624dae84ed2a8b4db7b
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-F (Claude Opus 5.5), scratch `Audit.lean` critic section (C-U1-F lean-check).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- critic: the choke degree, `deg(u_i) = 9`. -/
lemma choke_degree (m i : ℕ) (hi : i < m) :
    (cbGraph m).degree (cbVertex m (3 + 17 * i)) = 9 := by
  rw [← SimpleGraph.card_neighborFinset_eq_degree]
  have hEq : (cbGraph m).neighborFinset (cbVertex m (3 + 17 * i)) =
      insert (cbVertex m 0) ((Finset.range 8).image (fun j => cbVertex m (3 + 17 * i + 1 + 2 * j))) := by
    ext w
    rw [mem_neighborFinset_choke_iff m i hi w]
    have hlt := w.isLt
    simp only [Finset.mem_insert, Finset.mem_image, Finset.mem_range]
    constructor
    · rintro (h | ⟨j, hj, h⟩)
      · exact Or.inl ((eq_cbVertex_iff m 0 (by omega) w).mpr h)
      · exact Or.inr ⟨j, hj, ((eq_cbVertex_iff m _ (by omega) w).mpr h).symm⟩
    · rintro (h | ⟨j, hj, h⟩)
      · exact Or.inl (h ▸ cbVertex_val m 0 (by omega))
      · exact Or.inr ⟨j, hj, h ▸ cbVertex_val m _ (by omega)⟩
  rw [hEq, Finset.card_insert_of_notMem, Finset.card_image_of_injOn, Finset.card_range]
  · intro a ha b hb hab
    simp only [Finset.coe_range, Set.mem_Iio] at ha hb
    have := congrArg Fin.val hab
    rw [cbVertex_val m (3 + 17 * i + 1 + 2 * a) (by omega),
        cbVertex_val m (3 + 17 * i + 1 + 2 * b) (by omega)] at this
    omega
  · simp only [Finset.mem_image, Finset.mem_range, not_exists, not_and]
    intro j hj h
    have := congrArg Fin.val h
    rw [cbVertex_val m (3 + 17 * i + 1 + 2 * j) (by omega), cbVertex_val m 0 (by omega)] at this
    omega

end E993Transport
-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN theorem E993Transport.cb8_topRank_of_descent_and_flow df7623e2a304e4ddb27ad2af312142983c465836366f8fd95c09e39cd038fea9
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-T (Claude Opus 5.5), scratch in C-U1-T `CriticAdvance.lean` (c94ef3bd…); the SOLUTION-CONTRACT §2 terminal reduced to conjuncts 2 and 4.
/-- The SOLUTION-CONTRACT §2 terminal, verbatim, reduced to its two open conjuncts. -/
theorem cb8_topRank_of_descent_and_flow (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2)
    (hE : C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3)
    (hH : ∃ f, IsSaturatingFlow (cbGraph m)
      (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f) :
    (cbGraph m).IsTree ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f :=
  ⟨cbGraph_isTree m, hE, cb_lowWindow m (by omega), hH⟩

end E993Transport
-- VERITYOS ENTRY 78 END

