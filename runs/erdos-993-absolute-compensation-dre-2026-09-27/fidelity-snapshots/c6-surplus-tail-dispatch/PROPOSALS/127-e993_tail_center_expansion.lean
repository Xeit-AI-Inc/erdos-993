lemma e993_tail_center_expansion {m : ℕ} (s : Finset (Fin m)) (r : Fin m → ℕ) :
    (∏ j ∈ s, e993TailB (r j)) =
      ∑ t ∈ s.powerset,
        Polynomial.X ^ t.card *
          (1 + Polynomial.X) ^ (∑ j ∈ s \ t, r j) := by
  classical
  unfold e993TailB
  rw [show (∏ j ∈ s, ((1 + Polynomial.X : Polynomial ℝ) ^ (r j) + Polynomial.X)) =
      ∏ j ∈ s, (Polynomial.X + (1 + Polynomial.X) ^ (r j)) from
        Finset.prod_congr rfl (by intro j hj; exact add_comm _ _)]
  rw [Finset.prod_add
    (fun _ : Fin m => (Polynomial.X : Polynomial ℝ))
    (fun j => (1 + Polynomial.X) ^ (r j)) s]
  apply Finset.sum_congr rfl
  intro t ht
  rw [Finset.prod_const, Finset.prod_pow_eq_pow_sum]
