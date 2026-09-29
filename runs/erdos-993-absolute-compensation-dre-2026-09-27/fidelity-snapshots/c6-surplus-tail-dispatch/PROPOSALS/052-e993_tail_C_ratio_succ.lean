lemma e993_tail_C_ratio_succ {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (j : ℕ) :
    2 * ((e993TailN r : ℝ) + 1 - (j : ℝ)) * (e993TailC r).coeff j ≤
      3 * ((j : ℝ) + 1) * (e993TailC r).coeff (j + 1) := by
  have h := e993_tail_NN_DC r hr j
  rw [e993_tail_D_coeff] at h
  push_cast at h ⊢
  nlinarith
