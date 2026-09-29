lemma e993_tail_NN_mul {p q : Polynomial ℝ} (hp : e993TailNN p) (hq : e993TailNN q) :
    e993TailNN (p * q) := by
  intro n
  rw [Polynomial.coeff_mul]
  apply Finset.sum_nonneg
  intro x hx
  exact mul_nonneg (hp x.1) (hq x.2)
