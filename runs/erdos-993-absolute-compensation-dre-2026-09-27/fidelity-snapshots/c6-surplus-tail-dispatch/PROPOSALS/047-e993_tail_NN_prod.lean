lemma e993_tail_NN_prod {m : ℕ} (r : Fin m → ℕ) (s : Finset (Fin m)) :
    e993TailNN (∏ j ∈ s, e993TailB (r j)) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using e993_tail_NN_one
  | @insert j s hjs ih =>
      simpa [Finset.prod_insert hjs] using e993_tail_NN_mul (e993_tail_NN_B (r j)) ih
