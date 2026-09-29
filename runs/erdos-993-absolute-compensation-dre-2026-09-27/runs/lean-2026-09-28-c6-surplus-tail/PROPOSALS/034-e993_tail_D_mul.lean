lemma e993_tail_D_mul (a b : ℕ) (p q : Polynomial ℝ) :
    e993TailD (a + b) (p * q) = e993TailD a p * q + p * e993TailD b q := by
  simp only [e993TailD, Polynomial.derivative_mul, Nat.cast_add]
  ring
