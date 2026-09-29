lemma e993_taylor_le (d : ℕ) {y : ℝ} (hy : 0 ≤ y) :
    e993ExpTaylor d y ≤ Real.exp y := by
  simpa [e993ExpTaylor] using Real.sum_le_exp_of_nonneg hy (d + 1)
