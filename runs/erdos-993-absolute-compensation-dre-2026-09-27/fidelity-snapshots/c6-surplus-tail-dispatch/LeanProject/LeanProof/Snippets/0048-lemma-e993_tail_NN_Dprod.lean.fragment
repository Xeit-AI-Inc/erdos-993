lemma e993_tail_NN_Dprod {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (s : Finset (Fin m)) :
    e993TailNN (e993TailD (∑ j ∈ s, r j) (∏ j ∈ s, e993TailB (r j))) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa [e993_tail_D_one] using e993_tail_NN_zero
  | @insert j s hjs ih =>
      have h := e993_tail_NN_add
        (e993_tail_NN_mul (e993_tail_NN_DB (r j) (hr j))
          (e993_tail_NN_prod r s))
        (e993_tail_NN_mul (e993_tail_NN_B (r j)) ih)
      simpa only [Finset.sum_insert hjs, Finset.prod_insert hjs,
        e993_tail_D_mul] using h
