lemma e993_tail_E_coeff {m : ℕ} (r : Fin m → ℕ) (k : ℕ) (hk : 1 ≤ k) :
    (e993TailE r).coeff k = ((e993TailN r).choose (k - 1) : ℝ) := by
  obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
  simp [e993TailE, Polynomial.coeff_X_mul, Polynomial.coeff_one_add_X_pow]
