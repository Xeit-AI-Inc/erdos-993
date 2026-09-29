lemma e993_tail_choose_four (N k : ℕ) (hN : 8 ≤ N)
    (hk : 1 ≤ k) (hkN : k ≤ N - 3) :
    (N.choose k) * k * (N - k) * (N - k - 1) * (N - k - 2) =
      (N - 4).choose (k - 1) * N * (N - 1) * (N - 2) * (N - 3) := by
  have h0 := e993_tail_choose_k_step N k hk
  have h1 := e993_tail_choose_n_step N k (by omega) hk (by omega)
  have h2 := e993_tail_choose_n_step (N - 1) k (by omega) hk (by omega)
  have h3 := e993_tail_choose_n_step (N - 2) k (by omega) hk (by omega)
  have hN1 : N - 1 - 2 = N - 3 := by omega
  have hN2 : N - 1 - 1 = N - 2 := by omega
  have hK1 : N - 1 - k = N - k - 1 := by omega
  rw [hN1, hN2, hK1] at h2
  have hN3 : N - 2 - 2 = N - 4 := by omega
  have hN4 : N - 2 - 1 = N - 3 := by omega
  have hK2 : N - 2 - k = N - k - 2 := by omega
  rw [hN3, hN4, hK2] at h3
  calc
    (N.choose k) * k * (N - k) * (N - k - 1) * (N - k - 2) =
      N * (N - 1).choose (k - 1) * (N - k) * (N - k - 1) * (N - k - 2) := by rw [h0]
    _ = N * ((N - 2).choose (k - 1) * (N - 1)) * (N - k - 1) *
        (N - k - 2) := by rw [h1]; ring
    _ = N * (N - 1) * ((N - 3).choose (k - 1) * (N - 2)) *
        (N - k - 2) := by rw [h2]; ring
    _ = (N - 4).choose (k - 1) * N * (N - 1) * (N - 2) * (N - 3) := by
      calc
        _ = N * (N - 1) * (N - 2) *
            ((N - 3).choose (k - 1) * (N - k - 2)) := by ring
        _ = N * (N - 1) * (N - 2) *
            ((N - 4).choose (k - 1) * (N - 3)) := by rw [← h3]
        _ = _ := by ring
