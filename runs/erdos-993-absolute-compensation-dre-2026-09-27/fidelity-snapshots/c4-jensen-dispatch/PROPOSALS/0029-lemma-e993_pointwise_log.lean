lemma e993_pointwise_log {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (S : Finset (Σ i, Fin (r i))) :
    (∑ i, 2 * (f i (e993BlockCount r S i) -
      ((r i).choose (e993BlockCount r S i) : ℝ)) /
      (f i (e993BlockCount r S i) +
      ((r i).choose (e993BlockCount r S i) : ℝ))) ≤
    (∑ i, Real.log (f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ))) := by
  apply Finset.sum_le_sum
  intro i hi
  exact e993_scalar_log
    (by exact_mod_cast Nat.choose_pos (e993_count_le r S i))
    (hf i _ (e993_count_le r S i))
