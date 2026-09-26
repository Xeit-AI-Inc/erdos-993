namespace E993OrderBand

open Classical

lemma H_card {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (v : V) (hv : C4LA1.IsGraphLeaf G v) :
    (C5LA1.H G v).card = 2 := by
  have hne : v ≠ C5LA1.support G v := (support_adj G v hv).ne
  simp [C5LA1.H, hne]

end E993OrderBand
