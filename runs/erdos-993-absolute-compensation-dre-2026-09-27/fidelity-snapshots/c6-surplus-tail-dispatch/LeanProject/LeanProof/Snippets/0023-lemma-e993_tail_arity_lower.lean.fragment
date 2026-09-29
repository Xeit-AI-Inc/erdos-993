lemma e993_tail_arity_lower {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) : 2 * m ≤ e993TailN r := by
  have h : (∑ _i : Fin m, 2) ≤ ∑ i, r i := by
    apply Finset.sum_le_sum
    intro j hj
    rcases hr j with hj2 | hj3 | hj4 <;> omega
  simpa [e993TailN, Nat.mul_comm] using h
