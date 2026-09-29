lemma e993_tail_C_coeff_pos {m : ℕ} (r : Fin m → ℕ) (k : ℕ)
    (hk : k ≤ e993TailN r + 1) : 0 < (e993TailC r).coeff k := by
  have hchoose : 0 < ((e993TailN r + 1).choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos hk
  exact lt_of_lt_of_le hchoose (e993_tail_C_coeff_floor r k)
