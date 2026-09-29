lemma e993_tail_G4_even_endpoint (s : ℕ) (hs : 100 ≤ s) :
    (1 / 20 : ℝ) ≤ e993TailG 4 (2 * s) (s + 1) := by
  have hsR : (100 : ℝ) ≤ s := by exact_mod_cast hs
  have hpoly0 : 0 ≤ 4 * (s : ℝ)^2 * ((s : ℝ) - 22) +
      13 * (s : ℝ) + 240 := by
    have h : 0 ≤ 4 * (s : ℝ)^2 * ((s : ℝ) - 22) := by
      apply mul_nonneg (by positivity)
      linarith
    nlinarith
  have hpoly1 : 0 ≤ ((s : ℝ) - 1) *
      (4 * (s : ℝ)^2 * ((s : ℝ) - 22) + 13 * (s : ℝ) + 240) :=
    mul_nonneg (by linarith) hpoly0
  apply e993_tail_G4_ge_of_poly (2 * s) (s + 1) (by omega)
    (by omega) (by omega)
  have hcast : ((2 * s : ℕ) : ℝ) = 2 * (s : ℝ) := by push_cast; ring
  have hkcast : (((s + 1 : ℕ) : ℝ)) = (s : ℝ) + 1 := by push_cast; ring
  rw [hcast, hkcast]
  nlinarith [hpoly1]
