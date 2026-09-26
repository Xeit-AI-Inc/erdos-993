namespace E993OrderBand

open Classical

lemma retained_card {V : Type*} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf T v) :
    (Finset.univ \ C5LA1.H T v).card + 2 = Fintype.card V := by
  have hsub : C5LA1.H T v ⊆ Finset.univ := Finset.subset_univ _
  rw [Finset.card_sdiff_of_subset hsub, H_card T v hv]
  have hle := Finset.card_le_card hsub
  rw [H_card T v hv] at hle
  simp only [Finset.card_univ] at *
  omega

end E993OrderBand
