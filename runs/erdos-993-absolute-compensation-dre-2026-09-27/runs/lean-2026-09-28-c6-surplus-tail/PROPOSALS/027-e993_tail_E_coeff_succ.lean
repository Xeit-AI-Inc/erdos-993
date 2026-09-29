lemma e993_tail_E_coeff_succ {m : ℕ} (r : Fin m → ℕ) (k : ℕ) :
    (e993TailE r).coeff (k + 1) = ((e993TailN r).choose k : ℝ) := by
  simp [e993TailE, Polynomial.coeff_X_mul, Polynomial.coeff_one_add_X_pow]
