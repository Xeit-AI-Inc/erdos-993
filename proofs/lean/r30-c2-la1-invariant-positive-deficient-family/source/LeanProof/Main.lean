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

-- VERITYOS ENTRY 22 BEGIN definition E993Transport.famMap 0072baac5b2a65b21aede9c79e8891f86bdef34d2980e9a53208382cf7977d91
-- r30 C2-LA1: NEW vocabulary definition (part of the terminal statement), in the exact form frozen
-- by cycles/cycle-2/stage6/SYNTHESIS.md (`## Lean awards`, C2-LA1):
--   famMap G γ X := X.map ⟨fun s => s.map γ.toEquiv.toEmbedding, _⟩
-- The injectivity proof `Finset.map_injective _` is the one C-U1-T's `setEmb` used
-- (sources/c2-stage7-sources/C-U1-T-CritINV.lean, lines 22-28); `setEmb` is folded in, not carried.
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- the induced action of an automorphism `γ` on source/target families: the image under `γ` of each
member set, and nothing wider. -/
def famMap (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G) (X : Finset (Finset V)) :
    Finset (Finset V) :=
  X.map ⟨fun s => s.map γ.toEquiv.toEmbedding, Finset.map_injective _⟩

end E993Transport
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN definition E993Transport.covered 5a7272b7318c108850de92e0d1b9c9e41d4497c119ede7ea146cea41ba520cf0
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 227-229. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: one line break inserted between `noncomputable` and `def` (the registrar's declaration regex needs `def` at line start; C1-LA1's style); whitespace only, every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The targets reachable from a source subfamily `X`: `N(X)` of SEMANTIC-CONTRACT §1.2. -/
noncomputable
def covered (X : Finset (Finset V)) : Finset (Finset V) :=
  (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A)

end E993Transport
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN definition E993Transport.cov 79c740a956373838c59f7b828443f589661e3cae84230b416b8a268947eebb9c
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 231-233. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: one line break inserted between `noncomputable` and `def` (the registrar's declaration regex needs `def` at line start; C1-LA1's style); whitespace only, every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The total capacity reachable from `X`. -/
noncomputable
def cov (X : Finset (Finset V)) : ℕ :=
  ∑ A ∈ covered G p X, activeWeight G F A

end E993Transport
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN definition E993Transport.supply e981d867eed11f032fe42f04adfab048d213b00a6d921368dca040478b7cf2d7
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 235-237. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: one line break inserted between `noncomputable` and `def` (the registrar's declaration regex needs `def` at line start; C1-LA1's style); whitespace only, every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The total supply of `X`. -/
noncomputable
def supply (X : Finset (Finset V)) : ℕ :=
  ∑ B ∈ X, activeWeight G F B

end E993Transport
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN definition E993Transport.phi 402536db4c2a08c851c51a5300b19cb539a8d2ffb7061db2ee7310fcf6298d3c
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 239-243. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: one line break inserted between `noncomputable` and `def` (the registrar's declaration regex needs `def` at line start; C1-LA1's style); whitespace only, every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The deficiency function of SEMANTIC-CONTRACT §1.2/§2 (WeightedHall, (INV)):
`φ(X) = Σ_X w_F − Σ_{N(X)} w_F`. `WeightedHall` says `φ(X) ≤ 0` for every `X`; a deficient
cut (CUT)/a Hall violator is an `X` with `φ(X) > 0`. -/
noncomputable
def phi (X : Finset (Finset V)) : ℤ :=
  (supply G F X : ℤ) - (cov G F p X : ℤ)

end E993Transport
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN definition E993Transport.domain 7dfc3846302a694014b66cb07308bf1a7121d367355fa91b355276402f736e0b
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 314-315. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The finite domain of source subfamilies at rank `p`: every subset of the source layer. -/
def domain : Finset (Finset (Finset V)) := (indepFamily G (p + 1)).powerset

end E993Transport
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN definition E993Transport.maxPhi 4fa71b0c0c71027117b594d26838d3e3bcf17a7a548afc2bd1c1be10bce21e70
-- r30 C2-LA1: re-derived from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 319-320. Author: r30 U1
-- (Claude Sonnet 5). Adaptation: the nonemptiness witness `domain_nonempty G p` (a lemma, lines 317) is
-- inlined as its own proof term `⟨∅, Finset.empty_mem_powerset _⟩`, because the registrar orders every
-- definition before every lemma. The value is unchanged (proof irrelevance).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The maximum value of `φ` over the whole domain (always `≥ φ(∅) = 0`, since `∅ ∈ domain`). -/
noncomputable
def maxPhi : ℤ := (domain G p).sup' ⟨∅, Finset.empty_mem_powerset _⟩ (phi G F p)

end E993Transport
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN definition E993Transport.maximizers 0f1ec8e0a4b322f6872b4509b6445569b35ca73c606fc8b2e6ffe7bf73dacc32
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 322-324. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: one line break inserted between `noncomputable` and `def` (the registrar's declaration regex needs `def` at line start; C1-LA1's style); whitespace only, every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The (nonempty) finset of maximizers. -/
noncomputable
def maximizers : Finset (Finset (Finset V)) :=
  (domain G p).filter (fun X => phi G F p X = maxPhi G F p)

end E993Transport
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN definition E993Transport.canonMin a891a9957dd56410a6c26c6e0a696f953b6479017a3f79657f19f21a21ca4e9c
-- r30 C2-LA1: re-derived from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 367-370. Author: r30 U1
-- (Claude Sonnet 5). Adaptation: the nonemptiness witness `maximizers_nonempty G F p` (a lemma, lines
-- 326-328) is inlined as its own proof, with `domain_nonempty G p` inlined likewise, because the registrar
-- orders every definition before every lemma. The value is unchanged (proof irrelevance).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The canonical least maximizer `X_min := ⋂ (maximizers)` — a maximizer itself, by iterating
`isMaximizer_inter` over the finite family via `Finset.inf'_induction`. -/
noncomputable
def canonMin : Finset (Finset V) :=
  (maximizers G F p).inf'
    (by
      obtain ⟨X, hX, hXeq⟩ := Finset.exists_mem_eq_sup'
        (⟨∅, Finset.empty_mem_powerset _⟩ : (domain G p).Nonempty) (phi G F p)
      exact ⟨X, Finset.mem_filter.mpr ⟨hX, hXeq.symm⟩⟩)
    id

end E993Transport
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma E993Transport.isGraphLeaf_of_mem_favorableLeaves 8977fb83111a46cace690984e23e2ffd54e2ea5233712bfeeca579f1debf75c8
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
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma E993Transport.isIndepSet_map_aut 0218c4510d98bfd14545876f948ed1c4fc21dfad121c5968862d6a30f2185208
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 40-53. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- An automorphism of `G` preserves independence of finite vertex sets. -/
lemma isIndepSet_map_aut (s : Finset V) :
    G.IsIndepSet ((s.map γ.toEquiv.toEmbedding : Finset V) : Set V) ↔ G.IsIndepSet (s : Set V) := by
  simp only [SimpleGraph.isIndepSet_iff, Set.Pairwise, Finset.coe_map, Set.mem_image,
    Finset.mem_coe, Equiv.coe_toEmbedding, RelIso.coe_fn_toEquiv]
  constructor
  · rintro h a ha b hb hab
    have hne : γ a ≠ γ b := fun he => hab (γ.injective he)
    have := h ⟨a, ha, rfl⟩ ⟨b, hb, rfl⟩ hne
    rwa [γ.map_rel_iff] at this
  · rintro h a ⟨a', ha', rfl⟩ b ⟨b', hb', rfl⟩ hab
    have hab' : a' ≠ b' := fun he => hab (by rw [he])
    have := h ha' hb' hab'
    rwa [γ.map_rel_iff]

end E993Transport
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma E993Transport.neighborFinset_map_aut 55722f0f2fde567d98d11288759dfbf9bcd06edef609d223faf006833b15daae
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 55-67. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- The neighbour finset moves along an automorphism: `N(γ u) = γ '' N(u)`. -/
lemma neighborFinset_map_aut (u : V) :
    (G.neighborFinset u).map γ.toEquiv.toEmbedding = G.neighborFinset (γ u) := by
  ext w
  simp only [Finset.mem_map, SimpleGraph.mem_neighborFinset, Equiv.coe_toEmbedding,
    RelIso.coe_fn_toEquiv]
  constructor
  · rintro ⟨w', hw', rfl⟩
    exact γ.map_rel_iff.mpr hw'
  · intro hw
    refine ⟨γ.symm w, ?_, γ.apply_symm_apply w⟩
    have h2 : G.Adj (γ u) (γ (γ.symm w)) := by rw [γ.apply_symm_apply]; exact hw
    exact γ.map_rel_iff.mp h2

end E993Transport
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma E993Transport.isGraphLeaf_map_aut 27fb04f91f99e571864377bc2c9dda81bdaa5982304b077d1fa5934da2f8a9b5
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 69-84. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- An automorphism preserves the leaf property. -/
lemma isGraphLeaf_map_aut (v : V) :
    C4LA1.IsGraphLeaf G (γ v) ↔ C4LA1.IsGraphLeaf G v := by
  unfold C4LA1.IsGraphLeaf
  constructor
  · rintro ⟨u, hu, huniq⟩
    refine ⟨γ.symm u, γ.map_rel_iff.mp (by rwa [γ.apply_symm_apply]), ?_⟩
    intro w hw
    have := huniq (γ w) (γ.map_rel_iff.mpr hw)
    exact γ.injective (by rw [γ.apply_symm_apply]; exact this)
  · rintro ⟨u, hu, huniq⟩
    refine ⟨γ u, γ.map_rel_iff.mpr hu, ?_⟩
    intro w hw
    have hw' : G.Adj v (γ.symm w) := γ.map_rel_iff.mp (by rwa [γ.apply_symm_apply])
    have := huniq (γ.symm w) hw'
    rw [← this, γ.apply_symm_apply]

end E993Transport
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma E993Transport.support_spec 5b8bd4a85c06e95592b5642cffb47b09a65b5d12a5283da9df27ba9968303787
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 86-95. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- The defining spec of `support`, re-derived with a fresh (defeq, by `Prop` proof
irrelevance) witness of the same existence statement so `Classical.choose_spec` unifies without
a higher-order metavariable. -/
lemma support_spec (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    G.Adj v (C5LA1.support G v) ∧ ∀ w, G.Adj v w → w = C5LA1.support G v := by
  have hex : ∃ u, C4LA1.IsGraphLeaf G v → G.Adj v u ∧ ∀ w, G.Adj v w → w = u := by
    obtain ⟨u, hu, huniq⟩ := hv
    exact ⟨u, fun _ => ⟨hu, huniq⟩⟩
  unfold C5LA1.support
  exact Classical.choose_spec hex hv

end E993Transport
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma E993Transport.support_map_aut 671013bdf19cf09c6551b7d227e4d40a8586bddbf37f1b1b3a9eba330caaeda0
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 97-104. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- `support` commutes with an automorphism on leaves: `s_{γ v} = γ (s_v)`. -/
lemma support_map_aut (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    C5LA1.support G (γ v) = γ (C5LA1.support G v) := by
  have hv' : C4LA1.IsGraphLeaf G (γ v) := (isGraphLeaf_map_aut G γ v).mpr hv
  have h1 : G.Adj v (C5LA1.support G v) := (support_spec G v hv).1
  have huniq' : ∀ w, G.Adj (γ v) w → w = C5LA1.support G (γ v) := (support_spec G (γ v) hv').2
  have h3 : G.Adj (γ v) (γ (C5LA1.support G v)) := γ.map_rel_iff.mpr h1
  exact (huniq' _ h3).symm

end E993Transport
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma E993Transport.tagWitnesses_map_aut 1671788dfd616725f1dd885f3a60d9b82f9cbac4b03f228f9b1be81b5c9ee5c5
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 106-111. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- `W_{γ v} = γ '' W_v` (as a `Finset.map`). -/
lemma tagWitnesses_map_aut (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    (tagWitnesses G v).map γ.toEquiv.toEmbedding = tagWitnesses G (γ v) := by
  unfold E993Transport.tagWitnesses
  rw [Finset.map_erase, neighborFinset_map_aut G γ (C5LA1.support G v), support_map_aut G γ v hv]
  simp

end E993Transport
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma E993Transport.mem_leafSet_iff f134eff74e3c1ac28ac53feee79e696c47cd347804ab557f888504b837efb575
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 113-115. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- Membership in `leafSet` unfolds to `IsGraphLeaf`. -/
lemma mem_leafSet_iff (v : V) : v ∈ C5LA1.leafSet G ↔ C4LA1.IsGraphLeaf G v := by
  unfold C5LA1.leafSet; simp

end E993Transport
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma E993Transport.vertexDeletionIndepSetCount_map_aut 788c9f7b87b9cf67befd6279a725c5dba440f3f08103eef13c4fefd91c9c17c4
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 131-145. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- `vertexDeletionIndepSetCount` is `Aut`-invariant: deleting `v` and deleting `γ v` give the
same count, since `γ` restricts to a bijection between `k`-subsets of `univ.erase v` and of
`univ.erase (γ v)` that preserves independence. -/
lemma vertexDeletionIndepSetCount_map_aut (v : V) (k : ℕ) :
    C4LA1.vertexDeletionIndepSetCount G (γ v) k = C4LA1.vertexDeletionIndepSetCount G v k := by
  unfold C4LA1.vertexDeletionIndepSetCount
  have hset : (Finset.univ.erase v).map γ.toEquiv.toEmbedding = Finset.univ.erase (γ v) := by
    rw [Finset.map_erase, Finset.map_univ_equiv]; simp
  rw [← hset, Finset.powersetCard_map, Finset.filter_map, Finset.card_map]
  congr 1
  apply Finset.filter_congr
  intro t _
  show G.IsIndepSet (((Finset.mapEmbedding γ.toEquiv.toEmbedding).toEmbedding t : Finset V) : Set V) ↔
    G.IsIndepSet (t : Set V)
  simpa [Finset.mapEmbedding_apply] using isIndepSet_map_aut G γ t

end E993Transport
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma E993Transport.isFavorableAt_map_aut 2ac69fe3c20e10e7d1b68ea6b2984d104da1077ecc714c6a9bd334e6c2845129
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 147-151. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- `IsFavorableAt` is `Aut`-invariant at every rank. -/
lemma isFavorableAt_map_aut (v : V) (p : ℕ) :
    C4LA1.IsFavorableAt G (γ v) p ↔ C4LA1.IsFavorableAt G v p := by
  unfold C4LA1.IsFavorableAt C4LA1.vertexDeletionForwardDifference
  rw [vertexDeletionIndepSetCount_map_aut G γ v (p + 1), vertexDeletionIndepSetCount_map_aut G γ v p]

end E993Transport
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma E993Transport.favorableLeaves_map_aut cdaeccdce48aca901d5f318337a2879bd01faee84f0d9f8892d7cf99b9c054fe
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 153-167. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: declaration keyword `theorem` -> `lemma` only (R7: exactly one terminal `theorem`); every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- (a1) `favorableLeaves` is `Aut`-invariant: the smallest unproved node named by the Cycle 1
synthesis (`cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md`, Award group 2). -/
lemma favorableLeaves_map_aut (p : ℕ) :
    (favorableLeaves G p).map γ.toEquiv.toEmbedding = favorableLeaves G p := by
  unfold E993Transport.favorableLeaves
  ext v
  simp only [Finset.mem_map, Finset.mem_filter, Equiv.coe_toEmbedding, RelIso.coe_fn_toEquiv,
    mem_leafSet_iff]
  constructor
  · rintro ⟨v', ⟨hv'leaf, hv'fav⟩, rfl⟩
    exact ⟨(isGraphLeaf_map_aut G γ v').mpr hv'leaf, (isFavorableAt_map_aut G γ v' p).mpr hv'fav⟩
  · intro ⟨hvleaf, hvfav⟩
    refine ⟨γ.symm v, ⟨(isGraphLeaf_map_aut G γ (γ.symm v)).mp (by rwa [γ.apply_symm_apply]),
      (isFavorableAt_map_aut G γ (γ.symm v) p).mp (by rwa [γ.apply_symm_apply])⟩,
      γ.apply_symm_apply v⟩

end E993Transport
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma E993Transport.activeWeight_map_aut ce09d63639fb8cf4c23e5b36e4a10a1b20efd88c596537a5ceffa7b03a0af5d2
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 169-185. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: declaration keyword `theorem` -> `lemma` only (R7: exactly one terminal `theorem`); every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- (a2) `activeWeight` is `Aut`-invariant on a tag set of leaves. -/
lemma activeWeight_map_aut (F B : Finset V) (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v) :
    activeWeight G (F.map γ.toEquiv.toEmbedding) (B.map γ.toEquiv.toEmbedding) =
      activeWeight G F B := by
  unfold E993Transport.activeWeight
  rw [← Finset.map_inter, Finset.filter_map, Finset.card_map]
  congr 1
  apply Finset.filter_congr
  intro v hv
  have hvleaf : C4LA1.IsGraphLeaf G v := hF v (Finset.mem_inter.mp hv).1
  show ¬ Disjoint ((B.map γ.toEquiv.toEmbedding).erase (γ.toEquiv.toEmbedding v))
        (tagWitnesses G (γ.toEquiv.toEmbedding v)) ↔
      ¬ Disjoint (B.erase v) (tagWitnesses G v)
  have step : (B.map γ.toEquiv.toEmbedding).erase (γ.toEquiv.toEmbedding v) =
      (B.erase v).map γ.toEquiv.toEmbedding := (Finset.map_erase _ _ _).symm
  rw [step, show γ.toEquiv.toEmbedding v = γ v from by simp,
    ← tagWitnesses_map_aut G γ v hvleaf, Finset.disjoint_map]

end E993Transport
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma E993Transport.map_map_symm_self a8bb1a8f2cd10e6228d492555ec52bff4f19f78f44a6344c77adfb733100e392
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 187-190. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- Round trip of an automorphism's induced `Finset` map with its inverse. -/
lemma map_map_symm_self (s : Finset V) :
    (s.map γ.toEquiv.toEmbedding).map γ.symm.toEquiv.toEmbedding = s := by
  simp [Finset.map_map, Function.Embedding.trans]

end E993Transport
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma E993Transport.transportRel_map_aut_mp 114a3006970f8ece479216d0b7251ba48795e06921a8c1f435b2f19147092105
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 192-205. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- One direction of `transportRel` equivariance; the general iff follows by applying this to
both `γ` and `γ.symm` (also an automorphism) and cancelling the round trip. -/
lemma transportRel_map_aut_mp (B A : Finset V) (h : transportRel G B A) :
    transportRel G (B.map γ.toEquiv.toEmbedding) (A.map γ.toEquiv.toEmbedding) := by
  unfold E993Transport.transportRel at h ⊢
  rcases h with ⟨q, hq, hA⟩ | ⟨u, huB, hcard, hA⟩
  · exact Or.inl ⟨γ q, Finset.mem_map_of_mem _ hq, by rw [hA, Finset.map_erase]; simp⟩
  · refine Or.inr ⟨γ u, ?_, ?_, ?_⟩
    · simp only [Finset.mem_map, Equiv.coe_toEmbedding, RelIso.coe_fn_toEquiv]
      rintro ⟨w, hw, hwe⟩
      exact huB (γ.injective hwe ▸ hw)
    · rw [← neighborFinset_map_aut G γ u, ← Finset.map_inter, Finset.card_map]
      exact hcard
    · rw [hA, ← neighborFinset_map_aut G γ u, Finset.map_insert, Finset.map_sdiff]; simp

end E993Transport
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma E993Transport.transportRel_map_aut fa934f4b3f3f7c61b6f5348b16858476ce8a55f29de8a6dd4663c844cea3e347
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 207-215. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: declaration keyword `theorem` -> `lemma` only (R7: exactly one terminal `theorem`); every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (γ : G ≃g G)

/-- (a3) `transportRel` is `Aut`-invariant. -/
lemma transportRel_map_aut (B A : Finset V) :
    transportRel G (B.map γ.toEquiv.toEmbedding) (A.map γ.toEquiv.toEmbedding) ↔
      transportRel G B A := by
  constructor
  · intro h
    have h2 := transportRel_map_aut_mp G γ.symm _ _ h
    rwa [map_map_symm_self, map_map_symm_self] at h2
  · exact transportRel_map_aut_mp G γ B A

end E993Transport
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma E993Transport.covered_union 2a287f11cbaebacfa11eb73a38fdebf5fc8e201d749159d1e21a2fc223157a29
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 245-257. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- `N` is exactly union-preserving. -/
lemma covered_union (X Y : Finset (Finset V)) :
    covered G p (X ∪ Y) = covered G p X ∪ covered G p Y := by
  unfold covered
  ext A
  simp only [Finset.mem_filter, Finset.mem_union]
  constructor
  · rintro ⟨hA, B, (h | h), hR⟩
    · exact Or.inl ⟨hA, B, h, hR⟩
    · exact Or.inr ⟨hA, B, h, hR⟩
  · rintro (⟨hA, B, hB, hR⟩ | ⟨hA, B, hB, hR⟩)
    · exact ⟨hA, B, Or.inl hB, hR⟩
    · exact ⟨hA, B, Or.inr hB, hR⟩

end E993Transport
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma E993Transport.covered_inter_subset 1cdc64296db75dee6bc1b2e6b11cd5dbb851f1e078792c1b1a99c6c2cc0d0108
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 259-267. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- `N` is only subset-preserving on intersections, in general. -/
lemma covered_inter_subset (X Y : Finset (Finset V)) :
    covered G p (X ∩ Y) ⊆ covered G p X ∩ covered G p Y := by
  intro A hA
  simp only [covered, Finset.mem_filter] at hA
  obtain ⟨hAlayer, B, hB, hR⟩ := hA
  simp only [Finset.mem_inter] at hB
  simp only [Finset.mem_inter, covered, Finset.mem_filter]
  exact ⟨⟨hAlayer, B, hB.1, hR⟩, ⟨hAlayer, B, hB.2, hR⟩⟩

end E993Transport
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma E993Transport.cov_submodular 0832bf5e84a0a71d62c9b14760a9e01a4119aebb9eb4a667c35436c31109024e
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 269-285. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- (b, coverage submodularity) `cov` is a nonnegative-weighted coverage function of a
union-preserving set map, hence submodular. -/
lemma cov_submodular (X Y : Finset (Finset V)) :
    cov G F p (X ∪ Y) + cov G F p (X ∩ Y) ≤ cov G F p X + cov G F p Y := by
  unfold cov
  have hA : (∑ A ∈ covered G p (X ∪ Y), activeWeight G F A) +
      ∑ A ∈ covered G p X ∩ covered G p Y, activeWeight G F A =
      (∑ A ∈ covered G p X, activeWeight G F A) + ∑ A ∈ covered G p Y, activeWeight G F A := by
    rw [covered_union]; exact Finset.sum_union_inter
  have hB : (∑ A ∈ covered G p (X ∩ Y), activeWeight G F A) ≤
      ∑ A ∈ covered G p X ∩ covered G p Y, activeWeight G F A :=
    Finset.sum_le_sum_of_subset (covered_inter_subset G p X Y)
  calc (∑ A ∈ covered G p (X ∪ Y), activeWeight G F A) +
        ∑ A ∈ covered G p (X ∩ Y), activeWeight G F A
      ≤ (∑ A ∈ covered G p (X ∪ Y), activeWeight G F A) +
          ∑ A ∈ covered G p X ∩ covered G p Y, activeWeight G F A := by gcongr
    _ = (∑ A ∈ covered G p X, activeWeight G F A) + ∑ A ∈ covered G p Y, activeWeight G F A := hA

end E993Transport
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma E993Transport.supply_modular 316fc29399d51476d63d1ae89ea772caa5d95f2fb1eb5b505286e75bf09fbc6b
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 287-290. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The source part of `φ` is modular (exact, no inequality). -/
lemma supply_modular (X Y : Finset (Finset V)) :
    supply G F (X ∪ Y) + supply G F (X ∩ Y) = supply G F X + supply G F Y :=
  Finset.sum_union_inter

end E993Transport
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma E993Transport.phi_supermodular 4bbae797abbbcd45af619f6767f9553257de2598b46de6b470cb8e8c01f7b76c
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 292-300. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: declaration keyword `theorem` -> `lemma` only (R7: exactly one terminal `theorem`); every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- (b) `φ` is supermodular: `φ(X∪Y) + φ(X∩Y) ≥ φ(X) + φ(Y)`. -/
lemma phi_supermodular (X Y : Finset (Finset V)) :
    phi G F p X + phi G F p Y ≤ phi G F p (X ∪ Y) + phi G F p (X ∩ Y) := by
  unfold phi
  have h1 : (supply G F (X ∪ Y) : ℤ) + supply G F (X ∩ Y) = supply G F X + supply G F Y := by
    exact_mod_cast supply_modular G F X Y
  have h2 : (cov G F p (X ∪ Y) : ℤ) + cov G F p (X ∩ Y) ≤ cov G F p X + cov G F p Y := by
    exact_mod_cast cov_submodular G F p X Y
  linarith

end E993Transport
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma E993Transport.isMaximizer_union_inter e63eddece8867130af7f1708e9e2988c895141b947eb69ddd51d915147c71fe0
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 302-312. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: declaration keyword `theorem` -> `lemma` only (R7: exactly one terminal `theorem`); every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- (b, lattice, pairwise form) if `X` and `Y` both attain a common value `M` that also bounds
`φ` above on `X ∪ Y` and `X ∩ Y`, both `X ∪ Y` and `X ∩ Y` attain `M` too. This is the content
of "the maximizers of a supermodular function form a lattice", stated without first having to
name an ambient domain. -/
lemma isMaximizer_union_inter {M : ℤ} (X Y : Finset (Finset V))
    (hX : phi G F p X = M) (hY : phi G F p Y = M)
    (hub : phi G F p (X ∪ Y) ≤ M) (hub' : phi G F p (X ∩ Y) ≤ M) :
    phi G F p (X ∪ Y) = M ∧ phi G F p (X ∩ Y) = M := by
  have h := phi_supermodular G F p X Y
  rw [hX, hY] at h
  constructor <;> omega

end E993Transport
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma E993Transport.domain_nonempty a9dd9ed5792d5ae3b932be2cc8186180b88f0b95e750995c2565ef020079d701
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 317-317. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

lemma domain_nonempty : (domain G p).Nonempty := ⟨∅, Finset.empty_mem_powerset _⟩

end E993Transport
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma E993Transport.maximizers_nonempty f44ad9de98f03483d513c00d326b3e2717c00bdca148d37b14d0e21da76cb318
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 326-328. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

lemma maximizers_nonempty : (maximizers G F p).Nonempty := by
  obtain ⟨X, hX, hXeq⟩ := Finset.exists_mem_eq_sup' (domain_nonempty G p) (phi G F p)
  exact ⟨X, Finset.mem_filter.mpr ⟨hX, hXeq.symm⟩⟩

end E993Transport
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma E993Transport.le_maxPhi_of_mem_domain 8f60f64d2df148ca649e6f9500964449bf6ae51375614cb79b92f48eb326d125
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 330-332. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

lemma le_maxPhi_of_mem_domain {X : Finset (Finset V)} (hX : X ∈ domain G p) :
    phi G F p X ≤ maxPhi G F p :=
  Finset.le_sup' (phi G F p) hX

end E993Transport
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma E993Transport.mem_domain_union 6b4743c54c4f1229c7e5d5231c5076cf4dc619086e5c53526d39fba00d3f8ebe
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 334-338. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

lemma mem_domain_union {X Y : Finset (Finset V)} (hX : X ∈ domain G p) (hY : Y ∈ domain G p) :
    X ∪ Y ∈ domain G p := by
  unfold domain at hX hY ⊢
  rw [Finset.mem_powerset] at hX hY ⊢
  exact Finset.union_subset hX hY

end E993Transport
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma E993Transport.mem_domain_inter 1cdae55fce2180c150692ea2152b5b59658cd2a5feb58772f3fb6c9ec9343e87
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 340-343. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

lemma mem_domain_inter {X Y : Finset (Finset V)} (hX : X ∈ domain G p) : X ∩ Y ∈ domain G p := by
  unfold domain at hX ⊢
  rw [Finset.mem_powerset] at hX ⊢
  exact (Finset.inter_subset_left).trans hX

end E993Transport
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma E993Transport.isMaximizer_inter 93df92aa25edf0fb4c6148efd9505453c0ef124391964496b1f80360492b9b2e
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 356-365. Author: r30 U1 (Claude Sonnet 5).
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

/-- The maximizers close under `∩`. -/
lemma isMaximizer_inter {X Y : Finset (Finset V)} (hX : X ∈ maximizers G F p)
    (hY : Y ∈ maximizers G F p) : X ∩ Y ∈ maximizers G F p := by
  simp only [maximizers, Finset.mem_filter] at hX hY ⊢
  obtain ⟨hXd, hXe⟩ := hX
  obtain ⟨hYd, hYe⟩ := hY
  refine ⟨mem_domain_inter G p hXd, ?_⟩
  exact (isMaximizer_union_inter G F p X Y hXe hYe
    (le_maxPhi_of_mem_domain G F p (mem_domain_union G p hXd hYd))
    (le_maxPhi_of_mem_domain G F p (mem_domain_inter G p hXd))).2

end E993Transport
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma E993Transport.canonMin_isMaximizer efd3b98b1384ce8d2b27acdc767aabacfdbc736cb84778fa11d2c83e0dc4658e
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/U1-INV.lean
-- (sha256 174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9), lines 376-378. Author: r30 U1 (Claude Sonnet 5).
-- Adaptation: declaration keyword `theorem` -> `lemma` only (R7: exactly one terminal `theorem`); every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)

lemma canonMin_isMaximizer : canonMin G F p ∈ maximizers G F p :=
  Finset.inf'_induction (maximizers_nonempty G F p) id
    (fun X hX Y hY => isMaximizer_inter G F p hX hY) (fun X hX => hX)

end E993Transport
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma E993Transport.mem_famMap f9edabce19091026268c683d20f0b95a5374edf701f4bebdddffd67610b1004e
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 30-33. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

lemma mem_famMap (γ : G ≃g G) (X : Finset (Finset V)) (A : Finset V) :
    A ∈ famMap G γ X ↔ ∃ B ∈ X, B.map γ.toEquiv.toEmbedding = A := by
  simp only [famMap, Finset.mem_map]
  rfl

end E993Transport
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma E993Transport.map_symm_map_self d01f5b58b1b23ffb974e68cdbc871463e1276f0f12fd30fa694162d4e3a815a2
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 35-37. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

lemma map_symm_map_self (γ : G ≃g G) (s : Finset V) :
    (s.map γ.symm.toEquiv.toEmbedding).map γ.toEquiv.toEmbedding = s := by
  simp [Finset.map_map, Function.Embedding.trans]

end E993Transport
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma E993Transport.mem_indepFamily_map 467dec36b330ddd9329e656c2be6301d32027aac2d30731f1a067d815b391fb4
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 39-44. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

lemma mem_indepFamily_map (γ : G ≃g G) (j : ℕ) (B : Finset V) :
    B.map γ.toEquiv.toEmbedding ∈ indepFamily G j ↔ B ∈ indepFamily G j := by
  unfold indepFamily
  rw [Finset.mem_filter, Finset.mem_filter, Finset.mem_powersetCard, Finset.mem_powersetCard,
    Finset.card_map, isIndepSet_map_aut G γ B]
  simp

end E993Transport
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma E993Transport.covered_famMap 189219f33af782ab5e0c9ce56ed6387a624ad323970ea7be8e49b4a40168254d
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 46-58. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

lemma covered_famMap (γ : G ≃g G) (p : ℕ) (X : Finset (Finset V)) :
    covered G p (famMap G γ X) = famMap G γ (covered G p X) := by
  ext A
  simp only [covered, Finset.mem_filter, mem_famMap]
  constructor
  · rintro ⟨hA, B', ⟨B, hB, rfl⟩, hR⟩
    refine ⟨A.map γ.symm.toEquiv.toEmbedding, ⟨(mem_indepFamily_map G γ.symm p A).2 hA, B, hB, ?_⟩,
      map_symm_map_self G γ A⟩
    have h2 := transportRel_map_aut_mp G γ.symm _ _ hR
    rwa [map_map_symm_self] at h2
  · rintro ⟨A', ⟨hA', B, hB, hR⟩, rfl⟩
    exact ⟨(mem_indepFamily_map G γ p A').2 hA', B.map γ.toEquiv.toEmbedding, ⟨B, hB, rfl⟩,
      (transportRel_map_aut G γ B A').2 hR⟩

end E993Transport
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma E993Transport.activeWeight_map_of_invariant a4fdf241666c9df0acb82b097af5ce586d46fc09c0222a44b2170442bc2a145b
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 60-65. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

lemma activeWeight_map_of_invariant (γ : G ≃g G) (F B : Finset V)
    (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v) (hFinv : F.map γ.toEquiv.toEmbedding = F) :
    activeWeight G F (B.map γ.toEquiv.toEmbedding) = activeWeight G F B := by
  have h := activeWeight_map_aut G γ F B hF
  rw [hFinv] at h
  exact h

end E993Transport
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma E993Transport.supply_famMap 1bd48c950fb804787bf4ff1b82d4e96a9bb7c30f80600ea7871d32ef45ccdeac
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 69-74. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

lemma supply_famMap (γ : G ≃g G) (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v)
    (hFinv : F.map γ.toEquiv.toEmbedding = F) (X : Finset (Finset V)) :
    supply G F (famMap G γ X) = supply G F X := by
  unfold supply famMap
  rw [Finset.sum_map]
  exact Finset.sum_congr rfl fun B _ => activeWeight_map_of_invariant G γ F B hF hFinv

end E993Transport
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma E993Transport.cov_famMap cb28176c0cdb978ad49b451de6c83b190c57410fcbc2665f9dae0f295050c050
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 76-81. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

lemma cov_famMap (γ : G ≃g G) (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v)
    (hFinv : F.map γ.toEquiv.toEmbedding = F) (X : Finset (Finset V)) :
    cov G F p (famMap G γ X) = cov G F p X := by
  unfold cov
  rw [covered_famMap, famMap, Finset.sum_map]
  exact Finset.sum_congr rfl fun A _ => activeWeight_map_of_invariant G γ F A hF hFinv

end E993Transport
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma E993Transport.phi_famMap c5b2c970d9d369075598d3afc159a5b2454eed8af1a5c7e498611af9ddb50ad0
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 83-87. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

lemma phi_famMap (γ : G ≃g G) (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v)
    (hFinv : F.map γ.toEquiv.toEmbedding = F) (X : Finset (Finset V)) :
    phi G F p (famMap G γ X) = phi G F p X := by
  unfold phi
  rw [supply_famMap G F γ hF hFinv, cov_famMap G F p γ hF hFinv]

end E993Transport
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma E993Transport.famMap_mem_domain 31e42b7a9fd7531d477f1c305555a17e955aee02cae60282fc253392398e6814
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 89-95. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

lemma famMap_mem_domain (γ : G ≃g G) {X : Finset (Finset V)} (hX : X ∈ domain G p) :
    famMap G γ X ∈ domain G p := by
  unfold domain at hX ⊢
  rw [Finset.mem_powerset] at hX ⊢
  intro A hA
  obtain ⟨B, hB, rfl⟩ := (mem_famMap G γ X A).1 hA
  exact (mem_indepFamily_map G γ (p + 1) B).2 (hX hB)

end E993Transport
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma E993Transport.famMap_mem_maximizers eb961c1fe4915a605eff6aebbf850a1785a299badd5e4943814c2f8b1bcf6713
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 97-102. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

lemma famMap_mem_maximizers (γ : G ≃g G) (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v)
    (hFinv : F.map γ.toEquiv.toEmbedding = F) {X : Finset (Finset V)}
    (hX : X ∈ maximizers G F p) : famMap G γ X ∈ maximizers G F p := by
  unfold maximizers at hX ⊢
  rw [Finset.mem_filter] at hX ⊢
  exact ⟨famMap_mem_domain G p γ hX.1, by rw [phi_famMap G F p γ hF hFinv]; exact hX.2⟩

end E993Transport
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma E993Transport.card_famMap 93cc12d32d0f4744a8d94b51571dc49390757d9904622a4752b5e49413834924
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 104-105. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

lemma card_famMap (γ : G ≃g G) (X : Finset (Finset V)) : (famMap G γ X).card = X.card :=
  Finset.card_map _

end E993Transport
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma E993Transport.canonMin_famMap 2c437cddc3939ce82b57c8ff27ffde4ac5c6fc4085e3277bb3356f241c3b9a7c
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 107-115. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Adaptation: declaration keyword `theorem` -> `lemma` only (R7: exactly one terminal `theorem`); every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

/-- `X_min` is invariant under every automorphism fixing the tag set. -/
lemma canonMin_famMap (γ : G ≃g G) (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v)
    (hFinv : F.map γ.toEquiv.toEmbedding = F) :
    famMap G γ (canonMin G F p) = canonMin G F p := by
  have hmem := famMap_mem_maximizers G F p γ hF hFinv (canonMin_isMaximizer G F p)
  have hle : canonMin G F p ⊆ famMap G γ (canonMin G F p) := by
    have := Finset.inf'_le (s := maximizers G F p) (f := id) hmem
    exact this
  exact (Finset.eq_of_subset_of_card_le hle (by rw [card_famMap])).symm

end E993Transport
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma E993Transport.covered_mono 6cba1002be4bf6d8cbd88235913b07327073e892fc08810c854d2ced9e34466c
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 127-131. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

lemma covered_mono {X Y : Finset (Finset V)} (h : X ⊆ Y) : covered G p X ⊆ covered G p Y := by
  intro A hA
  simp only [covered, Finset.mem_filter] at hA ⊢
  obtain ⟨h1, B, hB, hR⟩ := hA
  exact ⟨h1, B, h hB, hR⟩

end E993Transport
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma E993Transport.canonMin_pos 41f34ed6b32394c459ada7d40f8c50fb55551cfa95981ef1ba85caa47cfd4b85
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 133-162. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Adaptation: declaration keyword `theorem` -> `lemma` only (R7: exactly one terminal `theorem`); every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

/-- Positivity of `X_min`: every member of the least maximizer carries positive active weight. -/
lemma canonMin_pos : ∀ B ∈ canonMin G F p, 0 < activeWeight G F B := by
  intro B hB
  by_contra h0
  have h0' : activeWeight G F B = 0 := by omega
  have hmax := canonMin_isMaximizer G F p
  have hdom : canonMin G F p ∈ domain G p := (Finset.mem_filter.mp hmax).1
  have hval : phi G F p (canonMin G F p) = maxPhi G F p := (Finset.mem_filter.mp hmax).2
  have hYdom : (canonMin G F p).erase B ∈ domain G p := by
    unfold domain at hdom ⊢
    rw [Finset.mem_powerset] at hdom ⊢
    exact (Finset.erase_subset _ _).trans hdom
  have hsup : supply G F ((canonMin G F p).erase B) = supply G F (canonMin G F p) := by
    unfold supply
    exact Finset.sum_erase _ h0'
  have hcov : cov G F p ((canonMin G F p).erase B) ≤ cov G F p (canonMin G F p) :=
    Finset.sum_le_sum_of_subset (covered_mono G p (Finset.erase_subset _ _))
  have hcovZ : (cov G F p ((canonMin G F p).erase B) : ℤ) ≤ cov G F p (canonMin G F p) := by
    exact_mod_cast hcov
  have hphi : phi G F p (canonMin G F p) ≤ phi G F p ((canonMin G F p).erase B) := by
    unfold phi
    rw [hsup]
    linarith
  have hYmax : (canonMin G F p).erase B ∈ maximizers G F p := by
    refine Finset.mem_filter.mpr ⟨hYdom, ?_⟩
    have h1 := le_maxPhi_of_mem_domain G F p hYdom
    omega
  have hsub : canonMin G F p ⊆ (canonMin G F p).erase B :=
    Finset.inf'_le (s := maximizers G F p) (f := id) hYmax
  exact Finset.notMem_erase B _ (hsub hB)

end E993Transport
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma E993Transport.filter_eq_covered 9a29a3b33379ccee186cfd3084c87ea0147cb391455551483c51609f16a0559d
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 164-171. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

/-- The literal `WeightedHall` target set coincides with `covered`, whatever decidability
instance elaborated the filter. -/
lemma filter_eq_covered (X : Finset (Finset V))
    (inst : DecidablePred fun A => ∃ B ∈ X, transportRel G B A) :
    @Finset.filter _ (fun A => ∃ B ∈ X, transportRel G B A) inst (indepFamily G p) =
      covered G p X := by
  ext A
  simp only [covered, Finset.mem_filter]

end E993Transport
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma E993Transport.weightedHall_iff_phi_nonpos 18f181b429595f281f5e0b731b9de33eeafc9e0230a4b98803813022197a46b8
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 173-192. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Adaptation: declaration keyword `theorem` -> `lemma` only (R7: exactly one terminal `theorem`); every other byte identical.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

/-- `WeightedHall` is exactly "`φ ≤ 0` on the whole domain". -/
lemma weightedHall_iff_phi_nonpos :
    WeightedHall G F p ↔ ∀ X ∈ domain G p, phi G F p X ≤ 0 := by
  unfold WeightedHall
  constructor
  · intro h X hX
    have hXs : X ⊆ indepFamily G (p + 1) := Finset.mem_powerset.mp hX
    have h1 := h X hXs
    rw [filter_eq_covered] at h1
    unfold phi supply cov
    have h2 : ((∑ B ∈ X, activeWeight G F B : ℕ) : ℤ) ≤
        ((∑ A ∈ covered G p X, activeWeight G F A : ℕ) : ℤ) := by exact_mod_cast h1
    linarith
  · intro h X hXs
    have h1 := h X (Finset.mem_powerset.mpr hXs)
    rw [filter_eq_covered]
    unfold phi supply cov at h1
    have h2 : ((∑ B ∈ X, activeWeight G F B : ℕ) : ℤ) ≤
        ((∑ A ∈ covered G p X, activeWeight G F A : ℕ) : ℤ) := by linarith
    exact_mod_cast h2

end E993Transport
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma E993Transport.favorableLeaves_leaf 10999e3f271bc7f7b8ca9d2314e97aa35d38d817ed8471db243c65b50b3414f0
-- r30 C2-LA1 carry: declaration text from sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 194-197. Author: r30 critic C-U1-T (Claude Opus 5.5), critic-derived.
-- Declaration text byte-identical to the origin lines (header/section variables are this fragment's scaffold).
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

/-- `F_p(G)` is invariant under every automorphism (U1's `favorableLeaves_map_aut`), and its
members are leaves (C1-LA1 entry 24). -/
lemma favorableLeaves_leaf (p : ℕ) : ∀ v ∈ favorableLeaves G p, C4LA1.IsGraphLeaf G v :=
  fun _ hv => isGraphLeaf_of_mem_favorableLeaves G hv

end E993Transport
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma E993Transport.weightedHall_iff_invariant 147e76e0f226408a91e6921fb267a77fc01971b8044fed784600db33e4dc226a
-- r30 C2-LA1: companion (no certificate of its own; registers `proved_informal` only).
-- Statement text byte-identical to sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 228-235 (critic-derived,
-- C-U1-T, Claude Opus 5.5), keyword `theorem` -> `lemma` (R7). PROOF RE-DERIVED by the C2-LA1 formalizer:
-- the origin's `(⇐)` cited the terminal theorem, which must be the last registered entry, so `(⇐)` is
-- re-proved directly from `canonMin_famMap`, `canonMin_isMaximizer`, `weightedHall_iff_phi_nonpos`
-- (the same X_min argument, no new mathematics). The `(⇒)` branch is the origin's lines 237-240.
namespace E993Transport

open SimpleGraph
open scoped Classical

variable {V : Type*} [Fintype V] [DecidableEq V]

variable (G : SimpleGraph V) [DecidableRel G.Adj]

variable (F : Finset V) (p : ℕ)

/-- (INV), Hall form for `Γ = Aut(G)`: weighted Hall for the fixed selector holds iff it holds
on every `Aut(G)`-invariant source family. -/
lemma weightedHall_iff_invariant (p : ℕ) :
    WeightedHall G (favorableLeaves G p) p ↔
      ∀ X ⊆ indepFamily G (p + 1), (∀ γ : G ≃g G, famMap G γ X = X) →
        ∑ B ∈ X, activeWeight G (favorableLeaves G p) B ≤
          ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
            activeWeight G (favorableLeaves G p) A := by
  constructor
  · intro h X hX _
    have h1 := h X hX
    rw [filter_eq_covered] at h1 ⊢
    exact h1
  · intro h
    by_contra hn
    have hF : ∀ v ∈ favorableLeaves G p, C4LA1.IsGraphLeaf G v := favorableLeaves_leaf G p
    rw [weightedHall_iff_phi_nonpos] at hn
    push_neg at hn
    obtain ⟨X₀, hX₀, hpos⟩ := hn
    have hmaxpos : 0 < maxPhi G (favorableLeaves G p) p :=
      lt_of_lt_of_le hpos (le_maxPhi_of_mem_domain G (favorableLeaves G p) p hX₀)
    have hmax := canonMin_isMaximizer G (favorableLeaves G p) p
    have hsub : canonMin G (favorableLeaves G p) p ⊆ indepFamily G (p + 1) :=
      Finset.mem_powerset.mp (Finset.mem_filter.mp hmax).1
    have hinv : ∀ γ : G ≃g G,
        famMap G γ (canonMin G (favorableLeaves G p) p) = canonMin G (favorableLeaves G p) p :=
      fun γ => canonMin_famMap G (favorableLeaves G p) p γ hF (favorableLeaves_map_aut G γ p)
    have hle := h (canonMin G (favorableLeaves G p) p) hsub hinv
    rw [filter_eq_covered] at hle
    have hval : phi G (favorableLeaves G p) p (canonMin G (favorableLeaves G p) p) =
        maxPhi G (favorableLeaves G p) p := (Finset.mem_filter.mp hmax).2
    unfold phi supply cov at hval
    have h2 : ((∑ B ∈ canonMin G (favorableLeaves G p) p, activeWeight G (favorableLeaves G p) B : ℕ) : ℤ) ≤
        ((∑ A ∈ covered G p (canonMin G (favorableLeaves G p) p),
          activeWeight G (favorableLeaves G p) A : ℕ) : ℤ) := by exact_mod_cast hle
    linarith

end E993Transport
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN theorem E993Transport.exists_aut_invariant_deficient_of_not_weightedHall cfc6f8520b4cec0fa3c4bf973ffc77c9d5b690291a7d83b6ac008160107319ca
-- r30 C2-LA1 TERMINAL THEOREM. Binder text: the synthesis-frozen statement
-- (cycles/cycle-2/stage6/SYNTHESIS.md, `## Lean awards`, C2-LA1), with the section binders of the origin
-- made explicit. Proof body byte-identical to sources/c2-stage7-sources/C-U1-T-CritINV.lean
-- (sha256 e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb), lines 210-226
-- (critic-derived, C-U1-T, Claude Opus 5.5); the origin's statement is lines 202-209.
namespace E993Transport

open SimpleGraph
open scoped Classical

/-- If weighted Hall fails for the fixed selector `F_p(G)`, the least maximizer `X_min` of
`φ = supply − cov` is a source family inside `I_{p+1}` that is invariant under every automorphism of
`G`, all of whose members carry positive active weight, and whose covered targets carry strictly less
active weight than it supplies. -/
theorem exists_aut_invariant_deficient_of_not_weightedHall {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (h : ¬ WeightedHall G (favorableLeaves G p) p) :
    ∃ X ⊆ indepFamily G (p + 1),
      (∀ γ : G ≃g G, famMap G γ X = X) ∧
      (∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B) ∧
      ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
          activeWeight G (favorableLeaves G p) A <
        ∑ B ∈ X, activeWeight G (favorableLeaves G p) B := by
  set F := favorableLeaves G p with hFdef
  have hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v := favorableLeaves_leaf G p
  rw [weightedHall_iff_phi_nonpos] at h
  push_neg at h
  obtain ⟨X₀, hX₀, hpos⟩ := h
  have hmaxpos : 0 < maxPhi G F p := lt_of_lt_of_le hpos (le_maxPhi_of_mem_domain G F p hX₀)
  have hmax := canonMin_isMaximizer G F p
  refine ⟨canonMin G F p, Finset.mem_powerset.mp (Finset.mem_filter.mp hmax).1, ?_, ?_, ?_⟩
  · intro γ
    exact canonMin_famMap G F p γ hF (favorableLeaves_map_aut G γ p)
  · exact canonMin_pos G F p
  · rw [filter_eq_covered]
    have hval : phi G F p (canonMin G F p) = maxPhi G F p := (Finset.mem_filter.mp hmax).2
    unfold phi supply cov at hval
    have h2 : ((∑ A ∈ covered G p (canonMin G F p), activeWeight G F A : ℕ) : ℤ) <
        ((∑ B ∈ canonMin G F p, activeWeight G F B : ℕ) : ℤ) := by linarith
    exact_mod_cast h2

end E993Transport
-- VERITYOS ENTRY 77 END

