lemma e993_exp_log_product {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (S : Finset (Σ i, Fin (r i))) :
    Real.exp (∑ i, Real.log (f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ))) =
      ∏ i, f i (e993BlockCount r S i) /
        ((r i).choose (e993BlockCount r S i) : ℝ) := by
  rw [Real.exp_sum]
  apply Finset.prod_congr rfl
  intro i hi
  exact Real.exp_log (lt_of_lt_of_le zero_lt_one
    (e993_weight_ge_one r f hf i _ (e993_count_le r S i)))
