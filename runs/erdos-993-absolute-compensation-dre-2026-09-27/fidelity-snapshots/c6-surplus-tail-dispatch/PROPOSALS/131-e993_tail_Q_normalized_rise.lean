lemma e993_tail_Q_normalized_rise {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (k : ℕ) (hk : 1 ≤ k) (hlow : 4 * k ≤ e993TailN r + 1) :
    ((e993TailN r).choose k : ℝ) * (e993TailQ r).coeff (k - 1) ≤
      ((e993TailN r).choose (k - 1) : ℝ) * (e993TailQ r).coeff k := by
  classical
  rw [e993_tail_Q_coeff r k, e993_tail_Q_coeff r (k - 1)]
  simp only [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro t ht
  let R := ∑ j ∈ t, r j
  let s := t.card
  have hRsum : R + (∑ j ∈ (Finset.univ : Finset (Fin m)) \ t, r j) =
      e993TailN r := by
    simpa [R, e993TailN, Finset.compl_eq_univ_sdiff] using
      (Finset.sum_add_sum_compl t r)
  have hRN : R ≤ e993TailN r := by omega
  have hRs : R ≤ 4 * s := by
    have h : (∑ j ∈ t, r j) ≤ ∑ _j ∈ t, 4 := by
      apply Finset.sum_le_sum
      intro j hj
      rcases hr j with hj2 | hj3 | hj4 <;> omega
    simpa [R, s, Nat.mul_comm] using h
  have hcomp : e993TailN r - R =
      ∑ j ∈ (Finset.univ : Finset (Fin m)) \ t, r j := by omega
  have h := e993_tail_subset_cross (e993TailN r) R s k hk hRN hRs hlow
  rw [hcomp] at h
  exact h
