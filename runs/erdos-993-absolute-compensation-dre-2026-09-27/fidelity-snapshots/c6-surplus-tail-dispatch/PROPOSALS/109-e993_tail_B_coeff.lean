lemma e993_tail_B_coeff (a t : ℕ) :
    (e993TailB a).coeff t = (a.choose t : ℝ) + if t = 1 then 1 else 0 := by
  simp only [e993TailB, Polynomial.coeff_add, Polynomial.coeff_one_add_X_pow,
    Polynomial.coeff_X]
  by_cases h : t = 1 <;> simp [h, eq_comm]
