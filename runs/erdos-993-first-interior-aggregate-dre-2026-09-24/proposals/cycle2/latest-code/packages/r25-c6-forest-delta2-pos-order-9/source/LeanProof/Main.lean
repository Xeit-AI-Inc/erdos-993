import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount f6bc96fd41a76a97b28a866a483e2b1d637d371832690897422edeeb9b65bc2b
universe u

namespace Erdos993G1

noncomputable
def indepCount {V : Type u}
    (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

end Erdos993G1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.coeff 15ce5e3474a249e2ae5d727a1012a8f6bea52cbbf8188b13cfe247eb844d5cf8
namespace Erdos993G1

noncomputable
def coeff {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

end Erdos993G1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition Erdos993G1.delta d7dc776c79754ed209810ad69194b3b65d71e3bf718124b0133c53d1bee1a42c
namespace Erdos993G1

noncomputable
def delta {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

end Erdos993G1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 01ee774fedf7bb37cb52000e541f0c8196f3882ce0e4c5a77cc46e05ba98e876
namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma Erdos993G1.coeff_nat 91c74d915628f89477cb21d889b1e6cb464d34247520df6084260b72ec796440
namespace Erdos993G1

lemma coeff_nat {V : Type u} (F : SimpleGraph V) (k : ℕ) : coeff F (k : ℤ) = indepCount F k := by
  simp [coeff]

end Erdos993G1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma Erdos993G1.delta_nat 61f3c4d43f5847c9c65da6c606c0fa3083078cfbc394be9e5d90b14463c042a9
namespace Erdos993G1

lemma delta_nat {V : Type u} (F : SimpleGraph V) (k : ℕ) :
    delta F (k : ℤ) = indepCount F (k + 1) - indepCount F k := by
  simpa only [delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (coeff_nat F (k + 1)) (coeff_nat F k)

end Erdos993G1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.isNIndepSet_pair_iff a5eb6d6e8d552c64fa2cb4001d5f440637a38ef7c2e15e179c1eaaab1db9d412
namespace Erdos993G1

lemma isNIndepSet_pair_iff {V : Type u} (F : SimpleGraph V) [DecidableEq V] (a b : V) :
    F.IsNIndepSet 2 {a, b} ↔ a ≠ b ∧ ¬F.Adj a b := by
  by_cases h : a = b
  · subst b
    simp [SimpleGraph.isNIndepSet_iff]
  · simp [SimpleGraph.isNIndepSet_iff, SimpleGraph.isIndepSet_iff, Set.Pairwise, h, F.adj_comm] <;> tauto

end Erdos993G1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.sym2_toFinset_injective d90c2a73eb34028360b6e19de80ccb0f42b1901ef4a1fec0e9cc0281ba551a02
namespace Erdos993G1

lemma sym2_toFinset_injective {V : Type u} [DecidableEq V] :
    Function.Injective (Sym2.toFinset : Sym2 V → Finset V) := by
  intro a b h
  apply Sym2.ext
  intro v
  simpa only [Sym2.mem_toFinset] using iff_of_eq (congrArg (v ∈ ·) h)

end Erdos993G1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.indepSetFinset_two_eq 9a618f5577e807ae3ba07edfc6fb09ddfe732dc3bca7f5260288a798c219a0d1
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
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.indepCount_two_add_edges 889082ae5e0ef42ec09114ff404a94b0e30b0f5d9d2f4e621868328930e53ce3
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
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.indepSetFinset_eq_filter_powersetCard 5dae608f7a4c0080d5baf5c3d9c7f348b9ca8c8fe0696a8ff41609ad9715e16b
namespace Erdos993G1

lemma indepSetFinset_eq_filter_powersetCard {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    F.indepSetFinset k = ((Finset.univ : Finset V).powersetCard k).filter
      (fun B : Finset V => F.IsIndepSet B) := by
  ext B
  simp [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff, and_comm]

end Erdos993G1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.card_nonindep_pairs 6e86164cc77740b70b633979f1bb9f55b1379ed261467391fe51ffb0836f3fcf
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
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.sum_card_filter_swap 8a32f504cb65462cc407e7d76e8cfa05f1df7f218b7072b70414f24aba94a68f
namespace Erdos993G1

lemma sum_card_filter_swap {A : Type u} {B : Type w}
    (s : Finset A) (t : Finset B) (p : A → B → Prop)
    [DecidableRel p] :
    ∑ a ∈ s, (t.filter (p a)).card =
      ∑ b ∈ t, (s.filter (fun a => p a b)).card := by
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]
  exact Finset.sum_comm

end Erdos993G1
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.sum_nonindep_pair_incidence bafc19d498fd73893dbbd27856e681905568a5a1ed659a421802e2d1f4c4b1d9
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
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.sum_indep_indicator 967e8cea5583894061db4c306ff05690dfe200422d9c6fd62d559a8ffbb1b3a8
namespace Erdos993G1

lemma sum_indep_indicator {V : Type u} (F : SimpleGraph V) [Fintype V] [DecidableEq V] [DecidableRel F.Adj]
    (k : ℕ) :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard k,
      (if F.IsIndepSet B then 1 else 0) = (F.indepSetFinset k).card := by
  rw [indepSetFinset_eq_filter_powersetCard]
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]

end Erdos993G1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.triple_local_identity b2a3d62321344a280924b2701b63fda6abb7f1fd6e8bba69fd46b6fc7538fbe7
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
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.indepSetFinset_three_incidence e75d6c9bdb5332d9efa9c20535c35c0f047fcbf29add7232eaabf570bdb871a2
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
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.sum_triple_centered_neighbor_pairs 2d8c865096680299876ca4ee7a094c41cf849dd15d7c4ac33ae166f43d34e549
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
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma Erdos993G1.indepCount_three_add_edge_incidence 2f67af0812ec6608bd511d62e5579e86d21d3d59da08da663d11a124768a627e
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
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma Erdos993G1.forest_card_edges_add_components 7eef4f723871eb13f3132efb877cda06e5b4a7498589fca0a012eb49339ea183
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
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma Erdos993G1.components_card_pos_of_card_pos 2948f2bea2afbc682160cd1afae04ff4f83f519d4413e437dddd787c6d33f3a8
namespace Erdos993G1

lemma components_card_pos_of_card_pos {V : Type u} [Finite V]
    (F : SimpleGraph V) (hV : 0 < Nat.card V) :
    0 < Nat.card F.ConnectedComponent := by
  haveI : Nonempty V := (Finite.card_pos_iff).mp hV
  exact Nat.card_pos

end Erdos993G1
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma Erdos993G1.degreeDefect_nonneg e13b00906721b8a815d185d3bc4f38148fccc231d200b3bb820579c0f05fdb8f
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
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma Erdos993G1.degreeChoose_sum_lower 990ee7b780b0a7a0c7c6a7c34cf026d13ded3d7de15d826aec6ea560dc1bff35
namespace Erdos993G1

lemma degreeChoose_sum_lower {V : Type*} [Fintype V] (d : V → ℕ) :
    (∑ v, (d v : ℤ)) - Fintype.card V ≤ ∑ v, ((d v).choose 2 : ℤ) := by
  have h : 0 ≤ ∑ v, (((d v).choose 2 : ℤ) - (d v : ℤ) + 1) :=
    Finset.sum_nonneg (fun v _ => Erdos993G1.degreeDefect_nonneg (d v))
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, mul_one] at h
  omega

end Erdos993G1
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma Erdos993G1.scaledChooseTwo 998f5e2749af9a08a08bf161dcce06d9fe4036299593a66572a2f1d12eee0ca4
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
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma Erdos993G1.scaledChooseThree d6f3427951f65a5d5b754f7876b5fa0b8e855ce52dfa70173a4ab26edf87aff0
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
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma Erdos993G1.ForestDelta2.forest_delta_two_lower d10faad16db24225630d6fc2ceded0845d8f16449c2ef35648c446097a864ce9
namespace Erdos993G1.ForestDelta2

open Erdos993G1

/-- The uniform closed-form quantitative lower bound: for every forest of
order `n`, `6 * Delta_2(F) >= n^3 - 12 n^2 + 35 n - 30`. Registered as a
LEMMA (not the terminal declaration), per the award's condition (iii).
Method: the frozen project's own `ENTRY 176` argument
(`Erdos993G1.ThirdWide.forest_delta_two_ten_pos`, single order `n = 10`),
made uniform in `n` by carrying `n` symbolically instead of substituting the
numeral 10 -- every ingredient is order-agnostic. No induction, no leaf
case, no edgeless clause, no enumeration at any order. Critic-attributed
jointly to C-U4-T (this exact `[Finite X]` contract form and quantitative
cubic, `scratchpad/c6-crit-U4-T-replay/g1copy/LeanProof/CritU4T.lean`) and
C-U4-F (the independent second implementation with the component-corrected
bound and the `entry176_is_an_instance` disclosure,
`scratchpad/c6-crit-U4-F/LeanCritic/LeanProof/CriticUC604F.lean`), on the
frozen G1 project's own compiled lemmas (transcribed as entries 1-25 above).
Seat U4's route (`U-C6-04 FOREST-DELTA3-BASE-ENCODING`) framed the base-case
question and settled, by direct measurement, that plain `decide` reaches a
76-class order-8 base; both critics then found the enumeration-free closed
form used here, which needs no such base at all.

FENCES (mandatory, restated on this declaration's face): uniform in the
order, no horizon, no enumeration at any order; `nu`, `tau`, `d` and
`x(F) < r` enter nowhere; this is a forest quantitative bound, not a
no-recovery statement, and does not sharpen
`E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (an order bound is a different
object); it is not `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`; it bears on
no tier, on FOREST/TREE/TRANSFER, or on Erdos #993.

Sharp: `B(n) = min Delta_2(F)` over forests of order `n`, exactly, for every
`n` from 5 to 14 (independently verified exhaustively by both critics); a
connected minimiser (`P_n`-like) attains it. -/
lemma forest_delta_two_lower {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) (hn : 5 ≤ Nat.card X) :
    (Nat.card X : ℤ) ^ 3 - 12 * (Nat.card X : ℤ) ^ 2 + 35 * (Nat.card X : ℤ) - 30
      ≤ 6 * Erdos993G1.delta F 2 := by
  classical
  letI := Fintype.ofFinite X
  have hnx : Fintype.card X = Nat.card X := (Nat.card_eq_fintype_card).symm
  have hp := components_card_pos_of_card_pos F (by omega)
  have he := forest_card_edges_add_components F hF
  have hpair := indepCount_two_add_edges F
  have htriple := indepCount_three_add_edge_incidence F hF
  have hsum := Erdos993G1.degreeChoose_sum_lower (fun x : X => F.degree x)
  have hd : (∑ x, (F.degree x : ℤ)) = 2 * (Nat.card F.edgeSet : ℤ) := by
    rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
    exact_mod_cast F.sum_degrees_eq_twice_card_edges
  rw [hd, hnx] at hsum
  rw [hnx] at htriple
  -- NATURAL vs INTEGER subtraction: `htriple` carries `((n - 2 : Nat) : Int)`.
  -- The formalizer caution named in the adjudication (condition (iii)):
  -- `((Nat.card X - 2 : ℕ) : ℤ)` must be converted to `(Nat.card X : ℤ) - 2`
  -- or `nlinarith` fails silently below.
  have hsub : ((Nat.card X - 2 : ℕ) : ℤ) = (Nat.card X : ℤ) - 2 := by omega
  rw [hsub] at htriple
  have hc2 := Erdos993G1.scaledChooseTwo (Nat.card X)
  have hc3 := Erdos993G1.scaledChooseThree (Nat.card X)
  have hmz : (Nat.card F.edgeSet : ℤ) + 1 ≤ (Nat.card X : ℤ) := by
    exact_mod_cast (by omega : Nat.card F.edgeSet + 1 ≤ Nat.card X)
  have hnz : (5 : ℤ) ≤ (Nat.card X : ℤ) := by exact_mod_cast hn
  have hmnn : (0 : ℤ) ≤ (Nat.card F.edgeSet : ℤ) := by positivity
  rw [show (2 : ℤ) = ((2 : ℕ) : ℤ) by rfl, delta_nat]
  norm_num only [Nat.reduceAdd]
  nlinarith [hpair, htriple, hsum, hc2, hc3, hmz, hnz, hmnn,
             mul_nonneg (sub_nonneg.mpr hnz) (sub_nonneg.mpr hmz)]

end Erdos993G1.ForestDelta2
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN theorem Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine a95d132d7209e55ec4d1eb216851c4037b6a4dc2701c628a2f5d7341a6aadef0
namespace Erdos993G1.ForestDelta2

/-- **TERMINAL DECLARATION of award group `C6-LA1`
(`U-AWARD-FOREST-DELTA2-ORDER-9`).** Every forest of order at least 9 has
`Delta_2 > 0`. A grade change for the registered VERIFIED
`E993-R25-FOREST-DELTA2-POS-ORDER-9`, `proved_informal -> formally_verified`
(not a new claim). Strictly generalises frozen ENTRY 176
(`Erdos993G1.ThirdWide.forest_delta_two_ten_pos`, `Nat.card X = 10`) and is
sharp: `min Delta_2 = -1` at order 8 (attained by `P_8`, independently
verified by both Cycle 6 critics).

Attribution (condition (i), restated on this declaration's face):
critic-attributed jointly to **C-U4-T** (this exact `[Finite X]` contract
form and the quantitative cubic `forest_delta_two_lower` above) and
**C-U4-F** (the independent second implementation, the component-corrected
bound, and the `entry176_is_an_instance` disclosure), on the frozen G1
project's own compiled lemmas. Seat U4's route framed the base-case
question and settled, by direct measurement, the `decide`-reach question
the critics' closed form went on to route entirely around.

FENCES (mandatory, restated on this declaration's face, per
`control/C6-STAGE7-PROTOCOL.md` and the synthesis's `## Lean awards`,
Dispatch 1): uniform in the order, no horizon, **no enumeration at any
order**; `nu`, `tau`, `d` and `x(F) < r` enter nowhere; `Delta_2 > 0` is a
**POSITIVITY** statement, the opposite sign from a no-recovery statement;
this is a forest **THRESHOLD** theorem, **never** "the run's first
unconditional forest theorem"; it does **not** sharpen
`E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (an order bound is a different
object); it is **not** `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`; it bears
on **no** tier, on FOREST/TREE/TRANSFER, or on Erdos #993. The alias line
names `E993-R25-FOREST-DELTA2-POS-ORDER-9`, frozen ENTRY 176 (of which it is
a strict generalisation), and `E993-PAIR-RANK3-FOREST-MIN`. -/
theorem forest_delta_two_pos_ge_nine {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 9 ≤ Nat.card X) : 0 < Erdos993G1.delta F 2 := by
  have hb := forest_delta_two_lower F hF (by omega)
  have hnz : (9 : ℤ) ≤ (Nat.card X : ℤ) := by exact_mod_cast hn
  nlinarith [hb, hnz, sq_nonneg ((Nat.card X : ℤ) - 9)]

end Erdos993G1.ForestDelta2
-- VERITYOS ENTRY 27 END

