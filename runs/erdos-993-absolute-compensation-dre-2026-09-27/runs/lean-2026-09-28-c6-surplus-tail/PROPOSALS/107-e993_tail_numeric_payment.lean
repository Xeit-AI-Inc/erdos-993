lemma e993_tail_numeric_payment (m N k : ℕ)
    (hm : 100 ≤ m) (hNlo : 2 * m ≤ N) (hNhi : N ≤ 4 * m)
    (hk : 1 ≤ k) (hguard : 2 * k ≤ N + 2) :
    (k : ℝ) * ((k : ℝ) + 1) <
      2 * ((m : ℝ) + 2) * ((N : ℝ) + 1 - (k : ℝ)) := by
  have hmR : (100 : ℝ) ≤ m := by exact_mod_cast hm
  have hNloR : 2 * (m : ℝ) ≤ N := by exact_mod_cast hNlo
  have hNhiR : (N : ℝ) ≤ 4 * m := by exact_mod_cast hNhi
  have hkR : (1 : ℝ) ≤ k := by exact_mod_cast hk
  have hgR : 2 * (k : ℝ) ≤ N + 2 := by exact_mod_cast hguard
  have ha : ((N : ℝ) + 2) / 2 ≤ 2 * ((m : ℝ) + 2) := by nlinarith
  have hb : (N : ℝ) / 2 ≤ (N : ℝ) + 1 - (k : ℝ) := by nlinarith
  have hc : 0 ≤ (N : ℝ) / 2 := by positivity
  have hd : 0 ≤ 2 * ((m : ℝ) + 2) := by positivity
  have hleft : (((N : ℝ) + 2) / 2) * ((N : ℝ) / 2) ≤
      2 * ((m : ℝ) + 2) * ((N : ℝ) + 1 - (k : ℝ)) := by
    exact mul_le_mul ha hb hc hd
  have he : (k : ℝ) ≤ ((N : ℝ) + 2) / 2 := by nlinarith
  have hf : (k : ℝ) + 1 ≤ ((N : ℝ) + 4) / 2 := by nlinarith
  have hg : 0 ≤ (k : ℝ) + 1 := by positivity
  have hh : 0 ≤ ((N : ℝ) + 2) / 2 := by positivity
  have hright : (k : ℝ) * ((k : ℝ) + 1) ≤
      (((N : ℝ) + 2) / 2) * (((N : ℝ) + 4) / 2) := by
    exact mul_le_mul he hf hg hh
  nlinarith [hleft, hright]
