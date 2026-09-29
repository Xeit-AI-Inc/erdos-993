lemma e993_tail_NN_X : e993TailNN (Polynomial.X : Polynomial ℝ) := by
  intro n
  rw [Polynomial.coeff_X]
  split_ifs <;> norm_num
