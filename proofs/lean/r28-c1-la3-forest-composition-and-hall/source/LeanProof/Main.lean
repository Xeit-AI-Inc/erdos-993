import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount 5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb
universe u


namespace Erdos993G1

noncomputable
def indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

end Erdos993G1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.indepDegreeSum a1ed32eb12b137ac5915bf15255c1173593296f3eb22127e2dcf0fab2ea9f38e
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The incident degree sum `D_k(G) := Σ_{J ∈ I_k(G)} Σ_{v ∈ J} deg_G(v)`. -/
def indepDegreeSum (k : ℕ) : ℕ :=
  ∑ J ∈ G.indepSetFinset k, ∑ v ∈ J, G.degree v

end

end Erdos993G1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition R28U2.occ dd5dba734553ed76a9e3c6b41c0a19ef2a639d00a8adc540f184041b37206433
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- `occ G v k`: the number of independent `k`-sets of `G` containing `v`. -/
def occ (v : X) (k : ℕ) : ℕ := ((G.indepSetFinset k).filter (fun J => v ∈ J)).card

end R28U2
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition R28U2.slotsAtLeast ba7eee89b6e73147bea7c9f2825b14546b645581c6380eb5728e6f51134278f2
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- `slotsAtLeast G k t`: total branch slots (`deg − 2` summed over branch vertices, `deg ≥ 3`)
whose vertex has occupancy `≥ t`. -/
def slotsAtLeast (k t : ℕ) : ℕ :=
  ∑ v ∈ (Finset.univ : Finset X).filter (fun v => 3 ≤ G.degree v ∧ t ≤ occ G v k), (G.degree v - 2)

end R28U2
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition R28U2.leavesAtLeast cdcddd1d3d3e8af0f2964275effa07e2df7abd96823a32748decfe23cbd2db2f
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- `leavesAtLeast G k t`: the number of leaves (`deg = 1`) with occupancy `≥ t`. -/
def leavesAtLeast (k t : ℕ) : ℕ :=
  ((Finset.univ : Finset X).filter (fun ℓ => G.degree ℓ = 1 ∧ t ≤ occ G ℓ k)).card

end R28U2
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition R28U2.indepFinsetOn e61ddb08a2cbbee185938b4eedb720e3ea823c19f025303f4ddb1e569cb2098e
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Independent `k`-subsets of `G` contained in the finset `S`. -/
def indepFinsetOn (S : Finset X) (k : ℕ) : Finset (Finset X) :=
  (G.indepSetFinset k).filter (fun J => J ⊆ S)

end R28U2
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition R28U2.indepCountOn 58dae1b489315cb9dafe6339c6e344133ac7b3bd9ce6be527efe7707b6b7dfbd
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The `S`-relative independent-`k`-set count. -/
def indepCountOn (S : Finset X) (k : ℕ) : ℕ := (indepFinsetOn G S k).card

end R28U2
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition R28U2.indepDegreeSumOn 7bdd5644f3ddcd6441c514d2d8084b25c73753c3cf5c4575d6efc2d8837cd261
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The `S`-relative incident degree sum (ambient degree). -/
def indepDegreeSumOn (S : Finset X) (k : ℕ) : ℕ :=
  ∑ J ∈ indepFinsetOn G S k, ∑ v ∈ J, G.degree v

end R28U2
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition R28U2.splitPair 920149a54ace4724e0e40b32a6c48e5ff8522f7351720737d610e07de581ff25
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

/-- Forward map of the bijection: `J ↦ (J ∩ S, J ∩ T)`. -/
private
def splitPair (S T : Finset X) (J : Finset X) : Finset X × Finset X := (J ∩ S, J ∩ T)

end Bij

end R28U2
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition R28U2.joinPair 673d19ca34e7831a1d8a3f1d8ccf1528946d4606070cf5f64ebb248734e7c633
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

/-- Backward map: `(J₁, J₂) ↦ J₁ ∪ J₂`. -/
private
def joinPair (p : Finset X × Finset X) : Finset X := p.1 ∪ p.2

end Bij

end R28U2
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition R28U2.Branch cf0e0e8502d90f7e563d17f42e856166a52b9c38ae3773d6b14f5df3384a8983
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section ConcreteSlots

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The branch vertices (`deg ≥ 3`). -/
abbrev Branch := {v : X // 3 ≤ G.degree v}

end ConcreteSlots

end R28U2
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition R28U2.LeafT c75cc80b344c11bc94aa5b892692f284b8018d28715ac4d3879dd1671f99d772
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section ConcreteSlots

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The leaves (`deg = 1`). -/
abbrev LeafT := {ℓ : X // G.degree ℓ = 1}

end ConcreteSlots

end R28U2
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition R28U2.Slot 4717d4e89800de6de4c630b710430d65b999f44eb87edfcebc1c9d61c879b36d
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section ConcreteSlots

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- One slot per `(branch vertex, index below deg v − 2)` pair — `deg v − 2` slots at `v`. -/
abbrev Slot := Σ v : Branch G, Fin (G.degree v.1 - 2)

end ConcreteSlots

end R28U2
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac
namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (k : ℕ) :
    Erdos993G1.indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [Erdos993G1.indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma R28U2.indepFinsetOn_univ 25fa6f7139682e93145d69ae00947519dc7e1b765cc42d1f60e38a7a49da9a9c
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

@[simp]
lemma indepFinsetOn_univ (k : ℕ) :
    indepFinsetOn G (Finset.univ : Finset X) k = G.indepSetFinset k := by
  ext J
  simp only [indepFinsetOn, Finset.mem_filter, Finset.subset_univ, and_true]

end R28U2
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma R28U2.indepCountOn_univ 92b26dcb667eb95ff5564afc490d58dde45d4528c97f7e604af28043d7a7b098
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

@[simp]
lemma indepCountOn_univ (k : ℕ) :
    indepCountOn G (Finset.univ : Finset X) k = (G.indepSetFinset k).card := by
  simp [indepCountOn, indepFinsetOn_univ]

end R28U2
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma R28U2.indepDegreeSumOn_univ 6b18cbcadc739946f57f5c7f4da006356ebcc0eac3cd955662c7dc6cc34f8f54
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

@[simp]
lemma indepDegreeSumOn_univ (k : ℕ) :
    indepDegreeSumOn G (Finset.univ : Finset X) k = Erdos993G1.indepDegreeSum G k := by
  simp [indepDegreeSumOn, indepFinsetOn_univ, Erdos993G1.indepDegreeSum]

end R28U2
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma R28U2.isIndepSet_union_iff 0a49d7a638e5153547952269bbd4f4a4d7cbdce501f994ef66702a414d1e6e4f
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

omit [Fintype X] [DecidableRel G.Adj] in
/-- Independence of a subset of a separated union splits along the pieces. Uses only
finiteness and separation (`hsep`) — no acyclicity, matching `SR-JOIN` item 2's finding. -/
private
lemma isIndepSet_union_iff (hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y)
    {J1 J2 : Finset X} (h1 : J1 ⊆ S) (h2 : J2 ⊆ T) :
    G.IsIndepSet (↑(J1 ∪ J2) : Set X) ↔
      G.IsIndepSet (↑J1 : Set X) ∧ G.IsIndepSet (↑J2 : Set X) := by
  rw [Finset.coe_union, SimpleGraph.isIndepSet_iff, SimpleGraph.isIndepSet_iff,
    SimpleGraph.isIndepSet_iff, Set.pairwise_union]
  constructor
  · rintro ⟨h1', h2', -⟩; exact ⟨h1', h2'⟩
  · rintro ⟨h1', h2'⟩
    refine ⟨h1', h2', fun a ha b hb _ => ⟨hsep a (h1 ha) b (h2 hb),
      fun hab => hsep a (h1 ha) b (h2 hb) hab.symm⟩⟩

end Bij

end R28U2
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma R28U2.join_splitPair 8bbc6f78463dbf6352a1129d518db9046d483e917d085454f2f89ed51c8cd5c9
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

omit [Fintype X] in
/-- The forward and backward maps of the split/join correspondence are mutually inverse,
on the domains where they are meant to apply. -/
private
lemma join_splitPair {J : Finset X} (hJ : J ⊆ S ∪ T) :
    joinPair (splitPair S T J) = J := by
  unfold joinPair splitPair
  rw [← Finset.inter_union_distrib_left]
  exact Finset.inter_eq_left.mpr hJ

end Bij

end R28U2
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma R28U2.splitPair_joinPair c52d9441fa4222730f74dde040a04f2fcc4a4f430a73de6021731a0b21d06037
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

omit [Fintype X] in
private
lemma splitPair_joinPair (hdisj : Disjoint S T) {J1 J2 : Finset X}
    (h1 : J1 ⊆ S) (h2 : J2 ⊆ T) :
    splitPair S T (joinPair (J1, J2)) = (J1, J2) := by
  unfold joinPair splitPair
  have hST : Disjoint J1 T := Disjoint.mono_left h1 hdisj
  have hTS : Disjoint J2 S := Disjoint.mono_left h2 hdisj.symm
  have e1 : (J1 ∪ J2) ∩ S = J1 := by
    rw [Finset.union_inter_distrib_right, Finset.inter_eq_left.mpr h1,
      Finset.disjoint_iff_inter_eq_empty.mp hTS, Finset.union_empty]
  have e2 : (J1 ∪ J2) ∩ T = J2 := by
    rw [Finset.union_inter_distrib_right, Finset.disjoint_iff_inter_eq_empty.mp hST,
      Finset.inter_eq_left.mpr h2, Finset.empty_union]
  simp [e1, e2]

end Bij

end R28U2
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma R28U2.splitPair_mem c4531c1f2430611c946c190e512bba5d685fe1794fa2807f4547f1d7b52abc9e
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

/-- `splitPair` sends a `k`-independent-set of `S ∪ T` meeting `S` in exactly `a` elements into
`indepFinsetOn G S a ×ˢ indepFinsetOn G T (k − a)`. -/
private
lemma splitPair_mem (hdisj : Disjoint S T) {k a : ℕ} (ha : a ≤ k) {J : Finset X}
    (hJ : J ∈ (indepFinsetOn G (S ∪ T) k).filter (fun J => (J ∩ S).card = a)) :
    splitPair S T J ∈ indepFinsetOn G S a ×ˢ indepFinsetOn G T (k - a) := by
  simp only [Finset.mem_filter] at hJ
  obtain ⟨hJmem, hJcardS⟩ := hJ
  simp only [indepFinsetOn, Finset.mem_filter] at hJmem
  obtain ⟨hJindep, hJsub⟩ := hJmem
  have hJni : G.IsNIndepSet k J := SimpleGraph.mem_indepSetFinset_iff.mp hJindep
  have hSTdisj : Disjoint (J ∩ S) (J ∩ T) :=
    (hdisj.inf_left' J).inf_right' J
  have hunion : (J ∩ S) ∪ (J ∩ T) = J := by
    rw [← Finset.inter_union_distrib_left]; exact Finset.inter_eq_left.mpr hJsub
  have hcardsum : (J ∩ S).card + (J ∩ T).card = k := by
    have := Finset.card_union_of_disjoint hSTdisj
    rw [hunion] at this
    rw [← this, hJni.card_eq]
  have hJTcard : (J ∩ T).card = k - a := by omega
  have hSind : G.IsIndepSet (↑(J ∩ S) : Set X) :=
    hJni.isIndepSet.mono (Finset.coe_subset.mpr Finset.inter_subset_left)
  have hTind : G.IsIndepSet (↑(J ∩ T) : Set X) :=
    hJni.isIndepSet.mono (Finset.coe_subset.mpr Finset.inter_subset_left)
  simp only [splitPair, indepFinsetOn, Finset.mem_product, Finset.mem_filter]
  refine ⟨⟨SimpleGraph.mem_indepSetFinset_iff.mpr ⟨hSind, hJcardS⟩, Finset.inter_subset_right⟩,
    SimpleGraph.mem_indepSetFinset_iff.mpr ⟨hTind, hJTcard⟩, Finset.inter_subset_right⟩

end Bij

end R28U2
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma R28U2.joinPair_mem 6e96881edf60e01dddd0f166c5f861a54a604d1202d1612d262d1b1899b8c79a
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

/-- `joinPair` sends a pair of independent sets of sizes `a`, `k − a` back into the filtered
`k`-independent-set slice of `S ∪ T`. -/
private
lemma joinPair_mem (hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y) (hdisj : Disjoint S T)
    {k a : ℕ} (ha : a ≤ k) {p : Finset X × Finset X}
    (hp : p ∈ indepFinsetOn G S a ×ˢ indepFinsetOn G T (k - a)) :
    joinPair p ∈ (indepFinsetOn G (S ∪ T) k).filter (fun J => (J ∩ S).card = a) := by
  simp only [Finset.mem_product] at hp
  obtain ⟨hp1, hp2⟩ := hp
  simp only [indepFinsetOn, Finset.mem_filter] at hp1 hp2
  obtain ⟨hp1indep, hp1sub⟩ := hp1
  obtain ⟨hp2indep, hp2sub⟩ := hp2
  have hp1ni : G.IsNIndepSet a p.1 := SimpleGraph.mem_indepSetFinset_iff.mp hp1indep
  have hp2ni : G.IsNIndepSet (k - a) p.2 := SimpleGraph.mem_indepSetFinset_iff.mp hp2indep
  have hind : G.IsIndepSet (↑(joinPair p) : Set X) :=
    (isIndepSet_union_iff G hsep hp1sub hp2sub).mpr ⟨hp1ni.isIndepSet, hp2ni.isIndepSet⟩
  have hdisjp : Disjoint p.1 p.2 :=
    (hdisj.mono_left hp1sub).mono_right hp2sub
  have hcard : (joinPair p).card = k := by
    unfold joinPair
    rw [Finset.card_union_of_disjoint hdisjp, hp1ni.card_eq, hp2ni.card_eq]
    omega
  have hsub : joinPair p ⊆ S ∪ T := Finset.union_subset_union hp1sub hp2sub
  have hcardS : ((joinPair p) ∩ S).card = a := by
    unfold joinPair
    have e1 : (p.1 ∪ p.2) ∩ S = p.1 := by
      rw [Finset.union_inter_distrib_right, Finset.inter_eq_left.mpr hp1sub,
        Finset.disjoint_iff_inter_eq_empty.mp
          (Disjoint.mono_left hp2sub hdisj.symm), Finset.union_empty]
    rw [e1, hp1ni.card_eq]
  simp only [Finset.mem_filter, indepFinsetOn]
  exact ⟨⟨SimpleGraph.mem_indepSetFinset_iff.mpr ⟨hind, hcard⟩, hsub⟩, hcardS⟩

end Bij

end R28U2
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma R28U2.indepCountOn_union_filter_card cc83dc07de583300be13f9470076004e8702b8b77f2e14795c64af1584ea544f
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

/-- The card identity behind the convolution, for one fixed split size `a ≤ k`. -/
lemma indepCountOn_union_filter_card (hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y)
    (hdisj : Disjoint S T) (k a : ℕ) (ha : a ≤ k) :
    ((indepFinsetOn G (S ∪ T) k).filter (fun J => (J ∩ S).card = a)).card
      = indepCountOn G S a * indepCountOn G T (k - a) := by
  rw [indepCountOn, indepCountOn, ← Finset.card_product]
  apply Finset.card_nbij' (splitPair S T) joinPair
  · intro J hJ
    exact splitPair_mem G hdisj ha hJ
  · intro p hp
    exact joinPair_mem G hsep hdisj ha hp
  · intro J hJ
    simp only [Finset.mem_coe, Finset.mem_filter, indepFinsetOn] at hJ
    exact join_splitPair hJ.1.2
  · intro p hp
    simp only [Finset.mem_coe, Finset.mem_product] at hp
    obtain ⟨hp1, hp2⟩ := hp
    simp only [indepFinsetOn, Finset.mem_filter] at hp1 hp2
    exact splitPair_joinPair hdisj hp1.2 hp2.2

end Bij

end R28U2
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma R28U2.indepDegreeSumOn_union_filter_sum 0a6152a59998a1e91ef51a772326a8acc29bf42965f9109c6cd9de7f7bb22b0c
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

/-- The sum identity behind the `D_k`-convolution, for one fixed split size `a ≤ k`: the total
ambient degree over the filtered slice equals the degree-sum over the corresponding pairs. -/
lemma indepDegreeSumOn_union_filter_sum (hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y)
    (hdisj : Disjoint S T) (k a : ℕ) (ha : a ≤ k) :
    ∑ J ∈ (indepFinsetOn G (S ∪ T) k).filter (fun J => (J ∩ S).card = a), ∑ v ∈ J, G.degree v
      = ∑ p ∈ indepFinsetOn G S a ×ˢ indepFinsetOn G T (k - a),
          ((∑ v ∈ p.1, G.degree v) + ∑ v ∈ p.2, G.degree v) := by
  apply Finset.sum_nbij' (splitPair S T) joinPair
  · intro J hJ
    exact splitPair_mem G hdisj ha hJ
  · intro p hp
    exact joinPair_mem G hsep hdisj ha hp
  · intro J hJ
    simp only [Finset.mem_filter, indepFinsetOn] at hJ
    exact join_splitPair hJ.1.2
  · intro p hp
    simp only [Finset.mem_product] at hp
    obtain ⟨hp1, hp2⟩ := hp
    simp only [indepFinsetOn, Finset.mem_filter] at hp1 hp2
    exact splitPair_joinPair hdisj hp1.2 hp2.2
  · intro J hJ
    simp only [Finset.mem_filter, indepFinsetOn] at hJ
    obtain ⟨hJmem, hJcardS⟩ := hJ
    have hsub : J ⊆ S ∪ T := hJmem.2
    have hSTdisj : Disjoint (J ∩ S) (J ∩ T) := (hdisj.inf_left' J).inf_right' J
    have hunion : (J ∩ S) ∪ (J ∩ T) = J := by
      rw [← Finset.inter_union_distrib_left]; exact Finset.inter_eq_left.mpr hsub
    show ∑ v ∈ J, G.degree v
        = (∑ v ∈ (splitPair S T J).1, G.degree v) + ∑ v ∈ (splitPair S T J).2, G.degree v
    simp only [splitPair]
    calc ∑ v ∈ J, G.degree v = ∑ v ∈ (J ∩ S) ∪ (J ∩ T), G.degree v := by rw [hunion]
      _ = (∑ v ∈ J ∩ S, G.degree v) + ∑ v ∈ J ∩ T, G.degree v := Finset.sum_union hSTdisj

end Bij

end R28U2
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma R28U2.interS_card_mem_range bc3da5c26ee431881ef1fefda7ebb8c95bf13c3fb5b7a4b3e5cb43de3b5ad1e7
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

private
lemma interS_card_mem_range {k : ℕ} {J : Finset X} (hJ : J ∈ indepFinsetOn G (S ∪ T) k) :
    (J ∩ S).card ∈ Finset.range (k + 1) := by
  simp only [indepFinsetOn, Finset.mem_filter] at hJ
  have hJni : G.IsNIndepSet k J := SimpleGraph.mem_indepSetFinset_iff.mp hJ.1
  have hle : (J ∩ S).card ≤ J.card := Finset.card_le_card Finset.inter_subset_left
  rw [hJni.card_eq] at hle
  simp only [Finset.mem_range]
  omega

end Bij

end R28U2
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma R28U2.indepCountOn_union 35b055ec37d8c606e36cf0b8a9cae101902679453b6589e9ae01de4903201949
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

/-- **The `i_k` separated-union convolution**, the Lean form of
`E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`'s first identity, at the level of two `Finset X`
pieces of one ambient graph: `i_k(S ∪ T) = Σ_{a+b=k} i_a(S) i_b(T)`. -/
lemma indepCountOn_union (hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y) (hdisj : Disjoint S T) (k : ℕ) :
    indepCountOn G (S ∪ T) k
      = ∑ a ∈ Finset.range (k + 1), indepCountOn G S a * indepCountOn G T (k - a) := by
  rw [indepCountOn, Finset.card_eq_sum_card_fiberwise (fun J hJ => interS_card_mem_range G hJ)]
  refine Finset.sum_congr rfl (fun a ha => ?_)
  have ha' : a ≤ k := by simp only [Finset.mem_range] at ha; omega
  exact indepCountOn_union_filter_card G hsep hdisj k a ha'

end Bij

end R28U2
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma R28U2.indepDegreeSumOn_union 756679f68a4b62b94917fe24f452ea13d28e559da5a3d5570c4c329b8ab2c4a7
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section Bij

variable {S T : Finset X}

/-- **The `D_k` separated-union convolution**, the Lean form of
`E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`'s second identity:
`D_k(S ∪ T) = Σ_{a+b=k} [D_a(S) i_b(T) + i_a(S) D_b(T)]`. -/
lemma indepDegreeSumOn_union (hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y) (hdisj : Disjoint S T)
    (k : ℕ) :
    indepDegreeSumOn G (S ∪ T) k
      = ∑ a ∈ Finset.range (k + 1),
          (indepDegreeSumOn G S a * indepCountOn G T (k - a)
            + indepCountOn G S a * indepDegreeSumOn G T (k - a)) := by
  rw [indepDegreeSumOn,
    ← Finset.sum_fiberwise_of_maps_to (fun J hJ => interS_card_mem_range G hJ)
      (fun J => ∑ v ∈ J, G.degree v)]
  refine Finset.sum_congr rfl (fun a ha => ?_)
  have ha' : a ≤ k := by simp only [Finset.mem_range] at ha; omega
  rw [indepDegreeSumOn_union_filter_sum G hsep hdisj k a ha', Finset.sum_add_distrib]
  have term1 :
      ∑ p ∈ indepFinsetOn G S a ×ˢ indepFinsetOn G T (k - a), ∑ v ∈ p.1, G.degree v
        = indepDegreeSumOn G S a * indepCountOn G T (k - a) := by
    rw [Finset.sum_product]
    simp only [Finset.sum_const, smul_eq_mul]
    rw [← Finset.mul_sum, mul_comm]
    rfl
  have term2 :
      ∑ p ∈ indepFinsetOn G S a ×ˢ indepFinsetOn G T (k - a), ∑ v ∈ p.2, G.degree v
        = indepCountOn G S a * indepDegreeSumOn G T (k - a) := by
    rw [Finset.sum_product]
    simp only [Finset.sum_const, smul_eq_mul]
    rfl
  rw [term1, term2]

end Bij

end R28U2
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma R28U2.nested_hall_iff_threshold 291b912b208c422d73a4c0fa9c061311948faf0d18ec7fe23d410d7e6a2fc2be
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section NestedHall

variable {α β : Type u} [Fintype α] [Fintype β]

/-- The general nested-neighbourhood Hall reduction. -/
lemma nested_hall_iff_threshold (f : α → ℕ) (g : β → ℕ) :
    (∀ A : Finset α, A.card ≤ (Finset.univ.filter (fun b => ∃ a ∈ A, f a ≤ g b)).card)
      ↔ ∀ t : ℕ, (Finset.univ.filter (fun a => t ≤ f a)).card
                    ≤ (Finset.univ.filter (fun b => t ≤ g b)).card := by
  constructor
  · intro hHall t
    refine (hHall (Finset.univ.filter (fun a => t ≤ f a))).trans (Finset.card_le_card ?_)
    intro b hb
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hb ⊢
    obtain ⟨a, ha, hab⟩ := hb
    omega
  · intro hThresh A
    rcases A.eq_empty_or_nonempty with rfl | hA
    · simp only [Finset.card_empty]; exact Nat.zero_le _
    · obtain ⟨a0, ha0, hmin⟩ := A.exists_min_image f hA
      have hAsub : A ⊆ Finset.univ.filter (fun a => f a0 ≤ f a) := by
        intro a ha
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        exact hmin a ha
      have hnbhd : Finset.univ.filter (fun b => ∃ a ∈ A, f a ≤ g b)
          = Finset.univ.filter (fun b => f a0 ≤ g b) := by
        ext b
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        constructor
        · rintro ⟨a, ha, hab⟩
          have := hmin a ha
          omega
        · intro htb
          exact ⟨a0, ha0, htb⟩
      rw [hnbhd]
      calc A.card ≤ (Finset.univ.filter (fun a => f a0 ≤ f a)).card := Finset.card_le_card hAsub
        _ ≤ (Finset.univ.filter (fun b => f a0 ≤ g b)).card := hThresh (f a0)

end NestedHall

end R28U2
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma R28U2.sdr_iff_threshold_abstract efa1c4d53ac0d36fd4f43ca41ac13271e8392075adccbdaa19c0be2e1351d652
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section NestedHall

variable {α β : Type u} [Fintype α] [Fintype β]

/-- Composed with Mathlib's Hall theorem (`Fintype.all_card_le_filter_rel_iff_exists_injective`,
`Mathlib/Combinatorics/Hall/Basic.lean`): the SDR (matching) form is equivalent to the threshold
form, for any nested relation `r a b := f a ≤ g b`. -/
lemma sdr_iff_threshold_abstract (f : α → ℕ) (g : β → ℕ) :
    (∃ h : α → β, Function.Injective h ∧ ∀ a, f a ≤ g (h a))
      ↔ ∀ t : ℕ, (Finset.univ.filter (fun a => t ≤ f a)).card
                    ≤ (Finset.univ.filter (fun b => t ≤ g b)).card := by
  rw [← nested_hall_iff_threshold f g,
    ← Fintype.all_card_le_filter_rel_iff_exists_injective (fun a b => f a ≤ g b)]

end NestedHall

end R28U2
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma R28U2.card_filter_subtype_eq 23f549ff306f7a3a61ed1ca8e5e2869df6af2f2b6ecbf2b1f70ea2b06493ad89
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section ConcreteSlots

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- A generic lemma: filtering a subtype by a further predicate on the base counts the same as
filtering the base type by the conjunction. -/
private
lemma card_filter_subtype_eq {α : Type u} [Fintype α] (p q : α → Prop)
    [DecidablePred p] [DecidablePred q] :
    (Finset.univ.filter (fun x : Subtype p => q x.1)).card
      = (Finset.univ.filter (fun x : α => p x ∧ q x)).card := by
  rw [← Fintype.card_subtype (fun x : Subtype p => q x.1),
    ← Fintype.card_subtype (fun x : α => p x ∧ q x)]
  exact Fintype.card_congr (Equiv.subtypeSubtypeEquivSubtypeInter p q)

end ConcreteSlots

end R28U2
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma R28U2.sum_filter_subtype_eq d96f8233898ae15c64098205a2d0a97f25bc295c710f06779301b62e8e02d7ff
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section ConcreteSlots

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The sum analogue: summing a function of the base element over a subtype-then-filter matches
summing over the ambient filter by the conjunction. -/
private
lemma sum_filter_subtype_eq {α : Type u} [Fintype α] (p q : α → Prop)
    [DecidablePred p] [DecidablePred q] (h : α → ℕ) :
    ∑ v ∈ (Finset.univ : Finset (Subtype p)).filter (fun x => q x.1), h v.1
      = ∑ v ∈ (Finset.univ : Finset α).filter (fun x => p x ∧ q x), h v := by
  rw [Finset.sum_subtype (p := fun x : Subtype p => q x.1)
      (Finset.univ.filter (fun x : Subtype p => q x.1)) (fun x => by simp) (fun x => h x.1),
    Finset.sum_subtype (p := fun x : α => p x ∧ q x)
      (Finset.univ.filter (fun x : α => p x ∧ q x)) (fun x => by simp) h]
  exact Fintype.sum_equiv (Equiv.subtypeSubtypeEquivSubtypeInter p q) _ _ (fun _ => rfl)

end ConcreteSlots

end R28U2
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma R28U2.card_filter_slot_eq 58a54c0662c791736aaa9dc628e7a8258ada7f7732b34726721446ffd989b932
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section ConcreteSlots

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

private
lemma card_filter_slot_eq (k t : ℕ) :
    (Finset.univ.filter (fun s : Slot G => t ≤ R28U2.occ G s.1.1 k)).card
      = R28U2.slotsAtLeast G k t := by
  have hsigma : (Finset.univ : Finset (Slot G)).filter (fun s => t ≤ R28U2.occ G s.1.1 k)
      = (Finset.univ.filter (fun v : Branch G => t ≤ R28U2.occ G v.1 k)).sigma
          (fun v => (Finset.univ : Finset (Fin (G.degree v.1 - 2)))) := by
    ext s
    obtain ⟨v, i⟩ := s
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, and_true, Finset.mem_sigma]
  rw [hsigma, Finset.card_sigma]
  simp only [Finset.card_univ, Fintype.card_fin]
  exact sum_filter_subtype_eq (fun v : X => 3 ≤ G.degree v) (fun v : X => t ≤ R28U2.occ G v k)
    (fun v => G.degree v - 2)

end ConcreteSlots

end R28U2
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma R28U2.card_filter_leaf_eq a276cc9963d8d71fa77ec06c720a5e433939341b4ce0fa6cc7661fa9d6528b88
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section ConcreteSlots

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

private
lemma card_filter_leaf_eq (k t : ℕ) :
    (Finset.univ.filter (fun ℓ : LeafT G => t ≤ R28U2.occ G ℓ.1 k)).card
      = R28U2.leavesAtLeast G k t :=
  card_filter_subtype_eq (fun v : X => G.degree v = 1) (fun v : X => t ≤ R28U2.occ G v k)

end ConcreteSlots

end R28U2
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma R28U2.sdr_iff_threshold 96f879ee99e5381185e12e5908dc249812c91f52d55baae563a07c71908c5ad9
namespace R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

section ConcreteSlots

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- **`sdr_iff_threshold`.** The Hall/SDR condition on `H_k(T)` (an injective assignment of slots
to leaves respecting `c_ℓ(k) ≥ c_v(k)`) is equivalent to the threshold form (HS). Composed from
`sdr_iff_threshold_abstract` (Mathlib's Hall theorem plus the nested-neighbourhood reduction) and
the two counting bridges above. No `IsTree` or acyclicity hypothesis anywhere: the equivalence is
purely about the nested-neighbourhood structure of `H_k(T)`, for any graph and any `k`. -/
lemma sdr_iff_threshold (k : ℕ) :
    (∃ f : Slot G → LeafT G, Function.Injective f ∧ ∀ s, R28U2.occ G s.1.1 k ≤ R28U2.occ G (f s).1 k)
      ↔ ∀ t : ℕ, R28U2.slotsAtLeast G k t ≤ R28U2.leavesAtLeast G k t := by
  have h := sdr_iff_threshold_abstract (fun s : Slot G => R28U2.occ G s.1.1 k)
    (fun ℓ : LeafT G => R28U2.occ G ℓ.1 k)
  simp only [card_filter_slot_eq G k, card_filter_leaf_eq G k] at h
  exact h

end ConcreteSlots

end R28U2
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma R28CritU2T.degree_lemma_on_union 67ff442bcf37dd47f6073fcab2fdb3e68b0931cbb14231996bd20ac14fee96b4
namespace R28CritU2T

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- (1) Two-piece composition of the degree inequality, Finset-relative, ambient degree. -/
lemma degree_lemma_on_union {S T : Finset X} (hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y)
    (hdisj : Disjoint S T) (k : ℕ)
    (hS : ∀ a ≤ k, indepDegreeSumOn G S a ≤ 2 * a * indepCountOn G S a)
    (hT : ∀ b ≤ k, indepDegreeSumOn G T b ≤ 2 * b * indepCountOn G T b) :
    indepDegreeSumOn G (S ∪ T) k ≤ 2 * k * indepCountOn G (S ∪ T) k := by
  rw [indepDegreeSumOn_union G hsep hdisj, indepCountOn_union G hsep hdisj, Finset.mul_sum]
  apply Finset.sum_le_sum
  intro a ha
  have ha' : a ≤ k := by simp only [Finset.mem_range] at ha; omega
  have h1 := Nat.mul_le_mul_right (indepCountOn G T (k - a)) (hS a ha')
  have h2 := Nat.mul_le_mul_left (indepCountOn G S a) (hT (k - a) (Nat.sub_le k a))
  obtain ⟨c, rfl⟩ := Nat.exists_eq_add_of_le ha'
  rw [Nat.add_sub_cancel_left] at h1 h2 ⊢
  calc indepDegreeSumOn G S a * indepCountOn G T c + indepCountOn G S a * indepDegreeSumOn G T c
      ≤ 2 * a * indepCountOn G S a * indepCountOn G T c
          + indepCountOn G S a * (2 * c * indepCountOn G T c) := Nat.add_le_add h1 h2
    _ = 2 * (a + c) * (indepCountOn G S a * indepCountOn G T c) := by ring

end R28CritU2T
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma R28CritU2T.sum_empty_on 018d2df47acb0bcb8c1671ae08269519ed6bed40ba73e2e35d72eb913cfe9619
namespace R28CritU2T

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

lemma sum_empty_on (k : ℕ) :
    indepDegreeSumOn G (∅ : Finset X) k = 0 := by
  unfold indepDegreeSumOn indepFinsetOn
  refine Finset.sum_eq_zero (fun J hJ => ?_)
  simp only [Finset.mem_filter, Finset.subset_empty] at hJ
  rw [hJ.2, Finset.sum_empty]

end R28CritU2T
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma R28CritU2T.bridge 20d0191e642b632b34bf13eacdf82ae360924c7702d903753589cbdbf52900c0
namespace R28CritU2T

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- (2) The closed-set bridge. For `s` closed under adjacency, the induced graph's counts equal
the Finset-relative counts with ambient degree. -/
lemma bridge {s : Set X} [DecidablePred (· ∈ s)]
    (hclosed : ∀ v ∈ s, ∀ w, G.Adj v w → w ∈ s) (k : ℕ) :
    Erdos993G1.indepDegreeSum (G.induce s) k
        = indepDegreeSumOn G (Finset.univ.filter (· ∈ s)) k
      ∧ ((G.induce s).indepSetFinset k).card
        = indepCountOn G (Finset.univ.filter (· ∈ s)) k := by
  let e : ↥s ↪ X := Function.Embedding.subtype _
  have hi : ∀ J ∈ (G.induce s).indepSetFinset k,
      J.map e ∈ indepFinsetOn G (Finset.univ.filter (· ∈ s)) k := by
    intro J hJ
    rw [SimpleGraph.mem_indepSetFinset_iff] at hJ
    simp only [indepFinsetOn, Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff]
    refine ⟨⟨?_, by rw [Finset.card_map, hJ.card_eq]⟩, ?_⟩
    · intro x hx y hy hxy
      simp only [Finset.coe_map, Set.mem_image, Finset.mem_coe] at hx hy
      obtain ⟨x', hx', rfl⟩ := hx
      obtain ⟨y', hy', rfl⟩ := hy
      have hne : x' ≠ y' := fun h => hxy (by rw [h])
      exact hJ.isIndepSet (Finset.mem_coe.mpr hx') (Finset.mem_coe.mpr hy') hne
    · intro x hx
      simp only [Finset.mem_map] at hx
      obtain ⟨x', -, rfl⟩ := hx
      simp [e]
  have hj : ∀ J ∈ indepFinsetOn G (Finset.univ.filter (· ∈ s)) k,
      J.subtype (· ∈ s) ∈ (G.induce s).indepSetFinset k := by
    intro J hJ
    simp only [indepFinsetOn, Finset.mem_filter, SimpleGraph.mem_indepSetFinset_iff] at hJ
    obtain ⟨hJi, hJs⟩ := hJ
    have hJs' : ∀ x ∈ J, x ∈ s := fun x hx => by simpa using hJs hx
    rw [SimpleGraph.mem_indepSetFinset_iff]
    refine ⟨?_, ?_⟩
    · intro x hx y hy hxy
      simp only [Finset.mem_coe, Finset.mem_subtype] at hx hy
      simp only [SimpleGraph.comap_adj, Function.Embedding.coe_subtype, SimpleGraph.induce]
      exact hJi.isIndepSet (Finset.mem_coe.mpr hx) (Finset.mem_coe.mpr hy)
        (fun h => hxy (Subtype.ext h))
    · rw [← hJi.card_eq, ← Finset.card_map (Function.Embedding.subtype (· ∈ s)),
        Finset.subtype_map_of_mem hJs']
  have hl : ∀ J ∈ (G.induce s).indepSetFinset k, (J.map e).subtype (· ∈ s) = J := by
    intro J _
    ext x
    simp [e]
  have hr : ∀ J ∈ indepFinsetOn G (Finset.univ.filter (· ∈ s)) k,
      (J.subtype (· ∈ s)).map e = J := by
    intro J hJ
    simp only [indepFinsetOn, Finset.mem_filter] at hJ
    exact Finset.subtype_map_of_mem (fun x hx => by simpa using hJ.2 hx)
  refine ⟨?_, ?_⟩
  · unfold Erdos993G1.indepDegreeSum indepDegreeSumOn
    apply Finset.sum_nbij' (fun J => J.map e) (fun J => J.subtype (· ∈ s)) hi hj hl hr
    intro J _
    rw [Finset.sum_map]
    refine Finset.sum_congr rfl (fun v _ => ?_)
    apply SimpleGraph.degree_induce_of_neighborSet_subset
    intro w hw
    exact hclosed v.1 v.2 w hw
  · unfold indepCountOn
    exact Finset.card_nbij' (fun J => J.map e) (fun J => J.subtype (· ∈ s))
      (fun J hJ => hi J hJ) (fun J hJ => hj J hJ) (fun J hJ => hl J hJ) (fun J hJ => hr J hJ)

end R28CritU2T
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma R28CritU2T.supp_closed 22db38cac7bfaa81649ff297330943d58c4d7ce9926ccd591636557e26bf8a96
namespace R28CritU2T

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

omit [Fintype X] [DecidableEq X] [DecidableRel G.Adj] in
/-- A connected component's support is closed under adjacency (any graph). -/
lemma supp_closed (C : G.ConnectedComponent) (v : X) (hv : v ∈ C.supp) (w : X)
    (hvw : G.Adj v w) : w ∈ C.supp :=
  (C.mem_supp_congr_adj hvw).mp hv

end R28CritU2T
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma R28CritU2T.degree_lemma_of_components d9dfb9a70d1c7f5c153911ddbf701113860b622c61a38bf25877a0edde707593
namespace R28CritU2T

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- (3) Forest composition over all components, hypothesis at every `a ≤ k`. No acyclicity is
consumed: the statement holds for every finite simple graph. -/
lemma degree_lemma_of_components (k : ℕ)
    (hcomp : ∀ C : G.ConnectedComponent, ∀ a ≤ k,
      (Erdos993G1.indepDegreeSum (G.induce C.supp) a : ℤ)
        ≤ 2 * a * Erdos993G1.indepCount (G.induce C.supp) a) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k := by
  classical
  -- componentwise, Finset-relative
  have hC : ∀ C : G.ConnectedComponent, ∀ a ≤ k,
      indepDegreeSumOn G (Finset.univ.filter (· ∈ C.supp)) a
        ≤ 2 * a * indepCountOn G (Finset.univ.filter (· ∈ C.supp)) a := by
    intro C a ha
    obtain ⟨hD, hI⟩ := bridge G (supp_closed G C) a
    have h := hcomp C a ha
    rw [Erdos993G1.indepCount_eq_card_indepSetFinset] at h
    rw [← hD, ← hI]
    exact_mod_cast h
  -- induction over finsets of components
  have key : ∀ cs : Finset G.ConnectedComponent, ∀ a ≤ k,
      indepDegreeSumOn G (cs.biUnion (fun C => Finset.univ.filter (· ∈ C.supp))) a
        ≤ 2 * a * indepCountOn G (cs.biUnion (fun C => Finset.univ.filter (· ∈ C.supp))) a := by
    intro cs
    induction cs using Finset.induction_on with
    | empty =>
      intro a _
      simp only [Finset.biUnion_empty, sum_empty_on]
      exact Nat.zero_le _
    | insert C cs hC0 ih =>
      intro a ha
      rw [Finset.biUnion_insert]
      have hsep : ∀ x ∈ Finset.univ.filter (· ∈ C.supp),
          ∀ y ∈ cs.biUnion (fun C => Finset.univ.filter (· ∈ C.supp)), ¬ G.Adj x y := by
        intro x hx y hy hxy
        simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_biUnion] at hx hy
        obtain ⟨C', hC', hyC'⟩ := hy
        have hyC : y ∈ C.supp := supp_closed G C x hx y hxy
        rw [SimpleGraph.ConnectedComponent.mem_supp_iff] at hyC hyC'
        exact hC0 (hyC ▸ hyC' ▸ hC')
      have hdisj : Disjoint (Finset.univ.filter (· ∈ C.supp))
          (cs.biUnion (fun C => Finset.univ.filter (· ∈ C.supp))) := by
        rw [Finset.disjoint_left]
        intro x hx hy
        simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_biUnion] at hx hy
        obtain ⟨C', hC', hxC'⟩ := hy
        rw [SimpleGraph.ConnectedComponent.mem_supp_iff] at hx hxC'
        exact hC0 (hx ▸ hxC' ▸ hC')
      exact degree_lemma_on_union G hsep hdisj a (fun b hb => hC C b (hb.trans ha))
        (fun b hb => ih b (hb.trans ha))
  have huniv : (Finset.univ : Finset G.ConnectedComponent).biUnion
      (fun C => Finset.univ.filter (· ∈ C.supp)) = Finset.univ := by
    ext v
    simp only [Finset.mem_biUnion, Finset.mem_univ, Finset.mem_filter, true_and, iff_true]
    exact ⟨G.connectedComponentMk v, SimpleGraph.ConnectedComponent.connectedComponentMk_mem⟩
  have h := key Finset.univ k le_rfl
  rw [huniv, indepDegreeSumOn_univ, indepCountOn_univ] at h
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  exact_mod_cast h

end R28CritU2T
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma R28CritU2T.forest_degree_lemma_of_components_allk 5347e7031aacd894274a1f0936a238c4aa6e9a4d47740ab4548806f75fe5bc05
namespace R28CritU2T

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The contract-shaped wrapper, with the component hypothesis at every `a ≤ k`
(acyclicity carried on the face, unused). -/
lemma forest_degree_lemma_of_components_allk (_hG : G.IsAcyclic) (k : ℕ)
    (hcomp : ∀ C : G.ConnectedComponent, ∀ a ≤ k,
      (Erdos993G1.indepDegreeSum (G.induce C.supp) a : ℤ)
        ≤ 2 * a * Erdos993G1.indepCount (G.induce C.supp) a) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k :=
  degree_lemma_of_components G k hcomp

end R28CritU2T
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma R28CritU2T.induce_supp_isTree 892b3dc12bf5a7eb656f6f07816d34c1e1f8edb7b92080dc2fe1f951d12af376
namespace R28CritU2T

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

omit [Fintype X] [DecidableEq X] [DecidableRel G.Adj] in
/-- Acyclicity enters here and only here: each component of a finite forest, induced, is a tree. -/
lemma induce_supp_isTree (hG : G.IsAcyclic) (C : G.ConnectedComponent) :
    (G.induce C.supp).IsTree :=
  ⟨(SimpleGraph.ConnectedComponent.maximal_connected_induce_supp C).1, hG.induce _⟩

end R28CritU2T
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma R28CritU2T.forest_degree_lemma_of_tree_degree_lemma caf15263f6e7ea32eb687e16f68914706885be4b4828040d49286c0533fe68d4
namespace R28CritU2T

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- (DL) for every finite tree (at every size) ⇒ (DL) for every finite forest: the composition the
Hall/SDR route needs downstream of `tree_leaf_slot_dominance` + (LC). Acyclicity consumed only by
`induce_supp_isTree`. -/
lemma forest_degree_lemma_of_tree_degree_lemma (hG : G.IsAcyclic) (k : ℕ)
    (htree : ∀ (Y : Type u) [Fintype Y] [DecidableEq Y] (H : SimpleGraph Y) [DecidableRel H.Adj],
      H.IsTree → ∀ a : ℕ,
        (Erdos993G1.indepDegreeSum H a : ℤ) ≤ 2 * a * Erdos993G1.indepCount H a) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k :=
  degree_lemma_of_components G k
    (fun C a _ => htree _ (G.induce C.supp) (induce_supp_isTree G hG C) a)

end R28CritU2T
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma R28CritU2F.dl_union f6feac9c01d2b756135daf54b098136338e931a77a562f2b62da6077f256cce9
namespace R28CritU2F

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Two-piece (DL) composition. The hypotheses are needed at EVERY size `a ≤ k`, not only at `k`:
the convolution mixes all split sizes. No acyclicity. -/
lemma dl_union {S T : Finset X} (hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y) (hdisj : Disjoint S T)
    (k : ℕ)
    (hS : ∀ a ≤ k, indepDegreeSumOn G S a ≤ 2 * a * indepCountOn G S a)
    (hT : ∀ a ≤ k, indepDegreeSumOn G T a ≤ 2 * a * indepCountOn G T a) :
    indepDegreeSumOn G (S ∪ T) k ≤ 2 * k * indepCountOn G (S ∪ T) k := by
  rw [indepDegreeSumOn_union G hsep hdisj, indepCountOn_union G hsep hdisj, Finset.mul_sum]
  apply Finset.sum_le_sum
  intro a ha
  have ha' : a ≤ k := by simp only [Finset.mem_range] at ha; omega
  have h1 := Nat.mul_le_mul_right (indepCountOn G T (k - a)) (hS a ha')
  have h2 := Nat.mul_le_mul_left (indepCountOn G S a) (hT (k - a) (Nat.sub_le k a))
  have hk : 2 * k = 2 * a + 2 * (k - a) := by omega
  calc _ ≤ 2 * a * indepCountOn G S a * indepCountOn G T (k - a)
          + indepCountOn G S a * (2 * (k - a) * indepCountOn G T (k - a)) := Nat.add_le_add h1 h2
    _ = 2 * k * (indepCountOn G S a * indepCountOn G T (k - a)) := by rw [hk]; ring

end R28CritU2F
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma R28CritU2F.card_isolated_le_one 4cb656d841721c281b53e9008548a03696e71dd933c1fb289c85d26a1e5b2bc2
namespace R28CritU2F

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- A connected graph has at most one isolated vertex. -/
lemma card_isolated_le_one (hC : G.Connected) :
    ((Finset.univ : Finset X).filter (fun v => G.degree v = 0)).card ≤ 1 := by
  rw [Finset.card_le_one]
  intro a ha b hb
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
  by_contra hab
  obtain ⟨p⟩ := hC.preconnected a b
  cases p with
  | nil => exact hab rfl
  | cons h _ =>
    have : 0 < G.degree a := (G.degree_pos_iff_exists_adj a).2 ⟨_, h⟩
    omega

end R28CritU2F
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma R28CritU2F.tree_slots_zero_le 989705c8d7085d66fca2d59e849a1432676ecfbd1a347ca39eb842ec53499c34
namespace R28CritU2F

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The `t = 0` threshold instance on a tree: total slots ≤ leaves. This is the case the
threshold form (HS) of `SEMANTIC-CONTRACT.md` §2 (quantified over `t ≥ 1`) omits and the
matching form (HS-SDR) needs; it consumes BOTH connectivity (at most one isolated vertex) and
acyclicity (via `|E| + 1 = n`). -/
lemma tree_slots_zero_le (hT : G.IsTree) (k : ℕ) :
    slotsAtLeast G k 0 ≤ leavesAtLeast G k 0 := by
  classical
  have hE := hT.card_edgeFinset
  have hH := G.sum_degrees_eq_twice_card_edges
  have hI := card_isolated_le_one G hT.connected
  have hs : slotsAtLeast G k 0
      = ∑ v, (if 3 ≤ G.degree v then G.degree v - 2 else 0) := by
    unfold slotsAtLeast
    rw [Finset.sum_filter]
    refine Finset.sum_congr rfl (fun v _ => ?_)
    simp
  have hl : leavesAtLeast G k 0 = ∑ v, (if G.degree v = 1 then 1 else 0) := by
    unfold leavesAtLeast
    rw [Finset.card_filter]
    refine Finset.sum_congr rfl (fun v _ => ?_)
    simp
  have hi : ((Finset.univ : Finset X).filter (fun v => G.degree v = 0)).card
      = ∑ v, (if G.degree v = 0 then 1 else 0) := Finset.card_filter _ _
  have key : ∀ v : X,
      ((if 3 ≤ G.degree v then G.degree v - 2 else 0 : ℕ) : ℤ)
        - ((if G.degree v = 1 then 1 else 0 : ℕ) : ℤ)
        = (G.degree v : ℤ) - 2 + 2 * ((if G.degree v = 0 then 1 else 0 : ℕ) : ℤ) := by
    intro v
    split_ifs <;> push_cast <;> omega
  have hsum : ((slotsAtLeast G k 0 : ℕ) : ℤ) - (leavesAtLeast G k 0 : ℤ)
      = 2 * (((Finset.univ : Finset X).filter (fun v => G.degree v = 0)).card : ℤ) - 2 := by
    rw [hs, hl, hi]
    push_cast
    rw [← Finset.sum_sub_distrib]
    simp only [Nat.cast_ite, Nat.cast_one, Nat.cast_zero] at key
    rw [Finset.sum_congr rfl (fun v _ => key v)]
    rw [Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum]
    simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
    have hH' : (∑ v, (G.degree v : ℤ)) = 2 * (G.edgeFinset.card : ℤ) := by
      exact_mod_cast hH
    have hE' : (G.edgeFinset.card : ℤ) + 1 = (Fintype.card X : ℤ) := by exact_mod_cast hE
    rw [hH']
    linarith
  have : (((Finset.univ : Finset X).filter (fun v => G.degree v = 0)).card : ℤ) ≤ 1 := by
    exact_mod_cast hI
  have : ((slotsAtLeast G k 0 : ℕ) : ℤ) ≤ (leavesAtLeast G k 0 : ℤ) := by linarith
  exact_mod_cast this

end R28CritU2F
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma R28CritU2F.sdr_iff_threshold_pos_of_tree 6e6c6520694c3679797e4f0d5fe7acbe23f8ec9f673a2197da3da8ff2b2fe274
namespace R28CritU2F

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Hence, on a tree, the matching form (HS-SDR) is equivalent to the threshold form quantified
over `t ≥ 1` only (the contract's (HS)); without a tree hypothesis this is false (K₄, k = 2). -/
lemma sdr_iff_threshold_pos_of_tree (hT : G.IsTree) (k : ℕ) :
    (∃ f : Slot G → LeafT G, Function.Injective f ∧
        ∀ s, occ G s.1.1 k ≤ occ G (f s).1 k)
      ↔ ∀ t : ℕ, 1 ≤ t → slotsAtLeast G k t ≤ leavesAtLeast G k t := by
  rw [sdr_iff_threshold G k]
  constructor
  · intro h t _; exact h t
  · intro h t
    rcases Nat.eq_zero_or_pos t with rfl | ht
    · exact tree_slots_zero_le G hT k
    · exact h t ht

end R28CritU2F
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma R28CritU2F.mem_of_reachable_of_closed 9c915bda6219b8909bd79a77f48b6579d620953d6aca98cb596bad51cd503b66
namespace R28CritU2F

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

omit [Fintype X] [DecidableEq X] [DecidableRel G.Adj] in
/-- Reachability stays inside a finset closed under adjacency. -/
lemma mem_of_reachable_of_closed {W : Finset X} (hW : ∀ x ∈ W, ∀ y, G.Adj x y → y ∈ W)
    {v w : X} (hv : v ∈ W) (hr : G.Reachable v w) : w ∈ W := by
  obtain ⟨p⟩ := hr
  induction p with
  | nil => exact hv
  | cons h _ ih => exact ih (hW _ hv _ h)

end R28CritU2F
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma R28CritU2F.dl_closed_of_components d61ea90169836feff63292640992406cb9c0d68139f93c5593eda1efb00ec1c2
namespace R28CritU2F

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Peeling induction (Finset level): (DL) at every size `a ≤ k` on every connected-component
support implies (DL) at `k` on every adjacency-closed finset, hence on `univ`. No acyclicity. -/
lemma dl_closed_of_components (k : ℕ)
    (hcomp : ∀ (C : G.ConnectedComponent) (S : Finset X), (∀ x, x ∈ S ↔ x ∈ C.supp) →
      ∀ a ≤ k, indepDegreeSumOn G S a ≤ 2 * a * indepCountOn G S a) :
    ∀ (W : Finset X), (∀ x ∈ W, ∀ y, G.Adj x y → y ∈ W) →
      ∀ a ≤ k, indepDegreeSumOn G W a ≤ 2 * a * indepCountOn G W a := by
  classical
  intro W
  induction W using Finset.strongInduction with
  | H W ih =>
    intro hW a ha
    rcases W.eq_empty_or_nonempty with rfl | ⟨v, hvW⟩
    · have : indepDegreeSumOn G (∅ : Finset X) a = 0 := by
        unfold indepDegreeSumOn
        refine Finset.sum_eq_zero (fun J hJ => ?_)
        simp only [indepFinsetOn, Finset.mem_filter, Finset.subset_empty] at hJ
        rw [hJ.2]; rfl
      rw [this]; exact Nat.zero_le _
    · set C := G.connectedComponentMk v with hC
      set S := (Finset.univ : Finset X).filter (fun x => x ∈ C.supp) with hSdef
      set T := W \ S with hTdef
      have hSmem : ∀ x, x ∈ S ↔ x ∈ C.supp := by
        intro x; simp [hSdef]
      have hSW : S ⊆ W := by
        intro x hx
        rw [hSmem, SimpleGraph.ConnectedComponent.mem_supp_iff, hC,
          SimpleGraph.ConnectedComponent.eq] at hx
        exact mem_of_reachable_of_closed G hW hvW hx.symm
      have hvS : v ∈ S := by rw [hSmem]; exact SimpleGraph.ConnectedComponent.connectedComponentMk_mem
      have hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y := by
        intro x hx y hy hxy
        rw [hTdef, Finset.mem_sdiff] at hy
        apply hy.2
        rw [hSmem] at hx ⊢
        exact (C.mem_supp_congr_adj hxy).1 hx
      have hdisj : Disjoint S T := Finset.disjoint_sdiff
      have hunion : S ∪ T = W := Finset.union_sdiff_of_subset hSW
      have hTclosed : ∀ x ∈ T, ∀ y, G.Adj x y → y ∈ T := by
        intro x hx y hxy
        rw [hTdef, Finset.mem_sdiff] at hx ⊢
        refine ⟨hW x hx.1 y hxy, fun hyS => hx.2 ?_⟩
        rw [hSmem] at hyS ⊢
        exact (C.mem_supp_congr_adj hxy).2 hyS
      have hTlt : T ⊂ W := by
        rw [hTdef]
        exact Finset.sdiff_ssubset hSW ⟨v, hvS⟩
      rw [← hunion]
      have := dl_union G hsep hdisj a
        (fun b hb => hcomp C S hSmem b (le_trans hb ha))
        (fun b hb => ih T hTlt hTclosed b (le_trans hb ha))
      exact this

end R28CritU2F
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma R28CritU2F.degree_lemma_of_component_supports 14f9886cad0e2f99ccbba64b2670980ccd994a5922ea5c2bb778d639c25492f1
namespace R28CritU2F

open R28U2

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The forest step, Finset-relative component form, with the component hypothesis at every
size `a ≤ k` (the single-`k` form does not compose: K₄ ⊔ K₄ at k = 2), stated in the G1 ℤ form. -/
lemma degree_lemma_of_component_supports (k : ℕ)
    (hcomp : ∀ (C : G.ConnectedComponent) (S : Finset X), (∀ x, x ∈ S ↔ x ∈ C.supp) →
      ∀ a ≤ k, indepDegreeSumOn G S a ≤ 2 * a * indepCountOn G S a) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k := by
  have h := dl_closed_of_components G k hcomp Finset.univ
    (fun _ _ _ _ => Finset.mem_univ _) k le_rfl
  rw [indepDegreeSumOn_univ, indepCountOn_univ] at h
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  exact_mod_cast h

end R28CritU2F
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma Erdos993G1.sdr_iff_threshold_pos_of_tree fa8cfc72dae188191e5687376ca7ce8abb1a27f9b48284ae098750bc574e89f5
namespace Erdos993G1

/-- **SDR face of `E993-R28-SDR-THRESHOLD-EQUIVALENCE`** (in-run, seat
`c1-la3-formalizer-opus-20260925`; statement of record of the r28 Cycle 1 synthesis, `## Lean awards`,
C1-LA3). On a finite tree, for each `k`: an injection from the branch slots
`R28U2.Slot G = Σ v : {v // 3 ≤ G.degree v}, Fin (G.degree v - 2)` into the vertices, landing on
leaves and respecting occupancy, exists iff the threshold inequality holds at every `t ≥ 1`.
An equivalence per `(G, k)`, never evidence for either side. Proof: the codomain change
`X`-with-`degree = 1` ↔ `R28U2.LeafT G`, then C-U2-F's `R28CritU2F.sdr_iff_threshold_pos_of_tree`
(itself U2's graph-general `R28U2.sdr_iff_threshold` plus C-U2-F's tree `t = 0` lemma). -/
lemma sdr_iff_threshold_pos_of_tree {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ) :
    (∃ f : R28U2.Slot G → X, Function.Injective f ∧
        ∀ s, G.degree (f s) = 1 ∧ R28U2.occ G s.1.1 k ≤ R28U2.occ G (f s) k) ↔
      (∀ t, 1 ≤ t → R28U2.slotsAtLeast G k t ≤ R28U2.leavesAtLeast G k t) := by
  rw [← R28CritU2F.sdr_iff_threshold_pos_of_tree G hT k]
  constructor
  · rintro ⟨f, hf, h⟩
    exact ⟨fun s => ⟨f s, (h s).1⟩, fun a b hab => hf (congrArg Subtype.val hab),
      fun s => (h s).2⟩
  · rintro ⟨f, hf, h⟩
    exact ⟨fun s => (f s).1, fun a b hab => hf (Subtype.ext hab), fun s => ⟨(f s).2, h s⟩⟩

end Erdos993G1
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN theorem Erdos993G1.forest_degree_lemma_of_tree_degree_lemma 1e72e521f6ffe8d6e3664206123115c2a7f6d26ad1d62156ea00ce65215839d7
namespace Erdos993G1

/-- **(FC) face of `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES`** at the corrected hypothesis (erratum
R28-E-c): if the degree lemma `D_a(T) ≤ 2a·i_a(T)` holds for every finite tree `T` (on any carrier in
universe `u`) at every size `a ≤ k`, then it holds at `k` for every finite forest `G`. Acyclicity is
consumed only by `R28CritU2T.induce_supp_isTree`; the composition is C-U2-T's
`R28CritU2T.degree_lemma_of_components` (bridge + peel over components) on U2's separated-union
convolution `R28U2.indepDegreeSumOn_union` / `R28U2.indepCountOn_union`. The formal consequence
clause of `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`; never composed with r27's
`forest_degree_lemma` to present a second proof of (DL). In-run wrapper by seat
`c1-la3-formalizer-opus-20260925`; C-U2-T's `R28CritU2T.forest_degree_lemma_of_tree_degree_lemma`
is the compiled model. -/
theorem forest_degree_lemma_of_tree_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ)
    (htree : ∀ {Y : Type u} [Fintype Y] [DecidableEq Y] (T : SimpleGraph Y) [DecidableRel T.Adj], T.IsTree →
      ∀ a ≤ k, (Erdos993G1.indepDegreeSum T a : ℤ) ≤ 2 * a * Erdos993G1.indepCount T a) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k :=
  R28CritU2T.degree_lemma_of_components G k
    (fun C a ha => htree (G.induce C.supp) (R28CritU2T.induce_supp_isTree G hG C) a ha)

end Erdos993G1
-- VERITYOS ENTRY 51 END

