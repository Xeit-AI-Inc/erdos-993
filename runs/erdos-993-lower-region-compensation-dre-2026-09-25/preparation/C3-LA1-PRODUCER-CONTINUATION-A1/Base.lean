import Mathlib

universe u

noncomputable def Erdos993G1.indepCount {V : Type u}
    (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)


namespace C4LA1

variable {V : Type*}

/-- A graph leaf has exactly one adjacent vertex. -/
def IsGraphLeaf (G : SimpleGraph V) (v : V) : Prop :=
  ∃! u, G.Adj v u

end C4LA1

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

namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `H_v = G - {v, s_v}`, realised as the deletion set for a leaf `v`. -/
noncomputable
def H (G : SimpleGraph V) (v : V) : Finset V :=
  {v, support G v}

end C5LA1

namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `R_v = G - N[s_v]`, realised as the deletion set for a leaf `v`. -/
noncomputable
def R (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  insert (support G v) (G.neighborFinset (support G v))

end C5LA1

namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I_k(G - D)`: independent `k`-subsets of the original vertex type
avoiding the finite deletion set `D`. -/
def indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Finset (Finset V) :=
  ((Finset.univ \ D).powersetCard k).filter fun s : Finset V => G.IsIndepSet (s : Set V)

end C5LA1

namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `i_k(G - D)`. -/
def indepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Nat :=
  (indepSetsAvoiding G D k).card

end C5LA1

namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `Delta_k(G - D) = i_(k+1)(G-D) - i_k(G-D)`. -/
def forwardDifferenceDel (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Int :=
  (indepSetCount G D (k + 1) : Int) - indepSetCount G D k

end C5LA1

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

namespace E993OrderBand

open Classical

noncomputable
def multiFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) : Finset (Finset V) :=
  (E993Interior.taggedFamily G U W (k + 1)).filter fun B =>
    2 ≤ (B ∩ W).card

end E993OrderBand

namespace E993OrderBand

open Classical

noncomputable
def extensionSet {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U A : Finset V) : Finset V :=
  U.filter fun y => y ∉ A ∧ G.IsIndepSet ((insert y A : Finset V) : Set V)

end E993OrderBand

namespace E993OrderBand

open Classical

noncomputable
def goodFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) : Finset (Finset V) :=
  (E993Interior.taggedFamily G U W k).filter fun A =>
    ∃ x ∈ U, ∃ a ∈ A, G.Adj x a

end E993OrderBand

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

namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The forward coefficient difference `i_(p+1)(G-v) - i_p(G-v)`, with
natural counts embedded in the integers. -/
def vertexDeletionForwardDifference (G : SimpleGraph V) [DecidableRel G.Adj]
    (v : V) (p : Nat) : Int :=
  (vertexDeletionIndepSetCount G v (p + 1) : Int) -
    vertexDeletionIndepSetCount G v p

end C4LA1

namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Literal strict favorability of an original leaf at rank `p`. -/
def IsFavorableAt (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (p : Nat) : Prop :=
  vertexDeletionForwardDifference G v p < 0

end C4LA1

namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- The set of original leaves of `G`. -/
noncomputable
def leafSet (G : SimpleGraph V) : Finset V :=
  Finset.univ.filter (C4LA1.IsGraphLeaf G)

end C5LA1

namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `lambda(s)`: the number of leaves of `G` adjacent to `s`, zero off
supports. -/
noncomputable
def leafDegree (G : SimpleGraph V) [DecidableRel G.Adj] (s : V) : Nat :=
  ((leafSet G).filter fun v => G.Adj v s).card

end C5LA1

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

noncomputable def Erdos993G1.coeff {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0


noncomputable def Erdos993G1.delta {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k


noncomputable def Erdos993G1.firstDescent {V : Type u}
    (F : SimpleGraph V) : ℕ :=
  sInf {k : ℕ | Erdos993G1.delta F (k : ℤ) < 0}


noncomputable def Erdos993G1.vertexDegree {V : Type u}
    (F : SimpleGraph V) (v : V) : ℕ :=
  Nat.card (F.neighborSet v)


def Erdos993G1.closedNeighborhood {V : Type u}
    (T : SimpleGraph V) (v : V) : Set V :=
  {w | w = v ∨ T.Adj v w}


def Erdos993G1.deleteVerts {V : Type u}
    (F : SimpleGraph V) (S : Set V) : SimpleGraph {w : V // w ∉ S} :=
  F.induce Sᶜ


def Erdos993G1.ambientA {V : Type u}
    (T : SimpleGraph V) (v : V) :=
  Erdos993G1.deleteVerts T (Erdos993G1.closedNeighborhood T v)


def Erdos993G1.ambientH {V : Type u}
    (T : SimpleGraph V) (v g : V) :=
  Erdos993G1.deleteVerts T (Erdos993G1.closedNeighborhood T v ∪ {g})


def Erdos993G1.residual {V : Type u}
    (T : SimpleGraph V) (v g : V) :=
  Erdos993G1.deleteVerts T
    (Erdos993G1.closedNeighborhood T v ∪ Erdos993G1.closedNeighborhood T g)


noncomputable def Erdos993G1.residualOrder {V : Type u}
    (T : SimpleGraph V) (v g : V) : ℕ :=
  Nat.card {w : V //
    w ∉ Erdos993G1.closedNeighborhood T v ∪ Erdos993G1.closedNeighborhood T g}


def Erdos993G1.ordinaryG1Guards {V : Type u}
    (T : SimpleGraph V) (v s g : V) (p : ℕ) : Prop :=
  T.IsTree ∧
  Erdos993G1.vertexDegree T v = 1 ∧ T.Adj v s ∧
  Erdos993G1.vertexDegree T s = 2 ∧ T.Adj s g ∧ g ≠ v ∧
  p = Erdos993G1.firstDescent T + 1 ∧
  Erdos993G1.delta (Erdos993G1.ambientA T v) (p : ℤ) +
    Erdos993G1.delta (Erdos993G1.ambientH T v g) ((p : ℤ) - 1) < 0 ∧
  2 * p - 3 < Erdos993G1.residualOrder T v g ∧
  Erdos993G1.firstDescent (Erdos993G1.residual T v g) < p - 2


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)


namespace FirstWide

noncomputable def stratum {X : Type u} [Fintype X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ) : Finset (Finset X) := by
  classical
  exact (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j)

end FirstWide

namespace FirstWide

def binomCoeff (n : ℕ) (k : ℤ) : ℤ :=
  if 0 ≤ k then (n.choose k.toNat : ℤ) else 0

end FirstWide

lemma isNIndepSet_zero_iff (S : Finset V) :
    F.IsNIndepSet 0 S ↔ S = ∅ := by
  simpa only [SimpleGraph.isNClique_compl] using
    (SimpleGraph.isNClique_zero (G := Fᶜ) (s := S))


lemma isNIndepSet_one_iff (S : Finset V) :
    F.IsNIndepSet 1 S ↔ ∃ a, S = {a} := by
  classical
  simpa only [SimpleGraph.isNClique_compl] using
    (SimpleGraph.isNClique_one (G := Fᶜ) (s := S))


lemma indepCount_eq_card_indepSetFinset [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]


lemma indepCount_nonneg (k : ℕ) : 0 ≤ indepCount F k := by
  exact Int.natCast_nonneg _


lemma indepCount_zero [Finite V] : indepCount F 0 = 1 := by
  classical
  letI := Fintype.ofFinite V
  rw [indepCount_eq_card_indepSetFinset]
  have h : F.indepSetFinset 0 = {∅} := by
    ext S
    simp [SimpleGraph.mem_indepSetFinset_iff, isNIndepSet_zero_iff]
  simp [h]


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


lemma indepCount_eq_zero_of_indepNum_lt [Finite V] {k : ℕ}
    (hk : F.indepNum < k) : indepCount F k = 0 := by
  haveI : IsEmpty {S : Finset V // F.IsNIndepSet k S} :=
    ⟨fun S => by
      have h := S.property.isIndepSet.card_le_indepNum
      rw [S.property.card_eq] at h
      exact (not_le_of_gt hk) h⟩
  simp [indepCount]


lemma indepCount_indepNum_pos [Finite V] :
    0 < indepCount F F.indepNum := by
  obtain ⟨S, hS⟩ := F.exists_isNIndepSet_indepNum
  haveI : Nonempty {S : Finset V // F.IsNIndepSet F.indepNum S} := ⟨⟨S, hS⟩⟩
  unfold indepCount
  exact_mod_cast (Nat.card_pos (α := {S : Finset V // F.IsNIndepSet F.indepNum S}))


lemma coeff_nat (k : ℕ) : coeff F (k : ℤ) = indepCount F k := by
  simp [coeff]


lemma coeff_of_neg {k : ℤ} (hk : k < 0) : coeff F k = 0 := by
  simp [coeff, not_le_of_gt hk]


lemma delta_nat (k : ℕ) :
    delta F (k : ℤ) = indepCount F (k + 1) - indepCount F k := by
  simpa only [delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (coeff_nat F (k + 1)) (coeff_nat F k)


lemma delta_zero [Finite V] : delta F 0 = (Nat.card V : ℤ) - 1 := by
  simpa [indepCount_zero, indepCount_one] using (delta_nat F 0)


lemma delta_neg_one [Finite V] : delta F (-1) = 1 := by
  simp [delta, coeff, indepCount_zero]


lemma descentSet_nonempty [Finite V] :
    {k : ℕ | delta F (k : ℤ) < 0}.Nonempty := by
  refine ⟨F.indepNum, ?_⟩
  change delta F (F.indepNum : ℤ) < 0
  rw [delta_nat, indepCount_eq_zero_of_indepNum_lt F (Nat.lt_succ_self _)]
  have h := indepCount_indepNum_pos F
  omega


lemma delta_firstDescent_neg [Finite V] :
    delta F (firstDescent F : ℤ) < 0 := by
  exact Nat.sInf_mem (descentSet_nonempty F)


lemma delta_nonneg_of_lt_firstDescent {k : ℕ} (hk : k < firstDescent F) :
    0 ≤ delta F (k : ℤ) := by
  exact le_of_not_gt (Nat.notMem_of_lt_sInf hk)


lemma firstDescent_le_of_delta_neg {k : ℕ} (hk : delta F (k : ℤ) < 0) :
    firstDescent F ≤ k :=
  Nat.sInf_le hk

end Erdos993G1


universe w

namespace Erdos993G1

variable {V : Type u} {W : Type w} {F : SimpleGraph V} {G : SimpleGraph W}


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


lemma coeff_iso (e : F ≃g G) (k : ℤ) : coeff F k = coeff G k := by
  simp only [coeff, indepCount_iso e]


lemma delta_iso (e : F ≃g G) (k : ℤ) : delta F k = delta G k := by
  simp only [delta, coeff_iso e]


lemma firstDescent_iso (e : F ≃g G) : firstDescent F = firstDescent G := by
  simp only [firstDescent, delta_iso e]


lemma vertexDegree_eq_degree (a : V) [Fintype (F.neighborSet a)] :
    vertexDegree F a = F.degree a := by
  rw [vertexDegree, Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]


lemma deleteVerts_isAcyclic (h : F.IsAcyclic) (S : Set V) :
    (deleteVerts F S).IsAcyclic :=
  h.induce _


lemma residual_isAcyclic (h : F.IsAcyclic) (v g : V) :
    (residual F v g).IsAcyclic :=
  h.induce _


lemma residualOrder_eq_card (v g : V) :
    residualOrder F v g =
      Nat.card {a : V // a ∉ closedNeighborhood F v ∪ closedNeighborhood F g} :=
  rfl

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)


lemma isNIndepSet_pair_iff [DecidableEq V] (a b : V) :
    F.IsNIndepSet 2 {a, b} ↔ a ≠ b ∧ ¬F.Adj a b := by
  by_cases h : a = b
  · subst b
    simp [SimpleGraph.isNIndepSet_iff]
  · simp [SimpleGraph.isNIndepSet_iff, SimpleGraph.isIndepSet_iff, Set.Pairwise, h, F.adj_comm] <;> tauto


lemma sym2_toFinset_injective [DecidableEq V] :
    Function.Injective (Sym2.toFinset : Sym2 V → Finset V) := by
  intro a b h
  apply Sym2.ext
  intro v
  simpa only [Sym2.mem_toFinset] using iff_of_eq (congrArg (v ∈ ·) h)


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


lemma indepSetFinset_eq_filter_powersetCard [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    F.indepSetFinset k = ((Finset.univ : Finset V).powersetCard k).filter
      (fun B : Finset V => F.IsIndepSet B) := by
  ext B
  simp [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff, and_comm]


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


lemma sum_card_filter_swap {A : Type u} {B : Type w}
    (s : Finset A) (t : Finset B) (p : A → B → Prop)
    [DecidableRel p] :
    ∑ a ∈ s, (t.filter (p a)).card =
      ∑ b ∈ t, (s.filter (fun a => p a b)).card := by
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]
  exact Finset.sum_comm


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


lemma sum_indep_indicator [Fintype V] [DecidableEq V] [DecidableRel F.Adj]
    (k : ℕ) :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard k,
      (if F.IsIndepSet B then 1 else 0) = (F.indepSetFinset k).card := by
  rw [indepSetFinset_eq_filter_powersetCard]
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]

end Erdos993G1


namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)


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



lemma Erdos993G1.pathEight_indepCount_three :
    Erdos993G1.indepCount (SimpleGraph.pathGraph 8) 3 = 20 := by
  letI : DecidableRel (SimpleGraph.pathGraph 8).Adj := fun v w =>
    decidable_of_iff (v.val + 1 = w.val ∨ w.val + 1 = v.val) SimpleGraph.pathGraph_adj.symm
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  decide


lemma Erdos993G1.pathEight_indepCount_four :
    Erdos993G1.indepCount (SimpleGraph.pathGraph 8) 4 = 5 := by
  letI : DecidableRel (SimpleGraph.pathGraph 8).Adj := fun v w =>
    decidable_of_iff (v.val + 1 = w.val ∨ w.val + 1 = v.val) SimpleGraph.pathGraph_adj.symm
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset]
  decide


lemma Erdos993G1.pathEight_delta_three :
    Erdos993G1.delta (SimpleGraph.pathGraph 8) 3 = -15 := by
  have h := Erdos993G1.delta_nat (SimpleGraph.pathGraph 8) 3
  norm_num [Erdos993G1.pathEight_indepCount_three,
    Erdos993G1.pathEight_indepCount_four] at h
  exact h

namespace Erdos993G1


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


lemma components_card_pos_of_card_pos {V : Type u} [Finite V]
    (F : SimpleGraph V) (hV : 0 < Nat.card V) :
    0 < Nat.card F.ConnectedComponent := by
  haveI : Nonempty V := (Finite.card_pos_iff).mp hV
  exact Nat.card_pos


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


lemma tree_order_eight_maxDegreeTwo_iso_pathGraph {V : Type u} [Finite V]
    {G : SimpleGraph V} (hG : G.IsTree) (horder : Nat.card V = 8)
    (hdeg : ∀ v, Nat.card (G.neighborSet v) ≤ 2) :
    Nonempty (G ≃g SimpleGraph.pathGraph 8) := by
  exact cast (congrArg (fun n => Nonempty (G ≃g SimpleGraph.pathGraph n)) horder)
    (tree_maxDegreeTwo_iso_pathGraph_card hG hdeg)

end Erdos993G1.PathClassification



lemma Erdos993G1.lowRankArithmetic
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



lemma Erdos993G1.degreeDefect_nonneg (d : ℕ) :
    (0 : ℤ) ≤ (d.choose 2 : ℤ) - (d : ℤ) + 1 := by
  cases d with
  | zero => norm_num
  | succ n =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    have h := (Nat.cast_nonneg (n.choose 2) : (0 : ℤ) ≤ n.choose 2)
    omega


lemma Erdos993G1.degreeDefect_eq_zero_iff (d : ℕ) :
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


lemma Erdos993G1.degreeChoose_sum_lower {V : Type*} [Fintype V] (d : V → ℕ) :
    (∑ v, (d v : ℤ)) - Fintype.card V ≤ ∑ v, ((d v).choose 2 : ℤ) := by
  have h : 0 ≤ ∑ v, (((d v).choose 2 : ℤ) - (d v : ℤ) + 1) :=
    Finset.sum_nonneg (fun v _ => Erdos993G1.degreeDefect_nonneg (d v))
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, mul_one] at h
  omega


lemma Erdos993G1.degreeChoose_sum_equality {V : Type*} [Fintype V] (d : V → ℕ)
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



lemma Erdos993G1.scaledChooseTwo (n : ℕ) :
    2 * (n.choose 2 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    change 2 * ((n : ℤ) + (n.choose 2 : ℤ)) =
      ((n : ℤ) + 1) * ((n : ℤ) + 1 - 1)
    nlinarith


lemma Erdos993G1.scaledChooseThree (n : ℕ) :
    6 * (n.choose 3 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) * ((n : ℤ) - 2) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.cast_add, Nat.cast_succ]
    change 6 * ((n.choose 2 : ℤ) + (n.choose 3 : ℤ)) =
      ((n : ℤ) + 1) * ((n : ℤ) + 1 - 1) * ((n : ℤ) + 1 - 2)
    nlinarith [Erdos993G1.scaledChooseTwo n]



lemma Erdos993G1.lowRankForestClassification_of_count_identities
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

namespace Erdos993G1.Deletion

open SimpleGraph


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


lemma ambientH_iso_delete_ambientA {V : Type u} (T : SimpleGraph V) (v g : V) :
    Nonempty (ambientH T v g ≃g
      deleteVerts (ambientA T v) {a | a.val = g}) := by
  exact deleteVerts_union_iso T (closedNeighborhood T v) {g}


lemma original_residual_deletion_set_eq {V : Type u} (T : SimpleGraph V)
    (v s g : V) (hvs : T.Adj v s) :
    (closedNeighborhood T v ∪ {g}) ∪ {w | T.Adj g w ∧ w ≠ s} =
      closedNeighborhood T v ∪ closedNeighborhood T g := by
  ext w
  simp only [closedNeighborhood, Set.mem_union, Set.mem_singleton_iff, Set.mem_setOf_eq]
  by_cases hws : w = s <;> aesop


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


lemma leaf_ambientH_iso_delete_typed_survivor {V : Type u} [Finite V]
    (T : SimpleGraph V) (v s g : V) (hleaf : vertexDegree T v = 1)
    (hvs : T.Adj v s) (hsg : T.Adj s g) (hgv : g ≠ v) :
    Nonempty (ambientH T v g ≃g deleteVerts (ambientA T v)
      {⟨g, other_support_neighbor_survives T v s g hleaf hvs hsg hgv⟩}) :=
  ambientH_iso_delete_typed_survivor T v g
    (other_support_neighbor_survives T v s g hleaf hvs hsg hgv)

end Erdos993G1.Deletion



lemma Erdos993G1.lowRankForestClassification {V : Type u} [Finite V]
    (F : SimpleGraph V) (p : ℕ) (hF : F.IsAcyclic) (hp : p ≤ 5)
    (hm : 2 * p - 3 < Nat.card V) (hx : Erdos993G1.firstDescent F < p - 2) :
    p = 5 ∧ Nonempty (F ≃g SimpleGraph.pathGraph 8) ∧
      Erdos993G1.delta F 3 = -15 := by
  classical
  letI := Fintype.ofFinite V
  exact Erdos993G1.lowRankForestClassification_of_count_identities F p hF hp hm hx
    (Erdos993G1.indepCount_two_add_edges F)
    (Erdos993G1.indepCount_three_add_edge_incidence F hF)


lemma Erdos993G1.ordinaryG1_lowRank {W : Type u} [Finite W]
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



namespace Erdos993G1.FirstWide

lemma binomCoeff_nat (n k : ℕ) : binomCoeff n (k : ℤ) = (n.choose k : ℤ) := by
  simp [binomCoeff]

end Erdos993G1.FirstWide

namespace Erdos993G1.FirstWide

lemma binomCoeff_neg (n : ℕ) {k : ℤ} (hk : k < 0) : binomCoeff n k = 0 := by
  simp [binomCoeff, not_le.mpr hk]

end Erdos993G1.FirstWide

namespace Erdos993G1.FirstWide

lemma binomCoeff_nat_add_one (n k : ℕ) :
    binomCoeff n ((k : ℤ) + 1) = (n.choose (k + 1) : ℤ) := by
  simpa only [Nat.cast_add, Nat.cast_one] using binomCoeff_nat n (k + 1)

end Erdos993G1.FirstWide

namespace Erdos993G1.FirstWide

lemma binomCoeff_nat_sub_one (n k : ℕ) (hk : 1 ≤ k) :
    binomCoeff n ((k : ℤ) - 1) = (n.choose (k - 1) : ℤ) := by
  have h : (k : ℤ) - 1 = ((k - 1 : ℕ) : ℤ) := by omega
  rw [h, binomCoeff_nat]

end Erdos993G1.FirstWide

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

namespace Erdos993G1.FirstWide

lemma choose_step_nonpos {n k : ℕ} (h : n ≤ 2 * k + 1) :
    n.choose (k + 1) ≤ n.choose k := by
  have he := Nat.choose_succ_right_eq n k
  have hd : n - k ≤ k + 1 := by omega
  have hm := Nat.mul_le_mul_left (n.choose k) hd
  rw [← he] at hm
  exact Nat.le_of_mul_le_mul_right hm (by omega)

end Erdos993G1.FirstWide

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

namespace Erdos993G1.FirstWide

lemma edgeless_expression_pos {r k : ℕ} (hk : k ≤ r) :
    0 < binomCoeff (2 * r + 2) ((k : ℤ) + 1) -
      binomCoeff (2 * r + 2) (k : ℤ) := by
  rw [binomCoeff_nat_add_one, binomCoeff_nat]
  have h := choose_step_strict (n := 2 * r + 2) (k := k) (by omega)
  exact sub_pos.mpr (by exact_mod_cast h)

end Erdos993G1.FirstWide

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

namespace Erdos993G1.FirstWide

lemma delta_pos_of_edgeless_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hn : Nat.card Y = 2 * r + 2)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (Nat.card Y) (j : ℤ))
    {k : ℕ} (hk : k ≤ r) : 0 < delta G (k : ℤ) := by
  rw [delta_nat, hc, hc, hn]
  simpa only [Nat.cast_add, Nat.cast_one] using edgeless_expression_pos hk

end Erdos993G1.FirstWide

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

namespace Erdos993G1.FirstWide

lemma delta_nonpos_of_center_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r q : ℕ) (hr : 1 ≤ r) (hq : q ≤ 2 * r - 1)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (2 * r + 1) (j : ℤ) +
      binomCoeff q ((j : ℤ) - 1)) : delta G (r : ℤ) ≤ 0 := by
  rw [delta_nat, hc, hc]
  simpa only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] using
    center_expression_nonpos hr hq

end Erdos993G1.FirstWide

namespace Erdos993G1.FirstWide

lemma delta_neg_of_triangle_counts {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r)
    (hc : ∀ j : ℕ, indepCount G j = binomCoeff (2 * r - 1) (j : ℤ) +
      3 * binomCoeff (2 * r - 1) ((j : ℤ) - 1)) : delta G (r : ℤ) < 0 := by
  rw [delta_nat, hc, hc]
  simpa only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] using
    triangle_expression_neg hr

end Erdos993G1.FirstWide

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

namespace Erdos993G1.FirstWide

lemma edgeSet_natCard_eq_edgeFinset_card {Y : Type u}
    (G : SimpleGraph Y) [Fintype G.edgeSet] :
    Nat.card G.edgeSet = G.edgeFinset.card := by
  rw [Nat.card_eq_fintype_card, G.edgeFinset_card]

end Erdos993G1.FirstWide

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

namespace Erdos993G1.FirstWide

lemma matching_endpoints_card {X : Type u} [DecidableEq X]
    (G : SimpleGraph X) (a b c d : X) (hab : G.Adj a b) (hcd : G.Adj c d)
    (hdis : Disjoint ({a,b} : Set X) {c,d}) : ({a,b,c,d} : Finset X).card = 4 := by
  obtain ⟨h1,h2,h3,h4,h5,h6⟩ := matching_distinct G a b c d hab hcd hdis
  simp [h1,h2,h3,h4,h5,h6]

end Erdos993G1.FirstWide

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

namespace Erdos993G1.FirstWide

lemma erase_inter_eq {X : Type u} [DecidableEq X] (S M : Finset X) (a : X) :
    S.erase a ∩ M = (S ∩ M).erase a := by ext x; simp

end Erdos993G1.FirstWide

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

namespace Erdos993G1.FirstWide

lemma erase_image_card {X : Type u} [DecidableEq X] (S T : Finset X)
    (hT : T ⊆ S) : (T.image S.erase).card = T.card := by
  apply Finset.card_image_of_injOn
  intro a ha b hb he
  exact (Finset.erase_inj S (hT ha)).mp he

end Erdos993G1.FirstWide

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

lemma Erdos993G1.firstWide_exceptional_history {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card Y = 2 * r + 2)
    (he : Nat.card G.edgeSet ≤ 1) (k : ℕ) (hk : k ≤ r) :
    0 < Erdos993G1.delta G (k : ℤ) := by
  by_cases he0 : Nat.card G.edgeSet = 0
  · exact Erdos993G1.FirstWide.delta_pos_of_edgeless_counts G r hn
      (Erdos993G1.FirstWide.indepCount_edgeless G he0) hk
  · have he1 : Nat.card G.edgeSet = 1 := by omega
    exact Erdos993G1.FirstWide.delta_pos_of_one_edge_counts G r hr hn
      (Erdos993G1.FirstWide.indepCount_one_edge G he1) hk

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

namespace Erdos993G1.FirstWide

lemma shape_indep_on_edgeless {V : Type u} [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (hU : G.IsIndepSet U) (j : ℕ) :
    ((U.powersetCard j).filter (fun S : Finset V => G.IsIndepSet S)).card = U.card.choose j := by
  rw [Finset.filter_eq_self.mpr, Finset.card_powersetCard]
  intro S hS
  exact hU.mono (by simpa using (Finset.mem_powersetCard.mp hS).1)

end Erdos993G1.FirstWide

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

lemma Erdos993G1.firstWide_nonpos_of_two_edges {Y : Type u} [Finite Y]
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

namespace E993OrderBand

open Classical

lemma extensionSet_subset {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U A : Finset V) :
    extensionSet G U A ⊆ U \ A := by
  intro y hy
  obtain ⟨hyU, hyA, _⟩ := Finset.mem_filter.mp hy
  exact Finset.mem_sdiff.mpr ⟨hyU, hyA⟩

end E993OrderBand

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

namespace E993OrderBand

open Classical

lemma support_adj {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    G.Adj v (C5LA1.support G v) :=
  (support_spec G v hv).1

end E993OrderBand

namespace E993OrderBand

open Classical

lemma support_unique {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    {w : V} (hw : G.Adj v w) : w = C5LA1.support G v :=
  (support_spec G v hv).2 w hw

end E993OrderBand

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

namespace E993OrderBand

open Classical

lemma H_card {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    (C5LA1.H G v).card = 2 := by
  have hne : v ≠ C5LA1.support G v := (support_adj G v hv).ne
  simp [C5LA1.H, hne]

end E993OrderBand

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

lemma binomDelta_pascal (m j : ℕ) :
    ((m+1).choose (j+2) : ℤ) - (m+1).choose (j+1) =
      ((m.choose (j+2) : ℤ) - m.choose (j+1)) +
      ((m.choose (j+1) : ℤ) - m.choose j) := by
  rw [show j+2=(j+1)+1 by omega, Nat.choose_succ_succ', Nat.choose_succ_succ']
  push_cast
  ring

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

lemma binomDelta_step_down (m k : ℕ) (hk : 1 ≤ k) (hm : m < 2*k) :
    ((m+1).choose (k+1) : ℤ) - (m+1).choose k ≤
      (m.choose (k+1) : ℤ) - m.choose k := by
  obtain ⟨j, rfl⟩ := Nat.exists_eq_add_of_le' hk
  have hc := FirstWide.choose_step_nonpos (n := m) (k := j) (by omega)
  have hc' : (m.choose (j+1) : ℤ) ≤ m.choose j := by exact_mod_cast hc
  have hp := binomDelta_pascal m j
  linarith

lemma binomDelta_mono_center {k a b : ℕ} (h : 2*k ≤ a) (hab : a ≤ b) :
    (a.choose (k+1) : ℤ) - a.choose k ≤
      (b.choose (k+1) : ℤ) - b.choose k := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih => exact ih.trans (binomDelta_step_up b k (by omega))

lemma binomDelta_antitone {k a b : ℕ} (hk : 1 ≤ k) (hb : b ≤ 2*k) (hab : a ≤ b) :
    (b.choose (k+1) : ℤ) - b.choose k ≤
      (a.choose (k+1) : ℤ) - a.choose k := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih =>
    exact (binomDelta_step_down b k hk (by omega)).trans (ih (by omega))

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

lemma binomDelta_floor (m j : ℕ) :
    -(catalan j : ℤ) ≤ (m.choose (j+1) : ℤ) - m.choose j := by
  by_cases hj : j=0
  · subst j; simp; omega
  rw [← binomDelta_central j]
  rcases le_total m (2*j) with hm | hm
  · exact binomDelta_antitone (by omega) le_rfl hm
  · exact binomDelta_mono_center le_rfl hm

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

namespace Erdos993G1.ThirdWide
open Finset Classical

lemma catalan_succ_ge (n : ℕ) : (catalan n : ℤ) ≤ catalan (n + 1) := by
  have h := catalan_recurrence_int n
  have hc : 0 ≤ (catalan n : ℤ) := Nat.cast_nonneg _
  have hn : 0 ≤ (n : ℤ) := Nat.cast_nonneg _
  have hnext : 0 ≤ (catalan (n + 1) : ℤ) := Nat.cast_nonneg _
  nlinarith [mul_nonneg (show 0 ≤ (3 * (n : ℤ)) by omega) hc]

end Erdos993G1.ThirdWide

namespace Erdos993G1.ThirdWide
open Finset Classical

lemma catalan_mono {a b : ℕ} (hab : a ≤ b) :
    (catalan a : ℤ) ≤ catalan b := by
  induction b, hab using Nat.le_induction with
  | base => exact le_rfl
  | succ b hab ih => exact ih.trans (catalan_succ_ge b)

end Erdos993G1.ThirdWide

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

namespace E993FirstShell

lemma crossingIndex_negative {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] :
    C5LA1.forwardDifferenceDel T ∅ (C5LA1.crossingIndex T) < 0 := by
  classical
  unfold C5LA1.crossingIndex
  exact Nat.find_spec (p := fun k : ℕ => C5LA1.forwardDifferenceDel T ∅ k < 0) _

end E993FirstShell

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

namespace E993FirstShell

lemma empty_forwardDifference_eq_delta {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (k : ℕ) :
    C5LA1.forwardDifferenceDel T ∅ k = Erdos993G1.delta T (k : ℤ) := by
  rw [C5LA1.forwardDifferenceDel, Erdos993G1.delta_nat,
    indepSetCount_empty_eq, indepSetCount_empty_eq]

end E993FirstShell

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

namespace E993FirstShell

lemma three_le_of_early_crossing {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (p : ℕ)
    (horder : Fintype.card V = 2*p+2)
    (hcross : C5LA1.crossingIndex T + 2 ≤ p) : 3 ≤ p := by
  have hx := crossingIndex_pos_of_order T (by omega)
  omega

end E993FirstShell

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

namespace E993FirstShell

lemma leaf_retained_card_firstWide {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) (v : V) (p : ℕ)
    (hv : C4LA1.IsGraphLeaf T v) (hp : 1 ≤ p)
    (horder : Fintype.card V = 2*p+2) :
    (Finset.univ \ C5LA1.H T v).card = 2*(p-1)+2 := by
  have hcard := E993OrderBand.retained_card T v hv
  omega

end E993FirstShell

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

