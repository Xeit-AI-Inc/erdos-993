lemma e993_tail_NN_DC {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) :
    e993TailNN (e993TailD (e993TailN r + 1) (e993TailC r)) := by
  have hroot : e993TailNN (e993TailD 1 (e993TailB 1)) := by
    rw [e993_tail_D_B1]
    exact e993_tail_NN_nat 4
  have h := e993_tail_NN_add
    (e993_tail_NN_mul hroot
      (e993_tail_NN_prod r Finset.univ))
    (e993_tail_NN_mul (e993_tail_NN_B 1)
      (e993_tail_NN_Dprod r hr Finset.univ))
  change e993TailNN (e993TailD ((∑ j, r j) + 1)
    (e993TailB 1 * ∏ j, e993TailB (r j)))
  rw [show (∑ j, r j) + 1 = 1 + (∑ j, r j) from Nat.add_comm _ _]
  rw [e993_tail_D_mul]
  exact h
