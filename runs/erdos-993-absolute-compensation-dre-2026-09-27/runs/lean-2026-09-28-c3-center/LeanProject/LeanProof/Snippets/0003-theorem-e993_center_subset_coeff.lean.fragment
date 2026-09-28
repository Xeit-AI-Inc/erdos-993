theorem e993_center_subset_coeff {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (r : ι → ℕ) (k : ℕ) :
    (e993CenterProduct s r).coeff k =
      ∑ t ∈ s.powerset,
        if t.card ≤ k then (∑ i ∈ s \ t, r i).choose (k - t.card) else 0 := by
  rw [e993_center_product_expansion]
  simp only [Polynomial.finsetSum_coeff, Polynomial.coeff_X_pow_mul', Polynomial.coeff_one_add_X_pow,
    Nat.cast_id]
