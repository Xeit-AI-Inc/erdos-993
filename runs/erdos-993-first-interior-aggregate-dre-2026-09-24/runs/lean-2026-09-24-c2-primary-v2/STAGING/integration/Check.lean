import Mathlib

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

universe u

namespace Erdos993G1

noncomputable
def indepCount {V : Type u}
    (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

end Erdos993G1

namespace Erdos993G1

noncomputable
def coeff {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

end Erdos993G1

namespace Erdos993G1

noncomputable
def delta {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

end Erdos993G1

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


namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1

namespace Erdos993G1

lemma coeff_nat {V : Type u} (F : SimpleGraph V) (k : ℕ) : coeff F (k : ℤ) = indepCount F k := by
  simp [coeff]

end Erdos993G1

namespace Erdos993G1

lemma delta_nat {V : Type u} (F : SimpleGraph V) (k : ℕ) :
    delta F (k : ℤ) = indepCount F (k + 1) - indepCount F k := by
  simpa only [delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (coeff_nat F (k + 1)) (coeff_nat F k)

end Erdos993G1

namespace Erdos993G1

lemma isNIndepSet_pair_iff {V : Type u} (F : SimpleGraph V) [DecidableEq V] (a b : V) :
    F.IsNIndepSet 2 {a, b} ↔ a ≠ b ∧ ¬F.Adj a b := by
  by_cases h : a = b
  · subst b
    simp [SimpleGraph.isNIndepSet_iff]
  · simp [SimpleGraph.isNIndepSet_iff, SimpleGraph.isIndepSet_iff, Set.Pairwise, h, F.adj_comm] <;> tauto

end Erdos993G1

namespace Erdos993G1

lemma sym2_toFinset_injective {V : Type u} [DecidableEq V] :
    Function.Injective (Sym2.toFinset : Sym2 V → Finset V) := by
  intro a b h
  apply Sym2.ext
  intro v
  simpa only [Sym2.mem_toFinset] using iff_of_eq (congrArg (v ∈ ·) h)

end Erdos993G1

namespace Erdos993G1

lemma indepSetFinset_two_eq {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V] [DecidableRel F.Adj] :
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

end Erdos993G1

namespace Erdos993G1

lemma indepCount_two_add_edges {V : Type u} (F : SimpleGraph V) [Finite V] :
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

lemma indepSetFinset_eq_filter_powersetCard {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    F.indepSetFinset k = ((Finset.univ : Finset V).powersetCard k).filter
      (fun B : Finset V => F.IsIndepSet B) := by
  ext B
  simp [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff, and_comm]

end Erdos993G1

namespace Erdos993G1

lemma card_nonindep_pairs {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V] [DecidableRel F.Adj] :
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

end Erdos993G1

namespace Erdos993G1

lemma sum_card_filter_swap {A : Type u} {B : Type w}
    (s : Finset A) (t : Finset B) (p : A → B → Prop)
    [DecidableRel p] :
    ∑ a ∈ s, (t.filter (p a)).card =
      ∑ b ∈ t, (s.filter (fun a => p a b)).card := by
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]
  exact Finset.sum_comm

end Erdos993G1

namespace Erdos993G1

lemma sum_nonindep_pair_incidence {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V]
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

end Erdos993G1

namespace Erdos993G1

lemma sum_indep_indicator {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V] [DecidableRel F.Adj]
    (k : ℕ) :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard k,
      (if F.IsIndepSet B then 1 else 0) = (F.indepSetFinset k).card := by
  rw [indepSetFinset_eq_filter_powersetCard]
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]

end Erdos993G1

namespace Erdos993G1

lemma triple_local_identity {V : Type u} (F : SimpleGraph V) [DecidableEq V] [DecidableRel F.Adj]
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

lemma indepSetFinset_three_incidence {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V]
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

end Erdos993G1

namespace Erdos993G1

lemma components_card_pos_of_card_pos {V : Type u} [Finite V]
    (F : SimpleGraph V) (hV : 0 < Nat.card V) :
    0 < Nat.card F.ConnectedComponent := by
  haveI : Nonempty V := (Finite.card_pos_iff).mp hV
  exact Nat.card_pos

end Erdos993G1

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

namespace Erdos993G1

lemma degreeChoose_sum_lower {V : Type*} [Fintype V] (d : V → ℕ) :
    (∑ v, (d v : ℤ)) - Fintype.card V ≤ ∑ v, ((d v).choose 2 : ℤ) := by
  have h : 0 ≤ ∑ v, (((d v).choose 2 : ℤ) - (d v : ℤ) + 1) :=
    Finset.sum_nonneg (fun v _ => Erdos993G1.degreeDefect_nonneg (d v))
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, mul_one] at h
  omega

end Erdos993G1

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


namespace E993Interior

open SimpleGraph

namespace Core

private lemma indep_union_color {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (c : G.Coloring (Fin 2))
    (A E : Finset V) (hA : G.IsIndepSet (A : Set V))
    (hcross : ∀ v ∈ E, ∀ u ∈ A, ¬ G.Adj v u)
    (z : Fin 2) :
    G.IsIndepSet ((A ∪ E.filter (fun v => c v = z) : Finset V) : Set V) := by
  rw [SimpleGraph.isIndepSet_iff] at hA ⊢
  intro v hv w hw hvw
  simp only [Finset.coe_union, Finset.coe_filter, Set.mem_union, Set.mem_setOf_eq,
    Finset.mem_coe] at hv hw
  rcases hv with hv | ⟨hvE, hvc⟩
  · rcases hw with hw | ⟨hwE, hwc⟩
    · exact hA hv hw hvw
    · exact fun hadj => hcross w hwE v hv (G.adj_symm hadj)
  · rcases hw with hw | ⟨hwE, hwc⟩
    · exact hcross v hvE w hw
    · exact fun hadj => c.valid hadj (hvc.trans hwc.symm)

private lemma card_extension_le {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (U A E : Finset V) (a : ℕ)
    (hAU : A ⊆ U) (hEU : E ⊆ U) (hAE : Disjoint A E)
    (hA : G.IsIndepSet (A : Set V))
    (hcross : ∀ v ∈ E, ∀ u ∈ A, ¬ G.Adj v u)
    (hcap : ∀ B : Finset V, B ⊆ U → G.IsIndepSet (B : Set V) → B.card ≤ a) :
    E.card ≤ 2 * (a - A.card) := by
  classical
  obtain ⟨c⟩ := hBip
  let P : Finset V := E.filter (fun v => c v = 0)
  let Q : Finset V := E.filter (fun v => c v ≠ 0)
  have hP : (A ∪ P).card ≤ a :=
    hcap (A ∪ P) (Finset.union_subset hAU (Finset.Subset.trans (Finset.filter_subset _ _) hEU))
      (indep_union_color G c A E hA hcross 0)
  have hQind : G.IsIndepSet ((A ∪ Q : Finset V) : Set V) := by
    have hq : Q = E.filter (fun v => c v = 1) := by
      ext v
      simp only [Q, Finset.mem_filter]
      constructor
      · rintro ⟨hv, hne⟩
        exact ⟨hv, by have hlt := (c v).isLt; omega⟩
      · rintro ⟨hv, heq⟩
        exact ⟨hv, by simp [heq]⟩
    rw [hq]
    exact indep_union_color G c A E hA hcross 1
  have hQ : (A ∪ Q).card ≤ a :=
    hcap (A ∪ Q) (Finset.union_subset hAU (Finset.Subset.trans (Finset.filter_subset _ _) hEU)) hQind
  have hdP : Disjoint A P := hAE.mono_right (Finset.filter_subset _ _)
  have hdQ : Disjoint A Q := hAE.mono_right (Finset.filter_subset _ _)
  have hp : A.card + P.card ≤ a := by simpa [Finset.card_union_of_disjoint hdP] using hP
  have hq : A.card + Q.card ≤ a := by simpa [Finset.card_union_of_disjoint hdQ] using hQ
  have he : P.card + Q.card = E.card := by
    simpa only [P, Q] using Finset.card_filter_add_card_filter_not (s := E) (p := fun v => c v = 0)
  omega


private lemma tagged_deletions_lower {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (B : Finset V)
    (hB : B ∈ taggedFamily G U W (k + 1)) :
    k ≤ ((taggedFamily G U W k).bipartiteAbove (fun B A => A ⊆ B) B).card := by
  classical
  simp only [taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] at hB
  obtain ⟨⟨hBU, hBcard⟩, hBind, hBtag⟩ := hB
  obtain ⟨w, hwB, hwW⟩ := Finset.not_disjoint_iff.mp hBtag
  have hsub : (B.erase w).image B.erase ⊆
      (taggedFamily G U W k).bipartiteAbove (fun B A => A ⊆ B) B := by
    intro A hA
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hA
    have hvB : v ∈ B := (Finset.mem_erase.mp hv).2
    have hvw : v ≠ w := (Finset.mem_erase.mp hv).1
    have hcard : (B.erase v).card = k := by
      rw [Finset.card_erase_of_mem hvB]
      omega
    have htag : ¬ Disjoint (B.erase v) W :=
      Finset.not_disjoint_iff.mpr ⟨w, Finset.mem_erase.mpr ⟨Ne.symm hvw, hwB⟩, hwW⟩
    have hmem : B.erase v ∈ taggedFamily G U W k := by
      simp only [taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
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

private lemma tagged_extensions_upper {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (U W : Finset V) (a k : ℕ)
    (hcap : ∀ B : Finset V, B ⊆ U → G.IsIndepSet (B : Set V) → B.card ≤ a)
    (A : Finset V) (hA : A ∈ taggedFamily G U W k) :
    ((taggedFamily G U W (k + 1)).bipartiteBelow (fun B A => A ⊆ B) A).card ≤
      2 * (a - k) := by
  classical
  obtain ⟨⟨hAU, hAcard⟩, hAind, _⟩ :
      (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
    simpa only [taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] using hA
  let E : Finset V := U.filter (fun v => v ∉ A ∧ G.IsIndepSet ((insert v A : Finset V) : Set V))
  have hEU : E ⊆ U := Finset.filter_subset _ _
  have hAE : Disjoint A E := by
    apply Finset.disjoint_left.mpr
    intro v hvA hvE
    exact (Finset.mem_filter.mp hvE).2.1 hvA
  have hcross : ∀ v ∈ E, ∀ u ∈ A, ¬ G.Adj v u := by
    intro v hvE u huA
    obtain ⟨hvn, hvI⟩ := (Finset.mem_filter.mp hvE).2
    rw [SimpleGraph.isIndepSet_iff] at hvI
    exact hvI (by simp) (by simp [huA]) (by intro heq; exact hvn (heq ▸ huA))
  have hEcard : E.card ≤ 2 * (a - k) := by
    simpa [hAcard] using card_extension_le G hBip U A E a hAU hEU hAE hAind hcross hcap
  have hmap : ((taggedFamily G U W (k + 1)).bipartiteBelow
      (fun B A => A ⊆ B) A).card ≤ (E.powersetCard 1).card := by
    apply Finset.card_le_card_of_injOn (fun B : Finset V => B \ A)
    · intro B hB
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hB
      obtain ⟨hB, hAB⟩ := hB
      obtain ⟨⟨hBU, hBcard⟩, hBind, _⟩ :
          (B ⊆ U ∧ B.card = k + 1) ∧ G.IsIndepSet (B : Set V) ∧ ¬ Disjoint B W := by
        simpa only [taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] using hB
      apply Finset.mem_powersetCard.mpr
      constructor
      · intro v hv
        have hvB : v ∈ B := (Finset.mem_sdiff.mp hv).1
        have hvA : v ∉ A := (Finset.mem_sdiff.mp hv).2
        apply Finset.mem_filter.mpr
        refine ⟨hBU hvB, hvA, ?_⟩
        apply hBind.mono
        exact_mod_cast (show insert v A ⊆ B from Finset.insert_subset hvB hAB)
      · rw [Finset.card_sdiff_of_subset hAB]
        omega
    · intro B hB C hC hBC
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hB
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hC
      have hAB : A ⊆ B := hB.2
      have hAC : A ⊆ C := hC.2
      exact (Finset.superset_injOn_sdiff A) hAB hAC hBC
  simpa [Finset.card_powersetCard] using hmap.trans (by simpa using hEcard)

end Core

lemma taggedShadowBound {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (U W : Finset V) (a k : ℕ)
    (hcap : ∀ A : Finset V, A ⊆ U → G.IsIndepSet (A : Set V) → A.card ≤ a)
    (hk : 1 ≤ k) :
    k * (taggedFamily G U W (k + 1)).card ≤
      2 * (a - k) * (taggedFamily G U W k).card := by
  classical
  have hcount := Finset.card_nsmul_le_card_nsmul (R := ℕ)
    (r := fun B A : Finset V => A ⊆ B)
    (s := taggedFamily G U W (k + 1)) (t := taggedFamily G U W k)
    (m := k) (n := 2 * (a - k))
    (fun B hB => Core.tagged_deletions_lower G U W k B hB)
    (fun A hA => Core.tagged_extensions_upper G hBip U W a k hcap A hA)
  simp only [nsmul_eq_mul] at hcount
  nlinarith [hcount]

end E993Interior

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

namespace E993Interior.Guard

variable {V : Type*} [Fintype V] [DecidableEq V]

private lemma count_bridge (G : SimpleGraph V) [DecidableRel G.Adj] (k : ℕ) :
    (C5LA1.indepSetCount G ∅ k : ℤ) = Erdos993G1.indepCount G k := by
  rw [Erdos993G1.indepCount_eq_card_indepSetFinset,
    Erdos993G1.indepSetFinset_eq_filter_powersetCard]
  simp [C5LA1.indepSetCount, C5LA1.indepSetsAvoiding]

private lemma delta_bridge (G : SimpleGraph V) [DecidableRel G.Adj] (k : ℕ) :
    C5LA1.forwardDifferenceDel G ∅ k = Erdos993G1.delta G (k : ℤ) := by
  simp only [C5LA1.forwardDifferenceDel, Erdos993G1.delta_nat,
    ← count_bridge]

private lemma indep_count_zero (G : SimpleGraph V) [DecidableRel G.Adj] :
    Erdos993G1.indepCount G 0 = 1 := by
  rw [← count_bridge]
  have he : G.IsIndepSet (∅ : Set V) := by
    simp [SimpleGraph.isIndepSet_iff, Set.Pairwise]
  have he' : G.IsIndepSet ((∅ : Finset V) : Set V) := by simpa using he
  simp only [C5LA1.indepSetCount, C5LA1.indepSetsAvoiding,
    Finset.sdiff_empty, Finset.powersetCard_zero]
  have hset : (({∅} : Finset (Finset V)).filter
      (fun s : Finset V => G.IsIndepSet (s : Set V))) = {∅} := by
    ext s
    simp only [Finset.mem_filter, Finset.mem_singleton]
    constructor
    · exact And.left
    · intro hs
      subst s
      exact ⟨rfl, he'⟩
  rw [hset]
  simp

private lemma indep_count_one (G : SimpleGraph V) [DecidableRel G.Adj] :
    Erdos993G1.indepCount G 1 = Fintype.card V := by
  rw [← count_bridge]
  have hfilter :
      ((Finset.univ : Finset V).powersetCard 1).filter
        (fun s : Finset V => G.IsIndepSet (s : Set V)) =
      (Finset.univ : Finset V).powersetCard 1 := by
    ext s
    simp only [Finset.mem_filter]
    constructor
    · exact And.left
    · intro hs
      obtain ⟨v, rfl⟩ := Finset.card_eq_one.mp (Finset.mem_powersetCard.mp hs).2
      simpa [SimpleGraph.isIndepSet_iff, Set.Pairwise] using hs
  simp [C5LA1.indepSetCount, C5LA1.indepSetsAvoiding, hfilter]

private lemma order_ge_alpha_succ (G : SimpleGraph V) [DecidableRel G.Adj]
    (hT : G.IsTree) (ha : 2 ≤ G.indepNum) :
    G.indepNum + 1 ≤ Fintype.card V := by
  obtain ⟨S, hS⟩ := G.exists_isNIndepSet_indepNum
  have hle : G.indepNum ≤ Fintype.card V := by
    rw [← hS.card_eq]
    exact Finset.card_le_card (Finset.subset_univ S)
  by_contra h
  have hScard := hS.card_eq
  have hcard : Fintype.card V ≤ S.card := by omega
  have heq : S = Finset.univ := by
    apply Finset.eq_of_subset_of_card_le (Finset.subset_univ S)
    simpa using hcard
  have hzero : G.edgeFinset = ∅ := by
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro e he
    induction e using Sym2.inductionOn with
    | hf u v =>
      have hadj : G.Adj u v := by simpa [SimpleGraph.mem_edgeFinset] using he
      exact hS.isIndepSet (by simpa [heq] : u ∈ (S : Set V))
        (by simpa [heq] : v ∈ (S : Set V)) hadj.ne hadj
  have ht := hT.card_edgeFinset
  rw [hzero] at ht
  simp at ht
  omega

private lemma edge_cover_subset (G : SimpleGraph V) [DecidableRel G.Adj]
    (S : Finset V) (hS : G.IsIndepSet (S : Set V)) :
    G.edgeFinset ⊆ (Finset.univ \ S).biUnion (fun v => G.incidenceFinset v) := by
  intro e he
  induction e using Sym2.inductionOn with
  | hf u v =>
    have hadj : G.Adj u v := by simpa [SimpleGraph.mem_edgeFinset] using he
    by_cases hu : u ∈ S
    · have hv : v ∉ S := by
        intro hv
        exact hS hu hv hadj.ne hadj
      refine Finset.mem_biUnion.mpr ⟨v, Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hv⟩, ?_⟩
      simpa [SimpleGraph.mem_incidenceFinset] using
        (G.mk'_mem_incidenceSet_right_iff.mpr hadj)
    · refine Finset.mem_biUnion.mpr ⟨u, Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hu⟩, ?_⟩
      simpa [SimpleGraph.mem_incidenceFinset] using
        (G.mk'_mem_incidenceSet_left_iff.mpr hadj)

private lemma cover_degree_one (G : SimpleGraph V) [DecidableRel G.Adj]
    (S : Finset V) (hS : G.IsIndepSet (S : Set V)) (u : V)
    (hc : Finset.univ \ S = {u}) :
    G.edgeFinset.card ≤ G.degree u := by
  have h := Finset.card_le_card (edge_cover_subset G S hS)
  simpa [hc] using h

private lemma cover_degree_two (G : SimpleGraph V) [DecidableRel G.Adj]
    (S : Finset V) (hS : G.IsIndepSet (S : Set V)) (u w : V)
    (hc : Finset.univ \ S = {u, w}) :
    G.edgeFinset.card ≤ G.degree u + G.degree w := by
  have h := Finset.card_le_card (edge_cover_subset G S hS)
  rw [hc] at h
  simp [Finset.biUnion_insert] at h
  simpa using h.trans (Finset.card_union_le (G.incidenceFinset u) (G.incidenceFinset w))

private lemma delta_zero_nonneg (G : SimpleGraph V) [DecidableRel G.Adj]
    (hn : 2 ≤ Fintype.card V) :
    0 ≤ C5LA1.forwardDifferenceDel G ∅ 0 := by
  rw [delta_bridge, Erdos993G1.delta_nat, indep_count_zero, indep_count_one]
  omega

private lemma delta_one_nonneg (G : SimpleGraph V) [DecidableRel G.Adj]
    (hT : G.IsTree) (hn : 6 ≤ Fintype.card V) :
    0 ≤ C5LA1.forwardDifferenceDel G ∅ 1 := by
  have hp := Erdos993G1.indepCount_two_add_edges G
  have ht := hT.card_edgeFinset
  rw [delta_bridge, Erdos993G1.delta_nat, indep_count_one]
  simp only [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card] at hp
  have hchoose := Erdos993G1.scaledChooseTwo (Fintype.card V)
  have hedge : (G.edgeFinset.card : ℤ) + 1 = Fintype.card V := by exact_mod_cast ht
  have hpositive : 0 ≤ ((Fintype.card V : ℤ) - 5) * ((Fintype.card V : ℤ) + 1) :=
    mul_nonneg (by omega) (by omega)
  nlinarith

private lemma delta_two_nonneg_large (G : SimpleGraph V) [DecidableRel G.Adj]
    (hT : G.IsTree) (hn : 9 ≤ Fintype.card V) :
    0 ≤ C5LA1.forwardDifferenceDel G ∅ 2 := by
  have hp := Erdos993G1.indepCount_two_add_edges G
  have ht := hT.card_edgeFinset
  have hq := Erdos993G1.indepCount_three_add_edge_incidence G hT.isAcyclic
  rw [delta_bridge, Erdos993G1.delta_nat]
  simp only [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card] at hp hq
  have hchoose2 := Erdos993G1.scaledChooseTwo (Fintype.card V)
  have hchoose3 := Erdos993G1.scaledChooseThree (Fintype.card V)
  have hedge : (G.edgeFinset.card : ℤ) + 1 = Fintype.card V := by exact_mod_cast ht
  have hsub : Fintype.card V - 2 + 2 = Fintype.card V := by omega
  have hsubz : ((Fintype.card V - 2 : ℕ) : ℤ) + 2 = Fintype.card V := by
    exact_mod_cast hsub
  have hprod : 0 ≤ ((Fintype.card V : ℤ) - 1) *
      ((Fintype.card V : ℤ) - 2) * ((Fintype.card V : ℤ) - 9) := by
    apply mul_nonneg (mul_nonneg (by omega) (by omega))
    omega
  have hsum : 0 ≤ ∑ a : V, ((G.degree a).choose 2 : ℤ) :=
    Finset.sum_nonneg (fun _ _ => Int.natCast_nonneg _)
  nlinarith

private lemma choose_degree_one_le_sum (G : SimpleGraph V) [DecidableRel G.Adj]
    (u : V) :
    ((G.degree u).choose 2 : ℤ) ≤ ∑ v : V, ((G.degree v).choose 2 : ℤ) := by
  have hs : ({u} : Finset V) ⊆ Finset.univ := Finset.subset_univ _
  have h := Finset.sum_le_sum_of_subset_of_nonneg hs
    (fun v _ _ => Int.natCast_nonneg ((G.degree v).choose 2))
  simpa using h

private lemma choose_degree_two_le_sum (G : SimpleGraph V) [DecidableRel G.Adj]
    (u w : V) (huw : u ≠ w) :
    ((G.degree u).choose 2 : ℤ) + ((G.degree w).choose 2 : ℤ) ≤
      ∑ v : V, ((G.degree v).choose 2 : ℤ) := by
  have hs : ({u, w} : Finset V) ⊆ Finset.univ := Finset.subset_univ _
  have h := Finset.sum_le_sum_of_subset_of_nonneg hs
    (fun v _ _ => Int.natCast_nonneg ((G.degree v).choose 2))
  simpa [Finset.sum_insert, huw] using h

private lemma choose_ge_fifteen (d : ℕ) (hd : 6 ≤ d) :
    (15 : ℤ) ≤ (d.choose 2 : ℤ) := by
  have h := Erdos993G1.scaledChooseTwo d
  have hz : (6 : ℤ) ≤ d := by exact_mod_cast hd
  nlinarith [sq_nonneg ((d : ℤ) - 6)]

private lemma choose_pair_ge_nine (d e : ℕ) (hde : 7 ≤ d + e) :
    (9 : ℤ) ≤ (d.choose 2 : ℤ) + (e.choose 2 : ℤ) := by
  have hd := Erdos993G1.scaledChooseTwo d
  have he := Erdos993G1.scaledChooseTwo e
  have hz : (7 : ℤ) ≤ (d : ℤ) + e := by exact_mod_cast hde
  have hp : 0 ≤ ((d : ℤ) + e - 7) * ((d : ℤ) + e + 5) := by
    apply mul_nonneg <;> omega
  nlinarith [sq_nonneg ((d : ℤ) - e)]

private lemma degree_choose_ge_fifteen_at_seven (G : SimpleGraph V)
    [DecidableRel G.Adj] (hT : G.IsTree)
    (ha : G.indepNum = 6) (hn : Fintype.card V = 7) :
    (15 : ℤ) ≤ ∑ v : V, ((G.degree v).choose 2 : ℤ) := by
  obtain ⟨S, hS⟩ := G.exists_isNIndepSet_indepNum
  have hScard : S.card = 6 := by rw [hS.card_eq, ha]
  have hCcard : (Finset.univ \ S).card = 1 := by
    simp [Finset.card_sdiff, hn, hScard]
  obtain ⟨u, hu⟩ := Finset.card_eq_one.mp hCcard
  have hdeg := cover_degree_one G S hS.isIndepSet u hu
  have hedge := hT.card_edgeFinset
  have h6 : 6 ≤ G.degree u := by omega
  exact (choose_ge_fifteen (G.degree u) h6).trans
    (choose_degree_one_le_sum G u)

private lemma degree_choose_ge_nine_at_eight (G : SimpleGraph V)
    [DecidableRel G.Adj] (hT : G.IsTree)
    (ha : G.indepNum = 6) (hn : Fintype.card V = 8) :
    (9 : ℤ) ≤ ∑ v : V, ((G.degree v).choose 2 : ℤ) := by
  obtain ⟨S, hS⟩ := G.exists_isNIndepSet_indepNum
  have hScard : S.card = 6 := by rw [hS.card_eq, ha]
  have hCcard : (Finset.univ \ S).card = 2 := by
    simp [Finset.card_sdiff, hn, hScard]
  obtain ⟨u, w, huw, hu⟩ := Finset.card_eq_two.mp hCcard
  have hdeg := cover_degree_two G S hS.isIndepSet u w hu
  have hedge := hT.card_edgeFinset
  have h7 : 7 ≤ G.degree u + G.degree w := by omega
  exact (choose_pair_ge_nine (G.degree u) (G.degree w) h7).trans
    (choose_degree_two_le_sum G u w huw)

private lemma delta_two_nonneg_seven (G : SimpleGraph V) [DecidableRel G.Adj]
    (hT : G.IsTree) (ha : G.indepNum = 6) (hn : Fintype.card V = 7) :
    0 ≤ C5LA1.forwardDifferenceDel G ∅ 2 := by
  have hp := Erdos993G1.indepCount_two_add_edges G
  have hq := Erdos993G1.indepCount_three_add_edge_incidence G hT.isAcyclic
  have ht := hT.card_edgeFinset
  have hd := degree_choose_ge_fifteen_at_seven G hT ha hn
  simp only [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card] at hp hq
  rw [hn] at hp hq ht
  norm_num [Nat.choose] at hp hq ⊢
  rw [delta_bridge, Erdos993G1.delta_nat]
  change 0 ≤ Erdos993G1.indepCount G 3 - Erdos993G1.indepCount G 2
  omega

private lemma delta_two_nonneg_eight (G : SimpleGraph V) [DecidableRel G.Adj]
    (hT : G.IsTree) (ha : G.indepNum = 6) (hn : Fintype.card V = 8) :
    0 ≤ C5LA1.forwardDifferenceDel G ∅ 2 := by
  have hp := Erdos993G1.indepCount_two_add_edges G
  have hq := Erdos993G1.indepCount_three_add_edge_incidence G hT.isAcyclic
  have ht := hT.card_edgeFinset
  have hd := degree_choose_ge_nine_at_eight G hT ha hn
  simp only [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card] at hp hq
  rw [hn] at hp hq ht
  norm_num [Nat.choose] at hp hq ⊢
  rw [delta_bridge, Erdos993G1.delta_nat]
  change 0 ≤ Erdos993G1.indepCount G 3 - Erdos993G1.indepCount G 2
  omega

private lemma crossing_negative (G : SimpleGraph V) [DecidableRel G.Adj] :
    C5LA1.forwardDifferenceDel G ∅ (C5LA1.crossingIndex G) < 0 := by
  classical
  unfold C5LA1.crossingIndex
  exact Nat.find_spec (p := fun k : ℕ => C5LA1.forwardDifferenceDel G ∅ k < 0) _

end E993Interior.Guard

namespace E993Interior

lemma eligibleAlphaGeSeven {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    7 ≤ G.indepNum := by
  have ha4 : 4 ≤ G.indepNum := by omega
  have hn := Guard.order_ge_alpha_succ G hT (by omega : 2 ≤ G.indepNum)
  have hc := Guard.crossing_negative G
  have h0 := Guard.delta_zero_nonneg G (by omega : 2 ≤ Fintype.card V)
  by_contra h7
  have ha6 : G.indepNum ≤ 6 := by omega
  by_cases ha4eq : G.indepNum = 4
  · have hx : C5LA1.crossingIndex G = 0 := by omega
    rw [hx] at hc
    omega
  by_cases ha5eq : G.indepNum = 5
  · have h1 := Guard.delta_one_nonneg G hT (by omega : 6 ≤ Fintype.card V)
    have hx : C5LA1.crossingIndex G = 0 ∨ C5LA1.crossingIndex G = 1 := by omega
    rcases hx with hx | hx <;> rw [hx] at hc <;> omega
  have ha6eq : G.indepNum = 6 := by omega
  have h1 := Guard.delta_one_nonneg G hT (by omega : 6 ≤ Fintype.card V)
  have h2 : 0 ≤ C5LA1.forwardDifferenceDel G ∅ 2 := by
    by_cases hn9 : 9 ≤ Fintype.card V
    · exact Guard.delta_two_nonneg_large G hT hn9
    · have hn78 : Fintype.card V = 7 ∨ Fintype.card V = 8 := by omega
      rcases hn78 with hn7 | hn8
      · exact Guard.delta_two_nonneg_seven G hT ha6eq hn7
      · exact Guard.delta_two_nonneg_eight G hT ha6eq hn8
  have hx : C5LA1.crossingIndex G = 0 ∨
      C5LA1.crossingIndex G = 1 ∨ C5LA1.crossingIndex G = 2 := by omega
  rcases hx with hx | hx | hx <;> rw [hx] at hc <;> omega

end E993Interior

namespace E993Interior

lemma bipartiteHighTailAggregate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (p : ℕ) (hp : 2 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.aggregate G p ≤ 0 := by
  apply highTailAggregateFromShadow G ?_ p hp hTail
  intro U W a k hcap hk
  exact taggedShadowBound G hBip U W a k hcap hk

end E993Interior

namespace E993Interior

theorem firstInteriorAggregate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    C5LA1.aggregate G (G.indepNum - 2) ≤ 0 := by
  have ha : 7 ≤ G.indepNum := eligibleAlphaGeSeven G hT hInterior
  apply bipartiteHighTailAggregate G hT.isBipartite (G.indepNum - 2)
  · omega
  · omega

end E993Interior
