lemma e993_tail_G4_step (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hband : N + 1 < 4 * k) (hkN : k + 1 ≤ N - 3) :
    e993TailG 4 N (k + 1) ≤ e993TailG 4 N k := by
  have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
  have hkR : (1 : ℝ) ≤ k := by exact_mod_cast hk
  have hbR : (N : ℝ) + 1 < 4 * (k : ℝ) := by exact_mod_cast hband
  have hkNR : (k : ℝ) + 1 ≤ (N : ℝ) - 3 := by
    have hnat : k + 4 ≤ N := by omega
    have hR : (k : ℝ) + 4 ≤ N := by exact_mod_cast hnat
    linarith
  have hden : 0 < (N : ℝ) * ((N : ℝ) - 1) *
      ((N : ℝ) - 2) * ((N : ℝ) - 3) := by
    apply mul_pos
    apply mul_pos
    apply mul_pos <;> linarith
    all_goals linarith
  have hf1 : 0 ≤ (N : ℝ) - (k : ℝ) - 1 := by nlinarith
  have hf2 : 0 ≤ (N : ℝ) - (k : ℝ) - 2 := by nlinarith
  have hcore : ((k : ℝ) + 1) * ((N : ℝ) - (k : ℝ) - 3) ≤
      (k : ℝ) * ((N : ℝ) - (k : ℝ)) := by nlinarith
  have hmul := mul_le_mul_of_nonneg_right hcore (mul_nonneg hf1 hf2)
  rw [e993_tail_G4_formula N (k + 1) (by omega) (by omega) (by omega),
    e993_tail_G4_formula N k (by omega) hk (by omega)]
  have hnum : ((k : ℝ) + 1) * ((N : ℝ) - (k : ℝ) - 1) *
      ((N : ℝ) - (k : ℝ) - 2) * ((N : ℝ) - (k : ℝ) - 3) ≤
      (k : ℝ) * ((N : ℝ) - (k : ℝ)) *
        ((N : ℝ) - (k : ℝ) - 1) * ((N : ℝ) - (k : ℝ) - 2) := by
    nlinarith [hmul]
  have hnum' := mul_le_mul_of_nonneg_left hnum (show (0 : ℝ) ≤ 8 / 9 by norm_num)
  have hquot := div_le_div_of_nonneg_right hnum' (le_of_lt hden)
  simp only [Nat.cast_add, Nat.cast_one]
  have heq1 : (N : ℝ) - ((k : ℝ) + 1) = (N : ℝ) - k - 1 := by ring
  have heq2 : (N : ℝ) - k - 1 - 1 = (N : ℝ) - k - 2 := by ring
  have heq3 : (N : ℝ) - k - 1 - 2 = (N : ℝ) - k - 3 := by ring
  rw [heq1, heq2, heq3]
  exact hquot
