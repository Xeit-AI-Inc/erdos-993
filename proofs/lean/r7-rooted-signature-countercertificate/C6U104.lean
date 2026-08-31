import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Combinatorics.SimpleGraph.Connectivity.Finite
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Tactic

namespace C6U104

open Finset

abbrev Vertex := Fin 10

/-- The undirected edge with endpoints `a` and `b`, as a transparent Boolean relation. -/
def edgePairB (a b u v : Vertex) : Bool :=
  (u == a && v == b) || (u == b && v == a)

/-- Exactly the edges `01,12,23,34,45,56,67,78,59`. -/
def plusAdjB (u v : Vertex) : Bool :=
  edgePairB 0 1 u v ||
  edgePairB 1 2 u v ||
  edgePairB 2 3 u v ||
  edgePairB 3 4 u v ||
  edgePairB 4 5 u v ||
  edgePairB 5 6 u v ||
  edgePairB 6 7 u v ||
  edgePairB 7 8 u v ||
  edgePairB 5 9 u v

/-- Exactly the edges `01,12,23,34,45,56,67,78,49`. -/
def zeroAdjB (u v : Vertex) : Bool :=
  edgePairB 0 1 u v ||
  edgePairB 1 2 u v ||
  edgePairB 2 3 u v ||
  edgePairB 3 4 u v ||
  edgePairB 4 5 u v ||
  edgePairB 5 6 u v ||
  edgePairB 6 7 u v ||
  edgePairB 7 8 u v ||
  edgePairB 4 9 u v

/-- The explicit `T_plus` graph on `Fin 10`. -/
def TPlus : SimpleGraph Vertex :=
  SimpleGraph.mk' ⟨plusAdjB, by decide⟩

/-- The explicit `T_zero` graph on `Fin 10`. -/
def TZero : SimpleGraph Vertex :=
  SimpleGraph.mk' ⟨zeroAdjB, by decide⟩

instance : DecidableRel TPlus.Adj := by
  intro u v
  exact inferInstanceAs (Decidable (plusAdjB u v = true))

instance : DecidableRel TZero.Adj := by
  intro u v
  exact inferInstanceAs (Decidable (zeroAdjB u v = true))

theorem TPlus_adj_iff (u v : Vertex) : TPlus.Adj u v ↔ plusAdjB u v = true := Iff.rfl

theorem TZero_adj_iff (u v : Vertex) : TZero.Adj u v ↔ zeroAdjB u v = true := Iff.rfl

theorem TPlus_connected : TPlus.Connected := by decide

theorem TZero_connected : TZero.Connected := by decide

theorem TPlus_edge_count : TPlus.edgeFinset.card = 9 := by decide

theorem TZero_edge_count : TZero.edgeFinset.card = 9 := by decide

theorem TPlus_isTree : TPlus.IsTree := by
  rw [SimpleGraph.isTree_iff_connected_and_card]
  refine ⟨TPlus_connected, ?_⟩
  rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card,
    Nat.card_eq_fintype_card, TPlus_edge_count]
  decide

theorem TZero_isTree : TZero.IsTree := by
  rw [SimpleGraph.isTree_iff_connected_and_card]
  refine ⟨TZero_connected, ?_⟩
  rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card,
    Nat.card_eq_fintype_card, TZero_edge_count]
  decide

theorem TPlus_isAcyclic : TPlus.IsAcyclic := TPlus_isTree.isAcyclic

theorem TZero_isAcyclic : TZero.IsAcyclic := TZero_isTree.isAcyclic

/-- The direct graph-theoretic predicate that no two members of `s` are adjacent. -/
def IsIndependent {V : Type*} (G : SimpleGraph V) (s : Finset V) : Prop :=
  ∀ u ∈ s, ∀ v ∈ s, ¬G.Adj u v

/-- A transparent decision procedure for the direct independence predicate. -/
def isIndependentB {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (s : Finset V) : Bool :=
  decide (∀ u ∈ s, ∀ v ∈ s, ¬G.Adj u v)

theorem isIndependentB_eq_true_iff {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (s : Finset V) :
    isIndependentB G s = true ↔ IsIndependent G s := by
  simp [isIndependentB, IsIndependent]

theorem isIndependent_iff_isIndepSet {V : Type*} (G : SimpleGraph V) (s : Finset V) :
    IsIndependent G s ↔ G.IsIndepSet (s : Set V) := by
  constructor
  · intro h u hu v hv _
    exact h u hu v hv
  · intro h u hu v hv
    by_cases huv : u = v
    · subst v
      exact G.loopless.irrefl u
    · exact h hu hv huv

/-- All actual independent vertex sets of cardinality `k`. -/
def independentSetsOfCard {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (k : Nat) : Finset (Finset V) :=
  univ.powerset.filter fun s =>
    (decide (s.card = k) && isIndependentB G s) = true

theorem mem_independentSetsOfCard_iff {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (s : Finset V) (k : Nat) :
    s ∈ independentSetsOfCard G k ↔ s.card = k ∧ G.IsIndepSet (s : Set V) := by
  simp [independentSetsOfCard, isIndependentB_eq_true_iff,
    isIndependent_iff_isIndepSet]

/-- The actual number `i_k(G)` of independent `k`-sets. -/
def independentSetCount {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (k : Nat) : Nat :=
  (independentSetsOfCard G k).card

/-- Actual independent `k`-sets that exclude the designated root. -/
def excludedRootCount {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (root : V) (k : Nat) : Nat :=
  ((independentSetsOfCard G k).filter fun s => decide (root ∉ s) = true).card

/-- Actual independent `k`-sets that include the designated root. -/
def includedRootCount {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (root : V) (k : Nat) : Nat :=
  ((independentSetsOfCard G k).filter fun s => decide (root ∈ s) = true).card

/-- The excluded-root and included-root independent-set counts through degree five. -/
abbrev Sigma5 := (Fin 6 → Nat) × (Fin 6 → Nat)

def sigma5 {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (root : V) : Sigma5 :=
  (fun k => excludedRootCount G root k, fun k => includedRootCount G root k)

def expectedSigma5 : Sigma5 :=
  (![1, 9, 28, 36, 18, 3], ![0, 1, 8, 21, 21, 7])

set_option maxRecDepth 100000

theorem TPlus_sigma5_exact : sigma5 TPlus 0 = expectedSigma5 := by
  apply Prod.ext
  · funext k
    fin_cases k <;> decide
  · funext k
    fin_cases k <;> decide

theorem TZero_sigma5_exact : sigma5 TZero 0 = expectedSigma5 := by
  apply Prod.ext
  · funext k
    fin_cases k <;> decide
  · funext k
    fin_cases k <;> decide

theorem sigma5_equal : sigma5 TPlus 0 = sigma5 TZero 0 := by
  rw [TPlus_sigma5_exact, TZero_sigma5_exact]

theorem TPlus_i6_exact : independentSetCount TPlus 6 = 1 := by decide

theorem TZero_i6_exact : independentSetCount TZero 6 = 0 := by decide

theorem i6_unequal : independentSetCount TPlus 6 ≠ independentSetCount TZero 6 := by
  rw [TPlus_i6_exact, TZero_i6_exact]
  decide

/-- A finite rooted tree, with all data needed to enumerate its independent sets. -/
structure FiniteRootedTree where
  V : Type
  graph : SimpleGraph V
  root : V
  fintypeV : Fintype V
  decidableEqV : DecidableEq V
  decidableAdj : DecidableRel graph.Adj
  isTree : graph.IsTree

namespace FiniteRootedTree

def signature (T : FiniteRootedTree) : Sigma5 := by
  letI := T.fintypeV
  letI := T.decidableEqV
  letI := T.decidableAdj
  exact sigma5 T.graph T.root

def i6 (T : FiniteRootedTree) : Nat := by
  letI := T.fintypeV
  letI := T.decidableEqV
  letI := T.decidableAdj
  exact independentSetCount T.graph 6

end FiniteRootedTree

def plusRootedTree : FiniteRootedTree where
  V := Vertex
  graph := TPlus
  root := 0
  fintypeV := inferInstance
  decidableEqV := inferInstance
  decidableAdj := inferInstance
  isTree := TPlus_isTree

def zeroRootedTree : FiniteRootedTree where
  V := Vertex
  graph := TZero
  root := 0
  fintypeV := inferInstance
  decidableEqV := inferInstance
  decidableAdj := inferInstance
  isTree := TZero_isTree

theorem plusRootedTree_signature : plusRootedTree.signature = expectedSigma5 :=
  TPlus_sigma5_exact

theorem zeroRootedTree_signature : zeroRootedTree.signature = expectedSigma5 :=
  TZero_sigma5_exact

theorem plusRootedTree_i6 : plusRootedTree.i6 = 1 := TPlus_i6_exact

theorem zeroRootedTree_i6 : zeroRootedTree.i6 = 0 := TZero_i6_exact

/-- No function of `sigma_5` recovers `i_6` on every finite rooted tree. -/
theorem no_i6_recovery_function :
    ¬ ∃ recover : Sigma5 → Nat,
      ∀ T : FiniteRootedTree, recover T.signature = T.i6 := by
  rintro ⟨recover, hrecover⟩
  have hplus := hrecover plusRootedTree
  have hzero := hrecover zeroRootedTree
  rw [plusRootedTree_signature, plusRootedTree_i6] at hplus
  rw [zeroRootedTree_signature, zeroRootedTree_i6] at hzero
  omega

/-- The complete frozen C6-U1-04 finite certificate. -/
theorem C6_U1_04 :
    TPlus.IsTree ∧
    TZero.IsTree ∧
    sigma5 TPlus 0 = expectedSigma5 ∧
    sigma5 TZero 0 = expectedSigma5 ∧
    independentSetCount TPlus 6 = 1 ∧
    independentSetCount TZero 6 = 0 ∧
    (¬ ∃ recover : Sigma5 → Nat,
      ∀ T : FiniteRootedTree, recover T.signature = T.i6) := by
  exact ⟨TPlus_isTree, TZero_isTree, TPlus_sigma5_exact, TZero_sigma5_exact,
    TPlus_i6_exact, TZero_i6_exact, no_i6_recovery_function⟩

end C6U104
