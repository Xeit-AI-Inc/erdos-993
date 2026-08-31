import Erdos993MarkedExtensionCharge.MarkedExtensionCharge
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Data.Finset.Powerset
import Mathlib.Tactic

set_option autoImplicit false

namespace C2T105

open MarkedExtensionCharge

noncomputable section

variable {V : Type*} [Fintype V] [DecidableEq V]
variable (G : SimpleGraph V) [DecidableRel G.Adj]

/-- The exact plateau-safe first-recovery predicate. -/
def FirstRecovery (p q : Nat) : Prop :=
  p < q ∧
    delta G p < 0 ∧
    (∀ r, p < r → r < q → delta G r ≤ 0) ∧
    0 < delta G q

def indepAtOneEquiv :
    IndepAt G 1 ≃ {X : Finset V // X ∈ (Finset.univ : Finset V).powersetCard 1} :=
  Equiv.subtypeEquiv (Equiv.refl (Finset V)) (by
    intro X
    simp only [Finset.mem_powersetCard, Finset.subset_univ, true_and]
    constructor
    · exact fun h => h.2
    · intro hcard
      refine ⟨?_, hcard⟩
      obtain ⟨v, rfl⟩ := Finset.card_eq_one.mp hcard
      simp)

theorem independentSetCount_one :
    independentSetCount G 1 = Fintype.card V := by
  calc
    independentSetCount G 1 = Fintype.card (IndepAt G 1) := rfl
    _ = Fintype.card {X : Finset V //
          X ∈ (Finset.univ : Finset V).powersetCard 1} :=
      Fintype.card_congr (indepAtOneEquiv G)
    _ = ((Finset.univ : Finset V).powersetCard 1).card := Fintype.card_coe _
    _ = Fintype.card V := by simp

def indepAtTwoEquiv :
    IndepAt G 2 ≃ NonedgePairMarks G (Finset.univ : Finset V) :=
  Equiv.subtypeEquiv (Equiv.refl (Finset V)) (by
    intro X
    simp only [Finset.subset_univ, true_and]
    tauto)

theorem independentSetCount_two :
    independentSetCount G 2 =
      (Fintype.card V).choose 2 - G.edgeFinset.card := by
  let I : Finset (Sym2 V) :=
    G.edgeFinset ∩ (Finset.univ : Finset V).sym2
  have hmap := SimpleGraph.map_edgeFinset_induce
    (G := G) (s := ((Finset.univ : Finset V) : Set V))
  have hmapCard := congrArg Finset.card hmap
  rw [Finset.card_map] at hmapCard
  have hedge :
      (G.induce (((Finset.univ : Finset V) : Set V))).edgeFinset.card =
        G.edgeFinset.card := by
    have hmapCard' :
        (G.induce (((Finset.univ : Finset V) : Set V))).edgeFinset.card =
          I.card := by
      convert hmapCard using 1
      · apply congrArg Finset.card
        ext z
        simp only [SimpleGraph.mem_edgeFinset]
      · simp [I]
    simpa [I] using hmapCard'
  calc
    independentSetCount G 2 = Fintype.card (IndepAt G 2) := rfl
    _ = Fintype.card (NonedgePairMarks G (Finset.univ : Finset V)) :=
      Fintype.card_congr (indepAtTwoEquiv G)
    _ = (Fintype.card V).choose 2 - G.edgeFinset.card := by
      rw [card_nonedgePairMarks, hedge]
      simp

theorem extensionCount_le_card_sub {r : Nat} (X : IndepAt G r) :
    extensionCount G X.1 ≤ Fintype.card V - r := by
  have hdisj : Disjoint (ext G X.1) X.1 := by
    rw [Finset.disjoint_left]
    intro v hvext hvX
    exact (mem_ext G).mp hvext |>.1 hvX
  have hunion : (ext G X.1 ∪ X.1).card ≤ (Finset.univ : Finset V).card :=
    Finset.card_le_card
      (Finset.subset_univ (ext G X.1 ∪ X.1))
  rw [Finset.card_union_of_disjoint hdisj, X.2.2] at hunion
  simpa [extensionCount] using (Nat.le_sub_of_add_le hunion)

theorem extension_double_count (r : Nat) :
    (r + 1) * independentSetCount G (r + 1) ≤
      (Fintype.card V - r) * independentSetCount G r := by
  have hsum :
      (∑ X : IndepAt G r, extensionCount G X.1) =
        (r + 1) * independentSetCount G (r + 1) := by
    have hsum' := one_mark_sum G (r + 1) (by omega)
    have hrank : r + 1 - 1 = r := by omega
    rw [hrank] at hsum'
    exact hsum'
  rw [← hsum]
  calc
    (∑ X : IndepAt G r, extensionCount G X.1) ≤
        ∑ _X : IndepAt G r, (Fintype.card V - r) := by
      exact Finset.sum_le_sum fun X _ => extensionCount_le_card_sub G X
    _ = (Fintype.card V - r) * independentSetCount G r := by
      simp [independentSetCount, mul_comm]

theorem independentSetCount_antitone_of_card_le_four
    (hn : Fintype.card V ≤ 4) {r : Nat} (hr : 2 ≤ r) :
    independentSetCount G (r + 1) ≤ independentSetCount G r := by
  have hcoef : Fintype.card V - r ≤ r + 1 := by omega
  have hmul :
      (r + 1) * independentSetCount G (r + 1) ≤
        (r + 1) * independentSetCount G r :=
    (extension_double_count G r).trans (by
      exact Nat.mul_le_mul_right (independentSetCount G r) hcoef)
  exact le_of_mul_le_mul_left hmul (by omega)

theorem delta_nonpositive_of_card_le_four
    (hn : Fintype.card V ≤ 4) {r : Nat} (hr : 2 ≤ r) :
    delta G r ≤ 0 := by
  apply sub_nonpos.mpr
  exact_mod_cast independentSetCount_antitone_of_card_le_four G hn hr

theorem card_le_four_of_delta_one_neg [Nonempty V]
    (hconn : G.Connected) (hacyc : G.IsAcyclic) (hneg : delta G 1 < 0) :
    Fintype.card V ≤ 4 := by
  let htree : G.IsTree := ⟨hconn, hacyc⟩
  have hedge : G.edgeFinset.card + 1 = Fintype.card V := htree.card_edgeFinset
  rw [delta, independentSetCount_two, independentSetCount_one] at hneg
  by_contra hn
  have hn5 : 5 ≤ Fintype.card V := by omega
  have hchoose := two_mul_choose_two (Fintype.card V)
  have hedge_le : G.edgeFinset.card ≤ (Fintype.card V).choose 2 := by
    exact SimpleGraph.card_edgeFinset_le_card_choose_two
  rw [Nat.cast_sub hedge_le] at hneg
  have hchooseInt :
      (2 : Int) * ((Fintype.card V).choose 2 : Int) =
        (Fintype.card V : Int) * ((Fintype.card V - 1 : Nat) : Int) := by
    exact_mod_cast hchoose
  have hedgeInt : (G.edgeFinset.card : Int) + 1 = (Fintype.card V : Int) := by
    exact_mod_cast hedge
  have hsubInt : ((Fintype.card V - 1 : Nat) : Int) =
      (Fintype.card V : Int) - 1 := by
    rw [Nat.cast_sub (by omega)]
    norm_num
  rw [hsubInt] at hchooseInt
  nlinarith

/-- No exact first recovery can begin at rank one in a finite nonempty labelled tree. -/
theorem no_first_recovery_at_one [Nonempty V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hconn : T.Connected) (hacyc : T.IsAcyclic)
    (q : Nat) (hq : 1 < q) :
    ¬ FirstRecovery T 1 q := by
  intro hfr
  have hn : Fintype.card V ≤ 4 :=
    card_le_four_of_delta_one_neg T hconn hacyc hfr.2.1
  have hnonpos : delta T q ≤ 0 :=
    delta_nonpositive_of_card_le_four T hn (by omega)
  exact (not_lt_of_ge hnonpos) hfr.2.2.2

end

end C2T105
