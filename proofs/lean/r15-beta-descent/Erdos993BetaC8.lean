import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993BetaC8.extensionAdj 19881713ade3055f15592176d59464facb6e9b662756cf6f9fa0e84b6f01c6a7
namespace Erdos993BetaC8

open Finset

inductive ExtensionVertex (V : Type*)
  | old (x : V)
  | y
  | s
  | v
  deriving DecidableEq, Fintype

def extensionAdj {I V : Type*} (B : SimpleGraph V) (roots : I ↪ V) :
    ExtensionVertex V → ExtensionVertex V → Prop
  | .old x, .old z => B.Adj x z
  | .y, .old x => x ∈ Set.range roots
  | .old x, .y => x ∈ Set.range roots
  | .y, .s => True
  | .s, .y => True
  | .s, .v => True
  | .v, .s => True
  | _, _ => False

lemma extensionAdj_symm {I V : Type*} (B : SimpleGraph V) (roots : I ↪ V) :
    Std.Symm (extensionAdj B roots) := ⟨by
  intro a b hab
  cases a <;> cases b <;> simp_all [extensionAdj]
  exact B.symm.symm _ _ hab⟩

lemma extensionAdj_irrefl {I V : Type*} (B : SimpleGraph V) (roots : I ↪ V) :
    Std.Irrefl (extensionAdj B roots) := ⟨by
  intro a
  cases a <;> simp [extensionAdj]⟩

def componentExtension {I V : Type*} (B : SimpleGraph V) (roots : I ↪ V) :
    SimpleGraph (ExtensionVertex V) :=
  SimpleGraph.mk (extensionAdj B roots) (extensionAdj_symm B roots)
    (extensionAdj_irrefl B roots)

def IsIndependent {V : Type*} (G : SimpleGraph V) (S : Finset V) : Prop :=
  ∀ x ∈ S, ∀ z ∈ S, ¬G.Adj x z

def IndepFinsetAt {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (k : Int) :=
  {S : Finset V // IsIndependent G S ∧ (S.card : Int) = k}

noncomputable instance instFintypeIndepFinsetAt
    {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (k : Int) : Fintype (IndepFinsetAt G k) :=
  Fintype.ofInjective Subtype.val Subtype.val_injective

noncomputable def iCoeff {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (k : Int) : Int :=
  Fintype.card (IndepFinsetAt G k)

noncomputable def delta {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (r : Int) : Int :=
  iCoeff G (r + 1) - iCoeff G r

abbrev RootFree {I V : Type*} (roots : I ↪ V) :=
  {x : V // x ∉ Set.range roots}

noncomputable instance instFintypeRootFree
    {I V : Type*} [Fintype V] (roots : I ↪ V) : Fintype (RootFree roots) :=
  Fintype.ofFinite _

abbrev rootDeleted {I V : Type*} (B : SimpleGraph V) (roots : I ↪ V) :
    SimpleGraph (RootFree roots) :=
  B.induce {x | x ∉ Set.range roots}

def oldEmbedding {V : Type*} : V ↪ ExtensionVertex V where
  toFun := ExtensionVertex.old
  inj' := fun _ _ h => ExtensionVertex.old.inj h

def rootFreeOldEmbedding {I V : Type*} (roots : I ↪ V) :
    RootFree roots ↪ ExtensionVertex V where
  toFun x := .old x.1
  inj' := by
    intro x z h
    exact Subtype.ext (ExtensionVertex.old.inj h)

def oldLift {V : Type*} (S : Finset V) : Finset (ExtensionVertex V) :=
  S.map oldEmbedding

def rootFreeLift {I V : Type*} (roots : I ↪ V) (S : Finset (RootFree roots)) :
    Finset (ExtensionVertex V) :=
  S.map (rootFreeOldEmbedding roots)

def oldPart {V : Type*} [Fintype V] [DecidableEq V]
    (W : Finset (ExtensionVertex V)) : Finset V :=
  Finset.univ.filter fun x => ExtensionVertex.old x ∈ W

noncomputable def rootFreePart {I V : Type*} [Fintype V] [DecidableEq V]
    (roots : I ↪ V) (W : Finset (ExtensionVertex V)) : Finset (RootFree roots) :=
  Finset.univ.filter fun x => ExtensionVertex.old x.1 ∈ W

def untouched {I V : Type*} [Fintype I] [DecidableEq I]
    (component : V → I) (S : Finset V) : Finset I :=
  Finset.univ \ S.image component

def rootFreeUntouched {I V : Type*} [Fintype I] [DecidableEq I]
    (roots : I ↪ V) (component : V → I) (S : Finset (RootFree roots)) : Finset I :=
  Finset.univ \ S.image (fun x => component x.1)

abbrev ExtensionCode {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (k : Int) :=
  IndepFinsetAt B k ⊕
    (IndepFinsetAt B (k - 1) ⊕
      (IndepFinsetAt B (k - 1) ⊕
        (IndepFinsetAt (rootDeleted B roots) (k - 1) ⊕
          IndepFinsetAt (rootDeleted B roots) (k - 2))))

def codeFinset {I V : Type*} [Fintype V] [DecidableEq V]
    {B : SimpleGraph V} {roots : I ↪ V} {k : Int} :
    ExtensionCode B roots k → Finset (ExtensionVertex V)
  | Sum.inl A => oldLift A.1
  | Sum.inr (Sum.inl A) => insert .s (oldLift A.1)
  | Sum.inr (Sum.inr (Sum.inl A)) => insert .v (oldLift A.1)
  | Sum.inr (Sum.inr (Sum.inr (Sum.inl A))) => insert .y (rootFreeLift roots A.1)
  | Sum.inr (Sum.inr (Sum.inr (Sum.inr A))) =>
      insert .y (insert .v (rootFreeLift roots A.1))
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN lemma Erdos993BetaC8.isIndependent_iff_isIndepSet ade74a5d61ed9f8a6e4111fea323d50bc9ed5d1d5019a4075a8f6b1e500c2d47
@[simp] lemma componentExtension_old_old {I V : Type*} (B : SimpleGraph V)
    (roots : I ↪ V) (x z : V) :
    (componentExtension B roots).Adj (.old x) (.old z) ↔ B.Adj x z := Iff.rfl

@[simp] lemma componentExtension_y_old {I V : Type*} (B : SimpleGraph V)
    (roots : I ↪ V) (x : V) :
    (componentExtension B roots).Adj .y (.old x) ↔ x ∈ Set.range roots := Iff.rfl

@[simp] lemma componentExtension_old_y {I V : Type*} (B : SimpleGraph V)
    (roots : I ↪ V) (x : V) :
    (componentExtension B roots).Adj (.old x) .y ↔ x ∈ Set.range roots := Iff.rfl

@[simp] lemma componentExtension_y_s {I V : Type*} (B : SimpleGraph V)
    (roots : I ↪ V) : (componentExtension B roots).Adj .y .s := trivial

@[simp] lemma componentExtension_s_y {I V : Type*} (B : SimpleGraph V)
    (roots : I ↪ V) : (componentExtension B roots).Adj .s .y := trivial

@[simp] lemma componentExtension_s_v {I V : Type*} (B : SimpleGraph V)
    (roots : I ↪ V) : (componentExtension B roots).Adj .s .v := trivial

@[simp] lemma componentExtension_v_s {I V : Type*} (B : SimpleGraph V)
    (roots : I ↪ V) : (componentExtension B roots).Adj .v .s := trivial

lemma isIndependent_iff_isIndepSet {V : Type*}
    (G : SimpleGraph V) (S : Finset V) :
    IsIndependent G S ↔ G.IsIndepSet (S : Set V) := by
  constructor
  · intro h x hx z hz _
    exact h x hx z hz
  · intro h x hx z hz hxz
    by_cases hEq : x = z
    · subst z
      exact G.loopless.irrefl x hxz
    · exact h hx hz hEq hxz

@[simp] lemma mem_oldLift {V : Type*} [DecidableEq V]
    (x : V) (S : Finset V) : ExtensionVertex.old x ∈ oldLift S ↔ x ∈ S := by
  simp [oldLift, oldEmbedding]

@[simp] lemma y_not_mem_oldLift {V : Type*} [DecidableEq V] (S : Finset V) :
    (ExtensionVertex.y : ExtensionVertex V) ∉ oldLift S := by
  simp [oldLift, oldEmbedding]

@[simp] lemma s_not_mem_oldLift {V : Type*} [DecidableEq V] (S : Finset V) :
    (ExtensionVertex.s : ExtensionVertex V) ∉ oldLift S := by
  simp [oldLift, oldEmbedding]

@[simp] lemma v_not_mem_oldLift {V : Type*} [DecidableEq V] (S : Finset V) :
    (ExtensionVertex.v : ExtensionVertex V) ∉ oldLift S := by
  simp [oldLift, oldEmbedding]

@[simp] lemma card_oldLift {V : Type*} [DecidableEq V] (S : Finset V) :
    (oldLift S).card = S.card := by
  simp [oldLift]

@[simp] lemma mem_rootFreeLift {I V : Type*} [DecidableEq V]
    (roots : I ↪ V) (x : RootFree roots) (S : Finset (RootFree roots)) :
    ExtensionVertex.old x.1 ∈ rootFreeLift roots S ↔ x ∈ S := by
  simp [rootFreeLift, rootFreeOldEmbedding]

@[simp] lemma y_not_mem_rootFreeLift {I V : Type*} [DecidableEq V]
    (roots : I ↪ V) (S : Finset (RootFree roots)) :
    (ExtensionVertex.y : ExtensionVertex V) ∉ rootFreeLift roots S := by
  simp [rootFreeLift, rootFreeOldEmbedding]

@[simp] lemma s_not_mem_rootFreeLift {I V : Type*} [DecidableEq V]
    (roots : I ↪ V) (S : Finset (RootFree roots)) :
    (ExtensionVertex.s : ExtensionVertex V) ∉ rootFreeLift roots S := by
  simp [rootFreeLift, rootFreeOldEmbedding]

@[simp] lemma v_not_mem_rootFreeLift {I V : Type*} [DecidableEq V]
    (roots : I ↪ V) (S : Finset (RootFree roots)) :
    (ExtensionVertex.v : ExtensionVertex V) ∉ rootFreeLift roots S := by
  simp [rootFreeLift, rootFreeOldEmbedding]

@[simp] lemma card_rootFreeLift {I V : Type*} [DecidableEq V]
    (roots : I ↪ V) (S : Finset (RootFree roots)) :
    (rootFreeLift roots S).card = S.card := by
  simp [rootFreeLift]

@[simp] lemma mem_oldPart {V : Type*} [Fintype V] [DecidableEq V]
    (x : V) (W : Finset (ExtensionVertex V)) :
    x ∈ oldPart W ↔ ExtensionVertex.old x ∈ W := by
  simp [oldPart]

@[simp] lemma mem_rootFreePart {I V : Type*} [Fintype V] [DecidableEq V]
    (roots : I ↪ V) (x : RootFree roots) (W : Finset (ExtensionVertex V)) :
    x ∈ rootFreePart roots W ↔ ExtensionVertex.old x.1 ∈ W := by
  simp [rootFreePart]

@[simp] lemma oldPart_oldLift {V : Type*} [Fintype V] [DecidableEq V]
    (A : Finset V) : oldPart (oldLift A) = A := by
  ext x
  simp

@[simp] lemma oldPart_insert_y {V : Type*} [Fintype V] [DecidableEq V]
    (W : Finset (ExtensionVertex V)) : oldPart (insert .y W) = oldPart W := by
  ext x
  simp

@[simp] lemma oldPart_insert_s {V : Type*} [Fintype V] [DecidableEq V]
    (W : Finset (ExtensionVertex V)) : oldPart (insert .s W) = oldPart W := by
  ext x
  simp

@[simp] lemma oldPart_insert_v {V : Type*} [Fintype V] [DecidableEq V]
    (W : Finset (ExtensionVertex V)) : oldPart (insert .v W) = oldPart W := by
  ext x
  simp

@[simp] lemma rootFreePart_rootFreeLift {I V : Type*} [Fintype V] [DecidableEq V]
    (roots : I ↪ V) (A : Finset (RootFree roots)) :
    rootFreePart roots (rootFreeLift roots A) = A := by
  ext x
  simp

@[simp] lemma rootFreePart_insert_y {I V : Type*} [Fintype V] [DecidableEq V]
    (roots : I ↪ V) (W : Finset (ExtensionVertex V)) :
    rootFreePart roots (insert .y W) = rootFreePart roots W := by
  ext x
  simp

@[simp] lemma rootFreePart_insert_v {I V : Type*} [Fintype V] [DecidableEq V]
    (roots : I ↪ V) (W : Finset (ExtensionVertex V)) :
    rootFreePart roots (insert .v W) = rootFreePart roots W := by
  ext x
  simp

lemma isIndependent_oldPart {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) {W : Finset (ExtensionVertex V)}
    (hW : IsIndependent (componentExtension B roots) W) :
    IsIndependent B (oldPart W) := by
  intro x hx z hz hxz
  exact hW (.old x) (by simpa using hx) (.old z) (by simpa using hz) hxz

lemma isIndependent_rootFreePart {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) {W : Finset (ExtensionVertex V)}
    (hW : IsIndependent (componentExtension B roots) W) :
    IsIndependent (rootDeleted B roots) (rootFreePart roots W) := by
  intro x hx z hz hxz
  exact hW (.old x.1) (by simpa using hx) (.old z.1) (by simpa using hz) hxz

lemma root_not_mem_of_y {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) {W : Finset (ExtensionVertex V)}
    (hW : IsIndependent (componentExtension B roots) W)
    (hy : (ExtensionVertex.y : ExtensionVertex V) ∈ W) (i : I) :
    ExtensionVertex.old (roots i) ∉ W := by
  intro hi
  exact hW .y hy (.old (roots i)) hi (by simp)

lemma s_not_mem_of_y {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) {W : Finset (ExtensionVertex V)}
    (hW : IsIndependent (componentExtension B roots) W)
    (hy : (ExtensionVertex.y : ExtensionVertex V) ∈ W) :
    ExtensionVertex.s ∉ W := by
  intro hs
  exact hW .y hy .s hs (by simp)

lemma v_not_mem_of_s {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) {W : Finset (ExtensionVertex V)}
    (hW : IsIndependent (componentExtension B roots) W)
    (hs : (ExtensionVertex.s : ExtensionVertex V) ∈ W) :
    ExtensionVertex.v ∉ W := by
  intro hv
  exact hW .s hs .v hv (by simp)

lemma old_reconstruct {V : Type*} [Fintype V] [DecidableEq V]
    (W : Finset (ExtensionVertex V))
    (hy : (ExtensionVertex.y : ExtensionVertex V) ∉ W)
    (hs : (ExtensionVertex.s : ExtensionVertex V) ∉ W)
    (hv : (ExtensionVertex.v : ExtensionVertex V) ∉ W) :
    oldLift (oldPart W) = W := by
  ext x
  cases x <;> simp_all

lemma rootFree_reconstruct {I V : Type*} [Fintype V] [DecidableEq V]
    (roots : I ↪ V) (W : Finset (ExtensionVertex V))
    (hfree : ∀ i, ExtensionVertex.old (roots i) ∉ W) :
    ∀ x : V, ExtensionVertex.old x ∈ rootFreeLift roots (rootFreePart roots W) ↔
      ExtensionVertex.old x ∈ W := by
  intro x
  constructor
  · intro hx
    rcases Finset.mem_map.mp hx with ⟨x', hx', hEq⟩
    have hval : x'.1 = x := ExtensionVertex.old.inj hEq
    simpa [hval] using hx'
  · intro hx
    have hxFree : x ∉ Set.range roots := by
      rintro ⟨i, hi⟩
      exact hfree i (hi ▸ hx)
    have hxPart : (⟨x, hxFree⟩ : RootFree roots) ∈ rootFreePart roots W := by
      simpa
    exact (mem_rootFreeLift roots ⟨x, hxFree⟩ _).2 hxPart

lemma isIndependent_oldLift {I V : Type*} [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) {A : Finset V}
    (hA : IsIndependent B A) :
    IsIndependent (componentExtension B roots) (oldLift A) := by
  intro x hx z hz hxz
  cases x <;> cases z <;>
    simp_all [oldLift, oldEmbedding, componentExtension, extensionAdj]
  exact hA _ ‹_› _ ‹_› hxz

lemma isIndependent_rootFreeLift {I V : Type*} [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) {A : Finset (RootFree roots)}
    (hA : IsIndependent (rootDeleted B roots) A) :
    IsIndependent (componentExtension B roots) (rootFreeLift roots A) := by
  intro x hx z hz hxz
  rcases Finset.mem_map.mp hx with ⟨x', hx', hxeq⟩
  rcases Finset.mem_map.mp hz with ⟨z', hz', hzeq⟩
  subst x
  subst z
  exact hA x' hx' z' hz' hxz

lemma isIndependent_insert {V : Type*} [DecidableEq V] (G : SimpleGraph V)
    {a : V} {A : Finset V} (hA : IsIndependent G A)
    (hcross : ∀ x ∈ A, ¬G.Adj a x) : IsIndependent G (insert a A) := by
  intro x hx z hz hxz
  simp only [Finset.mem_insert] at hx hz
  rcases hx with rfl | hx
  · rcases hz with rfl | hz
    · exact G.loopless.irrefl _ hxz
    · exact hcross z hz hxz
  · rcases hz with rfl | hz
    · exact hcross x hx (G.symm.symm _ _ hxz)
    · exact hA x hx z hz hxz

lemma codeFinset_independent {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (k : Int)
    (A : ExtensionCode B roots k) :
    IsIndependent (componentExtension B roots) (codeFinset A) := by
  rcases A with A | A
  · exact isIndependent_oldLift B roots A.2.1
  rcases A with A | A
  · apply isIndependent_insert (componentExtension B roots)
      (isIndependent_oldLift B roots A.2.1)
    intro x hx
    cases x <;> simp_all [oldLift, oldEmbedding, componentExtension, extensionAdj]
  rcases A with A | A
  · apply isIndependent_insert (componentExtension B roots)
      (isIndependent_oldLift B roots A.2.1)
    intro x hx
    cases x <;> simp_all [oldLift, oldEmbedding, componentExtension, extensionAdj]
  rcases A with A | A
  · apply isIndependent_insert (componentExtension B roots)
      (isIndependent_rootFreeLift B roots A.2.1)
    intro x hx
    rcases Finset.mem_map.mp hx with ⟨x', hx', hxeq⟩
    subst x
    exact x'.2
  · apply isIndependent_insert (componentExtension B roots)
    · apply isIndependent_insert (componentExtension B roots)
        (isIndependent_rootFreeLift B roots A.2.1)
      intro x hx
      rcases Finset.mem_map.mp hx with ⟨x', hx', hxeq⟩
      subst x
      simp [rootFreeOldEmbedding, componentExtension, extensionAdj]
    · intro x hx
      simp only [Finset.mem_insert] at hx
      rcases hx with rfl | hx
      · simp [componentExtension, extensionAdj]
      · rcases Finset.mem_map.mp hx with ⟨x', hx', hxeq⟩
        subst x
        exact x'.2

lemma codeFinset_card {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (k : Int)
    (A : ExtensionCode B roots k) : ((codeFinset A).card : Int) = k := by
  rcases A with A | A
  · rcases A with ⟨A, hA, hcard⟩
    change ((oldLift A).card : Int) = k
    rw [card_oldLift]
    exact hcard
  rcases A with A | A
  · rcases A with ⟨A, hA, hcard⟩
    change ((insert (.s : ExtensionVertex V) (oldLift A)).card : Int) = k
    rw [Finset.card_insert_of_notMem (s_not_mem_oldLift A), card_oldLift]
    have := hcard
    omega
  rcases A with A | A
  · rcases A with ⟨A, hA, hcard⟩
    change ((insert (.v : ExtensionVertex V) (oldLift A)).card : Int) = k
    rw [Finset.card_insert_of_notMem (v_not_mem_oldLift A), card_oldLift]
    have := hcard
    omega
  rcases A with A | A
  · rcases A with ⟨A, hA, hcard⟩
    change ((insert (.y : ExtensionVertex V) (rootFreeLift roots A)).card : Int) = k
    rw [Finset.card_insert_of_notMem (y_not_mem_rootFreeLift roots A),
      card_rootFreeLift]
    have := hcard
    omega
  · rcases A with ⟨A, hA, hcard⟩
    change ((insert (.y : ExtensionVertex V)
      (insert .v (rootFreeLift roots A))).card : Int) = k
    rw [Finset.card_insert_of_notMem]
    · rw [Finset.card_insert_of_notMem (v_not_mem_rootFreeLift roots A),
        card_rootFreeLift]
      have := hcard
      omega
    · simp

noncomputable def codeToIndep {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (k : Int) :
    ExtensionCode B roots k → IndepFinsetAt (componentExtension B roots) k :=
  fun A => ⟨codeFinset A, codeFinset_independent B roots k A,
    codeFinset_card B roots k A⟩

lemma codeToIndep_surjective {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (k : Int) :
    Function.Surjective (codeToIndep B roots k) := by
  intro W
  by_cases hy : (ExtensionVertex.y : ExtensionVertex V) ∈ W.1
  · have hs : (ExtensionVertex.s : ExtensionVertex V) ∉ W.1 :=
      s_not_mem_of_y B roots W.2.1 hy
    have hfree : ∀ i, ExtensionVertex.old (roots i) ∉ W.1 :=
      root_not_mem_of_y B roots W.2.1 hy
    by_cases hv : (ExtensionVertex.v : ExtensionVertex V) ∈ W.1
    · let A := rootFreePart roots W.1
      have hrec : insert (.y : ExtensionVertex V)
          (insert .v (rootFreeLift roots A)) = W.1 := by
        ext x
        cases x with
        | old x =>
            simpa using rootFree_reconstruct roots W.1 hfree x
        | y => simp [hy]
        | s => simp [hs]
        | v => simp [hv]
      have hAcard : ((A.card : Nat) : Int) = k - 2 := by
        have hcards := congrArg Finset.card hrec
        have hWcard := W.2.2
        simp [A] at hcards
        dsimp [A]
        omega
      let A' : IndepFinsetAt (rootDeleted B roots) (k - 2) :=
        ⟨A, isIndependent_rootFreePart B roots W.2.1, hAcard⟩
      refine ⟨Sum.inr (Sum.inr (Sum.inr (Sum.inr A'))), ?_⟩
      apply Subtype.ext
      exact hrec
    · let A := rootFreePart roots W.1
      have hrec : insert (.y : ExtensionVertex V) (rootFreeLift roots A) = W.1 := by
        ext x
        cases x with
        | old x =>
            simpa using rootFree_reconstruct roots W.1 hfree x
        | y => simp [hy]
        | s => simp [hs]
        | v => simp [hv]
      have hAcard : ((A.card : Nat) : Int) = k - 1 := by
        have hcards := congrArg Finset.card hrec
        have hWcard := W.2.2
        simp [A] at hcards
        dsimp [A]
        omega
      let A' : IndepFinsetAt (rootDeleted B roots) (k - 1) :=
        ⟨A, isIndependent_rootFreePart B roots W.2.1, hAcard⟩
      refine ⟨Sum.inr (Sum.inr (Sum.inr (Sum.inl A'))), ?_⟩
      apply Subtype.ext
      exact hrec
  · by_cases hs : (ExtensionVertex.s : ExtensionVertex V) ∈ W.1
    · have hv : (ExtensionVertex.v : ExtensionVertex V) ∉ W.1 :=
        v_not_mem_of_s B roots W.2.1 hs
      let A := oldPart W.1
      have hrec : insert (.s : ExtensionVertex V) (oldLift A) = W.1 := by
        ext x
        cases x <;> simp_all [A]
      have hAcard : ((A.card : Nat) : Int) = k - 1 := by
        have hcards := congrArg Finset.card hrec
        have hWcard := W.2.2
        simp [A] at hcards
        dsimp [A]
        omega
      let A' : IndepFinsetAt B (k - 1) :=
        ⟨A, isIndependent_oldPart B roots W.2.1, hAcard⟩
      refine ⟨Sum.inr (Sum.inl A'), ?_⟩
      apply Subtype.ext
      exact hrec
    · by_cases hv : (ExtensionVertex.v : ExtensionVertex V) ∈ W.1
      · let A := oldPart W.1
        have hrec : insert (.v : ExtensionVertex V) (oldLift A) = W.1 := by
          ext x
          cases x <;> simp_all [A]
        have hAcard : ((A.card : Nat) : Int) = k - 1 := by
          have hcards := congrArg Finset.card hrec
          have hWcard := W.2.2
          simp [A] at hcards
          dsimp [A]
          omega
        let A' : IndepFinsetAt B (k - 1) :=
          ⟨A, isIndependent_oldPart B roots W.2.1, hAcard⟩
        refine ⟨Sum.inr (Sum.inr (Sum.inl A')), ?_⟩
        apply Subtype.ext
        exact hrec
      · let A := oldPart W.1
        have hrec : oldLift A = W.1 := old_reconstruct W.1 hy hs hv
        have hAcard : ((A.card : Nat) : Int) = k := by
          have hcards := congrArg Finset.card hrec
          have hWcard := W.2.2
          simp [A] at hcards
          dsimp [A]
          omega
        let A' : IndepFinsetAt B k :=
          ⟨A, isIndependent_oldPart B roots W.2.1, hAcard⟩
        refine ⟨Sum.inl A', ?_⟩
        apply Subtype.ext
        exact hrec

lemma codeToIndep_injective {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (k : Int) :
    Function.Injective (codeToIndep B roots k) := by
  intro A C h
  have hval : codeFinset A = codeFinset C := congrArg Subtype.val h
  rcases A with A | A
  · rcases C with C | C
    · have hAC : A = C := by
        apply Subtype.ext
        simpa [codeFinset] using congrArg oldPart hval
      subst C
      rfl
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.s : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.v : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.y : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    · have ht := congrArg (fun W => (ExtensionVertex.y : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
  rcases A with A | A
  · rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.s : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have hAC : A = C := by
        apply Subtype.ext
        simpa [codeFinset] using congrArg oldPart hval
      subst C
      rfl
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.s : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.s : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    · have ht := congrArg (fun W => (ExtensionVertex.s : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
  rcases A with A | A
  · rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.v : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.s : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have hAC : A = C := by
        apply Subtype.ext
        simpa [codeFinset] using congrArg oldPart hval
      subst C
      rfl
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.v : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    · have ht := congrArg (fun W => (ExtensionVertex.y : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
  rcases A with A | A
  · rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.y : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.y : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.y : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have hAC : A = C := by
        apply Subtype.ext
        simpa [codeFinset] using congrArg (rootFreePart roots) hval
      subst C
      rfl
    · have ht := congrArg (fun W => (ExtensionVertex.v : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
  · rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.y : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.y : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.y : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    rcases C with C | C
    · have ht := congrArg (fun W => (ExtensionVertex.v : ExtensionVertex V) ∈ W) hval
      simp [codeFinset] at ht
    · have hAC : A = C := by
        apply Subtype.ext
        simpa [codeFinset] using congrArg (rootFreePart roots) hval
      subst C
      rfl

noncomputable def extensionCodeEquiv {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (k : Int) :
    ExtensionCode B roots k ≃ IndepFinsetAt (componentExtension B roots) k :=
  Equiv.ofBijective (codeToIndep B roots k)
    ⟨codeToIndep_injective B roots k, codeToIndep_surjective B roots k⟩

lemma iCoeff_componentExtension {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (k : Int) :
    iCoeff (componentExtension B roots) k =
      iCoeff B k + 2 * iCoeff B (k - 1) +
        iCoeff (rootDeleted B roots) (k - 1) +
          iCoeff (rootDeleted B roots) (k - 2) := by
  unfold iCoeff
  norm_cast
  rw [← Fintype.card_congr (extensionCodeEquiv B roots k)]
  simp [ExtensionCode]
  ring_nf

lemma delta_componentExtension {I V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (c : Int) :
    delta (componentExtension B roots) c =
      iCoeff B (c + 1) + iCoeff B c - 2 * iCoeff B (c - 1) +
        iCoeff (rootDeleted B roots) c - iCoeff (rootDeleted B roots) (c - 2) := by
  rw [delta, iCoeff_componentExtension, iCoeff_componentExtension]
  ring

noncomputable def coeffNat {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (k : Nat) : Nat :=
  Fintype.card (IndepFinsetAt G (k : Int))

abbrev RootChoices (I : Type*) [Fintype I] [DecidableEq I] (k : Nat) :=
  ↥((Finset.univ : Finset I).powersetCard k)

def rootSet {I V : Type*} [DecidableEq V] (roots : I ↪ V) (A : Finset I) : Finset V :=
  A.map roots

lemma rootSet_isIndependent {I V : Type*} [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (A : Finset I) : IsIndependent B (rootSet roots A) := by
  intro x hx z hz hxz
  rcases Finset.mem_map.mp hx with ⟨i, hi, hix⟩
  rcases Finset.mem_map.mp hz with ⟨j, hj, hjz⟩
  subst x
  subst z
  have hij : i = j := by
    simpa [hroot] using hedge hxz
  subst j
  exact B.loopless.irrefl _ hxz

noncomputable def rootChoiceMap {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (k : Nat) : RootChoices I k → IndepFinsetAt B (k : Int) := fun A =>
  ⟨rootSet roots A.1, rootSet_isIndependent B roots component hroot hedge A.1, by
    have hcard : A.1.card = k := (Finset.mem_powersetCard.mp A.2).2
    simp [rootSet, hcard]⟩

lemma rootChoiceMap_injective {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (k : Nat) : Function.Injective (rootChoiceMap B roots component hroot hedge k) := by
  intro A C h
  apply Subtype.ext
  have hval := congrArg Subtype.val h
  exact Finset.map_injective roots hval

lemma root_choose_le_coeffNat {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (k : Nat) : (Fintype.card I).choose k ≤ coeffNat B k := by
  have hle := Fintype.card_le_of_injective
    (rootChoiceMap B roots component hroot hedge k)
    (rootChoiceMap_injective B roots component hroot hedge k)
  simpa [RootChoices, coeffNat, Finset.card_powersetCard] using hle

abbrev OneSource {I V : Type*} [Fintype I] [DecidableEq I]
    [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (component : V → I) (c : Nat) :=
  Σ S : IndepFinsetAt B ((c : Int) - 1), ↥(untouched component S.1)

abbrev PointedCoeff {V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (c : Nat) :=
  Σ W : IndepFinsetAt B (c : Int), ↥W.1

noncomputable def oneIncidenceMap {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (c : Nat) (_hc : 1 ≤ c) : OneSource B component c → PointedCoeff B c := fun P =>
  let S := P.1.1
  let i := P.2.1
  have hi : i ∈ untouched component S := P.2.2
  have hrootNot : roots i ∉ S := by
    intro hmem
    have : i ∈ S.image component := by
      rw [Finset.mem_image]
      exact ⟨roots i, hmem, hroot i⟩
    exact (Finset.mem_sdiff.mp hi).2 this
  have hcross : ∀ x ∈ S, ¬B.Adj (roots i) x := by
    intro x hx hadj
    have hsame := hedge hadj
    have hxi : component x = i := by simpa [hroot] using hsame.symm
    have : i ∈ S.image component := by
      rw [Finset.mem_image]
      exact ⟨x, hx, hxi⟩
    exact (Finset.mem_sdiff.mp hi).2 this
  let W : IndepFinsetAt B (c : Int) :=
    ⟨insert (roots i) S, isIndependent_insert B P.1.2.1 hcross, by
      rw [Finset.card_insert_of_notMem hrootNot]
      have := P.1.2.2
      dsimp [S]
      omega⟩
  ⟨W, ⟨roots i, by simp [W]⟩⟩

lemma root_not_mem_of_untouched {I V : Type*}
    [Fintype I] [DecidableEq I] [DecidableEq V]
    (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    {S : Finset V} {i : I} (hi : i ∈ untouched component S) : roots i ∉ S := by
  intro hmem
  have himage : i ∈ S.image component := by
    rw [Finset.mem_image]
    exact ⟨roots i, hmem, hroot i⟩
  exact (Finset.mem_sdiff.mp hi).2 himage

lemma oneIncidenceMap_injective {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (c : Nat) (hc : 1 ≤ c) :
    Function.Injective (oneIncidenceMap B roots component hroot hedge c hc) := by
  rintro ⟨S, i⟩ ⟨T, j⟩ h
  have hroots := congrArg (fun P => P.2.1) h
  simp only [oneIncidenceMap] at hroots
  have hij : i.1 = j.1 := roots.injective hroots
  have hsets := congrArg (fun P => P.1.1) h
  simp only [oneIncidenceMap] at hsets
  have hSval : S.1 = T.1 := by
    have hErase := congrArg (fun W : Finset V => W.erase (roots i.1)) hsets
    have hiNot := root_not_mem_of_untouched roots component hroot i.2
    have hjNot := root_not_mem_of_untouched roots component hroot j.2
    rw [Finset.erase_insert hiNot] at hErase
    rw [hij, Finset.erase_insert hjNot] at hErase
    exact hErase
  have hST : S = T := Subtype.ext hSval
  subst T
  have hij' : i = j := Subtype.ext hij
  subst j
  rfl

lemma card_untouched {I V : Type*} [Fintype I] [DecidableEq I]
    (component : V → I) (S : Finset V) :
    (untouched component S).card = Fintype.card I - (S.image component).card := by
  simp [untouched, Finset.card_sdiff]

lemma oneSource_card_lower {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (component : V → I) (c : Nat) (hc : 1 ≤ c)
    (hm : 3 * c - 1 ≤ Fintype.card I) :
    2 * c * coeffNat B (c - 1) ≤ Fintype.card (OneSource B component c) := by
  rw [Fintype.card_sigma]
  simp only [Fintype.card_coe]
  calc
    2 * c * coeffNat B (c - 1) =
        ∑ _ : IndepFinsetAt B ((c : Int) - 1), 2 * c := by
          have hidx : ((c - 1 : Nat) : Int) = (c : Int) - 1 := by omega
          simp [coeffNat, hidx, Nat.mul_comm, Nat.mul_left_comm]
    _ ≤ ∑ S : IndepFinsetAt B ((c : Int) - 1),
        (untouched component S.1).card := by
      apply Finset.sum_le_sum
      intro S hS
      rw [card_untouched]
      have himage := Finset.card_image_le (s := S.1) (f := component)
      have hcard : S.1.card = c - 1 := by
        have := S.2.2
        omega
      omega

lemma pointedCoeff_card {V : Type*} [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (c : Nat) :
    Fintype.card (PointedCoeff B c) = c * coeffNat B c := by
  rw [Fintype.card_sigma]
  simp only [Fintype.card_coe]
  calc
    ∑ W : IndepFinsetAt B (c : Int), W.1.card =
        ∑ _ : IndepFinsetAt B (c : Int), c := by
      apply Finset.sum_congr rfl
      intro W hW
      have := W.2.2
      omega
    _ = c * coeffNat B c := by simp [coeffNat, Nat.mul_comm]

lemma one_root_count {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (c : Nat) (hc : 1 ≤ c) (hm : 3 * c - 1 ≤ Fintype.card I) :
    2 * coeffNat B (c - 1) ≤ coeffNat B c := by
  have hInject := Fintype.card_le_of_injective
    (oneIncidenceMap B roots component hroot hedge c hc)
    (oneIncidenceMap_injective B roots component hroot hedge c hc)
  rw [pointedCoeff_card] at hInject
  have hLower := oneSource_card_lower B component c hc hm
  have hmul : c * (2 * coeffNat B (c - 1)) ≤ c * coeffNat B c := by
    have h := hLower.trans hInject
    simpa [Nat.mul_comm, Nat.mul_left_comm, Nat.mul_assoc] using h
  exact Nat.le_of_mul_le_mul_left hmul (by omega)

def rootFreeValEmbedding {I V : Type*} (roots : I ↪ V) : RootFree roots ↪ V :=
  Function.Embedding.subtype fun x : V => x ∉ Set.range roots

def rootFreeUnderlying {I V : Type*} [DecidableEq V]
    (roots : I ↪ V) (S : Finset (RootFree roots)) : Finset V :=
  S.map (rootFreeValEmbedding roots)

lemma rootSet_disjoint_rootFreeUnderlying {I V : Type*} [DecidableEq V]
    (roots : I ↪ V) (A : Finset I) (S : Finset (RootFree roots)) :
    Disjoint (rootSet roots A) (rootFreeUnderlying roots S) := by
  rw [Finset.disjoint_left]
  intro x hxA hxS
  rcases Finset.mem_map.mp hxA with ⟨i, hi, hix⟩
  rcases Finset.mem_map.mp hxS with ⟨z, hz, hzx⟩
  subst x
  apply z.2
  exact ⟨i, hzx.symm⟩

lemma rootFreeUnderlying_isIndependent {I V : Type*} [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) {S : Finset (RootFree roots)}
    (hS : IsIndependent (rootDeleted B roots) S) :
    IsIndependent B (rootFreeUnderlying roots S) := by
  intro x hx z hz hxz
  rcases Finset.mem_map.mp hx with ⟨x', hx', hxeq⟩
  rcases Finset.mem_map.mp hz with ⟨z', hz', hzeq⟩
  subst x
  subst z
  exact hS x' hx' z' hz' hxz

lemma isIndependent_union {V : Type*} [DecidableEq V] (G : SimpleGraph V)
    {A C : Finset V} (hA : IsIndependent G A) (hC : IsIndependent G C)
    (hcross : ∀ x ∈ A, ∀ z ∈ C, ¬G.Adj x z) : IsIndependent G (A ∪ C) := by
  intro x hx z hz hxz
  simp only [Finset.mem_union] at hx hz
  rcases hx with hx | hx
  · rcases hz with hz | hz
    · exact hA x hx z hz hxz
    · exact hcross x hx z hz hxz
  · rcases hz with hz | hz
    · exact hcross z hz x hx (G.symm.symm _ _ hxz)
    · exact hC x hx z hz hxz

abbrev ThreeSource {I V : Type*} [Fintype I] [DecidableEq I]
    [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I) (c : Nat) :=
  Σ S : IndepFinsetAt (rootDeleted B roots) ((c : Int) - 2),
    ↥((rootFreeUntouched roots component S.1).powersetCard 3)

def threeSet {I V : Type*} [DecidableEq V]
    (roots : I ↪ V) (S : Finset (RootFree roots)) (A : Finset I) : Finset V :=
  rootSet roots A ∪ rootFreeUnderlying roots S

noncomputable def threeRootMap {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (c : Nat) (_hc : 2 ≤ c) : ThreeSource B roots component c →
      IndepFinsetAt B ((c : Int) + 1) := fun P =>
  let S := P.1.1
  let A := P.2.1
  have hAsub : A ⊆ rootFreeUntouched roots component S :=
    (Finset.mem_powersetCard.mp P.2.2).1
  have hcross : ∀ x ∈ rootSet roots A, ∀ z ∈ rootFreeUnderlying roots S,
      ¬B.Adj x z := by
    intro x hx z hz hxz
    rcases Finset.mem_map.mp hx with ⟨i, hiA, hix⟩
    rcases Finset.mem_map.mp hz with ⟨z', hzS, hzx⟩
    subst x
    subst z
    have hiU := hAsub hiA
    change B.Adj (roots i) z'.1 at hxz
    have hsame := hedge hxz
    have hzi : component z'.1 = i := by simpa [hroot] using hsame.symm
    have hiImage : i ∈ S.image (fun q => component q.1) := by
      rw [Finset.mem_image]
      exact ⟨z', hzS, hzi⟩
    exact (Finset.mem_sdiff.mp hiU).2 hiImage
  ⟨threeSet roots S A,
    isIndependent_union B
      (rootSet_isIndependent B roots component hroot hedge A)
      (rootFreeUnderlying_isIndependent B roots P.1.2.1) hcross,
    by
      have hdisj := rootSet_disjoint_rootFreeUnderlying roots A S
      rw [threeSet, Finset.card_union_of_disjoint hdisj]
      have hAcard : A.card = 3 := (Finset.mem_powersetCard.mp P.2.2).2
      have hScard := P.1.2.2
      simp [rootSet, rootFreeUnderlying, hAcard]
      dsimp [S, A]
      omega⟩

lemma threeRootMap_injective {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (c : Nat) (hc : 2 ≤ c) :
    Function.Injective (threeRootMap B roots component hroot hedge c hc) := by
  rintro ⟨S, A⟩ ⟨T, C⟩ h
  have hsets := congrArg Subtype.val h
  simp only [threeRootMap] at hsets
  have hSval : S.1 = T.1 := by
    ext x
    have hx := congrArg (fun W : Finset V => x.1 ∈ W) hsets
    have hxA : x.1 ∉ rootSet roots A.1 := by
      intro hxRoot
      rcases Finset.mem_map.mp hxRoot with ⟨i, hi, hEq⟩
      apply x.2
      exact ⟨i, hEq⟩
    have hxC : x.1 ∉ rootSet roots C.1 := by
      intro hxRoot
      rcases Finset.mem_map.mp hxRoot with ⟨i, hi, hEq⟩
      apply x.2
      exact ⟨i, hEq⟩
    have hxNo : ∀ i, roots i ≠ x.1 := by
      intro i hEq
      exact x.2 ⟨i, hEq⟩
    simpa [threeSet, hxA, hxC, rootFreeUnderlying, rootFreeValEmbedding,
      hxNo] using hx
  have hST : S = T := Subtype.ext hSval
  subst T
  have hAval : A.1 = C.1 := by
    ext i
    have hi := congrArg (fun W : Finset V => roots i ∈ W) hsets
    have hiFree : roots i ∉ rootFreeUnderlying roots S.1 := by
      intro hiUnder
      rcases Finset.mem_map.mp hiUnder with ⟨z, hz, hEq⟩
      apply z.2
      exact ⟨i, hEq.symm⟩
    simpa [threeSet, rootSet, hiFree] using hi
  have hAC : A = C := Subtype.ext hAval
  subst C
  rfl

lemma card_rootFreeUntouched {I V : Type*} [Fintype I] [DecidableEq I]
    (roots : I ↪ V) (component : V → I) (S : Finset (RootFree roots)) :
    (rootFreeUntouched roots component S).card =
      Fintype.card I - (S.image (fun x => component x.1)).card := by
  simp [rootFreeUntouched, Finset.card_sdiff]

lemma threeSource_card_lower {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (c : Nat) (hc : 2 ≤ c) (hm : 3 * c - 1 ≤ Fintype.card I) :
    2 * coeffNat (rootDeleted B roots) (c - 2) ≤
      Fintype.card (ThreeSource B roots component c) := by
  rw [Fintype.card_sigma]
  simp only [Fintype.card_coe, Finset.card_powersetCard]
  calc
    2 * coeffNat (rootDeleted B roots) (c - 2) =
        ∑ _ : IndepFinsetAt (rootDeleted B roots) ((c : Int) - 2), 2 := by
      have hidx : ((c - 2 : Nat) : Int) = (c : Int) - 2 := by omega
      simp [coeffNat, hidx, Nat.mul_comm]
    _ ≤ ∑ S : IndepFinsetAt (rootDeleted B roots) ((c : Int) - 2),
        (rootFreeUntouched roots component S.1).card.choose 3 := by
      apply Finset.sum_le_sum
      intro S hS
      have hScard : S.1.card = c - 2 := by
        have := S.2.2
        omega
      have himage := Finset.card_image_le
        (s := S.1) (f := fun x : RootFree roots => component x.1)
      have hU : 5 ≤ (rootFreeUntouched roots component S.1).card := by
        rw [card_rootFreeUntouched]
        omega
      have hchoose := Nat.choose_le_choose 3 hU
      exact (by decide : 2 ≤ Nat.choose 5 3).trans hchoose

lemma three_root_strict_of_pos {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (c : Nat) (hc : 2 ≤ c) (hm : 3 * c - 1 ≤ Fintype.card I)
    (hdpos : 0 < coeffNat (rootDeleted B roots) (c - 2)) :
    coeffNat (rootDeleted B roots) (c - 2) < coeffNat B (c + 1) := by
  have hInject := Fintype.card_le_of_injective
    (threeRootMap B roots component hroot hedge c hc)
    (threeRootMap_injective B roots component hroot hedge c hc)
  have hLower := threeSource_card_lower B roots component c hc hm
  have htwo : 2 * coeffNat (rootDeleted B roots) (c - 2) ≤ coeffNat B (c + 1) := by
    apply hLower.trans
    simpa [coeffNat] using hInject
  omega

lemma iCoeff_neg {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) {k : Int} (hk : k < 0) : iCoeff G k = 0 := by
  unfold iCoeff
  norm_cast
  rw [Fintype.card_eq_zero_iff]
  exact ⟨fun S => by have := S.2.2; omega⟩

@[simp] lemma iCoeff_zero {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) : iCoeff G 0 = 1 := by
  unfold iCoeff
  norm_cast
  rw [Fintype.card_eq_one_iff]
  refine ⟨⟨∅, ?_, by simp⟩, ?_⟩
  · simp [IsIndependent]
  · intro S
    apply Subtype.ext
    have hcard : S.1.card = 0 := by exact_mod_cast S.2.2
    exact Finset.card_eq_zero.mp hcard

lemma iCoeff_nonneg {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (k : Int) : 0 ≤ iCoeff G k := by
  unfold iCoeff
  positivity

@[simp] lemma iCoeff_nat {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (k : Nat) : iCoeff G (k : Int) = coeffNat G k := rfl

lemma delta_componentExtension_zero_pos {I V : Type*}
    [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) :
    0 < delta (componentExtension B roots) 0 := by
  rw [delta_componentExtension]
  norm_num
  rw [iCoeff_neg B (by norm_num : (-1 : Int) < 0)]
  rw [iCoeff_neg (rootDeleted B roots) (by norm_num : (-2 : Int) < 0)]
  have hb := iCoeff_nonneg B 1
  omega

lemma delta_componentExtension_one_pos {I V : Type*}
    [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x z⦄, B.Adj x z → component x = component z)
    (hm : 2 ≤ Fintype.card I) :
    0 < delta (componentExtension B roots) 1 := by
  have hb1Nat := root_choose_le_coeffNat B roots component hroot hedge 1
  have hb2Nat := root_choose_le_coeffNat B roots component hroot hedge 2
  have hchoose2 : 0 < (Fintype.card I).choose 2 := Nat.choose_pos hm
  have hb1Nat' : Fintype.card I ≤ coeffNat B 1 := by simpa using hb1Nat
  have hb1 : (2 : Int) ≤ iCoeff B 1 := by
    change (2 : Int) ≤ (coeffNat B 1 : Int)
    exact_mod_cast hm.trans hb1Nat'
  have hb2 : (1 : Int) ≤ iCoeff B 2 := by
    change (1 : Int) ≤ (coeffNat B 2 : Int)
    exact_mod_cast (hchoose2.trans_le hb2Nat)
  have hd1 := iCoeff_nonneg (rootDeleted B roots) 1
  rw [delta_componentExtension]
  norm_num
  rw [iCoeff_neg (rootDeleted B roots) (by norm_num : (-1 : Int) < 0)]
  omega
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN theorem Erdos993BetaC8.componentExtension_delta_nonpos_bounds 6ba4bcf10d07cbfdae33a62c2ded4c35ec85de5dc4e996857ad3dabdc915704a
theorem componentExtension_delta_nonpos_bounds {I V : Type*} [Fintype I] [DecidableEq I] [Fintype V] [DecidableEq V]
    (B : SimpleGraph V) (roots : I ↪ V) (component : V → I)
    (hroot : ∀ i, component (roots i) = i)
    (hedge : ∀ ⦃x y⦄, B.Adj x y → component x = component y)
    (c : ℕ)
    (hDelta : delta (componentExtension B roots) (c : ℤ) ≤ 0) :
    1 ≤ c ∧ Fintype.card I ≤ 3 * c - 2 := by
  have hc : 1 ≤ c := by
    by_contra h
    have hc0 : c = 0 := by omega
    subst c
    have hpos : 0 < delta (componentExtension B roots) ((0 : Nat) : Int) := by
      simpa using delta_componentExtension_zero_pos B roots
    omega
  refine ⟨hc, ?_⟩
  by_contra hbound
  have hm : 3 * c - 1 ≤ Fintype.card I := by omega
  by_cases hc1 : c = 1
  · subst c
    have hpos : 0 < delta (componentExtension B roots) ((1 : Nat) : Int) := by
      simpa using delta_componentExtension_one_pos B roots component hroot hedge (by omega)
    omega
  · have hc2 : 2 ≤ c := by omega
    have hbcNat := one_root_count B roots component hroot hedge c hc hm
    have hstrictNat : coeffNat (rootDeleted B roots) (c - 2) < coeffNat B (c + 1) := by
      by_cases hd : coeffNat (rootDeleted B roots) (c - 2) = 0
      · have hrootCount := root_choose_le_coeffNat B roots component hroot hedge (c + 1)
        have hchoose : 0 < (Fintype.card I).choose (c + 1) :=
          Nat.choose_pos (by omega)
        omega
      · exact three_root_strict_of_pos B roots component hroot hedge c hc2 hm
          (Nat.pos_of_ne_zero hd)
    have hbc : (2 : Int) * coeffNat B (c - 1) ≤ coeffNat B c := by
      exact_mod_cast hbcNat
    have hstrict : (coeffNat (rootDeleted B roots) (c - 2) : Int) <
        coeffNat B (c + 1) := by
      exact_mod_cast hstrictNat
    have hp1 : (c : Int) + 1 = ((c + 1 : Nat) : Int) := by omega
    have hm1 : (c : Int) - 1 = ((c - 1 : Nat) : Int) := by omega
    have hm2 : (c : Int) - 2 = ((c - 2 : Nat) : Int) := by omega
    have hpos : 0 < delta (componentExtension B roots) (c : Int) := by
      rw [delta_componentExtension, hp1, hm1, hm2]
      simp only [iCoeff_nat]
      omega
    omega

end Erdos993BetaC8
-- VERITYOS ENTRY 3 END

