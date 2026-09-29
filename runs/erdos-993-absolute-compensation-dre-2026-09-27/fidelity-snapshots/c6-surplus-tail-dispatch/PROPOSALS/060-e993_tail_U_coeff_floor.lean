lemma e993_tail_U_coeff_floor {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hi : 1 ≤ r i) (k : ℕ) :
    ((e993TailN r).choose k : ℝ) ≤ (e993TailU r i).coeff k := by
  simpa only [Polynomial.coeff_one_add_X_pow] using e993_tail_LE_U r i hi k
