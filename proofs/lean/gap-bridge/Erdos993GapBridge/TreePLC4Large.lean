import LeanProof.Main

namespace Erdos993GapBridge

open Finset

variable {V : Type*} [Fintype V] [Nonempty V] [DecidableEq V]

lemma extension_four_card_add_five_le
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsTree) (hn : 27 <= Fintype.card V)
    {R : Finset V} (hR : R ∈ Erdos993R2C3.indepSets T 4) :
    (Erdos993R2C3.ext T R).card + 5 <= Fintype.card V := by
  letI : Nontrivial V :=
    Fintype.one_lt_card_iff_nontrivial.mp (by omega)
  obtain ⟨hRcard, hRind⟩ := Erdos993R2C3.mem_indepSets.mp hR
  have hRne : R.Nonempty :=
    Finset.card_pos.mp (by omega)
  obtain ⟨r, hr⟩ := hRne
  obtain ⟨u, hru⟩ :=
    hT.connected.preconnected.exists_adj_of_nontrivial r
  have huR : u ∉ R := by
    intro hu
    exact hRind r hr u hu hru
  have huExt : u ∉ Erdos993R2C3.ext T R := by
    intro hu
    exact (Erdos993R2C3.mem_ext.mp hu).2 r hr hru
  have hdisj : Disjoint (Erdos993R2C3.ext T R) R := by
    rw [Finset.disjoint_left]
    intro v hvext hvR
    exact (Erdos993R2C3.mem_ext.mp hvext).1 hvR
  have huUnion : u ∉ Erdos993R2C3.ext T R ∪ R := by
    simp only [Finset.mem_union, not_or]
    exact ⟨huExt, huR⟩
  have hcard :
      (insert u (Erdos993R2C3.ext T R ∪ R)).card
        <= (Finset.univ : Finset V).card :=
    Finset.card_le_card (Finset.subset_univ _)
  rw [Finset.card_insert_of_notMem huUnion,
      Finset.card_union_of_disjoint hdisj,
      hRcard, Finset.card_univ] at hcard
  omega

theorem five_ind_five_le
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsTree) (hn : 27 <= Fintype.card V) :
    5 * Erdos993R2C3.ind T 5
      <= (Fintype.card V - 5) * Erdos993R2C3.ind T 4 := by
  calc
    5 * Erdos993R2C3.ind T 5 =
        ∑ R ∈ Erdos993R2C3.indepSets T 4,
          (Erdos993R2C3.ext T R).card := by
      simpa using Erdos993R2C3.double_count T 4
    _ <= ∑ _R ∈ Erdos993R2C3.indepSets T 4,
          (Fintype.card V - 5) := by
      refine Finset.sum_le_sum fun R hR => ?_
      have h :=
        extension_four_card_add_five_le T hT hn hR
      omega
    _ = (Fintype.card V - 5) * Erdos993R2C3.ind T 4 := by
      rw [Finset.sum_const, smul_eq_mul, Erdos993R2C3.ind, mul_comm]

end Erdos993GapBridge
