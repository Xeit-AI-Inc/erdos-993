import Mathlib.Algebra.Polynomial.Coeff
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Combinatorics.SimpleGraph.Sum
import Mathlib.Data.Finset.Sum

/-!
# Exact rooted-tree attachment transition through degree five

The graph operation below is the disjoint labelled union on `α ⊕ β`, followed
by the single edge joining the two named roots.  Every polynomial in the final
theorems is defined as a sum over actual finite independent sets.
-/

open scoped BigOperators Polynomial

namespace C4U1Attachment

open Finset Polynomial SimpleGraph

universe u v

/-- A finite labelled rooted tree. -/
structure RootedTree (α : Type u) [Fintype α] where
  graph : SimpleGraph α
  root : α
  isTree : graph.IsTree

/-- Disjoint labelled union followed by exactly the edge between the roots. -/
def attachGraph {α : Type u} {β : Type v} (G : SimpleGraph α) (H : SimpleGraph β)
    (r : α) (s : β) : SimpleGraph (α ⊕ β) :=
  G.sum H ⊔ SimpleGraph.edge (.inl r) (.inr s)

@[simp] theorem attachGraph_adj_inl_inl {α : Type u} {β : Type v}
    (G : SimpleGraph α) (H : SimpleGraph β) (r : α) (s : β) (a a' : α) :
    (attachGraph G H r s).Adj (.inl a) (.inl a') ↔ G.Adj a a' := by
  simp [attachGraph, SimpleGraph.edge]

@[simp] theorem attachGraph_adj_inr_inr {α : Type u} {β : Type v}
    (G : SimpleGraph α) (H : SimpleGraph β) (r : α) (s : β) (b b' : β) :
    (attachGraph G H r s).Adj (.inr b) (.inr b') ↔ H.Adj b b' := by
  simp [attachGraph, SimpleGraph.edge]

@[simp] theorem attachGraph_adj_inl_inr {α : Type u} {β : Type v}
    (G : SimpleGraph α) (H : SimpleGraph β) (r : α) (s : β) (a : α) (b : β) :
    (attachGraph G H r s).Adj (.inl a) (.inr b) ↔ a = r ∧ b = s := by
  simp [attachGraph, SimpleGraph.edge]

@[simp] theorem attachGraph_adj_inr_inl {α : Type u} {β : Type v}
    (G : SimpleGraph α) (H : SimpleGraph β) (r : α) (s : β) (b : β) (a : α) :
    (attachGraph G H r s).Adj (.inr b) (.inl a) ↔ b = s ∧ a = r := by
  simp [attachGraph, SimpleGraph.edge, and_comm]

/-- Genuine finite independent sets of a graph. -/
def IndepSets {α : Type u} (G : SimpleGraph α) :=
  {S : Finset α // G.IsIndepSet (S : Set α)}

/-- Independent sets which exclude the named root. -/
def ExcludedSets {α : Type u} (G : SimpleGraph α) (r : α) :=
  {S : IndepSets G // r ∉ S.1}

/-- Independent sets which include the named root. -/
def IncludedSets {α : Type u} (G : SimpleGraph α) (r : α) :=
  {S : IndepSets G // r ∈ S.1}

noncomputable instance instFintypeIndepSets {α : Type u} [Fintype α]
    (G : SimpleGraph α) : Fintype (IndepSets G) := by
  classical
  exact Fintype.ofInjective (fun S : IndepSets G ↦ S.1) Subtype.val_injective

noncomputable instance instFintypeExcludedSets {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) : Fintype (ExcludedSets G r) := by
  classical
  exact Fintype.ofInjective (fun S : ExcludedSets G r ↦ S.1) Subtype.val_injective

noncomputable instance instFintypeIncludedSets {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) : Fintype (IncludedSets G r) := by
  classical
  exact Fintype.ofInjective (fun S : IncludedSets G r ↦ S.1) Subtype.val_injective

/-- Independence in the attachment is componentwise independence together
with exclusion of the unique newly adjacent pair of roots. -/
theorem attachGraph_isIndepSet_iff {α : Type u} {β : Type v}
    (G : SimpleGraph α) (H : SimpleGraph β) (r : α) (s : β)
    (S : Finset (α ⊕ β)) :
    (attachGraph G H r s).IsIndepSet (S : Set (α ⊕ β)) ↔
      G.IsIndepSet (S.toLeft : Set α) ∧
      H.IsIndepSet (S.toRight : Set β) ∧
      (r ∉ S.toLeft ∨ s ∉ S.toRight) := by
  constructor
  · intro hS
    refine ⟨?_, ?_, ?_⟩
    · intro a ha a' ha' hne hadj
      exact hS (by simpa using ha) (by simpa using ha')
        (fun heq ↦ hne (Sum.inl.inj heq)) (by simpa using hadj)
    · intro b hb b' hb' hne hadj
      exact hS (by simpa using hb) (by simpa using hb')
        (fun heq ↦ hne (Sum.inr.inj heq)) (by simpa using hadj)
    · by_contra hroots
      simp only [not_or, not_not] at hroots
      exact hS (by simpa using hroots.1) (by simpa using hroots.2)
        (by simp) (by simp)
  · rintro ⟨hG, hH, hroots⟩
    rintro (a | b) ha (a' | b') ha' hne hadj
    · exact hG (by simpa using ha) (by simpa using ha')
        (fun heq ↦ hne (congrArg Sum.inl heq)) (by simpa using hadj)
    · have hrs : a = r ∧ b' = s := by simpa using hadj
      rcases hrs with ⟨rfl, rfl⟩
      exact hroots.elim (fun hr ↦ hr (by simpa using ha))
        (fun hs ↦ hs (by simpa using ha'))
    · have hrs : b = s ∧ a' = r := by simpa using hadj
      rcases hrs with ⟨rfl, rfl⟩
      exact hroots.elim (fun hr ↦ hr (by simpa using ha'))
        (fun hs ↦ hs (by simpa using ha))
    · exact hH (by simpa using ha) (by simpa using ha')
        (fun heq ↦ hne (congrArg Sum.inr heq)) (by simpa using hadj)

/-- Root-out independent sets of the attachment are exactly a root-out set on
the first tree and an arbitrary independent set on the second tree. -/
noncomputable def attachExcludedEquiv {α : Type u} {β : Type v}
    (G : SimpleGraph α) (H : SimpleGraph β) (r : α) (s : β) :
    ExcludedSets (attachGraph G H r s) (.inl r) ≃
      ExcludedSets G r × IndepSets H where
  toFun S :=
    let h := (attachGraph_isIndepSet_iff G H r s S.1.1).mp S.1.2
    (⟨⟨S.1.1.toLeft, h.1⟩, by simpa using S.2⟩,
      ⟨S.1.1.toRight, h.2.1⟩)
  invFun P :=
    ⟨⟨P.1.1.1.disjSum P.2.1,
        (attachGraph_isIndepSet_iff G H r s _).mpr
          (by simpa using
            (⟨P.1.1.2, P.2.2, Or.inl P.1.2⟩ :
              G.IsIndepSet (P.1.1.1 : Set α) ∧
              H.IsIndepSet (P.2.1 : Set β) ∧
              (r ∉ P.1.1.1 ∨ s ∉ P.2.1)))⟩,
      by simpa using P.1.2⟩
  left_inv S := by
    apply Subtype.ext
    apply Subtype.ext
    exact Finset.toLeft_disjSum_toRight
  right_inv P := by
    apply Prod.ext
    · apply Subtype.ext
      apply Subtype.ext
      simp
    · apply Subtype.ext
      simp

/-- Root-in independent sets of the attachment are exactly a root-in set on
the first tree and a root-out set on the second tree. -/
noncomputable def attachIncludedEquiv {α : Type u} {β : Type v}
    (G : SimpleGraph α) (H : SimpleGraph β) (r : α) (s : β) :
    IncludedSets (attachGraph G H r s) (.inl r) ≃
      IncludedSets G r × ExcludedSets H s where
  toFun S :=
    let h := (attachGraph_isIndepSet_iff G H r s S.1.1).mp S.1.2
    (⟨⟨S.1.1.toLeft, h.1⟩, by simpa using S.2⟩,
      ⟨⟨S.1.1.toRight, h.2.1⟩,
        h.2.2.resolve_left (not_not.mpr (by simpa using S.2))⟩)
  invFun P :=
    ⟨⟨P.1.1.1.disjSum P.2.1.1,
        (attachGraph_isIndepSet_iff G H r s _).mpr
          (by simpa using
            (⟨P.1.1.2, P.2.1.2, Or.inr P.2.2⟩ :
              G.IsIndepSet (P.1.1.1 : Set α) ∧
              H.IsIndepSet (P.2.1.1 : Set β) ∧
              (r ∉ P.1.1.1 ∨ s ∉ P.2.1.1)))⟩,
      by simpa using P.1.2⟩
  left_inv S := by
    apply Subtype.ext
    apply Subtype.ext
    exact Finset.toLeft_disjSum_toRight
  right_inv P := by
    apply Prod.ext
    · apply Subtype.ext
      apply Subtype.ext
      simp
    · apply Subtype.ext
      apply Subtype.ext
      simp

/-- Every independent set lies in exactly one of the root-out and root-in
parts. -/
noncomputable def rootPartitionEquiv {α : Type u} (G : SimpleGraph α) (r : α) :
    IndepSets G ≃ ExcludedSets G r ⊕ IncludedSets G r := by
  classical
  exact
    { toFun := fun S ↦ if hr : r ∈ S.1 then .inr ⟨S, hr⟩ else .inl ⟨S, hr⟩
      invFun := fun
        | .inl S => S.1
        | .inr S => S.1
      left_inv := fun S ↦ by
        by_cases hr : r ∈ S.1 <;> simp [hr]
      right_inv := fun S ↦ by
        rcases S with S | S
        · simp [S.2]
        · simp [S.2] }

/-- The ordinary generating polynomial of a finite weighted type. -/
noncomputable def weightPolynomial {ι : Type*} [Fintype ι] (weight : ι → ℕ) : ℕ[X] :=
  ∑ x, X ^ weight x

theorem weightPolynomial_equiv {ι κ : Type*} [Fintype ι] [Fintype κ]
    (e : ι ≃ κ) (wi : ι → ℕ) (wk : κ → ℕ)
    (hweight : ∀ x, wi x = wk (e x)) :
    weightPolynomial wi = weightPolynomial wk := by
  classical
  unfold weightPolynomial
  exact Fintype.sum_equiv e _ _ fun x ↦ by rw [hweight x]

theorem weightPolynomial_prod {ι κ : Type*} [Fintype ι] [Fintype κ]
    (wi : ι → ℕ) (wk : κ → ℕ) :
    weightPolynomial (fun x : ι × κ ↦ wi x.1 + wk x.2) =
      weightPolynomial wi * weightPolynomial wk := by
  classical
  unfold weightPolynomial
  calc
    (∑ x : ι × κ, X ^ (wi x.1 + wk x.2)) =
        ∑ i : ι, ∑ k : κ, X ^ (wi i + wk k) := Fintype.sum_prod_type _
    _ = ∑ i : ι, ∑ k : κ, X ^ wi i * X ^ wk k := by simp_rw [pow_add]
    _ = (∑ i : ι, X ^ wi i) * ∑ k : κ, X ^ wk k := by
      rw [Finset.sum_mul]
      congr 1
      funext i
      rw [Finset.mul_sum]

theorem weightPolynomial_sum {ι κ : Type*} [Fintype ι] [Fintype κ]
    (wi : ι → ℕ) (wk : κ → ℕ) :
    weightPolynomial (Sum.elim wi wk) = weightPolynomial wi + weightPolynomial wk := by
  classical
  simp [weightPolynomial]

/-- The independent-set polynomial restricted to sets excluding the root. -/
noncomputable def excludedPolynomial {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) : ℕ[X] :=
  weightPolynomial fun S : ExcludedSets G r ↦ S.1.1.card

/-- The independent-set polynomial restricted to sets including the root. -/
noncomputable def includedPolynomial {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) : ℕ[X] :=
  weightPolynomial fun S : IncludedSets G r ↦ S.1.1.card

/-- The independent-set polynomial with no root restriction. -/
noncomputable def independencePolynomial {α : Type u} [Fintype α]
    (G : SimpleGraph α) : ℕ[X] :=
  weightPolynomial fun S : IndepSets G ↦ S.1.card

theorem independencePolynomial_root_partition {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) :
    independencePolynomial G = excludedPolynomial G r + includedPolynomial G r := by
  classical
  calc
    independencePolynomial G =
        weightPolynomial (Sum.elim
          (fun S : ExcludedSets G r ↦ S.1.1.card)
          (fun S : IncludedSets G r ↦ S.1.1.card)) :=
      weightPolynomial_equiv (rootPartitionEquiv G r)
        (fun S : IndepSets G ↦ S.1.card)
        (Sum.elim
          (fun S : ExcludedSets G r ↦ S.1.1.card)
          (fun S : IncludedSets G r ↦ S.1.1.card)) (by
            intro S
            classical
            by_cases hr : r ∈ S.1 <;> simp [rootPartitionEquiv, hr])
    _ = excludedPolynomial G r + includedPolynomial G r := by
      simpa [excludedPolynomial, includedPolynomial] using
        weightPolynomial_sum
          (fun S : ExcludedSets G r ↦ S.1.1.card)
          (fun S : IncludedSets G r ↦ S.1.1.card)

/-- Exact, untruncated root-out transition, proved via
`attachExcludedEquiv`. -/
theorem excludedPolynomial_attach {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (G : SimpleGraph α) (H : SimpleGraph β)
    (r : α) (s : β) :
    excludedPolynomial (attachGraph G H r s) (.inl r) =
      excludedPolynomial G r *
        (excludedPolynomial H s + includedPolynomial H s) := by
  classical
  calc
    excludedPolynomial (attachGraph G H r s) (.inl r) =
        weightPolynomial (fun P : ExcludedSets G r × IndepSets H ↦
          P.1.1.1.card + P.2.1.card) :=
      weightPolynomial_equiv (attachExcludedEquiv G H r s)
        (fun S : ExcludedSets (attachGraph G H r s) (.inl r) ↦ S.1.1.card)
        (fun P : ExcludedSets G r × IndepSets H ↦ P.1.1.1.card + P.2.1.card)
        (fun S ↦ by
          change S.1.1.card = S.1.1.toLeft.card + S.1.1.toRight.card
          exact Finset.card_toLeft_add_card_toRight.symm)
    _ = excludedPolynomial G r * independencePolynomial H := by
      simpa [excludedPolynomial, independencePolynomial] using
        weightPolynomial_prod
          (fun S : ExcludedSets G r ↦ S.1.1.card)
          (fun S : IndepSets H ↦ S.1.card)
    _ = excludedPolynomial G r *
        (excludedPolynomial H s + includedPolynomial H s) := by
      rw [independencePolynomial_root_partition]

/-- Exact, untruncated root-in transition, proved via
`attachIncludedEquiv`. -/
theorem includedPolynomial_attach {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (G : SimpleGraph α) (H : SimpleGraph β)
    (r : α) (s : β) :
    includedPolynomial (attachGraph G H r s) (.inl r) =
      includedPolynomial G r * excludedPolynomial H s := by
  classical
  calc
    includedPolynomial (attachGraph G H r s) (.inl r) =
        weightPolynomial (fun P : IncludedSets G r × ExcludedSets H s ↦
          P.1.1.1.card + P.2.1.1.card) :=
      weightPolynomial_equiv (attachIncludedEquiv G H r s)
        (fun S : IncludedSets (attachGraph G H r s) (.inl r) ↦ S.1.1.card)
        (fun P : IncludedSets G r × ExcludedSets H s ↦
          P.1.1.1.card + P.2.1.1.card)
        (fun S ↦ by
          change S.1.1.card = S.1.1.toLeft.card + S.1.1.toRight.card
          exact Finset.card_toLeft_add_card_toRight.symm)
    _ = includedPolynomial G r * excludedPolynomial H s := by
      simpa [includedPolynomial, excludedPolynomial] using
        weightPolynomial_prod
          (fun S : IncludedSets G r ↦ S.1.1.card)
          (fun S : ExcludedSets H s ↦ S.1.1.card)

/-- Coefficients of `weightPolynomial` are cardinalities of the actual
weight fibers. -/
theorem coeff_weightPolynomial {ι : Type*} [Fintype ι]
    (weight : ι → ℕ) (k : ℕ) :
    (weightPolynomial weight).coeff k = Fintype.card {x : ι // weight x = k} := by
  classical
  rw [Fintype.card_subtype, Finset.card_filter]
  simp [weightPolynomial, Polynomial.coeff_X_pow, eq_comm]

/-- Keep exactly the coefficients in degrees zero through five. -/
noncomputable def trunc5 (p : ℕ[X]) : ℕ[X] :=
  ∑ k ∈ Finset.range 6, monomial k (p.coeff k)

theorem coeff_trunc5 (p : ℕ[X]) (k : ℕ) :
    (trunc5 p).coeff k = if k ≤ 5 then p.coeff k else 0 := by
  classical
  by_cases hk : k ≤ 5
  · simp [trunc5, coeff_monomial, hk, Nat.lt_succ_iff.mpr hk]
  · simp [trunc5, coeff_monomial, hk]
    omega

theorem trunc5_add (p q : ℕ[X]) :
    trunc5 (p + q) = trunc5 p + trunc5 q := by
  ext k
  by_cases hk : k ≤ 5 <;> simp [coeff_trunc5, hk, coeff_add]

/-- Low coefficients of a product depend only on low coefficients of its
factors. -/
theorem trunc5_mul (p q : ℕ[X]) :
    trunc5 (trunc5 p * trunc5 q) = trunc5 (p * q) := by
  ext k
  by_cases hk : k ≤ 5
  · rw [coeff_trunc5, if_pos hk, coeff_trunc5, if_pos hk]
    simp only [coeff_mul]
    apply Finset.sum_congr rfl
    intro ab hab
    have habsum : ab.1 + ab.2 = k := Finset.mem_antidiagonal.mp hab
    have ha : ab.1 ≤ 5 := by omega
    have hb : ab.2 ≤ 5 := by omega
    rw [coeff_trunc5, if_pos ha, coeff_trunc5, if_pos hb]
  · rw [coeff_trunc5, if_neg hk, coeff_trunc5, if_neg hk]

noncomputable def excludedPolynomial5 {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) : ℕ[X] :=
  trunc5 (excludedPolynomial G r)

noncomputable def includedPolynomial5 {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) : ℕ[X] :=
  trunc5 (includedPolynomial G r)

/-- Frozen root-out transition in the degree-five truncated polynomial
system. -/
theorem excludedPolynomial5_attach {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (G : SimpleGraph α) (H : SimpleGraph β)
    (r : α) (s : β) :
    excludedPolynomial5 (attachGraph G H r s) (.inl r) =
      trunc5 (excludedPolynomial5 G r *
        (excludedPolynomial5 H s + includedPolynomial5 H s)) := by
  classical
  unfold excludedPolynomial5 includedPolynomial5
  calc
    trunc5 (excludedPolynomial (attachGraph G H r s) (.inl r)) =
        trunc5 (excludedPolynomial G r *
          (excludedPolynomial H s + includedPolynomial H s)) :=
      congrArg trunc5 (excludedPolynomial_attach G H r s)
    _ = trunc5 (trunc5 (excludedPolynomial G r) *
          trunc5 (excludedPolynomial H s + includedPolynomial H s)) :=
      (trunc5_mul _ _).symm
    _ = trunc5 (trunc5 (excludedPolynomial G r) *
          (trunc5 (excludedPolynomial H s) + trunc5 (includedPolynomial H s))) := by
      rw [trunc5_add]

/-- Frozen root-in transition in the degree-five truncated polynomial
system. -/
theorem includedPolynomial5_attach {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (G : SimpleGraph α) (H : SimpleGraph β)
    (r : α) (s : β) :
    includedPolynomial5 (attachGraph G H r s) (.inl r) =
      trunc5 (includedPolynomial5 G r * excludedPolynomial5 H s) := by
  classical
  unfold excludedPolynomial5 includedPolynomial5
  calc
    trunc5 (includedPolynomial (attachGraph G H r s) (.inl r)) =
        trunc5 (includedPolynomial G r * excludedPolynomial H s) :=
      congrArg trunc5 (includedPolynomial_attach G H r s)
    _ = trunc5 (trunc5 (includedPolynomial G r) *
          trunc5 (excludedPolynomial H s)) := (trunc5_mul _ _).symm

noncomputable def excludedCoeff {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) (k : ℕ) : ℕ :=
  (excludedPolynomial5 G r).coeff k

noncomputable def includedCoeff {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) (k : ℕ) : ℕ :=
  (includedPolynomial5 G r).coeff k

theorem excludedCoeff_eq_card {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) (k : ℕ) (hk : k ≤ 5) :
    excludedCoeff G r k =
      Fintype.card {S : ExcludedSets G r // S.1.1.1.card = k} := by
  rw [excludedCoeff, excludedPolynomial5, coeff_trunc5, if_pos hk]
  exact coeff_weightPolynomial _ _

theorem includedCoeff_eq_card {α : Type u} [Fintype α]
    (G : SimpleGraph α) (r : α) (k : ℕ) (hk : k ≤ 5) :
    includedCoeff G r k =
      Fintype.card {S : IncludedSets G r // S.1.1.1.card = k} := by
  rw [includedCoeff, includedPolynomial5, coeff_trunc5, if_pos hk]
  exact coeff_weightPolynomial _ _

/-- Requested root-out coefficient convolution for every `0 ≤ k ≤ 5`.
The lower bound is automatic for natural-number degrees. -/
theorem excludedCoeff_attach {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (G : SimpleGraph α) (H : SimpleGraph β)
    (r : α) (s : β) (k : ℕ) (hk : k ≤ 5) :
    excludedCoeff (attachGraph G H r s) (.inl r) k =
      ∑ ab ∈ Finset.antidiagonal k,
        excludedCoeff G r ab.1 *
          (excludedCoeff H s ab.2 + includedCoeff H s ab.2) := by
  rw [excludedCoeff, excludedPolynomial5_attach, coeff_trunc5, if_pos hk,
    coeff_mul]
  simp only [coeff_add]
  rfl

/-- Requested root-in coefficient convolution for every `0 ≤ k ≤ 5`. -/
theorem includedCoeff_attach {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (G : SimpleGraph α) (H : SimpleGraph β)
    (r : α) (s : β) (k : ℕ) (hk : k ≤ 5) :
    includedCoeff (attachGraph G H r s) (.inl r) k =
      ∑ ab ∈ Finset.antidiagonal k,
        includedCoeff G r ab.1 * excludedCoeff H s ab.2 := by
  rw [includedCoeff, includedPolynomial5_attach, coeff_trunc5, if_pos hk,
    coeff_mul]
  rfl

/-- The explicit attachment of two finite rooted trees is again a tree. -/
theorem attachGraph_isTree {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (G : SimpleGraph α) (H : SimpleGraph β)
    (r : α) (s : β) (hG : G.IsTree) (hH : H.IsTree) :
    (attachGraph G H r s).IsTree := by
  classical
  rw [SimpleGraph.isTree_iff_connected_and_card]
  refine ⟨hG.connected.sum_sup_edge hH.connected, ?_⟩
  have hnew : ¬(G.sum H).Adj (Sum.inl r) (Sum.inr s) := by simp
  have hedge := (G.sum H).card_edgeFinset_sup_edge hnew (by simp)
  have hsum : Nat.card (G.sum H).edgeSet =
      Nat.card G.edgeSet + Nat.card H.edgeSet := by
    rw [Nat.card_congr SimpleGraph.edgeSetSumEquiv, Nat.card_sum]
  rw [attachGraph, Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card,
    hedge, SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card, hsum,
    Nat.card_sum]
  have hgcard : Nat.card G.edgeSet + 1 = Nat.card α := by
    simpa [SimpleGraph.edgeFinset_card, Nat.card_eq_fintype_card] using hG.card_edgeFinset
  have hhcard : Nat.card H.edgeSet + 1 = Nat.card β := by
    simpa [SimpleGraph.edgeFinset_card, Nat.card_eq_fintype_card] using hH.card_edgeFinset
  omega

/-- The attached rooted tree, retaining the first root. -/
noncomputable def RootedTree.attach {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (T : RootedTree α) (U : RootedTree β) :
    RootedTree (α ⊕ β) where
  graph := attachGraph T.graph U.graph T.root U.root
  root := .inl T.root
  isTree := attachGraph_isTree T.graph U.graph T.root U.root T.isTree U.isTree

/-- Contract-level theorem for arbitrary finite labelled rooted trees. -/
theorem rootedTree_attachment_transition {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (T : RootedTree α) (U : RootedTree β) :
    excludedPolynomial5 (T.attach U).graph (T.attach U).root =
        trunc5 (excludedPolynomial5 T.graph T.root *
          (excludedPolynomial5 U.graph U.root + includedPolynomial5 U.graph U.root)) ∧
      includedPolynomial5 (T.attach U).graph (T.attach U).root =
        trunc5 (includedPolynomial5 T.graph T.root * excludedPolynomial5 U.graph U.root) := by
  exact ⟨excludedPolynomial5_attach T.graph U.graph T.root U.root,
    includedPolynomial5_attach T.graph U.graph T.root U.root⟩

/-- The equivalent pair of coefficient convolutions at every degree through
five, stated directly for the attached rooted tree. -/
theorem rootedTree_attachment_coefficients {α : Type u} {β : Type v}
    [Fintype α] [Fintype β] (T : RootedTree α) (U : RootedTree β)
    (k : ℕ) (hk : k ≤ 5) :
    excludedCoeff (T.attach U).graph (T.attach U).root k =
        ∑ ab ∈ Finset.antidiagonal k,
          excludedCoeff T.graph T.root ab.1 *
            (excludedCoeff U.graph U.root ab.2 + includedCoeff U.graph U.root ab.2) ∧
      includedCoeff (T.attach U).graph (T.attach U).root k =
        ∑ ab ∈ Finset.antidiagonal k,
          includedCoeff T.graph T.root ab.1 * excludedCoeff U.graph U.root ab.2 := by
  exact ⟨excludedCoeff_attach T.graph U.graph T.root U.root k hk,
    includedCoeff_attach T.graph U.graph T.root U.root k hk⟩

end C4U1Attachment
