lemma e993_tail_coeff_X_derivative (p : Polynomial ℝ) (k : ℕ) :
    (Polynomial.X * p.derivative).coeff k = (k : ℝ) * p.coeff k := by
  cases k with
  | zero => simp
  | succ n =>
      rw [Polynomial.coeff_X_mul, Polynomial.coeff_derivative]
      push_cast
      ring
