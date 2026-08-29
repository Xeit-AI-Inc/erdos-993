import Erdos993GapBridge.TreePLC4Large

namespace Erdos993GapBridge

open Finset

variable {V : Type*} [DecidableEq V]

theorem three_twoSets_union_four_has_two_intersections
    (a b c : Finset V)
    (ha : a.card = 2) (hb : b.card = 2) (hc : c.card = 2)
    (hab_ne : a ≠ b) (hac_ne : a ≠ c) (hbc_ne : b ≠ c)
    (hUnion : (a ∪ b ∪ c).card = 4) :
    ((a ∩ b).Nonempty ∧ (a ∩ c).Nonempty)
      ∨ ((a ∩ b).Nonempty ∧ (b ∩ c).Nonempty)
      ∨ ((a ∩ c).Nonempty ∧ (b ∩ c).Nonempty) := by
  have disjoint_of_not_nonempty {s t : Finset V}
      (h : ¬ (s ∩ t).Nonempty) : Disjoint s t := by
    rw [Finset.disjoint_left]
    intro x hxs hxt
    exact h ⟨x, Finset.mem_inter.mpr ⟨hxs, hxt⟩⟩
  have eq_of_union_card_four_of_disjoint
      {x y z : Finset V}
      (hx : x.card = 2) (hy : y.card = 2) (hz : z.card = 2)
      (hxz : Disjoint x z) (hyz : Disjoint y z)
      (hu : (x ∪ y ∪ z).card = 4) : x = y := by
    have hxyz : Disjoint (x ∪ y) z :=
      Finset.disjoint_union_left.mpr ⟨hxz, hyz⟩
    have hxycard : (x ∪ y).card = 2 := by
      have hcard : (x ∪ y).card + z.card = 4 := by
        calc
          (x ∪ y).card + z.card = (x ∪ y ∪ z).card :=
            (Finset.card_union_of_disjoint hxyz).symm
          _ = 4 := hu
      omega
    have hxeq : x = x ∪ y :=
      Finset.eq_of_subset_of_card_le Finset.subset_union_left (by omega)
    have hyeq : y = x ∪ y :=
      Finset.eq_of_subset_of_card_le Finset.subset_union_right (by omega)
    exact hxeq.trans hyeq.symm
  by_cases hab : (a ∩ b).Nonempty
  · by_cases hac : (a ∩ c).Nonempty
    · exact Or.inl ⟨hab, hac⟩
    · by_cases hbc : (b ∩ c).Nonempty
      · exact Or.inr (Or.inl ⟨hab, hbc⟩)
      · exfalso
        apply hab_ne
        exact eq_of_union_card_four_of_disjoint ha hb hc
          (disjoint_of_not_nonempty hac) (disjoint_of_not_nonempty hbc) hUnion
  · by_cases hac : (a ∩ c).Nonempty
    · by_cases hbc : (b ∩ c).Nonempty
      · exact Or.inr (Or.inr ⟨hac, hbc⟩)
      · exfalso
        apply hac_ne
        have hUnion_acb : (a ∪ c ∪ b).card = 4 := by
          rw [Finset.union_assoc, Finset.union_comm c b, ← Finset.union_assoc]
          exact hUnion
        exact eq_of_union_card_four_of_disjoint ha hc hb
          (disjoint_of_not_nonempty hab) (disjoint_of_not_nonempty hbc).symm hUnion_acb
    · by_cases hbc : (b ∩ c).Nonempty
      · exfalso
        apply hbc_ne
        have hUnion_bca : (b ∪ c ∪ a).card = 4 := by
          rw [Finset.union_assoc, Finset.union_comm c a, ← Finset.union_assoc,
            Finset.union_comm b a]
          exact hUnion
        exact eq_of_union_card_four_of_disjoint hb hc ha
          (disjoint_of_not_nonempty hab).symm
          (disjoint_of_not_nonempty hac).symm hUnion_bca
      · exfalso
        have hab_disj : Disjoint a b := disjoint_of_not_nonempty hab
        have hac_disj : Disjoint a c := disjoint_of_not_nonempty hac
        have hbc_disj : Disjoint b c := disjoint_of_not_nonempty hbc
        have habc_disj : Disjoint (a ∪ b) c :=
          Finset.disjoint_union_left.mpr ⟨hac_disj, hbc_disj⟩
        have hcard : (a ∪ b ∪ c).card = 6 := by
          calc
            (a ∪ b ∪ c).card = (a ∪ b).card + c.card :=
              Finset.card_union_of_disjoint habc_disj
            _ = (a.card + b.card) + c.card := by
              rw [Finset.card_union_of_disjoint hab_disj]
            _ = 6 := by omega
        omega

end Erdos993GapBridge
