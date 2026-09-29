lemma e993_tail_LE_C {m : ℕ} (r : Fin m → ℕ) :
    e993TailLE ((1 + Polynomial.X : Polynomial ℝ) ^ (e993TailN r + 1))
      (e993TailC r) := by
  have h := e993_tail_LE_mul (e993_tail_LE_B 1)
    (e993_tail_LE_prod r Finset.univ)
    (e993_tail_NN_pow e993_tail_NN_L (∑ j, r j))
    (e993_tail_NN_B 1)
  intro n
  change ((1 + Polynomial.X : Polynomial ℝ) ^ (e993TailN r + 1)).coeff n ≤
    (e993TailB 1 * ∏ j, e993TailB (r j)).coeff n
  rw [show e993TailN r + 1 = 1 + e993TailN r from Nat.add_comm _ _, pow_add]
  simpa only [e993TailN, pow_one] using h n
