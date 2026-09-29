lemma e993_tail_C_ratio {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (k : ℕ) (hk : 1 ≤ k) :
    2 * ((e993TailN r : ℝ) + 2 - (k : ℝ)) * (e993TailC r).coeff (k - 1) ≤
      3 * (k : ℝ) * (e993TailC r).coeff k := by
  obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
  convert e993_tail_C_ratio_succ r hr j using 1 <;> push_cast <;> ring
