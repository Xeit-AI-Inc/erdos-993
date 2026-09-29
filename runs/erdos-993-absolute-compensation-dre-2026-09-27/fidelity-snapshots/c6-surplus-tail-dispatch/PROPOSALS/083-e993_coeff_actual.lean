lemma e993_coeff_actual {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (e993BlockProduct r f).coeff k =
      ∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
        ∏ i, f i (e993BlockCount r S i) /
          ((r i).choose (e993BlockCount r S i) : ℝ) := by
  rw [e993_coeff_expansion, e993_actual_sum_eq_count_sum]
