lemma e993_center_product_expansion {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (r : ι → ℕ) :
    e993CenterProduct s r =
      ∑ t ∈ s.powerset,
        Polynomial.X ^ t.card *
          (1 + Polynomial.X) ^ (∑ i ∈ s \ t, r i) := by
  classical
  unfold e993CenterProduct
  rw [show (∏ i ∈ s, ((1 + Polynomial.X : Polynomial ℕ) ^ (r i) + Polynomial.X)) =
      ∏ i ∈ s, (Polynomial.X + (1 + Polynomial.X) ^ (r i)) from
        Finset.prod_congr rfl (by intro i hi; exact add_comm _ _)]
  rw [Finset.prod_add
    (fun _ : ι => (Polynomial.X : Polynomial ℕ))
    (fun i => (1 + Polynomial.X) ^ (r i)) s]
  apply Finset.sum_congr rfl
  intro t ht
  rw [Finset.prod_const, Finset.prod_pow_eq_pow_sum]
