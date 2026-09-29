lemma e993_tail_choose_n_step (N k : ℕ) (hN : 2 ≤ N) (hk : 1 ≤ k)
    (hkN : k ≤ N - 1) :
    (N - 2).choose (k - 1) * (N - 1) =
      (N - 1).choose (k - 1) * (N - k) := by
  have h := Nat.choose_mul_succ_eq (N - 2) (k - 1)
  have h1 : N - 2 + 1 = N - 1 := by omega
  rw [h1] at h
  have h2 : N - 1 - (k - 1) = N - k := by omega
  rw [h2] at h
  exact h
