lemma e993_tail_C_coeff_succ (m : ℕ) (r : Fin m → ℕ) (j : ℕ) :
    (e993TailC r).coeff (j + 1) =
      (e993TailQ r).coeff (j + 1) + 2 * (e993TailQ r).coeff j := by
  rw [e993_tail_C_eq_Q m r, Polynomial.coeff_add]
  rw [mul_assoc, Polynomial.coeff_ofNat_mul, Polynomial.coeff_X_mul]
