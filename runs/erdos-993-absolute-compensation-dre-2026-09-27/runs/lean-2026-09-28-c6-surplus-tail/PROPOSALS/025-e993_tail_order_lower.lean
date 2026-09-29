lemma e993_tail_order_lower {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) : e993TailN r + 1 ≤ e993TailH r := by
  have h : (∑ i, r i) ≤ ∑ i, (if r i = 2 then 2 else if r i = 3 then 4 else 7) := by
    apply Finset.sum_le_sum
    intro j hj
    rcases hr j with hj2 | hj3 | hj4
    · simp [hj2]
    · simp [hj3]
    · simp [hj4]
  unfold e993TailN e993TailH
  omega
