import Mathlib
namespace C4F305

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Independent labelled finsets of integer rank `k`. The integer card equation
makes the type empty at negative ranks and at ranks above the vertex count. -/
def IndepFinsetAt (G : SimpleGraph V) (k : Int) :=
  {s : Finset V // G.IsIndepSet (s : Set V) ∧ (s.card : Int) = k}

noncomputable instance instFintypeIndepFinsetAt
    (G : SimpleGraph V) (k : Int) : Fintype (IndepFinsetAt G k) :=
  Fintype.ofInjective Subtype.val Subtype.val_injective

/-- Zero-extended integer-rank independent-set coefficient. -/
noncomputable def iCoeff (G : SimpleGraph V) (k : Int) : Int :=
  Fintype.card (IndepFinsetAt G k)

/-- Adjacent difference of the zero-extended coefficient sequence. -/
noncomputable def delta (G : SimpleGraph V) (r : Int) : Int :=
  iCoeff G (r + 1) - iCoeff G r

/-- Deletion of a labelled vertex, represented as the induced graph on its complement. -/
abbrev deletion (G : SimpleGraph V) (v : V) :=
  G.induce ({v} : Set V)ᶜ

/-- A leaf is stated without a decidability or degree instance: it has exactly one neighbor. -/
def IsLeaf (G : SimpleGraph V) (v : V) : Prop :=
  ∃! w, G.Adj v w

/-- Degree stated without exposing a decidability instance in theorem hypotheses. -/
noncomputable def vertexDegree (G : SimpleGraph V) (v : V) : Nat :=
  Nat.card (G.neighborSet v)

lemma degree_le_two_of_exactly_two_leaves {T : SimpleGraph V} {x y : V}
    (hT : T.IsTree) (hxy : x ≠ y)
    (hleaves : {v : V | IsLeaf T v} = ({x, y} : Set V)) :
    ∀ v, vertexDegree T v ≤ 2 := by
  classical
  let b : V → Int := fun v =>
    2 - (if v = x then 1 else 0) - (if v = y then 1 else 0)
  haveI : Nontrivial V := nontrivial_of_ne x y hxy
  have hxdeg : T.degree x = 1 := by
    apply degree_eq_one_iff_existsUnique_adj.mpr
    have hxmem : x ∈ ({x, y} : Set V) := by simp
    rw [← hleaves] at hxmem
    exact hxmem
  have hydeg : T.degree y = 1 := by
    apply degree_eq_one_iff_existsUnique_adj.mpr
    have hymem : y ∈ ({x, y} : Set V) := by simp
    rw [← hleaves] at hymem
    exact hymem
  have hb_le : ∀ v, b v ≤ (T.degree v : Int) := by
    intro v
    by_cases hvx : v = x
    · subst v
      simp [b, hxdeg, hxy]
    by_cases hvy : v = y
    · subst v
      simp [b, hydeg, hvx]
    have hpos : 0 < T.degree v := hT.preconnected.degree_pos_of_nontrivial v
    have hne_one : T.degree v ≠ 1 := by
      intro hvone
      have hvleaf : v ∈ {w : V | IsLeaf T w} := by
        exact degree_eq_one_iff_existsUnique_adj.mp hvone
      rw [hleaves] at hvleaf
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hvleaf
      exact hvleaf.elim hvx hvy
    have htwo : 2 ≤ T.degree v := by omega
    simp [b, hvx, hvy]
    exact_mod_cast htwo
  have hsum_b : (∑ v : V, b v) = 2 * (Fintype.card V : Int) - 2 := by
    simp [b, Finset.sum_sub_distrib]
    omega
  have hsum_nat : (∑ v : V, T.degree v) = 2 * (Fintype.card V - 1) := by
    calc
      (∑ v : V, T.degree v) = 2 * T.edgeFinset.card :=
        T.sum_degrees_eq_twice_card_edges
      _ = 2 * (Fintype.card V - 1) := by
        have hedge := hT.card_edgeFinset
        omega
  have hsum_degree : (∑ v : V, (T.degree v : Int)) =
      2 * (Fintype.card V : Int) - 2 := by
    rw [← Nat.cast_sum]
    rw [hsum_nat]
    have hcard : 1 <= Fintype.card V := Fintype.card_pos_iff.mpr inferInstance
    push_cast
    omega
  have hdegree_le : ∀ v, T.degree v ≤ 2 := by
    intro v
    by_contra hv
    have hstrict : b v < (T.degree v : Int) := by
      have hthree : 3 ≤ T.degree v := by omega
      have hb_two : b v ≤ 2 := by
        simp only [b]
        split <;> split <;> omega
      exact lt_of_le_of_lt hb_two (by exact_mod_cast hthree)
    have hsum_strict := Finset.sum_lt_sum (s := Finset.univ)
      (fun w _ => hb_le w) (by exact ⟨v, Finset.mem_univ v, hstrict⟩)
    rw [hsum_b, hsum_degree] at hsum_strict
    exact (lt_irrefl _ hsum_strict)
  intro v
  rw [vertexDegree, Nat.card_eq_fintype_card, T.card_neighborSet_eq_degree]
  exact hdegree_le v

lemma exists_spanning_path_of_exactly_two_leaves {T : SimpleGraph V} {x y : V}
    (hT : T.IsTree) (hxy : x ≠ y)
    (hleaves : {v : V | IsLeaf T v} = ({x, y} : Set V)) :
    ∃ p : T.Walk x y, p.IsPath ∧
      (∀ v, v ∈ p.support) ∧
      (∀ v, v ∈ p.support → p.toSubgraph.neighborSet v = T.neighborSet v) := by
  classical
  haveI : Nontrivial V := nontrivial_of_ne x y hxy
  have hxdeg : T.degree x = 1 := by
    apply degree_eq_one_iff_existsUnique_adj.mpr
    have hxmem : x ∈ ({x, y} : Set V) := by simp
    rw [← hleaves] at hxmem
    exact hxmem
  have hydeg : T.degree y = 1 := by
    apply degree_eq_one_iff_existsUnique_adj.mpr
    have hymem : y ∈ ({x, y} : Set V) := by simp
    rw [← hleaves] at hymem
    exact hymem
  have hdegree_le : ∀ v, T.degree v ≤ 2 := by
    intro v
    have hv := degree_le_two_of_exactly_two_leaves hT hxy hleaves v
    rw [vertexDegree, Nat.card_eq_fintype_card, T.card_neighborSet_eq_degree] at hv
    exact hv
  obtain ⟨p, hp, _⟩ := hT.existsUnique_path x y
  have hpnon : ¬p.Nil := Walk.not_nil_of_ne hxy
  have hneighbor_eq : ∀ v, v ∈ p.support →
      p.toSubgraph.neighborSet v = T.neighborSet v := by
    intro v hv
    apply Set.eq_of_subset_of_ncard_le (p.toSubgraph.neighborSet_subset v)
    have hambient : (T.neighborSet v).ncard = T.degree v := by
      rw [← Set.fintypeCard_eq_ncard]
      exact T.card_neighborSet_eq_degree v
    rw [hambient]
    obtain ⟨i, hi, hile⟩ := Walk.mem_support_iff_exists_getVert.mp hv
    rw [← hi]
    by_cases hi0 : i = 0
    · subst i
      rw [p.getVert_zero, hxdeg, hp.neighborSet_toSubgraph_startpoint hpnon]
      simp
    by_cases hilast : i = p.length
    · subst i
      rw [p.getVert_length, hydeg, hp.neighborSet_toSubgraph_endpoint hpnon]
      simp
    rw [hp.ncard_neighborSet_toSubgraph_internal_eq_two hi0 (by omega)]
    exact hdegree_le (p.getVert i)
  have hclosed : ∀ {u v}, u ∈ p.support → T.Adj u v → v ∈ p.support := by
    intro u v hu huv
    have hv : v ∈ T.neighborSet u := huv
    rw [← hneighbor_eq u hu] at hv
    exact p.mem_verts_toSubgraph.mp (p.toSubgraph.neighborSet_subset_verts u hv)
  have hall : ∀ v, v ∈ p.support := by
    intro v
    have hr := (reachable_iff_reflTransGen x v).mp (hT.connected x v)
    induction hr with
    | refl => exact p.start_mem_support
    | tail _ huv ih => exact hclosed ih huv
  exact ⟨p, hp, hall, hneighbor_eq⟩

/-- A spanning path subgraph is the entire ambient graph, as a graph isomorphism. -/
noncomputable def spanningPathSubgraphIso {T : SimpleGraph V} {x y : V}
    (p : T.Walk x y) (hall : ∀ v, v ∈ p.support)
    (hneighbors : ∀ v, v ∈ p.support →
      p.toSubgraph.neighborSet v = T.neighborSet v) :
    p.toSubgraph.coe ≃g T where
  toEquiv :=
    { toFun := Subtype.val
      invFun := fun v => ⟨v, p.mem_verts_toSubgraph.mpr (hall v)⟩
      left_inv := fun v => Subtype.ext rfl
      right_inv := fun _ => rfl }
  map_rel_iff' := by
    intro a b
    change T.Adj a.val b.val ↔ p.toSubgraph.Adj a.val b.val
    refine ⟨?_, p.toSubgraph.adj_sub⟩
    intro hab
    have hb : b.val ∈ T.neighborSet a.val := hab
    rw [← hneighbors a.val (hall a.val)] at hb
    exact hb

/-- A spanning path supplies a path-graph presentation of the ambient graph. -/
noncomputable def spanningPathIso {T : SimpleGraph V} {x y : V}
    (p : T.Walk x y) (hp : p.IsPath) (hall : ∀ v, v ∈ p.support)
    (hneighbors : ∀ v, v ∈ p.support →
      p.toSubgraph.neighborSet v = T.neighborSet v) :
    pathGraph (p.length + 1) ≃g T :=
  (spanningPathSubgraphIso p hall hneighbors).comp hp.pathGraphIsoToSubgraph

/-- Reversal is an automorphism of every finite path graph. -/
def pathGraphReverseIso (n : Nat) : pathGraph n ≃g pathGraph n where
  toEquiv := Fin.revPerm
  map_rel_iff' := by
    intro i j
    simp only [pathGraph_adj, Fin.revPerm_apply, Fin.rev]
    constructor <;> intro h <;> omega

@[simp] lemma spanningPathIso_zero {T : SimpleGraph V} {x y : V}
    (p : T.Walk x y) (hp : p.IsPath) (hall : ∀ v, v ∈ p.support)
    (hneighbors : ∀ v, v ∈ p.support →
      p.toSubgraph.neighborSet v = T.neighborSet v) :
    spanningPathIso p hp hall hneighbors (0 : Fin (p.length + 1)) = x := by
  change p.support[0] = x
  exact p.support_getElem_zero

@[simp] lemma spanningPathIso_last {T : SimpleGraph V} {x y : V}
    (p : T.Walk x y) (hp : p.IsPath) (hall : ∀ v, v ∈ p.support)
    (hneighbors : ∀ v, v ∈ p.support →
      p.toSubgraph.neighborSet v = T.neighborSet v) :
    spanningPathIso p hp hall hneighbors (Fin.last p.length) = y := by
  change p.support[p.length] = y
  exact p.support_getElem_length

/-- Conjugating path reversal by a spanning-path presentation gives an automorphism of `T`. -/
noncomputable def pathReversalAut {T : SimpleGraph V} {x y : V}
    (p : T.Walk x y) (hp : p.IsPath) (hall : ∀ v, v ∈ p.support)
    (hneighbors : ∀ v, v ∈ p.support →
      p.toSubgraph.neighborSet v = T.neighborSet v) : T ≃g T :=
  let e := spanningPathIso p hp hall hneighbors
  e.comp ((pathGraphReverseIso (p.length + 1)).comp e.symm)

lemma pathReversalAut_start {T : SimpleGraph V} {x y : V}
    (p : T.Walk x y) (hp : p.IsPath) (hall : ∀ v, v ∈ p.support)
    (hneighbors : ∀ v, v ∈ p.support →
      p.toSubgraph.neighborSet v = T.neighborSet v) :
    pathReversalAut p hp hall hneighbors x = y := by
  let e := spanningPathIso p hp hall hneighbors
  have hx : e (0 : Fin (p.length + 1)) = x := spanningPathIso_zero p hp hall hneighbors
  have hy : e (Fin.last p.length) = y := spanningPathIso_last p hp hall hneighbors
  change e ((pathGraphReverseIso (p.length + 1)) (e.symm x)) = y
  have hex : e.symm x = (0 : Fin (p.length + 1)) := by
    apply e.injective
    rw [e.apply_symm_apply]
    exact hx.symm
  rw [hex]
  have hrev : pathGraphReverseIso (p.length + 1) (0 : Fin (p.length + 1)) =
      Fin.last p.length := by
    apply Fin.ext
    simp [pathGraphReverseIso, Fin.rev]
  rw [hrev]
  exact hy

lemma complement_bijOn_of_maps_point {G : SimpleGraph V} {x y : V}
    (e : G ≃g G) (hxy : e x = y) :
    Set.BijOn e ({x} : Set V)ᶜ ({y} : Set V)ᶜ := by
  refine ⟨?_, e.injective.injOn, ?_⟩
  · intro v hv
    simp only [Set.mem_compl_iff, Set.mem_singleton_iff] at hv ⊢
    intro hev
    exact hv (e.injective (hev.trans hxy.symm))
  · intro w hw
    refine ⟨e.symm w, ?_, e.apply_symm_apply w⟩
    simp only [Set.mem_compl_iff, Set.mem_singleton_iff] at hw ⊢
    intro hew
    apply hw
    calc
      w = e (e.symm w) := (e.apply_symm_apply w).symm
      _ = e x := congrArg e hew
      _ = y := hxy

/-- Exact existence of an isomorphism between the two labelled induced deletions. -/
theorem exists_deletionIso_of_exactlyTwoLeaves {T : SimpleGraph V} {x y : V}
    (hT : T.IsTree) (hxy : x ≠ y)
    (hleaves : {v : V | IsLeaf T v} = ({x, y} : Set V)) :
    Nonempty (deletion T x ≃g deletion T y) := by
  obtain ⟨p, hp, hall, hneighbors⟩ :=
    exists_spanning_path_of_exactly_two_leaves hT hxy hleaves
  let e := pathReversalAut p hp hall hneighbors
  exact ⟨e.induce (complement_bijOn_of_maps_point e
    (pathReversalAut_start p hp hall hneighbors))⟩

section IsoInvariance

variable {W : Type*} [Fintype W] [DecidableEq W]

/-- A graph isomorphism transports independent finsets at every integer rank. -/
noncomputable def indepFinsetEquiv {G : SimpleGraph V} {H : SimpleGraph W}
    (e : G ≃g H) (k : Int) : IndepFinsetAt G k ≃ IndepFinsetAt H k where
  toFun S := by
    refine ⟨e.toEquiv.finsetCongr S.val, ?_, ?_⟩
    · rw [Equiv.finsetCongr_apply, Finset.coe_map]
      apply Set.Pairwise.image
      intro a ha b hb hab
      intro hadj
      exact S.prop.1 ha hb hab (e.map_rel_iff.mp hadj)
    · simpa using S.prop.2
  invFun S := by
    refine ⟨e.toEquiv.finsetCongr.symm S.val, ?_, ?_⟩
    · rw [Equiv.finsetCongr_symm, Equiv.finsetCongr_apply, Finset.coe_map]
      apply Set.Pairwise.image
      intro a ha b hb hab
      intro hadj
      exact S.prop.1 ha hb hab (e.symm.map_rel_iff.mp hadj)
    · simpa using S.prop.2
  left_inv S := by
    apply Subtype.ext
    exact e.toEquiv.finsetCongr.left_inv S.val
  right_inv S := by
    apply Subtype.ext
    exact e.toEquiv.finsetCongr.right_inv S.val

lemma iCoeff_eq_of_iso {G : SimpleGraph V} {H : SimpleGraph W}
    (e : G ≃g H) (k : Int) : iCoeff G k = iCoeff H k := by
  change (Fintype.card (IndepFinsetAt G k) : Int) =
    (Fintype.card (IndepFinsetAt H k) : Int)
  exact_mod_cast Fintype.card_congr (indepFinsetEquiv e k)

lemma delta_eq_of_iso {G : SimpleGraph V} {H : SimpleGraph W}
    (e : G ≃g H) (r : Int) : delta G r = delta H r := by
  simp only [delta]
  rw [iCoeff_eq_of_iso e (r + 1), iCoeff_eq_of_iso e r]

end IsoInvariance

/-- C4-F3-05: an exact two-leaf finite labelled tree has isomorphic endpoint
deletions, hence equal zero-extended coefficient sequences and adjacent differences
at every integer rank. The first conjunct records the honest `N = 2` boundary. -/
theorem two_leaf_deletion_iso_coeff_delta {T : SimpleGraph V} {x y : V}
    (hT : T.IsTree) (hxy : x ≠ y)
    (hleaves : {v : V | IsLeaf T v} = ({x, y} : Set V)) :
    Set.ncard {v : V | IsLeaf T v} = 2 ∧
    Nonempty (deletion T x ≃g deletion T y) ∧
    (∀ k : Int, iCoeff (deletion T x) k = iCoeff (deletion T y) k) ∧
    (∀ r : Int, delta (deletion T x) r = delta (deletion T y) r) := by
  classical
  obtain ⟨e⟩ := exists_deletionIso_of_exactlyTwoLeaves hT hxy hleaves
  refine ⟨?_, ⟨e⟩, ?_, ?_⟩
  · rw [hleaves]
    simp [hxy]
  · intro k
    exact iCoeff_eq_of_iso e k
  · intro r
    exact delta_eq_of_iso e r

end C4F305
