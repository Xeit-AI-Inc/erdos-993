lemma e993_tail_C_coeff_floor {m : ℕ} (r : Fin m → ℕ) (k : ℕ) :
    ((e993TailN r + 1).choose k : ℝ) ≤ (e993TailC r).coeff k := by
  simpa only [Polynomial.coeff_one_add_X_pow] using e993_tail_LE_C r k
