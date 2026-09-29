lemma e993_tail_Q_predecessor_bracket {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (k : ℕ) (hk : 2 ≤ k) (hlow : 4 * k ≤ e993TailN r + 1) :
    ((e993TailN r).choose k : ℝ) * (e993TailQ r).coeff (k - 2) ≤
      ((e993TailN r).choose (k - 1) : ℝ) * (e993TailQ r).coeff (k - 1) := by
  let N := e993TailN r
  let q0 : ℝ := (e993TailQ r).coeff (k - 2)
  let q1 : ℝ := (e993TailQ r).coeff (k - 1)
  let c0 : ℝ := (N.choose (k - 2) : ℝ)
  let c1 : ℝ := (N.choose (k - 1) : ℝ)
  let c2 : ℝ := (N.choose k : ℝ)
  have hkN : k ≤ N := by dsimp [N]; omega
  have hc0 : 0 < c0 := by
    dsimp [c0]
    exact_mod_cast Nat.choose_pos (by omega : k - 2 ≤ N)
  have hc1 : 0 < c1 := by
    dsimp [c1]
    exact_mod_cast Nat.choose_pos (by omega : k - 1 ≤ N)
  have hq0 : 0 ≤ q0 := by
    dsimp [q0, e993TailQ]
    exact e993_tail_NN_prod r Finset.univ (k - 2)
  have hlowprev : 4 * (k - 1) ≤ N + 1 := by omega
  have hrise : c1 * q0 ≤ c0 * q1 := by
    simpa only [N, c0, c1, q0, q1, show k - 1 - 1 = k - 2 by omega] using
      e993_tail_Q_normalized_rise r hr (k - 1) (by omega) hlowprev
  have hlog : c0 * c2 ≤ c1 ^ 2 := by
    simpa only [N, c0, c1, c2, show k - 1 - 1 = k - 2 by omega,
      show k - 1 + 1 = k by omega] using
      e993_tail_choose_logconcave N (k - 1) (by omega) (by omega)
  have hprod := mul_le_mul_of_nonneg_left hrise (le_of_lt hc1)
  have hlogprod := mul_le_mul_of_nonneg_right hlog hq0
  have hcross : 0 ≤ c0 * (c1 * q1 - c2 * q0) := by
    nlinarith [hprod, hlogprod]
  have hres : c2 * q0 ≤ c1 * q1 := by nlinarith [hcross]
  exact hres
