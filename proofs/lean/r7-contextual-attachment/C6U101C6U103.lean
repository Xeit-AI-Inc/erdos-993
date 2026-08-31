import Mathlib

/-!
# C6-U1-01-C6-U1-03: collision-free contextual attachment

This file formalizes only the frozen conditional context-interface theorem.  In particular, it
does not assert finiteness of an observational quotient, B4 coverage, or any headline result.
-/

open Function

universe u v w x

namespace C6U101C6U103

/-- An injective partial labelling of a finite vertex type. -/
structure PartialLabel (V : Type u) (Lambda : Type v) [Fintype V] where
  domain : Finset V
  label : domain ↪ Lambda

/-- A finite rooted tree with an injective partial labelling. -/
structure FinitePartialLabelledRootedTree (Lambda : Type v) where
  Vertex : Type u
  [vertexFintype : Fintype Vertex]
  graph : SimpleGraph Vertex
  root : Vertex
  isTree : graph.IsTree
  labels : PartialLabel Vertex Lambda

attribute [instance] FinitePartialLabelledRootedTree.vertexFintype

namespace FinitePartialLabelledRootedTree

variable {Lambda : Type v} {Gamma : Type w}

abbrev LabelIndex (T : FinitePartialLabelledRootedTree Lambda) := T.labels.domain

/-- The actual finite set of names used by a partial labelling. -/
def UsedLabel (T : FinitePartialLabelledRootedTree Lambda) :=
  {x : Lambda // x ∈ Set.range T.labels.label}

/-- Labelled vertices and used label names are canonically equivalent. -/
noncomputable def labelIndexEquivUsedLabel (T : FinitePartialLabelledRootedTree Lambda) :
    T.LabelIndex ≃ T.UsedLabel where
  toFun i := ⟨T.labels.label i, ⟨i, rfl⟩⟩
  invFun x := Classical.choose x.property
  left_inv i := by
    apply T.labels.label.injective
    exact Classical.choose_spec
      (show ∃ j, T.labels.label j = T.labels.label i from ⟨i, rfl⟩)
  right_inv x := by
    apply Subtype.ext
    exact Classical.choose_spec x.property

/-- Relabel every labelled vertex through a new explicit injection. -/
def relabel (T : FinitePartialLabelledRootedTree Lambda) (rho : T.LabelIndex ↪ Gamma) :
    FinitePartialLabelledRootedTree Gamma where
  Vertex := T.Vertex
  graph := T.graph
  root := T.root
  isTree := T.isTree
  labels := ⟨T.labels.domain, rho⟩

@[simp] theorem relabel_self (T : FinitePartialLabelledRootedTree Lambda) :
    T.relabel T.labels.label = T := by
  rfl

@[simp] theorem relabel_relabel {Omega : Type x}
    (T : FinitePartialLabelledRootedTree Lambda) (rho : T.LabelIndex ↪ Gamma)
    (sigma : (T.relabel rho).LabelIndex ↪ Omega) :
    (T.relabel rho).relabel sigma = T.relabel sigma := by
  rfl

private def sumInlEmbedding {alpha beta : Type u} : alpha ↪ alpha ⊕ beta where
  toFun := Sum.inl
  inj' _ _ h := Sum.inl_injective h

private def sumInrEmbedding {alpha beta : Type u} : beta ↪ alpha ⊕ beta where
  toFun := Sum.inr
  inj' _ _ h := Sum.inr_injective h

/-- The labelled vertices in an attachment are exactly the tagged labelled vertices of its sides. -/
noncomputable def attachDomain (A : FinitePartialLabelledRootedTree Lambda)
    (B : FinitePartialLabelledRootedTree Gamma) : Finset (A.Vertex ⊕ B.Vertex) := by
  classical
  exact A.labels.domain.map sumInlEmbedding ∪ B.labels.domain.map sumInrEmbedding

@[simp] theorem mem_attachDomain_inl (A : FinitePartialLabelledRootedTree Lambda)
    (B : FinitePartialLabelledRootedTree Gamma) (v : A.Vertex) :
    Sum.inl v ∈ attachDomain A B ↔ v ∈ A.labels.domain := by
  simp [attachDomain, sumInlEmbedding, sumInrEmbedding]

@[simp] theorem mem_attachDomain_inr (A : FinitePartialLabelledRootedTree Lambda)
    (B : FinitePartialLabelledRootedTree Gamma) (v : B.Vertex) :
    Sum.inr v ∈ attachDomain A B ↔ v ∈ B.labels.domain := by
  simp [attachDomain, sumInlEmbedding, sumInrEmbedding]

/-- Retained-first-root attachment: disjoint union plus the edge between the two roots. -/
def attachGraph (A : FinitePartialLabelledRootedTree Lambda)
    (B : FinitePartialLabelledRootedTree Gamma) : SimpleGraph (A.Vertex ⊕ B.Vertex) :=
  A.graph.sum B.graph ⊔ SimpleGraph.edge (Sum.inl A.root) (Sum.inr B.root)

theorem attachGraph_isTree (A : FinitePartialLabelledRootedTree Lambda)
    (B : FinitePartialLabelledRootedTree Gamma) : (attachGraph A B).IsTree := by
  classical
  rw [SimpleGraph.isTree_iff_connected_and_card]
  refine ⟨A.isTree.connected.sum_sup_edge B.isTree.connected, ?_⟩
  have hsup :
      (attachGraph A B).edgeFinset.card =
        (A.graph.sum B.graph).edgeFinset.card + 1 := by
    simpa [attachGraph] using
      (SimpleGraph.card_edgeFinset_sup_edge (G := A.graph.sum B.graph)
        (s := Sum.inl A.root) (t := Sum.inr B.root) (by simp) (by simp))
  have hsum :
      (A.graph.sum B.graph).edgeFinset.card =
        A.graph.edgeFinset.card + B.graph.edgeFinset.card := by
    rw [SimpleGraph.edgeFinset_card, SimpleGraph.edgeFinset_card,
      SimpleGraph.edgeFinset_card]
    simpa only [Fintype.card_sum] using
      Fintype.card_congr (SimpleGraph.edgeSetSumEquiv (G := A.graph) (H := B.graph))
  have hA := A.isTree.card_edgeFinset
  have hB := B.isTree.card_edgeFinset
  rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
  rw [hsup, hsum, Nat.card_sum]
  simp only [Nat.card_eq_fintype_card]
  omega

/-- Combine two relabellings whose ranges are disjoint. -/
noncomputable def attachLabelEmbedding {Omega : Type x}
    (A : FinitePartialLabelledRootedTree Lambda)
    (B : FinitePartialLabelledRootedTree Gamma)
    (rhoA : A.LabelIndex ↪ Omega) (rhoB : B.LabelIndex ↪ Omega)
    (hcross : ∀ a b, rhoA a ≠ rhoB b) : attachDomain A B ↪ Omega where
  toFun x := match h : x.1 with
    | Sum.inl v => rhoA ⟨v, (mem_attachDomain_inl A B v).mp (by
        simpa only [h] using x.2)⟩
    | Sum.inr v => rhoB ⟨v, (mem_attachDomain_inr A B v).mp (by
        simpa only [h] using x.2)⟩
  inj' := by
    rintro ⟨x, hx⟩ ⟨y, hy⟩ hxy
    apply Subtype.ext
    cases x with
    | inl x =>
        cases y with
        | inl y =>
            have h := rhoA.injective hxy
            exact congrArg Sum.inl (congrArg Subtype.val h)
        | inr y =>
            exact False.elim (hcross
              ⟨x, (mem_attachDomain_inl A B x).mp hx⟩
              ⟨y, (mem_attachDomain_inr A B y).mp hy⟩ hxy)
    | inr x =>
        cases y with
        | inl y =>
            exact False.elim (hcross
              ⟨y, (mem_attachDomain_inl A B y).mp hy⟩
              ⟨x, (mem_attachDomain_inr A B x).mp hx⟩ hxy.symm)
        | inr y =>
            have h := rhoB.injective hxy
            exact congrArg Sum.inr (congrArg Subtype.val h)

/-- Root attachment with simultaneous, collision-free relabelling of both inputs. -/
noncomputable def attachWith {Omega : Type x}
    (A : FinitePartialLabelledRootedTree Lambda)
    (B : FinitePartialLabelledRootedTree Gamma)
    (rhoA : A.LabelIndex ↪ Omega) (rhoB : B.LabelIndex ↪ Omega)
    (hcross : ∀ a b, rhoA a ≠ rhoB b) :
    FinitePartialLabelledRootedTree Omega where
  Vertex := A.Vertex ⊕ B.Vertex
  graph := attachGraph A B
  root := Sum.inl A.root
  isTree := attachGraph_isTree A B
  labels := ⟨attachDomain A B, attachLabelEmbedding A B rhoA rhoB hcross⟩

/-- Data witnessing a root-preserving graph isomorphism and a used-label bijection. -/
structure FreshIsoData (A B : FinitePartialLabelledRootedTree Lambda) where
  graphIso : A.graph ≃g B.graph
  map_root : graphIso A.root = B.root
  map_domain : ∀ v, v ∈ A.labels.domain ↔ graphIso v ∈ B.labels.domain
  labelIso : A.UsedLabel ≃ B.UsedLabel
  map_label : ∀ i : A.LabelIndex,
    labelIso (A.labelIndexEquivUsedLabel i) =
      B.labelIndexEquivUsedLabel
        ⟨graphIso i.1, (map_domain i.1).mp i.2⟩

/-- Root- and label-respecting fresh isomorphism, as a proposition. -/
def FreshIso (A B : FinitePartialLabelledRootedTree Lambda) : Prop :=
  Nonempty (FreshIsoData A B)

/-- Any injective renaming of the used labels is a fresh isomorphism. -/
theorem freshIsoToRelabel (T : FinitePartialLabelledRootedTree Lambda)
    (rho : T.LabelIndex ↪ Lambda) : T.FreshIso (T.relabel rho) := by
  refine ⟨{
    graphIso := .refl
    map_root := rfl
    map_domain := fun _ => Iff.rfl
    labelIso := T.labelIndexEquivUsedLabel.symm.trans
      (T.relabel rho).labelIndexEquivUsedLabel
    map_label := ?_ }⟩
  intro i
  simp only [Equiv.trans_apply, Equiv.symm_apply_apply]
  apply congrArg
  apply Subtype.ext
  rfl

/-- Two injective renamings of one rooted tree differ only by fresh isomorphism. -/
theorem freshIsoBetweenRelabels (T : FinitePartialLabelledRootedTree Lambda)
    (rho sigma : T.LabelIndex ↪ Gamma) :
    (T.relabel rho).FreshIso (T.relabel sigma) := by
  refine ⟨{
    graphIso := .refl
    map_root := rfl
    map_domain := fun _ => Iff.rfl
    labelIso := (T.relabel rho).labelIndexEquivUsedLabel.symm.trans
      (T.relabel sigma).labelIndexEquivUsedLabel
    map_label := ?_ }⟩
  intro i
  simp only [Equiv.trans_apply, Equiv.symm_apply_apply]
  apply congrArg
  apply Subtype.ext
  rfl

end FinitePartialLabelledRootedTree

open FinitePartialLabelledRootedTree

/-- A finite common freshening of a tuple, with pairwise disjoint image sets. -/
structure CommonFreshening {n : Nat} {Lambda : Type v}
    (pieces : Fin n → FinitePartialLabelledRootedTree.{u, v} Lambda) where
  rename : ∀ i, (pieces i).LabelIndex ↪ Lambda
  pairwise_disjoint : ∀ {i j}, i ≠ j → ∀ a b, rename i a ≠ rename j b

/-- Every finite type embeds into an infinite label universe. -/
noncomputable def finiteEmbedding (alpha : Type u) (Lambda : Type v)
    [Fintype alpha] [Infinite Lambda] :
    alpha ↪ Lambda :=
  (Fintype.equivFin alpha).toEmbedding.trans
    (Fin.valEmbedding.trans (Infinite.natEmbedding Lambda))

/-- Every finite tuple has a simultaneous collision-free freshening. -/
theorem commonFreshening_exists {n : Nat} {Lambda : Type v} [Infinite Lambda]
    (pieces : Fin n → FinitePartialLabelledRootedTree.{u, v} Lambda) :
    Nonempty (CommonFreshening pieces) := by
  let code : (Σ i, (pieces i).LabelIndex) ↪ Lambda :=
    finiteEmbedding (Σ i, (pieces i).LabelIndex) Lambda
  refine ⟨⟨fun i =>
    { toFun := fun a => code ⟨i, a⟩
      inj' := fun _ _ h => by
        have := code.injective h
        exact eq_of_heq (Sigma.mk.inj_iff.mp this |>.2) }, ?_⟩⟩
  intro i j hij a b h
  have hsigma : (⟨i, a⟩ : Σ i, (pieces i).LabelIndex) = ⟨j, b⟩ := code.injective h
  exact hij (congrArg Sigma.fst hsigma)

/-- Binary attachment syntax. No associativity equation is introduced. -/
inductive TreeExpr (Lambda : Type v) : Type (max (u + 1) v)
  | atom : FinitePartialLabelledRootedTree.{u, v} Lambda → TreeExpr Lambda
  | attach : TreeExpr Lambda → TreeExpr Lambda → TreeExpr Lambda

namespace TreeExpr

variable {Lambda : Type v}

private noncomputable def labelIndexRawEmbedding
    (T : FinitePartialLabelledRootedTree Lambda) : T.LabelIndex ↪ ULift.{v} Nat where
  toFun i := ⟨(Fintype.equivFin T.LabelIndex i).val⟩
  inj' a b h := by
    apply (Fintype.equivFin T.LabelIndex).injective
    apply Fin.ext
    exact congrArg ULift.down h

private def evenEmbedding : ULift.{v} Nat ↪ ULift.{v} Nat where
  toFun n := ⟨2 * n.down⟩
  inj' a b h := by
    apply ULift.ext
    have h' := congrArg ULift.down h
    simp only at h'
    omega

private def oddEmbedding : ULift.{v} Nat ↪ ULift.{v} Nat where
  toFun n := ⟨2 * n.down + 1⟩
  inj' a b h := by
    apply ULift.ext
    have h' := congrArg ULift.down h
    simp only at h'
    omega

/-- Evaluate attachment syntax while tagging every atomic used-label set disjointly. -/
noncomputable def evalRaw :
    TreeExpr Lambda → FinitePartialLabelledRootedTree (ULift.{v} Nat)
  | atom T => T.relabel (labelIndexRawEmbedding T)
  | attach A B =>
      let left := evalRaw A
      let right := evalRaw B
      left.attachWith right
        (left.labels.label.trans evenEmbedding)
        (right.labels.label.trans oddEmbedding)
        (by
          intro a b h
          have h' := congrArg ULift.down h
          change 2 * (left.labels.label a).down =
            2 * (right.labels.label b).down + 1 at h'
          omega)

/-- Evaluate using a chosen injective embedding into the ambient infinite universe. -/
noncomputable def evaluateWith (E : TreeExpr Lambda) (rho : E.evalRaw.LabelIndex ↪ Lambda) :
    FinitePartialLabelledRootedTree Lambda :=
  E.evalRaw.relabel rho

/-- A canonical representative, used only to define an observation. -/
noncomputable def denote [Infinite Lambda] (E : TreeExpr Lambda) :
    FinitePartialLabelledRootedTree Lambda :=
  E.evaluateWith (finiteEmbedding E.evalRaw.LabelIndex Lambda)

/-- Any two common freshenings of the same expression are fresh-isomorphic. -/
theorem evaluateWith_freshIso (E : TreeExpr Lambda)
    (rho sigma : E.evalRaw.LabelIndex ↪ Lambda) :
    (E.evaluateWith rho).FreshIso (E.evaluateWith sigma) :=
  E.evalRaw.freshIsoBetweenRelabels _ _

/-- A one-hole context with both attachment slots represented syntactically. -/
inductive Context (Lambda : Type v) : Type (max (u + 1) v)
  | hole : Context Lambda
  | attachRight : Context Lambda →
      FinitePartialLabelledRootedTree.{u, v} Lambda → Context Lambda
  | attachLeft : FinitePartialLabelledRootedTree.{u, v} Lambda →
      Context Lambda → Context Lambda

/-- Substitute an expression into the unique context hole. -/
def Context.plug : Context Lambda → TreeExpr Lambda → TreeExpr Lambda
  | .hole, E => E
  | .attachRight C H, E => .attach (C.plug E) (.atom H)
  | .attachLeft H C, E => .attach (.atom H) (C.plug E)

/-- Syntactic composition of one-hole contexts. -/
def Context.comp : Context Lambda → Context Lambda → Context Lambda
  | .hole, D => D
  | .attachRight C H, D => .attachRight (C.comp D) H
  | .attachLeft H C, D => .attachLeft H (C.comp D)

@[simp] theorem Context.hole_plug (E : TreeExpr Lambda) : Context.hole.plug E = E := rfl

@[simp] theorem Context.plug_comp (C D : Context Lambda) (E : TreeExpr Lambda) :
    (C.comp D).plug E = C.plug (D.plug E) := by
  induction C with
  | hole => rfl
  | attachRight C H ih => simp [Context.comp, Context.plug, ih]
  | attachLeft H C ih => simp [Context.comp, Context.plug, ih]

end TreeExpr

open TreeExpr

/-- B4 depends only on root- and label-respecting fresh isomorphism. -/
def FreshInvariant {Lambda : Type v}
    (B4 : FinitePartialLabelledRootedTree Lambda → Prop) : Prop :=
  ∀ A B, A.FreshIso B → (B4 A ↔ B4 B)

/-- B4 observation of an expression through its canonical fresh representative. -/
noncomputable def observe {Lambda : Type v} [Infinite Lambda]
    (B4 : FinitePartialLabelledRootedTree Lambda → Prop) (E : TreeExpr Lambda) : Prop :=
  B4 E.denote

/-- B4 evaluation is independent of the chosen collision-free freshening. -/
theorem observe_wellDefined {Lambda : Type v} [Infinite Lambda]
    (B4 : FinitePartialLabelledRootedTree Lambda → Prop) (hB4 : FreshInvariant B4)
    (E : TreeExpr Lambda) (rho : E.evalRaw.LabelIndex ↪ Lambda) :
    B4 (E.evaluateWith rho) ↔ observe B4 E :=
  hB4 _ _ (evaluateWith_freshIso E rho (finiteEmbedding E.evalRaw.LabelIndex Lambda))

/-- Equality of all one-hole B4 observations. -/
def ContextuallyEquivalent {Lambda : Type v} [Infinite Lambda]
    (B4 : FinitePartialLabelledRootedTree Lambda → Prop) (A B : TreeExpr Lambda) : Prop :=
  ∀ C : Context Lambda, observe B4 (C.plug A) ↔ observe B4 (C.plug B)

theorem contextual_target_lossless {Lambda : Type v} [Infinite Lambda]
    (B4 : FinitePartialLabelledRootedTree Lambda → Prop)
    (hB4 : FreshInvariant B4) (A B : FinitePartialLabelledRootedTree Lambda)
    (hAB : ContextuallyEquivalent B4 (.atom A) (.atom B)) : B4 A ↔ B4 B := by
  have hA : B4 A ↔ observe B4 (.atom A) := by
    simpa [TreeExpr.evaluateWith, TreeExpr.evalRaw] using
      (observe_wellDefined B4 hB4 (.atom A) A.labels.label)
  have hB : B4 B ↔ observe B4 (.atom B) := by
    simpa [TreeExpr.evaluateWith, TreeExpr.evalRaw] using
      (observe_wellDefined B4 hB4 (.atom B) B.labels.label)
  exact hA.trans ((hAB .hole).trans hB.symm)

theorem contextual_congruence_right {Lambda : Type v} [Infinite Lambda]
    (B4 : FinitePartialLabelledRootedTree Lambda → Prop) (A B : TreeExpr Lambda)
    (H : FinitePartialLabelledRootedTree Lambda)
    (hAB : ContextuallyEquivalent B4 A B) :
    ContextuallyEquivalent B4 (.attach A (.atom H)) (.attach B (.atom H)) := by
  intro C
  simpa [TreeExpr.Context.comp, TreeExpr.Context.plug] using
    hAB (TreeExpr.Context.comp C (.attachRight .hole H))

theorem contextual_congruence_left {Lambda : Type v} [Infinite Lambda]
    (B4 : FinitePartialLabelledRootedTree Lambda → Prop) (A B : TreeExpr Lambda)
    (H : FinitePartialLabelledRootedTree Lambda)
    (hAB : ContextuallyEquivalent B4 A B) :
    ContextuallyEquivalent B4 (.attach (.atom H) A) (.attach (.atom H) B) := by
  intro C
  simpa [TreeExpr.Context.comp, TreeExpr.Context.plug] using
    hAB (TreeExpr.Context.comp C (.attachLeft H .hole))

/-- The exact frozen conditional interface theorem C6-U1-01-C6-U1-03. -/
theorem C6_U1_01_C6_U1_03 {Lambda : Type v} [Infinite Lambda]
    (B4 : FinitePartialLabelledRootedTree Lambda → Prop)
    (hB4 : FreshInvariant B4) (A B : FinitePartialLabelledRootedTree Lambda)
    (hAB : ContextuallyEquivalent B4 (.atom A) (.atom B)) :
    (B4 A ↔ B4 B) ∧
      (∀ H : FinitePartialLabelledRootedTree Lambda,
        ContextuallyEquivalent B4 (.attach (.atom A) (.atom H))
          (.attach (.atom B) (.atom H))) ∧
      (∀ H : FinitePartialLabelledRootedTree Lambda,
        ContextuallyEquivalent B4 (.attach (.atom H) (.atom A))
          (.attach (.atom H) (.atom B))) := by
  exact ⟨contextual_target_lossless B4 hB4 A B hAB,
    fun H => contextual_congruence_right B4 (.atom A) (.atom B) H hAB,
    fun H => contextual_congruence_left B4 (.atom A) (.atom B) H hAB⟩

end C6U101C6U103
