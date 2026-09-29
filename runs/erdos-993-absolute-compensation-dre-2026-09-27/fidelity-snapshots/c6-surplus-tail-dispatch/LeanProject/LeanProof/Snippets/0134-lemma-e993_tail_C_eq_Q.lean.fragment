lemma e993_tail_C_eq_Q (m : ℕ) (r : Fin m → ℕ) :
    e993TailC r = e993TailQ r + 2 * Polynomial.X * e993TailQ r := by
  have hb : e993TailB 1 = 1 + 2 * Polynomial.X := by
    simp [e993TailB]
    ring
  rw [e993TailC, e993TailQ, hb]
  ring
