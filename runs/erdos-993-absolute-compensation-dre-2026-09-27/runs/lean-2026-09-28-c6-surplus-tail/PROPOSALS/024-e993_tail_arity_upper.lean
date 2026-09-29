lemma e993_tail_arity_upper {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) : e993TailN r ≤ 4 * m := by
  have h : (∑ i, r i) ≤ ∑ _i : Fin m, 4 := by
    apply Finset.sum_le_sum
    intro j hj
    rcases hr j with hj2 | hj3 | hj4 <;> omega
  simpa [e993TailN, Nat.mul_comm] using h
