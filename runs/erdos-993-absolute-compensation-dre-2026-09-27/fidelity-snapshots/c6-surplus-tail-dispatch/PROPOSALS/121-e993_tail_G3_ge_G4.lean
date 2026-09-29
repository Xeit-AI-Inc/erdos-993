lemma e993_tail_G3_ge_G4 (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hband : N + 1 < 4 * k)
    (hguard : 2 * k ≤ N + 2) :
    e993TailG 4 N k ≤ e993TailG 3 N k := by
  have hkN : k ≤ N - 3 := by omega
  have hstep := e993_tail_choose_n_step (N - 2) k (by omega) hk (by omega)
  have hN1 : N - 2 - 2 = N - 4 := by omega
  have hN2 : N - 2 - 1 = N - 3 := by omega
  have hK : N - 2 - k = N - k - 2 := by omega
  rw [hN1, hN2, hK] at hstep
  have hq4 : (0 : ℝ) ≤ ((N - 4).choose (k - 1) : ℝ) := by positivity
  have hq3 : (0 : ℝ) ≤ ((N - 3).choose (k - 1) : ℝ) := by positivity
  have hN3 : (0 : ℝ) < (N : ℝ) - 3 := by
    have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
    linarith
  have hratio : (28 : ℝ) * ((N - 4).choose (k - 1) : ℝ) ≤
      27 * ((N - 3).choose (k - 1) : ℝ) := by
    have hstepR : ((N - 4).choose (k - 1) : ℝ) * ((N : ℝ) - 3) =
        ((N - 3).choose (k - 1) : ℝ) * ((N : ℝ) - k - 2) := by
      have h := congrArg (fun x : ℕ => (x : ℝ)) hstep
      push_cast at h
      rw [Nat.cast_sub (by omega : 3 ≤ N),
        Nat.cast_sub (by omega : 2 ≤ N - k)] at h
      rw [Nat.cast_sub (by omega : k ≤ N)] at h
      push_cast at h
      nlinarith [h]
    have hbound : (28 : ℝ) * ((N : ℝ) - k - 2) ≤
        27 * ((N : ℝ) - 3) := by
      have hbR : (N : ℝ) + 1 < 4 * (k : ℝ) := by exact_mod_cast hband
      have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
      nlinarith
    have hmul := mul_le_mul_of_nonneg_right hbound hq3
    have hboth : (28 * ((N - 4).choose (k - 1) : ℝ)) * ((N : ℝ) - 3) ≤
        (27 * ((N - 3).choose (k - 1) : ℝ)) * ((N : ℝ) - 3) := by
      nlinarith [hmul, hstepR]
    exact (mul_le_mul_iff_of_pos_right hN3).mp hboth
  have hc : (0 : ℝ) < (N.choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos (by omega : k ≤ N)
  have hnum : (8 / 9 : ℝ) * ((N - 4).choose (k - 1) : ℝ) ≤
      (6 / 7 : ℝ) * ((N - 3).choose (k - 1) : ℝ) := by nlinarith [hratio]
  unfold e993TailG
  norm_num
  exact div_le_div_of_nonneg_right hnum (le_of_lt hc)
