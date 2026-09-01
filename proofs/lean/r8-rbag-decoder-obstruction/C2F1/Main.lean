import Mathlib

/-!
Cycle 2 candidate C2-F1.

This file formalizes only the exact five-label collision for `R_bag` nominated
by Stage 6.  It does not make a claim about stronger leaf-addressed states,
M2, M3, PAIR-G4, or any headline target.
-/

namespace C2F1

/-- The common inherited label type of the two witness trees. -/
inductive Label
  | a | b | c | d | e
  deriving DecidableEq, Fintype, Repr

/-- A finite labelled simple graph with executable Boolean adjacency. -/
structure FiniteSimpleGraph (V : Type*) where
  adj : V -> V -> Bool
  adj_symm : forall u v, adj u v = adj v u
  loopless : forall v, adj v v = false

namespace FiniteSimpleGraph

/-- The corresponding Mathlib simple graph. -/
def toSimpleGraph {V : Type*} (G : FiniteSimpleGraph V) : SimpleGraph V :=
  SimpleGraph.mk' <| ⟨G.adj, G.adj_symm, fun v hv => by
    change G.adj v v = true at hv
    rw [G.loopless v] at hv
    contradiction⟩

instance {V : Type*} (G : FiniteSimpleGraph V) : DecidableRel G.toSimpleGraph.Adj :=
  fun u v => by
    change Decidable (G.adj u v = true)
    infer_instance

/-- Induced deletion on the inherited subtype of labels other than `v`. -/
def deleteVertex {V : Type*} [DecidableEq V] (G : FiniteSimpleGraph V) (v : V) :
    FiniteSimpleGraph {w : V // w ≠ v} where
  adj u w := G.adj u.1 w.1
  adj_symm u w := G.adj_symm u.1 w.1
  loopless w := G.loopless w.1

/-- Executable independent-set predicate. -/
def independent {V : Type*} [DecidableEq V] (G : FiniteSimpleGraph V) (S : Finset V) : Bool :=
  decide (((S.product S).filter fun uv => G.adj uv.1 uv.2).card = 0)

/-- The frozen extension count of an independent set. -/
def extensionCount {V : Type*} [Fintype V] [DecidableEq V]
    (G : FiniteSimpleGraph V) (S : Finset V) : Nat :=
  ((Finset.univ : Finset V).filter fun v =>
    decide (v ∉ S) && independent G (insert v S)).card

abbrev Profile := Multiset (Nat × Nat)

/-- One coefficient-table term at `(rank, extensionCount)`. -/
def profileTerm (rank extensionCount coefficient : Nat) : Profile :=
  coefficient • {(rank, extensionCount)}

/-- The exact bivariate extension profile, encoded by its finite coefficient table. -/
def extensionProfile {V : Type*} [Fintype V] [DecidableEq V]
    (G : FiniteSimpleGraph V) : Profile :=
  (((Finset.univ : Finset V).powerset.filter fun S => independent G S).val.map fun S =>
    (S.card, extensionCount G S))

/-- Canonical conversion of the coefficient table to frozen `Int[x,y]`. -/
noncomputable def profilePolynomial (Q : Profile) : Polynomial (Polynomial Int) :=
  (Q.map fun re => Polynomial.monomial re.1 (Polynomial.monomial re.2 (1 : Int))).sum

/-- Coefficient tables and the frozen bivariate polynomials carry exactly the same data. -/
theorem profilePolynomial_coeff (Q : Profile) (rank extensionCount : Nat) :
    ((profilePolynomial Q).coeff rank).coeff extensionCount =
      (Q.count (rank, extensionCount) : Int) := by
  induction Q using Multiset.induction_on with
  | empty => simp [profilePolynomial]
  | @cons re Q ih =>
      rcases re with ⟨reRank, reExtension⟩
      simp only [profilePolynomial] at ih
      by_cases hr : reRank = rank
      · subst reRank
        by_cases he : reExtension = extensionCount
        · subst reExtension
          simp [profilePolynomial, ih, add_comm]
        · simp [profilePolynomial, ih, Ne.symm he]
          exact Polynomial.coeff_monomial_of_ne (1 : Int) (Ne.symm he)
      · simp [profilePolynomial, ih, Ne.symm hr]
        have hzero :
            (Polynomial.monomial reRank
              (Polynomial.monomial reExtension (1 : Int))).coeff rank = 0 :=
          Polynomial.coeff_monomial_of_ne _ (Ne.symm hr)
        rw [hzero]
        simp

theorem profilePolynomial_injective : Function.Injective profilePolynomial := by
  intro Q R h
  apply (Multiset.ext).2
  intro re
  have hc := congrArg
    (fun P : Polynomial (Polynomial Int) => (P.coeff re.1).coeff re.2) h
  rw [profilePolynomial_coeff, profilePolynomial_coeff] at hc
  exact Int.ofNat_inj.mp hc

/-- The frozen independence count at a nonnegative rank. -/
def independenceCount {V : Type*} [Fintype V] [DecidableEq V]
    (G : FiniteSimpleGraph V) (rank : Nat) : Nat :=
  ((Finset.univ : Finset V).powerset.filter fun S =>
    independent G S && decide (S.card = rank)).card

/-- `Delta_rank = i_(rank+1) - i_rank` at the two natural ranks used here. -/
def delta {V : Type*} [Fintype V] [DecidableEq V]
    (G : FiniteSimpleGraph V) (rank : Nat) : Int :=
  (independenceCount G (rank + 1) : Int) - independenceCount G rank

def degree {V : Type*} [Fintype V] [DecidableEq V]
    (G : FiniteSimpleGraph V) (v : V) : Nat :=
  ((Finset.univ : Finset V).filter fun w => G.adj v w).card

/-- The typed original-leaf set. -/
def leaves {V : Type*} [Fintype V] [DecidableEq V]
    (G : FiniteSimpleGraph V) : Finset V :=
  (Finset.univ : Finset V).filter fun v => decide (degree G v = 1)

end FiniteSimpleGraph

open FiniteSimpleGraph

/-- Adjacency of `T`, with edges `{ca, cb, cd, de}`. -/
def tAdj : Label -> Label -> Bool
  | .c, .a | .a, .c
  | .c, .b | .b, .c
  | .c, .d | .d, .c
  | .d, .e | .e, .d => true
  | _, _ => false

/-- Adjacency of `T'`, with edges `{ce, cb, cd, da}`. -/
def tPrimeAdj : Label -> Label -> Bool
  | .c, .e | .e, .c
  | .c, .b | .b, .c
  | .c, .d | .d, .c
  | .d, .a | .a, .d => true
  | _, _ => false

def T : FiniteSimpleGraph Label where
  adj := tAdj
  adj_symm := by decide
  loopless := by decide

def TPrime : FiniteSimpleGraph Label where
  adj := tPrimeAdj
  adj_symm := by decide
  loopless := by decide

/-- A fresh-leaf attachment is recorded as `(newLabel, existingParent)`. -/
abbrev Attachment := Label × Label

def historyValidFrom : Finset Label -> List Attachment -> Bool
  | _, [] => true
  | active, (newLabel, parent) :: rest =>
      decide (newLabel ∉ active) && decide (parent ∈ active) &&
        historyValidFrom (insert newLabel active) rest

def activeAfter (root : Label) (steps : List Attachment) : Finset Label :=
  steps.foldl (fun active step => insert step.1 active) {root}

def historyAdj (steps : List Attachment) (u v : Label) : Bool :=
  steps.any fun step =>
    (decide (u = step.1) && decide (v = step.2)) ||
      (decide (u = step.2) && decide (v = step.1))

def historyMatches (G : FiniteSimpleGraph Label) (steps : List Attachment) : Bool :=
  decide ((((Finset.univ : Finset Label).product Finset.univ).filter fun uv =>
    decide (G.adj uv.1 uv.2 ≠ historyAdj steps uv.1 uv.2)).card = 0)

/-- Exact fixed-carrier certificate for construction by successive fresh-leaf attachments. -/
def ReachableByFreshLeaves (G : FiniteSimpleGraph Label) (root : Label)
    (steps : List Attachment) : Prop :=
  historyValidFrom {root} steps = true ∧
    activeAfter root steps = Finset.univ ∧
    historyMatches G steps = true

def tHistory : List Attachment :=
  [(.a, .c), (.b, .c), (.d, .c), (.e, .d)]

def tPrimeHistory : List Attachment :=
  [(.e, .c), (.b, .c), (.d, .c), (.a, .d)]

theorem T_reachable : ReachableByFreshLeaves T .c tHistory := by
  unfold ReachableByFreshLeaves
  constructor
  · decide
  constructor <;> decide

theorem TPrime_reachable : ReachableByFreshLeaves TPrime .c tPrimeHistory := by
  unfold ReachableByFreshLeaves
  constructor
  · decide
  constructor <;> decide

/-- Both witnesses are actual trees in Mathlib's connected-acyclic sense. -/
theorem T_isTree : T.toSimpleGraph.IsTree := by
  apply (SimpleGraph.isTree_iff_connected_and_card).2
  constructor
  · decide
  · simpa only [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card] using
      (show T.toSimpleGraph.edgeFinset.card + 1 = Fintype.card Label by decide)

theorem TPrime_isTree : TPrime.toSimpleGraph.IsTree := by
  apply (SimpleGraph.isTree_iff_connected_and_card).2
  constructor
  · decide
  · simpa only [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card] using
      (show TPrime.toSimpleGraph.edgeFinset.card + 1 = Fintype.card Label by decide)

/-- The two deletion-profile values appearing in the collision. -/
def p4Profile : Profile :=
  profileTerm 0 4 1 + profileTerm 1 2 2 + profileTerm 1 1 2 + profileTerm 2 0 3

def k13Profile : Profile :=
  profileTerm 0 4 1 + profileTerm 1 0 1 + profileTerm 1 2 3 +
    profileTerm 2 1 3 + profileTerm 3 0 1

theorem deletion_profile_table :
    extensionProfile (T.deleteVertex .a) = p4Profile ∧
    extensionProfile (T.deleteVertex .b) = p4Profile ∧
    extensionProfile (T.deleteVertex .e) = k13Profile ∧
    extensionProfile (TPrime.deleteVertex .a) = k13Profile ∧
    extensionProfile (TPrime.deleteVertex .b) = p4Profile ∧
    extensionProfile (TPrime.deleteVertex .e) = p4Profile := by
  decide

/-- The executable multiset encoding of the frozen multiplicity function `mu_T`. -/
def deletionProfileBag (G : FiniteSimpleGraph Label) : Multiset Profile :=
  (leaves G).val.map fun v => extensionProfile (G.deleteVertex v)

/-- The exact multiplicity function represented by `deletionProfileBag`. -/
noncomputable def deletionMultiplicity (G : FiniteSimpleGraph Label) : Profile →₀ Nat :=
  (deletionProfileBag G).toFinsupp

theorem deletionProfileBag_eq_iff_multiplicity_eq (G H : FiniteSimpleGraph Label) :
    deletionProfileBag G = deletionProfileBag H ↔
      deletionMultiplicity G = deletionMultiplicity H := by
  exact Multiset.toFinsupp.injective.eq_iff.symm

/-- Exact `R_bag`: root, typed leaves, full profile, root-deletion profile, and profile bag. -/
@[ext]
structure RBag where
  root : Label
  leafSet : Finset Label
  fullProfile : Profile
  rootDeletionProfile : Profile
  deletionProfiles : Multiset Profile
  deriving DecidableEq

def rBag (G : FiniteSimpleGraph Label) (root : Label) : RBag where
  root := root
  leafSet := leaves G
  fullProfile := extensionProfile G
  rootDeletionProfile := extensionProfile (G.deleteVertex root)
  deletionProfiles := deletionProfileBag G

theorem witness_leaf_sets :
    leaves T = {.a, .b, .e} ∧ leaves TPrime = {.a, .b, .e} := by
  decide

theorem witness_full_profiles_equal :
    extensionProfile T = extensionProfile TPrime := by
  decide

theorem witness_root_deletion_profiles_equal :
    extensionProfile (T.deleteVertex .c) = extensionProfile (TPrime.deleteVertex .c) := by
  decide

theorem witness_deletion_profile_bags_equal :
    deletionProfileBag T = deletionProfileBag TPrime := by
  decide

/-- Literal equality of every coordinate of the exact `R_bag` state. -/
theorem rBag_collision : rBag T .c = rBag TPrime .c := by
  apply RBag.ext
  · rfl
  · exact witness_leaf_sets.1.trans witness_leaf_sets.2.symm
  · exact witness_full_profiles_equal
  · exact witness_root_deletion_profiles_equal
  · exact witness_deletion_profile_bags_equal

/-- The marker output is `(Delta_2(G-v), Delta_3(G-v))`. -/
def markerEndpoint (G : FiniteSimpleGraph Label) (v : Label) : Int × Int :=
  (delta (G.deleteVertex v) 2, delta (G.deleteVertex v) 3)

theorem marker_a_output_T : markerEndpoint T .a = (-3, 0) := by
  decide

theorem marker_a_output_TPrime : markerEndpoint TPrime .a = (-2, -1) := by
  decide

theorem marker_a_outputs_differ : markerEndpoint T .a ≠ markerEndpoint TPrime .a := by
  decide

/-- Correctness specification for a universal exact rank-(2,3) endpoint decoder. -/
def UniversalEndpointDecoder (D : RBag -> Label -> Int × Int) : Prop :=
  forall (G : FiniteSimpleGraph Label) (root v : Label),
    G.toSimpleGraph.IsTree -> v ∈ leaves G ->
      D (rBag G root) v = markerEndpoint G v

/-- The exact Stage 6 nominee: no universal endpoint decoder exists for exact `R_bag`. -/
theorem no_universal_endpoint_decoder_exact_rBag :
    ¬ (∃ D : RBag -> Label -> Int × Int, UniversalEndpointDecoder D) := by
  rintro ⟨D, hD⟩
  have hT := hD T .c .a T_isTree (by decide)
  have hTPrime := hD TPrime .c .a TPrime_isTree (by decide)
  have hsame : D (rBag T .c) .a = D (rBag TPrime .c) .a :=
    congrArg (fun state => D state .a) rBag_collision
  have houtputs : markerEndpoint T .a = markerEndpoint TPrime .a := by
    calc
      markerEndpoint T .a = D (rBag T .c) .a := hT.symm
      _ = D (rBag TPrime .c) .a := hsame
      _ = markerEndpoint TPrime .a := hTPrime
  exact marker_a_outputs_differ houtputs

#print axioms C2F1.no_universal_endpoint_decoder_exact_rBag

end C2F1
