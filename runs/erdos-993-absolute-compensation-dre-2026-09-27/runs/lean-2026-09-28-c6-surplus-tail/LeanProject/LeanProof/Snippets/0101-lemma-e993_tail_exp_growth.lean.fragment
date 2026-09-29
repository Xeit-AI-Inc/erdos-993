lemma e993_tail_exp_growth (m : ℕ) (hm : 100 ≤ m) :
    (m : ℝ) + 2 < Real.exp (((m - 1 : ℕ) : ℝ) / 20) := by
  let t : ℝ := ((m : ℝ) - 100) / 20
  have hmR : (100 : ℝ) ≤ m := by exact_mod_cast hm
  have ht : 0 ≤ t := by dsimp [t]; positivity
  have hm1 : 1 ≤ m := by omega
  have hdecomp : (((m - 1 : ℕ) : ℝ) / 20) = 99 / 20 + t := by
    rw [Nat.cast_sub hm1]
    dsimp [t]
    push_cast
    ring
  have he : 1 + t ≤ Real.exp t := by simpa [add_comm] using Real.add_one_le_exp t
  have hstrict : (102 : ℝ) * Real.exp t < Real.exp (99 / 20 : ℝ) * Real.exp t :=
    mul_lt_mul_of_pos_right e993_tail_exp_base (Real.exp_pos t)
  have hlow : (102 : ℝ) * (1 + t) ≤ 102 * Real.exp t := by nlinarith
  have hfirst : (m : ℝ) + 2 ≤ 102 * (1 + t) := by
    dsimp [t]
    nlinarith
  rw [hdecomp, Real.exp_add]
  exact lt_of_le_of_lt (hfirst.trans hlow) hstrict
