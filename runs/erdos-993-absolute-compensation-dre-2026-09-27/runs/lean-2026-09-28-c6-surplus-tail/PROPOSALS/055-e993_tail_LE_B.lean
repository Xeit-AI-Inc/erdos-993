lemma e993_tail_LE_B (a : ℕ) :
    e993TailLE ((1 + Polynomial.X : Polynomial ℝ) ^ a) (e993TailB a) := by
  intro n
  rw [e993TailB, Polynomial.coeff_add]
  exact le_add_of_nonneg_right (e993_tail_NN_X n)
