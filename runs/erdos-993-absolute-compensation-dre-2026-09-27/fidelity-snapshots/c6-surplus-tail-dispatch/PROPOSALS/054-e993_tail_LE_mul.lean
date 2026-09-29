lemma e993_tail_LE_mul {p q p' q' : Polynomial ℝ}
    (hp : e993TailLE p q) (hp' : e993TailLE p' q')
    (hnp' : e993TailNN p') (hnq : e993TailNN q) :
    e993TailLE (p * p') (q * q') := by
  intro n
  rw [Polynomial.coeff_mul, Polynomial.coeff_mul]
  apply Finset.sum_le_sum
  intro x hx
  exact mul_le_mul (hp x.1) (hp' x.2) (hnp' x.2) (hnq x.1)
