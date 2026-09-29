lemma e993_tail_choose_adjacent (N k : ℕ) (hk : 1 ≤ k) (hkN : k ≤ N) :
    (N.choose k : ℝ) * (k : ℝ) =
      (N.choose (k - 1) : ℝ) * ((N : ℝ) + 1 - (k : ℝ)) := by
  have hnat := Nat.choose_succ_right_eq N (k - 1)
  have hkm : k - 1 + 1 = k := by omega
  rw [hkm] at hnat
  have hrem : N - (k - 1) = N + 1 - k := by omega
  rw [hrem] at hnat
  have hreal : (N.choose k : ℝ) * (k : ℝ) =
      (N.choose (k - 1) : ℝ) * ((N + 1 - k : ℕ) : ℝ) := by
    exact_mod_cast hnat
  rw [hreal, Nat.cast_sub (by omega : k ≤ N + 1)]
  push_cast
  ring
