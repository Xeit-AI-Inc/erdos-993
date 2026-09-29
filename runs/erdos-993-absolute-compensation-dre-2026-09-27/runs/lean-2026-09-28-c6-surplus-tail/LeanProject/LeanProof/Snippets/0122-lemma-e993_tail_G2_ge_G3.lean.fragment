lemma e993_tail_G2_ge_G3 (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hband : N + 1 < 4 * k)
    (hguard : 2 * k ≤ N + 2) :
    e993TailG 3 N k ≤ e993TailG 2 N k := by
  have hkN : k ≤ N - 2 := by omega
  have hstep := e993_tail_choose_n_step (N - 1) k (by omega) hk (by omega)
  have hN1 : N - 1 - 2 = N - 3 := by omega
  have hN2 : N - 1 - 1 = N - 2 := by omega
  have hK : N - 1 - k = N - k - 1 := by omega
  rw [hN1, hN2, hK] at hstep
  have hq2 : (0 : ℝ) ≤ ((N - 2).choose (k - 1) : ℝ) := by positivity
  have hN2pos : (0 : ℝ) < (N : ℝ) - 2 := by
    have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
    linarith
  have hratio : (15 : ℝ) * ((N - 3).choose (k - 1) : ℝ) ≤
      14 * ((N - 2).choose (k - 1) : ℝ) := by
    have hstepR : ((N - 3).choose (k - 1) : ℝ) * ((N : ℝ) - 2) =
        ((N - 2).choose (k - 1) : ℝ) * ((N : ℝ) - k - 1) := by
      have h := congrArg (fun x : ℕ => (x : ℝ)) hstep
      push_cast at h
      rw [Nat.cast_sub (by omega : 2 ≤ N),
        Nat.cast_sub (by omega : 1 ≤ N - k)] at h
      rw [Nat.cast_sub (by omega : k ≤ N)] at h
      push_cast at h
      nlinarith [h]
    have hbound : (15 : ℝ) * ((N : ℝ) - k - 1) ≤
        14 * ((N : ℝ) - 2) := by
      have hbR : (N : ℝ) + 1 < 4 * (k : ℝ) := by exact_mod_cast hband
      have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
      nlinarith
    have hmul := mul_le_mul_of_nonneg_right hbound hq2
    have hboth : (15 * ((N - 3).choose (k - 1) : ℝ)) * ((N : ℝ) - 2) ≤
        (14 * ((N - 2).choose (k - 1) : ℝ)) * ((N : ℝ) - 2) := by
      nlinarith [hmul, hstepR]
    exact (mul_le_mul_iff_of_pos_right hN2pos).mp hboth
  have hc : (0 : ℝ) < (N.choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos (by omega : k ≤ N)
  have hnum : (6 / 7 : ℝ) * ((N - 3).choose (k - 1) : ℝ) ≤
      (4 / 5 : ℝ) * ((N - 2).choose (k - 1) : ℝ) := by nlinarith [hratio]
  unfold e993TailG
  norm_num
  exact div_le_div_of_nonneg_right hnum (le_of_lt hc)
