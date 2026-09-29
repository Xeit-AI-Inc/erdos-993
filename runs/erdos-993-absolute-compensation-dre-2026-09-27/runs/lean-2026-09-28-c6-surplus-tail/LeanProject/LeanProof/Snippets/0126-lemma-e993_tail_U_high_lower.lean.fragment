lemma e993_tail_U_high_lower
    (m : ℕ) (hm : 100 ≤ m) (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k)
    (hband : e993TailN r + 1 < 4 * k)
    (hguard : 2 * k ≤ e993TailN r + 2) :
    ((e993TailN r).choose k : ℝ) * ((m : ℝ) + 2) <
      (e993TailU r i).coeff k := by
  have hkN : k ≤ e993TailN r := e993_tail_guard_le_N r hm hr k hguard
  have hc : (0 : ℝ) < ((e993TailN r).choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos hkN
  have hexp := e993_tail_exponent_lower r hm hr i k hk hband hguard
  have hmono : Real.exp ((((m - 1 : ℕ) : ℝ) / 20)) ≤
      Real.exp (e993BlockExponent (e993TailBlockSize r i)
        (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) k) :=
    Real.exp_le_exp.mpr hexp
  have hgrowth := e993_tail_exp_growth m hm
  have hj := e993_tail_jensen_raw r hr i k hkN
  have hstrict := mul_lt_mul_of_pos_left hgrowth hc
  have hweak := mul_le_mul_of_nonneg_left hmono (le_of_lt hc)
  exact (hstrict.trans_le hweak).trans_le hj
