lemma e993_tail_D_coeff (d k : ℕ) (p : Polynomial ℝ) :
    (e993TailD d p).coeff k =
      3 * ((k : ℝ) + 1) * p.coeff (k + 1) +
      2 * (k : ℝ) * p.coeff k - 2 * (d : ℝ) * p.coeff k := by
  have hpoly : (3 + 2 * Polynomial.X : Polynomial ℝ) * p.derivative =
      3 * p.derivative + 2 * (Polynomial.X * p.derivative) := by ring
  unfold e993TailD
  rw [hpoly, Polynomial.coeff_sub, Polynomial.coeff_add]
  rw [mul_assoc (2 : Polynomial ℝ) (d : Polynomial ℝ) p]
  simp only [Polynomial.coeff_ofNat_mul, Polynomial.coeff_natCast_mul,
    Polynomial.coeff_derivative, e993_tail_coeff_X_derivative]
  ring
