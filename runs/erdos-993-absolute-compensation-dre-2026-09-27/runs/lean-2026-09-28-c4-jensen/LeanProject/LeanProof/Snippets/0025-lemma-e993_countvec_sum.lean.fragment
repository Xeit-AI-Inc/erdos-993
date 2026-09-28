lemma e993_countvec_sum {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) :
    (∑ i, (e993CountVec r S i).val) = S.card :=
  e993_sum_counts r S
