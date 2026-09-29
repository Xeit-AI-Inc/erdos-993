lemma e993_tail_center_coeff {m : ℕ} (s : Finset (Fin m))
    (r : Fin m → ℕ) (k : ℕ) :
    (∏ j ∈ s, e993TailB (r j)).coeff k =
      ∑ t ∈ s.powerset,
        if t.card ≤ k then ((∑ j ∈ s \ t, r j).choose (k - t.card) : ℝ)
        else 0 := by
  rw [e993_tail_center_expansion]
  simp only [Polynomial.finsetSum_coeff, Polynomial.coeff_X_pow_mul',
    Polynomial.coeff_one_add_X_pow]
