lemma e993_tail_G4_ge_of_poly (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hkN : k ≤ N - 3)
    (hpoly : (9 : ℝ) * ((N : ℝ) * ((N : ℝ) - 1) *
      ((N : ℝ) - 2) * ((N : ℝ) - 3)) ≤
      160 * ((k : ℝ) * ((N : ℝ) - k) *
        ((N : ℝ) - k - 1) * ((N : ℝ) - k - 2))) :
    (1 / 20 : ℝ) ≤ e993TailG 4 N k := by
  have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
  have hden : 0 < (N : ℝ) * ((N : ℝ) - 1) *
      ((N : ℝ) - 2) * ((N : ℝ) - 3) := by
    apply mul_pos
    apply mul_pos
    apply mul_pos <;> linarith
    all_goals linarith
  rw [e993_tail_G4_formula N k (by omega) hk hkN]
  apply (le_div_iff₀ hden).2
  nlinarith [hpoly]
