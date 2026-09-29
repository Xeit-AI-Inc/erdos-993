lemma e993_tail_U_coeff_pos {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hi : 1 ≤ r i) (k : ℕ) (hk : k ≤ e993TailN r) :
    0 < (e993TailU r i).coeff k := by
  have hchoose : 0 < ((e993TailN r).choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos hk
  exact lt_of_lt_of_le hchoose (e993_tail_U_coeff_floor r i hi k)
