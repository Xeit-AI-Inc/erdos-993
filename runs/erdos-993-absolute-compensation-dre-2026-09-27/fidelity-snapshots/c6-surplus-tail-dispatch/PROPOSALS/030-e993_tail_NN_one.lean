lemma e993_tail_NN_one : e993TailNN (1 : Polynomial ℝ) := by
  intro n
  rw [Polynomial.coeff_one]
  split_ifs <;> norm_num
