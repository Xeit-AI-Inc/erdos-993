lemma e993_tail_exp_base : (102 : ℝ) < Real.exp (99 / 20 : ℝ) := by
  have h := e993_taylor_le 8 (show 0 ≤ (99 / 20 : ℝ) by norm_num)
  have hnum : (102 : ℝ) < e993ExpTaylor 8 (99 / 20 : ℝ) := by
    norm_num [e993ExpTaylor, Finset.sum_range_succ]
  exact lt_of_lt_of_le hnum h
