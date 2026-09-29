lemma e993_tail_NN_DB (a : ℕ) (ha : a = 2 ∨ a = 3 ∨ a = 4) :
    e993TailNN (e993TailD a (e993TailB a)) := by
  rcases ha with h | h | h
  · subst a
    rw [e993_tail_D_B2]
    exact e993_tail_NN_nat 5
  · subst a
    rw [e993_tail_D_B3]
    exact e993_tail_NN_add
      (e993_tail_NN_add (e993_tail_NN_nat 6)
        (e993_tail_NN_mul (e993_tail_NN_nat 2) e993_tail_NN_X))
      (e993_tail_NN_mul (e993_tail_NN_nat 3)
        (e993_tail_NN_pow e993_tail_NN_X 2))
  · subst a
    rw [e993_tail_D_B4]
    exact e993_tail_NN_add
      (e993_tail_NN_add
        (e993_tail_NN_add (e993_tail_NN_nat 7)
          (e993_tail_NN_mul (e993_tail_NN_nat 6) e993_tail_NN_X))
        (e993_tail_NN_mul (e993_tail_NN_nat 12)
          (e993_tail_NN_pow e993_tail_NN_X 2)))
      (e993_tail_NN_mul (e993_tail_NN_nat 4)
        (e993_tail_NN_pow e993_tail_NN_X 3))
