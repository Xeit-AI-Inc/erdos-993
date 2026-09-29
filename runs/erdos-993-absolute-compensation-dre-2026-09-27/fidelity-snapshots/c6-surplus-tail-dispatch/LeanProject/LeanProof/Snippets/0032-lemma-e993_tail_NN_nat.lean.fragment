lemma e993_tail_NN_nat (m : ℕ) : e993TailNN (m : Polynomial ℝ) := by
  intro n
  rw [← Polynomial.C_eq_natCast, Polynomial.coeff_C]
  split_ifs <;> positivity
