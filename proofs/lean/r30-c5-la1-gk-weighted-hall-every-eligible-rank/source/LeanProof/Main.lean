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

-- VERITYOS ENTRY 45 BEGIN definition C5LA1.crossingIndex 378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb
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
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN definition E993Transport.gkParentVal 8860ab9b6d1a8dfef6a5c783825ffbb4e5b85e5f5fc382d82b8524c9a72a6058
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda… lines 2957–3229; re-authored as registrar entries by the C5-LA1 formalizer.
/-- the value of the parent of a vertex of value `n ≥ 1` in `G_k`, one step closer to the root. -/
def gkParentVal (n : ℕ) : ℕ :=
  if n = 1 then 0
  else if n = 2 then 0
  else if n = 3 then 2
  else if n = 4 then 2
  else if (n - 5) % 3 = 0 then 0
  else n - 1

end E993Transport
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN definition E993Transport.gkParent 745ce5dc4f16a950844e1b39547a772142ee58c1ad99bb6e88c12ff9389967a6
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer; U1, Claude Sonnet 5).
/-- the parent of `v` in `G_k`. -/
def gkParent (k : ℕ) (v : Fin (3*k+5)) : Fin (3*k+5) := gkVertex k (gkParentVal v.val)

end E993Transport
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN definition E993Transport.gkChildEdge a5bb2dd935a4ffdcea9c78b8859081b37a14818638539a1dfa7dc58372ac0a60
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer; U1, Claude Sonnet 5).
/-- the child–parent edge as a `Sym2`, for a non-root vertex. -/
def gkChildEdge (k : ℕ) (v : {v : Fin (3*k+5) // v.val ≠ 0}) : Sym2 (Fin (3*k+5)) :=
  s(v.1, gkParent k v.1)

end E993Transport
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN definition E993Transport.gkHalfCount d244880c61d72f24cf445bd946a6ad902d2507364cbe2e8c78c702389085241f
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5). The explicit
-- binomial form is the U adjudicator's (r30 Cycle 5, group G-U-A); the row decomposition is C-U1-F's / C-U1-T's.
/-- `u_m = Σ_{i ≤ m} C(k+1,i)·C(2(k+1−i), m−i) + Σ_{l < m} C(k,l)·C(k−l+1, m−l−1)`: the coefficient of `y^m` in
`(1+3y+y²)^(k+1) + y(1+y)(1+2y)^k`, in explicit binomial form (no `Polynomial`). The summation ranges `i ≤ m`,
`l < m` make every subtraction `m − i`, `m − l − 1` exact; `k + 1 − i`, `k − l` truncate only where the
factor `C(k+1,i)` resp. `C(k,l)` is already `0`. -/
def gkHalfCount (k m : ℕ) : ℕ :=
  (∑ i ∈ Finset.range (m + 1), (k + 1).choose i * (2 * (k + 1 - i)).choose (m - i)) +
    ∑ l ∈ Finset.range m, k.choose l * (k - l + 1).choose (m - l - 1)

end E993Transport
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN definition E993Transport.gkArmMiddles 97a56a47aba88e0c13dde5979208c28de765a67ad8f783d0a3cc8a8e34ec6109
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5).
/-- the arm middles `b_i = 6 + 3i`, `i < k`, of `G_k`. -/
def gkArmMiddles (k : ℕ) : Finset (Fin (3*k+5)) :=
  (Finset.range k).image fun i => gkVertex k (6 + 3 * i)

end E993Transport
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN definition E993Transport.gkMiddles d453c86793ed852199113cc9074a9b1392572a8993e5170c8c30290673797ac5
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5).
/-- the middles of the `k + 1` paths `P_3` of `G_k − 0`: the cherry centre `2` and the arm middles `b_i`. -/
def gkMiddles (k : ℕ) : Finset (Fin (3*k+5)) :=
  insert (gkVertex k 2) (gkArmMiddles k)

end E993Transport
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN definition E993Transport.gkFarLeaves 3d9c1f498ec20a213af03bfe4bc84f98f38ec37b0a62a5601dd9e3674a266a0f
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5).
/-- the leaves of `G_k` not adjacent to the root: the cherry leaves `3, 4` and the arm tips `c_i = 7 + 3i`. -/
def gkFarLeaves (k : ℕ) : Finset (Fin (3*k+5)) :=
  insert (gkVertex k 3) (insert (gkVertex k 4) ((Finset.range k).image fun i => gkVertex k (7 + 3 * i)))

end E993Transport
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma E993Interior.highTailAggregateFromShadow 972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d
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
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma E993Transport.indepFamily_eq_indepSetsAvoiding 45d1a93e12e0f50a58b9efb7fe25fab2fcd0c2e31eff6b3ac74795bf6a27cfe8
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
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma E993Transport.isGraphLeaf_of_mem_favorableLeaves 8977fb83111a46cace690984e23e2ffd54e2ea5233712bfeeca579f1debf75c8
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
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma E993Transport.tagWitnesses_subset_R 7a8528a04b10243adfa0e8488d21206bd9cfed44e18910e7ed810b7b8517baad
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
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma E993Transport.card_active_eq_tagged 8823a71dad443ec51fdf34fc541c2c66aab7792d9520f8ef76665729ece12616
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
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma E993Transport.layerWeight_eq_sum_card 6adece46210475286f5574371270d1f0cba414876eec5e7dd058ab2fa1993c8f
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
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma E993Transport.layerWeight_sub_eq_sum 56e71a87c92f3d8435c1f8fb3b3e906cb037d78027b5bdfdf26b824a1fa8cc33
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
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma E993Transport.activeWeightAggregateIdentity 9daf96e3501eccf92cd7025a400785520be2dc5ed078923730e0729f2af7d899
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
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma E993Transport.aggregate_nonpos_of_saturatingFlow ce01183cc56349c832b3626edb125bdffae41d91412371271d18104ee3795f30
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
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma E993Transport.weightedHall_of_saturatingFlow 89a7ffb8bc79b1d61290459a843fb8fa2ca73c6fc9e3b6affd8448933bf2d54c
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
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma E993Transport.ChainFactor.card_inter_path_eq fb9273d46ecbb6344f21f47a0c2732841ee2a4f2b07e752d410714c1a83e9b9f
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
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma E993Transport.ChainFactor.two_mul_card_add_len_eq b4b34a0cf1dfc68177104fb386cb85c926399eb09058db3a6075dce9992dd789
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
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma E993Transport.ChainFactor.code_fst_le_snd 4687c620aae2e16910394ac2b3dbfe8d7ec8073e4860e68c8386bdadf2ed726f
namespace E993Transport.ChainFactor

variable {V : Type*} [DecidableEq V]

lemma code_fst_le_snd (c : ChainFactor V) (B : Finset V) : (c.code B).1 ≤ (c.code B).2 := by
  cases c with
  | single v => simp only [code]; split_ifs <;> simp
  | path x y z => simp only [code]; split_ifs <;> simp
  | frozen vs s => simp [code]

end E993Transport.ChainFactor
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma E993Transport.ChainFactor.exists_drop_of_code_pos 4d7c96673fdbc78ce2cad5bf2d0920cdb5ab54ac92009057f9ba780ccad8726a
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
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma E993Transport.ChainFactor.code_erase_of_notMem d90065196eafb6af9bc223e3ccd6bcc75af09805706e98ee5cbe27443fca1cb9
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
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma E993Transport.ChainFactor.drop_mem_or_mem_of_ne 9088c80b91e37fe76657818f8ffd646e51010bc42e645849b3bc56e9788a336c
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
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma E993Transport.mem_chainVerts_iff cde031a8ef9764eb71e766dea3d2e10b9cf2fcb22beb86999aa6d89928db9a0d
namespace E993Transport

variable {V : Type*} [DecidableEq V]

lemma mem_chainVerts_iff (cs : List (ChainFactor V)) (v : V) :
    v ∈ chainVerts cs ↔ ∃ c ∈ cs, v ∈ c.verts := by
  induction cs with
  | nil => simp [chainVerts]
  | cons c cs ih => simp [chainVerts, ih]

end E993Transport
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma E993Transport.chainDownUp_erase_of_notMem f76732f072f2fdad9f343e94dbf3d5636518fbad4990ff5e747c1da53616dcac
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
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma E993Transport.two_mul_chainSize_add_up_eq 7793757076279a9c59439aa2be8734e8c2a27085ece8bbf51e24e87d670868ea
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
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma E993Transport.mem_and_exists_drop_of_chainDownVertex 4a73e439b8a01bae4d1230bb79f86c880fb395752904af56caeea92117c347d5
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
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma E993Transport.exists_chainDownVertex_of_down_pos ae9b9fa0e2265983da2e05ce4211a971ef7da084996ec6eb137d0eaa38afd511
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
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma E993Transport.chainDownUp_erase_chainDownVertex f240147f3dfcd92cdfeae410ad951156a42c6e1ec49ae9f2e531f0ea4ef38ef7
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
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma E993Transport.notMem_verts_of_chainDownVertex f52cd04f62a0623e8e96121a1eebf932f0b79dcc88068a9fed09ad4f37c75df4
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
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma E993Transport.eq_of_chainDownVertex_erase_eq abe1b5e82ab32a2af7093e3ffa66492e5c8423f6928f518be160b7b2119231df
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
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma E993Transport.chainDownUp_snd_eq_zero_of_top 9b81f16c82a17c3b6f0d9335491d0f8d72913f08847a29165f0a765689b2c13c
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
-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma E993Transport.chainSize_eq_card_inter 5c45300ef1a4198e3838a01ad3649dd0f6d5669ed8fc6ef3aa25b0f606c97402
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
-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma E993Transport.chainSize_le_length 5feb79ed3065b9d6e7c42c63b8142bad998feb627f1d6dcc00d06d5ca1538292
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
-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma E993Transport.top_of_length_le_chainSize ac4b9d8227aeb56206cac0be221a3764507340765e07250f8ccd995e0a9dc8b9
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
-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma E993Transport.mem_indepFamily_iff d30c9ae0035311c89520623588b7418ed42be1a95848546b7b181e1a257411e5
namespace E993Transport

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_indepFamily_iff (G : SimpleGraph V) [DecidableRel G.Adj] (j : ℕ) (B : Finset V) :
    B ∈ indepFamily G j ↔ B.card = j ∧ G.IsIndepSet (B : Set V) := by
  simp [indepFamily, Finset.mem_powersetCard]

end E993Transport
-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma E993Transport.erase_mem_indepFamily 2832798965770e894f108bf878bbc98df5a0a0b7738130529c712b613d44442b
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
-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN lemma E993Transport.saturatingFlow_of_perTag_deletionInjections 72ae49fe71d5923ebf506d4d48f40139072320a394af5c8f6b7611fa898fb048
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
-- VERITYOS ENTRY 83 END

-- VERITYOS ENTRY 84 BEGIN lemma E993Transport.gkVertex_val e2b82f69fd71f10d62504c04bb415da57ee121bf8224ad32a703ef4dc735b59c
namespace E993Transport

lemma gkVertex_val (k n : ℕ) (h : n < 3*k+5) : (gkVertex k n).val = n :=
  Nat.mod_eq_of_lt h

end E993Transport
-- VERITYOS ENTRY 84 END

-- VERITYOS ENTRY 85 BEGIN lemma E993Transport.eq_gkVertex_iff 821056fedfff00187c86c908f974b165362d07e4120d24821f13d1f5cb2cf8b3
namespace E993Transport

lemma eq_gkVertex_iff (k n : ℕ) (h : n < 3*k+5) (v : Fin (3*k+5)) :
    v = gkVertex k n ↔ v.val = n := by
  rw [Fin.ext_iff, gkVertex_val k n h]

end E993Transport
-- VERITYOS ENTRY 85 END

-- VERITYOS ENTRY 86 BEGIN lemma E993Transport.gkGraph_adj_iff 8d360de32ed56b43a09bb8c72ae489e609c91bf337ff6701a077c8b17d0a67c8
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
-- VERITYOS ENTRY 86 END

-- VERITYOS ENTRY 87 BEGIN lemma E993Transport.gkGraph_adj_iff_val 1e42ac9f507e04c9ba0473e6e3535a98b4e22aa5672ba0b9f56340ede4feccd2
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
-- VERITYOS ENTRY 87 END

-- VERITYOS ENTRY 88 BEGIN lemma E993Transport.gkGraph_adj_of_val 845a87211ec204ad718aabe587c4e9ebefe7cc32c794fe9038e4ce1387098e7b
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
-- VERITYOS ENTRY 88 END

-- VERITYOS ENTRY 89 BEGIN lemma E993Transport.gkLeafBlock_verts c85615531df022c4537f554267efc95c8bf4878f44e6946ecda5970535a17994
namespace E993Transport

lemma gkLeafBlock_verts (k : ℕ) (τ : Fin (3*k+5)) :
    (gkLeafBlock k τ).verts = {gkVertex k 1} := by
  unfold gkLeafBlock
  split_ifs <;> rfl

end E993Transport
-- VERITYOS ENTRY 89 END

-- VERITYOS ENTRY 90 BEGIN lemma E993Transport.gkCherryBlock_verts d72b98200f7d4fb98d7f3a474b21e7daf14370a103efe38a785cbfa481b0237d
namespace E993Transport

lemma gkCherryBlock_verts (k : ℕ) (τ : Fin (3*k+5)) :
    (gkCherryBlock k τ).verts = {gkVertex k 3, gkVertex k 2, gkVertex k 4} := by
  unfold gkCherryBlock
  split_ifs <;> rfl

end E993Transport
-- VERITYOS ENTRY 90 END

-- VERITYOS ENTRY 91 BEGIN lemma E993Transport.gkArmBlock_verts 6272a87d2fac20664b537bf5c314c84cf177f702c32792938da95a6edd7c4cb5
namespace E993Transport

lemma gkArmBlock_verts (k i j : ℕ) :
    (gkArmBlock k i j).verts =
      {gkVertex k (5+3*j), gkVertex k (6+3*j), gkVertex k (7+3*j)} := by
  unfold gkArmBlock
  split_ifs <;> rfl

end E993Transport
-- VERITYOS ENTRY 91 END

-- VERITYOS ENTRY 92 BEGIN lemma E993Transport.mem_gkLeafBlock_verts_iff 38831b1b303118c60790acdde3678f2d263e9ac0ac667477cbe90a3f54dc5f8a
namespace E993Transport

lemma mem_gkLeafBlock_verts_iff (k : ℕ) (τ v : Fin (3*k+5)) :
    v ∈ (gkLeafBlock k τ).verts ↔ v.val = 1 := by
  rw [gkLeafBlock_verts, Finset.mem_singleton, eq_gkVertex_iff k 1 (by omega)]

end E993Transport
-- VERITYOS ENTRY 92 END

-- VERITYOS ENTRY 93 BEGIN lemma E993Transport.mem_gkCherryBlock_verts_iff 096cf068463c225a7b4cedbb8390283d9c21147f823dafab2495f5691175e6fc
namespace E993Transport

lemma mem_gkCherryBlock_verts_iff (k : ℕ) (τ v : Fin (3*k+5)) :
    v ∈ (gkCherryBlock k τ).verts ↔ v.val = 3 ∨ v.val = 2 ∨ v.val = 4 := by
  rw [gkCherryBlock_verts]
  simp only [Finset.mem_insert, Finset.mem_singleton]
  rw [eq_gkVertex_iff k 3 (by omega), eq_gkVertex_iff k 2 (by omega),
    eq_gkVertex_iff k 4 (by omega)]

end E993Transport
-- VERITYOS ENTRY 93 END

-- VERITYOS ENTRY 94 BEGIN lemma E993Transport.mem_gkArmBlock_verts_iff e61057255218fca4e5088d12ead685a6c50bcac5d14c89544ec7c86496710a9c
namespace E993Transport

lemma mem_gkArmBlock_verts_iff (k i j : ℕ) (hj : j < k) (v : Fin (3*k+5)) :
    v ∈ (gkArmBlock k i j).verts ↔ v.val = 5+3*j ∨ v.val = 6+3*j ∨ v.val = 7+3*j := by
  rw [gkArmBlock_verts]
  simp only [Finset.mem_insert, Finset.mem_singleton]
  rw [eq_gkVertex_iff k _ (by omega), eq_gkVertex_iff k _ (by omega),
    eq_gkVertex_iff k _ (by omega)]

end E993Transport
-- VERITYOS ENTRY 94 END

-- VERITYOS ENTRY 95 BEGIN lemma E993Transport.mem_chainVerts_gkTagFactors_iff 596c5850dad28fd3f0b30e74a11d3e8d0df9ae46814a907032f58ddc63918502
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
-- VERITYOS ENTRY 95 END

-- VERITYOS ENTRY 96 BEGIN lemma E993Transport.chainDisjoint_gkTagFactors c082c60ac22c60c344947b0f7ad605c6b155b1a276ccb14bc8e8826429394ccc
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
-- VERITYOS ENTRY 96 END

-- VERITYOS ENTRY 97 BEGIN lemma E993Transport.chainSize_gkTagFactors af1a6b759a619553a4d950b1eeb311300f305b78a84381a59b3eb948aceef6bd
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
-- VERITYOS ENTRY 97 END

-- VERITYOS ENTRY 98 BEGIN lemma E993Transport.chainRank_map_gkArmBlock_le 1fc0e1ec47998e4a24eaf106df3912584013f751440d6c3bd4406c40e4cf3b73
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
-- VERITYOS ENTRY 98 END

-- VERITYOS ENTRY 99 BEGIN lemma E993Transport.chainRank_gkTagFactors_le 58c5e3ea3b1db6acde8f36ca17255ff57e379583287214b5fbc053c89dd700fe
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
-- VERITYOS ENTRY 99 END

-- VERITYOS ENTRY 100 BEGIN lemma E993Transport.gkVertex_ne ff36793eb22ae877779e33a9fa56ec6e2bb75f4112bb8d4d4b803f2ba05dda42
namespace E993Transport

lemma gkVertex_ne (k m n : ℕ) (hm : m < 3*k+5) (hn : n < 3*k+5) (hmn : m ≠ n) :
    gkVertex k m ≠ gkVertex k n := by
  intro h
  have := congrArg Fin.val h
  rw [gkVertex_val k m hm, gkVertex_val k n hn] at this
  exact hmn this

end E993Transport
-- VERITYOS ENTRY 100 END

-- VERITYOS ENTRY 101 BEGIN lemma E993Transport.gkGraph_adj_of_val_root 69e46ac55fac45ae38904bfb8f89c20f7b997e5b38138b72d55c5fefb26ec565
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
-- VERITYOS ENTRY 101 END

-- VERITYOS ENTRY 102 BEGIN lemma E993Transport.gkGraph_adj_of_val_arm 6237dafe940e34591ba4ac181f8683b7105fc13173619bf0d6eec0afe5790585
namespace E993Transport

/-- an arm edge of `G_k`, read on labels. -/
lemma gkGraph_adj_of_val_arm (k : ℕ) (u v : Fin (3*k+5)) (j : ℕ) (hj : j < k)
    (h : (u.val = 0 ∧ v.val = 5+3*j) ∨ (u.val = 5+3*j ∧ v.val = 6+3*j) ∨
      (u.val = 6+3*j ∧ v.val = 7+3*j)) : (gkGraph k).Adj u v :=
  gkGraph_adj_of_val k u v (Or.inr (Or.inr (Or.inr (Or.inr ⟨j, hj, h⟩))))

end E993Transport
-- VERITYOS ENTRY 102 END

-- VERITYOS ENTRY 103 BEGIN lemma E993Transport.gk_not_adj_of_indep 37724bddd1a4509225c66f6308beca9b0ca5f93c803f87612c26989ef5651b1c
namespace E993Transport

/-- two members of an independent set of `G_k` are not adjacent. -/
lemma gk_not_adj_of_indep (k : ℕ) (B : Finset (Fin (3*k+5)))
    (hI : (gkGraph k).IsIndepSet (B : Set (Fin (3*k+5)))) (u v : Fin (3*k+5))
    (hu : u ∈ B) (hv : v ∈ B) : ¬ (gkGraph k).Adj u v := by
  intro hadj
  exact hI (Finset.mem_coe.mpr hu) (Finset.mem_coe.mpr hv) hadj.ne hadj

end E993Transport
-- VERITYOS ENTRY 103 END

-- VERITYOS ENTRY 104 BEGIN lemma E993Transport.gk_leaf_cases 72da9cbb2291ef5b0584e927f6388ad0066954a590722bd0f79970a89553373a
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
-- VERITYOS ENTRY 104 END

-- VERITYOS ENTRY 105 BEGIN lemma E993Transport.not_disjoint_erase_tagWitnesses_iff b9615873cbc7f2cb26925b23e05e2edf8a4b6bd689c87fcce107ebbcc2fd3b8f
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
-- VERITYOS ENTRY 105 END

-- VERITYOS ENTRY 106 BEGIN lemma E993Transport.gk_active_arm_iff e2eff73c6bd3e322ba69fd3c0f1da5828533bae1dcf55369cac8f0f9fe4b7338
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
-- VERITYOS ENTRY 106 END

-- VERITYOS ENTRY 107 BEGIN lemma E993Transport.gk_active_cherry_iff 2320778f83f746d088e3adbd4e2bfe5b04e793dfa52b29a7e200f477646d88cd
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
-- VERITYOS ENTRY 107 END

-- VERITYOS ENTRY 108 BEGIN lemma E993Transport.gk_active_one_iff 7cf8993c8bf8d0b368667395cec075e6cc2cf44cb4c63bfcd76fa5a619c6d8dc
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
-- VERITYOS ENTRY 108 END

-- VERITYOS ENTRY 109 BEGIN lemma E993Transport.gk_root_notMem 215054b7010313ab3a98f662faa41c2dfc85fa0f92aa185274bb9ee7adfe9b5a
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
-- VERITYOS ENTRY 109 END

-- VERITYOS ENTRY 110 BEGIN lemma E993Transport.inter_triple_eq_pair 0a4dcca46a1fee4fffd3cbce9cbfa9514c046855926aca463f83d42ad779a424
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
-- VERITYOS ENTRY 110 END

-- VERITYOS ENTRY 111 BEGIN lemma E993Transport.gk_path_valid ceb65cc46d975d11fb18758dc91bd06a4fd1b11fdd8dfdeef6ab40c85ec44c64
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
-- VERITYOS ENTRY 111 END

-- VERITYOS ENTRY 112 BEGIN lemma E993Transport.chainValid_gkTagFactors 7383beaa0a8a0154cce87a937b0f2a627b1f53940707b34cc2d7ffa859d3b885
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
-- VERITYOS ENTRY 112 END

-- VERITYOS ENTRY 113 BEGIN lemma E993Transport.exists_chainDownVertex_gkTagFactors 9c2167d698a2dddc8bf43bb85dc5cc117e9c2051618db92838887743fea3af58
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
-- VERITYOS ENTRY 113 END

-- VERITYOS ENTRY 114 BEGIN lemma E993Transport.gk_one_blocks_top_of_avoid aa88fc49334c361e172d528af671701a984845b2ed426514b416dc8e31a1be05
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
-- VERITYOS ENTRY 114 END

-- VERITYOS ENTRY 115 BEGIN lemma E993Transport.gk_one_active_after_down 5101d8b3e510e6f2242c99a5aa84e706317bd85b8ca00ded52a2fa6c51b09b74
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
-- VERITYOS ENTRY 115 END

-- VERITYOS ENTRY 116 BEGIN lemma E993Transport.gkTagDown_erase_keeps_tag_active 79a323839ae88a5e5d6b48ab729d1bd427ca5f9947442ea5796223caaa0c3d5c
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
-- VERITYOS ENTRY 116 END

-- VERITYOS ENTRY 117 BEGIN lemma E993Transport.gkTagDown_injOn 535b4369f55304f3662b656155d95b0138f77ae98fdbf9d367219a225cdf2b7e
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
-- VERITYOS ENTRY 117 END

-- VERITYOS ENTRY 118 BEGIN lemma E993Transport.gk_exists_deletionSupported_saturatingFlow d0892d585740a1142e2c34a994fc98661fccaafdabb0a7607517062d338bc64d
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
-- VERITYOS ENTRY 118 END

-- VERITYOS ENTRY 119 BEGIN lemma E993Transport.gk_weightedHall_of_rank_ge 574664f235d9c06590d498a1830c67f1f7a0a5ceb4674d2c957bd1d93d7c5aac
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
-- VERITYOS ENTRY 119 END

-- VERITYOS ENTRY 120 BEGIN lemma E993Transport.gk_aggregate_nonpos_of_rank_ge fa70a0529f780106676614bb993437fbec329a2a46f1669fd072448ed590704e
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
-- VERITYOS ENTRY 120 END

-- VERITYOS ENTRY 121 BEGIN lemma E993Transport.gkGraph_adj_zero_one 817fe94f76b918c8d7da613ecaae7e560e7ad3d629ad0e676a8b15ae52bf4ff5
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- the root–leaf edge `0 – 1`. -/
lemma gkGraph_adj_zero_one (k : ℕ) : (gkGraph k).Adj (gkVertex k 0) (gkVertex k 1) :=
  gkGraph_adj_of_val_root k _ _ (Or.inl ⟨gkVertex_val k 0 (by omega), gkVertex_val k 1 (by omega)⟩)

end E993Transport
-- VERITYOS ENTRY 121 END

-- VERITYOS ENTRY 122 BEGIN lemma E993Transport.gkGraph_adj_zero_two d131896ddb4419c41772ad04ba28ac5da7de3670805a6756d55261f9e8725a43
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- the root–support edge `0 – 2`. -/
lemma gkGraph_adj_zero_two (k : ℕ) : (gkGraph k).Adj (gkVertex k 0) (gkVertex k 2) :=
  gkGraph_adj_of_val_root k _ _ (Or.inr (Or.inl ⟨gkVertex_val k 0 (by omega), gkVertex_val k 2 (by omega)⟩))

end E993Transport
-- VERITYOS ENTRY 122 END

-- VERITYOS ENTRY 123 BEGIN lemma E993Transport.gkGraph_adj_two_three 6de0bace08fe1d3135430584a8af540ee442fecd91d4189dab81e278cd2fa6bc
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- the cherry edge `2 – 3`. -/
lemma gkGraph_adj_two_three (k : ℕ) : (gkGraph k).Adj (gkVertex k 2) (gkVertex k 3) :=
  gkGraph_adj_of_val_root k _ _
    (Or.inr (Or.inr (Or.inl ⟨gkVertex_val k 2 (by omega), gkVertex_val k 3 (by omega)⟩)))

end E993Transport
-- VERITYOS ENTRY 123 END

-- VERITYOS ENTRY 124 BEGIN lemma E993Transport.gkGraph_adj_two_four 7d4bea7afc6fc00822c9298106b0279c3c1707a6c25298f7278ec4a540692f55
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- the cherry edge `2 – 4`. -/
lemma gkGraph_adj_two_four (k : ℕ) : (gkGraph k).Adj (gkVertex k 2) (gkVertex k 4) :=
  gkGraph_adj_of_val_root k _ _
    (Or.inr (Or.inr (Or.inr ⟨gkVertex_val k 2 (by omega), gkVertex_val k 4 (by omega)⟩)))

end E993Transport
-- VERITYOS ENTRY 124 END

-- VERITYOS ENTRY 125 BEGIN lemma E993Transport.gkGraph_adj_zero_arm f2b2a5cce888335b1a8f9e0c21871ca68f36ca842cd241224ad5b094bc22f9b0
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- the root–arm edge `0 – a_i`, `a_i = 5+3i`. -/
lemma gkGraph_adj_zero_arm (k i : ℕ) (hi : i < k) :
    (gkGraph k).Adj (gkVertex k 0) (gkVertex k (5+3*i)) :=
  gkGraph_adj_of_val_arm k _ _ i hi
    (Or.inl ⟨gkVertex_val k 0 (by omega), gkVertex_val k (5+3*i) (by omega)⟩)

end E993Transport
-- VERITYOS ENTRY 125 END

-- VERITYOS ENTRY 126 BEGIN lemma E993Transport.gkGraph_adj_arm_mid 6d5136dd90614c666e5c530dabfc93afc460ef0acc997d07c4b02105b3d25099
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- the arm edge `a_i – b_i`. -/
lemma gkGraph_adj_arm_mid (k i : ℕ) (hi : i < k) :
    (gkGraph k).Adj (gkVertex k (5+3*i)) (gkVertex k (6+3*i)) :=
  gkGraph_adj_of_val_arm k _ _ i hi
    (Or.inr (Or.inl ⟨gkVertex_val k (5+3*i) (by omega), gkVertex_val k (6+3*i) (by omega)⟩))

end E993Transport
-- VERITYOS ENTRY 126 END

-- VERITYOS ENTRY 127 BEGIN lemma E993Transport.gkGraph_adj_arm_tip b81eeca644e399afd540129fca8bae9bc811d44cd0c4ad738d1d74729c793a04
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- the arm edge `b_i – c_i`. -/
lemma gkGraph_adj_arm_tip (k i : ℕ) (hi : i < k) :
    (gkGraph k).Adj (gkVertex k (6+3*i)) (gkVertex k (7+3*i)) :=
  gkGraph_adj_of_val_arm k _ _ i hi
    (Or.inr (Or.inr ⟨gkVertex_val k (6+3*i) (by omega), gkVertex_val k (7+3*i) (by omega)⟩))

end E993Transport
-- VERITYOS ENTRY 127 END

-- VERITYOS ENTRY 128 BEGIN lemma E993Transport.gkGraph_reachable_zero d7f908c59499c5731b71ba6909d577ff5185d28d7f38125b75c5c444d63cd2f3
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- every vertex of `G_k` is reachable from the root, by an explicit walk of length ≤ 3. -/
lemma gkGraph_reachable_zero (k : ℕ) (v : Fin (3*k+5)) :
    (gkGraph k).Reachable (gkVertex k 0) v := by
  have hv : v = gkVertex k v.val := (eq_gkVertex_iff k v.val v.isLt v).mpr rfl
  rw [hv]
  set n := v.val with hn
  have hlt : n < 3*k+5 := v.isLt
  have hcase : n = 0 ∨ n = 1 ∨ n = 2 ∨ n = 3 ∨ n = 4 ∨
      ∃ i, i < k ∧ (n = 5+3*i ∨ n = 6+3*i ∨ n = 7+3*i) := by
    by_cases h : n ≤ 4
    · omega
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr
        ⟨(n - 5) / 3, by omega, by omega⟩))))
  rcases hcase with h0 | h1 | h2 | h3 | h4 | ⟨i, hi, ha | hb | hc⟩
  · rw [h0]
  · rw [h1]; exact (gkGraph_adj_zero_one k).reachable
  · rw [h2]; exact (gkGraph_adj_zero_two k).reachable
  · rw [h3]; exact (gkGraph_adj_zero_two k).reachable.trans (gkGraph_adj_two_three k).reachable
  · rw [h4]; exact (gkGraph_adj_zero_two k).reachable.trans (gkGraph_adj_two_four k).reachable
  · rw [ha]; exact (gkGraph_adj_zero_arm k i hi).reachable
  · rw [hb]; exact (gkGraph_adj_zero_arm k i hi).reachable.trans (gkGraph_adj_arm_mid k i hi).reachable
  · rw [hc]
    exact ((gkGraph_adj_zero_arm k i hi).reachable.trans (gkGraph_adj_arm_mid k i hi).reachable).trans
      (gkGraph_adj_arm_tip k i hi).reachable

end E993Transport
-- VERITYOS ENTRY 128 END

-- VERITYOS ENTRY 129 BEGIN lemma E993Transport.gkGraph_connected c5a72b32d4aa0b876572762d2fd61ea879a78cca72a0e966eafa3cb424d5d6e6
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- `G_k` is connected. -/
lemma gkGraph_connected (k : ℕ) : (gkGraph k).Connected :=
  (SimpleGraph.connected_iff_exists_forall_reachable (gkGraph k)).mpr
    ⟨gkVertex k 0, gkGraph_reachable_zero k⟩

end E993Transport
-- VERITYOS ENTRY 129 END

-- VERITYOS ENTRY 130 BEGIN lemma E993Transport.gkParentVal_lt 352585c90968d5ef9e22dd12cf9d97def9845c8ea699ad38a4d387dffc7855fd
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- the parent is strictly closer to the root, for every non-root value. -/
lemma gkParentVal_lt (n : ℕ) (hn : 1 ≤ n) : gkParentVal n < n := by
  unfold gkParentVal
  split_ifs <;> omega

end E993Transport
-- VERITYOS ENTRY 130 END

-- VERITYOS ENTRY 131 BEGIN lemma E993Transport.gkGraph_adj_parent 8644bd002bf0c74227d989902735e41125e6432f19a6bb68886f477db5a2c27f
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- every non-root vertex is adjacent to its parent. -/
lemma gkGraph_adj_parent (k : ℕ) (v : Fin (3*k+5)) (hv : v.val ≠ 0) :
    (gkGraph k).Adj v (gkParent k v) := by
  have hlt : v.val < 3*k+5 := v.isLt
  unfold gkParent gkParentVal
  by_cases h1 : v.val = 1
  · rw [if_pos h1]
    have hveq : v = gkVertex k 1 := (eq_gkVertex_iff k 1 (by omega) v).mpr h1
    rw [hveq]; exact (gkGraph_adj_zero_one k).symm
  rw [if_neg h1]
  by_cases h2 : v.val = 2
  · rw [if_pos h2]
    have hveq : v = gkVertex k 2 := (eq_gkVertex_iff k 2 (by omega) v).mpr h2
    rw [hveq]; exact (gkGraph_adj_zero_two k).symm
  rw [if_neg h2]
  by_cases h3 : v.val = 3
  · rw [if_pos h3]
    have hveq : v = gkVertex k 3 := (eq_gkVertex_iff k 3 (by omega) v).mpr h3
    rw [hveq]; exact (gkGraph_adj_two_three k).symm
  rw [if_neg h3]
  by_cases h4 : v.val = 4
  · rw [if_pos h4]
    have hveq : v = gkVertex k 4 := (eq_gkVertex_iff k 4 (by omega) v).mpr h4
    rw [hveq]; exact (gkGraph_adj_two_four k).symm
  rw [if_neg h4]
  by_cases h5 : (v.val - 5) % 3 = 0
  · rw [if_pos h5]
    have hik : (v.val - 5) / 3 < k := by omega
    have hveq : v = gkVertex k (5 + 3 * ((v.val - 5) / 3)) :=
      (eq_gkVertex_iff k (5 + 3 * ((v.val - 5) / 3)) (by omega) v).mpr (by omega)
    rw [hveq]; exact (gkGraph_adj_zero_arm k _ hik).symm
  · rw [if_neg h5]
    -- `v.val = 6+3i` or `v.val = 7+3i` for the unique `i < k`
    have hge : 5 ≤ v.val := by omega
    rcases (by omega : v.val - 1 = 5 + 3 * ((v.val - 5) / 3) ∨
        v.val - 1 = 6 + 3 * ((v.val - 5 - 1) / 3)) with hi | hi
    · set i := (v.val - 5) / 3 with hidef
      have hik : i < k := by omega
      have hpeq : gkVertex k (v.val - 1) = gkVertex k (5 + 3 * i) := by
        rw [hidef]; congr 1
      have hveq : v = gkVertex k (6 + 3 * i) :=
        (eq_gkVertex_iff k (6 + 3 * i) (by omega) v).mpr (by omega)
      rw [hpeq, hveq]
      exact (gkGraph_adj_arm_mid k i hik).symm
    · set i := (v.val - 5 - 1) / 3 with hidef
      have hik : i < k := by omega
      have hpeq : gkVertex k (v.val - 1) = gkVertex k (6 + 3 * i) := by
        rw [hidef]; congr 1
      have hveq : v = gkVertex k (7 + 3 * i) :=
        (eq_gkVertex_iff k (7 + 3 * i) (by omega) v).mpr (by omega)
      rw [hpeq, hveq]
      exact (gkGraph_adj_arm_tip k i hik).symm

end E993Transport
-- VERITYOS ENTRY 131 END

-- VERITYOS ENTRY 132 BEGIN lemma E993Transport.gkParentVal_le b7b650e1fbb375bf2b3ab07c1399b03ba56760fd0dd5ce7a3d836d9ccda98e7a
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- `gkParentVal n ≤ n` always. -/
lemma gkParentVal_le (n : ℕ) : gkParentVal n ≤ n := by
  unfold gkParentVal; split_ifs <;> omega

end E993Transport
-- VERITYOS ENTRY 132 END

-- VERITYOS ENTRY 133 BEGIN lemma E993Transport.gkChildEdge_injective dac3e6888445796dfe3fa9ccdec965631dca7963ad3da96fdbff95e5aacd6665
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- distinct non-root vertices give distinct child–parent edges: a vertex is never its own
grandparent's parent, because `gkParentVal` strictly decreases the value. -/
lemma gkChildEdge_injective (k : ℕ) : Function.Injective (gkChildEdge k) := by
  rintro ⟨v, hv⟩ ⟨w, hw⟩ h
  simp only [gkChildEdge, Sym2.eq_iff] at h
  rcases h with ⟨h1, _⟩ | ⟨h1, h2⟩
  · exact Subtype.ext h1
  · exfalso
    have hvlt := gkParentVal_lt v.val (by omega)
    have hwlt := gkParentVal_lt w.val (by omega)
    have e1 : v.val = gkParentVal w.val := by
      have h1' := congrArg Fin.val h1
      unfold gkParent at h1'
      rwa [gkVertex_val k (gkParentVal w.val) (by omega)] at h1'
    have e2 : w.val = gkParentVal v.val := by
      have h2' := congrArg Fin.val h2
      unfold gkParent at h2'
      rw [gkVertex_val k (gkParentVal v.val) (by omega)] at h2'
      exact h2'.symm
    omega

end E993Transport
-- VERITYOS ENTRY 133 END

-- VERITYOS ENTRY 134 BEGIN lemma E993Transport.gkParentVal_at_one 778284b46f7dd08e5bc09a859935b39592c42c1957427e685ddd68d8e6bdc1ba
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
lemma gkParentVal_at_one : gkParentVal 1 = 0 := by unfold gkParentVal; norm_num

end E993Transport
-- VERITYOS ENTRY 134 END

-- VERITYOS ENTRY 135 BEGIN lemma E993Transport.gkParentVal_at_two ada0a71d6cc8804417e75e8ecc92e27bce011bb9c5fe94bfeb3effdfe9a120e7
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
lemma gkParentVal_at_two : gkParentVal 2 = 0 := by unfold gkParentVal; norm_num

end E993Transport
-- VERITYOS ENTRY 135 END

-- VERITYOS ENTRY 136 BEGIN lemma E993Transport.gkParentVal_at_three 5e93400de979d5c2f2805e6625b83bc0d986c0a1a7ac4c81f4fc79ee76b3524e
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
lemma gkParentVal_at_three : gkParentVal 3 = 2 := by unfold gkParentVal; norm_num

end E993Transport
-- VERITYOS ENTRY 136 END

-- VERITYOS ENTRY 137 BEGIN lemma E993Transport.gkParentVal_at_four 11f291812a92f88fc2a8bb63e6967b97c12bd0d97a2b806d1df94ce9b33a3eb9
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
lemma gkParentVal_at_four : gkParentVal 4 = 2 := by unfold gkParentVal; norm_num

end E993Transport
-- VERITYOS ENTRY 137 END

-- VERITYOS ENTRY 138 BEGIN lemma E993Transport.gkParentVal_at_arm_start 193b0d5c2d03fcb37d8b99e63ef53b70d916d6619ca15099d1a1e4ad60a19417
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
lemma gkParentVal_at_arm_start (i : ℕ) : gkParentVal (5+3*i) = 0 := by
  unfold gkParentVal
  rw [if_neg (by omega : 5+3*i ≠ 1), if_neg (by omega : 5+3*i ≠ 2),
      if_neg (by omega : 5+3*i ≠ 3), if_neg (by omega : 5+3*i ≠ 4),
      if_pos (by omega : (5+3*i-5) % 3 = 0)]

end E993Transport
-- VERITYOS ENTRY 138 END

-- VERITYOS ENTRY 139 BEGIN lemma E993Transport.gkParentVal_at_arm_mid 62b6c9486867e12183f33f43c0d60b82fa621d7067d34e08e7d1b7196d6b5563
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
lemma gkParentVal_at_arm_mid (i : ℕ) : gkParentVal (6+3*i) = 5+3*i := by
  unfold gkParentVal
  rw [if_neg (by omega : 6+3*i ≠ 1), if_neg (by omega : 6+3*i ≠ 2),
      if_neg (by omega : 6+3*i ≠ 3), if_neg (by omega : 6+3*i ≠ 4),
      if_neg (by omega : ¬ (6+3*i-5) % 3 = 0)]
  omega

end E993Transport
-- VERITYOS ENTRY 139 END

-- VERITYOS ENTRY 140 BEGIN lemma E993Transport.gkParentVal_at_arm_tip 9937b62fccba9cc5bc09a837026c5de22c45a8e8505c34c53438d92db6fbcf40
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
lemma gkParentVal_at_arm_tip (i : ℕ) : gkParentVal (7+3*i) = 6+3*i := by
  unfold gkParentVal
  rw [if_neg (by omega : 7+3*i ≠ 1), if_neg (by omega : 7+3*i ≠ 2),
      if_neg (by omega : 7+3*i ≠ 3), if_neg (by omega : 7+3*i ≠ 4),
      if_neg (by omega : ¬ (7+3*i-5) % 3 = 0)]
  omega

end E993Transport
-- VERITYOS ENTRY 140 END

-- VERITYOS ENTRY 141 BEGIN lemma E993Transport.gkChildEdge_range 0dc22a77cb5717c2a93e25f72f7c47ef3910c85765435a7e60f4bbce6e89616a
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- the range of the child–parent map is exactly the edge set of `G_k`. -/
lemma gkChildEdge_range (k : ℕ) :
    Set.range (gkChildEdge k) = (gkGraph k).edgeSet := by
  ext e
  refine ⟨?_, ?_⟩
  · rintro ⟨⟨v, hv⟩, rfl⟩
    show s(v, gkParent k v) ∈ (gkGraph k).edgeSet
    rw [SimpleGraph.mem_edgeSet]
    exact gkGraph_adj_parent k v hv
  · refine Sym2.inductionOn e (fun a b hab => ?_)
    rw [SimpleGraph.mem_edgeSet, gkGraph_adj_iff_val] at hab
    have core : ∀ a b : Fin (3*k+5),
        ((a.val = 0 ∧ b.val = 1) ∨ (a.val = 0 ∧ b.val = 2) ∨ (a.val = 2 ∧ b.val = 3) ∨
          (a.val = 2 ∧ b.val = 4) ∨
          ∃ i < k, (a.val = 0 ∧ b.val = 5+3*i) ∨ (a.val = 5+3*i ∧ b.val = 6+3*i) ∨
            (a.val = 6+3*i ∧ b.val = 7+3*i)) →
        ∃ v : {v : Fin (3*k+5) // v.val ≠ 0}, gkChildEdge k v = s(a, b) := by
      intro a b hc
      have hbne : b.val ≠ 0 := by
        rcases hc with h|h|h|h|⟨i,hi,h|h|h⟩ <;> omega
      refine ⟨⟨b, hbne⟩, ?_⟩
      show s(b, gkParent k b) = s(a, b)
      have haeq : gkParent k b = a := by
        apply Fin.ext
        show (gkVertex k (gkParentVal b.val)).val = a.val
        rcases hc with h|h|h|h|⟨i,hi,h|h|h⟩
        · rw [h.2, gkParentVal_at_one, gkVertex_val k 0 (by omega)]; omega
        · rw [h.2, gkParentVal_at_two, gkVertex_val k 0 (by omega)]; omega
        · rw [h.2, gkParentVal_at_three, gkVertex_val k 2 (by omega)]; omega
        · rw [h.2, gkParentVal_at_four, gkVertex_val k 2 (by omega)]; omega
        · rw [h.2, gkParentVal_at_arm_start, gkVertex_val k 0 (by omega)]; omega
        · rw [h.2, gkParentVal_at_arm_mid, gkVertex_val k (5+3*i) (by omega)]; omega
        · rw [h.2, gkParentVal_at_arm_tip, gkVertex_val k (6+3*i) (by omega)]; omega
      rw [haeq, Sym2.eq_iff]; tauto
    rcases hab with h | h
    · exact core a b h
    · obtain ⟨v, hv⟩ := core b a h
      exact ⟨v, by rw [hv, Sym2.eq_swap]⟩

end E993Transport
-- VERITYOS ENTRY 141 END

-- VERITYOS ENTRY 142 BEGIN lemma E993Transport.gkGraph_card_nonroot eed24d260b73af98e38930dd483769abb2e41a12edfa6062b2f1898ebe4e883d
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- exactly one non-root vertex fewer than the whole vertex set. -/
lemma gkGraph_card_nonroot (k : ℕ) :
    Fintype.card {v : Fin (3*k+5) // v.val ≠ 0} + 1 = Fintype.card (Fin (3*k+5)) := by
  have hbij : {v : Fin (3*k+5) // v.val ≠ 0} ≃ {v : Fin (3*k+5) // v ≠ gkVertex k 0} :=
    Equiv.subtypeEquivRight (fun v => by
      constructor
      · intro hv hcontra; exact hv ((eq_gkVertex_iff k 0 (by omega) v).mp hcontra)
      · intro hv hcontra; exact hv ((eq_gkVertex_iff k 0 (by omega) v).mpr hcontra))
  rw [Fintype.card_congr hbij, Fintype.card_subtype_compl (fun v => v = gkVertex k 0),
      Fintype.card_subtype_eq, Fintype.card_fin]
  omega

end E993Transport
-- VERITYOS ENTRY 142 END

-- VERITYOS ENTRY 143 BEGIN lemma E993Transport.gkGraph_isTree 3017121f93f92220c6b1c0a2a788f3c7c64866976e881a67876e34d18930deaf
namespace E993Transport

-- r30 C5-LA1 node N1 (tree layer): authored by seat U1 (Claude Sonnet 5), r30 Cycle 5 scratch
-- `Main.lean` 05c24dda…; re-authored as a registrar entry by the C5-LA1 formalizer (`theorem` → `lemma`).
/-- `G_k` is a tree: connected (`gkGraph_connected`) with exactly `3k+4` edges on `3k+5`
vertices (the child–parent bijection `gkChildEdge`, `gkChildEdge_injective`, `gkChildEdge_range`). -/
lemma gkGraph_isTree (k : ℕ) : (gkGraph k).IsTree := by
  rw [SimpleGraph.isTree_iff_connected_and_card]
  refine ⟨gkGraph_connected k, ?_⟩
  rw [← gkChildEdge_range, Nat.card_range_of_injective (gkChildEdge_injective k)]
  rw [Nat.card_eq_fintype_card, Nat.card_eq_fintype_card]
  exact gkGraph_card_nonroot k

end E993Transport
-- VERITYOS ENTRY 143 END

-- VERITYOS ENTRY 144 BEGIN lemma E993Transport.card_indep_powersetCard_union_eq_sum_choose 3d742e4889048b9df4db6c2a48834ee64fe05aaa021739cc5db3d4a33229b8f7
namespace E993Transport

open SimpleGraph

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- (N4a, generic fibre count) If the ground set `K ∪ E` splits into two independent sets, every `w ∈ K` has exactly
`d` neighbours in `E`, and no member of `E` has two neighbours in `K`, then the independent `j`-subsets of `K ∪ E`
number `Σ_{i ≤ j} C(|K|, i)·C(|E| − d·i, j − i)` (fibre over `S ∩ K`; the free part is any subset of the
non-neighbours in `E`). -/
lemma card_indep_powersetCard_union_eq_sum_choose {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (K E : Finset V) (d j : ℕ)
    (hKE : Disjoint K E)
    (hK : ∀ u ∈ K, ∀ w ∈ K, ¬ G.Adj u w)
    (hE : ∀ u ∈ E, ∀ w ∈ E, ¬ G.Adj u w)
    (hd : ∀ w ∈ K, (E.filter (G.Adj w)).card = d)
    (hdisj : ∀ w ∈ K, ∀ w' ∈ K, w ≠ w' → ∀ v ∈ E, G.Adj w v → ¬ G.Adj w' v) :
    (((K ∪ E).powersetCard j).filter fun s : Finset V => G.IsIndepSet (s : Set V)).card =
      ∑ i ∈ Finset.range (j + 1), K.card.choose i * (E.card - d * i).choose (j - i) := by
  set Fam := ((K ∪ E).powersetCard j).filter fun s : Finset V => G.IsIndepSet (s : Set V)
    with hFam
  have hmaps : (Fam : Set (Finset V)).MapsTo (fun S => S ∩ K) (K.powerset : Set (Finset V)) := by
    intro S _
    rw [Finset.mem_coe, Finset.mem_powerset]
    exact Finset.inter_subset_right
  rw [Finset.card_eq_sum_card_fiberwise hmaps]
  have hfiber : ∀ M ∈ K.powerset, (Fam.filter fun S => S ∩ K = M).card =
      if M.card ≤ j then (E.card - d * M.card).choose (j - M.card) else 0 := by
    intro M hM
    rw [Finset.mem_powerset] at hM
    by_cases hMj : M.card ≤ j
    · rw [if_pos hMj]
      set Fr := E.filter (fun v => ∀ w ∈ M, ¬ G.Adj w v) with hFr
      have hFrcard : Fr.card = E.card - d * M.card := by
        have hsub : M.biUnion (fun w => E.filter (G.Adj w)) ⊆ E := by
          intro v hv
          rw [Finset.mem_biUnion] at hv
          obtain ⟨w, _, hv⟩ := hv
          exact (Finset.mem_filter.mp hv).1
        have heq : Fr = E \ M.biUnion (fun w => E.filter (G.Adj w)) := by
          ext v
          simp only [hFr, Finset.mem_filter, Finset.mem_sdiff, Finset.mem_biUnion, not_exists,
            not_and]
          constructor
          · rintro ⟨hv, h⟩; exact ⟨hv, fun w hw _ => h w hw⟩
          · rintro ⟨hv, h⟩; exact ⟨hv, fun w hw hadj => h w hw hv hadj⟩
        have hbu : (M.biUnion (fun w => E.filter (G.Adj w))).card = d * M.card := by
          rw [Finset.card_biUnion]
          · rw [Finset.sum_congr rfl (fun w hw => hd w (hM hw)), Finset.sum_const, smul_eq_mul,
              mul_comm]
          · intro w hw w' hw' hne
            rw [Function.onFun, Finset.disjoint_left]
            intro v hv hv'
            rw [Finset.mem_filter] at hv hv'
            exact hdisj w (hM hw) w' (hM hw') hne v hv.1 hv.2 hv'.2
        rw [heq, Finset.card_sdiff_of_subset hsub, hbu]
      rw [← hFrcard, ← Finset.card_powersetCard]
      have hFrE : Fr ⊆ E := Finset.filter_subset _ _
      have hMFr : Disjoint M Fr := Finset.disjoint_of_subset_left hM
        (Finset.disjoint_of_subset_right hFrE hKE)
      refine Finset.card_nbij' (fun S => S \ M) (fun T => M ∪ T) ?_ ?_ ?_ ?_
      · intro S hS
        rw [Finset.mem_coe, Finset.mem_filter, hFam, Finset.mem_filter,
          Finset.mem_powersetCard] at hS
        obtain ⟨⟨⟨hSKE, hScard⟩, hSind⟩, hSM⟩ := hS
        have hMS : M ⊆ S := by rw [← hSM]; exact Finset.inter_subset_left
        rw [Finset.mem_coe, Finset.mem_powersetCard]
        refine ⟨?_, ?_⟩
        · intro v hv
          rw [Finset.mem_sdiff] at hv
          have hvKE := hSKE hv.1
          have hvK : v ∉ K := by
            intro hvK
            exact hv.2 (hSM ▸ Finset.mem_inter.mpr ⟨hv.1, hvK⟩)
          have hvE : v ∈ E := by
            rcases Finset.mem_union.mp hvKE with h | h
            · exact absurd h hvK
            · exact h
          rw [hFr, Finset.mem_filter]
          refine ⟨hvE, fun w hw hadj => ?_⟩
          have hwS := hMS hw
          have hne : w ≠ v := fun h => hv.2 (h ▸ hw)
          exact hSind (Finset.mem_coe.mpr hwS) (Finset.mem_coe.mpr hv.1) hne hadj
        · rw [Finset.card_sdiff_of_subset hMS, hScard]
      · intro T hT
        rw [Finset.mem_coe, Finset.mem_powersetCard] at hT
        obtain ⟨hTFr, hTcard⟩ := hT
        have hMT : Disjoint M T := Finset.disjoint_of_subset_right hTFr hMFr
        rw [Finset.mem_coe, Finset.mem_filter, hFam, Finset.mem_filter, Finset.mem_powersetCard]
        refine ⟨⟨⟨?_, ?_⟩, ?_⟩, ?_⟩
        · exact Finset.union_subset_union hM (hTFr.trans hFrE)
        · rw [Finset.card_union_of_disjoint hMT, hTcard]; omega
        · intro u hu w hw hne hadj
          rw [Finset.coe_union, Set.mem_union, Finset.mem_coe, Finset.mem_coe] at hu hw
          rcases hu with hu | hu <;> rcases hw with hw | hw
          · exact hK u (hM hu) w (hM hw) hadj
          · have := (Finset.mem_filter.mp (hTFr hw)).2 u hu
            exact this hadj
          · have := (Finset.mem_filter.mp (hTFr hu)).2 w hw
            exact this hadj.symm
          · exact hE u (hFrE (hTFr hu)) w (hFrE (hTFr hw)) hadj
        · rw [Finset.union_inter_distrib_right, Finset.inter_eq_left.mpr hM]
          have : T ∩ K = ∅ := by
            rw [← Finset.disjoint_iff_inter_eq_empty]
            exact Finset.disjoint_of_subset_left (hTFr.trans hFrE) hKE.symm
          rw [this, Finset.union_empty]
      · intro S hS
        rw [Finset.mem_coe, Finset.mem_filter] at hS
        have hMS : M ⊆ S := by rw [← hS.2]; exact Finset.inter_subset_left
        exact Finset.union_sdiff_of_subset hMS
      · intro T hT
        rw [Finset.mem_coe, Finset.mem_powersetCard] at hT
        have hMT : Disjoint M T := Finset.disjoint_of_subset_right hT.1 hMFr
        exact Finset.union_sdiff_cancel_left hMT
    · rw [if_neg hMj, Finset.card_eq_zero, Finset.filter_eq_empty_iff]
      intro S hS hSM
      rw [hFam, Finset.mem_filter, Finset.mem_powersetCard] at hS
      have hMS : M ⊆ S := by rw [← hSM]; exact Finset.inter_subset_left
      have := Finset.card_le_card hMS
      omega
  rw [Finset.sum_congr rfl hfiber]
  rw [Finset.sum_powerset_apply_card
    (fun i => if i ≤ j then (E.card - d * i).choose (j - i) else 0)]
  simp only [smul_eq_mul, mul_ite, mul_zero]
  rw [← Finset.sum_filter]
  apply Finset.sum_subset
  · intro i hi
    rw [Finset.mem_filter, Finset.mem_range] at hi
    rw [Finset.mem_range]; omega
  · intro i hi hni
    rw [Finset.mem_filter, Finset.mem_range, not_and_or] at hni
    rw [Finset.mem_range] at hi
    rcases hni with h | h
    · rw [Nat.choose_eq_zero_of_lt (by omega), zero_mul]
    · omega

end E993Transport
-- VERITYOS ENTRY 144 END

-- VERITYOS ENTRY 145 BEGIN lemma E993Transport.card_indep_powersetCard_succ_mem_eq_card_indep_nonNeighbors 76b9ef190df3cc8da1e812cca7ba6a4d60894e52ce328b547e34f3b5cb531391
namespace E993Transport

open SimpleGraph

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- (N4a, generic) independent `(j+1)`-sets containing `v` correspond (erase `v` / insert `v`) to independent
`j`-sets of non-neighbours of `v` other than `v`. -/
lemma card_indep_powersetCard_succ_mem_eq_card_indep_nonNeighbors {V : Type*} [Fintype V]
    [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (j : ℕ) :
    ((((Finset.univ : Finset V).powersetCard (j + 1)).filter
        fun s : Finset V => G.IsIndepSet (s : Set V)).filter fun s => v ∈ s).card =
      (((Finset.univ.filter fun u => u ≠ v ∧ ¬ G.Adj v u).powersetCard j).filter
        fun s : Finset V => G.IsIndepSet (s : Set V)).card := by
  refine Finset.card_nbij' (fun S => S.erase v) (fun T => insert v T) ?_ ?_ ?_ ?_
  · intro S hS
    rw [Finset.mem_coe, Finset.mem_filter, Finset.mem_filter, Finset.mem_powersetCard] at hS
    obtain ⟨⟨⟨_, hcard⟩, hind⟩, hv⟩ := hS
    rw [Finset.mem_coe, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro u hu
      rw [Finset.mem_erase] at hu
      rw [Finset.mem_filter]
      exact ⟨Finset.mem_univ _, hu.1, fun hadj =>
        hind (Finset.mem_coe.mpr hv) (Finset.mem_coe.mpr hu.2) (Ne.symm hu.1) hadj⟩
    · rw [Finset.card_erase_of_mem hv, hcard, Nat.add_sub_cancel]
    · intro x hx y hy hne
      rw [Finset.coe_erase] at hx hy
      exact hind hx.1 hy.1 hne
  · intro T hT
    rw [Finset.mem_coe, Finset.mem_filter, Finset.mem_powersetCard] at hT
    obtain ⟨⟨hsub, hcard⟩, hind⟩ := hT
    have hvT : v ∉ T := fun h => (Finset.mem_filter.mp (hsub h)).2.1 rfl
    rw [Finset.mem_coe, Finset.mem_filter, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨⟨Finset.subset_univ _, ?_⟩, ?_⟩, Finset.mem_insert_self _ _⟩
    · rw [Finset.card_insert_of_notMem hvT, hcard]
    · intro x hx y hy hne hadj
      rw [Finset.coe_insert, Set.mem_insert_iff, Finset.mem_coe] at hx hy
      rcases hx with rfl | hx <;> rcases hy with rfl | hy
      · exact hne rfl
      · exact (Finset.mem_filter.mp (hsub hy)).2.2 hadj
      · exact (Finset.mem_filter.mp (hsub hx)).2.2 hadj.symm
      · exact hind (Finset.mem_coe.mpr hx) (Finset.mem_coe.mpr hy) hne hadj
  · intro S hS
    rw [Finset.mem_coe, Finset.mem_filter] at hS
    exact Finset.insert_erase hS.2
  · intro T hT
    rw [Finset.mem_coe, Finset.mem_filter, Finset.mem_powersetCard] at hT
    have hvT : v ∉ T := fun h => (Finset.mem_filter.mp (hT.1.1 h)).2.1 rfl
    exact Finset.erase_insert hvT

end E993Transport
-- VERITYOS ENTRY 145 END

-- VERITYOS ENTRY 146 BEGIN lemma E993Transport.indep_powersetCard_filter_notMem_eq c7670c7a11998cf46b6f8ef22436ae25baf2444c1b9417517247842cadbfb8af
namespace E993Transport

open SimpleGraph

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- (N4a, generic) independent `j`-sets avoiding `v` are the independent `j`-subsets of `univ.erase v`. -/
lemma indep_powersetCard_filter_notMem_eq {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (j : ℕ) :
    (((Finset.univ : Finset V).powersetCard j).filter
        fun s : Finset V => G.IsIndepSet (s : Set V)).filter (fun s => ¬ v ∈ s) =
      ((Finset.univ.erase v).powersetCard j).filter
        fun s : Finset V => G.IsIndepSet (s : Set V) := by
  ext S
  have h : S ⊆ Finset.univ.erase v ↔ v ∉ S := by
    constructor
    · intro hS hv; exact (Finset.mem_erase.mp (hS hv)).1 rfl
    · intro hv u hu; exact Finset.mem_erase.mpr ⟨fun h => hv (h ▸ hu), Finset.mem_univ _⟩
  simp only [Finset.mem_filter, Finset.mem_powersetCard, Finset.subset_univ, true_and, h]
  tauto

end E993Transport
-- VERITYOS ENTRY 146 END

-- VERITYOS ENTRY 147 BEGIN lemma E993Transport.mul_choose_le_choose_add_succ 9a85159239f26d1f87a64737b7e1de42d23c0c43d1bafd3ee5595f82e0811d5f
namespace E993Transport

-- r30 C5-LA1 node N4b (inequality): C-U1-F's elementary binomial-row chain (critic, Claude Opus 5.5), in integer form;
-- row pairing and integer closing step authored in-run by the C5-LA1 formalizer (Claude Opus 5.5) (Newton's route not used).
/-- `t·C(N, r) ≤ C(N + t, r + 1)` (Pascal's rule, induction on `t`; no Vandermonde, no `Polynomial`). -/
lemma mul_choose_le_choose_add_succ (N r t : ℕ) : t * N.choose r ≤ (N + t).choose (r + 1) := by
  induction t with
  | zero => simp
  | succ t ih =>
    rw [← Nat.add_assoc, Nat.choose_succ_succ', Nat.succ_mul]
    have := Nat.choose_le_choose r (Nat.le_add_right N t)
    omega

end E993Transport
-- VERITYOS ENTRY 147 END

-- VERITYOS ENTRY 148 BEGIN lemma E993Transport.choose_two_mul_succ_add_choose_le_choose_two_mul_add_three fe88dfeb53c5b8aabf49c74589de7db1503b10f954615ddb2930160bef5b2d59
namespace E993Transport

-- r30 C5-LA1 node N4b (inequality): C-U1-F's elementary binomial-row chain (critic, Claude Opus 5.5), in integer form;
-- row pairing and integer closing step authored in-run by the C5-LA1 formalizer (Claude Opus 5.5) (Newton's route not used).
/-- (N4b, integer closing step) for `r + 3 ≤ N`: `C(2N, r+1) + C(N, r) ≤ C(2N, r+3)`, from
`(r+3)(r+2)·C(2N,r+3) = (2N−r−1)(2N−r−2)·C(2N,r+1)` and `N·C(N,r) ≤ C(2N,r+1)`. -/
lemma choose_two_mul_succ_add_choose_le_choose_two_mul_add_three (N r : ℕ) (h : r + 3 ≤ N) :
    (2 * N).choose (r + 1) + N.choose r ≤ (2 * N).choose (r + 3) := by
  have h1 := Nat.choose_succ_right_eq (2 * N) (r + 1)
  have h2 := Nat.choose_succ_right_eq (2 * N) (r + 2)
  have hV : N * N.choose r ≤ (2 * N).choose (r + 1) := by
    have := mul_choose_le_choose_add_succ N r N
    rwa [← two_mul] at this
  obtain ⟨a, ha⟩ : ∃ a, 2 * N = a + r + 2 := ⟨2 * N - r - 2, by omega⟩
  have e1 : 2 * N - (r + 1) = a + 1 := by omega
  have e2 : 2 * N - (r + 2) = a := by omega
  rw [e1] at h1
  rw [e2] at h2
  set X := (2 * N).choose (r + 1)
  set W := (2 * N).choose (r + 2)
  set Y := (2 * N).choose (r + 3)
  set Z := N.choose r
  have hY : Y * ((r + 3) * (r + 2)) = X * ((a + 1) * a) := by
    calc Y * ((r + 3) * (r + 2)) = (Y * (r + 3)) * (r + 2) := by ring
      _ = W * a * (r + 2) := by rw [h2]
      _ = (W * (r + 2)) * a := by ring
      _ = X * (a + 1) * a := by rw [h1]
      _ = X * ((a + 1) * a) := by ring
  have hA : (r + 3) * (r + 2) + 2 * (2 * N + 1) ≤ (a + 1) * a := by nlinarith
  have hB : (r + 3) * (r + 2) ≤ N * (2 * (2 * N + 1)) := by nlinarith
  have hC : Z * ((r + 3) * (r + 2)) ≤ X * (2 * (2 * N + 1)) := by
    calc Z * ((r + 3) * (r + 2)) ≤ Z * (N * (2 * (2 * N + 1))) := Nat.mul_le_mul_left _ hB
      _ = (N * Z) * (2 * (2 * N + 1)) := by ring
      _ ≤ X * (2 * (2 * N + 1)) := Nat.mul_le_mul_right _ hV
  apply Nat.le_of_mul_le_mul_right (c := (r + 3) * (r + 2)) _ (by positivity)
  rw [hY]
  calc (X + Z) * ((r + 3) * (r + 2)) = X * ((r + 3) * (r + 2)) + Z * ((r + 3) * (r + 2)) := by
        ring
    _ ≤ X * ((r + 3) * (r + 2)) + X * (2 * (2 * N + 1)) := Nat.add_le_add_left hC _
    _ = X * ((r + 3) * (r + 2) + 2 * (2 * N + 1)) := by ring
    _ ≤ X * ((a + 1) * a) := Nat.mul_le_mul_left _ hA

end E993Transport
-- VERITYOS ENTRY 148 END

-- VERITYOS ENTRY 149 BEGIN lemma E993Transport.gkHalfCount_eq_sum_range f8a97885064f8f8aef93f13ce73b388e970577fe8e781f3fe837174cdc7e0288
namespace E993Transport

-- r30 C5-LA1 node N4b (inequality): C-U1-F's elementary binomial-row chain (critic, Claude Opus 5.5), in integer form;
-- row pairing and integer closing step authored in-run by the C5-LA1 formalizer (Claude Opus 5.5) (Newton's route not used).
/-- `u_m` as one sum over `l ≤ m` of the paired rows `C(k+1,l)·C(2(k+1−l), m−l)` and `[l < m]·C(k,l)·C(k−l+1, m−l−1)`. -/
lemma gkHalfCount_eq_sum_range (k m : ℕ) :
    gkHalfCount k m = ∑ l ∈ Finset.range (m + 1),
      ((k + 1).choose l * (2 * (k + 1 - l)).choose (m - l) +
        if l < m then k.choose l * (k - l + 1).choose (m - l - 1) else 0) := by
  rw [Finset.sum_add_distrib, gkHalfCount, Finset.sum_range_succ (fun l => if l < m then _ else 0),
    if_neg (lt_irrefl m), add_zero]
  congr 1
  apply Finset.sum_congr rfl
  intro l hl
  rw [if_pos (Finset.mem_range.mp hl)]

end E993Transport
-- VERITYOS ENTRY 149 END

-- VERITYOS ENTRY 150 BEGIN lemma E993Transport.gkHalfCount_le_gkHalfCount_add_two 7a9dfb8b41ea4fd57fa0a20715528ec6fbb0a633f37d952a7ec278fe8ca722eb
namespace E993Transport

-- r30 C5-LA1 node N4b (inequality): C-U1-F's elementary binomial-row chain (critic, Claude Opus 5.5), in integer form;
-- row pairing and integer closing step authored in-run by the C5-LA1 formalizer (Claude Opus 5.5) (Newton's route not used).
/-- (N4b) `u_j ≤ u_{j+2}` whenever `j + 2 ≤ k + 1` (GK-MONO's inequality `u_m ≥ u_{m−2}`, `2 ≤ m ≤ k+1`; the case
`m = 1` is `u_1 ≥ 0`). -/
lemma gkHalfCount_le_gkHalfCount_add_two (k j : ℕ) (hj : j + 2 ≤ k + 1) :
    gkHalfCount k j ≤ gkHalfCount k (j + 2) := by
  rw [gkHalfCount_eq_sum_range, gkHalfCount_eq_sum_range]
  calc _ ≤ ∑ l ∈ Finset.range (j + 1),
        ((k + 1).choose l * (2 * (k + 1 - l)).choose (j + 2 - l) +
          if l < j + 2 then k.choose l * (k - l + 1).choose (j + 2 - l - 1) else 0) := by
        apply Finset.sum_le_sum
        intro l hl
        rw [Finset.mem_range] at hl
        rw [if_pos (by omega : l < j + 2)]
        obtain ⟨r, rfl⟩ : ∃ r, j = l + r := ⟨j - l, by omega⟩
        set N := k + 1 - l with hN
        have e1 : k - l + 1 = N := by omega
        have e2 : l + r + 2 - l = r + 2 := by omega
        have e3 : r + 2 - 1 = r + 1 := by omega
        have e4 : l + r - l = r := by omega
        have hkl : k.choose l ≤ (k + 1).choose l := Nat.choose_le_choose l (Nat.le_succ k)
        rw [e1, e2, e3, e4]
        rcases r with _ | r
        · rw [if_neg (by omega), add_zero, Nat.choose_zero_right, mul_one]
          have : 1 ≤ (2 * N).choose 2 := Nat.choose_pos (by omega)
          calc (k + 1).choose l ≤ (k + 1).choose l * (2 * N).choose (0 + 2) := by
                simpa using Nat.le_mul_of_pos_right _ this
            _ ≤ _ := Nat.le_add_right _ _
        · rw [if_pos (by omega), (by omega : r + 1 - 1 = r)]
          have hkey := choose_two_mul_succ_add_choose_le_choose_two_mul_add_three N r (by omega)
          calc (k + 1).choose l * (2 * N).choose (r + 1) + k.choose l * N.choose r
              ≤ (k + 1).choose l * (2 * N).choose (r + 1) + (k + 1).choose l * N.choose r :=
                Nat.add_le_add_left (Nat.mul_le_mul_right _ hkl) _
            _ = (k + 1).choose l * ((2 * N).choose (r + 1) + N.choose r) := by ring
            _ ≤ (k + 1).choose l * (2 * N).choose (r + 1 + 2) := Nat.mul_le_mul_left _ hkey
            _ ≤ _ := Nat.le_add_right _ _
    _ ≤ _ := by
        apply Finset.sum_le_sum_of_subset
        intro l hl
        rw [Finset.mem_range] at hl ⊢
        omega

end E993Transport
-- VERITYOS ENTRY 150 END

-- VERITYOS ENTRY 151 BEGIN lemma E993Transport.gkGraph_adj_iff_val_mod 6227f123afae458949c6f4fb53d870d9c408f9a16a9bb0c266e70835c5760f7b
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- adjacency of `G_k` read on labels without an existential: arm labels `a_i ≡ 2`, `b_i ≡ 0`, `c_i ≡ 1 (mod 3)`. -/
lemma gkGraph_adj_iff_val_mod (k : ℕ) (u v : Fin (3*k+5)) :
    (gkGraph k).Adj u v ↔
      ((u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3) ∨
        (u.val = 2 ∧ v.val = 4) ∨ (u.val = 0 ∧ 5 ≤ v.val ∧ v.val % 3 = 2) ∨
        (5 ≤ u.val ∧ u.val % 3 = 2 ∧ v.val = u.val + 1) ∨
        (6 ≤ u.val ∧ u.val % 3 = 0 ∧ v.val = u.val + 1)) ∨
      ((v.val = 0 ∧ u.val = 1) ∨ (v.val = 0 ∧ u.val = 2) ∨ (v.val = 2 ∧ u.val = 3) ∨
        (v.val = 2 ∧ u.val = 4) ∨ (v.val = 0 ∧ 5 ≤ u.val ∧ u.val % 3 = 2) ∨
        (5 ≤ v.val ∧ v.val % 3 = 2 ∧ u.val = v.val + 1) ∨
        (6 ≤ v.val ∧ v.val % 3 = 0 ∧ u.val = v.val + 1)) := by
  have fwd : ∀ x y : ℕ,
      ((x = 0 ∧ y = 1) ∨ (x = 0 ∧ y = 2) ∨ (x = 2 ∧ y = 3) ∨ (x = 2 ∧ y = 4) ∨
        ∃ i < k, (x = 0 ∧ y = 5+3*i) ∨ (x = 5+3*i ∧ y = 6+3*i) ∨ (x = 6+3*i ∧ y = 7+3*i)) →
      ((x = 0 ∧ y = 1) ∨ (x = 0 ∧ y = 2) ∨ (x = 2 ∧ y = 3) ∨ (x = 2 ∧ y = 4) ∨
        (x = 0 ∧ 5 ≤ y ∧ y % 3 = 2) ∨ (5 ≤ x ∧ x % 3 = 2 ∧ y = x + 1) ∨
        (6 ≤ x ∧ x % 3 = 0 ∧ y = x + 1)) := by
    intro x y h
    rcases h with h | h | h | h | ⟨i, _, h | h | h⟩ <;> omega
  have bwd : ∀ x y : ℕ, x < 3*k+5 → y < 3*k+5 →
      ((x = 0 ∧ y = 1) ∨ (x = 0 ∧ y = 2) ∨ (x = 2 ∧ y = 3) ∨ (x = 2 ∧ y = 4) ∨
        (x = 0 ∧ 5 ≤ y ∧ y % 3 = 2) ∨ (5 ≤ x ∧ x % 3 = 2 ∧ y = x + 1) ∨
        (6 ≤ x ∧ x % 3 = 0 ∧ y = x + 1)) →
      ((x = 0 ∧ y = 1) ∨ (x = 0 ∧ y = 2) ∨ (x = 2 ∧ y = 3) ∨ (x = 2 ∧ y = 4) ∨
        ∃ i < k, (x = 0 ∧ y = 5+3*i) ∨ (x = 5+3*i ∧ y = 6+3*i) ∨ (x = 6+3*i ∧ y = 7+3*i)) := by
    intro x y hx hy h
    rcases h with h | h | h | h | h | h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨(y - 5) / 3, by omega, Or.inl (by omega)⟩)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨(x - 5) / 3, by omega, Or.inr (Or.inl (by omega))⟩)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨(x - 6) / 3, by omega, Or.inr (Or.inr (by omega))⟩)))
  rw [gkGraph_adj_iff_val]
  constructor
  · rintro (h | h)
    · exact Or.inl (fwd _ _ h)
    · exact Or.inr (fwd _ _ h)
  · rintro (h | h)
    · exact Or.inl (bwd _ _ u.isLt v.isLt h)
    · exact Or.inr (bwd _ _ v.isLt u.isLt h)

end E993Transport
-- VERITYOS ENTRY 151 END

-- VERITYOS ENTRY 152 BEGIN lemma E993Transport.mem_gkArmMiddles_iff c9ee5eff2c96151f28b197ba66d87120dd8a81a8aff47813cc3c78969bf936b8
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the arm middles are the labels `≥ 6` divisible by `3`. -/
lemma mem_gkArmMiddles_iff (k : ℕ) (v : Fin (3*k+5)) :
    v ∈ gkArmMiddles k ↔ 6 ≤ v.val ∧ v.val % 3 = 0 := by
  have hv := v.isLt
  rw [gkArmMiddles, Finset.mem_image]
  constructor
  · rintro ⟨i, hi, rfl⟩
    rw [Finset.mem_range] at hi
    rw [gkVertex_val k _ (by omega)]
    omega
  · intro h
    refine ⟨(v.val - 6) / 3, Finset.mem_range.mpr (by omega), ?_⟩
    exact ((eq_gkVertex_iff k _ (by omega) v).mpr (by omega)).symm

end E993Transport
-- VERITYOS ENTRY 152 END

-- VERITYOS ENTRY 153 BEGIN lemma E993Transport.mem_gkMiddles_iff f1d2604b14ac7a497cdd050b07cc8d9d454e622806d69ec7f3dec7c6c9440b11
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the middles are `2` and the arm middles. -/
lemma mem_gkMiddles_iff (k : ℕ) (v : Fin (3*k+5)) :
    v ∈ gkMiddles k ↔ v.val = 2 ∨ (6 ≤ v.val ∧ v.val % 3 = 0) := by
  rw [gkMiddles, Finset.mem_insert, mem_gkArmMiddles_iff, eq_gkVertex_iff k 2 (by omega)]

end E993Transport
-- VERITYOS ENTRY 153 END

-- VERITYOS ENTRY 154 BEGIN lemma E993Transport.mem_gkFarLeaves_iff ae89cae29f3304e53b72db19cccaca5f66497054e4fa609defa73318bbf65bea
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the far leaves are `3`, `4` and the arm tips (labels `≥ 7`, `≡ 1 mod 3`). -/
lemma mem_gkFarLeaves_iff (k : ℕ) (v : Fin (3*k+5)) :
    v ∈ gkFarLeaves k ↔ v.val = 3 ∨ v.val = 4 ∨ (7 ≤ v.val ∧ v.val % 3 = 1) := by
  have hv := v.isLt
  rw [gkFarLeaves, Finset.mem_insert, Finset.mem_insert, Finset.mem_image,
    eq_gkVertex_iff k 3 (by omega), eq_gkVertex_iff k 4 (by omega)]
  constructor
  · rintro (h | h | ⟨i, hi, rfl⟩)
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · rw [Finset.mem_range] at hi
      rw [gkVertex_val k _ (by omega)]
      omega
  · rintro (h | h | h)
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · refine Or.inr (Or.inr ⟨(v.val - 7) / 3, Finset.mem_range.mpr (by omega), ?_⟩)
      exact ((eq_gkVertex_iff k _ (by omega) v).mpr (by omega)).symm

end E993Transport
-- VERITYOS ENTRY 154 END

-- VERITYOS ENTRY 155 BEGIN lemma E993Transport.card_gkArmMiddles 348bfff411c77ed52e06aeff153a28a5431aa1725974bd61ebaa559d17de30b7
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- there are `k` arm middles. -/
lemma card_gkArmMiddles (k : ℕ) : (gkArmMiddles k).card = k := by
  rw [gkArmMiddles, Finset.card_image_of_injOn, Finset.card_range]
  intro i hi i' hi' h
  rw [Finset.coe_range, Set.mem_Iio] at hi hi'
  have := congrArg Fin.val h
  simp only at this
  rw [gkVertex_val k _ (by omega), gkVertex_val k _ (by omega)] at this
  omega

end E993Transport
-- VERITYOS ENTRY 155 END

-- VERITYOS ENTRY 156 BEGIN lemma E993Transport.card_gkMiddles 2992ddeaf5b8e8bcbda558c46a06c9f85f9507fd0a2c93b040cc5375031300c2
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- there are `k + 1` middles. -/
lemma card_gkMiddles (k : ℕ) : (gkMiddles k).card = k + 1 := by
  rw [gkMiddles, Finset.card_insert_of_notMem, card_gkArmMiddles]
  rw [mem_gkArmMiddles_iff, gkVertex_val k 2 (by omega)]
  omega

end E993Transport
-- VERITYOS ENTRY 156 END

-- VERITYOS ENTRY 157 BEGIN lemma E993Transport.card_gkFarLeaves 1ac41c5b89557348244532e74437c9e3b3927a33d035e1b806394a87afd001ea
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- there are `k + 2` far leaves. -/
lemma card_gkFarLeaves (k : ℕ) : (gkFarLeaves k).card = k + 2 := by
  have himg : ((Finset.range k).image fun i => gkVertex k (7 + 3 * i)).card = k := by
    rw [Finset.card_image_of_injOn, Finset.card_range]
    intro i hi i' hi' h
    rw [Finset.coe_range, Set.mem_Iio] at hi hi'
    have := congrArg Fin.val h
    simp only at this
    rw [gkVertex_val k _ (by omega), gkVertex_val k _ (by omega)] at this
    omega
  have h4 : gkVertex k 4 ∉ (Finset.range k).image fun i => gkVertex k (7 + 3 * i) := by
    rw [Finset.mem_image]
    rintro ⟨i, hi, h⟩
    rw [Finset.mem_range] at hi
    have := congrArg Fin.val h
    rw [gkVertex_val k _ (by omega), gkVertex_val k _ (by omega)] at this
    omega
  have h3 : gkVertex k 3 ∉ insert (gkVertex k 4)
      ((Finset.range k).image fun i => gkVertex k (7 + 3 * i)) := by
    rw [Finset.mem_insert, Finset.mem_image, not_or]
    refine ⟨gkVertex_ne k 3 4 (by omega) (by omega) (by omega), ?_⟩
    rintro ⟨i, hi, h⟩
    rw [Finset.mem_range] at hi
    have := congrArg Fin.val h
    rw [gkVertex_val k _ (by omega), gkVertex_val k _ (by omega)] at this
    omega
  rw [gkFarLeaves, Finset.card_insert_of_notMem h3, Finset.card_insert_of_notMem h4, himg]

end E993Transport
-- VERITYOS ENTRY 157 END

-- VERITYOS ENTRY 158 BEGIN lemma E993Transport.gkGraph_adj_root_iff 2a704396a0a6dfc3c688a3a598cf8eaf8b0f3e821274e994e26e58e56c95a9b6
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the neighbours of the root `0` are `1`, `2` and the arm starts `a_i`. -/
lemma gkGraph_adj_root_iff (k : ℕ) (v : Fin (3*k+5)) :
    (gkGraph k).Adj (gkVertex k 0) v ↔ v.val = 1 ∨ v.val = 2 ∨ (5 ≤ v.val ∧ v.val % 3 = 2) := by
  rw [gkGraph_adj_iff_val_mod, gkVertex_val k 0 (by omega)]
  constructor
  · intro h; omega
  · rintro (h | h | h)
    · exact Or.inl (Or.inl ⟨rfl, h⟩)
    · exact Or.inl (Or.inr (Or.inl ⟨rfl, h⟩))
    · exact Or.inl (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ⟨rfl, h.1, h.2⟩)))))

end E993Transport
-- VERITYOS ENTRY 158 END

-- VERITYOS ENTRY 159 BEGIN lemma E993Transport.gkGraph_adj_cherryCentre_iff 2a5b836ee8d1d23be1eea34fe0c081c2a96a6a5682325cfecffef66a57bf97a1
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the neighbours of the cherry centre `2` are `0`, `3`, `4`. -/
lemma gkGraph_adj_cherryCentre_iff (k : ℕ) (w v : Fin (3*k+5)) (hw : w.val = 2) :
    (gkGraph k).Adj w v ↔ v.val = 0 ∨ v.val = 3 ∨ v.val = 4 := by
  rw [gkGraph_adj_iff_val_mod]
  constructor
  · intro h; omega
  · rintro (h | h | h)
    · exact Or.inr (Or.inr (Or.inl ⟨h, hw⟩))
    · exact Or.inl (Or.inr (Or.inr (Or.inl ⟨hw, h⟩)))
    · exact Or.inl (Or.inr (Or.inr (Or.inr (Or.inl ⟨hw, h⟩))))

end E993Transport
-- VERITYOS ENTRY 159 END

-- VERITYOS ENTRY 160 BEGIN lemma E993Transport.gkGraph_adj_armMiddle_iff 67d3abd0dea04ac4ae9af952c8b775c21f7a3989af6d71c87739aa92a0da53e2
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the neighbours of an arm middle `b_i` are `a_i = b_i − 1` and `c_i = b_i + 1`. -/
lemma gkGraph_adj_armMiddle_iff (k : ℕ) (w v : Fin (3*k+5)) (hw : 6 ≤ w.val ∧ w.val % 3 = 0) :
    (gkGraph k).Adj w v ↔ v.val + 1 = w.val ∨ v.val = w.val + 1 := by
  rw [gkGraph_adj_iff_val_mod]
  constructor
  · intro h; omega
  · rintro (h | h)
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
        ⟨by omega, by omega, by omega⟩))))))
    · exact Or.inl (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr ⟨hw.1, hw.2, h⟩))))))

end E993Transport
-- VERITYOS ENTRY 160 END

-- VERITYOS ENTRY 161 BEGIN lemma E993Transport.mem_gkRootFreeEnds_iff 4c125158320dd7a05f38382ce56617091d2c4a85d567252493bcb4c70a50f6bb
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the ends of `G_k − 0`: every non-root vertex that is not a middle (`1`, `3`, `4`, `a_i`, `c_i`). -/
lemma mem_gkRootFreeEnds_iff (k : ℕ) (v : Fin (3*k+5)) :
    v ∈ (Finset.univ.erase (gkVertex k 0)) \ gkMiddles k ↔
      v.val ≠ 0 ∧ ¬ (v.val = 2 ∨ (6 ≤ v.val ∧ v.val % 3 = 0)) := by
  rw [Finset.mem_sdiff, Finset.mem_erase, mem_gkMiddles_iff, ne_eq, eq_gkVertex_iff k 0 (by omega)]
  simp only [Finset.mem_univ, and_true]

end E993Transport
-- VERITYOS ENTRY 161 END

-- VERITYOS ENTRY 162 BEGIN lemma E993Transport.gkMiddles_subset_erase_root 2c513b9e02b22d00e1a0c02748b76f6c44fa19c3abbe4712ad84db30256dc2b3
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the middles avoid the root. -/
lemma gkMiddles_subset_erase_root (k : ℕ) : gkMiddles k ⊆ Finset.univ.erase (gkVertex k 0) := by
  intro v hv
  rw [mem_gkMiddles_iff] at hv
  rw [Finset.mem_erase, ne_eq, eq_gkVertex_iff k 0 (by omega)]
  exact ⟨by omega, Finset.mem_univ _⟩

end E993Transport
-- VERITYOS ENTRY 162 END

-- VERITYOS ENTRY 163 BEGIN lemma E993Transport.card_gkRootFreeEnds 0c7539d4e04b1db28e698a31360d76b950d6de8fcc5ffceab5a52661af350681
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- there are `2k + 3` ends of `G_k − 0`. -/
lemma card_gkRootFreeEnds (k : ℕ) :
    ((Finset.univ.erase (gkVertex k 0)) \ gkMiddles k).card = 2 * k + 3 := by
  rw [Finset.card_sdiff_of_subset (gkMiddles_subset_erase_root k), card_gkMiddles,
    Finset.card_erase_of_mem (Finset.mem_univ _), Finset.card_univ, Fintype.card_fin]
  omega

end E993Transport
-- VERITYOS ENTRY 163 END

-- VERITYOS ENTRY 164 BEGIN lemma E993Transport.gkMiddles_pairwise_nonadj 8c4873068907f09381ab37decaf021278ee6e9d7f519e7dc9f4a63fa3ec3eef1
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the middles are pairwise non-adjacent. -/
lemma gkMiddles_pairwise_nonadj (k : ℕ) :
    ∀ u ∈ gkMiddles k, ∀ w ∈ gkMiddles k, ¬ (gkGraph k).Adj u w := by
  intro u hu w hw h
  rw [mem_gkMiddles_iff] at hu hw
  rw [gkGraph_adj_iff_val_mod] at h
  omega

end E993Transport
-- VERITYOS ENTRY 164 END

-- VERITYOS ENTRY 165 BEGIN lemma E993Transport.gkRootFreeEnds_pairwise_nonadj e874349895395962e81deb187336116c4db82efa8dfe4ec62481c398976c4fc1
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the ends of `G_k − 0` are pairwise non-adjacent (every edge meets the root or a middle). -/
lemma gkRootFreeEnds_pairwise_nonadj (k : ℕ) :
    ∀ u ∈ (Finset.univ.erase (gkVertex k 0)) \ gkMiddles k,
      ∀ w ∈ (Finset.univ.erase (gkVertex k 0)) \ gkMiddles k, ¬ (gkGraph k).Adj u w := by
  intro u hu w hw h
  rw [mem_gkRootFreeEnds_iff] at hu hw
  rw [gkGraph_adj_iff_val_mod] at h
  omega

end E993Transport
-- VERITYOS ENTRY 165 END

-- VERITYOS ENTRY 166 BEGIN lemma E993Transport.card_gkRootFreeEnds_filter_adj 19712c8b769f2ccdd7fe2a957a4800531a6aa6911a5f989d3c43c8d7e1ffacd1
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- each middle has exactly two neighbours among the ends of `G_k − 0`. -/
lemma card_gkRootFreeEnds_filter_adj (k : ℕ) (w : Fin (3*k+5)) (hw : w ∈ gkMiddles k) :
    (((Finset.univ.erase (gkVertex k 0)) \ gkMiddles k).filter ((gkGraph k).Adj w)).card = 2 := by
  have hwl := w.isLt
  rw [mem_gkMiddles_iff] at hw
  rw [Finset.card_eq_two]
  by_cases h2 : w.val = 2
  · refine ⟨gkVertex k 3, gkVertex k 4, gkVertex_ne k 3 4 (by omega) (by omega) (by omega), ?_⟩
    ext v
    have hvl := v.isLt
    rw [Finset.mem_filter, mem_gkRootFreeEnds_iff, gkGraph_adj_cherryCentre_iff k w v h2,
      Finset.mem_insert, Finset.mem_singleton, eq_gkVertex_iff k 3 (by omega),
      eq_gkVertex_iff k 4 (by omega)]
    constructor
    · rintro ⟨h1, h2⟩; omega
    · intro h; exact ⟨by omega, by omega⟩
  · refine ⟨gkVertex k (w.val - 1), gkVertex k (w.val + 1),
      gkVertex_ne k _ _ (by omega) (by omega) (by omega), ?_⟩
    ext v
    have hvl := v.isLt
    rw [Finset.mem_filter, mem_gkRootFreeEnds_iff, gkGraph_adj_armMiddle_iff k w v (by omega),
      Finset.mem_insert, Finset.mem_singleton, eq_gkVertex_iff k _ (by omega),
      eq_gkVertex_iff k _ (by omega)]
    constructor
    · rintro ⟨h1, h2⟩; omega
    · intro h; exact ⟨by omega, by omega⟩

end E993Transport
-- VERITYOS ENTRY 166 END

-- VERITYOS ENTRY 167 BEGIN lemma E993Transport.gkMiddles_rootFreeEnds_nbrs_disjoint 4d2f235517fd4ca5156f496611f8ba4043e2b4e2da8488154e252066bacda6aa
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- no end of `G_k − 0` is adjacent to two distinct middles. -/
lemma gkMiddles_rootFreeEnds_nbrs_disjoint (k : ℕ) :
    ∀ w ∈ gkMiddles k, ∀ w' ∈ gkMiddles k, w ≠ w' →
      ∀ v ∈ (Finset.univ.erase (gkVertex k 0)) \ gkMiddles k,
        (gkGraph k).Adj w v → ¬ (gkGraph k).Adj w' v := by
  intro w hw w' hw' hne v hv h h'
  have hne' : w.val ≠ w'.val := fun h => hne (Fin.ext h)
  rw [mem_gkMiddles_iff] at hw hw'
  rw [mem_gkRootFreeEnds_iff] at hv
  rw [gkGraph_adj_iff_val_mod] at h h'
  omega

end E993Transport
-- VERITYOS ENTRY 167 END

-- VERITYOS ENTRY 168 BEGIN lemma E993Transport.gk_root_nonNeighbors_eq 6305266ca625bce06316df4b21a90d0d9bf3b4f9d6208eb4ac574c8c9c7c9c2d
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the vertices other than `0` and not adjacent to `0` are the arm middles and the far leaves. -/
lemma gk_root_nonNeighbors_eq (k : ℕ) :
    (Finset.univ.filter fun u => u ≠ gkVertex k 0 ∧ ¬ (gkGraph k).Adj (gkVertex k 0) u) =
      gkArmMiddles k ∪ gkFarLeaves k := by
  ext v
  have hvl := v.isLt
  rw [Finset.mem_filter, Finset.mem_union, mem_gkArmMiddles_iff, mem_gkFarLeaves_iff,
    gkGraph_adj_root_iff, ne_eq, eq_gkVertex_iff k 0 (by omega)]
  simp only [Finset.mem_univ, true_and]
  constructor
  · rintro ⟨h1, h2⟩; omega
  · intro h; exact ⟨by omega, by omega⟩

end E993Transport
-- VERITYOS ENTRY 168 END

-- VERITYOS ENTRY 169 BEGIN lemma E993Transport.gkArmMiddles_disjoint_gkFarLeaves bc3fa6c330ea7e23e867388e58268ac8f420c1a0e5c67184c5d9d33f5721865b
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- arm middles and far leaves are disjoint. -/
lemma gkArmMiddles_disjoint_gkFarLeaves (k : ℕ) : Disjoint (gkArmMiddles k) (gkFarLeaves k) := by
  rw [Finset.disjoint_left]
  intro v hv hv'
  rw [mem_gkArmMiddles_iff] at hv
  rw [mem_gkFarLeaves_iff] at hv'
  omega

end E993Transport
-- VERITYOS ENTRY 169 END

-- VERITYOS ENTRY 170 BEGIN lemma E993Transport.gkArmMiddles_pairwise_nonadj 124aca95600297687217609732ce6bb5c68e2c29623fe63adda1892554473eab
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the arm middles are pairwise non-adjacent. -/
lemma gkArmMiddles_pairwise_nonadj (k : ℕ) :
    ∀ u ∈ gkArmMiddles k, ∀ w ∈ gkArmMiddles k, ¬ (gkGraph k).Adj u w := by
  intro u hu w hw h
  rw [mem_gkArmMiddles_iff] at hu hw
  rw [gkGraph_adj_iff_val_mod] at h
  omega

end E993Transport
-- VERITYOS ENTRY 170 END

-- VERITYOS ENTRY 171 BEGIN lemma E993Transport.gkFarLeaves_pairwise_nonadj 7735b4ead3bec9ff3664057091cf71d234c2d7909df4ce3fb770df37c9835986
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- the far leaves are pairwise non-adjacent. -/
lemma gkFarLeaves_pairwise_nonadj (k : ℕ) :
    ∀ u ∈ gkFarLeaves k, ∀ w ∈ gkFarLeaves k, ¬ (gkGraph k).Adj u w := by
  intro u hu w hw h
  rw [mem_gkFarLeaves_iff] at hu hw
  rw [gkGraph_adj_iff_val_mod] at h
  omega

end E993Transport
-- VERITYOS ENTRY 171 END

-- VERITYOS ENTRY 172 BEGIN lemma E993Transport.card_gkFarLeaves_filter_adj 8f2fc9de128fd9f49e174b9bd5de1295a21c1f1c4a4ccabc25deb6e1c879e604
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- each arm middle `b_i` has exactly one far-leaf neighbour, `c_i`. -/
lemma card_gkFarLeaves_filter_adj (k : ℕ) (w : Fin (3*k+5)) (hw : w ∈ gkArmMiddles k) :
    ((gkFarLeaves k).filter ((gkGraph k).Adj w)).card = 1 := by
  have hwl := w.isLt
  rw [mem_gkArmMiddles_iff] at hw
  rw [Finset.card_eq_one]
  refine ⟨gkVertex k (w.val + 1), ?_⟩
  ext v
  have hvl := v.isLt
  rw [Finset.mem_filter, mem_gkFarLeaves_iff, gkGraph_adj_armMiddle_iff k w v hw,
    Finset.mem_singleton, eq_gkVertex_iff k _ (by omega)]
  constructor
  · rintro ⟨h1, h2⟩; omega
  · intro h; exact ⟨by omega, by omega⟩

end E993Transport
-- VERITYOS ENTRY 172 END

-- VERITYOS ENTRY 173 BEGIN lemma E993Transport.gkArmMiddles_farLeaves_nbrs_disjoint ae2ac3fe2011524c2c55994701554f29e461ab5e8dad563bb6f0c4bc955ff871
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- no far leaf is adjacent to two distinct arm middles. -/
lemma gkArmMiddles_farLeaves_nbrs_disjoint (k : ℕ) :
    ∀ w ∈ gkArmMiddles k, ∀ w' ∈ gkArmMiddles k, w ≠ w' →
      ∀ v ∈ gkFarLeaves k, (gkGraph k).Adj w v → ¬ (gkGraph k).Adj w' v := by
  intro w hw w' hw' hne v hv h h'
  have hne' : w.val ≠ w'.val := fun h => hne (Fin.ext h)
  rw [mem_gkArmMiddles_iff] at hw hw'
  rw [mem_gkFarLeaves_iff] at hv
  rw [gkGraph_adj_iff_val_mod] at h h'
  omega

end E993Transport
-- VERITYOS ENTRY 173 END

-- VERITYOS ENTRY 174 BEGIN lemma E993Transport.gk_card_indep_rootFree_eq_sum a56723c754d872dc353a5aa1029311e812fee19647d163009c9b7306df39e097
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- (root split, `0 ∉ B`) the independent `j`-sets of `G_k` avoiding `0` number
`Σ_{i ≤ j} C(k+1, i)·C(2k+3−2i, j−i)`: `i` middles chosen, any subset of the `2(k+1−i)+1` free ends
(the leaf `1` and the ends of the unchosen `P_3` blocks). -/
lemma gk_card_indep_rootFree_eq_sum (k j : ℕ) :
    (((Finset.univ.erase (gkVertex k 0)).powersetCard j).filter
        fun s : Finset (Fin (3*k+5)) => (gkGraph k).IsIndepSet (s : Set (Fin (3*k+5)))).card =
      ∑ i ∈ Finset.range (j + 1), (k + 1).choose i * (2 * k + 3 - 2 * i).choose (j - i) := by
  rw [← Finset.union_sdiff_of_subset (gkMiddles_subset_erase_root k),
    card_indep_powersetCard_union_eq_sum_choose (gkGraph k) (gkMiddles k) _ 2 j
      Finset.disjoint_sdiff (gkMiddles_pairwise_nonadj k) (gkRootFreeEnds_pairwise_nonadj k)
      (card_gkRootFreeEnds_filter_adj k) (gkMiddles_rootFreeEnds_nbrs_disjoint k),
    card_gkMiddles, card_gkRootFreeEnds]

end E993Transport
-- VERITYOS ENTRY 174 END

-- VERITYOS ENTRY 175 BEGIN lemma E993Transport.gk_card_indep_rootMem_eq_sum 8a26c20784bd025ea4cdcafc713dee005e4b3ab5ddb2ccd2ceb07ed54fb15fe4
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- (root split, `0 ∈ B`) the independent `(j+1)`-sets of `G_k` containing `0` number
`Σ_{l ≤ j} C(k, l)·C(k+2−l, j−l)`: `1, 2, a_i` excluded, `l` arm middles chosen, any subset of the free
leaves `3, 4` and the tips `c_i` of the other arms. -/
lemma gk_card_indep_rootMem_eq_sum (k j : ℕ) :
    ((((Finset.univ : Finset (Fin (3*k+5))).powersetCard (j + 1)).filter
        fun s : Finset (Fin (3*k+5)) => (gkGraph k).IsIndepSet (s : Set (Fin (3*k+5)))).filter
          fun s => gkVertex k 0 ∈ s).card =
      ∑ l ∈ Finset.range (j + 1), k.choose l * (k + 2 - l).choose (j - l) := by
  rw [card_indep_powersetCard_succ_mem_eq_card_indep_nonNeighbors, gk_root_nonNeighbors_eq,
    card_indep_powersetCard_union_eq_sum_choose (gkGraph k) (gkArmMiddles k) (gkFarLeaves k) 1 j
      (gkArmMiddles_disjoint_gkFarLeaves k) (gkArmMiddles_pairwise_nonadj k)
      (gkFarLeaves_pairwise_nonadj k) (card_gkFarLeaves_filter_adj k)
      (gkArmMiddles_farLeaves_nbrs_disjoint k),
    card_gkArmMiddles, card_gkFarLeaves]
  simp only [one_mul]

end E993Transport
-- VERITYOS ENTRY 175 END

-- VERITYOS ENTRY 176 BEGIN lemma E993Transport.gk_rootFree_sum_eq_pascal c58a45078eeb0770292c5a8d95ff37f90b66834a67c1ff23fa75c670406c7598
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- Pascal's rule on the rows: the `0 ∉ B` count at `j+1` is `A_{j+1} + A_j` (the leaf `1` is the factor `1 + y`). -/
lemma gk_rootFree_sum_eq_pascal (k j : ℕ) :
    ∑ i ∈ Finset.range (j + 2), (k + 1).choose i * (2 * k + 3 - 2 * i).choose (j + 1 - i) =
      (∑ i ∈ Finset.range (j + 2), (k + 1).choose i * (2 * (k + 1 - i)).choose (j + 1 - i)) +
        ∑ i ∈ Finset.range (j + 1), (k + 1).choose i * (2 * (k + 1 - i)).choose (j - i) := by
  rw [Finset.sum_range_succ, Finset.sum_range_succ
    (fun i => (k + 1).choose i * (2 * (k + 1 - i)).choose (j + 1 - i))]
  have hlast : (k + 1).choose (j + 1) * (2 * k + 3 - 2 * (j + 1)).choose (j + 1 - (j + 1)) =
      (k + 1).choose (j + 1) * (2 * (k + 1 - (j + 1))).choose (j + 1 - (j + 1)) := by
    simp
  have hbody : ∑ i ∈ Finset.range (j + 1), (k + 1).choose i * (2 * k + 3 - 2 * i).choose (j + 1 - i) =
      ∑ i ∈ Finset.range (j + 1), (k + 1).choose i * (2 * (k + 1 - i)).choose (j + 1 - i) +
        ∑ i ∈ Finset.range (j + 1), (k + 1).choose i * (2 * (k + 1 - i)).choose (j - i) := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i hi
    rw [Finset.mem_range] at hi
    by_cases hik : i ≤ k + 1
    · rw [(by omega : 2 * k + 3 - 2 * i = 2 * (k + 1 - i) + 1),
        (by omega : j + 1 - i = (j - i) + 1), Nat.choose_succ_succ']
      ring
    · rw [Nat.choose_eq_zero_of_lt (by omega : k + 1 < i)]
      simp
  rw [hbody, hlast]
  ring

end E993Transport
-- VERITYOS ENTRY 176 END

-- VERITYOS ENTRY 177 BEGIN lemma E993Transport.gk_rootMem_sum_eq_pascal 03439f952a6d40261806e98661181181b43f8904096d70ca5583a4a1b79336d8
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- Pascal's rule on the rows: the `0 ∈ B` count at `j+1` is `B_{j+1} + B_j` (the leaf `4` is the factor `1 + y`). -/
lemma gk_rootMem_sum_eq_pascal (k j : ℕ) :
    ∑ l ∈ Finset.range (j + 1), k.choose l * (k + 2 - l).choose (j - l) =
      (∑ l ∈ Finset.range (j + 1), k.choose l * (k - l + 1).choose (j + 1 - l - 1)) +
        ∑ l ∈ Finset.range j, k.choose l * (k - l + 1).choose (j - l - 1) := by
  rw [Finset.sum_range_succ, Finset.sum_range_succ
    (fun l => k.choose l * (k - l + 1).choose (j + 1 - l - 1))]
  have hlast : k.choose j * (k + 2 - j).choose (j - j) =
      k.choose j * (k - j + 1).choose (j + 1 - j - 1) := by
    simp
  have hbody : ∑ l ∈ Finset.range j, k.choose l * (k + 2 - l).choose (j - l) =
      ∑ l ∈ Finset.range j, k.choose l * (k - l + 1).choose (j + 1 - l - 1) +
        ∑ l ∈ Finset.range j, k.choose l * (k - l + 1).choose (j - l - 1) := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro l hl
    rw [Finset.mem_range] at hl
    by_cases hlk : l ≤ k
    · obtain ⟨t, rfl⟩ : ∃ t, j = l + t + 1 := ⟨j - l - 1, by omega⟩
      rw [(by omega : l + t + 1 - l - 1 = t), (by omega : l + t + 1 + 1 - l - 1 = t + 1),
        (by omega : l + t + 1 - l = t + 1), (by omega : k + 2 - l = (k - l + 1) + 1),
        Nat.choose_succ_succ']
      ring
    · rw [Nat.choose_eq_zero_of_lt (by omega : k < l)]
      simp
  rw [hbody, hlast]
  ring

end E993Transport
-- VERITYOS ENTRY 177 END

-- VERITYOS ENTRY 178 BEGIN lemma E993Transport.gk_indepSetCount_succ_eq_gkHalfCount_add 520d61fbf8009d736373b2a1ef4851f2f811f7503c25405d8663423c9bbfd31c
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- (N4a, count bridge) `i_{j+1}(G_k) = u_{j+1} + u_j`. -/
lemma gk_indepSetCount_succ_eq_gkHalfCount_add (k j : ℕ) :
    C5LA1.indepSetCount (gkGraph k) ∅ (j + 1) = gkHalfCount k (j + 1) + gkHalfCount k j := by
  rw [C5LA1.indepSetCount, C5LA1.indepSetsAvoiding, Finset.sdiff_empty,
    ← Finset.card_filter_add_card_filter_not (p := fun s => gkVertex k 0 ∈ s),
    gk_card_indep_rootMem_eq_sum, indep_powersetCard_filter_notMem_eq,
    gk_card_indep_rootFree_eq_sum, gk_rootMem_sum_eq_pascal, gk_rootFree_sum_eq_pascal, gkHalfCount,
    gkHalfCount]
  ring

end E993Transport
-- VERITYOS ENTRY 178 END

-- VERITYOS ENTRY 179 BEGIN lemma E993Transport.gk_indepSetCount_zero_eq_gkHalfCount d8a597c099adc9a16fd0f019189df3ead089be2bf88784890099e700ad770c95
namespace E993Transport

-- r30 C5-LA1 node N4a (count bridge), authored in-run by the C5-LA1 formalizer (Claude Opus 5.5); explicit binomial form of the U adjudicator
-- (r30 Cycle 5, group G-U-A); root split and binomial-row reading of C-U1-F / C-U1-T (Claude Opus 5.5).
/-- (N4a, count bridge) `i_0(G_k) = u_0` (`= 1`). -/
lemma gk_indepSetCount_zero_eq_gkHalfCount (k : ℕ) :
    C5LA1.indepSetCount (gkGraph k) ∅ 0 = gkHalfCount k 0 := by
  rw [C5LA1.indepSetCount, C5LA1.indepSetsAvoiding, Finset.powersetCard_zero, gkHalfCount,
    Finset.filter_singleton, if_pos]
  · simp
  · intro x hx
    simp at hx

end E993Transport
-- VERITYOS ENTRY 179 END

-- VERITYOS ENTRY 180 BEGIN lemma E993Transport.gk_forwardDifference_nonneg b4735857118c537c6d5be4d96aac6a458175577caa5a728e9b109c3a96873b01
namespace E993Transport

-- r30 C5-LA1 node N4 = GK-MONO in Lean (`Δ_j(G_k) ≥ 0`, `j ≤ k`); proofs of record C-U1-F (binomial rows, the Lean
-- route) and C-U1-T (Newton, not used); assembled in-run by the C5-LA1 formalizer (Claude Opus 5.5).
/-- (N4, GK-MONO) `0 ≤ Δ_j(G_k)` for every `j ≤ k` (ℤ-valued; `Δ_0 = u_1`, `Δ_j = u_{j+1} − u_{j−1}`). -/
lemma gk_forwardDifference_nonneg (k j : ℕ) (hj : j ≤ k) :
    0 ≤ C5LA1.forwardDifferenceDel (gkGraph k) ∅ j := by
  rw [C5LA1.forwardDifferenceDel, gk_indepSetCount_succ_eq_gkHalfCount_add]
  rcases j with _ | j
  · rw [gk_indepSetCount_zero_eq_gkHalfCount]
    push_cast
    omega
  · rw [gk_indepSetCount_succ_eq_gkHalfCount_add]
    have : gkHalfCount k j ≤ gkHalfCount k (j + 1 + 1) :=
      gkHalfCount_le_gkHalfCount_add_two k j (by omega)
    push_cast
    omega

end E993Transport
-- VERITYOS ENTRY 180 END

-- VERITYOS ENTRY 181 BEGIN lemma E993Transport.gk_crossing_lower_iff 46cfe3fa20ba6d9e03122ec886576cd03e4a841e7684f94e0942b57b0779b1d2
namespace E993Transport

-- r30 C5-LA1 node N2: authored by critic C-U1-F (Claude Opus 5.5), r30 Cycle 5 scratch `Corollary.lean` 32ac25a1…;
-- re-authored as a registrar entry (`theorem` → `lemma`) by the C5-LA1 formalizer (Claude Opus 5.5).
/-- (N2) the lower bound `k + 1 ≤ x(G_k)` is exactly "no strict descent at any rank `j ≤ k`" (`Nat.le_find_iff`). -/
lemma gk_crossing_lower_iff (k : ℕ) :
    k + 1 ≤ C5LA1.crossingIndex (gkGraph k) ↔
      ∀ j ≤ k, ¬ (C5LA1.forwardDifferenceDel (gkGraph k) ∅ j < 0) := by
  classical
  unfold C5LA1.crossingIndex
  rw [Nat.le_find_iff]
  constructor
  · intro h j hj; exact h j (by omega)
  · intro h j hj; exact h j (by omega)

end E993Transport
-- VERITYOS ENTRY 181 END

-- VERITYOS ENTRY 182 BEGIN lemma E993Transport.gk_weightedHall_flow_of_crossing_lower cb0dd0e40dc6f677508788fff26cbbd1d0557cad6a1878d8b116e0a03d0fb8a1
namespace E993Transport

-- r30 C5-LA1 node N3: the Lean reduction of critic C-U1-F (Claude Opus 5.5), r30 Cycle 5; re-authored by the C5-LA1 formalizer (Claude Opus 5.5)
-- to call C4-LA1's carried LEMMA entry 110 (not the carried terminal theorem 113); the unused `hLow` binder is dropped here.
/-- (N3) from `k + 1 ≤ x(G_k)` and `x(G_k) + 2 ≤ p` (so `p ≥ k + 3`), C4-LA1's deletion-supported flow at
`F = favorableLeaves (gkGraph k) p ⊆ leafSet` is a saturating flow. -/
lemma gk_weightedHall_flow_of_crossing_lower (k p : ℕ)
    (hx : k + 1 ≤ C5LA1.crossingIndex (gkGraph k))
    (hElig : C5LA1.crossingIndex (gkGraph k) + 2 ≤ p) :
    ∃ f, IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f := by
  have hsub : favorableLeaves (gkGraph k) p ⊆ C5LA1.leafSet (gkGraph k) := by
    classical
    intro v hv
    rw [favorableLeaves, Finset.mem_filter] at hv
    exact hv.1
  obtain ⟨f, hf, -⟩ := gk_exists_deletionSupported_saturatingFlow k p (by omega)
    (favorableLeaves (gkGraph k) p) hsub
  exact ⟨f, hf⟩

end E993Transport
-- VERITYOS ENTRY 182 END

-- VERITYOS ENTRY 183 BEGIN theorem E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank de0edf6a871b97b5fa290f1d42624bfbcf69986c9addf32a0e99c9791b18c336
namespace E993Transport

-- r30 C5-LA1 TERMINAL THEOREM: composition and DAG by the r30 Cycle 5 U adjudicator (Claude Opus 5.5); tree face U1
-- (Claude Sonnet 5); GK-MONO C-U1-T / C-U1-F (Claude Opus 5.5); reduction C-U1-F; the G_k flow C4-LA1 (r30 Cycle 4); definition
-- layers first-interior (Codex) and C1-LA1/C1-LA2 (r30); mechanism and lower-region run Codex GPT-6. Assembled by the C5-LA1 formalizer (Claude Opus 5.5).
-- Fences: G_k only; deletion-supported flows; not (HALL) at full scope; not every tree; nothing on the primary aggregate
-- beyond G_k; not an RTree statement; not the strict GK-SIGN; not a second family for ruling 39; no statement about switch arcs.
/-- Terminal theorem (C5-LA1): the tree face, and (HALL) at every eligible rank of `G_k`.
`hLow : 3 * p < 2 * indepNum + 1` is carried to match SOLUTION-CONTRACT §2's (HALL) signature and is UNUSED. -/
theorem gk_lowerRegionWeightedHall_everyEligibleRank (k : ℕ) :
    (gkGraph k).IsTree ∧
    ∀ p : ℕ, C5LA1.crossingIndex (gkGraph k) + 2 ≤ p → 3 * p < 2 * (gkGraph k).indepNum + 1 →
      ∃ f, IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f := by
  refine ⟨gkGraph_isTree k, fun p hElig _hLow => ?_⟩
  exact gk_weightedHall_flow_of_crossing_lower k p
    ((gk_crossing_lower_iff k).mpr fun j hj => not_lt.mpr (gk_forwardDifference_nonneg k j hj))
    hElig

end E993Transport
-- VERITYOS ENTRY 183 END

