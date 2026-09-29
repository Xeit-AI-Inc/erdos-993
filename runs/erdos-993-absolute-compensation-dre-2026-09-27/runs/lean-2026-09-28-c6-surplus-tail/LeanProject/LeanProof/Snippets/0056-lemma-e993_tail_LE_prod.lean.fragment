lemma e993_tail_LE_prod {m : ℕ} (r : Fin m → ℕ) (s : Finset (Fin m)) :
    e993TailLE ((1 + Polynomial.X : Polynomial ℝ) ^ (∑ j ∈ s, r j))
      (∏ j ∈ s, e993TailB (r j)) := by
  classical
  induction s using Finset.induction_on with
  | empty => intro n; simp
  | @insert j s hjs ih =>
      have h := e993_tail_LE_mul (e993_tail_LE_B (r j)) ih
        (e993_tail_NN_pow e993_tail_NN_L (∑ j ∈ s, r j)) (e993_tail_NN_B (r j))
      simpa only [Finset.sum_insert hjs, Finset.prod_insert hjs, pow_add] using h
