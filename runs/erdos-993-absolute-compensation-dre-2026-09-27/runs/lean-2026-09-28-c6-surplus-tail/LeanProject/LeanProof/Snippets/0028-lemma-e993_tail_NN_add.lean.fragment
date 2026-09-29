lemma e993_tail_NN_add {p q : Polynomial ℝ} (hp : e993TailNN p) (hq : e993TailNN q) :
    e993TailNN (p + q) := by
  intro n
  rw [Polynomial.coeff_add]
  exact add_nonneg (hp n) (hq n)
