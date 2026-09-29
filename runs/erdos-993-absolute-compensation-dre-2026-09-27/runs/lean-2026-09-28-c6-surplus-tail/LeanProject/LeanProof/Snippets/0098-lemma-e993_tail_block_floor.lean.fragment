lemma e993_tail_block_floor {m : ℕ} (r : Fin m → ℕ) (i : Fin m) :
    ∀ b t, t ≤ e993TailBlockSize r i b →
      (((e993TailBlockSize r i b).choose t : ℝ) ≤
        (e993TailB (e993TailBlockSize r i b)).coeff t) := by
  intro b t ht
  rw [e993TailB, Polynomial.coeff_add, Polynomial.coeff_one_add_X_pow]
  exact le_add_of_nonneg_right (e993_tail_NN_X t)
