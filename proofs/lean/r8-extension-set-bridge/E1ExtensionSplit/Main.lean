import Mathlib
universe u v

namespace E1ExtensionSplit

/-- A labelled simple graph is an irreflexive symmetric relation on its vertex type. -/
structure LabeledSimpleGraph (alpha : Type u) where
  Adj : alpha -> alpha -> Prop
  adj_symm : forall {x y : alpha}, Adj x y -> Adj y x
  adj_irrefl : forall x : alpha, Not (Adj x x)

/-- An independent finite vertex set has no adjacent distinct vertices. -/
def Independent {alpha : Type u} (G : LabeledSimpleGraph alpha) (S : Finset alpha) : Prop :=
  forall {x : alpha}, x ∈ S -> forall {y : alpha}, y ∈ S -> x ≠ y -> Not (G.Adj x y)

/-- The labelled disjoint union, with exactly the inherited within-block edges. -/
def graphSum {alpha : Type u} {beta : Type v}
    (G : LabeledSimpleGraph alpha) (H : LabeledSimpleGraph beta) :
    LabeledSimpleGraph (Sum alpha beta) where
  Adj := fun x y =>
    match x, y with
    | Sum.inl a, Sum.inl b => G.Adj a b
    | Sum.inr a, Sum.inr b => H.Adj a b
    | _, _ => False
  adj_symm := by
    intro x y h
    cases x <;> cases y
    · exact G.adj_symm h
    · exact False.elim h
    · exact False.elim h
    · exact H.adj_symm h
  adj_irrefl := by
    intro x
    cases x with
    | inl a => exact G.adj_irrefl a
    | inr b => exact H.adj_irrefl b

/-- The left restriction of a subset of a `Sum` vertex type. -/
noncomputable def leftPullback {alpha : Type u} {beta : Type v} [Fintype alpha]
    (S : Finset (Sum alpha beta)) : Finset alpha :=
  by
    classical
    exact Finset.univ.filter (fun a => Sum.inl a ∈ S)

/-- The right restriction of a subset of a `Sum` vertex type. -/
noncomputable def rightPullback {alpha : Type u} {beta : Type v} [Fintype beta]
    (S : Finset (Sum alpha beta)) : Finset beta :=
  by
    classical
    exact Finset.univ.filter (fun b => Sum.inr b ∈ S)

/-- Vertices that extend an independent set by one vertex. -/
noncomputable def extensionSet {alpha : Type u} [Fintype alpha]
    (G : LabeledSimpleGraph alpha) (S : Finset alpha) : Finset alpha :=
  by
    classical
    exact Finset.univ.filter (fun x => x ∉ S ∧ Independent G (insert x S))

/-- The finite cardinality of the extension set. -/
noncomputable def extensionCount {alpha : Type u} [Fintype alpha]
    (G : LabeledSimpleGraph alpha) (S : Finset alpha) : Nat :=
  Fintype.card {x : alpha // x ∈ extensionSet G S}

@[simp] theorem mem_leftPullback {alpha : Type u} {beta : Type v} [Fintype alpha]
    (S : Finset (Sum alpha beta)) (a : alpha) :
    a ∈ leftPullback S ↔ Sum.inl a ∈ S := by
  simp [leftPullback]

@[simp] theorem mem_rightPullback {alpha : Type u} {beta : Type v} [Fintype beta]
    (S : Finset (Sum alpha beta)) (b : beta) :
    b ∈ rightPullback S ↔ Sum.inr b ∈ S := by
  simp [rightPullback]
lemma inl_extension_iff {alpha : Type u} {beta : Type v} [Fintype alpha] [Fintype beta]
    (G : LabeledSimpleGraph alpha) (H : LabeledSimpleGraph beta)
    (S : Finset (Sum alpha beta)) (hS : Independent (graphSum G H) S) (a : alpha) :
    Sum.inl a ∈ extensionSet (graphSum G H) S ↔
      a ∈ extensionSet G (leftPullback S) := by
  classical
  letI : DecidableEq alpha := Classical.decEq _
  letI : DecidableEq beta := Classical.decEq _
  letI : DecidableEq (Sum alpha beta) := Classical.decEq _
  simp only [extensionSet, Finset.mem_filter, Finset.mem_univ, true_and]
  constructor
  · rintro ⟨hna, hInd⟩
    refine ⟨?_, ?_⟩
    · intro ha
      exact hna ((mem_leftPullback S a).mp ha)
    · intro x hx y hy hxy hxyAdj
      have hx' : Sum.inl x ∈ insert (Sum.inl a) S := by
        rcases Finset.mem_insert.mp hx with rfl | hx
        · exact Finset.mem_insert.mpr (Or.inl rfl)
        · exact Finset.mem_insert.mpr (Or.inr ((mem_leftPullback S x).mp hx))
      have hy' : Sum.inl y ∈ insert (Sum.inl a) S := by
        rcases Finset.mem_insert.mp hy with rfl | hy
        · exact Finset.mem_insert.mpr (Or.inl rfl)
        · exact Finset.mem_insert.mpr (Or.inr ((mem_leftPullback S y).mp hy))
      exact hInd hx' hy' (fun h => hxy (Sum.inl.inj h)) hxyAdj
  · rintro ⟨hna, hInd⟩
    refine ⟨?_, ?_⟩
    · intro ha
      exact hna ((mem_leftPullback S a).mpr ha)
    · intro x hx y hy hxy hxyAdj
      cases x with
      | inl b =>
        cases y with
        | inl c =>
          apply hInd
          · rcases Finset.mem_insert.mp hx with h | h
            · exact Finset.mem_insert.mpr (Or.inl (Sum.inl.inj h))
            · exact Finset.mem_insert.mpr (Or.inr ((mem_leftPullback S b).mpr h))
          · rcases Finset.mem_insert.mp hy with h | h
            · exact Finset.mem_insert.mpr (Or.inl (Sum.inl.inj h))
            · exact Finset.mem_insert.mpr (Or.inr ((mem_leftPullback S c).mpr h))
          · intro h
            apply hxy
            exact congrArg Sum.inl h
          · exact hxyAdj
        | inr c => exact hxyAdj
      | inr b =>
        cases y with
        | inl c => exact hxyAdj
        | inr c =>
          apply hS
          · rcases Finset.mem_insert.mp hx with h | h
            · cases h
            · exact h
          · rcases Finset.mem_insert.mp hy with h | h
            · cases h
            · exact h
          · exact hxy
          · exact hxyAdj

lemma inr_extension_iff {alpha : Type u} {beta : Type v} [Fintype alpha] [Fintype beta]
    (G : LabeledSimpleGraph alpha) (H : LabeledSimpleGraph beta)
    (S : Finset (Sum alpha beta)) (hS : Independent (graphSum G H) S) (b : beta) :
    Sum.inr b ∈ extensionSet (graphSum G H) S ↔
      b ∈ extensionSet H (rightPullback S) := by
  classical
  letI : DecidableEq alpha := Classical.decEq _
  letI : DecidableEq beta := Classical.decEq _
  letI : DecidableEq (Sum alpha beta) := Classical.decEq _
  simp only [extensionSet, Finset.mem_filter, Finset.mem_univ, true_and]
  constructor
  · rintro ⟨hnb, hInd⟩
    refine ⟨?_, ?_⟩
    · intro hb
      exact hnb ((mem_rightPullback S b).mp hb)
    · intro x hx y hy hxy hxyAdj
      have hx' : Sum.inr x ∈ insert (Sum.inr b) S := by
        rcases Finset.mem_insert.mp hx with rfl | hx
        · exact Finset.mem_insert.mpr (Or.inl rfl)
        · exact Finset.mem_insert.mpr (Or.inr ((mem_rightPullback S x).mp hx))
      have hy' : Sum.inr y ∈ insert (Sum.inr b) S := by
        rcases Finset.mem_insert.mp hy with rfl | hy
        · exact Finset.mem_insert.mpr (Or.inl rfl)
        · exact Finset.mem_insert.mpr (Or.inr ((mem_rightPullback S y).mp hy))
      exact hInd hx' hy' (fun h => hxy (Sum.inr.inj h)) hxyAdj
  · rintro ⟨hnb, hInd⟩
    refine ⟨?_, ?_⟩
    · intro hb
      exact hnb ((mem_rightPullback S b).mpr hb)
    · intro x hx y hy hxy hxyAdj
      cases x with
      | inl a =>
        cases y with
        | inl c =>
          apply hS
          · rcases Finset.mem_insert.mp hx with h | h
            · cases h
            · exact h
          · rcases Finset.mem_insert.mp hy with h | h
            · cases h
            · exact h
          · exact hxy
          · exact hxyAdj
        | inr c => exact hxyAdj
      | inr a =>
        cases y with
        | inl c => exact hxyAdj
        | inr c =>
          apply hInd
          · rcases Finset.mem_insert.mp hx with h | h
            · exact Finset.mem_insert.mpr (Or.inl (Sum.inr.inj h))
            · exact Finset.mem_insert.mpr (Or.inr ((mem_rightPullback S a).mpr h))
          · rcases Finset.mem_insert.mp hy with h | h
            · exact Finset.mem_insert.mpr (Or.inl (Sum.inr.inj h))
            · exact Finset.mem_insert.mpr (Or.inr ((mem_rightPullback S c).mpr h))
          · intro h
            apply hxy
            exact congrArg Sum.inr h
          · exact hxyAdj
theorem extension_set_sum_bridge {alpha : Type u} {beta : Type v} [Fintype alpha] [Fintype beta]
    (G : LabeledSimpleGraph alpha) (H : LabeledSimpleGraph beta)
    (S : Finset (Sum alpha beta)) (hS : Independent (graphSum G H) S) :
    Exists (fun e :
      {x : Sum alpha beta // x ∈ extensionSet (graphSum G H) S} ≃
        Sum {a : alpha // a ∈ extensionSet G (leftPullback S)}
          {b : beta // b ∈ extensionSet H (rightPullback S)} =>
      extensionCount (graphSum G H) S =
        extensionCount G (leftPullback S) + extensionCount H (rightPullback S)) := by
  classical
  let e :
      {x : Sum alpha beta // x ∈ extensionSet (graphSum G H) S} ≃
        Sum {a : alpha // a ∈ extensionSet G (leftPullback S)}
          {b : beta // b ∈ extensionSet H (rightPullback S)} :=
    { toFun := fun x =>
        match x with
        | ⟨Sum.inl a, ha⟩ => Sum.inl ⟨a, (inl_extension_iff G H S hS a).mp ha⟩
        | ⟨Sum.inr b, hb⟩ => Sum.inr ⟨b, (inr_extension_iff G H S hS b).mp hb⟩
      invFun := fun x =>
        match x with
        | Sum.inl a => ⟨Sum.inl a.1, (inl_extension_iff G H S hS a.1).mpr a.2⟩
        | Sum.inr b => ⟨Sum.inr b.1, (inr_extension_iff G H S hS b.1).mpr b.2⟩
      left_inv := by
        rintro ⟨x, hx⟩
        cases x <;> rfl
      right_inv := by
        intro x
        cases x <;> rfl }
  refine Exists.intro e ?_
  exact (Fintype.card_congr e).trans Fintype.card_sum

end E1ExtensionSplit
