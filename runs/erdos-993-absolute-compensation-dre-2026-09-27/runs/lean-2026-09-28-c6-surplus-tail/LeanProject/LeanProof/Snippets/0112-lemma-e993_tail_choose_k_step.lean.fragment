lemma e993_tail_choose_k_step (N k : ℕ) (hk : 1 ≤ k) :
    N.choose k * k = N * (N - 1).choose (k - 1) := by
  have h := Nat.choose_mul (n := N) (k := k) (s := 1) hk
  simpa using h
