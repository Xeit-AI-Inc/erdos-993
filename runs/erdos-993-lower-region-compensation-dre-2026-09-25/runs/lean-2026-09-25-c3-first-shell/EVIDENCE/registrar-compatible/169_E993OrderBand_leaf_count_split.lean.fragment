namespace E993OrderBand

open Classical

lemma leaf_count_split {V : Type*} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (v : V) (hv : C4LA1.IsGraphLeaf T v) (k : ℕ) :
    C5LA1.indepSetCount T (C5LA1.H T v) k =
      (E993Interior.taggedFamily T
        (Finset.univ \ C5LA1.H T v)
        (C5LA1.R T v \ C5LA1.H T v) k).card +
      C5LA1.indepSetCount T (C5LA1.R T v) k := by
  rw [← tagged_marks_sdiff T (C5LA1.H T v) (C5LA1.R T v) k]
  exact tagged_count_split T (C5LA1.H T v) (C5LA1.R T v)
    (H_subset_R T v hv) k

end E993OrderBand
