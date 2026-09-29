theorem e993_guarded_tip_surplus_tail
    (m : ℕ) (hm : 100 ≤ m) (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k) (hguard : 2 * k ≤ e993TailN r + 2) :
    0 < ((e993TailH r : ℝ) + 1) * (e993TailU r i).coeff k * (e993TailC r).coeff k +
      ((k : ℝ) + 1) * ((e993TailH r : ℝ) - (k : ℝ) + 1) *
        ((e993TailE r).coeff k * (e993TailC r).coeff k -
          (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1)) := by
  by_cases hlow : 4 * k ≤ e993TailN r + 1
  · have hkN : k ≤ e993TailN r := e993_tail_guard_le_N r hm hr k hguard
    have hi : 1 ≤ r i := by
      rcases hr i with h | h | h <;> omega
    have hU : 0 < (e993TailU r i).coeff k :=
      e993_tail_U_coeff_pos r i hi k hkN
    have hC : 0 < (e993TailC r).coeff k :=
      e993_tail_C_coeff_pos r k (by omega)
    have hH : e993TailN r + 1 ≤ e993TailH r := e993_tail_order_lower r hr
    have hHR : (e993TailN r : ℝ) + 1 ≤ e993TailH r := by exact_mod_cast hH
    have hkR : (k : ℝ) ≤ e993TailN r := by exact_mod_cast hkN
    have hHpos : 0 < (e993TailH r : ℝ) + 1 := by nlinarith
    have hcurv : 0 < (e993TailH r : ℝ) - (k : ℝ) + 1 := by nlinarith
    have hg : 0 < ((k : ℝ) + 1) * ((e993TailH r : ℝ) - (k : ℝ) + 1) :=
      mul_pos (by positivity) hcurv
    have hfirst : 0 < ((e993TailH r : ℝ) + 1) *
        (e993TailU r i).coeff k * (e993TailC r).coeff k :=
      mul_pos (mul_pos hHpos hU) hC
    have hminor := e993_tail_E_minor_low r hr k hk hlow
    have hsecond := mul_nonneg (le_of_lt hg) hminor
    linarith
  · have hband : e993TailN r + 1 < 4 * k := by omega
    have hU := e993_tail_U_high_lower m hm r hr i k hk hband hguard
    exact e993_tail_payment_from_U m hm r hr i k hk hguard hU
