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

-- VERITYOS ENTRY 22 BEGIN definition E993Transport.gkEdge fa84b00eac4a90634c8f7f2d76aa5ef2986c2d458327090f4c7bcc8e0beab06a
namespace E993Transport

-- r30 C4-LA1 node N0 (authored in-run by the C4-LA1 formalizer, Claude Opus 5.5): the `G_k` family of
-- r30 Cycles 2–3; declaration text frozen by the Cycle 4 synthesis `## Lean awards` "C4-LA1".
/-- `G_k` on `Fin (3*k+5)`: root `0`; leaf `1`; support `2` with leaves `3, 4`;
    arms `0 – (5+3i) – (6+3i) – (7+3i)` for `i < k`. -/
def gkEdge (k : ℕ) (u v : Fin (3*k+5)) : Prop :=
  (u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3) ∨
  (u.val = 2 ∧ v.val = 4) ∨
  ∃ i < k, (u.val = 0 ∧ v.val = 5+3*i) ∨ (u.val = 5+3*i ∧ v.val = 6+3*i) ∨
           (u.val = 6+3*i ∧ v.val = 7+3*i)

end E993Transport
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN definition E993Transport.gkGraph 2cc3de97951b9581ed9e6d8d2056989c7714142745a67cea62ee75a60ad2fc7f
namespace E993Transport

-- r30 C4-LA1 node N0: declaration text frozen by the Cycle 4 synthesis.
def gkGraph (k : ℕ) : SimpleGraph (Fin (3*k+5)) := SimpleGraph.fromRel (gkEdge k)

end E993Transport
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN definition E993Transport.gkGraph_decAdj 025e213bc0ac986f4f4aff6f721b597c1c504b464e9d75f8ba5ac82c841f99e6
namespace E993Transport

-- r30 C4-LA1 node N0: the synthesis draft's instance comment made an authored instance (repair on the face).
/-- The decidable adjacency of `G_k` (authored in-run): `gkEdge` is a finite disjunction of
equalities of naturals and a bounded `∃ i < k`, each decidable by the core instances, so no
classical choice is used. Registered as `@[reducible, instance] def` (what `instance` elaborates
to), because the registrar admits definition entries by `def`. -/
@[reducible, instance]
def gkGraph_decAdj (k : ℕ) : DecidableRel (gkGraph k).Adj := fun u v =>
  haveI : ∀ a b : Fin (3*k+5), Decidable (gkEdge k a b) := fun a b => by
    unfold gkEdge
    infer_instance
  decidable_of_iff (u ≠ v ∧ (gkEdge k u v ∨ gkEdge k v u))
    (SimpleGraph.fromRel_adj (gkEdge k) u v).symm

end E993Transport
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN definition E993Transport.ChainFactor 32ea0d8f6cd1afd29aae0ef78466725c9f2042e10499ee0018b5b368dd152608
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
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN definition E993Transport.ChainFactor.verts d32cf84a8f9199e032cc55ef77cd1c89514dab2dad4fe89962d8ee1746211df3
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

/-- the vertices of a block. -/
def verts : ChainFactor V → Finset V
  | single v => {v}
  | path x y z => {x, y, z}
  | frozen vs _ => vs

end E993Transport.ChainFactor
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN definition E993Transport.ChainFactor.code 2211061474e938c423e7b6443fa5551d0d2488d114b89021f19299f5ebde9e28
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
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN definition E993Transport.ChainFactor.drop ece00f9f193d5fb0388d247cf9ee74f011cc831b7497a6ce84473cc96b66aa03
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

/-- the vertex deleted to step one place down the block's chain. -/
def drop : ChainFactor V → Finset V → Option V
  | single v, _ => some v
  | path x _ z, B => some (if z ∈ B then z else x)
  | frozen _ _, _ => none

end E993Transport.ChainFactor
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN definition E993Transport.ChainFactor.rk b83a7614b24110043177f7750524ff6966c3e082675c98ee1f09bd96de405aa5
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

/-- the rank of the block's poset (bottom rank plus top rank of every chain). -/
def rk : ChainFactor V → ℕ
  | single _ => 1
  | path _ _ _ => 2
  | frozen _ s => 2 * s.card

end E993Transport.ChainFactor
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN definition E993Transport.ChainFactor.Valid a3234600eca858e9e46b1096308ad7173dcb1c08890de8fa20fff06ca5f90e86
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

/-- the restriction of `B` to the block is an independent set of the block (resp. equals the
frozen subset). -/
def Valid : ChainFactor V → Finset V → Prop
  | single _, _ => True
  | path x y z, B => x ≠ y ∧ y ≠ z ∧ x ≠ z ∧ ¬ (x ∈ B ∧ y ∈ B) ∧ ¬ (y ∈ B ∧ z ∈ B)
  | frozen vs s, B => B ∩ vs = s

end E993Transport.ChainFactor
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN definition E993Transport.chainDownUp 00e0441d4505a37043d16701c57df44371bfe0b363db468853bf8c328eeb1d2e
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
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN definition E993Transport.chainDownVertex a9f7993f09ffc293fb28aad03fb6c6dadff488e05d1d9bfb905373ed3fe026a2
namespace E993Transport

variable {V : Type*} [DecidableEq V]

-- r30 C4-LA1 node N5: the chain-predecessor map `φ` of step (4) of Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5).
/-- the vertex whose deletion moves `B` to its predecessor in its chain (`none` at a bottom). -/
def chainDownVertex : List (ChainFactor V) → Finset V → Option V
  | [], _ => none
  | c :: cs, B =>
      if (c.code B).1 ≤ (chainDownUp cs B).2 then chainDownVertex cs B else c.drop B

end E993Transport
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN definition E993Transport.chainVerts f16d063a48e4c1fafc6b9b3650f4fcbb1b7818e772759936852e38b5c20aae7d
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- the vertices of all blocks. -/
def chainVerts : List (ChainFactor V) → Finset V
  | [] => ∅
  | c :: cs => c.verts ∪ chainVerts cs

end E993Transport
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN definition E993Transport.chainSize 67ba19c5f90b6e293d96f0d920a4064a85c8bc6f34515d1330d7f3c527a3493e
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- the summed block sizes of `B`. -/
def chainSize : List (ChainFactor V) → Finset V → ℕ
  | [], _ => 0
  | c :: cs, B => (B ∩ c.verts).card + chainSize cs B

end E993Transport
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN definition E993Transport.chainRank 57cab594ae10b9f31b5249872902203ba9f79c64d31a2ff238d53ad37e9b74af
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- the rank of the product poset. -/
def chainRank : List (ChainFactor V) → ℕ
  | [] => 0
  | c :: cs => c.rk + chainRank cs

end E993Transport
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN definition E993Transport.ChainValid 0ce0540bbc55ef26cf609600eb55466524c1f1c29abc4e72fc23332e7773afdf
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- every block restriction of `B` is valid. -/
def ChainValid (cs : List (ChainFactor V)) (B : Finset V) : Prop :=
  ∀ c ∈ cs, c.Valid B

end E993Transport
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN definition E993Transport.ChainDisjoint 27b6c75f4bd0b071963bf27e843b0fee087c8c90dbc13c567bab42607355c7c1
namespace E993Transport

variable {V : Type*} [DecidableEq V]

/-- the blocks have pairwise disjoint vertex sets. -/
def ChainDisjoint (cs : List (ChainFactor V)) : Prop :=
  cs.Pairwise fun c c' => Disjoint c.verts c'.verts

end E993Transport
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN definition E993Transport.gkVertex 5dbe52451e63adfe8a442644a91f0af343b157ae2eca94ef655e53817f7df53d
namespace E993Transport

/-- the vertex of `G_k` with label `n` (labels `n < 3k+5` are the vertices of record). -/
def gkVertex (k n : ℕ) : Fin (3*k+5) := ⟨n % (3*k+5), Nat.mod_lt _ (by omega)⟩

end E993Transport
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN definition E993Transport.gkLeafBlock d55941db45bef0e1555e56ede0ce719b2995e39b935d6c12419182fa7cd28e86
namespace E993Transport

/-- the block `{1}` of `G_k − 0`: frozen at `{1}` for the tag `1`, else the chain `∅ < {1}`. -/
def gkLeafBlock (k : ℕ) (τ : Fin (3*k+5)) : ChainFactor (Fin (3*k+5)) :=
  if τ.val = 1 then .frozen {gkVertex k 1} {gkVertex k 1} else .single (gkVertex k 1)

end E993Transport
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN definition E993Transport.gkCherryBlock f932706497c820ddefbc353ba066e19feb223d1265c905ef35da2b270b0383fa
namespace E993Transport

/-- the cherry block `3 – 2 – 4` of `G_k − 0`: frozen at `{3, 4}` for the tags `3`, `4`, else the
path block with chains `∅ < {3} < {3, 4}`, `{2}`, `{4}`. -/
def gkCherryBlock (k : ℕ) (τ : Fin (3*k+5)) : ChainFactor (Fin (3*k+5)) :=
  if τ.val = 3 ∨ τ.val = 4 then
    .frozen {gkVertex k 3, gkVertex k 2, gkVertex k 4} {gkVertex k 3, gkVertex k 4}
  else .path (gkVertex k 3) (gkVertex k 2) (gkVertex k 4)

end E993Transport
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN definition E993Transport.gkArmBlock 6492528421098725201bf3ccce76b345d276a2e140b0419f473108a3f2173cc6
namespace E993Transport

/-- the arm block `a_j – b_j – c_j` (labels `5+3j, 6+3j, 7+3j`): frozen at `{a_j, c_j}` when
`j = i`, else the path block with chains `∅ < {a_j} < {a_j, c_j}`, `{b_j}`, `{c_j}`. -/
def gkArmBlock (k i j : ℕ) : ChainFactor (Fin (3*k+5)) :=
  if j = i then
    .frozen {gkVertex k (5+3*j), gkVertex k (6+3*j), gkVertex k (7+3*j)}
      {gkVertex k (5+3*j), gkVertex k (7+3*j)}
  else .path (gkVertex k (5+3*j)) (gkVertex k (6+3*j)) (gkVertex k (7+3*j))

end E993Transport
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN definition E993Transport.gkArmIndex b56fb2f9631a08c417f13f1276e0737629cbfa5a701ac7ebaa43740ca3e2517e
namespace E993Transport

/-- the index of the arm frozen by the tag `τ` (`(τ − 7)/3` for `τ = c_i`; `k`, i.e. none, for the
tags `1`, `3`, `4`). -/
def gkArmIndex (k : ℕ) (τ : Fin (3*k+5)) : ℕ :=
  if 7 ≤ τ.val then (τ.val - 7) / 3 else k

end E993Transport
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN definition E993Transport.gkTagFactors 01d3808a0609b77733f30baef3b34da631c76bbe693af1332efcc1ba447fa92a
namespace E993Transport

/-- the blocks of `G_k − 0` for the tag `τ`, the tag's own block frozen. -/
def gkTagFactors (k : ℕ) (τ : Fin (3*k+5)) : List (ChainFactor (Fin (3*k+5))) :=
  gkLeafBlock k τ :: gkCherryBlock k τ :: (List.range k).map (gkArmBlock k (gkArmIndex k τ))

end E993Transport
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN definition E993Transport.gkTagDown 13db5e3404505e2b70fea723f1454a6d297d20cc77eb54f7e98f99ab5c36db28
namespace E993Transport

/-- the per-tag down-map `φ_τ`: delete the chain-predecessor vertex (identity at a chain
bottom, which never occurs on the τ-active sources above the centre). -/
def gkTagDown (k : ℕ) (τ : Fin (3*k+5)) (B : Finset (Fin (3*k+5))) : Finset (Fin (3*k+5)) :=
  match chainDownVertex (gkTagFactors k τ) B with
  | some q => B.erase q
  | none => B

end E993Transport
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma E993Interior.highTailAggregateFromShadow 972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d
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
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma E993Transport.indepFamily_eq_indepSetsAvoiding 45d1a93e12e0f50a58b9efb7fe25fab2fcd0c2e31eff6b3ac74795bf6a27cfe8
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
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma E993Transport.isGraphLeaf_of_mem_favorableLeaves 8977fb83111a46cace690984e23e2ffd54e2ea5233712bfeeca579f1debf75c8
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
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma E993Transport.tagWitnesses_subset_R 7a8528a04b10243adfa0e8488d21206bd9cfed44e18910e7ed810b7b8517baad
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
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma E993Transport.card_active_eq_tagged 8823a71dad443ec51fdf34fc541c2c66aab7792d9520f8ef76665729ece12616
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
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma E993Transport.layerWeight_eq_sum_card 6adece46210475286f5574371270d1f0cba414876eec5e7dd058ab2fa1993c8f
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
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma E993Transport.layerWeight_sub_eq_sum 56e71a87c92f3d8435c1f8fb3b3e906cb037d78027b5bdfdf26b824a1fa8cc33
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
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma E993Transport.activeWeightAggregateIdentity 9daf96e3501eccf92cd7025a400785520be2dc5ed078923730e0729f2af7d899
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
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma E993Transport.aggregate_nonpos_of_saturatingFlow ce01183cc56349c832b3626edb125bdffae41d91412371271d18104ee3795f30
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
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma E993Transport.weightedHall_of_saturatingFlow 89a7ffb8bc79b1d61290459a843fb8fa2ca73c6fc9e3b6affd8448933bf2d54c
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
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma E993Transport.ChainFactor.card_inter_path_eq fb9273d46ecbb6344f21f47a0c2732841ee2a4f2b07e752d410714c1a83e9b9f
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
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma E993Transport.ChainFactor.two_mul_card_add_len_eq b4b34a0cf1dfc68177104fb386cb85c926399eb09058db3a6075dce9992dd789
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
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma E993Transport.ChainFactor.code_fst_le_snd 4687c620aae2e16910394ac2b3dbfe8d7ec8073e4860e68c8386bdadf2ed726f
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

lemma code_fst_le_snd (c : ChainFactor V) (B : Finset V) : (c.code B).1 ≤ (c.code B).2 := by
  cases c with
  | single v => simp only [code]; split_ifs <;> simp
  | path x y z => simp only [code]; split_ifs <;> simp
  | frozen vs s => simp [code]

end E993Transport.ChainFactor
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma E993Transport.ChainFactor.exists_drop_of_code_pos 4d7c96673fdbc78ce2cad5bf2d0920cdb5ab54ac92009057f9ba780ccad8726a
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
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma E993Transport.ChainFactor.code_erase_of_notMem d90065196eafb6af9bc223e3ccd6bcc75af09805706e98ee5cbe27443fca1cb9
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
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma E993Transport.ChainFactor.drop_mem_or_mem_of_ne 9088c80b91e37fe76657818f8ffd646e51010bc42e645849b3bc56e9788a336c
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
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma E993Transport.mem_chainVerts_iff cde031a8ef9764eb71e766dea3d2e10b9cf2fcb22beb86999aa6d89928db9a0d
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma mem_chainVerts_iff (cs : List (ChainFactor V)) (v : V) :
    v ∈ chainVerts cs ↔ ∃ c ∈ cs, v ∈ c.verts := by
  induction cs with
  | nil => simp [chainVerts]
  | cons c cs ih => simp [chainVerts, ih]

end E993Transport
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma E993Transport.chainDownUp_erase_of_notMem f76732f072f2fdad9f343e94dbf3d5636518fbad4990ff5e747c1da53616dcac
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
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma E993Transport.two_mul_chainSize_add_up_eq 7793757076279a9c59439aa2be8734e8c2a27085ece8bbf51e24e87d670868ea
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
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma E993Transport.mem_and_exists_drop_of_chainDownVertex 4a73e439b8a01bae4d1230bb79f86c880fb395752904af56caeea92117c347d5
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
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma E993Transport.exists_chainDownVertex_of_down_pos ae9b9fa0e2265983da2e05ce4211a971ef7da084996ec6eb137d0eaa38afd511
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
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma E993Transport.chainDownUp_erase_chainDownVertex f240147f3dfcd92cdfeae410ad951156a42c6e1ec49ae9f2e531f0ea4ef38ef7
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
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma E993Transport.notMem_verts_of_chainDownVertex f52cd04f62a0623e8e96121a1eebf932f0b79dcc88068a9fed09ad4f37c75df4
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
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma E993Transport.eq_of_chainDownVertex_erase_eq abe1b5e82ab32a2af7093e3ffa66492e5c8423f6928f518be160b7b2119231df
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
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma E993Transport.chainDownUp_snd_eq_zero_of_top 9b81f16c82a17c3b6f0d9335491d0f8d72913f08847a29165f0a765689b2c13c
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
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma E993Transport.chainSize_eq_card_inter 5c45300ef1a4198e3838a01ad3649dd0f6d5669ed8fc6ef3aa25b0f606c97402
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
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma E993Transport.chainSize_le_length 5feb79ed3065b9d6e7c42c63b8142bad998feb627f1d6dcc00d06d5ca1538292
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
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma E993Transport.top_of_length_le_chainSize ac4b9d8227aeb56206cac0be221a3764507340765e07250f8ccd995e0a9dc8b9
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
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma E993Transport.mem_indepFamily_iff d30c9ae0035311c89520623588b7418ed42be1a95848546b7b181e1a257411e5
namespace E993Transport

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_indepFamily_iff (G : SimpleGraph V) [DecidableRel G.Adj] (j : ℕ) (B : Finset V) :
    B ∈ indepFamily G j ↔ B.card = j ∧ G.IsIndepSet (B : Set V) := by
  simp [indepFamily, Finset.mem_powersetCard]

end E993Transport
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma E993Transport.erase_mem_indepFamily 2832798965770e894f108bf878bbc98df5a0a0b7738130529c712b613d44442b
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
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma E993Transport.saturatingFlow_of_perTag_deletionInjections 72ae49fe71d5923ebf506d4d48f40139072320a394af5c8f6b7611fa898fb048
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
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma E993Transport.gkVertex_val e2b82f69fd71f10d62504c04bb415da57ee121bf8224ad32a703ef4dc735b59c
namespace E993Transport

lemma gkVertex_val (k n : ℕ) (h : n < 3*k+5) : (gkVertex k n).val = n :=
  Nat.mod_eq_of_lt h

end E993Transport
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma E993Transport.eq_gkVertex_iff 821056fedfff00187c86c908f974b165362d07e4120d24821f13d1f5cb2cf8b3
namespace E993Transport

lemma eq_gkVertex_iff (k n : ℕ) (h : n < 3*k+5) (v : Fin (3*k+5)) :
    v = gkVertex k n ↔ v.val = n := by
  rw [Fin.ext_iff, gkVertex_val k n h]

end E993Transport
-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma E993Transport.gkGraph_adj_iff 8d360de32ed56b43a09bb8c72ae489e609c91bf337ff6701a077c8b17d0a67c8
namespace E993Transport

lemma gkGraph_adj_iff (k : ℕ) (u v : Fin (3*k+5)) :
    (gkGraph k).Adj u v ↔ gkEdge k u v ∨ gkEdge k v u := by
  have hne : ∀ a b : Fin (3*k+5), gkEdge k a b → a ≠ b := by
    intro a b h hab
    subst hab
    unfold gkEdge at h
    rcases h with h | h | h | h | ⟨i, -, h | h | h⟩ <;> omega
  rw [gkGraph, SimpleGraph.fromRel_adj]
  constructor
  · exact fun h => h.2
  · intro h
    refine ⟨?_, h⟩
    rcases h with h | h
    · exact hne u v h
    · exact fun huv => hne v u h huv.symm

end E993Transport
-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma E993Transport.gkGraph_adj_iff_val 1e42ac9f507e04c9ba0473e6e3535a98b4e22aa5672ba0b9f56340ede4feccd2
namespace E993Transport

/-- adjacency of `G_k` read on labels. -/
lemma gkGraph_adj_iff_val (k : ℕ) (u v : Fin (3*k+5)) :
    (gkGraph k).Adj u v ↔
      ((u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3) ∨
        (u.val = 2 ∧ v.val = 4) ∨
        ∃ i < k, (u.val = 0 ∧ v.val = 5+3*i) ∨ (u.val = 5+3*i ∧ v.val = 6+3*i) ∨
          (u.val = 6+3*i ∧ v.val = 7+3*i)) ∨
      ((v.val = 0 ∧ u.val = 1) ∨ (v.val = 0 ∧ u.val = 2) ∨ (v.val = 2 ∧ u.val = 3) ∨
        (v.val = 2 ∧ u.val = 4) ∨
        ∃ i < k, (v.val = 0 ∧ u.val = 5+3*i) ∨ (v.val = 5+3*i ∧ u.val = 6+3*i) ∨
          (v.val = 6+3*i ∧ u.val = 7+3*i)) := by
  rw [gkGraph_adj_iff]
  rfl

end E993Transport
-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma E993Transport.gkGraph_adj_of_val 845a87211ec204ad718aabe587c4e9ebefe7cc32c794fe9038e4ce1387098e7b
namespace E993Transport

/-- an arm edge `a_j – b_j`, `b_j – c_j`, or a root edge, is an edge of `G_k` (label form). -/
lemma gkGraph_adj_of_val (k : ℕ) (u v : Fin (3*k+5))
    (h : (u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3) ∨
        (u.val = 2 ∧ v.val = 4) ∨
        ∃ i < k, (u.val = 0 ∧ v.val = 5+3*i) ∨ (u.val = 5+3*i ∧ v.val = 6+3*i) ∨
          (u.val = 6+3*i ∧ v.val = 7+3*i)) :
    (gkGraph k).Adj u v :=
  (gkGraph_adj_iff k u v).2 (Or.inl h)

end E993Transport
-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma E993Transport.gkLeafBlock_verts c85615531df022c4537f554267efc95c8bf4878f44e6946ecda5970535a17994
namespace E993Transport

lemma gkLeafBlock_verts (k : ℕ) (τ : Fin (3*k+5)) :
    (gkLeafBlock k τ).verts = {gkVertex k 1} := by
  unfold gkLeafBlock
  split_ifs <;> rfl

end E993Transport
-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma E993Transport.gkCherryBlock_verts d72b98200f7d4fb98d7f3a474b21e7daf14370a103efe38a785cbfa481b0237d
namespace E993Transport

lemma gkCherryBlock_verts (k : ℕ) (τ : Fin (3*k+5)) :
    (gkCherryBlock k τ).verts = {gkVertex k 3, gkVertex k 2, gkVertex k 4} := by
  unfold gkCherryBlock
  split_ifs <;> rfl

end E993Transport
-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN lemma E993Transport.gkArmBlock_verts 6272a87d2fac20664b537bf5c314c84cf177f702c32792938da95a6edd7c4cb5
namespace E993Transport

lemma gkArmBlock_verts (k i j : ℕ) :
    (gkArmBlock k i j).verts =
      {gkVertex k (5+3*j), gkVertex k (6+3*j), gkVertex k (7+3*j)} := by
  unfold gkArmBlock
  split_ifs <;> rfl

end E993Transport
-- VERITYOS ENTRY 83 END

-- VERITYOS ENTRY 84 BEGIN lemma E993Transport.mem_gkLeafBlock_verts_iff 38831b1b303118c60790acdde3678f2d263e9ac0ac667477cbe90a3f54dc5f8a
namespace E993Transport

lemma mem_gkLeafBlock_verts_iff (k : ℕ) (τ v : Fin (3*k+5)) :
    v ∈ (gkLeafBlock k τ).verts ↔ v.val = 1 := by
  rw [gkLeafBlock_verts, Finset.mem_singleton, eq_gkVertex_iff k 1 (by omega)]

end E993Transport
-- VERITYOS ENTRY 84 END

-- VERITYOS ENTRY 85 BEGIN lemma E993Transport.mem_gkCherryBlock_verts_iff 096cf068463c225a7b4cedbb8390283d9c21147f823dafab2495f5691175e6fc
namespace E993Transport

lemma mem_gkCherryBlock_verts_iff (k : ℕ) (τ v : Fin (3*k+5)) :
    v ∈ (gkCherryBlock k τ).verts ↔ v.val = 3 ∨ v.val = 2 ∨ v.val = 4 := by
  rw [gkCherryBlock_verts]
  simp only [Finset.mem_insert, Finset.mem_singleton]
  rw [eq_gkVertex_iff k 3 (by omega), eq_gkVertex_iff k 2 (by omega),
    eq_gkVertex_iff k 4 (by omega)]

end E993Transport
-- VERITYOS ENTRY 85 END

-- VERITYOS ENTRY 86 BEGIN lemma E993Transport.mem_gkArmBlock_verts_iff e61057255218fca4e5088d12ead685a6c50bcac5d14c89544ec7c86496710a9c
namespace E993Transport

lemma mem_gkArmBlock_verts_iff (k i j : ℕ) (hj : j < k) (v : Fin (3*k+5)) :
    v ∈ (gkArmBlock k i j).verts ↔ v.val = 5+3*j ∨ v.val = 6+3*j ∨ v.val = 7+3*j := by
  rw [gkArmBlock_verts]
  simp only [Finset.mem_insert, Finset.mem_singleton]
  rw [eq_gkVertex_iff k _ (by omega), eq_gkVertex_iff k _ (by omega),
    eq_gkVertex_iff k _ (by omega)]

end E993Transport
-- VERITYOS ENTRY 86 END

-- VERITYOS ENTRY 87 BEGIN lemma E993Transport.mem_chainVerts_gkTagFactors_iff 596c5850dad28fd3f0b30e74a11d3e8d0df9ae46814a907032f58ddc63918502
namespace E993Transport

/-- the blocks of `G_k − 0` cover exactly the non-root vertices. -/
lemma mem_chainVerts_gkTagFactors_iff (k : ℕ) (τ v : Fin (3*k+5)) :
    v ∈ chainVerts (gkTagFactors k τ) ↔ v.val ≠ 0 := by
  rw [mem_chainVerts_iff]
  have hv := v.isLt
  constructor
  · rintro ⟨c, hc, hvc⟩
    simp only [gkTagFactors, List.mem_cons, List.mem_map, List.mem_range] at hc
    rcases hc with rfl | rfl | ⟨j, hj, rfl⟩
    · rw [mem_gkLeafBlock_verts_iff] at hvc
      omega
    · rw [mem_gkCherryBlock_verts_iff] at hvc
      omega
    · rw [mem_gkArmBlock_verts_iff k _ j hj] at hvc
      omega
  · intro h0
    by_cases h1 : v.val = 1
    · exact ⟨gkLeafBlock k τ, by simp [gkTagFactors], (mem_gkLeafBlock_verts_iff k τ v).2 h1⟩
    by_cases h234 : v.val = 3 ∨ v.val = 2 ∨ v.val = 4
    · exact ⟨gkCherryBlock k τ, by simp [gkTagFactors],
        (mem_gkCherryBlock_verts_iff k τ v).2 h234⟩
    have hj : (v.val - 5) / 3 < k := by omega
    refine ⟨gkArmBlock k (gkArmIndex k τ) ((v.val - 5) / 3), ?_, ?_⟩
    · simp only [gkTagFactors, List.mem_cons, List.mem_map, List.mem_range]
      exact Or.inr (Or.inr ⟨_, hj, rfl⟩)
    · rw [mem_gkArmBlock_verts_iff k _ _ hj]
      omega

end E993Transport
-- VERITYOS ENTRY 87 END

-- VERITYOS ENTRY 88 BEGIN lemma E993Transport.chainDisjoint_gkTagFactors c082c60ac22c60c344947b0f7ad605c6b155b1a276ccb14bc8e8826429394ccc
namespace E993Transport

lemma chainDisjoint_gkTagFactors (k : ℕ) (τ : Fin (3*k+5)) :
    ChainDisjoint (gkTagFactors k τ) := by
  unfold ChainDisjoint gkTagFactors
  simp only [List.pairwise_cons, List.mem_cons, List.mem_map, List.mem_range,
    forall_eq_or_imp, forall_exists_index, and_imp]
  refine ⟨⟨?_, ?_⟩, ?_, ?_⟩
  · rw [Finset.disjoint_left]
    intro v h1 h2
    rw [mem_gkLeafBlock_verts_iff] at h1
    rw [mem_gkCherryBlock_verts_iff] at h2
    omega
  · rintro c j hj rfl
    rw [Finset.disjoint_left]
    intro v h1 h2
    rw [mem_gkLeafBlock_verts_iff] at h1
    rw [mem_gkArmBlock_verts_iff k _ j hj] at h2
    omega
  · rintro c j hj rfl
    rw [Finset.disjoint_left]
    intro v h1 h2
    rw [mem_gkCherryBlock_verts_iff] at h1
    rw [mem_gkArmBlock_verts_iff k _ j hj] at h2
    omega
  · rw [List.pairwise_map]
    refine (List.nodup_range).imp_of_mem ?_
    intro j j' hj hj' hne
    rw [List.mem_range] at hj hj'
    rw [Finset.disjoint_left]
    intro v h1 h2
    rw [mem_gkArmBlock_verts_iff k _ j hj] at h1
    rw [mem_gkArmBlock_verts_iff k _ j' hj'] at h2
    omega

end E993Transport
-- VERITYOS ENTRY 88 END

-- VERITYOS ENTRY 89 BEGIN lemma E993Transport.chainSize_gkTagFactors af1a6b759a619553a4d950b1eeb311300f305b78a84381a59b3eb948aceef6bd
namespace E993Transport

lemma chainSize_gkTagFactors (k : ℕ) (τ : Fin (3*k+5)) (B : Finset (Fin (3*k+5))) :
    chainSize (gkTagFactors k τ) B = (B.erase (gkVertex k 0)).card := by
  rw [chainSize_eq_card_inter _ (chainDisjoint_gkTagFactors k τ)]
  congr 1
  ext v
  simp only [Finset.mem_inter, mem_chainVerts_gkTagFactors_iff, Finset.mem_erase, ne_eq,
    eq_gkVertex_iff k 0 (by omega : 0 < 3*k+5)]
  exact and_comm

end E993Transport
-- VERITYOS ENTRY 89 END

-- VERITYOS ENTRY 90 BEGIN lemma E993Transport.chainRank_map_gkArmBlock_le 1fc0e1ec47998e4a24eaf106df3912584013f751440d6c3bd4406c40e4cf3b73
namespace E993Transport

lemma chainRank_map_gkArmBlock_le (k i n : ℕ) :
    chainRank ((List.range n).map (gkArmBlock k i)) ≤ 2 * n + (if i < n then 2 else 0) := by
  induction n with
  | zero => simp [chainRank]
  | succ n ih =>
      have hrk : (gkArmBlock k i n).rk ≤ if n = i then 4 else 2 := by
        unfold gkArmBlock
        split_ifs
        · simp only [ChainFactor.rk]
          have := Finset.card_le_two (a := gkVertex k (5+3*n)) (b := gkVertex k (7+3*n))
          omega
        · simp [ChainFactor.rk]
      have happ : ∀ l₁ l₂ : List (ChainFactor (Fin (3*k+5))),
          chainRank (l₁ ++ l₂) = chainRank l₁ + chainRank l₂ := by
        intro l₁ l₂
        induction l₁ with
        | nil => simp [chainRank]
        | cons c l ih' => simp only [List.cons_append, chainRank, ih']; omega
      rw [List.range_succ, List.map_append, happ]
      simp only [List.map_cons, List.map_nil, chainRank]
      split_ifs at ih hrk ⊢ <;> omega

end E993Transport
-- VERITYOS ENTRY 90 END

-- VERITYOS ENTRY 91 BEGIN lemma E993Transport.chainRank_gkTagFactors_le 58c5e3ea3b1db6acde8f36ca17255ff57e379583287214b5fbc053c89dd700fe
namespace E993Transport

lemma chainRank_gkTagFactors_le (k : ℕ) (τ : Fin (3*k+5)) :
    chainRank (gkTagFactors k τ) ≤ 2 * k + 5 := by
  have harm := chainRank_map_gkArmBlock_le k (gkArmIndex k τ) k
  have hτ := τ.isLt
  simp only [gkTagFactors, chainRank]
  unfold gkLeafBlock gkCherryBlock gkArmIndex at *
  split_ifs at harm ⊢ <;> simp only [ChainFactor.rk, Finset.card_singleton] at * <;>
    first
    | omega
    | (have := Finset.card_le_two (a := gkVertex k 3) (b := gkVertex k 4); omega)

end E993Transport
-- VERITYOS ENTRY 91 END

-- VERITYOS ENTRY 92 BEGIN lemma E993Transport.gkVertex_ne ff36793eb22ae877779e33a9fa56ec6e2bb75f4112bb8d4d4b803f2ba05dda42
namespace E993Transport

lemma gkVertex_ne (k m n : ℕ) (hm : m < 3*k+5) (hn : n < 3*k+5) (hmn : m ≠ n) :
    gkVertex k m ≠ gkVertex k n := by
  intro h
  have := congrArg Fin.val h
  rw [gkVertex_val k m hm, gkVertex_val k n hn] at this
  exact hmn this

end E993Transport
-- VERITYOS ENTRY 92 END

-- VERITYOS ENTRY 93 BEGIN lemma E993Transport.gkGraph_adj_of_val_root 69e46ac55fac45ae38904bfb8f89c20f7b997e5b38138b72d55c5fefb26ec565
namespace E993Transport

/-- a root or cherry edge of `G_k`, read on labels. -/
lemma gkGraph_adj_of_val_root (k : ℕ) (u v : Fin (3*k+5))
    (h : (u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3) ∨
      (u.val = 2 ∧ v.val = 4)) : (gkGraph k).Adj u v := by
  apply gkGraph_adj_of_val
  rcases h with h | h | h | h
  · exact Or.inl h
  · exact Or.inr (Or.inl h)
  · exact Or.inr (Or.inr (Or.inl h))
  · exact Or.inr (Or.inr (Or.inr (Or.inl h)))

end E993Transport
-- VERITYOS ENTRY 93 END

-- VERITYOS ENTRY 94 BEGIN lemma E993Transport.gkGraph_adj_of_val_arm 6237dafe940e34591ba4ac181f8683b7105fc13173619bf0d6eec0afe5790585
namespace E993Transport

/-- an arm edge of `G_k`, read on labels. -/
lemma gkGraph_adj_of_val_arm (k : ℕ) (u v : Fin (3*k+5)) (j : ℕ) (hj : j < k)
    (h : (u.val = 0 ∧ v.val = 5+3*j) ∨ (u.val = 5+3*j ∧ v.val = 6+3*j) ∨
      (u.val = 6+3*j ∧ v.val = 7+3*j)) : (gkGraph k).Adj u v :=
  gkGraph_adj_of_val k u v (Or.inr (Or.inr (Or.inr (Or.inr ⟨j, hj, h⟩))))

end E993Transport
-- VERITYOS ENTRY 94 END

-- VERITYOS ENTRY 95 BEGIN lemma E993Transport.gk_not_adj_of_indep 37724bddd1a4509225c66f6308beca9b0ca5f93c803f87612c26989ef5651b1c
namespace E993Transport

/-- two members of an independent set of `G_k` are not adjacent. -/
lemma gk_not_adj_of_indep (k : ℕ) (B : Finset (Fin (3*k+5)))
    (hI : (gkGraph k).IsIndepSet (B : Set (Fin (3*k+5)))) (u v : Fin (3*k+5))
    (hu : u ∈ B) (hv : v ∈ B) : ¬ (gkGraph k).Adj u v := by
  intro hadj
  exact hI (Finset.mem_coe.mpr hu) (Finset.mem_coe.mpr hv) hadj.ne hadj

end E993Transport
-- VERITYOS ENTRY 95 END

-- VERITYOS ENTRY 96 BEGIN lemma E993Transport.gk_leaf_cases 72da9cbb2291ef5b0584e927f6388ad0066954a590722bd0f79970a89553373a
namespace E993Transport

/-- (N2) the leaves of `G_k` are `1`, `3`, `4` and the arm tips `c_i = 7+3i`. -/
lemma gk_leaf_cases (k : ℕ) (τ : Fin (3*k+5)) (hτ : τ ∈ C5LA1.leafSet (gkGraph k)) :
    τ.val = 1 ∨ τ.val = 3 ∨ τ.val = 4 ∨ ∃ i < k, τ.val = 7 + 3*i := by
  have hleaf : C4LA1.IsGraphLeaf (gkGraph k) τ := by
    simpa [C5LA1.leafSet] using hτ
  obtain ⟨s, -, huniq⟩ := hleaf
  have two : ∀ u w, (gkGraph k).Adj τ u → (gkGraph k).Adj τ w → u.val = w.val := by
    intro u w hu hw
    rw [huniq u hu, huniq w hw]
  have hlt := τ.isLt
  by_cases h0 : τ.val = 0
  · have := two (gkVertex k 1) (gkVertex k 2)
      (gkGraph_adj_of_val_root k _ _ (by rw [gkVertex_val k 1 (by omega)]; omega))
      (gkGraph_adj_of_val_root k _ _ (by rw [gkVertex_val k 2 (by omega)]; omega))
    rw [gkVertex_val k 1 (by omega), gkVertex_val k 2 (by omega)] at this
    omega
  by_cases h2 : τ.val = 2
  · have := two (gkVertex k 0) (gkVertex k 3)
      ((gkGraph_adj_of_val_root k _ _ (by rw [gkVertex_val k 0 (by omega)]; omega)).symm)
      (gkGraph_adj_of_val_root k _ _ (by rw [gkVertex_val k 3 (by omega)]; omega))
    rw [gkVertex_val k 0 (by omega), gkVertex_val k 3 (by omega)] at this
    omega
  by_cases hsmall : τ.val < 5
  · omega
  have hj : (τ.val - 5) / 3 < k := by omega
  set j := (τ.val - 5) / 3 with hjdef
  by_cases hr0 : τ.val = 5 + 3*j
  · have := two (gkVertex k 0) (gkVertex k (6+3*j))
      ((gkGraph_adj_of_val_arm k _ _ j hj (by rw [gkVertex_val k 0 (by omega)]; omega)).symm)
      (gkGraph_adj_of_val_arm k _ _ j hj (by rw [gkVertex_val k (6+3*j) (by omega)]; omega))
    rw [gkVertex_val k 0 (by omega), gkVertex_val k (6+3*j) (by omega)] at this
    omega
  by_cases hr1 : τ.val = 6 + 3*j
  · have := two (gkVertex k (5+3*j)) (gkVertex k (7+3*j))
      ((gkGraph_adj_of_val_arm k _ _ j hj
        (by rw [gkVertex_val k (5+3*j) (by omega)]; omega)).symm)
      (gkGraph_adj_of_val_arm k _ _ j hj (by rw [gkVertex_val k (7+3*j) (by omega)]; omega))
    rw [gkVertex_val k (5+3*j) (by omega), gkVertex_val k (7+3*j) (by omega)] at this
    omega
  exact Or.inr (Or.inr (Or.inr ⟨j, hj, by omega⟩))

end E993Transport
-- VERITYOS ENTRY 96 END

-- VERITYOS ENTRY 97 BEGIN lemma E993Transport.not_disjoint_erase_tagWitnesses_iff b9615873cbc7f2cb26925b23e05e2edf8a4b6bd689c87fcce107ebbcc2fd3b8f
namespace E993Transport

/-- the active-tag condition at a leaf `v` with neighbour `s`: `B` contains another neighbour
of `s` (any graph; `s` is the support of `v` by uniqueness). -/
lemma not_disjoint_erase_tagWitnesses_iff {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v s : V) (hv : C4LA1.IsGraphLeaf G v)
    (hs : G.Adj v s) (B : Finset V) :
    ¬ Disjoint (B.erase v) (tagWitnesses G v) ↔ ∃ w ∈ B, w ≠ v ∧ G.Adj s w := by
  have hsup : C5LA1.support G v = s := (E993Interior.Leaf.support_unique G v hv hs).symm
  rw [Finset.not_disjoint_iff]
  simp only [tagWitnesses, hsup, Finset.mem_erase, SimpleGraph.mem_neighborFinset]
  constructor
  · rintro ⟨w, ⟨hwv, hwB⟩, -, hadj⟩
    exact ⟨w, hwB, hwv, hadj⟩
  · rintro ⟨w, hwB, hwv, hadj⟩
    exact ⟨w, ⟨hwv, hwB⟩, hwv, hadj⟩

end E993Transport
-- VERITYOS ENTRY 97 END

-- VERITYOS ENTRY 98 BEGIN lemma E993Transport.gk_active_arm_iff e2eff73c6bd3e322ba69fd3c0f1da5828533bae1dcf55369cac8f0f9fe4b7338
namespace E993Transport

/-- (N2) activity of the tag `c_i` (label `7+3i`): `B` contains `a_i` (label `5+3i`). -/
lemma gk_active_arm_iff (k i : ℕ) (hi : i < k) (τ : Fin (3*k+5)) (hτ : τ.val = 7 + 3*i)
    (hleaf : C4LA1.IsGraphLeaf (gkGraph k) τ) (B : Finset (Fin (3*k+5))) :
    ¬ Disjoint (B.erase τ) (tagWitnesses (gkGraph k) τ) ↔ gkVertex k (5+3*i) ∈ B := by
  have hs : (gkGraph k).Adj τ (gkVertex k (6+3*i)) :=
    (gkGraph_adj_of_val_arm k _ _ i hi (by rw [gkVertex_val k (6+3*i) (by omega)]; omega)).symm
  rw [not_disjoint_erase_tagWitnesses_iff _ τ _ hleaf hs]
  have hb := gkVertex_val k (6+3*i) (by omega)
  constructor
  · rintro ⟨w, hwB, hwτ, hadj⟩
    rw [gkGraph_adj_iff_val, hb] at hadj
    have hwτ' : w.val ≠ τ.val := fun h => hwτ (Fin.ext h)
    have : w.val = 5 + 3*i := by
      rcases hadj with (h | h | h | h | ⟨i', -, h | h | h⟩) |
        (h | h | h | h | ⟨i', -, h | h | h⟩) <;> omega
    rwa [← (eq_gkVertex_iff k (5+3*i) (by omega) w).mpr this]
  · intro ha
    refine ⟨gkVertex k (5+3*i), ha, ?_, ?_⟩
    · intro h
      have := congrArg Fin.val h
      rw [gkVertex_val k (5+3*i) (by omega)] at this
      omega
    · exact (gkGraph_adj_of_val_arm k _ _ i hi
        (by rw [gkVertex_val k (5+3*i) (by omega), hb]; omega)).symm

end E993Transport
-- VERITYOS ENTRY 98 END

-- VERITYOS ENTRY 99 BEGIN lemma E993Transport.gk_active_cherry_iff 2320778f83f746d088e3adbd4e2bfe5b04e793dfa52b29a7e200f477646d88cd
namespace E993Transport

/-- (N2) activity of the tag `3` (resp. `4`) on a set avoiding the root: `B` contains the other
leaf `4` (resp. `3`) of the support `2`. -/
lemma gk_active_cherry_iff (k : ℕ) (τ : Fin (3*k+5)) (hτ : τ.val = 3 ∨ τ.val = 4)
    (hleaf : C4LA1.IsGraphLeaf (gkGraph k) τ) (B : Finset (Fin (3*k+5)))
    (h0 : gkVertex k 0 ∉ B) :
    ¬ Disjoint (B.erase τ) (tagWitnesses (gkGraph k) τ) ↔
      gkVertex k (7 - τ.val) ∈ B := by
  have hs : (gkGraph k).Adj τ (gkVertex k 2) :=
    (gkGraph_adj_of_val_root k _ _ (by rw [gkVertex_val k 2 (by omega)]; omega)).symm
  rw [not_disjoint_erase_tagWitnesses_iff _ τ _ hleaf hs]
  have h2 := gkVertex_val k 2 (by omega)
  constructor
  · rintro ⟨w, hwB, hwτ, hadj⟩
    rw [gkGraph_adj_iff_val, h2] at hadj
    have hwτ' : w.val ≠ τ.val := fun h => hwτ (Fin.ext h)
    have hw0 : w.val ≠ 0 := by
      intro h
      exact h0 ((eq_gkVertex_iff k 0 (by omega) w).mpr h ▸ hwB)
    have : w.val = 7 - τ.val := by
      rcases hadj with (h | h | h | h | ⟨i', -, h | h | h⟩) |
        (h | h | h | h | ⟨i', -, h | h | h⟩) <;> omega
    rwa [← (eq_gkVertex_iff k (7 - τ.val) (by omega) w).mpr this]
  · intro hw
    refine ⟨gkVertex k (7 - τ.val), hw, ?_, ?_⟩
    · intro h
      have := congrArg Fin.val h
      rw [gkVertex_val k (7 - τ.val) (by omega)] at this
      omega
    · exact gkGraph_adj_of_val_root k _ _
        (by rw [gkVertex_val k (7 - τ.val) (by omega), h2]; omega)

end E993Transport
-- VERITYOS ENTRY 99 END

-- VERITYOS ENTRY 100 BEGIN lemma E993Transport.gk_active_one_iff 7cf8993c8bf8d0b368667395cec075e6cc2cf44cb4c63bfcd76fa5a619c6d8dc
namespace E993Transport

/-- (N2) activity of the tag `1`: `B` contains `2` or some arm root `a_j` (label `5+3j`). -/
lemma gk_active_one_iff (k : ℕ) (τ : Fin (3*k+5)) (hτ : τ.val = 1)
    (hleaf : C4LA1.IsGraphLeaf (gkGraph k) τ) (B : Finset (Fin (3*k+5))) :
    ¬ Disjoint (B.erase τ) (tagWitnesses (gkGraph k) τ) ↔
      ∃ w ∈ B, w.val = 2 ∨ ∃ j < k, w.val = 5 + 3*j := by
  have hs : (gkGraph k).Adj τ (gkVertex k 0) :=
    (gkGraph_adj_of_val_root k _ _ (by rw [gkVertex_val k 0 (by omega)]; omega)).symm
  rw [not_disjoint_erase_tagWitnesses_iff _ τ _ hleaf hs]
  have h0 := gkVertex_val k 0 (by omega)
  constructor
  · rintro ⟨w, hwB, hwτ, hadj⟩
    rw [gkGraph_adj_iff_val, h0] at hadj
    have hwτ' : w.val ≠ τ.val := fun h => hwτ (Fin.ext h)
    refine ⟨w, hwB, ?_⟩
    rcases hadj with (h | h | h | h | ⟨i', hi', h | h | h⟩) |
        (h | h | h | h | ⟨i', hi', h | h | h⟩)
    all_goals first
      | omega
      | exact Or.inl (by omega)
      | exact Or.inr ⟨i', hi', by omega⟩
  · rintro ⟨w, hwB, hw⟩
    refine ⟨w, hwB, ?_, ?_⟩
    · intro h
      rw [h] at hw
      rcases hw with hw | ⟨j, -, hw⟩ <;> omega
    · rcases hw with hw | ⟨j, hj, hw⟩
      · exact gkGraph_adj_of_val_root k _ _ (by omega)
      · exact gkGraph_adj_of_val_arm k _ _ j hj (by omega)

end E993Transport
-- VERITYOS ENTRY 100 END

-- VERITYOS ENTRY 101 BEGIN lemma E993Transport.gk_root_notMem 215054b7010313ab3a98f662faa41c2dfc85fa0f92aa185274bb9ee7adfe9b5a
namespace E993Transport

-- r30 C4-LA1 node N3: step (0) of Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5), at every rank `p ≥ k + 3` per
-- R2′ (r30 Cycle 4 F adjudicator, Claude Opus 5.5).
/-- (N3) root exclusion: an independent set of `G_k` of size `≥ k + 4` avoids the root `0`. -/
lemma gk_root_notMem (k p : ℕ) (hp : k + 3 ≤ p) (B : Finset (Fin (3*k+5)))
    (hB : B ∈ indepFamily (gkGraph k) (p + 1)) : gkVertex k 0 ∉ B := by
  intro h0B
  rw [mem_indepFamily_iff] at hB
  obtain ⟨hcard, hI⟩ := hB
  have v0 := gkVertex_val k 0 (by omega)
  -- neighbours of the root are absent
  have hn : ∀ w ∈ B, w.val = 1 ∨ w.val = 2 ∨ (∃ j < k, w.val = 5 + 3*j) → False := by
    intro w hw hval
    apply gk_not_adj_of_indep k B hI _ _ h0B hw
    rcases hval with h | h | ⟨j, hj, h⟩
    · exact gkGraph_adj_of_val_root k _ _ (by omega)
    · exact gkGraph_adj_of_val_root k _ _ (by omega)
    · exact gkGraph_adj_of_val_arm k _ _ j hj (by omega)
  have hsize := chainSize_gkTagFactors k (gkVertex k 0) B
  rw [Finset.card_erase_of_mem h0B, hcard] at hsize
  -- bound the block sizes
  have hleaf : (B ∩ (gkLeafBlock k (gkVertex k 0)).verts).card = 0 := by
    rw [Finset.card_eq_zero, Finset.eq_empty_iff_forall_notMem]
    intro w hw
    rw [Finset.mem_inter, mem_gkLeafBlock_verts_iff] at hw
    exact hn w hw.1 (Or.inl hw.2)
  have hcherry : (B ∩ (gkCherryBlock k (gkVertex k 0)).verts).card ≤ 2 := by
    have hsub : B ∩ (gkCherryBlock k (gkVertex k 0)).verts ⊆ {gkVertex k 3, gkVertex k 4} := by
      intro w hw
      rw [Finset.mem_inter, mem_gkCherryBlock_verts_iff] at hw
      simp only [Finset.mem_insert, Finset.mem_singleton]
      rw [eq_gkVertex_iff k 3 (by omega), eq_gkVertex_iff k 4 (by omega)]
      rcases hw.2 with h | h | h
      · exact Or.inl h
      · exact (hn w hw.1 (Or.inr (Or.inl h))).elim
      · exact Or.inr h
    exact (Finset.card_le_card hsub).trans Finset.card_le_two
  have harms : chainSize ((List.range k).map (gkArmBlock k (gkArmIndex k (gkVertex k 0)))) B
      ≤ ((List.range k).map (gkArmBlock k (gkArmIndex k (gkVertex k 0)))).length := by
    apply chainSize_le_length
    intro c hc
    rw [List.mem_map] at hc
    obtain ⟨j, hj, rfl⟩ := hc
    rw [List.mem_range] at hj
    have hsub : B ∩ (gkArmBlock k (gkArmIndex k (gkVertex k 0)) j).verts ⊆ {gkVertex k (6+3*j), gkVertex k (7+3*j)} := by
      intro w hw
      rw [Finset.mem_inter, mem_gkArmBlock_verts_iff k _ j hj] at hw
      simp only [Finset.mem_insert, Finset.mem_singleton]
      rw [eq_gkVertex_iff k _ (by omega), eq_gkVertex_iff k _ (by omega)]
      rcases hw.2 with h | h | h
      · exact (hn w hw.1 (Or.inr (Or.inr ⟨j, hj, h⟩))).elim
      · exact Or.inl h
      · exact Or.inr h
    by_cases hb : gkVertex k (6+3*j) ∈ B
    · have hc : gkVertex k (7+3*j) ∉ B := fun hc =>
        gk_not_adj_of_indep k B hI _ _ hb hc
          (gkGraph_adj_of_val_arm k _ _ j hj (by
            rw [gkVertex_val k (6+3*j) (by omega), gkVertex_val k (7+3*j) (by omega)]; omega))
      have hsub' : B ∩ (gkArmBlock k (gkArmIndex k (gkVertex k 0)) j).verts ⊆ {gkVertex k (6+3*j)} := by
        intro w hw
        have := hsub hw
        simp only [Finset.mem_insert, Finset.mem_singleton] at this ⊢
        rcases this with h | h
        · exact h
        · exact (hc (h ▸ (Finset.mem_inter.mp hw).1)).elim
      exact (Finset.card_le_card hsub').trans (by simp)
    · have hsub' : B ∩ (gkArmBlock k (gkArmIndex k (gkVertex k 0)) j).verts ⊆ {gkVertex k (7+3*j)} := by
        intro w hw
        have := hsub hw
        simp only [Finset.mem_insert, Finset.mem_singleton] at this ⊢
        rcases this with h | h
        · exact (hb (h ▸ (Finset.mem_inter.mp hw).1)).elim
        · exact h
      exact (Finset.card_le_card hsub').trans (by simp)
  simp only [gkTagFactors, chainSize, List.length_map, List.length_range] at hsize harms
  omega

end E993Transport
-- VERITYOS ENTRY 101 END

-- VERITYOS ENTRY 102 BEGIN lemma E993Transport.inter_triple_eq_pair 0a4dcca46a1fee4fffd3cbce9cbfa9514c046855926aca463f83d42ad779a424
namespace E993Transport

lemma inter_triple_eq_pair {V : Type*} [DecidableEq V] (B : Finset V) (x y z : V)
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
-- VERITYOS ENTRY 102 END

-- VERITYOS ENTRY 103 BEGIN lemma E993Transport.gk_path_valid ceb65cc46d975d11fb18758dc91bd06a4fd1b11fdd8dfdeef6ab40c85ec44c64
namespace E993Transport

/-- a path block `x – y – z` of `G_k` is valid on an independent set. -/
lemma gk_path_valid (k : ℕ) (B : Finset (Fin (3*k+5)))
    (hI : (gkGraph k).IsIndepSet (B : Set (Fin (3*k+5)))) (x y z : Fin (3*k+5))
    (hxy : x ≠ y) (hyz : y ≠ z) (hxz : x ≠ z)
    (h1 : (gkGraph k).Adj x y) (h2 : (gkGraph k).Adj y z) :
    (ChainFactor.path x y z).Valid B :=
  ⟨hxy, hyz, hxz, fun h => gk_not_adj_of_indep k B hI x y h.1 h.2 h1,
    fun h => gk_not_adj_of_indep k B hI y z h.1 h.2 h2⟩

end E993Transport
-- VERITYOS ENTRY 103 END

-- VERITYOS ENTRY 104 BEGIN lemma E993Transport.chainValid_gkTagFactors 7383beaa0a8a0154cce87a937b0f2a627b1f53940707b34cc2d7ffa859d3b885
namespace E993Transport

-- r30 C4-LA1 node N4: the tag slices of step (2) of Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5).
/-- (N4) the tag slice: on a τ-active independent set avoiding the root, every block of
`gkTagFactors k τ` is valid (the tag's own block is exactly its frozen value). -/
lemma chainValid_gkTagFactors (k : ℕ) (τ : Fin (3*k+5))
    (hτ : τ ∈ C5LA1.leafSet (gkGraph k)) (B : Finset (Fin (3*k+5)))
    (hI : (gkGraph k).IsIndepSet (B : Set (Fin (3*k+5)))) (h0 : gkVertex k 0 ∉ B)
    (hτB : τ ∈ B) (hact : ¬ Disjoint (B.erase τ) (tagWitnesses (gkGraph k) τ)) :
    ChainValid (gkTagFactors k τ) B := by
  have hleaf : C4LA1.IsGraphLeaf (gkGraph k) τ := by
    simpa [C5LA1.leafSet] using hτ
  have hcases := gk_leaf_cases k τ hτ
  have hlt := τ.isLt
  intro c hc
  simp only [gkTagFactors, List.mem_cons, List.mem_map, List.mem_range] at hc
  rcases hc with rfl | rfl | ⟨j, hj, rfl⟩
  · -- the leaf block `{1}`
    unfold gkLeafBlock
    split_ifs with h1
    · have hτv : τ = gkVertex k 1 := (eq_gkVertex_iff k 1 (by omega) τ).mpr h1
      show B ∩ {gkVertex k 1} = {gkVertex k 1}
      rw [← hτv]
      exact Finset.inter_singleton_of_mem hτB
    · trivial
  · -- the cherry block `3 – 2 – 4`
    unfold gkCherryBlock
    split_ifs with h34
    · show B ∩ {gkVertex k 3, gkVertex k 2, gkVertex k 4} = {gkVertex k 3, gkVertex k 4}
      have hother := (gk_active_cherry_iff k τ h34 hleaf B h0).mp hact
      have hτ2 : (gkGraph k).Adj τ (gkVertex k 2) :=
        (gkGraph_adj_of_val_root k _ _ (by rw [gkVertex_val k 2 (by omega)]; omega)).symm
      have h2 : gkVertex k 2 ∉ B := fun h2 => gk_not_adj_of_indep k B hI _ _ hτB h2 hτ2
      rcases h34 with h3 | h4
      · have hτv : τ = gkVertex k 3 := (eq_gkVertex_iff k 3 (by omega) τ).mpr h3
        rw [h3] at hother
        exact inter_triple_eq_pair B _ _ _ (hτv ▸ hτB) h2 hother
      · have hτv : τ = gkVertex k 4 := (eq_gkVertex_iff k 4 (by omega) τ).mpr h4
        rw [h4] at hother
        exact inter_triple_eq_pair B _ _ _ hother h2 (hτv ▸ hτB)
    · exact gk_path_valid k B hI _ _ _
        (gkVertex_ne k 3 2 (by omega) (by omega) (by omega))
        (gkVertex_ne k 2 4 (by omega) (by omega) (by omega))
        (gkVertex_ne k 3 4 (by omega) (by omega) (by omega))
        ((gkGraph_adj_of_val_root k _ _ (by
          rw [gkVertex_val k 2 (by omega), gkVertex_val k 3 (by omega)]; omega)).symm)
        (gkGraph_adj_of_val_root k _ _ (by
          rw [gkVertex_val k 2 (by omega), gkVertex_val k 4 (by omega)]; omega))
  · -- an arm block `a_j – b_j – c_j`
    unfold gkArmBlock
    split_ifs with hji
    · show B ∩ {gkVertex k (5+3*j), gkVertex k (6+3*j), gkVertex k (7+3*j)} =
        {gkVertex k (5+3*j), gkVertex k (7+3*j)}
      have hτc : τ.val = 7 + 3*j := by
        unfold gkArmIndex at hji
        split_ifs at hji <;> omega
      have ha := (gk_active_arm_iff k j hj τ hτc hleaf B).mp hact
      have hτv : τ = gkVertex k (7+3*j) := (eq_gkVertex_iff k _ (by omega) τ).mpr hτc
      have hb : gkVertex k (6+3*j) ∉ B := fun hb =>
        gk_not_adj_of_indep k B hI _ _ ha hb (gkGraph_adj_of_val_arm k _ _ j hj (by
          rw [gkVertex_val k (5+3*j) (by omega), gkVertex_val k (6+3*j) (by omega)]; omega))
      exact inter_triple_eq_pair B _ _ _ ha hb (hτv ▸ hτB)
    · exact gk_path_valid k B hI _ _ _
        (gkVertex_ne k _ _ (by omega) (by omega) (by omega))
        (gkVertex_ne k _ _ (by omega) (by omega) (by omega))
        (gkVertex_ne k _ _ (by omega) (by omega) (by omega))
        (gkGraph_adj_of_val_arm k _ _ j hj (by
          rw [gkVertex_val k (5+3*j) (by omega), gkVertex_val k (6+3*j) (by omega)]; omega))
        (gkGraph_adj_of_val_arm k _ _ j hj (by
          rw [gkVertex_val k (6+3*j) (by omega), gkVertex_val k (7+3*j) (by omega)]; omega))

end E993Transport
-- VERITYOS ENTRY 104 END

-- VERITYOS ENTRY 105 BEGIN lemma E993Transport.exists_chainDownVertex_gkTagFactors 9c2167d698a2dddc8bf43bb85dc5cc117e9c2051618db92838887743fea3af58
namespace E993Transport

-- r30 C4-LA1 node N5: levels strictly above the centre (step (4) of Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5));
-- every rank `p ≥ k + 3` per R2′ (r30 Cycle 4 F adjudicator, Claude Opus 5.5).
/-- (N5, level condition) every τ-active source of rank `p + 1 ≥ k + 4` lies strictly above the
centre of its slice, so it has a chain predecessor. -/
lemma exists_chainDownVertex_gkTagFactors (k p : ℕ) (hp : k + 3 ≤ p) (τ : Fin (3*k+5))
    (hτ : τ ∈ C5LA1.leafSet (gkGraph k)) (B : Finset (Fin (3*k+5)))
    (hB : B ∈ indepFamily (gkGraph k) (p + 1)) (hτB : τ ∈ B)
    (hact : ¬ Disjoint (B.erase τ) (tagWitnesses (gkGraph k) τ)) :
    ∃ q, chainDownVertex (gkTagFactors k τ) B = some q := by
  have h0 := gk_root_notMem k p hp B hB
  obtain ⟨hcard, hI⟩ := (mem_indepFamily_iff _ _ _).mp hB
  have hval := chainValid_gkTagFactors k τ hτ B hI h0 hτB hact
  have hsize := chainSize_gkTagFactors k τ B
  rw [Finset.erase_eq_of_notMem h0, hcard] at hsize
  have hrank := chainRank_gkTagFactors_le k τ
  have hid := two_mul_chainSize_add_up_eq (gkTagFactors k τ) B hval
  exact exists_chainDownVertex_of_down_pos _ B hval (by omega)

end E993Transport
-- VERITYOS ENTRY 105 END

-- VERITYOS ENTRY 106 BEGIN lemma E993Transport.gk_one_blocks_top_of_avoid aa88fc49334c361e172d528af671701a984845b2ed426514b416dc8e31a1be05
namespace E993Transport

-- r30 C4-LA1 node N5: the box-top argument for the tag `1` (step (4) of Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5);
-- image levels `≥ k + 3` per R2′ (r30 Cycle 4 F adjudicator, Claude Opus 5.5)).
/-- (N5, box-top property for the tag `1`) a valid set of size `p ≥ k + 3` avoiding the root,
`2` and every arm root `a_j` has every block of the tag-`1` slice at the top of its chain. -/
lemma gk_one_blocks_top_of_avoid (k p : ℕ) (hp : k + 3 ≤ p) (τ : Fin (3*k+5)) (hτ1 : τ.val = 1)
    (B' : Finset (Fin (3*k+5))) (hval' : ChainValid (gkTagFactors k τ) B')
    (h0' : gkVertex k 0 ∉ B') (hcard : B'.card = p)
    (hno : ∀ w ∈ B', w.val ≠ 2 ∧ ∀ j < k, w.val ≠ 5 + 3*j) :
    ∀ c ∈ gkTagFactors k τ, (c.code B').1 = (c.code B').2 := by
  have hsize := chainSize_gkTagFactors k τ B'
  rw [Finset.erase_eq_of_notMem h0', hcard] at hsize
  have hlt := τ.isLt
  have hidx : gkArmIndex k τ = k := by
    unfold gkArmIndex
    split_ifs <;> omega
  have hleafc : (B' ∩ (gkLeafBlock k τ).verts).card ≤ 1 := by
    rw [gkLeafBlock_verts]
    exact (Finset.card_le_card Finset.inter_subset_right).trans (by simp)
  have h2 : gkVertex k 2 ∉ B' := fun h => (hno _ h).1 (gkVertex_val k 2 (by omega))
  have hcherry_eq : gkCherryBlock k τ =
      .path (gkVertex k 3) (gkVertex k 2) (gkVertex k 4) := by
    unfold gkCherryBlock
    rw [if_neg (by omega)]
  have hcherryc : (B' ∩ (gkCherryBlock k τ).verts).card =
      (if gkVertex k 3 ∈ B' then 1 else 0) + (if gkVertex k 4 ∈ B' then 1 else 0) := by
    rw [hcherry_eq]
    simp only [ChainFactor.verts]
    rw [ChainFactor.card_inter_path_eq _ _ _ B'
      (gkVertex_ne k 3 2 (by omega) (by omega) (by omega))
      (gkVertex_ne k 2 4 (by omega) (by omega) (by omega))
      (gkVertex_ne k 3 4 (by omega) (by omega) (by omega)), if_neg h2]
    omega
  have harm : ∀ c ∈ (List.range k).map (gkArmBlock k (gkArmIndex k τ)),
      (B' ∩ c.verts).card ≤ 1 ∧ ((B' ∩ c.verts).card = 1 → (c.code B').1 = (c.code B').2) := by
    intro c hc
    rw [List.mem_map] at hc
    obtain ⟨j, hj, rfl⟩ := hc
    rw [List.mem_range] at hj
    have hpath : gkArmBlock k (gkArmIndex k τ) j =
        .path (gkVertex k (5+3*j)) (gkVertex k (6+3*j)) (gkVertex k (7+3*j)) := by
      unfold gkArmBlock
      rw [if_neg (by omega)]
    have hvalid := hval' _ (by
      simp only [gkTagFactors, List.mem_cons, List.mem_map, List.mem_range]
      exact Or.inr (Or.inr ⟨j, hj, rfl⟩))
    rw [hpath] at hvalid ⊢
    obtain ⟨hxy, hyz, hxz, -, hbc⟩ := hvalid
    have ha : gkVertex k (5+3*j) ∉ B' := fun h =>
      (hno _ h).2 j hj (gkVertex_val k (5+3*j) (by omega))
    simp only [ChainFactor.verts, ChainFactor.code]
    rw [ChainFactor.card_inter_path_eq _ _ _ B' hxy hyz hxz, if_neg ha, if_neg ha]
    by_cases hb : gkVertex k (6+3*j) ∈ B'
    · have hc : gkVertex k (7+3*j) ∉ B' := fun hc => hbc ⟨hb, hc⟩
      simp only [if_pos hb, if_neg hc]
      exact ⟨by omega, fun _ => trivial⟩
    · by_cases hc : gkVertex k (7+3*j) ∈ B'
      · simp only [if_neg hb, if_pos hc]
        exact ⟨by omega, fun _ => trivial⟩
      · simp only [if_neg hb, if_neg hc]
        exact ⟨by omega, fun h => by omega⟩
  have harms_le := chainSize_le_length _ B' (fun c hc => (harm c hc).1)
  simp only [List.length_map, List.length_range] at harms_le
  simp only [gkTagFactors, chainSize] at hsize
  have h3 : gkVertex k 3 ∈ B' := by
    by_contra h3
    rw [if_neg h3] at hcherryc
    split_ifs at hcherryc <;> omega
  have h4 : gkVertex k 4 ∈ B' := by
    by_contra h4
    rw [if_neg h4, if_pos h3] at hcherryc
    omega
  rw [if_pos h3, if_pos h4] at hcherryc
  intro c hc
  simp only [gkTagFactors, List.mem_cons] at hc
  rcases hc with rfl | rfl | hc
  · unfold gkLeafBlock
    rw [if_pos hτ1]
    rfl
  · rw [hcherry_eq]
    simp [ChainFactor.code, h2, h3, h4]
  · exact top_of_length_le_chainSize _ B' harm (by
      simp only [List.length_map, List.length_range]
      omega) c hc

end E993Transport
-- VERITYOS ENTRY 106 END

-- VERITYOS ENTRY 107 BEGIN lemma E993Transport.gk_one_active_after_down 5101d8b3e510e6f2242c99a5aa84e706317bd85b8ca00ded52a2fa6c51b09b74
namespace E993Transport

-- r30 C4-LA1 node N5: the tag `1` stays active (Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5); R2′ (r30 Cycle 4 F adjudicator, Claude Opus 5.5)).
/-- (N5, box-top property for the tag `1`) after the chain step the tag `1` still sees `2` or
some `a_j`: a `W_1`-avoiding image would have every block at the top of its chain, hence no
steps up, while a chain predecessor always has at least one. -/
lemma gk_one_active_after_down (k p : ℕ) (hp : k + 3 ≤ p) (τ : Fin (3*k+5)) (hτ1 : τ.val = 1)
    (B : Finset (Fin (3*k+5))) (hB : B ∈ indepFamily (gkGraph k) (p + 1))
    (h0 : gkVertex k 0 ∉ B) (hval : ChainValid (gkTagFactors k τ) B) (q : Fin (3*k+5))
    (hq : chainDownVertex (gkTagFactors k τ) B = some q) :
    ∃ w ∈ B.erase q, w.val = 2 ∨ ∃ j < k, w.val = 5 + 3*j := by
  by_contra hno
  have hno' : ∀ w ∈ B.erase q, w.val ≠ 2 ∧ ∀ j < k, w.val ≠ 5 + 3*j := by
    intro w hw
    refine ⟨fun h => hno ⟨w, hw, Or.inl h⟩, fun j hj h => hno ⟨w, hw, Or.inr ⟨j, hj, h⟩⟩⟩
  obtain ⟨hval', hdu, -⟩ :=
    chainDownUp_erase_chainDownVertex _ B (chainDisjoint_gkTagFactors k τ) hval q hq
  have hqB : q ∈ B := (mem_and_exists_drop_of_chainDownVertex _ B hval q hq).1
  have h0' : gkVertex k 0 ∉ B.erase q := fun h => h0 (Finset.mem_of_mem_erase h)
  have hcard : (B.erase q).card = p := by
    rw [Finset.card_erase_of_mem hqB, ((mem_indepFamily_iff _ _ _).mp hB).1]
    rfl
  have htop := gk_one_blocks_top_of_avoid k p hp τ hτ1 (B.erase q) hval' h0' hcard hno'
  have hzero := chainDownUp_snd_eq_zero_of_top _ (B.erase q) htop
  rw [hdu] at hzero
  simp at hzero

end E993Transport
-- VERITYOS ENTRY 107 END

-- VERITYOS ENTRY 108 BEGIN lemma E993Transport.gkTagDown_erase_keeps_tag_active 79a323839ae88a5e5d6b48ab729d1bd427ca5f9947442ea5796223caaa0c3d5c
namespace E993Transport

-- r30 C4-LA1 nodes N4/N5: the per-tag down-map of Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5) with R2′ (r30 Cycle 4 F adjudicator, Claude Opus 5.5).
/-- (N4/N5) the per-tag down-map: on a τ-active source it deletes one vertex `q ∈ B`, keeps `τ`
and keeps `τ` active. -/
lemma gkTagDown_erase_keeps_tag_active (k p : ℕ) (hp : k + 3 ≤ p) (τ : Fin (3*k+5))
    (hτ : τ ∈ C5LA1.leafSet (gkGraph k)) (B : Finset (Fin (3*k+5)))
    (hB : B ∈ indepFamily (gkGraph k) (p + 1)) (hτB : τ ∈ B)
    (hact : ¬ Disjoint (B.erase τ) (tagWitnesses (gkGraph k) τ)) :
    ∃ q, chainDownVertex (gkTagFactors k τ) B = some q ∧ gkTagDown k τ B = B.erase q ∧
      q ∈ B ∧ τ ∈ B.erase q ∧ ¬ Disjoint ((B.erase q).erase τ) (tagWitnesses (gkGraph k) τ) := by
  have hleaf : C4LA1.IsGraphLeaf (gkGraph k) τ := by
    simpa [C5LA1.leafSet] using hτ
  have h0 := gk_root_notMem k p hp B hB
  obtain ⟨-, hI⟩ := (mem_indepFamily_iff _ _ _).mp hB
  have hval := chainValid_gkTagFactors k τ hτ B hI h0 hτB hact
  have hd := chainDisjoint_gkTagFactors k τ
  obtain ⟨q, hq⟩ := exists_chainDownVertex_gkTagFactors k p hp τ hτ B hB hτB hact
  have hqB : q ∈ B := (mem_and_exists_drop_of_chainDownVertex _ B hval q hq).1
  have hdown : gkTagDown k τ B = B.erase q := by
    unfold gkTagDown
    rw [hq]
  have h0' : gkVertex k 0 ∉ B.erase q := fun h => h0 (Finset.mem_of_mem_erase h)
  have hlt := τ.isLt
  have hnot := notMem_verts_of_chainDownVertex _ B hd hval q hq
  refine ⟨q, hq, hdown, hqB, ?_⟩
  have cherry_case : τ.val = 3 ∨ τ.val = 4 →
      τ ∈ B.erase q ∧ ¬ Disjoint ((B.erase q).erase τ) (tagWitnesses (gkGraph k) τ) := by
    intro h34
    have hq2 : q ∉ (gkCherryBlock k τ).verts :=
      hnot _ (by simp [gkTagFactors]) (by unfold gkCherryBlock; rw [if_pos h34]; rfl)
    rw [mem_gkCherryBlock_verts_iff] at hq2
    have hqτ : q ≠ τ := fun h => hq2 (by rw [h]; omega)
    refine ⟨Finset.mem_erase.mpr ⟨Ne.symm hqτ, hτB⟩, ?_⟩
    rw [gk_active_cherry_iff k τ h34 hleaf _ h0']
    have hother := (gk_active_cherry_iff k τ h34 hleaf B h0).mp hact
    refine Finset.mem_erase.mpr ⟨?_, hother⟩
    intro h
    apply hq2
    rw [← h, gkVertex_val k _ (by omega)]
    omega
  rcases gk_leaf_cases k τ hτ with h1 | h3 | h4 | ⟨i, hi, hc⟩
  · -- the tag `1`: its block `{1}` is frozen
    have hq1 : q ∉ (gkLeafBlock k τ).verts :=
      hnot _ (by simp [gkTagFactors]) (by unfold gkLeafBlock; rw [if_pos h1]; rfl)
    have hqτ : q ≠ τ := fun h => hq1 ((mem_gkLeafBlock_verts_iff k τ q).mpr (h ▸ h1))
    refine ⟨Finset.mem_erase.mpr ⟨Ne.symm hqτ, hτB⟩, ?_⟩
    rw [gk_active_one_iff k τ h1 hleaf]
    exact gk_one_active_after_down k p hp τ h1 B hB h0 hval q hq
  · -- the tag `3`: the cherry block is frozen at `{3, 4}`
    exact cherry_case (Or.inl h3)
  · -- the tag `4`
    exact cherry_case (Or.inr h4)
  · -- the tag `c_i`: the arm block `i` is frozen at `{a_i, c_i}`
    have hidx : gkArmIndex k τ = i := by
      unfold gkArmIndex
      rw [if_pos (by omega)]
      omega
    have hq3 : q ∉ (gkArmBlock k (gkArmIndex k τ) i).verts :=
      hnot _ (by
        simp only [gkTagFactors, List.mem_cons, List.mem_map, List.mem_range]
        exact Or.inr (Or.inr ⟨i, hi, rfl⟩))
        (by unfold gkArmBlock; rw [if_pos hidx.symm]; rfl)
    rw [mem_gkArmBlock_verts_iff k _ i hi] at hq3
    have hqτ : q ≠ τ := fun h => hq3 (by rw [h]; omega)
    refine ⟨Finset.mem_erase.mpr ⟨Ne.symm hqτ, hτB⟩, ?_⟩
    rw [gk_active_arm_iff k i hi τ hc hleaf]
    have ha := (gk_active_arm_iff k i hi τ hc hleaf B).mp hact
    refine Finset.mem_erase.mpr ⟨?_, ha⟩
    intro h
    apply hq3
    rw [← h, gkVertex_val k _ (by omega)]
    omega

end E993Transport
-- VERITYOS ENTRY 108 END

-- VERITYOS ENTRY 109 BEGIN lemma E993Transport.gkTagDown_injOn 535b4369f55304f3662b656155d95b0138f77ae98fdbf9d367219a225cdf2b7e
namespace E993Transport

-- r30 C4-LA1 node N5: per-tag injectivity (Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5)).
/-- (N5) the per-tag down-map is injective on the τ-active sources. -/
lemma gkTagDown_injOn (k p : ℕ) (hp : k + 3 ≤ p) (τ : Fin (3*k+5))
    (hτ : τ ∈ C5LA1.leafSet (gkGraph k)) (B B' : Finset (Fin (3*k+5)))
    (hB : B ∈ indepFamily (gkGraph k) (p + 1)) (hB' : B' ∈ indepFamily (gkGraph k) (p + 1))
    (hτB : τ ∈ B) (hact : ¬ Disjoint (B.erase τ) (tagWitnesses (gkGraph k) τ))
    (hτB' : τ ∈ B') (hact' : ¬ Disjoint (B'.erase τ) (tagWitnesses (gkGraph k) τ))
    (h : gkTagDown k τ B = gkTagDown k τ B') : B = B' := by
  obtain ⟨q, hq, hdown, -⟩ := gkTagDown_erase_keeps_tag_active k p hp τ hτ B hB hτB hact
  obtain ⟨q', hq', hdown', -⟩ := gkTagDown_erase_keeps_tag_active k p hp τ hτ B' hB' hτB' hact'
  have hval := chainValid_gkTagFactors k τ hτ B ((mem_indepFamily_iff _ _ _).mp hB).2
    (gk_root_notMem k p hp B hB) hτB hact
  have hval' := chainValid_gkTagFactors k τ hτ B' ((mem_indepFamily_iff _ _ _).mp hB').2
    (gk_root_notMem k p hp B' hB') hτB' hact'
  rw [hdown, hdown'] at h
  exact eq_of_chainDownVertex_erase_eq _ (chainDisjoint_gkTagFactors k τ) B B' hval hval'
    q q' hq hq' h

end E993Transport
-- VERITYOS ENTRY 109 END

-- VERITYOS ENTRY 110 BEGIN lemma E993Transport.gk_exists_deletionSupported_saturatingFlow d0892d585740a1142e2c34a994fc98661fccaafdabb0a7607517062d338bc64d
namespace E993Transport

-- r30 C4-LA1 node N6 (assembly): Theorem CT-1 (critic `C-F2-T`, r30 Cycle 4, Claude Opus 5.5) with the rank extension
-- R2′ (r30 Cycle 4 F adjudicator, Claude Opus 5.5). The terminal theorem restates this lemma verbatim because the registrar
-- admits no entry after the terminal theorem and both companions consume the flow.
/-- (N6) assembly: the per-tag injections give a deletion-supported saturating flow on `G_k` at
every rank `p ≥ k + 3`, for every set `F` of leaves. -/
lemma gk_exists_deletionSupported_saturatingFlow (k p : ℕ) (hp : k + 3 ≤ p)
    (F : Finset (Fin (3*k+5))) (hF : F ⊆ C5LA1.leafSet (gkGraph k)) :
    ∃ f : Finset (Fin (3*k+5)) → Finset (Fin (3*k+5)) → ℕ,
      IsSaturatingFlow (gkGraph k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q := by
  refine saturatingFlow_of_perTag_deletionInjections (gkGraph k) F p (gkTagDown k) ?_ ?_
  · intro τ hτF B hB hτB hact
    obtain ⟨q, -, hdown, hqB, hτq, hactq⟩ := gkTagDown_erase_keeps_tag_active k p hp τ (hF hτF) B hB hτB hact
    exact ⟨⟨q, hqB, hdown⟩, hdown ▸ hτq, hdown ▸ hactq⟩
  · intro τ hτF B hB B' hB' hτB hact hτB' hact' h
    exact gkTagDown_injOn k p hp τ (hF hτF) B B' hB hB' hτB hact hτB' hact' h

end E993Transport
-- VERITYOS ENTRY 110 END

-- VERITYOS ENTRY 111 BEGIN lemma E993Transport.gk_weightedHall_of_rank_ge 574664f235d9c06590d498a1830c67f1f7a0a5ceb4674d2c957bd1d93d7c5aac
namespace E993Transport

-- r30 C4-LA1 companion (lemma; proved_informal per R29-N-12; no certificate of its own): uses the carried
-- C1-LA2 lemma `weightedHall_of_saturatingFlow` (r30 C1-LA2).
/-- Companion (lemma; proved_informal per R29-N-12): flow ⇒ Hall on `G_k`. -/
lemma gk_weightedHall_of_rank_ge (k p : ℕ) (hp : k + 3 ≤ p)
    (F : Finset (Fin (3*k+5))) (hF : F ⊆ C5LA1.leafSet (gkGraph k)) :
    WeightedHall (gkGraph k) F p := by
  obtain ⟨f, hf, -⟩ := gk_exists_deletionSupported_saturatingFlow k p hp F hF
  exact weightedHall_of_saturatingFlow (gkGraph k) F p f hf

end E993Transport
-- VERITYOS ENTRY 111 END

-- VERITYOS ENTRY 112 BEGIN lemma E993Transport.gk_aggregate_nonpos_of_rank_ge fa70a0529f780106676614bb993437fbec329a2a46f1669fd072448ed590704e
namespace E993Transport

-- r30 C4-LA1 companion (lemma; proved_informal per R29-N-12; no certificate of its own): uses the carried
-- C1-LA2 lemma `aggregate_nonpos_of_saturatingFlow` (FLOW⇒SIGN, r30 C1-LA2) at `F = favorableLeaves`
-- (`Finset.filter_subset`). Scope: `G_k` only; not GK-SIGN (whose strict bound at `p = k + 3` is not claimed).
/-- Companion (lemma): `S(G_k, p) ≤ 0` at every `p ≥ k + 3`, via C1-LA2's FLOW⇒SIGN at `F = favorableLeaves`. -/
lemma gk_aggregate_nonpos_of_rank_ge (k p : ℕ) (hp : k + 3 ≤ p) :
    C5LA1.aggregate (gkGraph k) p ≤ 0 := by
  obtain ⟨f, hf, -⟩ := gk_exists_deletionSupported_saturatingFlow k p hp
    (favorableLeaves (gkGraph k) p) (by classical exact Finset.filter_subset _ _)
  exact aggregate_nonpos_of_saturatingFlow (gkGraph k) p (by omega) f hf

end E993Transport
-- VERITYOS ENTRY 112 END

-- VERITYOS ENTRY 113 BEGIN theorem E993Transport.gk_deletionSaturatingFlow_of_rank_ge 9d4b00429836569c2cfd5989c217b6ae1463e2614e64117739ebe0f0731c5bbe
namespace E993Transport

-- r30 C4-LA1 TERMINAL THEOREM. Key on closure:
-- E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET.
-- Attribution: the network, the active-tag weight and (HALL): Codex GPT-6 (the lower-region run and its
-- corrections); definition entries 1–13: the first-interior run (Codex) with the r26/r24/r25 definition layers;
-- the transport definitions and (WID): r30 C1-LA1; FLOW⇒SIGN: r30 C1-LA2; the `G_k` family and its eligibility
-- key: r30 Cycles 2–3; CT-1: critic `C-F2-T` (r30 Cycle 4; Claude Opus 5.5); R2′: the r30 Cycle 4 F adjudicator
-- (Claude Opus 5.5); the bounded `G_k` Hall record: F2 (Claude Sonnet 5), `C-F2-U`, the controller replay CF6-1,
-- the synthesis instrument; r29's high-tail certificates are not used. Lean text: the C4-LA1 formalizer (Claude Opus 5.5).
-- Fences: one explicit tree family; not (HALL) at any other scope; no `IsTree`, eligibility, `crossingIndex` or
-- `indepNum` asserted; not "every eligible rank of `G_k`"; nothing on the primary aggregate beyond `G_k`; no RTree
-- statement; nothing about switch arcs elsewhere; not E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY (a matching is
-- not linear injectivity), not E993-R23-LITERAL-DELETE-ONLY-HALL, not C6-F4, not R19; GK-SIGN is not formally
-- verified by this award.
/-- Terminal theorem (C4-LA1). -/
theorem gk_deletionSaturatingFlow_of_rank_ge (k p : ℕ) (hp : k + 3 ≤ p)
    (F : Finset (Fin (3*k+5))) (hF : F ⊆ C5LA1.leafSet (gkGraph k)) :
    ∃ f : Finset (Fin (3*k+5)) → Finset (Fin (3*k+5)) → ℕ,
      IsSaturatingFlow (gkGraph k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q :=
  gk_exists_deletionSupported_saturatingFlow k p hp F hF

end E993Transport
-- VERITYOS ENTRY 113 END

