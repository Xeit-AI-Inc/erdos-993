lemma e993_tail_guard_le_N {m : ℕ} (r : Fin m → ℕ)
    (hm : 100 ≤ m) (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (k : ℕ) (hguard : 2 * k ≤ e993TailN r + 2) :
    k ≤ e993TailN r := by
  have hN := e993_tail_arity_lower r hr
  omega
