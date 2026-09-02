import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Clique

/-!
# Cycle 12 fresh-root sector theorem

This file formalizes the graph-level Stage 7 nominee.  A finite family of
finite rooted labelled trees is attached to one new root on the tagged sigma
vertex type.  The sector profiles below are defined from actual independent
sets and actual extension counts of those graphs.
-/

namespace Erdos993.C12.FreshRootSectors

open scoped BigOperators

abbrev Profile := Polynomial (Polynomial Int)

noncomputable def xVar : Profile := Polynomial.X

noncomputable def yVar : Profile := Polynomial.C Polynomial.X

/-- A rooted labelled simple graph. -/
structure RootedGraph (V : Type*) where
  graph : SimpleGraph V
  root : V

/-- A finite rooted labelled tree, represented by its actual simple graph. -/
structure RootedTree (V : Type*) extends RootedGraph V where
  isTree : graph.IsTree

section GraphConstruction

variable {I : Type*} [Fintype I] [DecidableEq I]
variable {V : I -> Type*} [forall i, Fintype (V i)] [forall i, DecidableEq (V i)]

abbrev AttachVertex (V : I -> Type*) := Unit ⊕ Sigma V

def freshRoot : AttachVertex V := Sum.inl ()

def branchVertex (i : I) (v : V i) : AttachVertex V := Sum.inr ⟨i, v⟩

/-- Adjacency inside the tagged disjoint union of the branch graphs. -/
def branchAdj (R : forall i, RootedTree (V i)) : Sigma V -> Sigma V -> Prop
  | ⟨i, u⟩, ⟨j, v⟩ => ∃ h : i = j, (R i).graph.Adj u (h ▸ v)

lemma branchAdj_symm (R : forall i, RootedTree (V i)) :
    Symmetric (branchAdj R) := by
  rintro ⟨i, u⟩ ⟨j, v⟩ ⟨h, huv⟩
  subst j
  exact ⟨rfl, (R i).graph.adj_symm huv⟩

lemma branchAdj_irrefl (R : forall i, RootedTree (V i)) :
    Irreflexive (branchAdj R) := by
  rintro ⟨i, u⟩ ⟨h, huu⟩
  simpa using huu

/--
The literal fresh-root attachment graph.  Its vertices are one new root and
the tagged disjoint union of all branch vertices.  The only new edges join the
fresh root to each branch root.
-/
def attachGraph (R : forall i, RootedTree (V i)) : SimpleGraph (AttachVertex V) where
  Adj
    | Sum.inl _, Sum.inl _ => False
    | Sum.inl _, Sum.inr ⟨i, v⟩ => v = (R i).root
    | Sum.inr ⟨i, u⟩, Sum.inl _ => u = (R i).root
    | Sum.inr u, Sum.inr v => branchAdj R u v
  symm := ⟨by
    rintro (u | ⟨i, u⟩) (v | ⟨j, v⟩) h
    · exact h
    · exact h
    · exact h
    · exact branchAdj_symm R h⟩
  loopless := ⟨by
    rintro (u | ⟨i, u⟩) h
    · exact h
    · change branchAdj R ⟨i, u⟩ ⟨i, u⟩ at h
      exact branchAdj_irrefl R ⟨i, u⟩ h⟩

def attachRootedGraph (R : forall i, RootedTree (V i)) : RootedGraph (AttachVertex V) where
  graph := attachGraph R
  root := freshRoot

@[simp] lemma attachGraph_adj_fresh_fresh (R : forall i, RootedTree (V i)) :
    ¬(attachGraph R).Adj (freshRoot (V := V)) (freshRoot (V := V)) := by
  simp [attachGraph, freshRoot]

@[simp] lemma attachGraph_adj_fresh_branch (R : forall i, RootedTree (V i))
    (i : I) (v : V i) :
    (attachGraph R).Adj (freshRoot (V := V)) (branchVertex (V := V) i v) ↔
      v = (R i).root := by
  rfl

@[simp] lemma attachGraph_adj_branch_fresh (R : forall i, RootedTree (V i))
    (i : I) (v : V i) :
    (attachGraph R).Adj (branchVertex (V := V) i v) (freshRoot (V := V)) ↔
      v = (R i).root := by
  rfl

@[simp] lemma attachGraph_adj_branch_branch_same (R : forall i, RootedTree (V i))
    (i : I) (u v : V i) :
    (attachGraph R).Adj (branchVertex (V := V) i u) (branchVertex (V := V) i v) ↔
      (R i).graph.Adj u v := by
  constructor
  · rintro ⟨h, huv⟩
    simpa using huv
  · exact fun huv => ⟨rfl, huv⟩

lemma attachGraph_adj_branch_branch (R : forall i, RootedTree (V i))
    (i j : I) (u : V i) (v : V j) :
    (attachGraph R).Adj (branchVertex (V := V) i u) (branchVertex (V := V) j v) ↔
      ∃ h : i = j, (R i).graph.Adj u (h ▸ v) := by
  rfl

end GraphConstruction

section Subsets

variable {A : Type*} [Fintype A] [DecidableEq A]

/-- Boolean characteristic functions are a definitionally finite subset encoding. -/
abbrev BoolSubset (A : Type*) := A -> Bool

def BoolSubset.toFinset (S : BoolSubset A) : Finset A :=
  Finset.univ.filter fun v => S v = true

def BoolSubset.ofFinset (S : Finset A) : BoolSubset A :=
  fun v => decide (v ∈ S)

@[simp] lemma BoolSubset.mem_toFinset (S : BoolSubset A) (v : A) :
    v ∈ S.toFinset ↔ S v = true := by
  simp [BoolSubset.toFinset]

@[simp] lemma BoolSubset.ofFinset_apply (S : Finset A) (v : A) :
    BoolSubset.ofFinset S v = true ↔ v ∈ S := by
  simp [BoolSubset.ofFinset]

def boolSubsetEquivFinset : BoolSubset A ≃ Finset A where
  toFun := BoolSubset.toFinset
  invFun := BoolSubset.ofFinset
  left_inv S := by
    funext v
    cases h : S v <;> simp [BoolSubset.toFinset, BoolSubset.ofFinset, h]
  right_inv S := by
    ext v
    simp

def boolCount (b : Bool) : Nat := if b then 1 else 0

def selectedCount (S : BoolSubset A) : Nat := ∑ v, boolCount (S v)

lemma selectedCount_eq_card (S : BoolSubset A) : selectedCount S = S.toFinset.card := by
  classical
  unfold selectedCount boolCount BoolSubset.toFinset
  change (∑ v : A, if S v = true then 1 else 0) = _
  simp only [Finset.sum_boole]
  rfl

variable (G : SimpleGraph A)

/-- Actual graph independence of the finite subset represented by `S`. -/
def Independent (S : BoolSubset A) : Prop :=
  G.IsIndepSet (S.toFinset : Set A)

/-- Exact insert-based extension predicate from the frozen theorem interface. -/
def Extendable (S : BoolSubset A) (v : A) : Prop :=
  v ∉ S.toFinset ∧ G.IsIndepSet ((insert v S.toFinset : Finset A) : Set A)

noncomputable def extensionSet (S : BoolSubset A) : Finset A :=
  by
    classical
    exact Finset.univ.filter fun v => Extendable G S v

noncomputable def extCount (S : BoolSubset A) : Nat :=
  by
    classical
    exact ∑ v, if Extendable G S v then 1 else 0

@[simp] lemma mem_extensionSet (S : BoolSubset A) (v : A) :
    v ∈ extensionSet (G := G) S ↔ Extendable G S v := by
  classical
  simp [extensionSet]

lemma extCount_eq_card (S : BoolSubset A) :
    extCount (G := G) S = (extensionSet (G := G) S).card := by
  classical
  unfold extCount extensionSet
  simp only [Finset.sum_boole]
  rfl

lemma extendable_not_selected {S : BoolSubset A} {v : A}
    (h : Extendable G S v) : S v = false := by
  have : ¬S v = true := by
    simpa using h.1
  exact Bool.eq_false_iff.mpr this

lemma extendable_iff_not_selected_no_adj (S : BoolSubset A) (v : A)
    (hS : Independent G S) :
    Extendable G S v ↔
      S v = false ∧ ∀ u, S u = true → ¬G.Adj v u := by
  constructor
  · rintro ⟨hv, hins⟩
    refine ⟨by simpa using hv, ?_⟩
    intro u hu hadj
    have hv_mem : v ∈ (insert v S.toFinset : Finset A) := by simp
    have hu_mem : u ∈ (insert v S.toFinset : Finset A) := by simp [hu]
    exact hins hv_mem hu_mem (G.ne_of_adj hadj) hadj
  · rintro ⟨hv, hno⟩
    refine ⟨by simpa [hv], ?_⟩
    intro u hu w hw hne huw
    simp only [Finset.coe_insert, Set.mem_insert_iff] at hu hw
    rcases hu with rfl | hu <;> rcases hw with rfl | hw
    · exact (hne rfl).elim
    · exact hno w (by simpa using hw) huw
    · exact hno u (by simpa using hu) (G.adj_symm huw)
    · exact hS (by simpa using hu) (by simpa using hw) hne huw

end Subsets

section Profiles

variable {A : Type*} [Fintype A] [DecidableEq A]

noncomputable def profileWeight (G : SimpleGraph A) (S : BoolSubset A) : Profile :=
  xVar ^ selectedCount S * yVar ^ extCount (G := G) S

noncomputable def normalizedVWeight (G : SimpleGraph A) (S : BoolSubset A) : Profile :=
  xVar ^ selectedCount S * yVar ^ (extCount (G := G) S - 1)

noncomputable def UProfile (R : RootedGraph A) : Profile :=
  by
    classical
    exact ∑ S : BoolSubset A,
      if Independent R.graph S ∧ S R.root = true then profileWeight R.graph S else 0

noncomputable def VProfile (R : RootedGraph A) : Profile :=
  by
    classical
    exact ∑ S : BoolSubset A,
      if h : Independent R.graph S ∧ Extendable R.graph S R.root then
        normalizedVWeight R.graph S
      else 0

noncomputable def WProfile (R : RootedGraph A) : Profile :=
  by
    classical
    exact ∑ S : BoolSubset A,
      if Independent R.graph S ∧ S R.root = false ∧ ¬Extendable R.graph S R.root then
        profileWeight R.graph S
      else 0

noncomputable def FProfile (R : RootedGraph A) : Profile :=
  by
    classical
    exact ∑ S : BoolSubset A,
      if Independent R.graph S then profileWeight R.graph S else 0

lemma extCount_pos_of_extendable (G : SimpleGraph A) (S : BoolSubset A) (v : A)
    (h : Extendable G S v) : 0 < extCount (G := G) S := by
  classical
  rw [extCount_eq_card]
  exact Finset.card_pos.mpr ⟨v, (mem_extensionSet G S v).2 h⟩

lemma y_mul_normalizedVWeight (G : SimpleGraph A) (S : BoolSubset A) (v : A)
    (h : Extendable G S v) :
    yVar * normalizedVWeight G S = profileWeight G S := by
  have hn : extCount (G := G) S - 1 + 1 = extCount (G := G) S :=
    Nat.sub_add_cancel (extCount_pos_of_extendable G S v h)
  unfold normalizedVWeight profileWeight
  calc
    yVar * (xVar ^ selectedCount S * yVar ^ (extCount (G := G) S - 1)) =
        xVar ^ selectedCount S *
          (yVar * yVar ^ (extCount (G := G) S - 1)) := by ring
    _ = xVar ^ selectedCount S *
          yVar ^ (extCount (G := G) S - 1 + 1) := by rw [pow_succ']
    _ = xVar ^ selectedCount S * yVar ^ extCount (G := G) S := by rw [hn]

/-- The actual independent sets split into the selected, normalized-extendable, and blocked sectors. -/
theorem sector_partition (R : RootedGraph A) :
    FProfile R = UProfile R + yVar * VProfile R + WProfile R := by
  classical
  unfold FProfile UProfile VProfile WProfile
  rw [Finset.mul_sum]
  rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro S _
  by_cases hInd : Independent R.graph S
  · simp only [hInd, if_true]
    cases hroot : S R.root with
    | false =>
        by_cases hext : Extendable R.graph S R.root
        · simp [hroot, hext, hInd, y_mul_normalizedVWeight R.graph S R.root hext]
        · simp [hroot, hext, hInd]
    | true =>
        have hnotext : ¬Extendable R.graph S R.root := by
          intro hext
          simpa [hroot] using extendable_not_selected R.graph hext
        simp [hroot, hnotext, hInd]
  · simp [hInd]

end Profiles

section AttachmentSubsets

variable {I : Type*} [Fintype I] [DecidableEq I]
variable {V : I -> Type*} [forall i, Fintype (V i)] [forall i, DecidableEq (V i)]

def assembleSubset (b : Bool) (S : forall i, BoolSubset (V i)) :
    BoolSubset (AttachVertex V)
  | Sum.inl _ => b
  | Sum.inr ⟨i, v⟩ => S i v

def decomposeSubset (S : BoolSubset (AttachVertex V)) :
    Bool × (forall i, BoolSubset (V i)) :=
  (S freshRoot, fun i v => S (branchVertex i v))

def attachmentSubsetEquiv :
    BoolSubset (AttachVertex V) ≃ Bool × (forall i, BoolSubset (V i)) where
  toFun := decomposeSubset
  invFun p := assembleSubset p.1 p.2
  left_inv S := by
    funext w
    rcases w with (_ | ⟨i, v⟩) <;> rfl
  right_inv p := by
    rcases p with ⟨b, S⟩
    apply Prod.ext
    · rfl
    · funext i v
      rfl

@[simp] lemma assembleSubset_fresh (b : Bool) (S : forall i, BoolSubset (V i)) :
    assembleSubset b S freshRoot = b := rfl

@[simp] lemma assembleSubset_branch (b : Bool) (S : forall i, BoolSubset (V i))
    (i : I) (v : V i) :
    assembleSubset b S (branchVertex i v) = S i v := rfl

lemma selectedCount_assemble (b : Bool) (S : forall i, BoolSubset (V i)) :
    selectedCount (assembleSubset b S) = boolCount b + ∑ i, selectedCount (S i) := by
  classical
  unfold selectedCount
  rw [Fintype.sum_sum_type]
  simp only [Fintype.sum_sigma]
  simp [assembleSubset]

/--
Graph-realization bridge for independent sets: an attached subset is independent
exactly when every branch restriction is independent and a selected fresh root
excludes every branch root.
-/
theorem independent_assemble_iff (R : forall i, RootedTree (V i))
    (b : Bool) (S : forall i, BoolSubset (V i)) :
    Independent (attachGraph R) (assembleSubset b S) ↔
      (∀ i, Independent (R i).graph (S i)) ∧
        (b = true → ∀ i, S i (R i).root = false) := by
  classical
  constructor
  · intro h
    constructor
    · intro i u hu v hv huv hAdj
      apply h (x := branchVertex i u) (y := branchVertex i v)
      · simpa [assembleSubset, branchVertex] using hu
      · simpa [assembleSubset, branchVertex] using hv
      · simpa [branchVertex] using huv
      · exact (attachGraph_adj_branch_branch_same R i u v).2 hAdj
    · intro hb i
      apply Bool.eq_false_iff.mpr
      intro hroot
      apply h (x := freshRoot) (y := branchVertex i (R i).root)
      · simp [hb]
      · simp [hroot]
      · simp [freshRoot, branchVertex]
      · simp
  · rintro ⟨hbranch, hroot⟩
    intro u hu v hv huv hadj
    rcases u with (u0 | ⟨i, u⟩) <;> rcases v with (v0 | ⟨j, v⟩)
    · cases u0
      cases v0
      exact (attachGraph_adj_fresh_fresh R hadj).elim
    · cases u0
      have hb : b = true := by simpa [assembleSubset] using hu
      have hv' : S j v = true := by simpa [assembleSubset] using hv
      have hvr : v = (R j).root := (attachGraph_adj_fresh_branch R j v).1 hadj
      subst v
      simpa [hroot hb j] using hv'
    · cases v0
      have hb : b = true := by simpa [assembleSubset] using hv
      have hu' : S i u = true := by simpa [assembleSubset] using hu
      have hur : u = (R i).root := (attachGraph_adj_branch_fresh R i u).1 hadj
      subst u
      simpa [hroot hb i] using hu'
    · rcases (attachGraph_adj_branch_branch R i j u v).1 hadj with ⟨hij, hAdj⟩
      subst j
      apply hbranch i (x := u) (y := v)
      · simpa [assembleSubset, branchVertex] using hu
      · simpa [assembleSubset, branchVertex] using hv
      · intro huv'
        apply huv
        simpa [huv']
      · simpa using hAdj

theorem extendable_fresh_iff (R : forall i, RootedTree (V i))
    (S : forall i, BoolSubset (V i))
    (hbranch : ∀ i, Independent (R i).graph (S i)) :
    Extendable (attachGraph R) (assembleSubset false S) freshRoot ↔
      ∀ i, S i (R i).root = false := by
  classical
  have hInd : Independent (attachGraph R) (assembleSubset false S) :=
    (independent_assemble_iff R false S).2 ⟨hbranch, by simp⟩
  rw [extendable_iff_not_selected_no_adj (attachGraph R)
    (assembleSubset false S) freshRoot hInd]
  constructor
  · rintro ⟨_, hno⟩ i
    apply Bool.eq_false_iff.mpr
    intro hselected
    exact (hno (branchVertex i (R i).root) (by simpa using hselected)) (by simp)
  · intro hroot
    refine ⟨rfl, ?_⟩
    rintro (_ | ⟨i, v⟩) hselected hadj
    · simpa [assembleSubset] using hselected
    · have hv : v = (R i).root :=
        (attachGraph_adj_fresh_branch R i v).1 hadj
      subst v
      change S i (R i).root = true at hselected
      simpa [hroot i] using hselected

theorem extendable_branch_absent_iff (R : forall i, RootedTree (V i))
    (S : forall i, BoolSubset (V i))
    (hbranch : ∀ i, Independent (R i).graph (S i)) (i : I) (v : V i) :
    Extendable (attachGraph R) (assembleSubset false S) (branchVertex i v) ↔
      Extendable (R i).graph (S i) v := by
  classical
  have hOut : Independent (attachGraph R) (assembleSubset false S) :=
    (independent_assemble_iff R false S).2 ⟨hbranch, by simp⟩
  rw [extendable_iff_not_selected_no_adj (attachGraph R)
    (assembleSubset false S) (branchVertex i v) hOut]
  rw [extendable_iff_not_selected_no_adj (R i).graph (S i) v (hbranch i)]
  constructor
  · rintro ⟨hv, hno⟩
    refine ⟨hv, ?_⟩
    intro u hu hadj
    exact hno (branchVertex i u) (by simpa using hu)
      ((attachGraph_adj_branch_branch_same R i v u).2 hadj)
  · rintro ⟨hv, hno⟩
    refine ⟨hv, ?_⟩
    rintro (_ | ⟨j, u⟩) hselected hadj
    · simpa [assembleSubset] using hselected
    · rcases (attachGraph_adj_branch_branch R i j v u).1 hadj with ⟨hij, hadj'⟩
      subst j
      change S i u = true at hselected
      exact hno u hselected (by simpa using hadj')

theorem extendable_branch_selected_iff (R : forall i, RootedTree (V i))
    (S : forall i, BoolSubset (V i))
    (hbranch : ∀ i, Independent (R i).graph (S i))
    (hroot : ∀ i, S i (R i).root = false) (i : I) (v : V i) :
    Extendable (attachGraph R) (assembleSubset true S) (branchVertex i v) ↔
      Extendable (R i).graph (S i) v ∧ v ≠ (R i).root := by
  classical
  have hOut : Independent (attachGraph R) (assembleSubset true S) :=
    (independent_assemble_iff R true S).2 ⟨hbranch, by simpa⟩
  rw [extendable_iff_not_selected_no_adj (attachGraph R)
    (assembleSubset true S) (branchVertex i v) hOut]
  rw [extendable_iff_not_selected_no_adj (R i).graph (S i) v (hbranch i)]
  constructor
  · rintro ⟨hv, hno⟩
    refine ⟨⟨hv, ?_⟩, ?_⟩
    · intro u hu hadj
      exact hno (branchVertex i u) (by simpa using hu)
        ((attachGraph_adj_branch_branch_same R i v u).2 hadj)
    · intro hvr
      subst v
      exact (hno freshRoot (by simp)) (by simp)
  · rintro ⟨⟨hv, hno⟩, hvr⟩
    refine ⟨hv, ?_⟩
    rintro (_ | ⟨j, u⟩) hselected hadj
    · exact hvr ((attachGraph_adj_branch_fresh R i v).1 hadj)
    · rcases (attachGraph_adj_branch_branch R i j v u).1 hadj with ⟨hij, hadj'⟩
      subst j
      change S i u = true at hselected
      exact hno u hselected (by simpa using hadj')

theorem extCount_assemble_absent_of_roots_free (R : forall i, RootedTree (V i))
    (S : forall i, BoolSubset (V i))
    (hbranch : ∀ i, Independent (R i).graph (S i))
    (hroot : ∀ i, S i (R i).root = false) :
    extCount (G := attachGraph R) (assembleSubset false S) =
      1 + ∑ i, extCount (G := (R i).graph) (S i) := by
  classical
  unfold extCount
  rw [Fintype.sum_sum_type]
  simp only [Fintype.sum_sigma]
  have hfresh : Extendable (attachGraph R) (assembleSubset false S)
      (Sum.inl ()) := by
    simpa [freshRoot] using (extendable_fresh_iff R S hbranch).2 hroot
  have hvertex (i : I) (v : V i) :
      Extendable (attachGraph R) (assembleSubset false S) (Sum.inr ⟨i, v⟩) ↔
        Extendable (R i).graph (S i) v := by
    simpa [branchVertex] using extendable_branch_absent_iff R S hbranch i v
  simp_rw [hvertex]
  simp [hfresh]

theorem extCount_assemble_absent_of_root_used (R : forall i, RootedTree (V i))
    (S : forall i, BoolSubset (V i))
    (hbranch : ∀ i, Independent (R i).graph (S i))
    (hroot : ¬∀ i, S i (R i).root = false) :
    extCount (G := attachGraph R) (assembleSubset false S) =
      ∑ i, extCount (G := (R i).graph) (S i) := by
  classical
  unfold extCount
  rw [Fintype.sum_sum_type]
  simp only [Fintype.sum_sigma]
  have hfresh : ¬Extendable (attachGraph R) (assembleSubset false S)
      (Sum.inl ()) := by
    simpa [freshRoot] using not_congr (extendable_fresh_iff R S hbranch) |>.mpr hroot
  have hvertex (i : I) (v : V i) :
      Extendable (attachGraph R) (assembleSubset false S) (Sum.inr ⟨i, v⟩) ↔
        Extendable (R i).graph (S i) v := by
    simpa [branchVertex] using extendable_branch_absent_iff R S hbranch i v
  simp_rw [hvertex]
  simp [hfresh]

noncomputable def adjustedBranchExt (R : forall i, RootedTree (V i))
    (S : forall i, BoolSubset (V i)) (i : I) : Nat :=
  by
    classical
    exact ∑ v, if Extendable (R i).graph (S i) v ∧ v ≠ (R i).root then 1 else 0

lemma adjustedBranchExt_eq_of_not_extendable (R : forall i, RootedTree (V i))
    (S : forall i, BoolSubset (V i)) (i : I)
    (hroot : ¬Extendable (R i).graph (S i) (R i).root) :
    adjustedBranchExt R S i = extCount (G := (R i).graph) (S i) := by
  classical
  unfold adjustedBranchExt extCount
  apply Finset.sum_congr rfl
  intro v _
  by_cases hv : Extendable (R i).graph (S i) v
  · have hne : v ≠ (R i).root := by
      intro h
      subst v
      exact hroot hv
    simp [hv, hne]
  · simp [hv]

lemma adjustedBranchExt_eq_sub_of_extendable (R : forall i, RootedTree (V i))
    (S : forall i, BoolSubset (V i)) (i : I)
    (hroot : Extendable (R i).graph (S i) (R i).root) :
    adjustedBranchExt R S i = extCount (G := (R i).graph) (S i) - 1 := by
  classical
  apply Nat.eq_sub_of_add_eq
  unfold adjustedBranchExt extCount
  rw [← Finset.sum_erase (Finset.univ)
    (a := (R i).root) (by simp)]
  have hsum := Finset.sum_erase_add (Finset.univ)
    (fun v => if Extendable (R i).graph (S i) v then 1 else 0)
    (Finset.mem_univ (R i).root)
  have hrewrite :
      (∑ v ∈ Finset.univ.erase (R i).root,
        if Extendable (R i).graph (S i) v ∧ v ≠ (R i).root then 1 else 0) =
      (∑ v ∈ Finset.univ.erase (R i).root,
        if Extendable (R i).graph (S i) v then 1 else 0) := by
    apply Finset.sum_congr rfl
    intro v hv
    have hne : v ≠ (R i).root := (Finset.mem_erase.mp hv).1
    simp [hne]
  rw [hrewrite]
  simpa [hroot] using hsum

theorem extCount_assemble_selected (R : forall i, RootedTree (V i))
    (S : forall i, BoolSubset (V i))
    (hbranch : ∀ i, Independent (R i).graph (S i))
    (hroot : ∀ i, S i (R i).root = false) :
    extCount (G := attachGraph R) (assembleSubset true S) =
      ∑ i, adjustedBranchExt R S i := by
  classical
  unfold extCount adjustedBranchExt
  rw [Fintype.sum_sum_type]
  simp only [Fintype.sum_sigma]
  have hOut : Independent (attachGraph R) (assembleSubset true S) :=
    (independent_assemble_iff R true S).2 ⟨hbranch, by simpa⟩
  have hfresh : ¬Extendable (attachGraph R) (assembleSubset true S)
      (Sum.inl ()) := by
    intro h
    have := extendable_not_selected (attachGraph R) h
    simp [assembleSubset] at this
  have hvertex (i : I) (v : V i) :
      Extendable (attachGraph R) (assembleSubset true S) (Sum.inr ⟨i, v⟩) ↔
        Extendable (R i).graph (S i) v ∧ v ≠ (R i).root := by
    simpa [branchVertex] using extendable_branch_selected_iff R S hbranch hroot i v
  simp_rw [hvertex]
  simp [hfresh]

end AttachmentSubsets

section RecurrenceTerms

variable {A : Type*} [Fintype A] [DecidableEq A]

noncomputable def uSectorTerm (R : RootedGraph A) (S : BoolSubset A) : Profile :=
  by
    classical
    exact if Independent R.graph S ∧ S R.root = true then profileWeight R.graph S else 0

noncomputable def vSectorTerm (R : RootedGraph A) (S : BoolSubset A) : Profile :=
  by
    classical
    exact if Independent R.graph S ∧ Extendable R.graph S R.root then
      normalizedVWeight R.graph S
    else 0

noncomputable def wSectorTerm (R : RootedGraph A) (S : BoolSubset A) : Profile :=
  by
    classical
    exact if Independent R.graph S ∧ S R.root = false ∧
        ¬Extendable R.graph S R.root then
      profileWeight R.graph S
    else 0

noncomputable def allSectorTerm (R : RootedGraph A) (S : BoolSubset A) : Profile :=
  by
    classical
    exact if Independent R.graph S then profileWeight R.graph S else 0

noncomputable def absentRootTerm (R : RootedGraph A) (S : BoolSubset A) : Profile :=
  by
    classical
    exact if Independent R.graph S ∧ S R.root = false then profileWeight R.graph S else 0

noncomputable def adjustedRootTerm (R : RootedGraph A) (S : BoolSubset A) : Profile :=
  by
    classical
    exact if Independent R.graph S ∧ S R.root = false then
      if Extendable R.graph S R.root then normalizedVWeight R.graph S
      else profileWeight R.graph S
    else 0

lemma sum_uSectorTerm (R : RootedGraph A) :
    (∑ S, uSectorTerm R S) = UProfile R := by
  classical
  unfold uSectorTerm UProfile
  rfl

lemma sum_vSectorTerm (R : RootedGraph A) :
    (∑ S, vSectorTerm R S) = VProfile R := by
  classical
  unfold vSectorTerm VProfile
  rfl

lemma sum_wSectorTerm (R : RootedGraph A) :
    (∑ S, wSectorTerm R S) = WProfile R := by
  classical
  unfold wSectorTerm WProfile
  rfl

lemma sum_allSectorTerm (R : RootedGraph A) :
    (∑ S, allSectorTerm R S) = FProfile R := by
  classical
  unfold allSectorTerm FProfile
  rfl

lemma sum_absentRootTerm (R : RootedGraph A) :
    (∑ S, absentRootTerm R S) = yVar * VProfile R + WProfile R := by
  classical
  unfold absentRootTerm VProfile WProfile
  rw [Finset.mul_sum, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro S _
  by_cases hInd : Independent R.graph S
  · cases hroot : S R.root with
    | false =>
        by_cases hext : Extendable R.graph S R.root
        · simp [hInd, hroot, hext,
            y_mul_normalizedVWeight R.graph S R.root hext]
        · simp [hInd, hroot, hext]
    | true =>
        have hnotext : ¬Extendable R.graph S R.root := by
          intro hext
          simpa [hroot] using extendable_not_selected R.graph hext
        simp [hInd, hroot, hnotext]
  · simp [hInd]

lemma sum_adjustedRootTerm (R : RootedGraph A) :
    (∑ S, adjustedRootTerm R S) = VProfile R + WProfile R := by
  classical
  unfold adjustedRootTerm VProfile WProfile
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro S _
  by_cases hInd : Independent R.graph S
  · cases hroot : S R.root with
    | false =>
        by_cases hext : Extendable R.graph S R.root
        · simp [hInd, hroot, hext]
        · simp [hInd, hroot, hext]
    | true =>
        have hnotext : ¬Extendable R.graph S R.root := by
          intro hext
          simpa [hroot] using extendable_not_selected R.graph hext
        simp [hInd, hroot, hnotext]
  · simp [hInd]

lemma prod_profileWeight {I : Type*} [Fintype I] [DecidableEq I]
    {V : I → Type*} [∀ i, Fintype (V i)] [∀ i, DecidableEq (V i)]
    (G : ∀ i, SimpleGraph (V i)) (S : ∀ i, BoolSubset (V i)) :
    (∏ i, profileWeight (G i) (S i)) =
      xVar ^ (∑ i, selectedCount (S i)) *
        yVar ^ (∑ i, extCount (G := G i) (S i)) := by
  classical
  unfold profileWeight
  rw [Finset.prod_mul_distrib]
  rw [Finset.prod_pow_eq_pow_sum, Finset.prod_pow_eq_pow_sum]

lemma sum_family_products {I : Type*} [Fintype I] [DecidableEq I]
    {B : I → Type*} [∀ i, Fintype (B i)]
    (f : ∀ i, B i → Profile) :
    (∑ choice : ∀ i, B i, ∏ i, f i (choice i)) =
      ∏ i, ∑ b, f i b := by
  classical
  exact (Fintype.prod_sum f).symm

end RecurrenceTerms

section AttachmentRecurrences

variable {I : Type*} [Fintype I] [DecidableEq I]
variable {V : I → Type*} [∀ i, Fintype (V i)] [∀ i, DecidableEq (V i)]

lemma adjustedRootTerm_eq_branch_weight (R : ∀ i, RootedTree (V i))
    (S : ∀ i, BoolSubset (V i)) (i : I)
    (hInd : Independent (R i).graph (S i))
    (hroot : S i (R i).root = false) :
    adjustedRootTerm (R i).toRootedGraph (S i) =
      xVar ^ selectedCount (S i) * yVar ^ adjustedBranchExt R S i := by
  classical
  by_cases hext : Extendable (R i).graph (S i) (R i).root
  · simp [adjustedRootTerm, hInd, hroot, hext, normalizedVWeight,
      adjustedBranchExt_eq_sub_of_extendable R S i hext]
  · simp [adjustedRootTerm, hInd, hroot, hext, profileWeight,
      adjustedBranchExt_eq_of_not_extendable R S i hext]

lemma prod_adjustedRootTerm_eq (R : ∀ i, RootedTree (V i))
    (S : ∀ i, BoolSubset (V i))
    (hvalid : ∀ i, Independent (R i).graph (S i) ∧ S i (R i).root = false) :
    (∏ i, adjustedRootTerm (R i).toRootedGraph (S i)) =
      xVar ^ (∑ i, selectedCount (S i)) *
        yVar ^ (∑ i, adjustedBranchExt R S i) := by
  classical
  rw [Fintype.prod_congr
    (fun i => adjustedRootTerm (R i).toRootedGraph (S i))
    (fun i => xVar ^ selectedCount (S i) * yVar ^ adjustedBranchExt R S i)
    (fun i => adjustedRootTerm_eq_branch_weight R S i (hvalid i).1 (hvalid i).2)]
  rw [Finset.prod_mul_distrib]
  rw [Finset.prod_pow_eq_pow_sum, Finset.prod_pow_eq_pow_sum]

lemma prod_absentRootTerm_eq (R : ∀ i, RootedTree (V i))
    (S : ∀ i, BoolSubset (V i))
    (hvalid : ∀ i, Independent (R i).graph (S i) ∧ S i (R i).root = false) :
    (∏ i, absentRootTerm (R i).toRootedGraph (S i)) =
      xVar ^ (∑ i, selectedCount (S i)) *
        yVar ^ (∑ i, extCount (G := (R i).graph) (S i)) := by
  classical
  rw [Fintype.prod_congr
    (fun i => absentRootTerm (R i).toRootedGraph (S i))
    (fun i => profileWeight (R i).graph (S i))
    (fun i => by simp [absentRootTerm, (hvalid i).1, (hvalid i).2])]
  exact prod_profileWeight (fun i => (R i).graph) S

lemma prod_allSectorTerm_eq (R : ∀ i, RootedTree (V i))
    (S : ∀ i, BoolSubset (V i))
    (hvalid : ∀ i, Independent (R i).graph (S i)) :
    (∏ i, allSectorTerm (R i).toRootedGraph (S i)) =
      xVar ^ (∑ i, selectedCount (S i)) *
        yVar ^ (∑ i, extCount (G := (R i).graph) (S i)) := by
  classical
  rw [Fintype.prod_congr
    (fun i => allSectorTerm (R i).toRootedGraph (S i))
    (fun i => profileWeight (R i).graph (S i))
    (fun i => by simp [allSectorTerm, hvalid i])]
  exact prod_profileWeight (fun i => (R i).graph) S

lemma uSectorTerm_assemble_selected (R : ∀ i, RootedTree (V i))
    (S : ∀ i, BoolSubset (V i)) :
    uSectorTerm (attachRootedGraph R) (assembleSubset true S) =
      xVar * ∏ i, adjustedRootTerm (R i).toRootedGraph (S i) := by
  classical
  by_cases hvalid : ∀ i, Independent (R i).graph (S i) ∧
      S i (R i).root = false
  · have hbranch : ∀ i, Independent (R i).graph (S i) := fun i => (hvalid i).1
    have hroot : ∀ i, S i (R i).root = false := fun i => (hvalid i).2
    have hOut : Independent (attachGraph R) (assembleSubset true S) :=
      (independent_assemble_iff R true S).2 ⟨hbranch, by simpa⟩
    rw [show uSectorTerm (attachRootedGraph R) (assembleSubset true S) =
        profileWeight (attachGraph R) (assembleSubset true S) by
      simp [uSectorTerm, attachRootedGraph, hOut]]
    rw [prod_adjustedRootTerm_eq R S hvalid]
    unfold profileWeight
    rw [selectedCount_assemble, extCount_assemble_selected R S hbranch hroot]
    simp only [boolCount, if_true]
    rw [Nat.add_comm 1, pow_succ']
    ring
  · have hOut : ¬Independent (attachGraph R) (assembleSubset true S) := by
      intro h
      have hparts := (independent_assemble_iff R true S).1 h
      apply hvalid
      intro i
      exact ⟨hparts.1 i, hparts.2 rfl i⟩
    obtain ⟨i, hi⟩ := not_forall.mp hvalid
    have hzero : adjustedRootTerm (R i).toRootedGraph (S i) = 0 := by
      simp [adjustedRootTerm, hi]
    have hprod : (∏ j, adjustedRootTerm (R j).toRootedGraph (S j)) = 0 :=
      Finset.prod_eq_zero (Finset.mem_univ i) hzero
    simp [uSectorTerm, attachRootedGraph, hOut, hprod]

lemma vSectorTerm_assemble_absent (R : ∀ i, RootedTree (V i))
    (S : ∀ i, BoolSubset (V i)) :
    vSectorTerm (attachRootedGraph R) (assembleSubset false S) =
      ∏ i, absentRootTerm (R i).toRootedGraph (S i) := by
  classical
  by_cases hvalid : ∀ i, Independent (R i).graph (S i) ∧
      S i (R i).root = false
  · have hbranch : ∀ i, Independent (R i).graph (S i) := fun i => (hvalid i).1
    have hroot : ∀ i, S i (R i).root = false := fun i => (hvalid i).2
    have hOut : Independent (attachGraph R) (assembleSubset false S) :=
      (independent_assemble_iff R false S).2 ⟨hbranch, by simp⟩
    have hExt : Extendable (attachGraph R) (assembleSubset false S) freshRoot :=
      (extendable_fresh_iff R S hbranch).2 hroot
    rw [show vSectorTerm (attachRootedGraph R) (assembleSubset false S) =
        normalizedVWeight (attachGraph R) (assembleSubset false S) by
      simp [vSectorTerm, attachRootedGraph, hOut, hExt]]
    rw [prod_absentRootTerm_eq R S hvalid]
    unfold normalizedVWeight
    rw [selectedCount_assemble,
      extCount_assemble_absent_of_roots_free R S hbranch hroot]
    simp [boolCount]
  · have hcond : ¬(Independent (attachGraph R) (assembleSubset false S) ∧
        Extendable (attachGraph R) (assembleSubset false S) freshRoot) := by
      rintro ⟨hOut, hExt⟩
      have hparts := (independent_assemble_iff R false S).1 hOut
      have hroot := (extendable_fresh_iff R S hparts.1).1 hExt
      apply hvalid
      intro i
      exact ⟨hparts.1 i, hroot i⟩
    obtain ⟨i, hi⟩ := not_forall.mp hvalid
    have hzero : absentRootTerm (R i).toRootedGraph (S i) = 0 := by
      simp [absentRootTerm, hi]
    have hprod : (∏ j, absentRootTerm (R j).toRootedGraph (S j)) = 0 :=
      Finset.prod_eq_zero (Finset.mem_univ i) hzero
    simp [vSectorTerm, attachRootedGraph, hcond, hprod]

lemma wSectorTerm_assemble_absent (R : ∀ i, RootedTree (V i))
    (S : ∀ i, BoolSubset (V i)) :
    wSectorTerm (attachRootedGraph R) (assembleSubset false S) =
      (∏ i, allSectorTerm (R i).toRootedGraph (S i)) -
        ∏ i, absentRootTerm (R i).toRootedGraph (S i) := by
  classical
  by_cases hbranch : ∀ i, Independent (R i).graph (S i)
  · have hOut : Independent (attachGraph R) (assembleSubset false S) :=
      (independent_assemble_iff R false S).2 ⟨hbranch, by simp⟩
    by_cases hroot : ∀ i, S i (R i).root = false
    · have hExt : Extendable (attachGraph R) (assembleSubset false S) freshRoot :=
        (extendable_fresh_iff R S hbranch).2 hroot
      have hproducts :
          (∏ i, allSectorTerm (R i).toRootedGraph (S i)) =
            ∏ i, absentRootTerm (R i).toRootedGraph (S i) := by
        apply Fintype.prod_congr
        intro i
        simp [allSectorTerm, absentRootTerm, hbranch i, hroot i]
      simp [wSectorTerm, attachRootedGraph, hOut, hExt, hproducts]
    · have hExt : ¬Extendable (attachGraph R) (assembleSubset false S) freshRoot := by
        simpa using not_congr (extendable_fresh_iff R S hbranch) |>.mpr hroot
      obtain ⟨i, hi⟩ := not_forall.mp hroot
      have hzero : absentRootTerm (R i).toRootedGraph (S i) = 0 := by
        simp [absentRootTerm, hbranch i, hi]
      have hprodAbsent :
          (∏ j, absentRootTerm (R j).toRootedGraph (S j)) = 0 :=
        Finset.prod_eq_zero (Finset.mem_univ i) hzero
      rw [hprodAbsent, sub_zero]
      rw [prod_allSectorTerm_eq R S hbranch]
      rw [show wSectorTerm (attachRootedGraph R) (assembleSubset false S) =
          profileWeight (attachGraph R) (assembleSubset false S) by
        simp [wSectorTerm, attachRootedGraph, hOut, hExt]]
      unfold profileWeight
      rw [selectedCount_assemble,
        extCount_assemble_absent_of_root_used R S hbranch hroot]
      simp [boolCount]
  · have hOut : ¬Independent (attachGraph R) (assembleSubset false S) := by
      intro h
      exact hbranch ((independent_assemble_iff R false S).1 h).1
    obtain ⟨i, hi⟩ := not_forall.mp hbranch
    have hzeroAll : allSectorTerm (R i).toRootedGraph (S i) = 0 := by
      simp [allSectorTerm, hi]
    have hzeroAbsent : absentRootTerm (R i).toRootedGraph (S i) = 0 := by
      simp [absentRootTerm, hi]
    have hprodAll : (∏ j, allSectorTerm (R j).toRootedGraph (S j)) = 0 :=
      Finset.prod_eq_zero (Finset.mem_univ i) hzeroAll
    have hprodAbsent :
        (∏ j, absentRootTerm (R j).toRootedGraph (S j)) = 0 :=
      Finset.prod_eq_zero (Finset.mem_univ i) hzeroAbsent
    simp [wSectorTerm, attachRootedGraph, hOut, hprodAll, hprodAbsent]

lemma sum_uSectorTerm_attach (R : ∀ i, RootedTree (V i)) :
    (∑ T, uSectorTerm (attachRootedGraph R) T) =
      ∑ S : ∀ i, BoolSubset (V i),
        uSectorTerm (attachRootedGraph R) (assembleSubset true S) := by
  classical
  rw [← Equiv.sum_comp (attachmentSubsetEquiv (I := I) (V := V)).symm
    (uSectorTerm (attachRootedGraph R))]
  rw [Fintype.sum_prod_type]
  simp [attachmentSubsetEquiv, uSectorTerm, attachRootedGraph,
    assembleSubset, freshRoot]

lemma sum_vSectorTerm_attach (R : ∀ i, RootedTree (V i)) :
    (∑ T, vSectorTerm (attachRootedGraph R) T) =
      ∑ S : ∀ i, BoolSubset (V i),
        vSectorTerm (attachRootedGraph R) (assembleSubset false S) := by
  classical
  rw [← Equiv.sum_comp (attachmentSubsetEquiv (I := I) (V := V)).symm
    (vSectorTerm (attachRootedGraph R))]
  rw [Fintype.sum_prod_type]
  rw [Fintype.sum_bool]
  have htrue :
      (∑ S : ∀ i, BoolSubset (V i),
        vSectorTerm (attachRootedGraph R)
          ((attachmentSubsetEquiv (I := I) (V := V)).symm (true, S))) = 0 := by
    apply Finset.sum_eq_zero
    intro S _
    have hnotext : ¬Extendable (attachGraph R) (assembleSubset true S) freshRoot := by
      intro h
      have := extendable_not_selected (attachGraph R) h
      change true = false at this
      simp at this
    simp [attachmentSubsetEquiv, vSectorTerm, attachRootedGraph, hnotext]
  rw [htrue, zero_add]
  rfl

lemma sum_wSectorTerm_attach (R : ∀ i, RootedTree (V i)) :
    (∑ T, wSectorTerm (attachRootedGraph R) T) =
      ∑ S : ∀ i, BoolSubset (V i),
        wSectorTerm (attachRootedGraph R) (assembleSubset false S) := by
  classical
  rw [← Equiv.sum_comp (attachmentSubsetEquiv (I := I) (V := V)).symm
    (wSectorTerm (attachRootedGraph R))]
  rw [Fintype.sum_prod_type]
  simp [attachmentSubsetEquiv, wSectorTerm, attachRootedGraph,
    assembleSubset, freshRoot]

/-- Selected-root recurrence for the literal fresh-root attachment graph. -/
theorem UProfile_freshRoot_attach (R : ∀ i, RootedTree (V i)) :
    UProfile (attachRootedGraph R) =
      xVar * ∏ i, (VProfile (R i).toRootedGraph + WProfile (R i).toRootedGraph) := by
  classical
  calc
    UProfile (attachRootedGraph R) =
        ∑ T, uSectorTerm (attachRootedGraph R) T :=
      (sum_uSectorTerm (attachRootedGraph R)).symm
    _ = ∑ S : ∀ i, BoolSubset (V i),
          uSectorTerm (attachRootedGraph R) (assembleSubset true S) :=
      sum_uSectorTerm_attach R
    _ = ∑ S : ∀ i, BoolSubset (V i),
          xVar * ∏ i, adjustedRootTerm (R i).toRootedGraph (S i) := by
      apply Finset.sum_congr rfl
      intro S _
      exact uSectorTerm_assemble_selected R S
    _ = xVar * ∑ S : ∀ i, BoolSubset (V i),
          ∏ i, adjustedRootTerm (R i).toRootedGraph (S i) := by
      rw [Finset.mul_sum]
    _ = xVar * ∏ i, ∑ S : BoolSubset (V i),
          adjustedRootTerm (R i).toRootedGraph S := by
      rw [sum_family_products]
    _ = xVar * ∏ i,
          (VProfile (R i).toRootedGraph + WProfile (R i).toRootedGraph) := by
      congr 1
      apply Fintype.prod_congr
      intro i
      exact sum_adjustedRootTerm (R i).toRootedGraph

/-- Extendable-root recurrence for the literal fresh-root attachment graph. -/
theorem VProfile_freshRoot_attach (R : ∀ i, RootedTree (V i)) :
    VProfile (attachRootedGraph R) =
      ∏ i, (yVar * VProfile (R i).toRootedGraph + WProfile (R i).toRootedGraph) := by
  classical
  calc
    VProfile (attachRootedGraph R) =
        ∑ T, vSectorTerm (attachRootedGraph R) T :=
      (sum_vSectorTerm (attachRootedGraph R)).symm
    _ = ∑ S : ∀ i, BoolSubset (V i),
          vSectorTerm (attachRootedGraph R) (assembleSubset false S) :=
      sum_vSectorTerm_attach R
    _ = ∑ S : ∀ i, BoolSubset (V i),
          ∏ i, absentRootTerm (R i).toRootedGraph (S i) := by
      apply Finset.sum_congr rfl
      intro S _
      exact vSectorTerm_assemble_absent R S
    _ = ∏ i, ∑ S : BoolSubset (V i),
          absentRootTerm (R i).toRootedGraph S := by
      rw [sum_family_products]
    _ = ∏ i,
          (yVar * VProfile (R i).toRootedGraph + WProfile (R i).toRootedGraph) := by
      apply Fintype.prod_congr
      intro i
      exact sum_absentRootTerm (R i).toRootedGraph

/-- Blocked-root recurrence for the literal fresh-root attachment graph. -/
theorem WProfile_freshRoot_attach (R : ∀ i, RootedTree (V i)) :
    WProfile (attachRootedGraph R) =
      (∏ i, FProfile (R i).toRootedGraph) -
        ∏ i, (yVar * VProfile (R i).toRootedGraph + WProfile (R i).toRootedGraph) := by
  classical
  calc
    WProfile (attachRootedGraph R) =
        ∑ T, wSectorTerm (attachRootedGraph R) T :=
      (sum_wSectorTerm (attachRootedGraph R)).symm
    _ = ∑ S : ∀ i, BoolSubset (V i),
          wSectorTerm (attachRootedGraph R) (assembleSubset false S) :=
      sum_wSectorTerm_attach R
    _ = ∑ S : ∀ i, BoolSubset (V i),
          ((∏ i, allSectorTerm (R i).toRootedGraph (S i)) -
            ∏ i, absentRootTerm (R i).toRootedGraph (S i)) := by
      apply Finset.sum_congr rfl
      intro S _
      exact wSectorTerm_assemble_absent R S
    _ = (∑ S : ∀ i, BoolSubset (V i),
          ∏ i, allSectorTerm (R i).toRootedGraph (S i)) -
        ∑ S : ∀ i, BoolSubset (V i),
          ∏ i, absentRootTerm (R i).toRootedGraph (S i) := by
      rw [Finset.sum_sub_distrib]
    _ = (∏ i, ∑ S : BoolSubset (V i),
          allSectorTerm (R i).toRootedGraph S) -
        ∏ i, ∑ S : BoolSubset (V i),
          absentRootTerm (R i).toRootedGraph S := by
      rw [sum_family_products, sum_family_products]
    _ = (∏ i, FProfile (R i).toRootedGraph) -
        ∏ i, (yVar * VProfile (R i).toRootedGraph +
          WProfile (R i).toRootedGraph) := by
      rw [Fintype.prod_congr
        (fun i => ∑ S : BoolSubset (V i), allSectorTerm (R i).toRootedGraph S)
        (fun i => FProfile (R i).toRootedGraph)
        (fun i => sum_allSectorTerm (R i).toRootedGraph)]
      rw [Fintype.prod_congr
        (fun i => ∑ S : BoolSubset (V i), absentRootTerm (R i).toRootedGraph S)
        (fun i => yVar * VProfile (R i).toRootedGraph +
          WProfile (R i).toRootedGraph)
        (fun i => sum_absentRootTerm (R i).toRootedGraph)]

/-- The zero-branch attachment is the one-vertex rooted tree, including all four boundary values. -/
theorem empty_family_boundary (R : ∀ i, RootedTree (V i))
    (hI : Fintype.card I = 0) :
    UProfile (attachRootedGraph R) = xVar ∧
      VProfile (attachRootedGraph R) = 1 ∧
      WProfile (attachRootedGraph R) = 0 ∧
      FProfile (attachRootedGraph R) = xVar + yVar := by
  classical
  letI : IsEmpty I := Fintype.card_eq_zero_iff.mp hI
  have hU : UProfile (attachRootedGraph R) = xVar := by
    simpa using UProfile_freshRoot_attach R
  have hV : VProfile (attachRootedGraph R) = 1 := by
    simpa using VProfile_freshRoot_attach R
  have hW : WProfile (attachRootedGraph R) = 0 := by
    simpa using WProfile_freshRoot_attach R
  refine ⟨hU, hV, hW, ?_⟩
  rw [sector_partition, hU, hV, hW]
  ring

end AttachmentRecurrences

/-- Classical decidability of adjacency for any simple graph on a type in this file, so that
`SimpleGraph.degree` and `neighborFinset` are usable without a separate `DecidableRel` argument
at every call site. This mirrors the `classical`-throughout style already used for the sector
profiles above; it supplies no data, only propositional decidability. -/
noncomputable scoped instance simpleGraphDecidableRelClassical {W : Type*} (G : SimpleGraph W) :
    DecidableRel G.Adj := fun _ _ => Classical.propDecidable _

section Treehood

variable {I : Type*} [Fintype I] [DecidableEq I]
variable {V : I -> Type*} [forall i, Fintype (V i)] [forall i, DecidableEq (V i)]

/-- Graph homomorphism embedding branch `i` into the attachment graph. -/
def branchHom (R : forall i, RootedTree (V i)) (i : I) : (R i).graph →g attachGraph R where
  toFun := branchVertex i
  map_rel' := fun {u v} huv => (attachGraph_adj_branch_branch_same R i u v).2 huv

lemma reachable_fresh_branch (R : forall i, RootedTree (V i)) (i : I) (v : V i) :
    (attachGraph R).Reachable (freshRoot (V := V)) (branchVertex i v) := by
  classical
  have h1 : (attachGraph R).Reachable (freshRoot (V := V)) (branchVertex i (R i).root) :=
    ((attachGraph_adj_fresh_branch R i (R i).root).2 rfl).reachable
  have h2 : (R i).graph.Reachable (R i).root v := (R i).isTree.connected.preconnected _ _
  have h3 : (attachGraph R).Reachable (branchVertex i (R i).root) (branchVertex i v) :=
    h2.map (branchHom R i)
  exact h1.trans h3

theorem attachGraph_connected (R : forall i, RootedTree (V i)) :
    (attachGraph R).Connected := by
  classical
  rw [SimpleGraph.connected_iff_exists_forall_reachable]
  refine ⟨freshRoot (V := V), ?_⟩
  rintro (_ | ⟨i, v⟩)
  · exact SimpleGraph.Reachable.refl _
  · exact reachable_fresh_branch R i v

/-- The neighbor set of the fresh root in bijection with the tag type. -/
def neighborFreshEquiv (R : forall i, RootedTree (V i)) :
    I ≃ (attachGraph R).neighborSet (freshRoot (V := V)) where
  toFun i := ⟨branchVertex i (R i).root, (attachGraph_adj_fresh_branch R i (R i).root).2 rfl⟩
  invFun w := by
    rcases w with ⟨w, hw⟩
    rcases w with (_ | ⟨i, v⟩)
    · exact absurd hw (attachGraph_adj_fresh_fresh R)
    · exact i
  left_inv i := rfl
  right_inv w := by
    rcases w with ⟨w, hw⟩
    rcases w with (_ | ⟨i, v⟩)
    · exact absurd hw (attachGraph_adj_fresh_fresh R)
    · have hv : v = (R i).root := (attachGraph_adj_fresh_branch R i v).1 hw
      subst hv
      rfl

lemma degree_fresh (R : forall i, RootedTree (V i)) :
    (attachGraph R).degree (freshRoot (V := V)) = Fintype.card I := by
  rw [← SimpleGraph.card_neighborSet_eq_degree]
  exact (Fintype.card_congr (neighborFreshEquiv R)).symm

/-- `branchVertex i` is injective: it is `Sum.inr` composed with `Sigma.mk i`, both injective. -/
lemma branchVertex_injective (i : I) :
    Function.Injective (branchVertex (V := V) i) := by
  intro u1 u2 h
  have h' : (⟨i, u1⟩ : Sigma V) = ⟨i, u2⟩ := Sum.inr.inj h
  exact eq_of_heq (Sigma.mk.inj h').2

/-- When `v` is not the branch root, `branchVertex i` restricts to a bijection from the branch
neighbors of `v` in `(R i).graph` onto the attachment-graph neighbors of `branchVertex i v`: no
fresh-root edge attaches here (`v ≠ root`), and no other tag can reach it. -/
lemma bijOn_neighbor_branch_ne_root (R : forall i, RootedTree (V i)) (i : I) (v : V i)
    (hv : v ≠ (R i).root) :
    Function.Bijective
      (fun u : (R i).graph.neighborSet v =>
        (⟨branchVertex i u.1, (attachGraph_adj_branch_branch_same R i v u.1).2 u.2⟩ :
          (attachGraph R).neighborSet (branchVertex i v))) := by
  constructor
  · rintro ⟨u1, h1⟩ ⟨u2, h2⟩ heq
    simp only [Subtype.mk.injEq] at heq
    exact Subtype.ext (branchVertex_injective i heq)
  · rintro ⟨w, hw⟩
    rcases w with (_ | ⟨j, u⟩)
    · exact absurd ((attachGraph_adj_branch_fresh R i v).1 hw) hv
    · obtain ⟨hij, hadj⟩ := (attachGraph_adj_branch_branch R i j v u).1 hw
      subst hij
      exact ⟨⟨u, hadj⟩, rfl⟩

/-- At the branch root, the attachment graph adds exactly one neighbor (`freshRoot`) to the
branch's own neighbors: this is the corresponding bijection. -/
lemma bijOn_neighbor_branch_root (R : forall i, RootedTree (V i)) (i : I) :
    Function.Bijective
      (Sum.elim
        (fun u : (R i).graph.neighborSet (R i).root =>
          (⟨branchVertex i u.1, (attachGraph_adj_branch_branch_same R i (R i).root u.1).2 u.2⟩ :
            (attachGraph R).neighborSet (branchVertex i (R i).root)))
        (fun _ : Unit =>
          (⟨freshRoot, (attachGraph_adj_branch_fresh R i (R i).root).2 rfl⟩ :
            (attachGraph R).neighborSet (branchVertex i (R i).root)))) := by
  constructor
  · rintro (⟨u1, h1⟩ | u1) (⟨u2, h2⟩ | u2) heq
    · simp only [Sum.elim_inl, Subtype.mk.injEq] at heq
      exact congrArg Sum.inl (Subtype.ext (branchVertex_injective i heq))
    · simp [branchVertex, freshRoot] at heq
    · simp [branchVertex, freshRoot] at heq
    · rfl
  · rintro ⟨w, hw⟩
    rcases w with (_ | ⟨j, u⟩)
    · exact ⟨Sum.inr (), rfl⟩
    · obtain ⟨hij, hadj⟩ := (attachGraph_adj_branch_branch R i j (R i).root u).1 hw
      subst hij
      exact ⟨Sum.inl ⟨u, hadj⟩, rfl⟩

lemma degree_branch (R : forall i, RootedTree (V i)) (i : I) (v : V i) :
    (attachGraph R).degree (branchVertex i v) =
      (R i).graph.degree v + (if v = (R i).root then 1 else 0) := by
  classical
  rw [← SimpleGraph.card_neighborSet_eq_degree, ← SimpleGraph.card_neighborSet_eq_degree]
  by_cases hv : v = (R i).root
  · subst hv
    rw [if_pos rfl, ← Fintype.card_of_bijective (bijOn_neighbor_branch_root R i),
      Fintype.card_sum, Fintype.card_unit]
  · rw [if_neg hv, add_zero]
    exact (Fintype.card_of_bijective (bijOn_neighbor_branch_ne_root R i v hv)).symm

/-- Bridge rewrites: `Fintype.sum_sum_type`/`Fintype.sum_sigma` produce summands headed by the
raw `Sum.inl`/`Sum.inr` constructors; these `rfl`-lemmas fold them back to the `freshRoot` /
`branchVertex` notation used throughout. -/
private lemma sum_inl_eq_freshRoot' (u : Unit) : (Sum.inl u : AttachVertex V) = freshRoot := rfl

private lemma sum_inr_eq_branchVertex' (j : I) (u : V j) :
    (Sum.inr (⟨j, u⟩ : Sigma V) : AttachVertex V) = branchVertex j u := rfl

/-- The literal fresh-root attachment graph of a finite tagged family of rooted trees is itself
a tree: connected (`attachGraph_connected`) with exactly one fewer edge than vertex, verified via
the handshake lemma applied to `degree_fresh`/`degree_branch` and each branch's own treehood. -/
theorem attachGraph_isTree (R : forall i, RootedTree (V i)) : (attachGraph R).IsTree := by
  classical
  rw [SimpleGraph.isTree_iff_connected_and_card]
  refine ⟨attachGraph_connected R, ?_⟩
  rw [Nat.card_eq_fintype_card, Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
  have hsum : ∑ w : AttachVertex V, (attachGraph R).degree w =
      2 * (attachGraph R).edgeFinset.card :=
    (attachGraph R).sum_degrees_eq_twice_card_edges
  have hsplit : ∑ w : AttachVertex V, (attachGraph R).degree w =
      (attachGraph R).degree (freshRoot (V := V)) +
        ∑ i : I, ∑ v : V i, (attachGraph R).degree (branchVertex i v) := by
    rw [Fintype.sum_sum_type]
    simp only [Fintype.sum_sigma, sum_inl_eq_freshRoot', sum_inr_eq_branchVertex',
      Finset.univ_unique, Finset.sum_singleton]
    rfl
  rw [degree_fresh, hsum] at hsplit
  have hbranch : ∀ i : I, ∑ v : V i, (attachGraph R).degree (branchVertex i v) =
      2 * (R i).graph.edgeFinset.card + 1 := by
    intro i
    rw [Finset.sum_congr rfl (fun v (_ : v ∈ Finset.univ) => degree_branch R i v),
      Finset.sum_add_distrib, (R i).graph.sum_degrees_eq_twice_card_edges]
    congr 1
    simp
  have hbranchsum : ∑ i : I, ∑ v : V i, (attachGraph R).degree (branchVertex i v) =
      ∑ i : I, (2 * (R i).graph.edgeFinset.card + 1) :=
    Finset.sum_congr rfl (fun i _ => hbranch i)
  rw [hbranchsum] at hsplit
  have htree : ∀ i : I, (R i).graph.edgeFinset.card + 1 = Fintype.card (V i) :=
    fun i => (R i).isTree.card_edgeFinset
  have hcardAV : Fintype.card (AttachVertex V) = 1 + ∑ i : I, Fintype.card (V i) := by
    show Fintype.card (Unit ⊕ Sigma V) = _
    rw [Fintype.card_sum, Fintype.card_unit, Fintype.card_sigma]
  have hIsum : Fintype.card I = ∑ _i : I, 1 := by simp
  have hsum2 : (∑ i : I, (R i).graph.edgeFinset.card) + Fintype.card I =
      ∑ i : I, Fintype.card (V i) := by
    rw [hIsum, ← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl (fun i _ => htree i)
  have hexpand : ∑ i : I, (2 * (R i).graph.edgeFinset.card + 1) =
      2 * (∑ i : I, (R i).graph.edgeFinset.card) + Fintype.card I := by
    rw [Finset.sum_add_distrib, Finset.mul_sum, hIsum]
  rw [hexpand] at hsplit
  omega

/-- A branch root's degree drops to zero exactly when its own branch is a single vertex: the
"only if" direction uses that a nontrivial tree has minimum degree one
(`IsTree.minDegree_eq_one_of_nontrivial`), so a positive-size branch beyond the root forces a
positive root degree; the "if" direction is immediate isolation on a subsingleton type. -/
lemma branch_root_degree_zero_iff (R : forall i, RootedTree (V i)) (i : I) :
    (R i).graph.degree (R i).root = 0 ↔ Fintype.card (V i) = 1 := by
  classical
  constructor
  · intro hdeg0
    by_contra hne
    have hpos : 0 < Fintype.card (V i) := Fintype.card_pos_iff.mpr ⟨(R i).root⟩
    have hnt : Nontrivial (V i) := Fintype.one_lt_card_iff_nontrivial.mp (by omega)
    have hmindeg := (R i).isTree.minDegree_eq_one_of_nontrivial (V := V i) (G := (R i).graph)
    have hle := (R i).graph.minDegree_le_degree (R i).root
    rw [hmindeg] at hle
    omega
  · intro hcard
    have hsub : Subsingleton (V i) := Fintype.card_le_one_iff_subsingleton.mp (le_of_eq hcard)
    rw [SimpleGraph.degree_eq_zero]
    intro w hw
    rw [Subsingleton.elim w (R i).root] at hw
    exact (R i).graph.loopless.irrefl (R i).root hw

/-- Exact output-leaf classification for the literal fresh-root attachment graph: a vertex has
degree one exactly in the three cases the sealed sector recurrence names — the fresh root when
there is exactly one branch, a non-root branch leaf inherited from its own branch, or a singleton
branch's root. -/
theorem attachGraph_degree_eq_one_iff (R : forall i, RootedTree (V i)) (w : AttachVertex V) :
    (attachGraph R).degree w = 1 ↔
      match w with
      | Sum.inl _ => Fintype.card I = 1
      | Sum.inr ⟨i, v⟩ =>
          ((R i).graph.degree v = 1 ∧ v ≠ (R i).root) ∨
            (v = (R i).root ∧ Fintype.card (V i) = 1) := by
  rcases w with (u | ⟨i, v⟩)
  · show (attachGraph R).degree (freshRoot (V := V)) = 1 ↔ Fintype.card I = 1
    rw [degree_fresh]
  · show (attachGraph R).degree (branchVertex i v) = 1 ↔
      ((R i).graph.degree v = 1 ∧ v ≠ (R i).root) ∨
        (v = (R i).root ∧ Fintype.card (V i) = 1)
    rw [degree_branch]
    by_cases hv : v = (R i).root
    · subst hv
      rw [if_pos rfl]
      have hiff : (R i).graph.degree (R i).root = 0 ↔ Fintype.card (V i) = 1 :=
        branch_root_degree_zero_iff R i
      constructor
      · intro h
        exact Or.inr ⟨rfl, hiff.mp (by omega)⟩
      · rintro (⟨_, hne⟩ | ⟨_, hcard⟩)
        · exact absurd rfl hne
        · have := hiff.mpr hcard; omega
    · rw [if_neg hv, add_zero]
      constructor
      · intro h
        exact Or.inl ⟨h, hv⟩
      · rintro (⟨h, _⟩ | ⟨heq, _⟩)
        · exact h
        · exact absurd heq hv

/-- The frozen Stage 7 contract declaration
(`lean-c12-t1-fresh-root-sectors-v1`, `Erdos993.C12.FreshRootSectors.lean_c12_t1_fresh_root_sectors`):
the literal attachment graph is a tree, satisfies the actual root-sector partition and all three
product recurrences, the empty-family boundary values, and the exact output-leaf classification.
The first six conjuncts are exactly the sealed sector-recurrence bundle already compiling above
(`sector_partition`, `UProfile_freshRoot_attach`, `VProfile_freshRoot_attach`,
`WProfile_freshRoot_attach`, `empty_family_boundary`); this route's charge is the seventh
conjunct plus `attachGraph_isTree`, the two declarations the Stage 7 formalizer left uncompiled. -/
theorem lean_c12_t1_fresh_root_sectors (R : forall i, RootedTree (V i)) :
    (attachGraph R).IsTree ∧
      FProfile (attachRootedGraph R) = UProfile (attachRootedGraph R) +
        yVar * VProfile (attachRootedGraph R) + WProfile (attachRootedGraph R) ∧
      UProfile (attachRootedGraph R) =
        xVar * ∏ i, (VProfile (R i).toRootedGraph + WProfile (R i).toRootedGraph) ∧
      VProfile (attachRootedGraph R) =
        ∏ i, (yVar * VProfile (R i).toRootedGraph + WProfile (R i).toRootedGraph) ∧
      WProfile (attachRootedGraph R) =
        (∏ i, FProfile (R i).toRootedGraph) -
          ∏ i, (yVar * VProfile (R i).toRootedGraph + WProfile (R i).toRootedGraph) ∧
      (Fintype.card I = 0 →
        UProfile (attachRootedGraph R) = xVar ∧ VProfile (attachRootedGraph R) = 1 ∧
          WProfile (attachRootedGraph R) = 0 ∧
          FProfile (attachRootedGraph R) = xVar + yVar) ∧
      (∀ w : AttachVertex V, (attachGraph R).degree w = 1 ↔
        match w with
        | Sum.inl _ => Fintype.card I = 1
        | Sum.inr ⟨i, v⟩ =>
            ((R i).graph.degree v = 1 ∧ v ≠ (R i).root) ∨
              (v = (R i).root ∧ Fintype.card (V i) = 1)) :=
  ⟨attachGraph_isTree R, sector_partition (attachRootedGraph R),
    UProfile_freshRoot_attach R, VProfile_freshRoot_attach R, WProfile_freshRoot_attach R,
    empty_family_boundary R, attachGraph_degree_eq_one_iff R⟩

end Treehood

end Erdos993.C12.FreshRootSectors
