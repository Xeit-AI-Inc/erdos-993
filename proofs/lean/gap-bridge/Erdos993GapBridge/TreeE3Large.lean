import LeanProof.Main
import Mathlib.Data.Finset.Sym
import Mathlib.Tactic

namespace Erdos993GapBridge

open Finset

set_option maxHeartbeats 1000000

variable {V : Type*} [Fintype V] [Nonempty V] [DecidableEq V]

def edgeSupport (F : Finset (Sym2 V)) : Finset V :=
  F.biUnion Sym2.toFinset

def inducedEdgeCount (T : SimpleGraph V) [DecidableRel T.Adj]
    (S : Finset V) : ℕ :=
  (T.edgeFinset ∩ S.sym2).card

def vertexSets (k : ℕ) : Finset (Finset V) :=
  (Finset.univ : Finset V).powersetCard k

def adjacentEdgePairs (T : SimpleGraph V) [DecidableRel T.Adj] :
    Finset (Finset (Sym2 V)) :=
  (T.edgeFinset.powersetCard 2).filter
    (fun W => (edgeSupport W).card = 3)

def connectedEdgeTriples (T : SimpleGraph V) [DecidableRel T.Adj] :
    Finset (Finset (Sym2 V)) :=
  (T.edgeFinset.powersetCard 3).filter
    (fun F => (edgeSupport F).card = 4)

def adjacentPairCount (T : SimpleGraph V) [DecidableRel T.Adj] : ℕ :=
  (adjacentEdgePairs T).card

def connectedTripleCount (T : SimpleGraph V) [DecidableRel T.Adj] : ℕ :=
  (connectedEdgeTriples T).card

lemma isIndep_iff_inducedEdgeCount_eq_zero
    (T : SimpleGraph V) [DecidableRel T.Adj] (S : Finset V) :
    Erdos993R2C3.IsIndep T S ↔ inducedEdgeCount T S = 0 := by
  rw [inducedEdgeCount, Finset.card_eq_zero]
  constructor
  · intro h
    rw [Finset.eq_empty_iff_forall_notMem]
    intro e he
    rw [Finset.mem_inter] at he
    induction e using Sym2.inductionOn with
    | _ u v =>
      rw [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet] at he
      rw [Finset.mk_mem_sym2_iff] at he
      exact h u he.2.1 v he.2.2 he.1
  · intro h u hu v hv hadj
    have he : s(u, v) ∈ T.edgeFinset ∩ S.sym2 := by
      rw [Finset.mem_inter, SimpleGraph.mem_edgeFinset,
        SimpleGraph.mem_edgeSet, Finset.mk_mem_sym2_iff]
      exact ⟨hadj, hu, hv⟩
    simpa [h] using he

lemma ind_eq_card_filter_edgeCount_zero
    (T : SimpleGraph V) [DecidableRel T.Adj] (k : ℕ) :
    Erdos993R2C3.ind T k =
      ((vertexSets k).filter
        (fun S => inducedEdgeCount T S = 0)).card := by
  rw [Erdos993R2C3.ind]
  congr 1
  ext S
  rw [Erdos993R2C3.mem_indepSets, Finset.mem_filter,
    vertexSets, Finset.mem_powersetCard]
  simp only [Finset.subset_univ, true_and]
  exact and_congr_right fun _ =>
    isIndep_iff_inducedEdgeCount_eq_zero T S

lemma acyclic_card_edgeFinset_lt_card
    {W : Type*} [Fintype W] [Nonempty W]
    (H : SimpleGraph W) [DecidableRel H.Adj] (hH : H.IsAcyclic) :
    H.edgeFinset.card < Fintype.card W := by
  classical
  obtain ⟨F, hHF, -, hF⟩ :=
    (SimpleGraph.connected_top :
      (⊤ : SimpleGraph W).Connected).exists_isTree_le_of_le_of_isAcyclic
        (by exact le_top) hH
  have hle : H.edgeFinset.card ≤ F.edgeFinset.card :=
    Finset.card_le_card
      (SimpleGraph.edgeFinset_subset_edgeFinset.mpr hHF)
  have hcard := hF.card_edgeFinset
  omega

lemma inducedEdgeCount_lt_card
    (T : SimpleGraph V) [DecidableRel T.Adj] (hT : T.IsAcyclic)
    (S : Finset V) (hS : S.Nonempty) :
    inducedEdgeCount T S < S.card := by
  letI : Fintype {x // x ∈ (S : Set V)} :=
    Subtype.fintype (Membership.mem (S : Set V))
  let H : SimpleGraph {x // x ∈ (S : Set V)} :=
    T.induce (S : Set V)
  letI : Nonempty {x // x ∈ (S : Set V)} := by
    obtain ⟨v, hv⟩ := hS
    exact ⟨⟨v, hv⟩⟩
  have hlt :
      H.edgeFinset.card < Fintype.card {x // x ∈ (S : Set V)} :=
    acyclic_card_edgeFinset_lt_card H
      (hT.induce (S : Set V))
  have hmap := T.map_edgeFinset_induce (s := (S : Set V))
  have hcard : inducedEdgeCount T S = H.edgeFinset.card := by
    calc
      inducedEdgeCount T S =
          (T.edgeFinset ∩ (S : Set V).toFinset.sym2).card := by
            simp [inducedEdgeCount]
      _ = (H.edgeFinset.map
          (Function.Embedding.subtype
            (· ∈ (S : Set V))).sym2Map).card := by
            simpa [H] using congrArg Finset.card hmap.symm
      _ = H.edgeFinset.card := Finset.card_map _
  rw [hcard]
  simpa using hlt

omit [Fintype V] [Nonempty V] in
lemma edgeSubset_sym2_iff_support_subset
    (F : Finset (Sym2 V)) (S : Finset V) :
    F ⊆ S.sym2 ↔ edgeSupport F ⊆ S := by
  constructor
  · intro h x hx
    rw [edgeSupport, Finset.mem_biUnion] at hx
    obtain ⟨e, heF, hxe⟩ := hx
    exact (Finset.mem_sym2_iff.mp (h heF)) x
      (Sym2.mem_toFinset.mp hxe)
  · intro h e heF
    rw [Finset.mem_sym2_iff]
    intro x hxe
    apply h
    rw [edgeSupport, Finset.mem_biUnion]
    exact ⟨e, heF, Sym2.mem_toFinset.mpr hxe⟩

omit [Fintype V] [Nonempty V] in
lemma toFinset_ne_of_ne {e f : Sym2 V} (hef : e ≠ f) :
    e.toFinset ≠ f.toFinset := by
  intro h
  apply hef
  apply Sym2.ext
  intro x
  simpa only [Sym2.mem_toFinset] using
    (show x ∈ e.toFinset ↔ x ∈ f.toFinset by rw [h])

lemma edgeSingleton_support_card
    (T : SimpleGraph V) [DecidableRel T.Adj]
    {F : Finset (Sym2 V)}
    (hF : F ∈ T.edgeFinset.powersetCard 1) :
    (edgeSupport F).card = 2 := by
  obtain ⟨hFsub, hFcard⟩ := Finset.mem_powersetCard.mp hF
  obtain ⟨e, rfl⟩ := Finset.card_eq_one.mp hFcard
  have heT : e ∈ T.edgeFinset := hFsub (by simp)
  simpa [edgeSupport] using
    T.card_toFinset_mem_edgeFinset ⟨e, heT⟩

lemma edgePair_support_card
    (T : SimpleGraph V) [DecidableRel T.Adj]
    {F : Finset (Sym2 V)}
    (hF : F ∈ T.edgeFinset.powersetCard 2) :
    (edgeSupport F).card = 3 ∨ (edgeSupport F).card = 4 := by
  obtain ⟨hFsub, hFcard⟩ := Finset.mem_powersetCard.mp hF
  obtain ⟨e, f, hef, rfl⟩ := Finset.card_eq_two.mp hFcard
  have heT : e ∈ T.edgeFinset := hFsub (by simp)
  have hfT : f ∈ T.edgeFinset := hFsub (by simp)
  have hecard : e.toFinset.card = 2 :=
    T.card_toFinset_mem_edgeFinset ⟨e, heT⟩
  have hfcard : f.toFinset.card = 2 :=
    T.card_toFinset_mem_edgeFinset ⟨f, hfT⟩
  have hne : e.toFinset ≠ f.toFinset :=
    toFinset_ne_of_ne hef
  by_cases h3 : (e.toFinset ∪ f.toFinset).card = 3
  · left
    simpa [edgeSupport] using h3
  · right
    have hd : Disjoint e.toFinset f.toFinset := by
      have hi_le : (e.toFinset ∩ f.toFinset).card ≤ 1 := by
        by_contra h
        have hieq :
            e.toFinset ∩ f.toFinset = e.toFinset :=
          Finset.eq_of_subset_of_card_le
            Finset.inter_subset_left (by omega)
        have hsub : e.toFinset ⊆ f.toFinset := by
          intro x hx
          exact (Finset.mem_inter.mp
            (hieq.symm.subset hx)).2
        exact hne
          (Finset.eq_of_subset_of_card_le hsub (by omega))
      rw [Finset.disjoint_iff_inter_eq_empty,
        ← Finset.card_eq_zero]
      have hsum :=
        Finset.card_union_add_card_inter e.toFinset f.toFinset
      omega
    rw [edgeSupport]
    simp [Finset.card_union_of_disjoint hd, hecard, hfcard]

lemma edgeTriple_support_four_le
    (T : SimpleGraph V) [DecidableRel T.Adj] (hT : T.IsAcyclic)
    {F : Finset (Sym2 V)}
    (hF : F ∈ T.edgeFinset.powersetCard 3) :
    4 ≤ (edgeSupport F).card := by
  obtain ⟨hFsub, hFcard⟩ := Finset.mem_powersetCard.mp hF
  have hinc :
      F ⊆ T.edgeFinset ∩ (edgeSupport F).sym2 := by
    intro e he
    exact Finset.mem_inter.mpr
      ⟨hFsub he,
        (edgeSubset_sym2_iff_support_subset
          F (edgeSupport F)).mpr Finset.Subset.rfl he⟩
  have hq : 3 ≤ inducedEdgeCount T (edgeSupport F) := by
    rw [inducedEdgeCount]
    exact hFcard ▸ Finset.card_le_card hinc
  have hne : (edgeSupport F).Nonempty := by
    by_contra h
    have hz : edgeSupport F = ∅ :=
      Finset.not_nonempty_iff_eq_empty.mp h
    rw [hz] at hq
    simp [inducedEdgeCount] at hq
  have hlt :=
    inducedEdgeCount_lt_card T hT (edgeSupport F) hne
  omega

omit [Fintype V] [Nonempty V] in
lemma card_biUnion_image_left
    {α β : Type*} [DecidableEq α] [DecidableEq β]
    (A : Finset α) (B : α → Finset β) :
    (A.biUnion fun a =>
      (B a).image fun b => (a, b)).card =
      ∑ a ∈ A, (B a).card := by
  rw [Finset.card_biUnion]
  · refine Finset.sum_congr rfl fun a _ => ?_
    exact Finset.card_image_of_injective _
      (fun x y h => by simpa using h)
  · intro a _ a' _ haa'
    simp only [Function.onFun]
    rw [Finset.disjoint_left]
    intro x hx hx'
    rw [Finset.mem_image] at hx hx'
    obtain ⟨b, -, hb⟩ := hx
    obtain ⟨b', -, hb'⟩ := hx'
    exact haa' (Prod.mk.inj (hb.trans hb'.symm)).1

omit [Fintype V] [Nonempty V] in
lemma card_biUnion_image_right
    {α β : Type*} [DecidableEq α] [DecidableEq β]
    (A : Finset α) (B : α → Finset β) :
    (A.biUnion fun a =>
      (B a).image fun b => (b, a)).card =
      ∑ a ∈ A, (B a).card := by
  rw [Finset.card_biUnion]
  · refine Finset.sum_congr rfl fun a _ => ?_
    exact Finset.card_image_of_injective _
      (fun x y h => by simpa using h)
  · intro a _ a' _ haa'
    simp only [Function.onFun]
    rw [Finset.disjoint_left]
    intro x hx hx'
    rw [Finset.mem_image] at hx hx'
    obtain ⟨b, -, hb⟩ := hx
    obtain ⟨b', -, hb'⟩ := hx'
    exact haa' (Prod.mk.inj (hb.trans hb'.symm)).2

def edgeSubsetIncidences
    (T : SimpleGraph V) [DecidableRel T.Adj] (k r : ℕ) :
    Finset (Finset V × Finset (Sym2 V)) :=
  (vertexSets k).biUnion fun S =>
    ((T.edgeFinset ∩ S.sym2).powersetCard r).image
      fun F => (S, F)

def edgeSubsetIncidencesByEdges
    (T : SimpleGraph V) [DecidableRel T.Adj] (k r : ℕ) :
    Finset (Finset V × Finset (Sym2 V)) :=
  (T.edgeFinset.powersetCard r).biUnion fun F =>
    ((vertexSets k).filter
      (edgeSupport F ⊆ ·)).image fun S => (S, F)

lemma edgeSubsetIncidences_eq_byEdges
    (T : SimpleGraph V) [DecidableRel T.Adj] (k r : ℕ) :
    edgeSubsetIncidences T k r =
      edgeSubsetIncidencesByEdges T k r := by
  classical
  ext x
  simp only [edgeSubsetIncidences,
    edgeSubsetIncidencesByEdges, Finset.mem_biUnion,
    Finset.mem_image, Finset.mem_filter,
    Finset.mem_powersetCard]
  constructor
  · rintro ⟨S, hS, F, ⟨hFsub, hFcard⟩, rfl⟩
    refine ⟨F, ⟨?_, hFcard⟩, S, ⟨hS, ?_⟩, rfl⟩
    · exact hFsub.trans Finset.inter_subset_left
    · exact (edgeSubset_sym2_iff_support_subset F S).mp
        (hFsub.trans Finset.inter_subset_right)
  · rintro ⟨F, ⟨hFT, hFcard⟩, S, ⟨hS, hFS⟩, rfl⟩
    refine ⟨S, hS, F, ⟨?_, hFcard⟩, rfl⟩
    exact fun e he => Finset.mem_inter.mpr
      ⟨hFT he,
        (edgeSubset_sym2_iff_support_subset F S).mpr
          hFS he⟩

lemma card_vertexSets_filter_support
    (F : Finset (Sym2 V)) (k : ℕ) :
    ((vertexSets k).filter
      (edgeSupport F ⊆ ·)).card =
      if (edgeSupport F).card ≤ k then
        (Fintype.card V - (edgeSupport F).card).choose
          (k - (edgeSupport F).card)
      else 0 := by
  by_cases h : (edgeSupport F).card ≤ k
  · rw [if_pos h]
    unfold vertexSets
    simpa using
      Finset.card_filter_powersetCard_subset
        (edgeSupport F) (Finset.univ : Finset V) k
        (Finset.subset_univ _) h
  · rw [if_neg h, Finset.card_eq_zero,
      Finset.eq_empty_iff_forall_notMem]
    intro S hS
    rw [Finset.mem_filter, vertexSets,
      Finset.mem_powersetCard] at hS
    exact h ((Finset.card_le_card hS.2).trans_eq hS.1.2)

lemma sum_choose_inducedEdgeCount
    (T : SimpleGraph V) [DecidableRel T.Adj] (k r : ℕ) :
    ∑ S ∈ vertexSets k, (inducedEdgeCount T S).choose r =
      ∑ F ∈ T.edgeFinset.powersetCard r,
        if (edgeSupport F).card ≤ k then
          (Fintype.card V - (edgeSupport F).card).choose
            (k - (edgeSupport F).card)
        else 0 := by
  have hleft :
      (edgeSubsetIncidences T k r).card =
        ∑ S ∈ vertexSets k,
          (inducedEdgeCount T S).choose r := by
    unfold edgeSubsetIncidences
    rw [card_biUnion_image_left (vertexSets k)
      (fun S =>
        (T.edgeFinset ∩ S.sym2).powersetCard r)]
    simp [inducedEdgeCount, Finset.card_powersetCard]
  have hright :
      (edgeSubsetIncidencesByEdges T k r).card =
        ∑ F ∈ T.edgeFinset.powersetCard r,
          if (edgeSupport F).card ≤ k then
            (Fintype.card V - (edgeSupport F).card).choose
              (k - (edgeSupport F).card)
          else 0 := by
    unfold edgeSubsetIncidencesByEdges
    rw [card_biUnion_image_right
      (T.edgeFinset.powersetCard r)
      (fun F =>
        (vertexSets k).filter (edgeSupport F ⊆ ·))]
    exact Finset.sum_congr rfl fun F _ =>
      card_vertexSets_filter_support F k
  rw [← hleft, edgeSubsetIncidences_eq_byEdges, hright]

lemma sum_inducedEdgeCount
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (k : ℕ) (hk : 2 ≤ k) :
    ∑ S ∈ vertexSets k, inducedEdgeCount T S =
      T.edgeFinset.card *
        (Fintype.card V - 2).choose (k - 2) := by
  calc
    ∑ S ∈ vertexSets k, inducedEdgeCount T S =
        ∑ S ∈ vertexSets k,
          (inducedEdgeCount T S).choose 1 := by simp
    _ = ∑ F ∈ T.edgeFinset.powersetCard 1,
        if (edgeSupport F).card ≤ k then
          (Fintype.card V - (edgeSupport F).card).choose
            (k - (edgeSupport F).card)
        else 0 :=
      sum_choose_inducedEdgeCount T k 1
    _ = ∑ _F ∈ T.edgeFinset.powersetCard 1,
        (Fintype.card V - 2).choose (k - 2) := by
      exact Finset.sum_congr rfl fun F hF => by
        rw [edgeSingleton_support_card T hF]
        simp [hk]
    _ = T.edgeFinset.card *
        (Fintype.card V - 2).choose (k - 2) := by
      simp

lemma sum_choose_two_on_triples
    (T : SimpleGraph V) [DecidableRel T.Adj] :
    ∑ S ∈ vertexSets 3,
        (inducedEdgeCount T S).choose 2 =
      adjacentPairCount T := by
  rw [sum_choose_inducedEdgeCount T 3 2]
  calc
    ∑ F ∈ T.edgeFinset.powersetCard 2,
        (if (edgeSupport F).card ≤ 3 then
          (Fintype.card V - (edgeSupport F).card).choose
            (3 - (edgeSupport F).card)
        else 0) =
        ∑ F ∈ T.edgeFinset.powersetCard 2,
          if (edgeSupport F).card = 3 then 1 else 0 := by
      exact Finset.sum_congr rfl fun F hF => by
        rcases edgePair_support_card T hF with h3 | h4
        · simp [h3]
        · simp [h4]
    _ = adjacentPairCount T := by
      simpa [adjacentPairCount, adjacentEdgePairs] using
        (Finset.sum_boole (R := ℕ)
          (fun F : Finset (Sym2 V) =>
            (edgeSupport F).card = 3)
          (T.edgeFinset.powersetCard 2))

lemma sum_choose_two_on_quadruples
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hn : 4 ≤ Fintype.card V) :
    ∑ S ∈ vertexSets 4,
        (inducedEdgeCount T S).choose 2 =
      T.edgeFinset.card.choose 2 +
        (Fintype.card V - 4) * adjacentPairCount T := by
  rw [sum_choose_inducedEdgeCount T 4 2]
  calc
    ∑ F ∈ T.edgeFinset.powersetCard 2,
        (if (edgeSupport F).card ≤ 4 then
          (Fintype.card V - (edgeSupport F).card).choose
            (4 - (edgeSupport F).card)
        else 0) =
        ∑ F ∈ T.edgeFinset.powersetCard 2,
          (1 + if (edgeSupport F).card = 3 then
            Fintype.card V - 4 else 0) := by
      exact Finset.sum_congr rfl fun F hF => by
        rcases edgePair_support_card T hF with h3 | h4
        · simp [h3, Nat.choose_one_right]
          omega
        · simp [h4]
    _ = T.edgeFinset.card.choose 2 +
        (Fintype.card V - 4) * adjacentPairCount T := by
      rw [Finset.sum_add_distrib]
      have hbool :
          (∑ F ∈ T.edgeFinset.powersetCard 2,
            if (edgeSupport F).card = 3 then
              Fintype.card V - 4 else 0) =
            (Fintype.card V - 4) * adjacentPairCount T := by
        calc
          (∑ F ∈ T.edgeFinset.powersetCard 2,
            if (edgeSupport F).card = 3 then
              Fintype.card V - 4 else 0) =
              (∑ F ∈ T.edgeFinset.powersetCard 2,
                (if (edgeSupport F).card = 3 then 1 else 0)) *
                (Fintype.card V - 4) := by
                  rw [Finset.sum_mul]
                  exact Finset.sum_congr rfl fun F _ => by
                    split <;> simp_all
          _ = (Fintype.card V - 4) * adjacentPairCount T := by
            rw [Finset.sum_boole]
            simp [adjacentPairCount, adjacentEdgePairs, mul_comm]
      rw [hbool]
      simp

lemma sum_choose_three_on_quadruples
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsAcyclic) :
    ∑ S ∈ vertexSets 4,
        (inducedEdgeCount T S).choose 3 =
      connectedTripleCount T := by
  rw [sum_choose_inducedEdgeCount T 4 3]
  calc
    ∑ F ∈ T.edgeFinset.powersetCard 3,
        (if (edgeSupport F).card ≤ 4 then
          (Fintype.card V - (edgeSupport F).card).choose
            (4 - (edgeSupport F).card)
        else 0) =
        ∑ F ∈ T.edgeFinset.powersetCard 3,
          if (edgeSupport F).card = 4 then 1 else 0 := by
      exact Finset.sum_congr rfl fun F hF => by
        have hge := edgeTriple_support_four_le T hT hF
        by_cases h4 : (edgeSupport F).card = 4
        · simp [h4]
        · have hgt : 4 < (edgeSupport F).card := by omega
          simp [show ¬(edgeSupport F).card ≤ 4 by omega, h4]
    _ = connectedTripleCount T := by
      simpa [connectedTripleCount, connectedEdgeTriples] using
        (Finset.sum_boole (R := ℕ)
          (fun F : Finset (Sym2 V) =>
            (edgeSupport F).card = 4)
          (T.edgeFinset.powersetCard 3))

lemma indicator_ie_three (q : ℕ) (hq : q ≤ 2) :
    (if q = 0 then 1 else 0) + q =
      1 + q.choose 2 := by
  have h : q = 0 ∨ q = 1 ∨ q = 2 := by omega
  rcases h with rfl | rfl | rfl <;>
    norm_num [Nat.choose]

lemma indicator_ie_four (q : ℕ) (hq : q ≤ 3) :
    (if q = 0 then 1 else 0) + q + q.choose 3 =
      1 + q.choose 2 := by
  have h : q = 0 ∨ q = 1 ∨ q = 2 ∨ q = 3 := by omega
  rcases h with rfl | rfl | rfl | rfl <;>
    norm_num [Nat.choose]

lemma triple_inclusion_exclusion_raw
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hbound :
      ∀ S ∈ vertexSets 3, inducedEdgeCount T S ≤ 2) :
    Erdos993R2C3.ind T 3 +
        ∑ S ∈ vertexSets 3, inducedEdgeCount T S =
      (Fintype.card V).choose 3 +
        ∑ S ∈ vertexSets 3,
          (inducedEdgeCount T S).choose 2 := by
  rw [ind_eq_card_filter_edgeCount_zero]
  have hfilter :
      ((vertexSets 3).filter
        (fun S => inducedEdgeCount T S = 0)).card =
        ∑ S ∈ vertexSets 3,
          if inducedEdgeCount T S = 0 then 1 else 0 :=
    (Finset.sum_boole (R := ℕ)
      (fun S => inducedEdgeCount T S = 0)
      (vertexSets 3)).symm
  rw [hfilter, ← Finset.sum_add_distrib]
  calc
    ∑ S ∈ vertexSets 3,
        ((if inducedEdgeCount T S = 0 then 1 else 0) +
          inducedEdgeCount T S) =
        ∑ S ∈ vertexSets 3,
          (1 + (inducedEdgeCount T S).choose 2) := by
      exact Finset.sum_congr rfl fun S hS =>
        indicator_ie_three _ (hbound S hS)
    _ = (Fintype.card V).choose 3 +
        ∑ S ∈ vertexSets 3,
          (inducedEdgeCount T S).choose 2 := by
      rw [Finset.sum_add_distrib]
      simp [vertexSets]

lemma quadruple_inclusion_exclusion_raw
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hbound :
      ∀ S ∈ vertexSets 4, inducedEdgeCount T S ≤ 3) :
    Erdos993R2C3.ind T 4 +
        (∑ S ∈ vertexSets 4, inducedEdgeCount T S) +
        (∑ S ∈ vertexSets 4,
          (inducedEdgeCount T S).choose 3) =
      (Fintype.card V).choose 4 +
        ∑ S ∈ vertexSets 4,
          (inducedEdgeCount T S).choose 2 := by
  rw [ind_eq_card_filter_edgeCount_zero]
  have hfilter :
      ((vertexSets 4).filter
        (fun S => inducedEdgeCount T S = 0)).card =
        ∑ S ∈ vertexSets 4,
          if inducedEdgeCount T S = 0 then 1 else 0 :=
    (Finset.sum_boole (R := ℕ)
      (fun S => inducedEdgeCount T S = 0)
      (vertexSets 4)).symm
  rw [hfilter, ← Finset.sum_add_distrib,
    ← Finset.sum_add_distrib]
  calc
    ∑ S ∈ vertexSets 4,
        (((if inducedEdgeCount T S = 0 then 1 else 0) +
          inducedEdgeCount T S) +
          (inducedEdgeCount T S).choose 3) =
        ∑ S ∈ vertexSets 4,
          (1 + (inducedEdgeCount T S).choose 2) := by
      exact Finset.sum_congr rfl fun S hS =>
        indicator_ie_four _ (hbound S hS)
    _ = (Fintype.card V).choose 4 +
        ∑ S ∈ vertexSets 4,
          (inducedEdgeCount T S).choose 2 := by
      rw [Finset.sum_add_distrib]
      simp [vertexSets]

lemma tree_ind_three_identity
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsTree) :
    Erdos993R2C3.ind T 3 +
        (Fintype.card V - 1) * (Fintype.card V - 2) =
      (Fintype.card V).choose 3 + adjacentPairCount T := by
  have hbound :
      ∀ S ∈ vertexSets 3, inducedEdgeCount T S ≤ 2 := by
    intro S hS
    have hScard := (Finset.mem_powersetCard.mp hS).2
    have hSne : S.Nonempty := Finset.card_pos.mp (by omega)
    have hlt := inducedEdgeCount_lt_card T hT.isAcyclic S hSne
    omega
  have hraw := triple_inclusion_exclusion_raw T hbound
  rw [sum_inducedEdgeCount T 3 (by omega),
    sum_choose_two_on_triples T] at hraw
  have hm := hT.card_edgeFinset
  have hm' : T.edgeFinset.card = Fintype.card V - 1 := by
    omega
  simpa [hm', Nat.choose_one_right] using hraw

lemma tree_ind_four_identity
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsTree) (hn : 4 ≤ Fintype.card V) :
    Erdos993R2C3.ind T 4 +
        (Fintype.card V - 1) *
          (Fintype.card V - 2).choose 2 +
        connectedTripleCount T =
      (Fintype.card V).choose 4 +
        (Fintype.card V - 1).choose 2 +
        (Fintype.card V - 4) * adjacentPairCount T := by
  have hbound :
      ∀ S ∈ vertexSets 4, inducedEdgeCount T S ≤ 3 := by
    intro S hS
    have hScard := (Finset.mem_powersetCard.mp hS).2
    have hSne : S.Nonempty := Finset.card_pos.mp (by omega)
    have hlt := inducedEdgeCount_lt_card T hT.isAcyclic S hSne
    omega
  have hraw := quadruple_inclusion_exclusion_raw T hbound
  rw [sum_inducedEdgeCount T 4 (by omega),
    sum_choose_two_on_quadruples T hn,
    sum_choose_three_on_quadruples T hT.isAcyclic] at hraw
  have hm := hT.card_edgeFinset
  have hm' : T.edgeFinset.card = Fintype.card V - 1 := by
    omega
  simpa [hm', Nat.add_assoc] using hraw

omit [Fintype V] [Nonempty V] in
lemma disjoint_of_card_union_ne_three
    {α : Type*} [DecidableEq α]
    {a b : Finset α} (ha : a.card = 2) (hb : b.card = 2)
    (hab : a ≠ b) (hu : (a ∪ b).card ≠ 3) :
    Disjoint a b := by
  have hi_le : (a ∩ b).card ≤ 1 := by
    by_contra h
    have htwo : 2 ≤ (a ∩ b).card := by omega
    have hieq : a ∩ b = a :=
      Finset.eq_of_subset_of_card_le
        Finset.inter_subset_left (by omega)
    have habsub : a ⊆ b := by
      intro x hx
      exact (Finset.mem_inter.mp (hieq.symm.subset hx)).2
    exact hab
      (Finset.eq_of_subset_of_card_le habsub (by omega))
  have hsum := Finset.card_union_add_card_inter a b
  have hi0 : (a ∩ b).card = 0 := by omega
  rw [Finset.disjoint_iff_inter_eq_empty,
    ← Finset.card_eq_zero]
  exact hi0

omit [Fintype V] [Nonempty V] in
lemma eq_of_two_disjoint_pairs
    {α : Type*} [DecidableEq α]
    {a b c : Finset α}
    (ha : a.card = 2) (hb : b.card = 2) (hc : c.card = 2)
    (hu : (a ∪ b ∪ c).card = 4)
    (hab : Disjoint a b) (hac : Disjoint a c) :
    b = c := by
  have habcard : (a ∪ b).card = 4 := by
    rw [Finset.card_union_of_disjoint hab, ha, hb]
  have hsub : a ∪ b ⊆ a ∪ b ∪ c :=
    Finset.subset_union_left
  have heq : a ∪ b = a ∪ b ∪ c :=
    Finset.eq_of_subset_of_card_le hsub (by omega)
  have hcsub : c ⊆ a ∪ b := by
    intro x hx
    have hx' : x ∈ a ∪ b ∪ c :=
      Finset.mem_union_right _ hx
    rw [← heq] at hx'
    exact hx'
  have hcsubb : c ⊆ b := by
    intro x hx
    rcases Finset.mem_union.mp (hcsub hx) with hxa | hxb
    · exact False.elim
        ((Finset.disjoint_left.mp hac) hxa hx)
    · exact hxb
  exact
    (Finset.eq_of_subset_of_card_le hcsubb (by omega)).symm

omit [Fintype V] [Nonempty V] in
lemma not_two_bad_unions
    {α : Type*} [DecidableEq α]
    {a b c : Finset α}
    (ha : a.card = 2) (hb : b.card = 2) (hc : c.card = 2)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (hu : (a ∪ b ∪ c).card = 4) :
    ¬((a ∪ b).card ≠ 3 ∧ (a ∪ c).card ≠ 3) := by
  rintro ⟨hab3, hac3⟩
  exact hbc
    (eq_of_two_disjoint_pairs ha hb hc hu
      (disjoint_of_card_union_ne_three ha hb hab hab3)
      (disjoint_of_card_union_ne_three ha hc hac hac3))

lemma two_adjacent_pairs_of_mem_connectedEdgeTriples
    (T : SimpleGraph V) [DecidableRel T.Adj]
    {F : Finset (Sym2 V)}
    (hF : F ∈ connectedEdgeTriples T) :
    2 ≤ ((F.powersetCard 2).filter
      (fun W => (edgeSupport W).card = 3)).card := by
  rw [connectedEdgeTriples, Finset.mem_filter,
    Finset.mem_powersetCard] at hF
  obtain ⟨hFsub, hFcard⟩ := hF.1
  have hSupport := hF.2
  obtain ⟨e, f, g, hef, heg, hfg, rfl⟩ :=
    Finset.card_eq_three.mp hFcard
  have heT : e ∈ T.edgeFinset := hFsub (by simp)
  have hfT : f ∈ T.edgeFinset := hFsub (by simp)
  have hgT : g ∈ T.edgeFinset := hFsub (by simp)
  let a := e.toFinset
  let b := f.toFinset
  let c := g.toFinset
  have ha : a.card = 2 :=
    T.card_toFinset_mem_edgeFinset ⟨e, heT⟩
  have hb : b.card = 2 :=
    T.card_toFinset_mem_edgeFinset ⟨f, hfT⟩
  have hc : c.card = 2 :=
    T.card_toFinset_mem_edgeFinset ⟨g, hgT⟩
  have hab : a ≠ b := toFinset_ne_of_ne hef
  have hac : a ≠ c := toFinset_ne_of_ne heg
  have hbc : b ≠ c := toFinset_ne_of_ne hfg
  have hu : (a ∪ b ∪ c).card = 4 := by
    simpa [edgeSupport, a, b, c] using hSupport
  have hABAC :=
    not_two_bad_unions ha hb hc hab hac hbc hu
  have hABBC :
      ¬((a ∪ b).card ≠ 3 ∧ (b ∪ c).card ≠ 3) := by
    have h :=
      not_two_bad_unions hb ha hc hab.symm hbc hac (by
        simpa [Finset.union_assoc, Finset.union_left_comm,
          Finset.union_comm] using hu)
    simpa [Finset.union_comm] using h
  have hACBC :
      ¬((a ∪ c).card ≠ 3 ∧ (b ∪ c).card ≠ 3) := by
    have h :=
      not_two_bad_unions hc ha hb hac.symm hbc.symm hab (by
        simpa [Finset.union_assoc, Finset.union_left_comm,
          Finset.union_comm] using hu)
    simpa [Finset.union_comm] using h
  let P :=
    (({e, f, g} : Finset (Sym2 V)).powersetCard 2).filter
      (fun W => (edgeSupport W).card = 3)
  have pair_mem (x y : Sym2 V) (hxy : x ≠ y)
      (hx : x ∈ ({e, f, g} : Finset (Sym2 V)))
      (hy : y ∈ ({e, f, g} : Finset (Sym2 V)))
      (hgood :
        (edgeSupport ({x, y} : Finset (Sym2 V))).card = 3) :
      ({x, y} : Finset (Sym2 V)) ∈ P := by
    change ({x, y} : Finset (Sym2 V)) ∈
      (({e, f, g} : Finset (Sym2 V)).powersetCard 2).filter
        (fun W => (edgeSupport W).card = 3)
    rw [Finset.mem_filter, Finset.mem_powersetCard]
    have hsub :
        ({x, y} : Finset (Sym2 V)) ⊆ {e, f, g} := by
      intro z hz
      rw [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hx
      · exact hy
    exact
      ⟨⟨hsub, Finset.card_pair_eq_two_iff.mpr hxy⟩, hgood⟩
  have pair_ne (x y z : Sym2 V)
      (hyx : y ≠ x) (hyz : y ≠ z) :
      ({x, y} : Finset (Sym2 V)) ≠ {x, z} := by
    intro h
    have hy' : y ∈ ({x, z} : Finset (Sym2 V)) := by
      rw [← h]
      simp
    simpa [hyx, hyz] using hy'
  have hcard : 1 < P.card := by
    rw [Finset.one_lt_card]
    by_cases hAB : (a ∪ b).card = 3
    · by_cases hAC : (a ∪ c).card = 3
      · refine
          ⟨{e, f}, pair_mem e f hef (by simp) (by simp) ?_,
            {e, g}, pair_mem e g heg (by simp) (by simp) ?_, ?_⟩
        · simpa [edgeSupport, a, b] using hAB
        · simpa [edgeSupport, a, c] using hAC
        · exact pair_ne e f g hef.symm hfg
      · have hBC : (b ∪ c).card = 3 := by
          by_contra h
          exact hACBC ⟨hAC, h⟩
        refine
          ⟨{e, f}, pair_mem e f hef (by simp) (by simp) ?_,
            {f, g}, pair_mem f g hfg (by simp) (by simp) ?_, ?_⟩
        · simpa [edgeSupport, a, b] using hAB
        · simpa [edgeSupport, b, c] using hBC
        · intro h
          have he' : e ∈ ({f, g} : Finset (Sym2 V)) := by
            rw [← h]
            simp
          simpa [hef, heg] using he'
    · have hAC : (a ∪ c).card = 3 := by
        by_contra h
        exact hABAC ⟨hAB, h⟩
      have hBC : (b ∪ c).card = 3 := by
        by_contra h
        exact hABBC ⟨hAB, h⟩
      refine
        ⟨{e, g}, pair_mem e g heg (by simp) (by simp) ?_,
          {f, g}, pair_mem f g hfg (by simp) (by simp) ?_, ?_⟩
      · simpa [edgeSupport, a, c] using hAC
      · simpa [edgeSupport, b, c] using hBC
      · intro h
        have he' : e ∈ ({f, g} : Finset (Sym2 V)) := by
          rw [← h]
          simp
        simpa [hef, heg] using he'
  change 2 ≤ P.card
  omega

def chargePairs (T : SimpleGraph V) [DecidableRel T.Adj] :
    Finset (Finset (Sym2 V) × Finset (Sym2 V)) :=
  (connectedEdgeTriples T).biUnion fun F =>
    ((F.powersetCard 2).filter
      (fun W => (edgeSupport W).card = 3)).image
        fun W => (F, W)

def chargePairsByAdjacent
    (T : SimpleGraph V) [DecidableRel T.Adj] :
    Finset (Finset (Sym2 V) × Finset (Sym2 V)) :=
  (adjacentEdgePairs T).biUnion fun W =>
    ((connectedEdgeTriples T).filter
      (W ⊆ ·)).image fun F => (F, W)

lemma chargePairs_eq_chargePairsByAdjacent
    (T : SimpleGraph V) [DecidableRel T.Adj] :
    chargePairs T = chargePairsByAdjacent T := by
  classical
  ext x
  simp only [chargePairs, chargePairsByAdjacent,
    Finset.mem_biUnion, Finset.mem_image, Finset.mem_filter,
    Finset.mem_powersetCard]
  constructor
  · rintro ⟨F, hF, W,
      ⟨⟨hWF, hWcard⟩, hWsupport⟩, rfl⟩
    refine ⟨W, ?_, F, ?_, rfl⟩
    · rw [adjacentEdgePairs, Finset.mem_filter,
        Finset.mem_powersetCard]
      exact
        ⟨⟨hWF.trans
          (Finset.mem_powersetCard.mp
            (Finset.mem_filter.mp hF).1).1,
          hWcard⟩, hWsupport⟩
    · exact ⟨hF, hWF⟩
  · rintro ⟨W, hW, F, ⟨hF, hWF⟩, rfl⟩
    refine ⟨F, hF, W, ?_, rfl⟩
    rw [adjacentEdgePairs, Finset.mem_filter,
      Finset.mem_powersetCard] at hW
    exact ⟨⟨hWF, hW.1.2⟩, hW.2⟩

lemma card_chargePairs
    (T : SimpleGraph V) [DecidableRel T.Adj] :
    (chargePairs T).card =
      ∑ F ∈ connectedEdgeTriples T,
        ((F.powersetCard 2).filter
          (fun W => (edgeSupport W).card = 3)).card := by
  unfold chargePairs
  exact card_biUnion_image_left
    (connectedEdgeTriples T)
    (fun F => (F.powersetCard 2).filter
      (fun W => (edgeSupport W).card = 3))

lemma card_chargePairsByAdjacent
    (T : SimpleGraph V) [DecidableRel T.Adj] :
    (chargePairsByAdjacent T).card =
      ∑ W ∈ adjacentEdgePairs T,
        ((connectedEdgeTriples T).filter (W ⊆ ·)).card := by
  unfold chargePairsByAdjacent
  exact card_biUnion_image_right
    (adjacentEdgePairs T)
    (fun W => (connectedEdgeTriples T).filter (W ⊆ ·))

lemma connected_supersets_card_le
    (T : SimpleGraph V) [DecidableRel T.Adj]
    {W : Finset (Sym2 V)} (hW : W ∈ adjacentEdgePairs T) :
    ((connectedEdgeTriples T).filter (W ⊆ ·)).card
      ≤ T.edgeFinset.card - 2 := by
  rw [adjacentEdgePairs, Finset.mem_filter,
    Finset.mem_powersetCard] at hW
  have hsub :
      (connectedEdgeTriples T).filter (W ⊆ ·) ⊆
        (T.edgeFinset.powersetCard 3).filter (W ⊆ ·) := by
    intro F hF
    rw [Finset.mem_filter] at hF ⊢
    exact ⟨(Finset.mem_filter.mp hF.1).1, hF.2⟩
  refine (Finset.card_le_card hsub).trans_eq ?_
  rw [Finset.card_filter_powersetCard_subset
    W T.edgeFinset 3 hW.1.1 (by omega)]
  simp [hW.1.2]

lemma connected_triple_charging
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsTree) (hn : 3 ≤ Fintype.card V) :
    2 * connectedTripleCount T ≤
      (Fintype.card V - 3) * adjacentPairCount T := by
  have hm := hT.card_edgeFinset
  calc
    2 * connectedTripleCount T =
        ∑ _F ∈ connectedEdgeTriples T, 2 := by
      simp [connectedTripleCount, mul_comm]
    _ ≤ ∑ F ∈ connectedEdgeTriples T,
        ((F.powersetCard 2).filter
          (fun W => (edgeSupport W).card = 3)).card := by
      exact Finset.sum_le_sum fun F hF =>
        two_adjacent_pairs_of_mem_connectedEdgeTriples T hF
    _ = (chargePairs T).card := (card_chargePairs T).symm
    _ = (chargePairsByAdjacent T).card :=
      congrArg Finset.card (chargePairs_eq_chargePairsByAdjacent T)
    _ = ∑ W ∈ adjacentEdgePairs T,
        ((connectedEdgeTriples T).filter (W ⊆ ·)).card :=
      card_chargePairsByAdjacent T
    _ ≤ ∑ _W ∈ adjacentEdgePairs T,
        (T.edgeFinset.card - 2) := by
      exact Finset.sum_le_sum fun W hW =>
        connected_supersets_card_le T hW
    _ = (Fintype.card V - 3) * adjacentPairCount T := by
      have hedge :
          T.edgeFinset.card - 2 = Fintype.card V - 3 := by
        omega
      simp [adjacentPairCount, hedge, Nat.mul_comm]

lemma choose_two_cleared (n : ℕ) :
    2 * n.choose 2 = n * (n - 1) := by
  have h := Nat.descFactorial_eq_factorial_mul_choose n 2
  norm_num [Nat.factorial, Nat.descFactorial] at h
  calc
    2 * n.choose 2 = (n - 1) * n := h.symm
    _ = n * (n - 1) := by ring

lemma choose_three_cleared (n : ℕ) :
    6 * n.choose 3 = n * (n - 1) * (n - 2) := by
  have h := Nat.descFactorial_eq_factorial_mul_choose n 3
  norm_num [Nat.factorial, Nat.descFactorial] at h
  calc
    6 * n.choose 3 = (n - 2) * ((n - 1) * n) := h.symm
    _ = n * (n - 1) * (n - 2) := by ring

lemma choose_four_cleared (n : ℕ) :
    24 * n.choose 4 =
      n * (n - 1) * (n - 2) * (n - 3) := by
  have h := Nat.descFactorial_eq_factorial_mul_choose n 4
  norm_num [Nat.factorial, Nat.descFactorial] at h
  calc
    24 * n.choose 4 =
        (n - 3) * ((n - 2) * ((n - 1) * n)) := h.symm
    _ = n * (n - 1) * (n - 2) * (n - 3) := by ring

lemma large_order_arithmetic
    (n i3 i4 A C : ℕ) (hn : 27 ≤ n)
    (h3 : i3 + (n - 1) * (n - 2) = n.choose 3 + A)
    (h4 : i4 + (n - 1) * (n - 2).choose 2 + C =
      n.choose 4 + (n - 1).choose 2 + (n - 4) * A)
    (hcharge : 2 * C ≤ (n - 3) * A) :
    (n - 5) * i3 < 5 * i4 := by
  let N : ℤ := n
  let I3 : ℤ := i3
  let I4 : ℤ := i4
  let AZ : ℤ := A
  let CZ : ℤ := C
  have hn1 : ((n - 1 : ℕ) : ℤ) = N - 1 := by simp [N]; omega
  have hn2 : ((n - 2 : ℕ) : ℤ) = N - 2 := by simp [N]; omega
  have hn3 : ((n - 3 : ℕ) : ℤ) = N - 3 := by simp [N]; omega
  have hn4 : ((n - 4 : ℕ) : ℤ) = N - 4 := by simp [N]; omega
  have hn5 : ((n - 5 : ℕ) : ℤ) = N - 5 := by simp [N]; omega
  have h3z := congrArg (fun x : ℕ => (x : ℤ)) h3
  norm_num only [Nat.cast_add, Nat.cast_mul] at h3z
  rw [hn1, hn2] at h3z
  change I3 + (N - 1) * (N - 2) =
    (n.choose 3 : ℤ) + AZ at h3z
  have h4z := congrArg (fun x : ℕ => (x : ℤ)) h4
  norm_num only [Nat.cast_add, Nat.cast_mul] at h4z
  rw [hn1, hn4] at h4z
  change I4 + (N - 1) * ((n - 2).choose 2 : ℤ) + CZ =
    (n.choose 4 : ℤ) + ((n - 1).choose 2 : ℤ) +
      (N - 4) * AZ at h4z
  have hcz' :
      ((2 * C : ℕ) : ℤ) ≤ (((n - 3) * A : ℕ) : ℤ) := by
    exact_mod_cast hcharge
  norm_num only [Nat.cast_ofNat, Nat.cast_mul] at hcz'
  rw [hn3] at hcz'
  change 2 * CZ ≤ (N - 3) * AZ at hcz'
  have hc2n :=
    congrArg (fun x : ℕ => (x : ℤ)) (choose_two_cleared n)
  have hc2n1 :=
    congrArg (fun x : ℕ => (x : ℤ))
      (choose_two_cleared (n - 1))
  have hc2n2 :=
    congrArg (fun x : ℕ => (x : ℤ))
      (choose_two_cleared (n - 2))
  have hc3n :=
    congrArg (fun x : ℕ => (x : ℤ)) (choose_three_cleared n)
  have hc4n :=
    congrArg (fun x : ℕ => (x : ℤ)) (choose_four_cleared n)
  norm_num only [Nat.cast_ofNat, Nat.cast_mul] at hc2n hc2n1 hc2n2 hc3n hc4n
  rw [hn1] at hc2n
  have hn1m1 :
      (((n - 1) - 1 : ℕ) : ℤ) = N - 2 := by simp [N]; omega
  have hn2m1 :
      (((n - 2) - 1 : ℕ) : ℤ) = N - 3 := by simp [N]; omega
  rw [hn1, hn1m1] at hc2n1
  rw [hn2, hn2m1] at hc2n2
  rw [hn1, hn2] at hc3n
  rw [hn1, hn2, hn3] at hc4n
  have hi3 :
      I3 = (n.choose 3 : ℤ) -
        (N - 1) * (N - 2) + AZ := by
    linarith
  have hi4 :
      I4 = (n.choose 4 : ℤ) + ((n - 1).choose 2 : ℤ) +
        (N - 4) * AZ -
        (N - 1) * ((n - 2).choose 2 : ℤ) - CZ := by
    linarith
  have hmargin :
      24 * (5 * I4 - (N - 5) * I3) =
        (N - 1) * (N - 2) *
            (N * N - 31 * N + 120) +
          24 * (4 * N - 15) * AZ - 120 * CZ := by
    rw [hi3, hi4]
    calc
      24 * (5 * ((n.choose 4 : ℤ) +
          ((n - 1).choose 2 : ℤ) + (N - 4) * AZ -
          (N - 1) * ((n - 2).choose 2 : ℤ) - CZ) -
          (N - 5) * ((n.choose 3 : ℤ) -
            (N - 1) * (N - 2) + AZ)) =
        5 * (24 * (n.choose 4 : ℤ)) +
          60 * (2 * ((n - 1).choose 2 : ℤ)) +
          120 * (N - 4) * AZ -
          60 * (N - 1) *
            (2 * ((n - 2).choose 2 : ℤ)) -
          120 * CZ -
          4 * (N - 5) * (6 * (n.choose 3 : ℤ)) +
          24 * (N - 5) * (N - 1) * (N - 2) -
          24 * (N - 5) * AZ := by ring
      _ = (N - 1) * (N - 2) *
            (N * N - 31 * N + 120) +
          24 * (4 * N - 15) * AZ - 120 * CZ := by
        rw [hc4n, hc2n1, hc2n2, hc3n]
        ring
  have hN : (27 : ℤ) ≤ N := by
    change (27 : ℤ) ≤ (n : ℤ)
    exact_mod_cast hn
  have hbase : 12 ≤ N * N - 31 * N + 120 := by
    nlinarith [sq_nonneg (N - 27)]
  have hpoly :
      0 < (N - 1) * (N - 2) *
        (N * N - 31 * N + 120) := by
    have h1 : 0 < N - 1 := by linarith
    have h2 : 0 < N - 2 := by linarith
    exact mul_pos (mul_pos h1 h2) (by linarith)
  have hA : 0 ≤ AZ := by simp [AZ]
  have hscale :
      120 * CZ ≤ 60 * (N - 3) * AZ := by
    nlinarith [hcz']
  have hcoef :
      60 * (N - 3) * AZ ≤
        24 * (4 * N - 15) * AZ := by
    have hc : 0 ≤ (36 * N - 180) * AZ :=
      mul_nonneg (by linarith) hA
    nlinarith
  have hrest :
      0 ≤ 24 * (4 * N - 15) * AZ - 120 * CZ :=
    sub_nonneg.mpr (hscale.trans hcoef)
  have hrhs :
      0 < (N - 1) * (N - 2) *
          (N * N - 31 * N + 120) +
        (24 * (4 * N - 15) * AZ - 120 * CZ) :=
    add_pos_of_pos_of_nonneg hpoly hrest
  have hpositive :
      0 < 5 * I4 - (N - 5) * I3 := by
    nlinarith [hmargin]
  have hpositive' :
      ((n - 5 : ℕ) : ℤ) * (i3 : ℤ) <
        5 * (i4 : ℤ) := by
    rw [hn5]
    linarith
  exact_mod_cast hpositive'

theorem tree_e3_large_order
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsTree) (hn : 27 ≤ Fintype.card V) :
    (Fintype.card V - 5) * Erdos993R2C3.ind T 3 <
      5 * Erdos993R2C3.ind T 4 := by
  exact large_order_arithmetic
    (Fintype.card V)
    (Erdos993R2C3.ind T 3)
    (Erdos993R2C3.ind T 4)
    (adjacentPairCount T)
    (connectedTripleCount T)
    hn
    (tree_ind_three_identity T hT)
    (tree_ind_four_identity T hT (by omega))
    (connected_triple_charging T hT (by omega))

end Erdos993GapBridge
