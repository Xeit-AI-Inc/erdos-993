lemma e993_tail_G4_odd_endpoint (s : ℕ) (hs : 100 ≤ s) :
    (1 / 20 : ℝ) ≤ e993TailG 4 (2 * s + 1) (s + 1) := by
  have hsR : (100 : ℝ) ≤ s := by exact_mod_cast hs
  have hpoly0 : 0 ≤ 4 * (s : ℝ)^2 - 40 * (s : ℝ) - 71 := by nlinarith
  have hpoly1 : 0 ≤ 4 * (s : ℝ) * ((s : ℝ) - 1) *
      (4 * (s : ℝ)^2 - 40 * (s : ℝ) - 71) := by
    apply mul_nonneg
    · apply mul_nonneg (by positivity)
      linarith
    · exact hpoly0
  apply e993_tail_G4_ge_of_poly (2 * s + 1) (s + 1) (by omega)
    (by omega) (by omega)
  have hcast : ((2 * s + 1 : ℕ) : ℝ) = 2 * (s : ℝ) + 1 := by push_cast; ring
  have hkcast : (((s + 1 : ℕ) : ℝ)) = (s : ℝ) + 1 := by push_cast; ring
  rw [hcast, hkcast]
  nlinarith [hpoly1]
