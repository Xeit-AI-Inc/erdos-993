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

-- VERITYOS ENTRY 22 BEGIN definition E993Transport.ChainFactor 32ea0d8f6cd1afd29aae0ef78466725c9f2042e10499ee0018b5b368dd152608
namespace E993Transport

-- r30 C4-LA1 node N5 (authored in-run): the symmetric chain decompositions of step (3) of Theorem
-- CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5); the two-chain (de Bruijn–Tengbergen–Kruyswijk) split is iterated
-- over the blocks in `chainDownUp` / `chainDownVertex` (the pinned Mathlib has no symmetric chain decomposition).
/-- A block of a disjoint union together with a symmetric chain decomposition of the
independent-set poset of that block: `single v` is `K_1` (the chain `∅ < {v}`); `path x y z` is
the path `x – y – z` (the chains `∅ < {x} < {x, z}`, `{y}`, `{z}`); `frozen vs s` is the block
`vs` held fixed at the subset `s` (a one-point chain). -/
inductive ChainFactor (V : Type*) where
  | single (v : V)
  | path (x y z : V)
  | frozen (vs s : Finset V)

end E993Transport
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN definition E993Transport.ChainFactor.verts d32cf84a8f9199e032cc55ef77cd1c89514dab2dad4fe89962d8ee1746211df3
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

/-- the vertices of a block. -/
def verts : ChainFactor V → Finset V
  | single v => {v}
  | path x y z => {x, y, z}
  | frozen vs _ => vs

end E993Transport.ChainFactor
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN definition E993Transport.ChainFactor.code 2211061474e938c423e7b6443fa5551d0d2488d114b89021f19299f5ebde9e28
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

/-- `(position in its chain, length of its chain)` of the restriction of `B` to a block. -/
def code : ChainFactor V → Finset V → ℕ × ℕ
  | single v, B => if v ∈ B then (1, 1) else (0, 1)
  | path x y z, B =>
      if y ∈ B then (0, 0)
      else if x ∈ B then (if z ∈ B then (2, 2) else (1, 2))
      else if z ∈ B then (0, 0) else (0, 2)
  | frozen _ _, _ => (0, 0)

end E993Transport.ChainFactor
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN definition E993Transport.ChainFactor.drop ece00f9f193d5fb0388d247cf9ee74f011cc831b7497a6ce84473cc96b66aa03
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

/-- the vertex deleted to step one place down the block's chain. -/
def drop : ChainFactor V → Finset V → Option V
  | single v, _ => some v
  | path x _ z, B => some (if z ∈ B then z else x)
  | frozen _ _, _ => none

end E993Transport.ChainFactor
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN definition E993Transport.ChainFactor.rk b83a7614b24110043177f7750524ff6966c3e082675c98ee1f09bd96de405aa5
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

/-- the rank of the block's poset (bottom rank plus top rank of every chain). -/
def rk : ChainFactor V → ℕ
  | single _ => 1
  | path _ _ _ => 2
  | frozen _ s => 2 * s.card

end E993Transport.ChainFactor
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN definition E993Transport.ChainFactor.Valid a3234600eca858e9e46b1096308ad7173dcb1c08890de8fa20fff06ca5f90e86
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

/-- the restriction of `B` to the block is an independent set of the block (resp. equals the
frozen subset). -/
def Valid : ChainFactor V → Finset V → Prop
  | single _, _ => True
  | path x y z, B => x ≠ y ∧ y ≠ z ∧ x ≠ z ∧ ¬ (x ∈ B ∧ y ∈ B) ∧ ¬ (y ∈ B ∧ z ∈ B)
  | frozen vs s, B => B ∩ vs = s

end E993Transport.ChainFactor
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN definition E993Transport.chainDownUp 00e0441d4505a37043d16701c57df44371bfe0b363db468853bf8c328eeb1d2e
namespace E993Transport

variable {V : Type*} [DecidableEq V]

-- r30 C4-LA1 node N5: the two-chain split `L_i` of `[0..m] × [0..n]` of Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5),
-- iterated block by block (head block = `[0..m]` chain coordinate, tail product chain = `[0..n]`).
/-- For a list of blocks, `(steps down to the bottom, steps up to the top)` of `B`'s chain in the
iterated two-chain (de Bruijn–Tengbergen–Kruyswijk) decomposition of the product. -/
def chainDownUp : List (ChainFactor V) → Finset V → ℕ × ℕ
  | [], _ => (0, 0)
  | c :: cs, B =>
      if (c.code B).1 ≤ (chainDownUp cs B).2 then
        ((chainDownUp cs B).1,
          (chainDownUp cs B).2 - (c.code B).1 + ((c.code B).2 - (c.code B).1))
      else
        ((chainDownUp cs B).1 + (c.code B).1 - (chainDownUp cs B).2,
          (c.code B).2 - (c.code B).1)

end E993Transport
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN definition E993Transport.chainDownVertex a9f7993f09ffc293fb28aad03fb6c6dadff488e05d1d9bfb905373ed3fe026a2
namespace E993Transport

variable {V : Type*} [DecidableEq V]

-- r30 C4-LA1 node N5: the chain-predecessor map `φ` of step (4) of Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5).
/-- the vertex whose deletion moves `B` to its predecessor in its chain (`none` at a bottom). -/
def chainDownVertex : List (ChainFactor V) → Finset V → Option V
  | [], _ => none
  | c :: cs, B =>
      if (c.code B).1 ≤ (chainDownUp cs B).2 then chainDownVertex cs B else c.drop B

end E993Transport
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN definition E993Transport.chainVerts f16d063a48e4c1fafc6b9b3650f4fcbb1b7818e772759936852e38b5c20aae7d
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- the vertices of all blocks. -/
def chainVerts : List (ChainFactor V) → Finset V
  | [] => ∅
  | c :: cs => c.verts ∪ chainVerts cs

end E993Transport
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN definition E993Transport.chainSize 67ba19c5f90b6e293d96f0d920a4064a85c8bc6f34515d1330d7f3c527a3493e
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- the summed block sizes of `B`. -/
def chainSize : List (ChainFactor V) → Finset V → ℕ
  | [], _ => 0
  | c :: cs, B => (B ∩ c.verts).card + chainSize cs B

end E993Transport
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN definition E993Transport.chainRank 57cab594ae10b9f31b5249872902203ba9f79c64d31a2ff238d53ad37e9b74af
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- the rank of the product poset. -/
def chainRank : List (ChainFactor V) → ℕ
  | [] => 0
  | c :: cs => c.rk + chainRank cs

end E993Transport
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN definition E993Transport.ChainValid 0ce0540bbc55ef26cf609600eb55466524c1f1c29abc4e72fc23332e7773afdf
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- every block restriction of `B` is valid. -/
def ChainValid (cs : List (ChainFactor V)) (B : Finset V) : Prop :=
  ∀ c ∈ cs, c.Valid B

end E993Transport
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN definition E993Transport.ChainDisjoint 27b6c75f4bd0b071963bf27e843b0fee087c8c90dbc13c567bab42607355c7c1
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- the blocks have pairwise disjoint vertex sets. -/
def ChainDisjoint (cs : List (ChainFactor V)) : Prop :=
  cs.Pairwise fun c c' => Disjoint c.verts c'.verts

end E993Transport
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN definition C5LA1.crossingIndex 378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb
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
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN definition E993Transport.spiderEdge d9558eb226d993786002fea5c8f4b0918898b58ecccf03adb990a163f99bbebe
namespace E993Transport

-- r30 C6-LA2 (authored in-run by the C6-LA2 formalizer, Claude Opus 5.5), seeded from the r30 Cycle 6 U1 scratch
-- `Spider.lean` (18396be5…; U1, Claude Sonnet 5): the spider `S(1,2,3^k)` of the registered spider key's labels.
/-- The edge relation of `S(1,2,3^k)` on `Fin (3*k+4)`: root `0`; pendant leaf `1`; pendant path `0–2–3`;
    `k` pendant paths `0–a_i–b_i–c_i` with `a_i = 4+3i`, `b_i = 5+3i`, `c_i = 6+3i`. -/
def spiderEdge (k : ℕ) (u v : Fin (3*k+4)) : Prop :=
  (u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3) ∨
  ∃ i < k, (u.val = 0 ∧ v.val = 4+3*i) ∨ (u.val = 4+3*i ∧ v.val = 5+3*i) ∨
           (u.val = 5+3*i ∧ v.val = 6+3*i)

end E993Transport
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN definition E993Transport.spiderOneTwoThrees f0f4b27a19f5d9d30f3f1d73f2df0da5e4452ff7d8d8eaa84eeeaa9dedbc5bb1
namespace E993Transport

-- r30 C6-LA2: the spider of record (U1 scratch `Spider.lean` 18396be5…, U1, Claude Sonnet 5; re-authored in-run).
/-- `S(1,2,3^k)`, the spider with one leg of length `1`, one of length `2` and `k` of length `3` (the
    registered spider key `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2`,
    second read SR-C5-2). -/
def spiderOneTwoThrees (k : ℕ) : SimpleGraph (Fin (3*k+4)) := SimpleGraph.fromRel (spiderEdge k)

end E993Transport
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN definition E993Transport.spiderOneTwoThrees_decAdj 705b40ceb3fd514f5abc0a9468849d584ed0f6d3ca89ac3a5511994d2d13a739
namespace E993Transport

-- r30 C6-LA2: authored instance (U1 scratch `Spider.lean` 18396be5…, U1, Claude Sonnet 5; the `gkGraph_decAdj` convention of
-- r30 C4-LA1 entry 24).
/-- The decidable adjacency of `S(1,2,3^k)`: `spiderEdge` is a finite disjunction of equalities of naturals and a
bounded `∃ i < k`, each decidable by the core instances, so no classical choice is used. Registered as
`@[reducible, instance] def` (what `instance` elaborates to), because the registrar admits definition entries by `def`. -/
@[reducible, instance]
def spiderOneTwoThrees_decAdj (k : ℕ) : DecidableRel (spiderOneTwoThrees k).Adj := fun u v =>
  haveI : ∀ a b : Fin (3*k+4), Decidable (spiderEdge k a b) := fun a b => by
    unfold spiderEdge
    infer_instance
  decidable_of_iff (u ≠ v ∧ (spiderEdge k u v ∨ spiderEdge k v u))
    (SimpleGraph.fromRel_adj (spiderEdge k) u v).symm

end E993Transport
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN definition E993Transport.spiderVertex 72defaa13a5a23e338ef3e29b5da4bc43921e26dae118836f672ae66299dbc2f
namespace E993Transport

-- r30 C6-LA2 (U1 scratch `Spider.lean`; pattern: r30 C4-LA1 entry 38 `gkVertex`).
/-- the vertex of `S(1,2,3^k)` with label `n` (labels `n < 3k+4` are the vertices of record). -/
def spiderVertex (k n : ℕ) : Fin (3*k+4) := ⟨n % (3*k+4), Nat.mod_lt _ (by omega)⟩

end E993Transport
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN definition E993Transport.spiderParentVal 92ef8e5eb5b87e2c0c014627b78361ab60b5022dfb9c37eafc1ae87bbcba9acb
namespace E993Transport

-- r30 C6-LA2 N1 (U1 scratch `Spider.lean`, U1, Claude Sonnet 5; pattern: r30 C5-LA1 `gkParentVal`).
/-- the label of the parent of a vertex of label `n ≥ 1`, one step closer to the root. -/
def spiderParentVal (n : ℕ) : ℕ :=
  if n = 1 then 0
  else if n = 2 then 0
  else if n = 3 then 2
  else if (n - 4) % 3 = 0 then 0
  else n - 1

end E993Transport
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN definition E993Transport.spiderParent 3466d915a0b2daa31c4d31114df0f03382839aefad2b5d43c37718592e206d76
namespace E993Transport

-- r30 C6-LA2 N1 (U1 scratch `Spider.lean`, U1, Claude Sonnet 5).
/-- the parent of `v` in `S(1,2,3^k)`. -/
def spiderParent (k : ℕ) (v : Fin (3*k+4)) : Fin (3*k+4) := spiderVertex k (spiderParentVal v.val)

end E993Transport
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN definition E993Transport.spiderChildEdge 17935463ce77ed7a7d4d960c01433a2da2f4c03f8b0cc0bc2ebade7d0b495061
namespace E993Transport

-- r30 C6-LA2 N1 (U1 scratch `Spider.lean`, U1, Claude Sonnet 5; pattern: r30 C5-LA1 `gkChildEdge`).
/-- the child–parent edge of a non-root vertex, as a `Sym2`. -/
def spiderChildEdge (k : ℕ) (v : {v : Fin (3*k+4) // v.val ≠ 0}) : Sym2 (Fin (3*k+4)) :=
  s(v.1, spiderParent k v.1)

end E993Transport
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN definition E993Transport.spiderCell e03bee9826505a568f7a9b0fb772359ee823bef7e9177077db5968a7c8e3ddf5
namespace E993Transport

-- r30 C6-LA2 α upper bound, seeded from critic `C-U1-F` (r30 Cycle 6, Claude Opus 5.5) scratch `CriticN2.lean` (0a0aac07…).
/-- the cell of a label: the vertex set is partitioned into the `2k+2` cells `{0,1}`, `{2,3}`, `{a_i, b_i}`,
    `{c_i}`; an independent set meets each cell at most once (each two-element cell is an edge). -/
def spiderCell (n : ℕ) : ℕ :=
  if n < 2 then 0 else if n < 4 then 1
  else if (n - 4) % 3 = 2 then 2 * ((n - 4) / 3) + 3 else 2 * ((n - 4) / 3) + 2

end E993Transport
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN definition E993Transport.spiderPartner 8d6bf3b486a8767d5ad1d25c138fd7fb67f158675bcddf2e9e6555bab20c2158
namespace E993Transport

-- r30 C6-LA2 α upper bound (critic `C-U1-F` scratch `CriticN2.lean`, Claude Opus 5.5).
/-- the other member of a two-element cell (`u` itself for a singleton cell `{c_i}`). -/
def spiderPartner (u : ℕ) : ℕ :=
  if u = 0 then 1 else if u = 1 then 0 else if u = 2 then 3 else if u = 3 then 2
  else if (u - 4) % 3 = 0 then u + 1 else if (u - 4) % 3 = 1 then u - 1 else u

end E993Transport
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN definition E993Transport.spiderIndepWitness 93a9696c1a149c9a6e515e8ecbc1301c95e279acfb9af8a4a9dfe6f127be94f9
namespace E993Transport

-- r30 C6-LA2 α lower bound, seeded from critic `C-U1-T` (r30 Cycle 6, Claude Opus 5.5) scratch `CriticIndepLB.lean` (edf35df0…).
/-- the independent witness `{1, 3} ∪ {a_i, c_i}`: the labels that are nonzero and not `≡ 2 (mod 3)`. -/
def spiderIndepWitness (k : ℕ) : Finset (Fin (3*k+4)) :=
  Finset.univ.filter fun v => v.val ≠ 0 ∧ v.val % 3 ≠ 2

end E993Transport
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN definition E993Transport.spiderLeafBlock fc2e2532283577da2740caebdc3658b63ed45f3be20bbc4f599eec3778d09e5e
namespace E993Transport

-- r30 C6-LA2 FLOW (F3): the block assignment of critic `C-U1-T` (r30 Cycle 6, Claude Opus 5.5), in the constructors of
-- r30 C4-LA1 entry 25 (`ChainFactor`); pattern: r30 C4-LA1 entry 39.
/-- the block `{1}`: frozen at `{1}` for the tag `1` (`β₁(1)`), else the chain `∅ < {1}`. -/
def spiderLeafBlock (k : ℕ) (τ : Fin (3*k+4)) : ChainFactor (Fin (3*k+4)) :=
  if τ.val = 1 then .frozen {spiderVertex k 1} {spiderVertex k 1} else .single (spiderVertex k 1)

end E993Transport
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN definition E993Transport.spiderMidBlock b5a413b571684c6487ddb1750582a7d3ec45d9a505bb66e068ac8783cb3d7e30
namespace E993Transport

-- r30 C6-LA2 FLOW (F3): the block `path(3,2,0)` of critic `C-U1-T`'s block assignment (r30 Cycle 6, Claude Opus 5.5): the
-- pendant path `3 – 2 – 0` with the root as its `z`-vertex (chains `∅ < {3} < {3, 0}`, `{2}`, `{0}`).
/-- the block `3 – 2 – 0`. -/
def spiderMidBlock (k : ℕ) : ChainFactor (Fin (3*k+4)) :=
  .path (spiderVertex k 3) (spiderVertex k 2) (spiderVertex k 0)

end E993Transport
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN definition E993Transport.spiderArmBlock 811bb8a959fbad1418ab4cf6abf049541ea3be6336b0a2b9e84b069aa08de376
namespace E993Transport

-- r30 C6-LA2 FLOW (F3): critic `C-U1-T`'s arm blocks `A_j` (r30 Cycle 6, Claude Opus 5.5); pattern: r30 C4-LA1 entry 41.
/-- the arm block `a_j – b_j – c_j` (labels `4+3j, 5+3j, 6+3j`): frozen at `{a_j, c_j}` when `j = i`, else the path
block with chains `∅ < {a_j} < {a_j, c_j}`, `{b_j}`, `{c_j}`. -/
def spiderArmBlock (k i j : ℕ) : ChainFactor (Fin (3*k+4)) :=
  if j = i then
    .frozen {spiderVertex k (4+3*j), spiderVertex k (5+3*j), spiderVertex k (6+3*j)}
      {spiderVertex k (4+3*j), spiderVertex k (6+3*j)}
  else .path (spiderVertex k (4+3*j)) (spiderVertex k (5+3*j)) (spiderVertex k (6+3*j))

end E993Transport
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN definition E993Transport.spiderArmIndex 9c9399d0c1d91e266f4b2710c9ab1871f0fbb16dbd98d2b06129b2789a7fb399
namespace E993Transport

-- r30 C6-LA2 FLOW (F3); pattern: r30 C4-LA1 entry 42.
/-- the index of the arm frozen by the tag `τ` (`(τ − 6)/3` for `τ = c_j`; `k`, i.e. none, for labels `< 6`). -/
def spiderArmIndex (k : ℕ) (τ : Fin (3*k+4)) : ℕ :=
  if 6 ≤ τ.val then (τ.val - 6) / 3 else k

end E993Transport
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN definition E993Transport.spiderTagFactors 46ea8a712641e3f5e59aa8eaf47e06bb0ebc1a18ab8db1bb4fce0146297f9ef3
namespace E993Transport

-- r30 C6-LA2 FLOW (F3): critic `C-U1-T`'s block list `𝓑_τ = [β₁(τ), path(3,2,0), A_1 … A_k]` (r30 Cycle 6, Claude Opus 5.5);
-- pattern: r30 C4-LA1 entry 43. At a non-leaf `τ` of label `< 6` (e.g. the root) no block is frozen: that is the list
-- `[single 1, path(3,2,0), arms]` of the root split (N3a).
/-- the blocks of `S(1,2,3^k)` for the tag `τ`, the tag's own block frozen. -/
def spiderTagFactors (k : ℕ) (τ : Fin (3*k+4)) : List (ChainFactor (Fin (3*k+4))) :=
  spiderLeafBlock k τ :: spiderMidBlock k :: (List.range k).map (spiderArmBlock k (spiderArmIndex k τ))

end E993Transport
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN definition E993Transport.spiderTagDown cf7f5bb181386a8b742f3b9846706f21627edffb54b3bd810829332072f454bf
namespace E993Transport

-- r30 C6-LA2 FLOW (F7): `φ_τ(B) = B ∖ {chainDownVertex(𝓑_τ, B)}` (critic `C-U1-T`, r30 Cycle 6, Claude Opus 5.5), in the
-- `Option`-unwrapped form of r30 C4-LA1 entry 44.
/-- the per-tag down-map `φ_τ`: delete the chain-predecessor vertex (identity at a chain bottom, which never occurs on
the τ-active sources at the ranks used). -/
def spiderTagDown (k : ℕ) (τ : Fin (3*k+4)) (B : Finset (Fin (3*k+4))) : Finset (Fin (3*k+4)) :=
  match chainDownVertex (spiderTagFactors k τ) B with
  | some q => B.erase q
  | none => B

end E993Transport
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN definition E993Transport.spiderRootSplitDown 81a499e2550c81b07ff5e90ec605fb401eadcdafa45f3482efa03375fb2e083e
namespace E993Transport

-- r30 C6-LA2 N3a: the root split (critic `C-U1-T` and critic `C-U1-F`, independently; r30 Cycle 6, Claude Opus 5.5).
/-- the root-split map `I_{k+2} → I_{k+1}`: on root-present sets delete `3`; on root-free sets delete the chain
predecessor for the unfrozen block list `[single 1, path(3,2,0), arms]` (`spiderTagFactors` at the root). -/
def spiderRootSplitDown (k : ℕ) (B : Finset (Fin (3*k+4))) : Finset (Fin (3*k+4)) :=
  if spiderVertex k 0 ∈ B then B.erase (spiderVertex k 3) else spiderTagDown k (spiderVertex k 0) B

end E993Transport
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN definition E993Transport.spiderRootSplitWitness d4050741a7b9167815c8364a6d5ce6158e9933596d35d926b6b90d14499c34d0
namespace E993Transport

-- r30 C6-LA2 N3a: the missed witness `{0, 3} ∪` (one vertex from each of `k − 1` arms) of the root split (critics `C-U1-T`,
-- `C-U1-F`), realised as the labels `≡ 0 (mod 3)` other than `c_{k-1} = 3k+3`: `{0, 3, c_0, …, c_{k-2}}`.
/-- the missed witness of the root split. -/
def spiderRootSplitWitness (k : ℕ) : Finset (Fin (3*k+4)) :=
  (Finset.univ.filter fun v : Fin (3*k+4) => v.val % 3 = 0).erase (spiderVertex k (3*k+3))

end E993Transport
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma E993Interior.highTailAggregateFromShadow 972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d
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
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma E993Transport.indepFamily_eq_indepSetsAvoiding 45d1a93e12e0f50a58b9efb7fe25fab2fcd0c2e31eff6b3ac74795bf6a27cfe8
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
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma E993Transport.isGraphLeaf_of_mem_favorableLeaves 8977fb83111a46cace690984e23e2ffd54e2ea5233712bfeeca579f1debf75c8
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
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma E993Transport.tagWitnesses_subset_R 7a8528a04b10243adfa0e8488d21206bd9cfed44e18910e7ed810b7b8517baad
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
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma E993Transport.card_active_eq_tagged 8823a71dad443ec51fdf34fc541c2c66aab7792d9520f8ef76665729ece12616
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
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma E993Transport.layerWeight_eq_sum_card 6adece46210475286f5574371270d1f0cba414876eec5e7dd058ab2fa1993c8f
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
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma E993Transport.layerWeight_sub_eq_sum 56e71a87c92f3d8435c1f8fb3b3e906cb037d78027b5bdfdf26b824a1fa8cc33
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
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma E993Transport.activeWeightAggregateIdentity 9daf96e3501eccf92cd7025a400785520be2dc5ed078923730e0729f2af7d899
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
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma E993Transport.aggregate_nonpos_of_saturatingFlow ce01183cc56349c832b3626edb125bdffae41d91412371271d18104ee3795f30
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
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma E993Transport.weightedHall_of_saturatingFlow 89a7ffb8bc79b1d61290459a843fb8fa2ca73c6fc9e3b6affd8448933bf2d54c
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
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma E993Transport.ChainFactor.card_inter_path_eq fb9273d46ecbb6344f21f47a0c2732841ee2a4f2b07e752d410714c1a83e9b9f
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

lemma card_inter_path_eq (x y z : V) (B : Finset V) (hxy : x ≠ y) (hyz : y ≠ z) (hxz : x ≠ z) :
    (B ∩ {x, y, z}).card =
      (if x ∈ B then 1 else 0) + (if y ∈ B then 1 else 0) + (if z ∈ B then 1 else 0) := by
  rw [Finset.inter_comm, ← Finset.filter_mem_eq_inter, Finset.card_filter,
    Finset.sum_insert (by simp [hxy, hxz]), Finset.sum_insert (by simp [hyz]),
    Finset.sum_singleton]
  omega

end E993Transport.ChainFactor
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma E993Transport.ChainFactor.two_mul_card_add_len_eq b4b34a0cf1dfc68177104fb386cb85c926399eb09058db3a6075dce9992dd789
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

lemma two_mul_card_add_len_eq (c : ChainFactor V) (B : Finset V) (h : c.Valid B) :
    2 * (B ∩ c.verts).card + (c.code B).2 = c.rk + 2 * (c.code B).1 := by
  cases c with
  | single v =>
      by_cases hv : v ∈ B
      · simp [verts, code, rk, hv, Finset.inter_singleton_of_mem hv]
      · simp [verts, code, rk, hv, Finset.inter_singleton_of_notMem hv]
  | path x y z =>
      obtain ⟨hxy, hyz, hxz, hxy', hyz'⟩ := h
      simp only [verts, code, rk]
      rw [card_inter_path_eq x y z B hxy hyz hxz]
      by_cases hx : x ∈ B <;> by_cases hy : y ∈ B <;> by_cases hz : z ∈ B <;>
        simp_all
  | frozen vs s =>
      simp only [Valid] at h
      simp [verts, code, rk, h]

end E993Transport.ChainFactor
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma E993Transport.ChainFactor.code_fst_le_snd 4687c620aae2e16910394ac2b3dbfe8d7ec8073e4860e68c8386bdadf2ed726f
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

lemma code_fst_le_snd (c : ChainFactor V) (B : Finset V) : (c.code B).1 ≤ (c.code B).2 := by
  cases c with
  | single v => simp only [code]; split_ifs <;> simp
  | path x y z => simp only [code]; split_ifs <;> simp
  | frozen vs s => simp [code]

end E993Transport.ChainFactor
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma E993Transport.ChainFactor.exists_drop_of_code_pos 4d7c96673fdbc78ce2cad5bf2d0920cdb5ab54ac92009057f9ba780ccad8726a
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

lemma exists_drop_of_code_pos (c : ChainFactor V) (B : Finset V) (h : c.Valid B)
    (hpos : 0 < (c.code B).1) :
    ∃ q, c.drop B = some q ∧ q ∈ B ∧ q ∈ c.verts ∧
      c.code (B.erase q) = ((c.code B).1 - 1, (c.code B).2) ∧ c.Valid (B.erase q) := by
  cases c with
  | single v =>
      have hv : v ∈ B := by
        by_contra hv
        simp [code, hv] at hpos
      refine ⟨v, rfl, hv, by simp [verts], ?_, trivial⟩
      simp [code, hv]
  | path x y z =>
      obtain ⟨hxy, hyz, hxz, hxy', hyz'⟩ := h
      have hy : y ∉ B := by
        intro hy
        simp [code, hy] at hpos
      have hx : x ∈ B := by
        by_contra hx
        simp only [code, hy, hx, if_false] at hpos
        split_ifs at hpos <;> simp at hpos
      by_cases hz : z ∈ B
      · refine ⟨z, by simp [drop, hz], hz, by simp [verts], ?_, ?_⟩
        · simp [code, hy, hx, hz, hxz]
        · refine ⟨hxy, hyz, hxz, ?_, ?_⟩ <;> simp [hy]
      · refine ⟨x, by simp [drop, hz], hx, by simp [verts], ?_, ?_⟩
        · simp [code, hy, hx, hz]
        · refine ⟨hxy, hyz, hxz, ?_, ?_⟩ <;> simp [hy]
  | frozen vs s => simp [code] at hpos

end E993Transport.ChainFactor
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma E993Transport.ChainFactor.code_erase_of_notMem d90065196eafb6af9bc223e3ccd6bcc75af09805706e98ee5cbe27443fca1cb9
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

lemma code_erase_of_notMem (c : ChainFactor V) (B : Finset V) (q : V) (hq : q ∉ c.verts) :
    c.code (B.erase q) = c.code B ∧ c.drop (B.erase q) = c.drop B ∧
      (c.Valid (B.erase q) ↔ c.Valid B) := by
  cases c with
  | single v =>
      have hqv : v ≠ q := fun h => hq (by simp [verts, h])
      simp [code, drop, Valid, Finset.mem_erase, hqv]
  | path x y z =>
      have hx : x ≠ q := fun h => hq (by simp [verts, h])
      have hy : y ≠ q := fun h => hq (by simp [verts, h])
      have hz : z ≠ q := fun h => hq (by simp [verts, h])
      simp [code, drop, Valid, Finset.mem_erase, hx, hy, hz]
  | frozen vs s =>
      refine ⟨rfl, rfl, ?_⟩
      have : B.erase q ∩ vs = B ∩ vs := by
        ext a
        simp only [Finset.mem_inter, Finset.mem_erase]
        constructor
        · rintro ⟨⟨_, ha⟩, hv⟩
          exact ⟨ha, hv⟩
        · rintro ⟨ha, hv⟩
          exact ⟨⟨fun h => hq (h ▸ hv), ha⟩, hv⟩
      simp only [Valid, this]

end E993Transport.ChainFactor
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma E993Transport.ChainFactor.drop_mem_or_mem_of_ne 9088c80b91e37fe76657818f8ffd646e51010bc42e645849b3bc56e9788a336c
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

lemma drop_mem_or_mem_of_ne (c : ChainFactor V) (B B' : Finset V) (h : c.Valid B)
    (h' : c.Valid B') (hpos : 0 < (c.code B).1) (hpos' : 0 < (c.code B').1) (q q' : V)
    (hq : c.drop B = some q) (hq' : c.drop B' = some q') (hne : q ≠ q') : q ∈ B' ∨ q' ∈ B := by
  cases c with
  | single v =>
      simp only [drop, Option.some.injEq] at hq hq'
      exact absurd (hq.symm.trans hq') hne
  | path x y z =>
      have hxB : x ∈ B := by
        obtain ⟨-, -, -, -, -⟩ := h
        by_contra hx
        simp only [code] at hpos
        split_ifs at hpos <;> simp_all
      have hxB' : x ∈ B' := by
        by_contra hx
        simp only [code] at hpos'
        split_ifs at hpos' <;> simp_all
      simp only [drop, Option.some.injEq] at hq hq'
      by_cases hqx : q = x
      · exact Or.inl (hqx ▸ hxB')
      · have hq'x : q' = x := by
          split_ifs at hq hq' <;> simp_all
        exact Or.inr (hq'x ▸ hxB)
  | frozen vs s => simp [code] at hpos

end E993Transport.ChainFactor
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma E993Transport.mem_chainVerts_iff cde031a8ef9764eb71e766dea3d2e10b9cf2fcb22beb86999aa6d89928db9a0d
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma mem_chainVerts_iff (cs : List (ChainFactor V)) (v : V) :
    v ∈ chainVerts cs ↔ ∃ c ∈ cs, v ∈ c.verts := by
  induction cs with
  | nil => simp [chainVerts]
  | cons c cs ih => simp [chainVerts, ih]

end E993Transport
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma E993Transport.chainDownUp_erase_of_notMem f76732f072f2fdad9f343e94dbf3d5636518fbad4990ff5e747c1da53616dcac
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma chainDownUp_erase_of_notMem (cs : List (ChainFactor V)) (B : Finset V) (q : V)
    (hq : q ∉ chainVerts cs) :
    chainDownUp cs (B.erase q) = chainDownUp cs B ∧
      chainDownVertex cs (B.erase q) = chainDownVertex cs B ∧
      (ChainValid cs (B.erase q) ↔ ChainValid cs B) := by
  induction cs with
  | nil => simp [chainDownUp, chainDownVertex, ChainValid]
  | cons c cs ih =>
      have hqc : q ∉ c.verts := fun h => hq (by simp [chainVerts, h])
      have hqcs : q ∉ chainVerts cs := fun h => hq (by simp [chainVerts, h])
      obtain ⟨h1, h2, h3⟩ := ih hqcs
      obtain ⟨g1, g2, g3⟩ := ChainFactor.code_erase_of_notMem c B q hqc
      refine ⟨?_, ?_, ?_⟩
      · simp only [chainDownUp, h1, g1]
      · simp only [chainDownVertex, h1, h2, g1, g2]
      · simp only [ChainValid, List.forall_mem_cons] at h3 ⊢
        rw [g3, h3]

end E993Transport
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma E993Transport.two_mul_chainSize_add_up_eq 7793757076279a9c59439aa2be8734e8c2a27085ece8bbf51e24e87d670868ea
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma two_mul_chainSize_add_up_eq (cs : List (ChainFactor V)) (B : Finset V)
    (h : ChainValid cs B) :
    2 * chainSize cs B + (chainDownUp cs B).2 = chainRank cs + (chainDownUp cs B).1 := by
  induction cs with
  | nil => simp [chainSize, chainDownUp, chainRank]
  | cons c cs ih =>
      have hc : c.Valid B := h c (by simp)
      have hcs : ChainValid cs B := fun c' hc' => h c' (by simp [hc'])
      have e1 := ChainFactor.two_mul_card_add_len_eq c B hc
      have e2 := ih hcs
      have e3 := ChainFactor.code_fst_le_snd c B
      simp only [chainSize, chainRank, chainDownUp]
      split_ifs with hle
      · simp only
        omega
      · simp only
        omega

end E993Transport
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma E993Transport.mem_and_exists_drop_of_chainDownVertex 4a73e439b8a01bae4d1230bb79f86c880fb395752904af56caeea92117c347d5
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma mem_and_exists_drop_of_chainDownVertex (cs : List (ChainFactor V)) (B : Finset V) (h : ChainValid cs B)
    (q : V) (hq : chainDownVertex cs B = some q) :
    q ∈ B ∧ ∃ c ∈ cs, 0 < (c.code B).1 ∧ c.drop B = some q ∧ q ∈ c.verts := by
  induction cs with
  | nil => simp [chainDownVertex] at hq
  | cons c cs ih =>
      have hc : c.Valid B := h c (by simp)
      have hcs : ChainValid cs B := fun c' hc' => h c' (by simp [hc'])
      simp only [chainDownVertex] at hq
      split_ifs at hq with hle
      · obtain ⟨hqB, c', hc', hpos, hdrop, hv⟩ := ih hcs hq
        exact ⟨hqB, c', by simp [hc'], hpos, hdrop, hv⟩
      · have hpos : 0 < (c.code B).1 := by omega
        obtain ⟨q', hq', hq'B, hq'v, -, -⟩ := ChainFactor.exists_drop_of_code_pos c B hc hpos
        rw [hq'] at hq
        cases hq
        exact ⟨hq'B, c, by simp, hpos, hq', hq'v⟩

end E993Transport
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma E993Transport.exists_chainDownVertex_of_down_pos ae9b9fa0e2265983da2e05ce4211a971ef7da084996ec6eb137d0eaa38afd511
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma exists_chainDownVertex_of_down_pos (cs : List (ChainFactor V)) (B : Finset V)
    (h : ChainValid cs B) (hd : 0 < (chainDownUp cs B).1) :
    ∃ q, chainDownVertex cs B = some q := by
  induction cs with
  | nil => simp [chainDownUp] at hd
  | cons c cs ih =>
      have hc : c.Valid B := h c (by simp)
      have hcs : ChainValid cs B := fun c' hc' => h c' (by simp [hc'])
      simp only [chainDownUp] at hd
      simp only [chainDownVertex]
      split_ifs at hd ⊢ with hle
      · exact ih hcs hd
      · have hpos : 0 < (c.code B).1 := by omega
        obtain ⟨q', hq', -⟩ := ChainFactor.exists_drop_of_code_pos c B hc hpos
        exact ⟨q', hq'⟩

end E993Transport
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma E993Transport.chainDownUp_erase_chainDownVertex f240147f3dfcd92cdfeae410ad951156a42c6e1ec49ae9f2e531f0ea4ef38ef7
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma chainDownUp_erase_chainDownVertex (cs : List (ChainFactor V)) (B : Finset V)
    (hd : ChainDisjoint cs) (h : ChainValid cs B) (q : V)
    (hq : chainDownVertex cs B = some q) :
    ChainValid cs (B.erase q) ∧
      chainDownUp cs (B.erase q) = ((chainDownUp cs B).1 - 1, (chainDownUp cs B).2 + 1) ∧
      0 < (chainDownUp cs B).1 := by
  induction cs with
  | nil => simp [chainDownVertex] at hq
  | cons c cs ih =>
      have hc : c.Valid B := h c (by simp)
      have hcs : ChainValid cs B := fun c' hc' => h c' (by simp [hc'])
      simp only [ChainDisjoint, List.pairwise_cons] at hd
      obtain ⟨hdc, hdcs⟩ := hd
      have hle2 := ChainFactor.code_fst_le_snd c B
      simp only [chainDownVertex] at hq
      split_ifs at hq with hle
      · -- the step is taken in the tail
        obtain ⟨hv', he', hpos'⟩ := ih hdcs hcs hq
        obtain ⟨-, c', hc', -, -, hqv⟩ := mem_and_exists_drop_of_chainDownVertex cs B hcs q hq
        have hqc : q ∉ c.verts := fun hqc =>
          Finset.disjoint_left.mp (hdc c' hc') hqc hqv
        obtain ⟨g1, -, g3⟩ := ChainFactor.code_erase_of_notMem c B q hqc
        refine ⟨?_, ?_, ?_⟩
        · intro c'' hc''
          simp only [List.mem_cons] at hc''
          rcases hc'' with rfl | hc''
          · exact g3.mpr hc
          · exact hv' c'' hc''
        · simp only [chainDownUp, g1, he']
          split_ifs <;> simp only [Prod.mk.injEq] at * <;> refine ⟨?_, ?_⟩ <;> first | trivial | omega
        · simp only [chainDownUp, if_pos hle]
          exact hpos'
      · -- the step is taken in the head block
        have hpos : 0 < (c.code B).1 := by omega
        obtain ⟨q', hq', hq'B, hq'v, hcode, hvalid⟩ :=
          ChainFactor.exists_drop_of_code_pos c B hc hpos
        rw [hq'] at hq
        have hqq : q = q' := (Option.some.inj hq).symm
        subst hqq
        have hqcs : q ∉ chainVerts cs := by
          intro hmem
          obtain ⟨c', hc', hv⟩ := (mem_chainVerts_iff cs q).mp hmem
          exact Finset.disjoint_left.mp (hdc c' hc') hq'v hv
        obtain ⟨t1, -, t3⟩ := chainDownUp_erase_of_notMem cs B q hqcs
        refine ⟨?_, ?_, ?_⟩
        · intro c'' hc''
          simp only [List.mem_cons] at hc''
          rcases hc'' with rfl | hc''
          · exact hvalid
          · exact t3.mpr hcs c'' hc''
        · simp only [chainDownUp, hcode, t1]
          split_ifs <;> simp only [Prod.mk.injEq] at * <;> refine ⟨?_, ?_⟩ <;> first | trivial | omega
        · simp only [chainDownUp, if_neg hle]
          omega

end E993Transport
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma E993Transport.notMem_verts_of_chainDownVertex f52cd04f62a0623e8e96121a1eebf932f0b79dcc88068a9fed09ad4f37c75df4
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma notMem_verts_of_chainDownVertex (cs : List (ChainFactor V)) (B : Finset V)
    (hd : ChainDisjoint cs) (h : ChainValid cs B) (q : V)
    (hq : chainDownVertex cs B = some q) (c : ChainFactor V) (hc : c ∈ cs)
    (hc0 : (c.code B).1 = 0) : q ∉ c.verts := by
  induction cs with
  | nil => simp at hc
  | cons c₀ cs ih =>
      have hc₀ : c₀.Valid B := h c₀ (by simp)
      have hcs : ChainValid cs B := fun c' hc' => h c' (by simp [hc'])
      simp only [ChainDisjoint, List.pairwise_cons] at hd
      obtain ⟨hdc, hdcs⟩ := hd
      simp only [chainDownVertex] at hq
      split_ifs at hq with hle
      · obtain ⟨-, c', hc', -, -, hqv⟩ := mem_and_exists_drop_of_chainDownVertex cs B hcs q hq
        simp only [List.mem_cons] at hc
        rcases hc with rfl | hc
        · exact fun hqc => Finset.disjoint_left.mp (hdc c' hc') hqc hqv
        · exact ih hdcs hcs hq hc
      · have hpos : 0 < (c₀.code B).1 := by omega
        obtain ⟨q', hq', -, hq'v, -, -⟩ := ChainFactor.exists_drop_of_code_pos c₀ B hc₀ hpos
        rw [hq'] at hq
        cases hq
        simp only [List.mem_cons] at hc
        rcases hc with rfl | hc
        · omega
        · exact fun hqc => Finset.disjoint_left.mp (hdc c hc) hq'v hqc

end E993Transport
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma E993Transport.eq_of_chainDownVertex_erase_eq abe1b5e82ab32a2af7093e3ffa66492e5c8423f6928f518be160b7b2119231df
namespace E993Transport

variable {V : Type*} [DecidableEq V]

-- r30 C4-LA1 node N5: chains are disjoint, so the predecessor map is injective (step (4) of Theorem
-- CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5)).
lemma eq_of_chainDownVertex_erase_eq (cs : List (ChainFactor V)) (hd : ChainDisjoint cs)
    (B B' : Finset V) (h : ChainValid cs B) (h' : ChainValid cs B') (q q' : V)
    (hq : chainDownVertex cs B = some q) (hq' : chainDownVertex cs B' = some q')
    (he : B.erase q = B'.erase q') : B = B' := by
  induction cs generalizing q q' with
  | nil => simp [chainDownVertex] at hq
  | cons c cs ih =>
      have hc : c.Valid B := h c (by simp)
      have hcs : ChainValid cs B := fun c' hc' => h c' (by simp [hc'])
      have hc' : c.Valid B' := h' c (by simp)
      have hcs' : ChainValid cs B' := fun c' hc' => h' c' (by simp [hc'])
      have hd0 := hd
      simp only [ChainDisjoint, List.pairwise_cons] at hd
      obtain ⟨hdc, hdcs⟩ := hd
      have hqB : q ∈ B := (mem_and_exists_drop_of_chainDownVertex (c :: cs) B h q hq).1
      have hqB' : q' ∈ B' := (mem_and_exists_drop_of_chainDownVertex (c :: cs) B' h' q' hq').1
      -- a tail step never moves a head coordinate; a head step never moves the tail
      have tail_notMem_head : ∀ (D : Finset V) (r : V), ChainValid cs D →
          chainDownVertex cs D = some r → r ∉ c.verts := by
        intro D r hD hr hrc
        obtain ⟨-, c'', hc'', -, -, hrv⟩ := mem_and_exists_drop_of_chainDownVertex cs D hD r hr
        exact Finset.disjoint_left.mp (hdc c'' hc'') hrc hrv
      have head_notMem_tail : ∀ r : V, r ∈ c.verts → r ∉ chainVerts cs := by
        intro r hr hmem
        obtain ⟨c'', hc'', hv⟩ := (mem_chainVerts_iff cs r).mp hmem
        exact Finset.disjoint_left.mp (hdc c'' hc'') hr hv
      -- the mixed case is impossible
      have mixed : ∀ (D D' : Finset V) (r r' : V), ChainValid cs D → c.Valid D' →
          ChainValid cs D' →
          (c.code D).1 ≤ (chainDownUp cs D).2 → chainDownVertex cs D = some r →
          ¬ (c.code D').1 ≤ (chainDownUp cs D').2 → c.drop D' = some r' →
          D.erase r = D'.erase r' → False := by
        intro D D' r r' hD hcD' hD' hle hr hnle hr' hee
        have hpos' : 0 < (c.code D').1 := by omega
        obtain ⟨r'', hr'', -, hr''v, hcode, -⟩ :=
          ChainFactor.exists_drop_of_code_pos c D' hcD' hpos'
        rw [hr'] at hr''
        cases hr''
        have hrc : r ∉ c.verts := tail_notMem_head D r hD hr
        have hA1 : c.code D = c.code (D'.erase r') := by
          rw [← hee]
          exact ((ChainFactor.code_erase_of_notMem c D r hrc).1).symm
        have hA2 : chainDownUp cs D' = chainDownUp cs (D.erase r) := by
          rw [hee]
          exact ((chainDownUp_erase_of_notMem cs D' r' (head_notMem_tail r' hr''v)).1).symm
        obtain ⟨-, he2, -⟩ := chainDownUp_erase_chainDownVertex cs D hdcs hD r hr
        rw [hA1, hcode] at hle
        rw [hA2, he2] at hnle
        simp only at hle hnle
        omega
      simp only [chainDownVertex] at hq hq'
      by_cases hle : (c.code B).1 ≤ (chainDownUp cs B).2 <;>
        by_cases hle' : (c.code B').1 ≤ (chainDownUp cs B').2
      · rw [if_pos hle] at hq
        rw [if_pos hle'] at hq'
        exact ih hdcs hcs hcs' q q' hq hq' he
      · rw [if_pos hle] at hq
        rw [if_neg hle'] at hq'
        exact (mixed B B' q q' hcs hc' hcs' hle hq hle' hq' he).elim
      · rw [if_neg hle] at hq
        rw [if_pos hle'] at hq'
        exact (mixed B' B q' q hcs' hc hcs hle' hq' hle hq he.symm).elim
      · rw [if_neg hle] at hq
        rw [if_neg hle'] at hq'
        have hpos : 0 < (c.code B).1 := by omega
        have hpos' : 0 < (c.code B').1 := by omega
        have hqq : q = q' := by
          by_contra hne
          rcases ChainFactor.drop_mem_or_mem_of_ne c B B' hc hc' hpos hpos' q q' hq hq' hne
            with hm | hm
          · have : q ∈ B'.erase q' := Finset.mem_erase.mpr ⟨hne, hm⟩
            rw [← he] at this
            simp at this
          · have : q' ∈ B.erase q := Finset.mem_erase.mpr ⟨Ne.symm hne, hm⟩
            rw [he] at this
            simp at this
        subst hqq
        rw [← Finset.insert_erase hqB, ← Finset.insert_erase hqB', he]

end E993Transport
-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma E993Transport.chainDownUp_snd_eq_zero_of_top 9b81f16c82a17c3b6f0d9335491d0f8d72913f08847a29165f0a765689b2c13c
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma chainDownUp_snd_eq_zero_of_top (cs : List (ChainFactor V)) (B : Finset V)
    (htop : ∀ c ∈ cs, (c.code B).1 = (c.code B).2) : (chainDownUp cs B).2 = 0 := by
  induction cs with
  | nil => simp [chainDownUp]
  | cons c cs ih =>
      have hc := htop c (by simp)
      have h0 := ih (fun c' hc' => htop c' (by simp [hc']))
      simp only [chainDownUp]
      split_ifs <;> simp only <;> omega

end E993Transport
-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma E993Transport.chainSize_eq_card_inter 5c45300ef1a4198e3838a01ad3649dd0f6d5669ed8fc6ef3aa25b0f606c97402
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma chainSize_eq_card_inter (cs : List (ChainFactor V)) (hd : ChainDisjoint cs)
    (B : Finset V) : chainSize cs B = (B ∩ chainVerts cs).card := by
  induction cs with
  | nil => simp [chainSize, chainVerts]
  | cons c cs ih =>
      simp only [ChainDisjoint, List.pairwise_cons] at hd
      obtain ⟨hdc, hdcs⟩ := hd
      have hdisj : Disjoint (B ∩ c.verts) (B ∩ chainVerts cs) := by
        rw [Finset.disjoint_left]
        intro a ha ha'
        obtain ⟨c', hc', hv⟩ := (mem_chainVerts_iff cs a).mp (Finset.mem_inter.mp ha').2
        exact Finset.disjoint_left.mp (hdc c' hc') (Finset.mem_inter.mp ha).2 hv
      rw [chainSize, ih hdcs, chainVerts, Finset.inter_union_distrib_left,
        Finset.card_union_of_disjoint hdisj]

end E993Transport
-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma E993Transport.chainSize_le_length 5feb79ed3065b9d6e7c42c63b8142bad998feb627f1d6dcc00d06d5ca1538292
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma chainSize_le_length (cs : List (ChainFactor V)) (B : Finset V)
    (h : ∀ c ∈ cs, (B ∩ c.verts).card ≤ 1) : chainSize cs B ≤ cs.length := by
  induction cs with
  | nil => simp [chainSize]
  | cons c cs ih =>
      have h1 := h c (by simp)
      have h2 := ih (fun c' hc' => h c' (by simp [hc']))
      simp only [chainSize, List.length_cons]
      omega

end E993Transport
-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma E993Transport.top_of_length_le_chainSize ac4b9d8227aeb56206cac0be221a3764507340765e07250f8ccd995e0a9dc8b9
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma top_of_length_le_chainSize (cs : List (ChainFactor V)) (B : Finset V)
    (h : ∀ c ∈ cs, (B ∩ c.verts).card ≤ 1 ∧
      ((B ∩ c.verts).card = 1 → (c.code B).1 = (c.code B).2))
    (hle : cs.length ≤ chainSize cs B) : ∀ c ∈ cs, (c.code B).1 = (c.code B).2 := by
  induction cs with
  | nil => simp
  | cons c cs ih =>
      have h1 := h c (by simp)
      have hsz := chainSize_le_length cs B (fun c' hc' => (h c' (by simp [hc'])).1)
      simp only [chainSize, List.length_cons] at hle
      intro c' hc'
      simp only [List.mem_cons] at hc'
      rcases hc' with rfl | hc'
      · exact h1.2 (by omega)
      · exact ih (fun c'' hc'' => h c'' (by simp [hc''])) (by omega) c' hc'

end E993Transport
-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma E993Transport.mem_indepFamily_iff d30c9ae0035311c89520623588b7418ed42be1a95848546b7b181e1a257411e5
namespace E993Transport

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_indepFamily_iff (G : SimpleGraph V) [DecidableRel G.Adj] (j : ℕ) (B : Finset V) :
    B ∈ indepFamily G j ↔ B.card = j ∧ G.IsIndepSet (B : Set V) := by
  simp [indepFamily, Finset.mem_powersetCard]

end E993Transport
-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN lemma E993Transport.erase_mem_indepFamily 2832798965770e894f108bf878bbc98df5a0a0b7738130529c712b613d44442b
namespace E993Transport

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma erase_mem_indepFamily (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) (B : Finset V)
    (hB : B ∈ indepFamily G (p + 1)) (q : V) (hq : q ∈ B) : B.erase q ∈ indepFamily G p := by
  rw [mem_indepFamily_iff] at hB ⊢
  refine ⟨?_, ?_⟩
  · rw [Finset.card_erase_of_mem hq, hB.1]
    rfl
  · exact hB.2.mono (by simp [Finset.coe_erase])

end E993Transport
-- VERITYOS ENTRY 83 END

-- VERITYOS ENTRY 84 BEGIN lemma E993Transport.saturatingFlow_of_perTag_deletionInjections 72ae49fe71d5923ebf506d4d48f40139072320a394af5c8f6b7611fa898fb048
namespace E993Transport

variable {V : Type*} [Fintype V] [DecidableEq V]

-- r30 C4-LA1 node N1: step (1) and step (3) of Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5).
/-- (N1) Per-tag injective single-deletion maps that keep the tag active give a
deletion-supported saturating flow: `f(B, A) = #{τ ∈ F : τ active in B, φ_τ(B) = A}`.
Any finite simple graph and any tag set `F`. -/
lemma saturatingFlow_of_perTag_deletionInjections (G : SimpleGraph V) [DecidableRel G.Adj]
    (F : Finset V) (p : ℕ) (φ : V → Finset V → Finset V)
    (hφ : ∀ τ ∈ F, ∀ B ∈ indepFamily G (p + 1), τ ∈ B →
      ¬ Disjoint (B.erase τ) (tagWitnesses G τ) →
        (∃ q ∈ B, φ τ B = B.erase q) ∧ τ ∈ φ τ B ∧
          ¬ Disjoint ((φ τ B).erase τ) (tagWitnesses G τ))
    (hinj : ∀ τ ∈ F, ∀ B ∈ indepFamily G (p + 1), ∀ B' ∈ indepFamily G (p + 1),
      τ ∈ B → ¬ Disjoint (B.erase τ) (tagWitnesses G τ) →
      τ ∈ B' → ¬ Disjoint (B'.erase τ) (tagWitnesses G τ) →
      φ τ B = φ τ B' → B = B') :
    ∃ f : Finset V → Finset V → ℕ,
      IsSaturatingFlow G F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q := by
  -- the active tags of `B`
  set act : Finset V → Finset V := fun B =>
    (F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v) with hact
  have mem_act : ∀ B τ, τ ∈ act B ↔
      τ ∈ F ∧ τ ∈ B ∧ ¬ Disjoint (B.erase τ) (tagWitnesses G τ) := by
    intro B τ
    simp [hact, Finset.mem_filter, Finset.mem_inter, and_assoc]
  have hw : ∀ B, activeWeight G F B = (act B).card := fun B => rfl
  have himage : ∀ B ∈ indepFamily G (p + 1), ∀ τ ∈ act B, φ τ B ∈ indepFamily G p := by
    intro B hB τ hτ
    obtain ⟨hτF, hτB, hτa⟩ := (mem_act B τ).mp hτ
    obtain ⟨⟨q, hqB, hφq⟩, -, -⟩ := hφ τ hτF B hB hτB hτa
    rw [hφq]
    exact erase_mem_indepFamily G p B hB q hqB
  let f : Finset V → Finset V → ℕ := fun B A =>
    if B ∈ indepFamily G (p + 1) then ((act B).filter fun τ => φ τ B = A).card else 0
  have hsupp : ∀ B A, 0 < f B A → B ∈ indepFamily G (p + 1) ∧ ∃ τ ∈ act B, φ τ B = A := by
    intro B A hpos
    by_cases hB : B ∈ indepFamily G (p + 1)
    · simp only [f, if_pos hB] at hpos
      obtain ⟨τ, hτ⟩ := Finset.card_pos.mp hpos
      exact ⟨hB, τ, (Finset.mem_filter.mp hτ).1, (Finset.mem_filter.mp hτ).2⟩
    · simp [f, hB] at hpos
  refine ⟨f, ⟨?_, ?_, ?_⟩, ?_⟩
  · -- support: independent layers and deletion arcs
    intro B A hpos
    obtain ⟨hB, τ, hτ, hφA⟩ := hsupp B A hpos
    obtain ⟨hτF, hτB, hτa⟩ := (mem_act B τ).mp hτ
    obtain ⟨⟨q, hqB, hφq⟩, -, -⟩ := hφ τ hτF B hB hτB hτa
    refine ⟨hB, hφA ▸ himage B hB τ hτ, Or.inl ⟨q, hqB, ?_⟩⟩
    rw [← hφA, hφq]
  · -- every source sends exactly its active weight
    intro B hB
    rw [hw, Finset.card_eq_sum_card_fiberwise (himage B hB)]
    refine Finset.sum_congr rfl (fun A _ => ?_)
    simp only [f, if_pos hB]
  · -- every target receives at most its active weight
    intro A hA
    have hrow : ∀ B, f B A = ∑ τ ∈ F,
        if B ∈ indepFamily G (p + 1) ∧ τ ∈ act B ∧ φ τ B = A then 1 else 0 := by
      intro B
      by_cases hB : B ∈ indepFamily G (p + 1)
      · simp only [f, if_pos hB]
        rw [← Finset.card_filter]
        congr 1
        ext τ
        simp only [Finset.mem_filter]
        constructor
        · rintro ⟨hτ, h⟩
          exact ⟨((mem_act B τ).mp hτ).1, hB, hτ, h⟩
        · rintro ⟨-, -, hτ, h⟩
          exact ⟨hτ, h⟩
      · simp [f, hB]
    have hcol : ∀ τ ∈ F, (∑ B ∈ indepFamily G (p + 1),
        if B ∈ indepFamily G (p + 1) ∧ τ ∈ act B ∧ φ τ B = A then 1 else 0) ≤
          if τ ∈ act A then 1 else 0 := by
      intro τ hτF
      rw [← Finset.card_filter]
      by_cases hτA : τ ∈ act A
      · rw [if_pos hτA, Finset.card_le_one]
        intro B hB B' hB'
        simp only [Finset.mem_filter] at hB hB'
        obtain ⟨hBI, -, hτB, hφB⟩ := hB
        obtain ⟨hBI', -, hτB', hφB'⟩ := hB'
        obtain ⟨-, hτB1, hτa⟩ := (mem_act B τ).mp hτB
        obtain ⟨-, hτB1', hτa'⟩ := (mem_act B' τ).mp hτB'
        exact hinj τ hτF B hBI B' hBI' hτB1 hτa hτB1' hτa' (hφB.trans hφB'.symm)
      · rw [if_neg hτA, Nat.le_zero, Finset.card_eq_zero, Finset.eq_empty_iff_forall_notMem]
        intro B hB
        simp only [Finset.mem_filter] at hB
        obtain ⟨hBI, -, hτB, hφB⟩ := hB
        obtain ⟨-, hτB1, hτa⟩ := (mem_act B τ).mp hτB
        obtain ⟨-, hτφ, hτφa⟩ := hφ τ hτF B hBI hτB1 hτa
        exact hτA ((mem_act A τ).mpr ⟨hτF, hφB ▸ hτφ, hφB ▸ hτφa⟩)
    calc ∑ B ∈ indepFamily G (p + 1), f B A
        = ∑ B ∈ indepFamily G (p + 1), ∑ τ ∈ F,
            (if B ∈ indepFamily G (p + 1) ∧ τ ∈ act B ∧ φ τ B = A then 1 else 0) :=
          Finset.sum_congr rfl (fun B _ => hrow B)
      _ = ∑ τ ∈ F, ∑ B ∈ indepFamily G (p + 1),
            (if B ∈ indepFamily G (p + 1) ∧ τ ∈ act B ∧ φ τ B = A then 1 else 0) :=
          Finset.sum_comm
      _ ≤ ∑ τ ∈ F, (if τ ∈ act A then 1 else 0) := Finset.sum_le_sum hcol
      _ = activeWeight G F A := by
          rw [hw, ← Finset.card_filter]
          congr 1
          ext τ
          simp only [Finset.mem_filter]
          constructor
          · rintro ⟨-, h⟩
            exact h
          · intro h
            exact ⟨((mem_act A τ).mp h).1, h⟩
  · -- deletion support
    intro B A hpos
    obtain ⟨hB, τ, hτ, hφA⟩ := hsupp B A hpos
    obtain ⟨hτF, hτB, hτa⟩ := (mem_act B τ).mp hτ
    obtain ⟨⟨q, hqB, hφq⟩, -, -⟩ := hφ τ hτF B hB hτB hτa
    exact ⟨q, hqB, hφA ▸ hφq⟩

end E993Transport
-- VERITYOS ENTRY 84 END

-- VERITYOS ENTRY 85 BEGIN lemma E993Transport.spiderVertex_val fac932afa4d2a76f67145cb066a670a7d6873fdad825ed9385cf0eed1bc41e91
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderVertex_val (k n : ℕ) (h : n < 3*k+4) : (spiderVertex k n).val = n :=
  Nat.mod_eq_of_lt h

end E993Transport
-- VERITYOS ENTRY 85 END

-- VERITYOS ENTRY 86 BEGIN lemma E993Transport.eq_spiderVertex_iff 503393b739708953a16f09d37990873318e606be6151b63aff7f40f7e92c21c2
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma eq_spiderVertex_iff (k n : ℕ) (h : n < 3*k+4) (v : Fin (3*k+4)) :
    v = spiderVertex k n ↔ v.val = n := by
  rw [Fin.ext_iff, spiderVertex_val k n h]

end E993Transport
-- VERITYOS ENTRY 86 END

-- VERITYOS ENTRY 87 BEGIN lemma E993Transport.spiderGraph_adj_iff da16e790ddf51e310f72194aa8c6b30f319121f62f216d2b097606554f567986
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderGraph_adj_iff (k : ℕ) (u v : Fin (3*k+4)) :
    (spiderOneTwoThrees k).Adj u v ↔ spiderEdge k u v ∨ spiderEdge k v u := by
  have hne : ∀ a b : Fin (3*k+4), spiderEdge k a b → a ≠ b := by
    intro a b h hab
    subst hab
    unfold spiderEdge at h
    rcases h with h | h | h | ⟨i, -, h | h | h⟩ <;> omega
  rw [spiderOneTwoThrees, SimpleGraph.fromRel_adj]
  constructor
  · exact fun h => h.2
  · intro h
    refine ⟨?_, h⟩
    rcases h with h | h
    · exact hne u v h
    · exact fun huv => hne v u h huv.symm

end E993Transport
-- VERITYOS ENTRY 87 END

-- VERITYOS ENTRY 88 BEGIN lemma E993Transport.spiderGraph_adj_of_val 603a58b8b67b3e8223268c79ed466966657d45019e91bc361fd2f31bfc63229f
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderGraph_adj_of_val (k : ℕ) (u v : Fin (3*k+4))
    (h : (u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3) ∨
        ∃ i < k, (u.val = 0 ∧ v.val = 4+3*i) ∨ (u.val = 4+3*i ∧ v.val = 5+3*i) ∨
          (u.val = 5+3*i ∧ v.val = 6+3*i)) :
    (spiderOneTwoThrees k).Adj u v :=
  (spiderGraph_adj_iff k u v).2 (Or.inl h)

end E993Transport
-- VERITYOS ENTRY 88 END

-- VERITYOS ENTRY 89 BEGIN lemma E993Transport.spiderGraph_adj_of_val_root 3750463b58191c406f89890e3797c09c0e95671629d5d3e10c8fe15d2fc71a44
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- a root/mid/cherry edge of `S(1,2,3^k)`, read on labels. -/
lemma spiderGraph_adj_of_val_root (k : ℕ) (u v : Fin (3*k+4))
    (h : (u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3)) :
    (spiderOneTwoThrees k).Adj u v := by
  apply spiderGraph_adj_of_val
  rcases h with h | h | h
  · exact Or.inl h
  · exact Or.inr (Or.inl h)
  · exact Or.inr (Or.inr (Or.inl h))

end E993Transport
-- VERITYOS ENTRY 89 END

-- VERITYOS ENTRY 90 BEGIN lemma E993Transport.spiderGraph_adj_of_val_arm 372e84edb449e2270d04e5d9afac0e8f56cf9db287d0e87a7c5014092df14cd0
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- an arm edge of `S(1,2,3^k)`, read on labels. -/
lemma spiderGraph_adj_of_val_arm (k : ℕ) (u v : Fin (3*k+4)) (j : ℕ) (hj : j < k)
    (h : (u.val = 0 ∧ v.val = 4+3*j) ∨ (u.val = 4+3*j ∧ v.val = 5+3*j) ∨
      (u.val = 5+3*j ∧ v.val = 6+3*j)) : (spiderOneTwoThrees k).Adj u v :=
  spiderGraph_adj_of_val k u v (Or.inr (Or.inr (Or.inr ⟨j, hj, h⟩)))

end E993Transport
-- VERITYOS ENTRY 90 END

-- VERITYOS ENTRY 91 BEGIN lemma E993Transport.spiderGraph_adj_zero_one e31d2d6937f9e499bda2e14669855e6ceaba56e7d4055a5f3b7ff104360a706f
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- the root–leaf edge `0 – 1`. -/
lemma spiderGraph_adj_zero_one (k : ℕ) :
    (spiderOneTwoThrees k).Adj (spiderVertex k 0) (spiderVertex k 1) :=
  spiderGraph_adj_of_val_root k _ _
    (Or.inl ⟨spiderVertex_val k 0 (by omega), spiderVertex_val k 1 (by omega)⟩)

end E993Transport
-- VERITYOS ENTRY 91 END

-- VERITYOS ENTRY 92 BEGIN lemma E993Transport.spiderGraph_adj_zero_two b18d339c5f6dbd3f22847cad83df1b5e0367cb87df612a68a9e77dba29c13610
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- the root–mid edge `0 – 2`. -/
lemma spiderGraph_adj_zero_two (k : ℕ) :
    (spiderOneTwoThrees k).Adj (spiderVertex k 0) (spiderVertex k 2) :=
  spiderGraph_adj_of_val_root k _ _
    (Or.inr (Or.inl ⟨spiderVertex_val k 0 (by omega), spiderVertex_val k 2 (by omega)⟩))

end E993Transport
-- VERITYOS ENTRY 92 END

-- VERITYOS ENTRY 93 BEGIN lemma E993Transport.spiderGraph_adj_two_three 608e2c1ba646cb420a706185da316edf28e02661d69512621ee83e9a86dadfbe
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- the mid–cherry-leaf edge `2 – 3`. -/
lemma spiderGraph_adj_two_three (k : ℕ) :
    (spiderOneTwoThrees k).Adj (spiderVertex k 2) (spiderVertex k 3) :=
  spiderGraph_adj_of_val_root k _ _
    (Or.inr (Or.inr ⟨spiderVertex_val k 2 (by omega), spiderVertex_val k 3 (by omega)⟩))

end E993Transport
-- VERITYOS ENTRY 93 END

-- VERITYOS ENTRY 94 BEGIN lemma E993Transport.spiderGraph_adj_zero_arm 93b02f8f41aebdff8a9d0b614eb136207044f2b05d285bcef86238c8c9bb421d
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- the root–arm edge `0 – a_i`, `a_i = 4+3i`. -/
lemma spiderGraph_adj_zero_arm (k i : ℕ) (hi : i < k) :
    (spiderOneTwoThrees k).Adj (spiderVertex k 0) (spiderVertex k (4+3*i)) :=
  spiderGraph_adj_of_val_arm k _ _ i hi
    (Or.inl ⟨spiderVertex_val k 0 (by omega), spiderVertex_val k (4+3*i) (by omega)⟩)

end E993Transport
-- VERITYOS ENTRY 94 END

-- VERITYOS ENTRY 95 BEGIN lemma E993Transport.spiderGraph_adj_arm_mid 5732e58ac5c3cac8766c5e1feaaac557447eccbce9ccf43799b00b524eeb314c
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- the arm edge `a_i – b_i`. -/
lemma spiderGraph_adj_arm_mid (k i : ℕ) (hi : i < k) :
    (spiderOneTwoThrees k).Adj (spiderVertex k (4+3*i)) (spiderVertex k (5+3*i)) :=
  spiderGraph_adj_of_val_arm k _ _ i hi
    (Or.inr (Or.inl ⟨spiderVertex_val k (4+3*i) (by omega), spiderVertex_val k (5+3*i) (by omega)⟩))

end E993Transport
-- VERITYOS ENTRY 95 END

-- VERITYOS ENTRY 96 BEGIN lemma E993Transport.spiderGraph_adj_arm_tip ad6c2855145f2ea53c8ac721a2cab244dc147f9d6bfe6bc855df84d128c63f56
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- the arm edge `b_i – c_i`. -/
lemma spiderGraph_adj_arm_tip (k i : ℕ) (hi : i < k) :
    (spiderOneTwoThrees k).Adj (spiderVertex k (5+3*i)) (spiderVertex k (6+3*i)) :=
  spiderGraph_adj_of_val_arm k _ _ i hi
    (Or.inr (Or.inr ⟨spiderVertex_val k (5+3*i) (by omega), spiderVertex_val k (6+3*i) (by omega)⟩))

end E993Transport
-- VERITYOS ENTRY 96 END

-- VERITYOS ENTRY 97 BEGIN lemma E993Transport.spiderGraph_reachable_zero 68aa68a5c7c961ed603444a4b65fa36b169968be6a787d27e5fc5ef42af42efa
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- every vertex of `S(1,2,3^k)` is reachable from the root, by an explicit walk of length ≤ 3. -/
lemma spiderGraph_reachable_zero (k : ℕ) (v : Fin (3*k+4)) :
    (spiderOneTwoThrees k).Reachable (spiderVertex k 0) v := by
  have hv : v = spiderVertex k v.val := (eq_spiderVertex_iff k v.val v.isLt v).mpr rfl
  rw [hv]
  set n := v.val with hn
  have hlt : n < 3*k+4 := v.isLt
  have hcase : n = 0 ∨ n = 1 ∨ n = 2 ∨ n = 3 ∨
      ∃ i, i < k ∧ (n = 4+3*i ∨ n = 5+3*i ∨ n = 6+3*i) := by
    by_cases h : n ≤ 3
    · omega
    · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨(n - 4) / 3, by omega, by omega⟩)))
  rcases hcase with h0 | h1 | h2 | h3 | ⟨i, hi, ha | hb | hc⟩
  · rw [h0]
  · rw [h1]; exact (spiderGraph_adj_zero_one k).reachable
  · rw [h2]; exact (spiderGraph_adj_zero_two k).reachable
  · rw [h3]; exact (spiderGraph_adj_zero_two k).reachable.trans (spiderGraph_adj_two_three k).reachable
  · rw [ha]; exact (spiderGraph_adj_zero_arm k i hi).reachable
  · rw [hb]
    exact (spiderGraph_adj_zero_arm k i hi).reachable.trans (spiderGraph_adj_arm_mid k i hi).reachable
  · rw [hc]
    exact ((spiderGraph_adj_zero_arm k i hi).reachable.trans (spiderGraph_adj_arm_mid k i hi).reachable).trans
      (spiderGraph_adj_arm_tip k i hi).reachable

end E993Transport
-- VERITYOS ENTRY 97 END

-- VERITYOS ENTRY 98 BEGIN lemma E993Transport.spiderGraph_connected ac2780f91bd73e336f1e281540ed593d979aeca7d716cf7ce855c93bbed8f8ab
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- `S(1,2,3^k)` is connected. -/
lemma spiderGraph_connected (k : ℕ) : (spiderOneTwoThrees k).Connected :=
  (SimpleGraph.connected_iff_exists_forall_reachable (spiderOneTwoThrees k)).mpr
    ⟨spiderVertex k 0, spiderGraph_reachable_zero k⟩

end E993Transport
-- VERITYOS ENTRY 98 END

-- VERITYOS ENTRY 99 BEGIN lemma E993Transport.spiderParentVal_lt b89d2f65b2e3539649377d62a4c6f520c9ba632eee3c262cf54223ce30afcb10
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderParentVal_lt (n : ℕ) (hn : 1 ≤ n) : spiderParentVal n < n := by
  unfold spiderParentVal
  split_ifs <;> omega

end E993Transport
-- VERITYOS ENTRY 99 END

-- VERITYOS ENTRY 100 BEGIN lemma E993Transport.spiderGraph_adj_parent 3c67ffe95709758f5dc98d846492bc6976310fa8ac20cefd82029cce00d7e471
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- every non-root vertex is adjacent to its parent. -/
lemma spiderGraph_adj_parent (k : ℕ) (v : Fin (3*k+4)) (hv : v.val ≠ 0) :
    (spiderOneTwoThrees k).Adj v (spiderParent k v) := by
  have hlt : v.val < 3*k+4 := v.isLt
  unfold spiderParent spiderParentVal
  by_cases h1 : v.val = 1
  · rw [if_pos h1]
    have hveq : v = spiderVertex k 1 := (eq_spiderVertex_iff k 1 (by omega) v).mpr h1
    rw [hveq]; exact (spiderGraph_adj_zero_one k).symm
  rw [if_neg h1]
  by_cases h2 : v.val = 2
  · rw [if_pos h2]
    have hveq : v = spiderVertex k 2 := (eq_spiderVertex_iff k 2 (by omega) v).mpr h2
    rw [hveq]; exact (spiderGraph_adj_zero_two k).symm
  rw [if_neg h2]
  by_cases h3 : v.val = 3
  · rw [if_pos h3]
    have hveq : v = spiderVertex k 3 := (eq_spiderVertex_iff k 3 (by omega) v).mpr h3
    rw [hveq]; exact (spiderGraph_adj_two_three k).symm
  rw [if_neg h3]
  by_cases h4 : (v.val - 4) % 3 = 0
  · rw [if_pos h4]
    have hik : (v.val - 4) / 3 < k := by omega
    have hveq : v = spiderVertex k (4 + 3 * ((v.val - 4) / 3)) :=
      (eq_spiderVertex_iff k (4 + 3 * ((v.val - 4) / 3)) (by omega) v).mpr (by omega)
    rw [hveq]; exact (spiderGraph_adj_zero_arm k _ hik).symm
  · rw [if_neg h4]
    -- `v.val = 5+3i` or `v.val = 6+3i` for the unique `i < k`
    have hge : 4 ≤ v.val := by omega
    rcases (by omega : v.val - 1 = 4 + 3 * ((v.val - 4) / 3) ∨
        v.val - 1 = 5 + 3 * ((v.val - 4 - 1) / 3)) with hi | hi
    · set i := (v.val - 4) / 3 with hidef
      have hik : i < k := by omega
      have hpeq : spiderVertex k (v.val - 1) = spiderVertex k (4 + 3 * i) := by
        rw [hidef]; congr 1
      have hveq : v = spiderVertex k (5 + 3 * i) :=
        (eq_spiderVertex_iff k (5 + 3 * i) (by omega) v).mpr (by omega)
      rw [hpeq, hveq]
      exact (spiderGraph_adj_arm_mid k i hik).symm
    · set i := (v.val - 4 - 1) / 3 with hidef
      have hik : i < k := by omega
      have hpeq : spiderVertex k (v.val - 1) = spiderVertex k (5 + 3 * i) := by
        rw [hidef]; congr 1
      have hveq : v = spiderVertex k (6 + 3 * i) :=
        (eq_spiderVertex_iff k (6 + 3 * i) (by omega) v).mpr (by omega)
      rw [hpeq, hveq]
      exact (spiderGraph_adj_arm_tip k i hik).symm

end E993Transport
-- VERITYOS ENTRY 100 END

-- VERITYOS ENTRY 101 BEGIN lemma E993Transport.spiderParentVal_le 7099d721603ec74d5f9e0831c702625df20ac7b89a3fe8b6a7b90fb8f0eda259
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderParentVal_le (n : ℕ) : spiderParentVal n ≤ n := by
  unfold spiderParentVal; split_ifs <;> omega

end E993Transport
-- VERITYOS ENTRY 101 END

-- VERITYOS ENTRY 102 BEGIN lemma E993Transport.spiderChildEdge_injective 5adb17302221d31bd5e1832ee4b62cdc3b87d71aaca864ca27c624d7cb900f8c
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- distinct non-root vertices give distinct child–parent edges. -/
lemma spiderChildEdge_injective (k : ℕ) : Function.Injective (spiderChildEdge k) := by
  rintro ⟨v, hv⟩ ⟨w, hw⟩ h
  simp only [spiderChildEdge, Sym2.eq_iff] at h
  rcases h with ⟨h1, _⟩ | ⟨h1, h2⟩
  · exact Subtype.ext h1
  · exfalso
    have hvlt := spiderParentVal_lt v.val (by omega)
    have hwlt := spiderParentVal_lt w.val (by omega)
    have e1 : v.val = spiderParentVal w.val := by
      have h1' := congrArg Fin.val h1
      unfold spiderParent at h1'
      rwa [spiderVertex_val k (spiderParentVal w.val) (by omega)] at h1'
    have e2 : w.val = spiderParentVal v.val := by
      have h2' := congrArg Fin.val h2
      unfold spiderParent at h2'
      rw [spiderVertex_val k (spiderParentVal v.val) (by omega)] at h2'
      exact h2'.symm
    omega

end E993Transport
-- VERITYOS ENTRY 102 END

-- VERITYOS ENTRY 103 BEGIN lemma E993Transport.spiderParentVal_at_one bcf9b0052f559f6a5e36a89f0c0817b0ae4531144ffd1ab0b9cf975e7e29fc94
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderParentVal_at_one : spiderParentVal 1 = 0 := by unfold spiderParentVal; norm_num

end E993Transport
-- VERITYOS ENTRY 103 END

-- VERITYOS ENTRY 104 BEGIN lemma E993Transport.spiderParentVal_at_two 769137ef5f57379004a270469301953d6ee2dbdc3b295e731d4c0ac459f8e270
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderParentVal_at_two : spiderParentVal 2 = 0 := by unfold spiderParentVal; norm_num

end E993Transport
-- VERITYOS ENTRY 104 END

-- VERITYOS ENTRY 105 BEGIN lemma E993Transport.spiderParentVal_at_three e5558bbcd2c9671c44b7205cb749ba328626cfeb1498720c05c225a8c4bbfed9
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderParentVal_at_three : spiderParentVal 3 = 2 := by unfold spiderParentVal; norm_num

end E993Transport
-- VERITYOS ENTRY 105 END

-- VERITYOS ENTRY 106 BEGIN lemma E993Transport.spiderParentVal_at_arm_start c73523a45945ec8a86c140fbba290127bad8b573873ba9ed00dc165dfe06c096
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderParentVal_at_arm_start (i : ℕ) : spiderParentVal (4+3*i) = 0 := by
  unfold spiderParentVal
  rw [if_neg (by omega : 4+3*i ≠ 1), if_neg (by omega : 4+3*i ≠ 2),
      if_neg (by omega : 4+3*i ≠ 3), if_pos (by omega : (4+3*i-4) % 3 = 0)]

end E993Transport
-- VERITYOS ENTRY 106 END

-- VERITYOS ENTRY 107 BEGIN lemma E993Transport.spiderParentVal_at_arm_mid 4dec51ceddf667417364b8640743b512f427dfef9078ba8d5e3bd01c39e83716
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderParentVal_at_arm_mid (i : ℕ) : spiderParentVal (5+3*i) = 4+3*i := by
  unfold spiderParentVal
  rw [if_neg (by omega : 5+3*i ≠ 1), if_neg (by omega : 5+3*i ≠ 2),
      if_neg (by omega : 5+3*i ≠ 3), if_neg (by omega : ¬ (5+3*i-4) % 3 = 0)]
  omega

end E993Transport
-- VERITYOS ENTRY 107 END

-- VERITYOS ENTRY 108 BEGIN lemma E993Transport.spiderParentVal_at_arm_tip 7c77dfa5f3e2bdeeea295eb2a7eb770e21248e3c9bf0db7a357d033fdf8a9ce1
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
lemma spiderParentVal_at_arm_tip (i : ℕ) : spiderParentVal (6+3*i) = 5+3*i := by
  unfold spiderParentVal
  rw [if_neg (by omega : 6+3*i ≠ 1), if_neg (by omega : 6+3*i ≠ 2),
      if_neg (by omega : 6+3*i ≠ 3), if_neg (by omega : ¬ (6+3*i-4) % 3 = 0)]
  omega

end E993Transport
-- VERITYOS ENTRY 108 END

-- VERITYOS ENTRY 109 BEGIN lemma E993Transport.spiderChildEdge_range 701ed7219622a275248d4665f14d13faf6298d8448e359cef06af5ebdfcacf63
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- the range of the child–parent map is exactly the edge set of `S(1,2,3^k)`. -/
lemma spiderChildEdge_range (k : ℕ) :
    Set.range (spiderChildEdge k) = (spiderOneTwoThrees k).edgeSet := by
  ext e
  refine ⟨?_, ?_⟩
  · rintro ⟨⟨v, hv⟩, rfl⟩
    show s(v, spiderParent k v) ∈ (spiderOneTwoThrees k).edgeSet
    rw [SimpleGraph.mem_edgeSet]
    exact spiderGraph_adj_parent k v hv
  · refine Sym2.inductionOn e (fun a b hab => ?_)
    rw [SimpleGraph.mem_edgeSet, spiderGraph_adj_iff] at hab
    have core : ∀ a b : Fin (3*k+4),
        ((a.val = 0 ∧ b.val = 1) ∨ (a.val = 0 ∧ b.val = 2) ∨ (a.val = 2 ∧ b.val = 3) ∨
          ∃ i < k, (a.val = 0 ∧ b.val = 4+3*i) ∨ (a.val = 4+3*i ∧ b.val = 5+3*i) ∨
            (a.val = 5+3*i ∧ b.val = 6+3*i)) →
        ∃ v : {v : Fin (3*k+4) // v.val ≠ 0}, spiderChildEdge k v = s(a, b) := by
      intro a b hc
      have hbne : b.val ≠ 0 := by
        rcases hc with h|h|h|⟨i,hi,h|h|h⟩ <;> omega
      refine ⟨⟨b, hbne⟩, ?_⟩
      show s(b, spiderParent k b) = s(a, b)
      have haeq : spiderParent k b = a := by
        apply Fin.ext
        show (spiderVertex k (spiderParentVal b.val)).val = a.val
        rcases hc with h|h|h|⟨i,hi,h|h|h⟩
        · rw [h.2, spiderParentVal_at_one, spiderVertex_val k 0 (by omega)]; omega
        · rw [h.2, spiderParentVal_at_two, spiderVertex_val k 0 (by omega)]; omega
        · rw [h.2, spiderParentVal_at_three, spiderVertex_val k 2 (by omega)]; omega
        · rw [h.2, spiderParentVal_at_arm_start, spiderVertex_val k 0 (by omega)]; omega
        · rw [h.2, spiderParentVal_at_arm_mid, spiderVertex_val k (4+3*i) (by omega)]; omega
        · rw [h.2, spiderParentVal_at_arm_tip, spiderVertex_val k (5+3*i) (by omega)]; omega
      rw [haeq, Sym2.eq_iff]; tauto
    rcases hab with h | h
    · exact core a b h
    · obtain ⟨v, hv⟩ := core b a h
      exact ⟨v, by rw [hv, Sym2.eq_swap]⟩

end E993Transport
-- VERITYOS ENTRY 109 END

-- VERITYOS ENTRY 110 BEGIN lemma E993Transport.spiderGraph_card_nonroot 3dcdecaab442a530eae94b1157c48a6a05c190144acea68bac5e1c40495c454a
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- exactly one non-root vertex fewer than the whole vertex set. -/
lemma spiderGraph_card_nonroot (k : ℕ) :
    Fintype.card {v : Fin (3*k+4) // v.val ≠ 0} + 1 = Fintype.card (Fin (3*k+4)) := by
  have hbij : {v : Fin (3*k+4) // v.val ≠ 0} ≃ {v : Fin (3*k+4) // v ≠ spiderVertex k 0} :=
    Equiv.subtypeEquivRight (fun v => by
      constructor
      · intro hv hcontra; exact hv ((eq_spiderVertex_iff k 0 (by omega) v).mp hcontra)
      · intro hv hcontra; exact hv ((eq_spiderVertex_iff k 0 (by omega) v).mpr hcontra))
  rw [Fintype.card_congr hbij, Fintype.card_subtype_compl (fun v => v = spiderVertex k 0),
      Fintype.card_subtype_eq, Fintype.card_fin]
  omega

end E993Transport
-- VERITYOS ENTRY 110 END

-- VERITYOS ENTRY 111 BEGIN lemma E993Transport.spiderOneTwoThrees_isTree 964caeabfe1aee59a7b8d4f54d492fb52aeab15adaa90af9fb11a9ccc6c4ffa3
namespace E993Transport

-- r30 C6-LA2 N1: U1 scratch `Spider.lean` (18396be5…; U1, Claude Sonnet 5), re-authored as a registrar entry by the C6-LA2
-- formalizer (Claude Opus 5.5); the tree-layer pattern is r30 C5-LA1 entries 121–143 (`gkGraph_isTree`, the C5-LA1 formalizer).
/-- **N1.** `S(1,2,3^k)` is a tree: connected (`spiderGraph_connected`) with exactly `3k+3` edges
    on `3k+4` vertices (the child–parent bijection `spiderChildEdge`). Method: the child–parent edge
    bijection of `gkGraph_isTree` (r30 C5-LA1 entry 143), transcribed to the spider's edge set. -/
lemma spiderOneTwoThrees_isTree (k : ℕ) : (spiderOneTwoThrees k).IsTree := by
  rw [SimpleGraph.isTree_iff_connected_and_card]
  refine ⟨spiderGraph_connected k, ?_⟩
  rw [← spiderChildEdge_range, Nat.card_range_of_injective (spiderChildEdge_injective k)]
  rw [Nat.card_eq_fintype_card, Nat.card_eq_fintype_card]
  exact spiderGraph_card_nonroot k

end E993Transport
-- VERITYOS ENTRY 111 END

-- VERITYOS ENTRY 112 BEGIN lemma E993Transport.spiderCell_lt 60dbba089a95c33932e2f4720bd1b745727a87f3023bc6c2e0ab3a7ae596d762
namespace E993Transport

-- r30 C6-LA2 α (upper bound): critic `C-U1-F` scratch `CriticN2.lean` (0a0aac07…; r30 Cycle 6, Claude Opus 5.5), re-authored
-- as a registrar entry by the C6-LA2 formalizer (Claude Opus 5.5).
lemma spiderCell_lt (k n : ℕ) (hn : n < 3*k+4) : spiderCell n < 2*k+2 := by
  unfold spiderCell; split_ifs <;> omega

end E993Transport
-- VERITYOS ENTRY 112 END

-- VERITYOS ENTRY 113 BEGIN lemma E993Transport.spiderCell_eq_partner 1bc00a1860e91cd4feecd280b7253a172a7aae438ce67cbcf426d5ea5117596d
namespace E993Transport

-- r30 C6-LA2 α (upper bound): critic `C-U1-F` scratch `CriticN2.lean` (Claude Opus 5.5).
lemma spiderCell_eq_partner (u v : ℕ) (h : spiderCell u = spiderCell v) :
    v = u ∨ v = spiderPartner u := by
  unfold spiderCell at h
  unfold spiderPartner
  split_ifs at h ⊢ <;> omega

end E993Transport
-- VERITYOS ENTRY 113 END

-- VERITYOS ENTRY 114 BEGIN lemma E993Transport.spider_adj_partner 35b0f61f7e050eda05bb6481f534a7f9b511cc2a4728cfdd3b20952aa570124c
namespace E993Transport

-- r30 C6-LA2 α (upper bound): critic `C-U1-F` scratch `CriticN2.lean` (Claude Opus 5.5).
lemma spider_adj_partner (k : ℕ) (u v : Fin (3*k+4)) (hne : v.val ≠ u.val)
    (hv : v.val = spiderPartner u.val) :
    (spiderOneTwoThrees k).Adj u v ∨ (spiderOneTwoThrees k).Adj v u := by
  have hu := u.isLt
  have hvl := v.isLt
  unfold spiderPartner at hv
  split_ifs at hv with h0 h1 h2 h3 h4 h5
  · exact Or.inl (spiderGraph_adj_of_val k u v (Or.inl ⟨h0, hv⟩))
  · exact Or.inr (spiderGraph_adj_of_val k v u (Or.inl ⟨hv, h1⟩))
  · exact Or.inl (spiderGraph_adj_of_val k u v (Or.inr (Or.inr (Or.inl ⟨h2, hv⟩))))
  · exact Or.inr (spiderGraph_adj_of_val k v u (Or.inr (Or.inr (Or.inl ⟨hv, h3⟩))))
  · exact Or.inl (spiderGraph_adj_of_val k u v
      (Or.inr (Or.inr (Or.inr ⟨(u.val - 4) / 3, by omega, Or.inr (Or.inl ⟨by omega, by omega⟩)⟩))))
  · exact Or.inr (spiderGraph_adj_of_val k v u
      (Or.inr (Or.inr (Or.inr ⟨(u.val - 4) / 3, by omega, Or.inr (Or.inl ⟨by omega, by omega⟩)⟩))))
  · exact absurd hv hne

end E993Transport
-- VERITYOS ENTRY 114 END

-- VERITYOS ENTRY 115 BEGIN lemma E993Transport.spiderCell_eq_adj cc0fb365b141ae860d021d298f64e7cbe8a7bae1357f0fcc1f529c59b9e4ef12
namespace E993Transport

-- r30 C6-LA2 α (upper bound): critic `C-U1-F` scratch `CriticN2.lean` (Claude Opus 5.5).
lemma spiderCell_eq_adj (k : ℕ) (u v : Fin (3*k+4)) (hne : u.val ≠ v.val)
    (h : spiderCell u.val = spiderCell v.val) :
    (spiderOneTwoThrees k).Adj u v ∨ (spiderOneTwoThrees k).Adj v u := by
  rcases spiderCell_eq_partner u.val v.val h with h' | h'
  · exact absurd h'.symm hne
  · exact spider_adj_partner k u v (Ne.symm hne) h'

end E993Transport
-- VERITYOS ENTRY 115 END

-- VERITYOS ENTRY 116 BEGIN lemma E993Transport.spider_indep_card_le c0bb534cfb8002b873e6a4d56e8ce597f9c0b69e0aa4b1043b08b47408ba5a96
namespace E993Transport

-- r30 C6-LA2 α (upper bound): critic `C-U1-F` scratch `CriticN2.lean` (Claude Opus 5.5).
/-- upper bound: every independent set of `S(1,2,3^k)` has at most `2k+2` vertices (one per cell). -/
lemma spider_indep_card_le (k : ℕ) (s : Finset (Fin (3*k+4)))
    (hs : (spiderOneTwoThrees k).IsIndepSet (s : Set (Fin (3*k+4)))) : s.card ≤ 2*k+2 := by
  classical
  have hmaps : ∀ v ∈ s, spiderCell v.val ∈ Finset.range (2*k+2) := by
    intro v _
    exact Finset.mem_range.mpr (spiderCell_lt k v.val v.isLt)
  have hinj : Set.InjOn (fun v : Fin (3*k+4) => spiderCell v.val) (s : Set (Fin (3*k+4))) := by
    intro u hu v hv huv
    by_contra hne
    have hne' : u.val ≠ v.val := fun h => hne (Fin.ext h)
    rcases spiderCell_eq_adj k u v hne' huv with ha | ha
    · exact hs hu hv hne ha
    · exact hs hv hu (Ne.symm hne) ha
  have := Finset.card_le_card_of_injOn (fun v : Fin (3*k+4) => spiderCell v.val) hmaps hinj
  simpa using this

end E993Transport
-- VERITYOS ENTRY 116 END

-- VERITYOS ENTRY 117 BEGIN lemma E993Transport.card_range_filter_ne_zero_mod_three_ne_two f92b2f05c11caa4c9dc505e39d427f5736d6cdc6164561a13fe825a9d8c4c576
namespace E993Transport

-- r30 C6-LA2 α (lower bound): critic `C-U1-T` scratch `CriticIndepLB.lean` (edf35df0…; r30 Cycle 6, Claude Opus 5.5),
-- re-authored as a registrar entry by the C6-LA2 formalizer (Claude Opus 5.5); induction on `k`, no enumeration.
lemma card_range_filter_ne_zero_mod_three_ne_two (k : ℕ) :
    ((Finset.range (3*k+4)).filter fun n => n ≠ 0 ∧ n % 3 ≠ 2).card = 2*k+2 := by
  induction k with
  | zero => rfl
  | succ k ih =>
      have h : 3*(k+1)+4 = (3*k+4) + 3 := by ring
      rw [h, Finset.range_add_one, Finset.range_add_one, Finset.range_add_one]
      rw [Finset.filter_insert, Finset.filter_insert, Finset.filter_insert]
      rw [if_pos (by omega : (3*k+4+2 ≠ 0 ∧ (3*k+4+2) % 3 ≠ 2)),
          if_neg (by omega : ¬ (3*k+4+1 ≠ 0 ∧ (3*k+4+1) % 3 ≠ 2)),
          if_pos (by omega : (3*k+4 ≠ 0 ∧ (3*k+4) % 3 ≠ 2))]
      rw [Finset.card_insert_of_notMem, Finset.card_insert_of_notMem, ih]
      · omega
      · simp only [Finset.mem_filter, Finset.mem_range]; omega
      · simp only [Finset.mem_insert, Finset.mem_filter, Finset.mem_range]; omega

end E993Transport
-- VERITYOS ENTRY 117 END

-- VERITYOS ENTRY 118 BEGIN lemma E993Transport.spiderIndepWitness_card 84cc4ba473f8accfe1fa539c413d0fddc7e4a92cf89bfee307bc14d22aa809c7
namespace E993Transport

-- r30 C6-LA2 α (lower bound): critic `C-U1-T` scratch `CriticIndepLB.lean` (Claude Opus 5.5).
lemma spiderIndepWitness_card (k : ℕ) : (spiderIndepWitness k).card = 2*k+2 := by
  rw [← card_range_filter_ne_zero_mod_three_ne_two k]
  unfold spiderIndepWitness
  rw [← Finset.card_map Fin.valEmbedding]
  congr 1
  ext n
  simp only [Finset.mem_map, Finset.mem_filter, Finset.mem_univ, true_and, Fin.valEmbedding_apply,
    Finset.mem_range]
  constructor
  · rintro ⟨v, hv, rfl⟩
    exact ⟨v.isLt, hv⟩
  · rintro ⟨hn, hv⟩
    exact ⟨⟨n, hn⟩, hv, rfl⟩

end E993Transport
-- VERITYOS ENTRY 118 END

-- VERITYOS ENTRY 119 BEGIN lemma E993Transport.spiderIndepWitness_isIndepSet 018a43843e12e98d3b0d9115722af86df8082bea8d9b237247cc7ba133328471
namespace E993Transport

-- r30 C6-LA2 α (lower bound): critic `C-U1-T` scratch `CriticIndepLB.lean` (Claude Opus 5.5): every edge of `spiderEdge`
-- has an endpoint labelled `0`, `2` or `5+3i`.
lemma spiderIndepWitness_isIndepSet (k : ℕ) :
    (spiderOneTwoThrees k).IsIndepSet (spiderIndepWitness k : Set (Fin (3*k+4))) := by
  intro u hu v hv _ hadj
  simp only [spiderIndepWitness, Finset.coe_filter, Finset.mem_univ, true_and,
    Set.mem_setOf_eq] at hu hv
  rw [spiderGraph_adj_iff] at hadj
  unfold spiderEdge at hadj
  rcases hadj with (h | h | h | ⟨i, -, h | h | h⟩) | (h | h | h | ⟨i, -, h | h | h⟩) <;> omega

end E993Transport
-- VERITYOS ENTRY 119 END

-- VERITYOS ENTRY 120 BEGIN lemma E993Transport.spiderOneTwoThrees_indepNum_ge 926aa3d106dd315f6c75c8d02349b881aab09d31564b7d3a7152ae8451bb0516
namespace E993Transport

-- r30 C6-LA2 α (lower bound): critic `C-U1-T` scratch `CriticIndepLB.lean` (Claude Opus 5.5).
lemma spiderOneTwoThrees_indepNum_ge (k : ℕ) : 2*k+2 ≤ (spiderOneTwoThrees k).indepNum := by
  have h := (spiderIndepWitness_isIndepSet k).card_le_indepNum
  rwa [spiderIndepWitness_card] at h

end E993Transport
-- VERITYOS ENTRY 120 END

-- VERITYOS ENTRY 121 BEGIN lemma E993Transport.spiderOneTwoThrees_indepNum_eq e0444be98b78c5d4480941b59eb848c296bf9c9c47b0bd6ebaeed1345e470edc
namespace E993Transport

-- r30 C6-LA2 α: the equality of critic `C-U1-F` (`CriticN2.lean`, r30 Cycle 6, Claude Opus 5.5): upper bound by the cells,
-- lower bound by critic `C-U1-T`'s witness (`CriticIndepLB.lean`, r30 Cycle 6, Claude Opus 5.5).
/-- `α(S(1,2,3^k)) = 2k+2`, for every `k`. -/
lemma spiderOneTwoThrees_indepNum_eq (k : ℕ) : (spiderOneTwoThrees k).indepNum = 2*k+2 := by
  refine le_antisymm ?_ (spiderOneTwoThrees_indepNum_ge k)
  obtain ⟨s, hs⟩ := (spiderOneTwoThrees k).exists_isNIndepSet_indepNum
  rw [← hs.card_eq]
  exact spider_indep_card_le k s hs.isIndepSet

end E993Transport
-- VERITYOS ENTRY 121 END

-- VERITYOS ENTRY 122 BEGIN lemma E993Transport.spider_lowWindow_kPlus3 92cf6b493ca46d406fc5d22d76363be34d063010182e883fbd02986efabb295d
namespace E993Transport

-- r30 C6-LA2 low window: critic `C-U1-F` scratch `CriticCompose.lean` (8d38f023…; r30 Cycle 6, Claude Opus 5.5). This is the
-- ONLY use of `5 ≤ k`: `3(k+3) < 2(2k+2)+1 ⇔ k ≥ 5`; the window is empty for `k ≤ 4`.
/-- the low-window inequality `3p < 2α + 1` at `p = k+3`, for `k ≥ 5`. -/
lemma spider_lowWindow_kPlus3 (k : ℕ) (hk : 5 ≤ k) :
    3 * (k + 3) < 2 * (spiderOneTwoThrees k).indepNum + 1 := by
  rw [spiderOneTwoThrees_indepNum_eq]; omega

end E993Transport
-- VERITYOS ENTRY 122 END

-- VERITYOS ENTRY 123 BEGIN lemma E993Transport.support_eq_of_isGraphLeaf_of_adj 16687f86fa9b55f6996ffb8d02fcf3cf1af6129033605d60c019f33c360b620d
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
-- VERITYOS ENTRY 123 END

-- VERITYOS ENTRY 124 BEGIN lemma E993Transport.mem_tagWitnesses_iff_of_adj 772a13c0522f1c4b7c8d93dc3920688ea5649302271cbd8799d1c575e8773de5
namespace E993Transport

-- r30 C6-LA2 (F0), authored in-run (C6-LA2 formalizer, Claude Opus 5.5); graph-generic.
/-- `W_v = N(s_v) ∖ {v}`, read at a leaf `v` with neighbour `s`. -/
lemma mem_tagWitnesses_iff_of_adj {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v s w : V) (hv : C4LA1.IsGraphLeaf G v)
    (hs : G.Adj v s) : w ∈ tagWitnesses G v ↔ w ≠ v ∧ G.Adj s w := by
  rw [tagWitnesses, support_eq_of_isGraphLeaf_of_adj G v s hv hs, Finset.mem_erase,
    SimpleGraph.mem_neighborFinset]

end E993Transport
-- VERITYOS ENTRY 124 END

-- VERITYOS ENTRY 125 BEGIN lemma E993Transport.not_disjoint_erase_tagWitnesses_iff_exists_mem 2eb56fdf02af30111a49f53ebb5f3ec54d5508151d070553e4ef0c9f6eab442a
namespace E993Transport

-- r30 C6-LA2 (F0), authored in-run (C6-LA2 formalizer, Claude Opus 5.5); graph-generic: `v` is active in `B` iff `B`
-- contains a witness of `v` (a witness is never `v` itself).
lemma not_disjoint_erase_tagWitnesses_iff_exists_mem {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (B : Finset V) :
    ¬ Disjoint (B.erase v) (tagWitnesses G v) ↔ ∃ w ∈ B, w ∈ tagWitnesses G v := by
  rw [Finset.not_disjoint_iff]
  constructor
  · rintro ⟨w, hw, hw'⟩
    exact ⟨w, Finset.mem_of_mem_erase hw, hw'⟩
  · rintro ⟨w, hw, hw'⟩
    have hne : w ≠ v := by
      unfold tagWitnesses at hw'
      exact Finset.ne_of_mem_erase hw'
    exact ⟨w, Finset.mem_erase.mpr ⟨hne, hw⟩, hw'⟩

end E993Transport
-- VERITYOS ENTRY 125 END

-- VERITYOS ENTRY 126 BEGIN lemma E993Transport.inter_insert_insert_singleton_eq_pair b057e69c5dace7e035f60f40eb8d45960f80421f6cd61657d3a415735a04aff6
namespace E993Transport

-- r30 C6-LA2 (F4), authored in-run (C6-LA2 formalizer, Claude Opus 5.5); transcribes the statement of r30 C4-LA1 entry 102
-- (not carried: C4-LA1 entries 76–113 are excluded) under a new name.
lemma inter_insert_insert_singleton_eq_pair {V : Type*} [DecidableEq V] (B : Finset V) (x y z : V)
    (hx : x ∈ B) (hy : y ∉ B) (hz : z ∈ B) : B ∩ {x, y, z} = {x, z} := by
  ext w
  simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hw, rfl | rfl | rfl⟩
    · exact Or.inl rfl
    · exact (hy hw).elim
    · exact Or.inr rfl
  · rintro (rfl | rfl)
    · exact ⟨hx, Or.inl rfl⟩
    · exact ⟨hz, Or.inr (Or.inr rfl)⟩

end E993Transport
-- VERITYOS ENTRY 126 END

-- VERITYOS ENTRY 127 BEGIN lemma E993Transport.spiderGraph_adj_iff_val 154e75cedd45cbcf84228ef90f8c8385f309d519dad0c33301454f074232207e
namespace E993Transport

-- r30 C6-LA2, authored in-run (C6-LA2 formalizer, Claude Opus 5.5); pattern: r30 C4-LA1 entry 79.
/-- adjacency of `S(1,2,3^k)` read on labels. -/
lemma spiderGraph_adj_iff_val (k : ℕ) (u v : Fin (3*k+4)) :
    (spiderOneTwoThrees k).Adj u v ↔
      ((u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3) ∨
        ∃ i < k, (u.val = 0 ∧ v.val = 4+3*i) ∨ (u.val = 4+3*i ∧ v.val = 5+3*i) ∨
          (u.val = 5+3*i ∧ v.val = 6+3*i)) ∨
      ((v.val = 0 ∧ u.val = 1) ∨ (v.val = 0 ∧ u.val = 2) ∨ (v.val = 2 ∧ u.val = 3) ∨
        ∃ i < k, (v.val = 0 ∧ u.val = 4+3*i) ∨ (v.val = 4+3*i ∧ u.val = 5+3*i) ∨
          (v.val = 5+3*i ∧ u.val = 6+3*i)) := by
  rw [spiderGraph_adj_iff]
  rfl

end E993Transport
-- VERITYOS ENTRY 127 END

-- VERITYOS ENTRY 128 BEGIN lemma E993Transport.spiderVertex_ne 14d35f98368006ed69e70a425156de8c247e70c33c07691aff04667c392034b8
namespace E993Transport

-- r30 C6-LA2, authored in-run (C6-LA2 formalizer, Claude Opus 5.5); pattern: r30 C4-LA1 entry 92.
lemma spiderVertex_ne (k m n : ℕ) (hm : m < 3*k+4) (hn : n < 3*k+4) (hmn : m ≠ n) :
    spiderVertex k m ≠ spiderVertex k n := by
  intro h
  have := congrArg Fin.val h
  rw [spiderVertex_val k m hm, spiderVertex_val k n hn] at this
  exact hmn this

end E993Transport
-- VERITYOS ENTRY 128 END

-- VERITYOS ENTRY 129 BEGIN lemma E993Transport.spider_not_adj_of_indep b8d46b4137f39fec3ba30444b47309dae7bb51a44736ab2d3d552630e012118b
namespace E993Transport

-- r30 C6-LA2, authored in-run (C6-LA2 formalizer, Claude Opus 5.5); pattern: r30 C4-LA1 entry 95.
/-- two members of an independent set of `S(1,2,3^k)` are not adjacent. -/
lemma spider_not_adj_of_indep (k : ℕ) (B : Finset (Fin (3*k+4)))
    (hI : (spiderOneTwoThrees k).IsIndepSet (B : Set (Fin (3*k+4)))) (u v : Fin (3*k+4))
    (hu : u ∈ B) (hv : v ∈ B) : ¬ (spiderOneTwoThrees k).Adj u v := by
  intro hadj
  exact hI (Finset.mem_coe.mpr hu) (Finset.mem_coe.mpr hv) hadj.ne hadj

end E993Transport
-- VERITYOS ENTRY 129 END

-- VERITYOS ENTRY 130 BEGIN lemma E993Transport.spider_leaf_cases 40d630ff84f32caa7b64ee7bd9e080e99c5a8f487e14f0ba5d62741f9d10d036
namespace E993Transport

-- r30 C6-LA2 (F0), the U adjudicator's node (r30 Cycle 6, Claude Opus 5.5); Lean text authored in-run by the C6-LA2
-- formalizer (Claude Opus 5.5), pattern: r30 C4-LA1 entry 96.
/-- (F0) a leaf of `S(1,2,3^k)` is `1`, `3` or an arm tip `c_i = 6+3i`. -/
lemma spider_leaf_cases (k : ℕ) (τ : Fin (3*k+4))
    (hleaf : C4LA1.IsGraphLeaf (spiderOneTwoThrees k) τ) :
    τ.val = 1 ∨ τ.val = 3 ∨ ∃ i < k, τ.val = 6 + 3*i := by
  obtain ⟨s, -, huniq⟩ := hleaf
  have two : ∀ u w, (spiderOneTwoThrees k).Adj τ u → (spiderOneTwoThrees k).Adj τ w →
      u.val = w.val := by
    intro u w hu hw
    rw [huniq u hu, huniq w hw]
  have hlt := τ.isLt
  by_cases h0 : τ.val = 0
  · have := two (spiderVertex k 1) (spiderVertex k 2)
      (spiderGraph_adj_of_val_root k _ _ (by rw [spiderVertex_val k 1 (by omega)]; omega))
      (spiderGraph_adj_of_val_root k _ _ (by rw [spiderVertex_val k 2 (by omega)]; omega))
    rw [spiderVertex_val k 1 (by omega), spiderVertex_val k 2 (by omega)] at this
    omega
  by_cases h2 : τ.val = 2
  · have := two (spiderVertex k 0) (spiderVertex k 3)
      ((spiderGraph_adj_of_val_root k _ _ (by rw [spiderVertex_val k 0 (by omega)]; omega)).symm)
      (spiderGraph_adj_of_val_root k _ _ (by rw [spiderVertex_val k 3 (by omega)]; omega))
    rw [spiderVertex_val k 0 (by omega), spiderVertex_val k 3 (by omega)] at this
    omega
  by_cases hsmall : τ.val < 4
  · omega
  have hj : (τ.val - 4) / 3 < k := by omega
  set j := (τ.val - 4) / 3 with hjdef
  by_cases hr0 : τ.val = 4 + 3*j
  · have := two (spiderVertex k 0) (spiderVertex k (5+3*j))
      ((spiderGraph_adj_of_val_arm k _ _ j hj (by rw [spiderVertex_val k 0 (by omega)]; omega)).symm)
      (spiderGraph_adj_of_val_arm k _ _ j hj (by rw [spiderVertex_val k (5+3*j) (by omega)]; omega))
    rw [spiderVertex_val k 0 (by omega), spiderVertex_val k (5+3*j) (by omega)] at this
    omega
  by_cases hr1 : τ.val = 5 + 3*j
  · have := two (spiderVertex k (4+3*j)) (spiderVertex k (6+3*j))
      ((spiderGraph_adj_of_val_arm k _ _ j hj
        (by rw [spiderVertex_val k (4+3*j) (by omega)]; omega)).symm)
      (spiderGraph_adj_of_val_arm k _ _ j hj (by rw [spiderVertex_val k (6+3*j) (by omega)]; omega))
    rw [spiderVertex_val k (4+3*j) (by omega), spiderVertex_val k (6+3*j) (by omega)] at this
    omega
  exact Or.inr (Or.inr ⟨j, hj, by omega⟩)

end E993Transport
-- VERITYOS ENTRY 130 END

-- VERITYOS ENTRY 131 BEGIN lemma E993Transport.spider_isGraphLeaf_of_cases 5de002695fd74dc89bf0ef94522096502ecb065bf76ab7e0f93fb7bd4ca86338
namespace E993Transport

-- r30 C6-LA2 (F0), the U adjudicator's node (r30 Cycle 6, Claude Opus 5.5); Lean text authored in-run (C6-LA2 formalizer,
-- Claude Opus 5.5).
/-- (F0) `1`, `3` and the arm tips `c_i = 6+3i` are leaves of `S(1,2,3^k)`. -/
lemma spider_isGraphLeaf_of_cases (k : ℕ) (τ : Fin (3*k+4))
    (h : τ.val = 1 ∨ τ.val = 3 ∨ ∃ i < k, τ.val = 6 + 3*i) :
    C4LA1.IsGraphLeaf (spiderOneTwoThrees k) τ := by
  have hlt := τ.isLt
  rcases h with h | h | ⟨i, hi, h⟩
  · refine ⟨spiderVertex k 0,
      (spiderGraph_adj_of_val_root k _ _ (by rw [spiderVertex_val k 0 (by omega)]; omega)).symm, ?_⟩
    intro w hw
    rw [spiderGraph_adj_iff_val] at hw
    apply Fin.ext
    rw [spiderVertex_val k 0 (by omega)]
    rcases hw with (h' | h' | h' | ⟨i', -, h' | h' | h'⟩) |
      (h' | h' | h' | ⟨i', -, h' | h' | h'⟩) <;> omega
  · refine ⟨spiderVertex k 2,
      (spiderGraph_adj_of_val_root k _ _ (by rw [spiderVertex_val k 2 (by omega)]; omega)).symm, ?_⟩
    intro w hw
    rw [spiderGraph_adj_iff_val] at hw
    apply Fin.ext
    rw [spiderVertex_val k 2 (by omega)]
    rcases hw with (h' | h' | h' | ⟨i', -, h' | h' | h'⟩) |
      (h' | h' | h' | ⟨i', -, h' | h' | h'⟩) <;> omega
  · refine ⟨spiderVertex k (5+3*i),
      (spiderGraph_adj_of_val_arm k _ _ i hi
        (by rw [spiderVertex_val k (5+3*i) (by omega)]; omega)).symm, ?_⟩
    intro w hw
    rw [spiderGraph_adj_iff_val] at hw
    apply Fin.ext
    rw [spiderVertex_val k (5+3*i) (by omega)]
    rcases hw with (h' | h' | h' | ⟨i', -, h' | h' | h'⟩) |
      (h' | h' | h' | ⟨i', -, h' | h' | h'⟩) <;> omega

end E993Transport
-- VERITYOS ENTRY 131 END

-- VERITYOS ENTRY 132 BEGIN lemma E993Transport.mem_leafSet_spiderOneTwoThrees_iff 93014c52ce1124fed71f578903f6ea875c1bfc96ac3db70477031c752806a91d
namespace E993Transport

-- r30 C6-LA2 (F0), the U adjudicator's node (r30 Cycle 6, Claude Opus 5.5): `leafSet = {1, 3} ∪ {c_i}`.
/-- (F0) the leaf set of `S(1,2,3^k)` is `{1, 3} ∪ {c_i : i < k}`. -/
lemma mem_leafSet_spiderOneTwoThrees_iff (k : ℕ) (τ : Fin (3*k+4)) :
    τ ∈ C5LA1.leafSet (spiderOneTwoThrees k) ↔ τ.val = 1 ∨ τ.val = 3 ∨ ∃ i < k, τ.val = 6 + 3*i := by
  constructor
  · intro hτ
    have hleaf : C4LA1.IsGraphLeaf (spiderOneTwoThrees k) τ := by
      simpa [C5LA1.leafSet] using hτ
    exact spider_leaf_cases k τ hleaf
  · intro h
    have hleaf := spider_isGraphLeaf_of_cases k τ h
    simpa [C5LA1.leafSet] using hleaf

end E993Transport
-- VERITYOS ENTRY 132 END

-- VERITYOS ENTRY 133 BEGIN lemma E993Transport.mem_tagWitnesses_spider_one_iff 116b6f0c863b2ced41c090a3c9e944d55f6b32deabc43443a12c1ad5306de758
namespace E993Transport

-- r30 C6-LA2 (F0), the U adjudicator's node (r30 Cycle 6, Claude Opus 5.5): `W_1 = {2} ∪ {a_j}`.
/-- (F0) the witnesses of the leaf `1` are `2` and the arm roots `a_j = 4+3j`. -/
lemma mem_tagWitnesses_spider_one_iff (k : ℕ) (τ w : Fin (3*k+4)) (hτ : τ.val = 1) :
    w ∈ tagWitnesses (spiderOneTwoThrees k) τ ↔ w.val = 2 ∨ ∃ j < k, w.val = 4 + 3*j := by
  have hlt := τ.isLt
  have hleaf := spider_isGraphLeaf_of_cases k τ (Or.inl hτ)
  have hs : (spiderOneTwoThrees k).Adj τ (spiderVertex k 0) :=
    (spiderGraph_adj_of_val_root k _ _ (by rw [spiderVertex_val k 0 (by omega)]; omega)).symm
  rw [mem_tagWitnesses_iff_of_adj _ τ _ w hleaf hs]
  have h0 := spiderVertex_val k 0 (by omega)
  constructor
  · rintro ⟨hne, hadj⟩
    have hne' : w.val ≠ τ.val := fun h => hne (Fin.ext h)
    rw [spiderGraph_adj_iff_val, h0] at hadj
    rcases hadj with (h | h | h | ⟨i, hi, h | h | h⟩) | (h | h | h | ⟨i, hi, h | h | h⟩)
    all_goals first
      | omega
      | exact Or.inl (by omega)
      | exact Or.inr ⟨i, hi, by omega⟩
  · rintro (h | ⟨j, hj, h⟩)
    · refine ⟨fun e => absurd (congrArg Fin.val e) (by omega), ?_⟩
      exact spiderGraph_adj_of_val_root k _ _ (by rw [h0]; omega)
    · refine ⟨fun e => absurd (congrArg Fin.val e) (by omega), ?_⟩
      exact spiderGraph_adj_of_val_arm k _ _ j hj (by rw [h0]; omega)

end E993Transport
-- VERITYOS ENTRY 133 END

-- VERITYOS ENTRY 134 BEGIN lemma E993Transport.mem_tagWitnesses_spider_three_iff 38fc4b6bc59e38de7e2aa3aa98590ecdd996cbb427a3f1bd556dc79064ab43e7
namespace E993Transport

-- r30 C6-LA2 (F0), the U adjudicator's node (r30 Cycle 6, Claude Opus 5.5): `W_3 = {0}`.
/-- (F0) the only witness of the leaf `3` is the root `0`. -/
lemma mem_tagWitnesses_spider_three_iff (k : ℕ) (τ w : Fin (3*k+4)) (hτ : τ.val = 3) :
    w ∈ tagWitnesses (spiderOneTwoThrees k) τ ↔ w.val = 0 := by
  have hlt := τ.isLt
  have hleaf := spider_isGraphLeaf_of_cases k τ (Or.inr (Or.inl hτ))
  have hs : (spiderOneTwoThrees k).Adj τ (spiderVertex k 2) :=
    (spiderGraph_adj_of_val_root k _ _ (by rw [spiderVertex_val k 2 (by omega)]; omega)).symm
  rw [mem_tagWitnesses_iff_of_adj _ τ _ w hleaf hs]
  have h2 := spiderVertex_val k 2 (by omega)
  constructor
  · rintro ⟨hne, hadj⟩
    have hne' : w.val ≠ τ.val := fun h => hne (Fin.ext h)
    rw [spiderGraph_adj_iff_val, h2] at hadj
    rcases hadj with (h | h | h | ⟨i, hi, h | h | h⟩) | (h | h | h | ⟨i, hi, h | h | h⟩) <;> omega
  · intro h
    refine ⟨fun e => absurd (congrArg Fin.val e) (by omega), ?_⟩
    exact (spiderGraph_adj_of_val_root k _ _ (by rw [h2]; omega)).symm

end E993Transport
-- VERITYOS ENTRY 134 END

-- VERITYOS ENTRY 135 BEGIN lemma E993Transport.mem_tagWitnesses_spider_armTip_iff 88fe3a7da5d5e19e85f5c6a6ca129904334b7b04d847a48f1bf4c30fb0771ea6
namespace E993Transport

-- r30 C6-LA2 (F0), the U adjudicator's node (r30 Cycle 6, Claude Opus 5.5): `W_{c_i} = {a_i}`.
/-- (F0) the only witness of the arm tip `c_i = 6+3i` is the arm root `a_i = 4+3i`. -/
lemma mem_tagWitnesses_spider_armTip_iff (k i : ℕ) (hi : i < k) (τ w : Fin (3*k+4))
    (hτ : τ.val = 6 + 3*i) :
    w ∈ tagWitnesses (spiderOneTwoThrees k) τ ↔ w.val = 4 + 3*i := by
  have hlt := τ.isLt
  have hleaf := spider_isGraphLeaf_of_cases k τ (Or.inr (Or.inr ⟨i, hi, hτ⟩))
  have hs : (spiderOneTwoThrees k).Adj τ (spiderVertex k (5+3*i)) :=
    (spiderGraph_adj_of_val_arm k _ _ i hi
      (by rw [spiderVertex_val k (5+3*i) (by omega)]; omega)).symm
  rw [mem_tagWitnesses_iff_of_adj _ τ _ w hleaf hs]
  have hb := spiderVertex_val k (5+3*i) (by omega)
  constructor
  · rintro ⟨hne, hadj⟩
    have hne' : w.val ≠ τ.val := fun h => hne (Fin.ext h)
    rw [spiderGraph_adj_iff_val, hb] at hadj
    rcases hadj with (h | h | h | ⟨i', hi', h | h | h⟩) | (h | h | h | ⟨i', hi', h | h | h⟩) <;> omega
  · intro h
    refine ⟨fun e => absurd (congrArg Fin.val e) (by omega), ?_⟩
    exact (spiderGraph_adj_of_val_arm k _ _ i hi (by rw [hb]; omega)).symm

end E993Transport
-- VERITYOS ENTRY 135 END

-- VERITYOS ENTRY 136 BEGIN lemma E993Transport.spider_active_one_iff e62dba301cd4c8a5d7e2d71b61d4f048b9ea3157c52f8f789205b485974f89b7
namespace E993Transport

-- r30 C6-LA2 (F0): activity of the tag `1`; pattern: r30 C4-LA1 entry 100.
/-- activity of the tag `1`: `B` contains `2` or some arm root `a_j`. -/
lemma spider_active_one_iff (k : ℕ) (τ : Fin (3*k+4)) (hτ : τ.val = 1) (B : Finset (Fin (3*k+4))) :
    ¬ Disjoint (B.erase τ) (tagWitnesses (spiderOneTwoThrees k) τ) ↔
      ∃ w ∈ B, w.val = 2 ∨ ∃ j < k, w.val = 4 + 3*j := by
  rw [not_disjoint_erase_tagWitnesses_iff_exists_mem]
  constructor
  · rintro ⟨w, hw, hwW⟩
    exact ⟨w, hw, (mem_tagWitnesses_spider_one_iff k τ w hτ).mp hwW⟩
  · rintro ⟨w, hw, hwW⟩
    exact ⟨w, hw, (mem_tagWitnesses_spider_one_iff k τ w hτ).mpr hwW⟩

end E993Transport
-- VERITYOS ENTRY 136 END

-- VERITYOS ENTRY 137 BEGIN lemma E993Transport.spider_active_three_iff abbce30fa08be1fe1762442f3c16023bfd1e0526eb79814a03c1ddbe31119189
namespace E993Transport

-- r30 C6-LA2 (F0)/(F2): activity of the tag `3`.
/-- activity of the tag `3`: `B` contains the root `0`. -/
lemma spider_active_three_iff (k : ℕ) (τ : Fin (3*k+4)) (hτ : τ.val = 3) (B : Finset (Fin (3*k+4))) :
    ¬ Disjoint (B.erase τ) (tagWitnesses (spiderOneTwoThrees k) τ) ↔ spiderVertex k 0 ∈ B := by
  rw [not_disjoint_erase_tagWitnesses_iff_exists_mem]
  constructor
  · rintro ⟨w, hw, hwW⟩
    rw [mem_tagWitnesses_spider_three_iff k τ w hτ] at hwW
    rwa [← (eq_spiderVertex_iff k 0 (by omega) w).mpr hwW]
  · intro h0
    exact ⟨_, h0, (mem_tagWitnesses_spider_three_iff k τ _ hτ).mpr (spiderVertex_val k 0 (by omega))⟩

end E993Transport
-- VERITYOS ENTRY 137 END

-- VERITYOS ENTRY 138 BEGIN lemma E993Transport.spider_active_armTip_iff e887f3c5f9fd0f9f580f9214be050e407a07492917038d47a903ebe78dc27a46
namespace E993Transport

-- r30 C6-LA2 (F0): activity of the tag `c_i`; pattern: r30 C4-LA1 entry 98.
/-- activity of the tag `c_i = 6+3i`: `B` contains `a_i = 4+3i`. -/
lemma spider_active_armTip_iff (k i : ℕ) (hi : i < k) (τ : Fin (3*k+4)) (hτ : τ.val = 6 + 3*i)
    (B : Finset (Fin (3*k+4))) :
    ¬ Disjoint (B.erase τ) (tagWitnesses (spiderOneTwoThrees k) τ) ↔
      spiderVertex k (4+3*i) ∈ B := by
  rw [not_disjoint_erase_tagWitnesses_iff_exists_mem]
  constructor
  · rintro ⟨w, hw, hwW⟩
    rw [mem_tagWitnesses_spider_armTip_iff k i hi τ w hτ] at hwW
    rwa [← (eq_spiderVertex_iff k (4+3*i) (by omega) w).mpr hwW]
  · intro ha
    exact ⟨_, ha, (mem_tagWitnesses_spider_armTip_iff k i hi τ _ hτ).mpr
      (spiderVertex_val k (4+3*i) (by omega))⟩

end E993Transport
-- VERITYOS ENTRY 138 END

-- VERITYOS ENTRY 139 BEGIN lemma E993Transport.spiderLeafBlock_verts f8fcb0764814c0435dc9adcbe0ba4da4d241ba8a8f949cc110cf0d944a135164
namespace E993Transport

-- r30 C6-LA2 (F3), authored in-run (C6-LA2 formalizer, Claude Opus 5.5); pattern: r30 C4-LA1 entry 81.
lemma spiderLeafBlock_verts (k : ℕ) (τ : Fin (3*k+4)) :
    (spiderLeafBlock k τ).verts = {spiderVertex k 1} := by
  unfold spiderLeafBlock
  split_ifs <;> rfl

end E993Transport
-- VERITYOS ENTRY 139 END

-- VERITYOS ENTRY 140 BEGIN lemma E993Transport.spiderArmBlock_verts 738ed1f70b7b8521407fad751ae59091ae2bf48422d3e33e2663db62f0263895
namespace E993Transport

-- r30 C6-LA2 (F3), authored in-run (C6-LA2 formalizer, Claude Opus 5.5); pattern: r30 C4-LA1 entry 83.
lemma spiderArmBlock_verts (k i j : ℕ) :
    (spiderArmBlock k i j).verts =
      {spiderVertex k (4+3*j), spiderVertex k (5+3*j), spiderVertex k (6+3*j)} := by
  unfold spiderArmBlock
  split_ifs <;> rfl

end E993Transport
-- VERITYOS ENTRY 140 END

-- VERITYOS ENTRY 141 BEGIN lemma E993Transport.mem_spiderLeafBlock_verts_iff b9e31850fa75006e7a27f1a4ac262de8f000ade5c5704c87ca5deba54584fa00
namespace E993Transport

-- r30 C6-LA2 (F3); pattern: r30 C4-LA1 entry 84.
lemma mem_spiderLeafBlock_verts_iff (k : ℕ) (τ v : Fin (3*k+4)) :
    v ∈ (spiderLeafBlock k τ).verts ↔ v.val = 1 := by
  rw [spiderLeafBlock_verts, Finset.mem_singleton, eq_spiderVertex_iff k 1 (by omega)]

end E993Transport
-- VERITYOS ENTRY 141 END

-- VERITYOS ENTRY 142 BEGIN lemma E993Transport.mem_spiderMidBlock_verts_iff dbee4e30b4540b50a00dacfebca974d771d98cf677879a764eaa40997549674b
namespace E993Transport

-- r30 C6-LA2 (F3); pattern: r30 C4-LA1 entry 85.
lemma mem_spiderMidBlock_verts_iff (k : ℕ) (v : Fin (3*k+4)) :
    v ∈ (spiderMidBlock k).verts ↔ v.val = 3 ∨ v.val = 2 ∨ v.val = 0 := by
  simp only [spiderMidBlock, ChainFactor.verts, Finset.mem_insert, Finset.mem_singleton]
  rw [eq_spiderVertex_iff k 3 (by omega), eq_spiderVertex_iff k 2 (by omega),
    eq_spiderVertex_iff k 0 (by omega)]

end E993Transport
-- VERITYOS ENTRY 142 END

-- VERITYOS ENTRY 143 BEGIN lemma E993Transport.mem_spiderArmBlock_verts_iff a28a1f9f839755cc0bd0864ca0c1ceb2875918f604ddd4ab1e985d6d139d028b
namespace E993Transport

-- r30 C6-LA2 (F3); pattern: r30 C4-LA1 entry 86.
lemma mem_spiderArmBlock_verts_iff (k i j : ℕ) (hj : j < k) (v : Fin (3*k+4)) :
    v ∈ (spiderArmBlock k i j).verts ↔ v.val = 4+3*j ∨ v.val = 5+3*j ∨ v.val = 6+3*j := by
  rw [spiderArmBlock_verts]
  simp only [Finset.mem_insert, Finset.mem_singleton]
  rw [eq_spiderVertex_iff k _ (by omega), eq_spiderVertex_iff k _ (by omega),
    eq_spiderVertex_iff k _ (by omega)]

end E993Transport
-- VERITYOS ENTRY 143 END

-- VERITYOS ENTRY 144 BEGIN lemma E993Transport.mem_chainVerts_spiderTagFactors a814c12bff42cd5e051439af05f7df3ea82be646655ac91722a9a50144364c0f
namespace E993Transport

-- r30 C6-LA2 (F3): `chainVerts 𝓑_τ = univ` (the blocks cover every vertex, the root included, by `path(3,2,0)`).
/-- every vertex of `S(1,2,3^k)` lies in a block of `spiderTagFactors k τ`. -/
lemma mem_chainVerts_spiderTagFactors (k : ℕ) (τ v : Fin (3*k+4)) :
    v ∈ chainVerts (spiderTagFactors k τ) := by
  rw [mem_chainVerts_iff]
  have hv := v.isLt
  by_cases h1 : v.val = 1
  · exact ⟨spiderLeafBlock k τ, by simp [spiderTagFactors], (mem_spiderLeafBlock_verts_iff k τ v).2 h1⟩
  by_cases h320 : v.val = 3 ∨ v.val = 2 ∨ v.val = 0
  · exact ⟨spiderMidBlock k, by simp [spiderTagFactors], (mem_spiderMidBlock_verts_iff k v).2 h320⟩
  have hj : (v.val - 4) / 3 < k := by omega
  refine ⟨spiderArmBlock k (spiderArmIndex k τ) ((v.val - 4) / 3), ?_, ?_⟩
  · simp only [spiderTagFactors, List.mem_cons, List.mem_map, List.mem_range]
    exact Or.inr (Or.inr ⟨_, hj, rfl⟩)
  · rw [mem_spiderArmBlock_verts_iff k _ _ hj]
    omega

end E993Transport
-- VERITYOS ENTRY 144 END

-- VERITYOS ENTRY 145 BEGIN lemma E993Transport.chainDisjoint_spiderTagFactors 99fb9c8563f45c2ff417be301f5eb553d4fd605bd90b85f9eea72ca821750d12
namespace E993Transport

-- r30 C6-LA2 (F3): `ChainDisjoint 𝓑_τ`; pattern: r30 C4-LA1 entry 88.
lemma chainDisjoint_spiderTagFactors (k : ℕ) (τ : Fin (3*k+4)) :
    ChainDisjoint (spiderTagFactors k τ) := by
  unfold ChainDisjoint spiderTagFactors
  simp only [List.pairwise_cons, List.mem_cons, List.mem_map, List.mem_range,
    forall_eq_or_imp, forall_exists_index, and_imp]
  refine ⟨⟨?_, ?_⟩, ?_, ?_⟩
  · rw [Finset.disjoint_left]
    intro v h1 h2
    rw [mem_spiderLeafBlock_verts_iff] at h1
    rw [mem_spiderMidBlock_verts_iff] at h2
    omega
  · rintro c j hj rfl
    rw [Finset.disjoint_left]
    intro v h1 h2
    rw [mem_spiderLeafBlock_verts_iff] at h1
    rw [mem_spiderArmBlock_verts_iff k _ j hj] at h2
    omega
  · rintro c j hj rfl
    rw [Finset.disjoint_left]
    intro v h1 h2
    rw [mem_spiderMidBlock_verts_iff] at h1
    rw [mem_spiderArmBlock_verts_iff k _ j hj] at h2
    omega
  · rw [List.pairwise_map]
    refine (List.nodup_range).imp_of_mem ?_
    intro j j' hj hj' hne
    rw [List.mem_range] at hj hj'
    rw [Finset.disjoint_left]
    intro v h1 h2
    rw [mem_spiderArmBlock_verts_iff k _ j hj] at h1
    rw [mem_spiderArmBlock_verts_iff k _ j' hj'] at h2
    omega

end E993Transport
-- VERITYOS ENTRY 145 END

-- VERITYOS ENTRY 146 BEGIN lemma E993Transport.chainSize_spiderTagFactors 13832e4370ac5708d4e67ce742e3d1195dd9075643b4862e0a9825b041042abf
namespace E993Transport

-- r30 C6-LA2 (F3): `chainSize 𝓑_τ B = |B|` by the carried entry 70 (`chainSize_eq_card_inter`).
lemma chainSize_spiderTagFactors (k : ℕ) (τ : Fin (3*k+4)) (B : Finset (Fin (3*k+4))) :
    chainSize (spiderTagFactors k τ) B = B.card := by
  rw [chainSize_eq_card_inter _ (chainDisjoint_spiderTagFactors k τ),
    Finset.inter_eq_left.mpr (fun v _ => mem_chainVerts_spiderTagFactors k τ v)]

end E993Transport
-- VERITYOS ENTRY 146 END

-- VERITYOS ENTRY 147 BEGIN lemma E993Transport.chainRank_map_spiderArmBlock_le 35f33173dce7096b2a2cf649a3950a517ffdb14266ce5d9dd3bd471f1dc03f53
namespace E993Transport

-- r30 C6-LA2 (F5); pattern: r30 C4-LA1 entry 90.
lemma chainRank_map_spiderArmBlock_le (k i n : ℕ) :
    chainRank ((List.range n).map (spiderArmBlock k i)) ≤ 2 * n + (if i < n then 2 else 0) := by
  induction n with
  | zero => simp [chainRank]
  | succ n ih =>
      have hrk : (spiderArmBlock k i n).rk ≤ if n = i then 4 else 2 := by
        unfold spiderArmBlock
        split_ifs
        · simp only [ChainFactor.rk]
          have := Finset.card_le_two (a := spiderVertex k (4+3*n)) (b := spiderVertex k (6+3*n))
          omega
        · simp [ChainFactor.rk]
      have happ : ∀ l₁ l₂ : List (ChainFactor (Fin (3*k+4))),
          chainRank (l₁ ++ l₂) = chainRank l₁ + chainRank l₂ := by
        intro l₁ l₂
        induction l₁ with
        | nil => simp [chainRank]
        | cons c l ih' => simp only [List.cons_append, chainRank, ih']; omega
      rw [List.range_succ, List.map_append, happ]
      simp only [List.map_cons, List.map_nil, chainRank]
      split_ifs at ih hrk ⊢ <;> omega

end E993Transport
-- VERITYOS ENTRY 147 END

-- VERITYOS ENTRY 148 BEGIN lemma E993Transport.chainRank_spiderTagFactors_le 4314483afd51283d52667a99a55e39f519c07adf6919a0120301d3cdaba31e29
namespace E993Transport

-- r30 C6-LA2 (F5): `chainRank 𝓑_1 = 2k+4`, `chainRank 𝓑_{c_j} = 2k+5` (critic `C-U1-T`, r30 Cycle 6, Claude Opus 5.5); the
-- bound `≤ 2k+5` for every `τ`; pattern: r30 C4-LA1 entry 91.
lemma chainRank_spiderTagFactors_le (k : ℕ) (τ : Fin (3*k+4)) :
    chainRank (spiderTagFactors k τ) ≤ 2 * k + 5 := by
  have harm := chainRank_map_spiderArmBlock_le k (spiderArmIndex k τ) k
  have hτ := τ.isLt
  simp only [spiderTagFactors, chainRank]
  unfold spiderLeafBlock spiderMidBlock spiderArmIndex at *
  split_ifs at harm ⊢ <;> simp only [ChainFactor.rk, Finset.card_singleton] at * <;> omega

end E993Transport
-- VERITYOS ENTRY 148 END

-- VERITYOS ENTRY 149 BEGIN lemma E993Transport.spiderLeafBlock_root 9adef57654f48b349b2fb47e8c79c54e78d1a0439ee7eb2e91c587f80fecf649
namespace E993Transport

-- r30 C6-LA2 N3a: at the root no block is frozen (the list `[single 1, path(3,2,0), arms]` of the root split).
lemma spiderLeafBlock_root (k : ℕ) :
    spiderLeafBlock k (spiderVertex k 0) = .single (spiderVertex k 1) := by
  unfold spiderLeafBlock
  rw [if_neg (by rw [spiderVertex_val k 0 (by omega)]; omega)]

end E993Transport
-- VERITYOS ENTRY 149 END

-- VERITYOS ENTRY 150 BEGIN lemma E993Transport.spiderArmIndex_root 03f9e9860777b1b8b5dfbfb201758ba6cc5ea1f0181f940d08d53d84675435a6
namespace E993Transport

-- r30 C6-LA2 N3a: at the root no arm is frozen.
lemma spiderArmIndex_root (k : ℕ) : spiderArmIndex k (spiderVertex k 0) = k := by
  unfold spiderArmIndex
  rw [if_neg (by rw [spiderVertex_val k 0 (by omega)]; omega)]

end E993Transport
-- VERITYOS ENTRY 150 END

-- VERITYOS ENTRY 151 BEGIN lemma E993Transport.chainRank_spiderTagFactors_root_le 8ab3194295ee113194cdd525ac9963a43d3990975f4cf4874f7351296067d7b0
namespace E993Transport

-- r30 C6-LA2 N3a: `chainRank [single 1, path(3,2,0), arms] = 2k+3` (critics `C-U1-T`, `C-U1-F`; r30 Cycle 6, Claude Opus 5.5).
lemma chainRank_spiderTagFactors_root_le (k : ℕ) :
    chainRank (spiderTagFactors k (spiderVertex k 0)) ≤ 2 * k + 3 := by
  have harm := chainRank_map_spiderArmBlock_le k (spiderArmIndex k (spiderVertex k 0)) k
  rw [spiderArmIndex_root] at harm
  simp only [lt_irrefl, if_false] at harm
  simp only [spiderTagFactors, chainRank, spiderLeafBlock_root, spiderArmIndex_root, spiderMidBlock,
    ChainFactor.rk]
  omega

end E993Transport
-- VERITYOS ENTRY 151 END

-- VERITYOS ENTRY 152 BEGIN lemma E993Transport.spider_path_valid 467721aaf47095eaaade16505367565f3aae9f1c5a7edcd8ffd86cadbaf1d617
namespace E993Transport

-- r30 C6-LA2 (F4); pattern: r30 C4-LA1 entry 103.
/-- a path block `x – y – z` of `S(1,2,3^k)` is valid on an independent set. -/
lemma spider_path_valid (k : ℕ) (B : Finset (Fin (3*k+4)))
    (hI : (spiderOneTwoThrees k).IsIndepSet (B : Set (Fin (3*k+4)))) (x y z : Fin (3*k+4))
    (hxy : x ≠ y) (hyz : y ≠ z) (hxz : x ≠ z)
    (h1 : (spiderOneTwoThrees k).Adj x y) (h2 : (spiderOneTwoThrees k).Adj y z) :
    (ChainFactor.path x y z).Valid B :=
  ⟨hxy, hyz, hxz, fun h => spider_not_adj_of_indep k B hI x y h.1 h.2 h1,
    fun h => spider_not_adj_of_indep k B hI y z h.1 h.2 h2⟩

end E993Transport
-- VERITYOS ENTRY 152 END

-- VERITYOS ENTRY 153 BEGIN lemma E993Transport.spiderMidBlock_valid 32d42ba4ddb8a18275759352399fe7e3e354525ee936a655a03554b70503415a
namespace E993Transport

-- r30 C6-LA2 (F4): `path(3,2,0)` is valid on every independent set (critic `C-U1-T`, r30 Cycle 6, Claude Opus 5.5).
lemma spiderMidBlock_valid (k : ℕ) (B : Finset (Fin (3*k+4)))
    (hI : (spiderOneTwoThrees k).IsIndepSet (B : Set (Fin (3*k+4)))) :
    (spiderMidBlock k).Valid B :=
  spider_path_valid k B hI _ _ _
    (spiderVertex_ne k 3 2 (by omega) (by omega) (by omega))
    (spiderVertex_ne k 2 0 (by omega) (by omega) (by omega))
    (spiderVertex_ne k 3 0 (by omega) (by omega) (by omega))
    (spiderGraph_adj_two_three k).symm (spiderGraph_adj_zero_two k).symm

end E993Transport
-- VERITYOS ENTRY 153 END

-- VERITYOS ENTRY 154 BEGIN lemma E993Transport.spiderArmPath_valid 45bb3d9693f145c31935c16b3468f592329e7180ce1dcda75319695f88f204e2
namespace E993Transport

-- r30 C6-LA2 (F4): an unfrozen arm block `path(a_j, b_j, c_j)` is valid on every independent set.
lemma spiderArmPath_valid (k j : ℕ) (hj : j < k) (B : Finset (Fin (3*k+4)))
    (hI : (spiderOneTwoThrees k).IsIndepSet (B : Set (Fin (3*k+4)))) :
    (ChainFactor.path (spiderVertex k (4+3*j)) (spiderVertex k (5+3*j))
      (spiderVertex k (6+3*j))).Valid B :=
  spider_path_valid k B hI _ _ _
    (spiderVertex_ne k _ _ (by omega) (by omega) (by omega))
    (spiderVertex_ne k _ _ (by omega) (by omega) (by omega))
    (spiderVertex_ne k _ _ (by omega) (by omega) (by omega))
    (spiderGraph_adj_arm_mid k j hj) (spiderGraph_adj_arm_tip k j hj)

end E993Transport
-- VERITYOS ENTRY 154 END

-- VERITYOS ENTRY 155 BEGIN lemma E993Transport.chainValid_spiderTagFactors 32bcd00ba77638e3ce9b0714477998dd0ef40090c4cc69bbce51873c3a426c97
namespace E993Transport

-- r30 C6-LA2 (F4) (critic `C-U1-T`, r30 Cycle 6, Claude Opus 5.5): on a `τ`-active independent set containing the leaf
-- `τ`, every block of `𝓑_τ` is valid (for `τ = c_j` activity forces `a_j ∈ B`, `b_j ∉ B`); pattern: r30 C4-LA1 entry 104.
lemma chainValid_spiderTagFactors (k : ℕ) (τ : Fin (3*k+4))
    (hleaf : C4LA1.IsGraphLeaf (spiderOneTwoThrees k) τ) (B : Finset (Fin (3*k+4)))
    (hI : (spiderOneTwoThrees k).IsIndepSet (B : Set (Fin (3*k+4)))) (hτB : τ ∈ B)
    (hact : ¬ Disjoint (B.erase τ) (tagWitnesses (spiderOneTwoThrees k) τ)) :
    ChainValid (spiderTagFactors k τ) B := by
  have hcases := spider_leaf_cases k τ hleaf
  have hlt := τ.isLt
  intro c hc
  simp only [spiderTagFactors, List.mem_cons, List.mem_map, List.mem_range] at hc
  rcases hc with rfl | rfl | ⟨j, hj, rfl⟩
  · -- the leaf block `{1}`
    unfold spiderLeafBlock
    split_ifs with h1
    · have hτv : τ = spiderVertex k 1 := (eq_spiderVertex_iff k 1 (by omega) τ).mpr h1
      show B ∩ {spiderVertex k 1} = {spiderVertex k 1}
      rw [← hτv]
      exact Finset.inter_singleton_of_mem hτB
    · trivial
  · exact spiderMidBlock_valid k B hI
  · -- an arm block `a_j – b_j – c_j`
    unfold spiderArmBlock
    split_ifs with hji
    · show B ∩ {spiderVertex k (4+3*j), spiderVertex k (5+3*j), spiderVertex k (6+3*j)} =
        {spiderVertex k (4+3*j), spiderVertex k (6+3*j)}
      have hτc : τ.val = 6 + 3*j := by
        unfold spiderArmIndex at hji
        split_ifs at hji <;> rcases hcases with h | h | ⟨i, hi, h⟩ <;> omega
      have ha := (spider_active_armTip_iff k j hj τ hτc B).mp hact
      have hτv : τ = spiderVertex k (6+3*j) := (eq_spiderVertex_iff k _ (by omega) τ).mpr hτc
      have hb : spiderVertex k (5+3*j) ∉ B := fun hb =>
        spider_not_adj_of_indep k B hI _ _ ha hb (spiderGraph_adj_arm_mid k j hj)
      exact inter_insert_insert_singleton_eq_pair B _ _ _ ha hb (hτv ▸ hτB)
    · exact spiderArmPath_valid k j hj B hI

end E993Transport
-- VERITYOS ENTRY 155 END

-- VERITYOS ENTRY 156 BEGIN lemma E993Transport.chainValid_spiderTagFactors_root be5009021f7bf57b2519ca13c49c988ff27bf421b8ef417f76981b934ec06937
namespace E993Transport

-- r30 C6-LA2 N3a: the unfrozen list `[single 1, path(3,2,0), arms]` is valid on every independent set.
lemma chainValid_spiderTagFactors_root (k : ℕ) (B : Finset (Fin (3*k+4)))
    (hI : (spiderOneTwoThrees k).IsIndepSet (B : Set (Fin (3*k+4)))) :
    ChainValid (spiderTagFactors k (spiderVertex k 0)) B := by
  intro c hc
  simp only [spiderTagFactors, List.mem_cons, List.mem_map, List.mem_range] at hc
  rcases hc with rfl | rfl | ⟨j, hj, rfl⟩
  · rw [spiderLeafBlock_root]
    trivial
  · exact spiderMidBlock_valid k B hI
  · rw [spiderArmIndex_root]
    unfold spiderArmBlock
    rw [if_neg (by omega)]
    exact spiderArmPath_valid k j hj B hI

end E993Transport
-- VERITYOS ENTRY 156 END

-- VERITYOS ENTRY 157 BEGIN lemma E993Transport.spider_card_le_of_root_mem affc2b7c93db98f917c401a2e29af80f85f52be6602ef1428d398399fe93ed80
namespace E993Transport

-- r30 C6-LA2 (F1) and N3a (critics `C-U1-T`, `C-U1-F`; r30 Cycle 6, Claude Opus 5.5): if the root lies in an independent
-- set `B` then `B ∖ {0} ⊆ {3} ∪ ⋃_j {b_j, c_j}` with at most one vertex per arm, so `|B| ≤ k+2`, and `|B| ≤ k+1` when
-- `3 ∉ B`. Counted by the carried chain lemmas (entries 55, 70, 71) on the unfrozen list; pattern: r30 C4-LA1 entry 101.
lemma spider_card_le_of_root_mem (k : ℕ) (B : Finset (Fin (3*k+4)))
    (hI : (spiderOneTwoThrees k).IsIndepSet (B : Set (Fin (3*k+4))))
    (h0 : spiderVertex k 0 ∈ B) :
    B.card ≤ k + 2 ∧ (spiderVertex k 3 ∉ B → B.card ≤ k + 1) := by
  have hsize := chainSize_spiderTagFactors k (spiderVertex k 0) B
  have h1 : spiderVertex k 1 ∉ B := fun h =>
    spider_not_adj_of_indep k B hI _ _ h0 h (spiderGraph_adj_zero_one k)
  have h2 : spiderVertex k 2 ∉ B := fun h =>
    spider_not_adj_of_indep k B hI _ _ h0 h (spiderGraph_adj_zero_two k)
  have hleafc : (B ∩ (spiderLeafBlock k (spiderVertex k 0)).verts).card = 0 := by
    rw [spiderLeafBlock_root]
    simp [ChainFactor.verts, h1]
  have hmidc : (B ∩ (spiderMidBlock k).verts).card =
      (if spiderVertex k 3 ∈ B then 1 else 0) + 1 := by
    simp only [spiderMidBlock, ChainFactor.verts]
    rw [ChainFactor.card_inter_path_eq _ _ _ B
      (spiderVertex_ne k 3 2 (by omega) (by omega) (by omega))
      (spiderVertex_ne k 2 0 (by omega) (by omega) (by omega))
      (spiderVertex_ne k 3 0 (by omega) (by omega) (by omega)), if_neg h2, if_pos h0]
  have harms : chainSize ((List.range k).map (spiderArmBlock k k)) B ≤
      ((List.range k).map (spiderArmBlock k k)).length := by
    apply chainSize_le_length
    intro c hc
    rw [List.mem_map] at hc
    obtain ⟨j, hj, rfl⟩ := hc
    rw [List.mem_range] at hj
    have hpath : spiderArmBlock k k j =
        .path (spiderVertex k (4+3*j)) (spiderVertex k (5+3*j)) (spiderVertex k (6+3*j)) := by
      unfold spiderArmBlock
      rw [if_neg (by omega)]
    rw [hpath]
    simp only [ChainFactor.verts]
    rw [ChainFactor.card_inter_path_eq _ _ _ B
      (spiderVertex_ne k _ _ (by omega) (by omega) (by omega))
      (spiderVertex_ne k _ _ (by omega) (by omega) (by omega))
      (spiderVertex_ne k _ _ (by omega) (by omega) (by omega))]
    have ha : spiderVertex k (4+3*j) ∉ B := fun h =>
      spider_not_adj_of_indep k B hI _ _ h0 h (spiderGraph_adj_zero_arm k j hj)
    have hbc : ¬ (spiderVertex k (5+3*j) ∈ B ∧ spiderVertex k (6+3*j) ∈ B) := fun h =>
      spider_not_adj_of_indep k B hI _ _ h.1 h.2 (spiderGraph_adj_arm_tip k j hj)
    rw [if_neg ha]
    split_ifs <;> first | omega | exact (hbc ⟨‹_›, ‹_›⟩).elim
  simp only [spiderTagFactors, chainSize, spiderArmIndex_root, List.length_map,
    List.length_range] at hsize harms
  constructor
  · split_ifs at hmidc <;> omega
  · intro h3
    rw [if_neg h3] at hmidc
    omega

end E993Transport
-- VERITYOS ENTRY 157 END

-- VERITYOS ENTRY 158 BEGIN lemma E993Transport.spider_root_notMem b9254ec0f5a9f8e64b4f1f4c1f0129d6d1c9471f90d7f3e88af2eb025015f7b8
namespace E993Transport

-- r30 C6-LA2 (F1) (critic `C-U1-T`, r30 Cycle 6, Claude Opus 5.5): root absence at `|B| ≥ k+3`.
/-- (F1) an independent set of `S(1,2,3^k)` of size `p + 1 ≥ k + 3` avoids the root. -/
lemma spider_root_notMem (k p : ℕ) (hp : k + 2 ≤ p) (B : Finset (Fin (3*k+4)))
    (hB : B ∈ indepFamily (spiderOneTwoThrees k) (p + 1)) : spiderVertex k 0 ∉ B := by
  intro h0
  obtain ⟨hcard, hI⟩ := (mem_indepFamily_iff _ _ _).mp hB
  have := (spider_card_le_of_root_mem k B hI h0).1
  omega

end E993Transport
-- VERITYOS ENTRY 158 END

-- VERITYOS ENTRY 159 BEGIN lemma E993Transport.spider_three_mem_of_root_mem 482e5acd38e217c2355159f9883b7183a26d4ce7f1a097402a1881aa2f80d018
namespace E993Transport

-- r30 C6-LA2 N3a (critics `C-U1-T`, `C-U1-F`; r30 Cycle 6, Claude Opus 5.5): a root-present `(k+2)`-set contains `3`.
lemma spider_three_mem_of_root_mem (k : ℕ) (B : Finset (Fin (3*k+4)))
    (hB : B ∈ indepFamily (spiderOneTwoThrees k) (k + 1 + 1)) (h0 : spiderVertex k 0 ∈ B) :
    spiderVertex k 3 ∈ B := by
  by_contra h3
  obtain ⟨hcard, hI⟩ := (mem_indepFamily_iff _ _ _).mp hB
  have := (spider_card_le_of_root_mem k B hI h0).2 h3
  omega

end E993Transport
-- VERITYOS ENTRY 159 END

-- VERITYOS ENTRY 160 BEGIN lemma E993Transport.exists_chainDownVertex_spiderTagFactors dc0ed3d8728f986c9b6eb8953b9a2ad5366be4917d73a4deeda671aeeaf1159a
namespace E993Transport

-- r30 C6-LA2 (F5) (critic `C-U1-T`, r30 Cycle 6, Claude Opus 5.5): with `chainSize = p+1 ≥ k+3` and `chainRank ≤ 2k+5`,
-- carried entry 63 (`2·chainSize + up = chainRank + down`) gives `down ≥ 1`, and carried entry 65 the vertex.
lemma exists_chainDownVertex_spiderTagFactors (k p : ℕ) (hp : k + 2 ≤ p) (τ : Fin (3*k+4))
    (B : Finset (Fin (3*k+4))) (hcard : B.card = p + 1)
    (hval : ChainValid (spiderTagFactors k τ) B) :
    ∃ q, chainDownVertex (spiderTagFactors k τ) B = some q := by
  have hsize := chainSize_spiderTagFactors k τ B
  have hrank := chainRank_spiderTagFactors_le k τ
  have hid := two_mul_chainSize_add_up_eq (spiderTagFactors k τ) B hval
  exact exists_chainDownVertex_of_down_pos _ B hval (by omega)

end E993Transport
-- VERITYOS ENTRY 160 END

-- VERITYOS ENTRY 161 BEGIN lemma E993Transport.spider_one_active_after_down 15cb9bdf30d0a666984da0b1252c8d87c8ab2f5225d2b1477e4b5ac814cc78a1
namespace E993Transport

-- r30 C6-LA2 (F6) for the tag `1` (critic `C-U1-T`, r30 Cycle 6, Claude Opus 5.5): the CARDINALITY argument (not the
-- box-top lemma of r30 C4-LA1 entry 107, which fails for the spider at `p = k+2`). `2` is the `y` of `path(3,2,0)` and is
-- never dropped; if the step dropped the only witness `a_j` (possible only when `c_j ∉ B`) then every block of `𝓑_1`
-- meets `B` at most once, so `|B| ≤ k+2 < p+1`.
lemma spider_one_active_after_down (k p : ℕ) (hp : k + 2 ≤ p) (τ : Fin (3*k+4)) (hτ1 : τ.val = 1)
    (B : Finset (Fin (3*k+4))) (hB : B ∈ indepFamily (spiderOneTwoThrees k) (p + 1))
    (hτB : τ ∈ B) (hval : ChainValid (spiderTagFactors k τ) B) (q : Fin (3*k+4))
    (hq : chainDownVertex (spiderTagFactors k τ) B = some q) :
    ∃ w ∈ B.erase q, w.val = 2 ∨ ∃ j < k, w.val = 4 + 3*j := by
  by_contra hno
  have hno' : ∀ w ∈ B.erase q, w.val ≠ 2 ∧ ∀ j < k, w.val ≠ 4 + 3*j := by
    intro w hw
    exact ⟨fun h => hno ⟨w, hw, Or.inl h⟩, fun j hj h => hno ⟨w, hw, Or.inr ⟨j, hj, h⟩⟩⟩
  obtain ⟨hcard, hI⟩ := (mem_indepFamily_iff _ _ _).mp hB
  have hlt := τ.isLt
  have hidx : spiderArmIndex k τ = k := by
    unfold spiderArmIndex
    rw [if_neg (by omega)]
  have hτv : τ = spiderVertex k 1 := (eq_spiderVertex_iff k 1 (by omega) τ).mpr hτ1
  have h0 : spiderVertex k 0 ∉ B := fun h =>
    spider_not_adj_of_indep k B hI _ _ h hτB (by rw [hτv]; exact spiderGraph_adj_zero_one k)
  obtain ⟨-, c, hc, -, hdrop, hqc⟩ := mem_and_exists_drop_of_chainDownVertex _ B hval q hq
  have hle : ∀ c' ∈ spiderTagFactors k τ, (B ∩ c'.verts).card ≤ 1 := by
    intro c' hc'
    simp only [spiderTagFactors, List.mem_cons, List.mem_map, List.mem_range] at hc'
    rcases hc' with rfl | rfl | ⟨j, hj, rfl⟩
    · rw [spiderLeafBlock_verts]
      exact (Finset.card_le_card Finset.inter_subset_right).trans (by simp)
    · have hv := spiderMidBlock_valid k B hI
      simp only [spiderMidBlock, ChainFactor.verts, ChainFactor.Valid] at hv ⊢
      rw [ChainFactor.card_inter_path_eq _ _ _ B hv.1 hv.2.1 hv.2.2.1, if_neg h0]
      have h32 := hv.2.2.2.1
      split_ifs <;> first | omega | exact (h32 ⟨‹_›, ‹_›⟩).elim
    · have hpath : spiderArmBlock k (spiderArmIndex k τ) j =
          .path (spiderVertex k (4+3*j)) (spiderVertex k (5+3*j)) (spiderVertex k (6+3*j)) := by
        rw [hidx]
        unfold spiderArmBlock
        rw [if_neg (by omega)]
      rw [hpath]
      have hv := spiderArmPath_valid k j hj B hI
      simp only [ChainFactor.verts]
      simp only [ChainFactor.Valid] at hv
      rw [ChainFactor.card_inter_path_eq _ _ _ B hv.1 hv.2.1 hv.2.2.1]
      by_cases ha : spiderVertex k (4+3*j) ∈ B
      · have haq : spiderVertex k (4+3*j) = q := by
          by_contra hne
          exact (hno' _ (Finset.mem_erase.mpr ⟨hne, ha⟩)).2 j hj (spiderVertex_val k _ (by omega))
        have hcn : spiderVertex k (6+3*j) ∉ B := by
          intro hcB
          simp only [spiderTagFactors, List.mem_cons, List.mem_map, List.mem_range] at hc
          rcases hc with rfl | rfl | ⟨j', hj', rfl⟩
          · unfold spiderLeafBlock at hdrop
            rw [if_pos hτ1] at hdrop
            simp [ChainFactor.drop] at hdrop
          · rw [mem_spiderMidBlock_verts_iff, ← haq, spiderVertex_val k _ (by omega)] at hqc
            omega
          · rw [mem_spiderArmBlock_verts_iff k _ j' hj', ← haq, spiderVertex_val k _ (by omega)] at hqc
            have hjj : j' = j := by omega
            subst hjj
            rw [hpath] at hdrop
            simp only [ChainFactor.drop, if_pos hcB, Option.some.injEq] at hdrop
            have := congrArg Fin.val (hdrop.trans haq.symm)
            rw [spiderVertex_val k _ (by omega), spiderVertex_val k _ (by omega)] at this
            omega
        rw [if_pos ha, if_neg (fun hb => hv.2.2.2.1 ⟨ha, hb⟩), if_neg hcn]
      · rw [if_neg ha]
        split_ifs <;> first | omega | exact (hv.2.2.2.2 ⟨‹_›, ‹_›⟩).elim
  have hsz := chainSize_le_length _ B hle
  rw [chainSize_spiderTagFactors] at hsz
  simp only [spiderTagFactors, List.length_cons, List.length_map, List.length_range] at hsz
  omega

end E993Transport
-- VERITYOS ENTRY 161 END

-- VERITYOS ENTRY 162 BEGIN lemma E993Transport.spiderTagDown_erase_keeps_tag_active 6074c0cdedd070ad7bdbfa56169bcb39e7496e826ae7fb9594fc96548ee7bfe0
namespace E993Transport

-- r30 C6-LA2 (F2), (F5)–(F7) (critic `C-U1-T`'s block assignment, r30 Cycle 6, Claude Opus 5.5); pattern: r30 C4-LA1 entry
-- 108. Tag `3` is vacuous (`W_3 = {0}` and the root is absent at `|B| ≥ k+3`); for `c_j` the frozen block never drops.
/-- on a `τ`-active source of rank `p + 1 ≥ k + 3` the per-tag down-map deletes one vertex `q ∈ B`, keeps `τ` and keeps
`τ` active. -/
lemma spiderTagDown_erase_keeps_tag_active (k p : ℕ) (hp : k + 2 ≤ p) (τ : Fin (3*k+4))
    (hτ : τ ∈ C5LA1.leafSet (spiderOneTwoThrees k)) (B : Finset (Fin (3*k+4)))
    (hB : B ∈ indepFamily (spiderOneTwoThrees k) (p + 1)) (hτB : τ ∈ B)
    (hact : ¬ Disjoint (B.erase τ) (tagWitnesses (spiderOneTwoThrees k) τ)) :
    ∃ q, chainDownVertex (spiderTagFactors k τ) B = some q ∧ spiderTagDown k τ B = B.erase q ∧
      q ∈ B ∧ τ ∈ B.erase q ∧
        ¬ Disjoint ((B.erase q).erase τ) (tagWitnesses (spiderOneTwoThrees k) τ) := by
  have hleaf : C4LA1.IsGraphLeaf (spiderOneTwoThrees k) τ := by
    simpa [C5LA1.leafSet] using hτ
  obtain ⟨hcard, hI⟩ := (mem_indepFamily_iff _ _ _).mp hB
  have hval := chainValid_spiderTagFactors k τ hleaf B hI hτB hact
  have hd := chainDisjoint_spiderTagFactors k τ
  obtain ⟨q, hq⟩ := exists_chainDownVertex_spiderTagFactors k p hp τ B hcard hval
  have hqB : q ∈ B := (mem_and_exists_drop_of_chainDownVertex _ B hval q hq).1
  have hdown : spiderTagDown k τ B = B.erase q := by
    unfold spiderTagDown
    rw [hq]
  have hnot := notMem_verts_of_chainDownVertex _ B hd hval q hq
  have hlt := τ.isLt
  refine ⟨q, hq, hdown, hqB, ?_⟩
  rcases spider_leaf_cases k τ hleaf with h1 | h3 | ⟨i, hi, hc⟩
  · -- the tag `1`: its block `{1}` is frozen
    have hq1 : q ∉ (spiderLeafBlock k τ).verts :=
      hnot _ (by simp [spiderTagFactors]) (by unfold spiderLeafBlock; rw [if_pos h1]; rfl)
    have hqτ : q ≠ τ := fun h => hq1 ((mem_spiderLeafBlock_verts_iff k τ q).mpr (h ▸ h1))
    refine ⟨Finset.mem_erase.mpr ⟨Ne.symm hqτ, hτB⟩, ?_⟩
    rw [spider_active_one_iff k τ h1]
    exact spider_one_active_after_down k p hp τ h1 B hB hτB hval q hq
  · -- the tag `3`: no active source at these ranks
    exact ((spider_root_notMem k p hp B hB) ((spider_active_three_iff k τ h3 B).mp hact)).elim
  · -- the tag `c_i`: the arm block `i` is frozen at `{a_i, c_i}`
    have hidx : spiderArmIndex k τ = i := by
      unfold spiderArmIndex
      rw [if_pos (by omega)]
      omega
    have hq3 : q ∉ (spiderArmBlock k (spiderArmIndex k τ) i).verts :=
      hnot _ (by
        simp only [spiderTagFactors, List.mem_cons, List.mem_map, List.mem_range]
        exact Or.inr (Or.inr ⟨i, hi, rfl⟩))
        (by unfold spiderArmBlock; rw [if_pos hidx.symm]; rfl)
    rw [mem_spiderArmBlock_verts_iff k _ i hi] at hq3
    have hqτ : q ≠ τ := fun h => hq3 (by rw [h]; omega)
    refine ⟨Finset.mem_erase.mpr ⟨Ne.symm hqτ, hτB⟩, ?_⟩
    rw [spider_active_armTip_iff k i hi τ hc]
    have ha := (spider_active_armTip_iff k i hi τ hc B).mp hact
    refine Finset.mem_erase.mpr ⟨?_, ha⟩
    intro h
    apply hq3
    rw [← h, spiderVertex_val k _ (by omega)]
    omega

end E993Transport
-- VERITYOS ENTRY 162 END

-- VERITYOS ENTRY 163 BEGIN lemma E993Transport.spiderTagDown_injOn 5c09b7608d5ff890cbb5f6c35043f4a4ae59462736b1f5dd66055e03ab84d048
namespace E993Transport

-- r30 C6-LA2 (F7): per-tag injectivity from carried entry 68 (`eq_of_chainDownVertex_erase_eq`) under `ChainDisjoint` and
-- `ChainValid` on both sources (critic `C-U1-T`, r30 Cycle 6, Claude Opus 5.5); pattern: r30 C4-LA1 entry 109.
lemma spiderTagDown_injOn (k p : ℕ) (hp : k + 2 ≤ p) (τ : Fin (3*k+4))
    (hτ : τ ∈ C5LA1.leafSet (spiderOneTwoThrees k)) (B B' : Finset (Fin (3*k+4)))
    (hB : B ∈ indepFamily (spiderOneTwoThrees k) (p + 1))
    (hB' : B' ∈ indepFamily (spiderOneTwoThrees k) (p + 1))
    (hτB : τ ∈ B) (hact : ¬ Disjoint (B.erase τ) (tagWitnesses (spiderOneTwoThrees k) τ))
    (hτB' : τ ∈ B') (hact' : ¬ Disjoint (B'.erase τ) (tagWitnesses (spiderOneTwoThrees k) τ))
    (h : spiderTagDown k τ B = spiderTagDown k τ B') : B = B' := by
  have hleaf : C4LA1.IsGraphLeaf (spiderOneTwoThrees k) τ := by
    simpa [C5LA1.leafSet] using hτ
  obtain ⟨q, hq, hdown, -⟩ := spiderTagDown_erase_keeps_tag_active k p hp τ hτ B hB hτB hact
  obtain ⟨q', hq', hdown', -⟩ :=
    spiderTagDown_erase_keeps_tag_active k p hp τ hτ B' hB' hτB' hact'
  have hval := chainValid_spiderTagFactors k τ hleaf B ((mem_indepFamily_iff _ _ _).mp hB).2 hτB hact
  have hval' :=
    chainValid_spiderTagFactors k τ hleaf B' ((mem_indepFamily_iff _ _ _).mp hB').2 hτB' hact'
  rw [hdown, hdown'] at h
  exact eq_of_chainDownVertex_erase_eq _ (chainDisjoint_spiderTagFactors k τ) B B' hval hval'
    q q' hq hq' h

end E993Transport
-- VERITYOS ENTRY 163 END

-- VERITYOS ENTRY 164 BEGIN lemma E993Transport.spiderOneTwoThrees_exists_deletionSupported_saturatingFlow 1cd9942cc4ade6e06c62ff36f9473ecc357e90725f17b694d6e601e5cd05c2bd
namespace E993Transport

-- r30 C6-LA2 companion (lemma; no certificate of its own, R29-N-12): FLOW in its deletion-supported form, composed through
-- carried entry 75 (`saturatingFlow_of_perTag_deletionInjections`, r30 C4-LA1) with `φ τ B = spiderTagDown k τ B`
-- (critic `C-U1-T`'s block assignment, r30 Cycle 6, Claude Opus 5.5); pattern: r30 C4-LA1 entry 110. The mathematics is the
-- registered spider key's flow clause (`proved_informal`, SR-C5-2); family-scoped to `S(1,2,3^k)`.
/-- a deletion-supported saturating flow on `S(1,2,3^k)` at every rank `p ≥ k + 2`, for every set `F` of leaves. -/
lemma spiderOneTwoThrees_exists_deletionSupported_saturatingFlow (k p : ℕ) (hp : k + 2 ≤ p)
    (F : Finset (Fin (3*k+4))) (hF : F ⊆ C5LA1.leafSet (spiderOneTwoThrees k)) :
    ∃ f : Finset (Fin (3*k+4)) → Finset (Fin (3*k+4)) → ℕ,
      IsSaturatingFlow (spiderOneTwoThrees k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q := by
  refine saturatingFlow_of_perTag_deletionInjections (spiderOneTwoThrees k) F p (spiderTagDown k) ?_ ?_
  · intro τ hτF B hB hτB hact
    obtain ⟨q, -, hdown, hqB, hτq, hactq⟩ :=
      spiderTagDown_erase_keeps_tag_active k p hp τ (hF hτF) B hB hτB hact
    exact ⟨⟨q, hqB, hdown⟩, hdown ▸ hτq, hdown ▸ hactq⟩
  · intro τ hτF B hB B' hB' hτB hact hτB' hact' h
    exact spiderTagDown_injOn k p hp τ (hF hτF) B B' hB hB' hτB hact hτB' hact' h

end E993Transport
-- VERITYOS ENTRY 164 END

-- VERITYOS ENTRY 165 BEGIN lemma E993Transport.spiderOneTwoThrees_deletionFlow 6187b86fdb34fb22426740730f82c97d378c53baca56c830b6701774f3a4ef8c
namespace E993Transport

-- r30 C6-LA2 FLOW-spider (the synthesis node, verbatim signature): the registered spider key's flow clause
-- (`proved_informal`, SR-C5-2); Lean follows critic `C-U1-T`'s block assignment (r30 Cycle 6, Claude Opus 5.5).
/-- FLOW: a saturating flow on `S(1,2,3^k)` at every rank `p ≥ k + 2`, for every set `F` of leaves. -/
lemma spiderOneTwoThrees_deletionFlow (k p : ℕ) (hp : k + 2 ≤ p) (F : Finset (Fin (3*k+4)))
    (hF : F ⊆ C5LA1.leafSet (spiderOneTwoThrees k)) :
    ∃ f, IsSaturatingFlow (spiderOneTwoThrees k) F p f := by
  obtain ⟨f, hf, -⟩ := spiderOneTwoThrees_exists_deletionSupported_saturatingFlow k p hp F hF
  exact ⟨f, hf⟩

end E993Transport
-- VERITYOS ENTRY 165 END

-- VERITYOS ENTRY 166 BEGIN lemma E993Transport.exists_chainDownVertex_spiderTagFactors_root 66d7763ad37942cca168457c65f329da7e668f91b2024b14a3f29f2690194564
namespace E993Transport

-- r30 C6-LA2 N3a (critics `C-U1-T`, `C-U1-F`; r30 Cycle 6, Claude Opus 5.5): on a `(k+2)`-set the unfrozen list has
-- `chainRank ≤ 2k+3 < 2(k+2)`, so carried entry 63 gives `down ≥ 1` and carried entry 65 the chain predecessor.
lemma exists_chainDownVertex_spiderTagFactors_root (k : ℕ) (B : Finset (Fin (3*k+4)))
    (hB : B ∈ indepFamily (spiderOneTwoThrees k) (k + 1 + 1)) :
    ∃ q, chainDownVertex (spiderTagFactors k (spiderVertex k 0)) B = some q := by
  obtain ⟨hcard, hI⟩ := (mem_indepFamily_iff _ _ _).mp hB
  have hval := chainValid_spiderTagFactors_root k B hI
  have hsize := chainSize_spiderTagFactors k (spiderVertex k 0) B
  have hrank := chainRank_spiderTagFactors_root_le k
  have hid := two_mul_chainSize_add_up_eq _ B hval
  exact exists_chainDownVertex_of_down_pos _ B hval (by omega)

end E993Transport
-- VERITYOS ENTRY 166 END

-- VERITYOS ENTRY 167 BEGIN lemma E993Transport.spiderRootSplitDown_spec aa59817e38873161415cba2153a0d3a915d7344a6d66590322df9a346027e3ca
namespace E993Transport

-- r30 C6-LA2 N3a: the root split is a single deletion; root-present sets lose `3`, root-free sets lose their chain
-- predecessor vertex.
lemma spiderRootSplitDown_spec (k : ℕ) (B : Finset (Fin (3*k+4)))
    (hB : B ∈ indepFamily (spiderOneTwoThrees k) (k + 1 + 1)) :
    (spiderVertex k 0 ∈ B → spiderVertex k 3 ∈ B ∧
        spiderRootSplitDown k B = B.erase (spiderVertex k 3)) ∧
      (spiderVertex k 0 ∉ B → ∃ q, chainDownVertex (spiderTagFactors k (spiderVertex k 0)) B = some q ∧
        q ∈ B ∧ spiderRootSplitDown k B = B.erase q) := by
  refine ⟨fun h0 => ⟨spider_three_mem_of_root_mem k B hB h0, ?_⟩, fun h0 => ?_⟩
  · unfold spiderRootSplitDown
    rw [if_pos h0]
  · obtain ⟨q, hq⟩ := exists_chainDownVertex_spiderTagFactors_root k B hB
    have hval := chainValid_spiderTagFactors_root k B ((mem_indepFamily_iff _ _ _).mp hB).2
    refine ⟨q, hq, (mem_and_exists_drop_of_chainDownVertex _ B hval q hq).1, ?_⟩
    unfold spiderRootSplitDown spiderTagDown
    rw [if_neg h0, hq]

end E993Transport
-- VERITYOS ENTRY 167 END

-- VERITYOS ENTRY 168 BEGIN lemma E993Transport.card_range_filter_mod_three_eq_zero c3dee376adc63c6360bde7ebd782a98ab898a1c525f2311f65821137a616bfa3
namespace E993Transport

-- r30 C6-LA2 N3a: the labels `≡ 0 (mod 3)` below `3k+4` are `0, 3, …, 3k+3`; induction on `k` (the pattern of critic
-- `C-U1-T`'s `CriticIndepLB.lean`), no enumeration.
lemma card_range_filter_mod_three_eq_zero (k : ℕ) :
    ((Finset.range (3*k+4)).filter fun n => n % 3 = 0).card = k + 2 := by
  induction k with
  | zero => rfl
  | succ k ih =>
      have h : 3*(k+1)+4 = (3*k+4) + 3 := by ring
      rw [h, Finset.range_add_one, Finset.range_add_one, Finset.range_add_one]
      rw [Finset.filter_insert, Finset.filter_insert, Finset.filter_insert]
      rw [if_pos (by omega : (3*k+4+2) % 3 = 0),
          if_neg (by omega : ¬ (3*k+4+1) % 3 = 0),
          if_neg (by omega : ¬ (3*k+4) % 3 = 0)]
      rw [Finset.card_insert_of_notMem, ih]
      simp only [Finset.mem_filter, Finset.mem_range]
      omega

end E993Transport
-- VERITYOS ENTRY 168 END

-- VERITYOS ENTRY 169 BEGIN lemma E993Transport.spiderRootSplitWitness_mem 4328e988afec7c3bbe6d0a899c06a6ba192fda0d6b7e63b2436827716788f3f9
namespace E993Transport

-- r30 C6-LA2 N3a (critics `C-U1-T`, `C-U1-F`; r30 Cycle 6, Claude Opus 5.5): the missed witness is an independent
-- `(k+1)`-set (no edge joins two labels `≡ 0 (mod 3)`) containing `0` and, for `k ≥ 1`, `3`.
lemma spiderRootSplitWitness_mem (k : ℕ) (hk : 1 ≤ k) :
    spiderRootSplitWitness k ∈ indepFamily (spiderOneTwoThrees k) (k + 1) ∧
      spiderVertex k 0 ∈ spiderRootSplitWitness k ∧ spiderVertex k 3 ∈ spiderRootSplitWitness k := by
  have hmem : ∀ v : Fin (3*k+4), v ∈ spiderRootSplitWitness k ↔ v.val % 3 = 0 ∧ v.val ≠ 3*k+3 := by
    intro v
    unfold spiderRootSplitWitness
    rw [Finset.mem_erase, Finset.mem_filter, ne_eq, eq_spiderVertex_iff k (3*k+3) (by omega)]
    simp only [Finset.mem_univ, true_and]
    exact and_comm
  have htop : spiderVertex k (3*k+3) ∈ Finset.univ.filter fun v : Fin (3*k+4) => v.val % 3 = 0 := by
    rw [Finset.mem_filter, spiderVertex_val k (3*k+3) (by omega)]
    exact ⟨Finset.mem_univ _, by omega⟩
  have hcard0 : (Finset.univ.filter fun v : Fin (3*k+4) => v.val % 3 = 0).card = k + 2 := by
    rw [← card_range_filter_mod_three_eq_zero k, ← Finset.card_map Fin.valEmbedding]
    congr 1
    ext n
    simp only [Finset.mem_map, Finset.mem_filter, Finset.mem_univ, true_and, Fin.valEmbedding_apply,
      Finset.mem_range]
    constructor
    · rintro ⟨v, hv, rfl⟩
      exact ⟨v.isLt, hv⟩
    · rintro ⟨hn, hv⟩
      exact ⟨⟨n, hn⟩, hv, rfl⟩
  refine ⟨?_, (hmem _).mpr ?_, (hmem _).mpr ?_⟩
  · rw [mem_indepFamily_iff]
    refine ⟨?_, ?_⟩
    · unfold spiderRootSplitWitness
      rw [Finset.card_erase_of_mem htop, hcard0]
      rfl
    · intro u hu v hv _ hadj
      have hu' := ((hmem u).mp (Finset.mem_coe.mp hu)).1
      have hv' := ((hmem v).mp (Finset.mem_coe.mp hv)).1
      rw [spiderGraph_adj_iff_val] at hadj
      rcases hadj with (h | h | h | ⟨i, -, h | h | h⟩) | (h | h | h | ⟨i, -, h | h | h⟩) <;> omega
  · rw [spiderVertex_val k 0 (by omega)]
    omega
  · rw [spiderVertex_val k 3 (by omega)]
    omega

end E993Transport
-- VERITYOS ENTRY 169 END

-- VERITYOS ENTRY 170 BEGIN lemma E993Transport.card_indepFamily_spider_succ_lt 39c576eada9884f31ebe822d88f0aa608ada8bbbea1df8fb4b66f9bef3376451
namespace E993Transport

-- r30 C6-LA2 N3a, the ROOT SPLIT (critic `C-U1-T` F3 and critic `C-U1-F` F4, found independently; r30 Cycle 6, Claude Opus
-- 5.5; Newton-free): `spiderRootSplitDown` maps `I_{k+2}` injectively into `I_{k+1}` minus the witness, so
-- `i_{k+2} < i_{k+1}`. Injectivity: root membership is preserved; on root-present sets `erase 3` is undone by `insert 3`;
-- on root-free sets carried entry 68.
lemma card_indepFamily_spider_succ_lt (k : ℕ) (hk : 1 ≤ k) :
    (indepFamily (spiderOneTwoThrees k) (k + 1 + 1)).card <
      (indepFamily (spiderOneTwoThrees k) (k + 1)).card := by
  obtain ⟨hW, hW0, hW3⟩ := spiderRootSplitWitness_mem k hk
  have h03 : spiderVertex k 0 ≠ spiderVertex k 3 :=
    spiderVertex_ne k 0 3 (by omega) (by omega) (by omega)
  have hmaps : ∀ B ∈ indepFamily (spiderOneTwoThrees k) (k + 1 + 1),
      spiderRootSplitDown k B ∈ (indepFamily (spiderOneTwoThrees k) (k + 1)).erase
        (spiderRootSplitWitness k) := by
    intro B hB
    obtain ⟨hpres, hfree⟩ := spiderRootSplitDown_spec k B hB
    by_cases h0 : spiderVertex k 0 ∈ B
    · obtain ⟨h3, hdown⟩ := hpres h0
      rw [hdown]
      refine Finset.mem_erase.mpr ⟨?_, erase_mem_indepFamily _ (k + 1) B hB _ h3⟩
      intro he
      rw [← he] at hW3
      simp at hW3
    · obtain ⟨q, -, hqB, hdown⟩ := hfree h0
      rw [hdown]
      refine Finset.mem_erase.mpr ⟨?_, erase_mem_indepFamily _ (k + 1) B hB _ hqB⟩
      intro he
      rw [← he] at hW0
      exact h0 (Finset.mem_of_mem_erase hW0)
  have hinj : Set.InjOn (spiderRootSplitDown k)
      (indepFamily (spiderOneTwoThrees k) (k + 1 + 1) : Set (Finset (Fin (3*k+4)))) := by
    intro B hB B' hB' he
    have hB1 : B ∈ indepFamily (spiderOneTwoThrees k) (k + 1 + 1) := hB
    have hB1' : B' ∈ indepFamily (spiderOneTwoThrees k) (k + 1 + 1) := hB'
    obtain ⟨hpres, hfree⟩ := spiderRootSplitDown_spec k B hB1
    obtain ⟨hpres', hfree'⟩ := spiderRootSplitDown_spec k B' hB1'
    by_cases h0 : spiderVertex k 0 ∈ B <;> by_cases h0' : spiderVertex k 0 ∈ B'
    · obtain ⟨h3, hd⟩ := hpres h0
      obtain ⟨h3', hd'⟩ := hpres' h0'
      rw [hd, hd'] at he
      rw [← Finset.insert_erase h3, ← Finset.insert_erase h3', he]
    · obtain ⟨-, hd⟩ := hpres h0
      obtain ⟨q', -, -, hd'⟩ := hfree' h0'
      rw [hd, hd'] at he
      have : spiderVertex k 0 ∈ B'.erase q' := he ▸ Finset.mem_erase.mpr ⟨h03, h0⟩
      exact (h0' (Finset.mem_of_mem_erase this)).elim
    · obtain ⟨q, -, -, hd⟩ := hfree h0
      obtain ⟨-, hd'⟩ := hpres' h0'
      rw [hd, hd'] at he
      have : spiderVertex k 0 ∈ B.erase q := he.symm ▸ Finset.mem_erase.mpr ⟨h03, h0'⟩
      exact (h0 (Finset.mem_of_mem_erase this)).elim
    · obtain ⟨q, hq, -, hd⟩ := hfree h0
      obtain ⟨q', hq', -, hd'⟩ := hfree' h0'
      rw [hd, hd'] at he
      exact eq_of_chainDownVertex_erase_eq _ (chainDisjoint_spiderTagFactors k (spiderVertex k 0)) B B'
        (chainValid_spiderTagFactors_root k B ((mem_indepFamily_iff _ _ _).mp hB1).2)
        (chainValid_spiderTagFactors_root k B' ((mem_indepFamily_iff _ _ _).mp hB1').2) q q' hq hq' he
  have hle := Finset.card_le_card_of_injOn (spiderRootSplitDown k) hmaps hinj
  rw [Finset.card_erase_of_mem hW] at hle
  have hpos : 0 < (indepFamily (spiderOneTwoThrees k) (k + 1)).card := Finset.card_pos.mpr ⟨_, hW⟩
  omega

end E993Transport
-- VERITYOS ENTRY 170 END

-- VERITYOS ENTRY 171 BEGIN lemma E993Transport.spiderOneTwoThrees_forwardDifferenceDel_neg f16e60edd0627909c2fd046c44bc83bd10f7ba0cbea4676a7db8c77fe99c321b
namespace E993Transport

-- r30 C6-LA2 N3a: `Δ_{k+1} < 0` (ℤ-valued by the definition of record, entry 11; no truncated ℕ subtraction). COUNT
-- BRIDGE: `indepSetCount G ∅ j` is `(indepSetsAvoiding G ∅ j).card` by definition (entry 10) and carried entry 46 turns
-- `indepFamily G j` into `indepSetsAvoiding G ∅ j`; no new bridge lemma.
lemma spiderOneTwoThrees_forwardDifferenceDel_neg (k : ℕ) (hk : 1 ≤ k) :
    C5LA1.forwardDifferenceDel (spiderOneTwoThrees k) ∅ (k + 1) < 0 := by
  have h := card_indepFamily_spider_succ_lt k hk
  rw [indepFamily_eq_indepSetsAvoiding, indepFamily_eq_indepSetsAvoiding] at h
  unfold C5LA1.forwardDifferenceDel C5LA1.indepSetCount
  omega

end E993Transport
-- VERITYOS ENTRY 171 END

-- VERITYOS ENTRY 172 BEGIN lemma E993Transport.spiderOneTwoThrees_crossingIndex_le 826e09597ecf1e99dc8944f6cb3a78a3204f68a14021bc6ddf8cd0dc50a67de9
namespace E993Transport

-- r30 C6-LA2 N3a (registered SR-C5-2 content; the Newton-free root split of critics `C-U1-T` and `C-U1-F`): `x ≤ k+1` by
-- `Nat.find_le` on the carried definition of record (first-interior entry 14); cf. r30 C5-LA1 entry 181 for the idiom.
/-- N3a: `crossingIndex (S(1,2,3^k)) ≤ k + 1` for `k ≥ 1`. -/
lemma spiderOneTwoThrees_crossingIndex_le (k : ℕ) (hk : 1 ≤ k) :
    C5LA1.crossingIndex (spiderOneTwoThrees k) ≤ k + 1 := by
  classical
  unfold C5LA1.crossingIndex
  exact Nat.find_le (spiderOneTwoThrees_forwardDifferenceDel_neg k hk)

end E993Transport
-- VERITYOS ENTRY 172 END

-- VERITYOS ENTRY 173 BEGIN theorem E993Transport.spiderOneTwoThrees_treeWeightedHall_kPlus3 89a085cbc498c5dcd32fb26b35701c0872f5aa4f3f549963a29227767c2d189e
namespace E993Transport

-- r30 C6-LA2 TERMINAL THEOREM. Key on closure:
-- E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5 (a SEPARATE key from the
-- registered `proved_informal` spider key, which keeps its every-eligible-rank scope and is not superseded at other ranks).
-- Attribution: the transport mechanism, the active-tag weight, the relation, the (HALL) key and the lower-region run:
-- Codex GPT-6 (Astra/Sol/Luna); the sharp boundary `3p < 2α+1` and the high-tail certificates: r29 (Claude,
-- Fable-controlled); definition entries 1–18 incl. `C5LA1.crossingIndex` (first-interior entry 14): the first-interior run
-- (Codex) and the r26/r24/r25 layers; the network definitions: r30 C1-LA1; the graph-generic chain machinery and the
-- per-tag composition (entry 75): r30 C4-LA1; the spider family theorem: r30 Cycle 5 (critic `C-F2-U`, Claude Opus 5.5;
-- per-tag sufficiency: F2, Claude Sonnet 5; hook discharge: the Cycle 5 F adjudicator; the SR-C5-2 reader); r30 Cycle 6:
-- U1 (Claude Sonnet 5) the spider definition and tree layer; critic `C-U1-F` (Claude Opus 5.5) the `α` equality, the low
-- window, the composition face and the root split; critic `C-U1-T` (Claude Opus 5.5) the chain carry, the block
-- assignment, the root split and the `α` lower bound; the U adjudicator (Claude Opus 5.5) node (F0) and the carry
-- verification; the tree-layer pattern: r30 C5-LA1. Lean text assembled by the C6-LA2 formalizer (Claude Opus 5.5).
-- Fences: `S(1,2,3^k)` only; rank `k+3` only; `k ≥ 5` only (the statement is FALSE for `k ≤ 4`: the low window
-- `3(k+3) < 2α+1 = 4k+5` is empty there); deletion-supported flows; NOT (HALL) at full scope; NOT every eligible rank of
-- the spider; NOT every tree; nothing on the primary aggregate (mechanism ≠ aggregate); not an RTree statement; no
-- statement about switch arcs; no status change of (HALL), the primary aggregate, `E993-R23-…`, BETA-AGG, TREE, FOREST,
-- TRANSFER, any refuted key or #993; the per-tag deletion on this one family is family-scoped and revives nothing.
-- `hk` is used only for the low window (the root split consumes only its consequence `1 ≤ k`).
/-- Terminal theorem (C6-LA2): the tree face, eligibility of the rank `k+3`, and (HALL) at that rank for the spider
    `S(1,2,3^k)`, `k ≥ 5`. `hk` is used only for the low window `3(k+3) < 2(2k+2)+1 ⇔ k ≥ 5`. -/
theorem spiderOneTwoThrees_treeWeightedHall_kPlus3 (k : ℕ) (hk : 5 ≤ k) :
    (spiderOneTwoThrees k).IsTree ∧
    C5LA1.crossingIndex (spiderOneTwoThrees k) + 2 ≤ k + 3 ∧
    3 * (k + 3) < 2 * (spiderOneTwoThrees k).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (spiderOneTwoThrees k)
      (favorableLeaves (spiderOneTwoThrees k) (k + 3)) (k + 3) f := by
  refine ⟨spiderOneTwoThrees_isTree k, ?_, spider_lowWindow_kPlus3 k hk, ?_⟩
  · have := spiderOneTwoThrees_crossingIndex_le k (by omega)
    omega
  · exact spiderOneTwoThrees_deletionFlow k (k + 3) (by omega) _
      (by classical exact Finset.filter_subset _ _)

end E993Transport
-- VERITYOS ENTRY 173 END

