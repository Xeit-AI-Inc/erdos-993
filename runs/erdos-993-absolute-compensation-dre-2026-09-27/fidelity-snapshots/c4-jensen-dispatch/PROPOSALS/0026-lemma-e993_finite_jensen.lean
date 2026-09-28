lemma e993_finite_jensen {α : Type*} [DecidableEq α]
    (s : Finset α) (hs : s.Nonempty) (z : α → ℝ) :
    Real.exp ((∑ x ∈ s, z x) / (s.card : ℝ)) ≤
      (∑ x ∈ s, Real.exp (z x)) / (s.card : ℝ) := by
  have hcard : (0 : ℝ) < s.card := by exact_mod_cast Finset.card_pos.mpr hs
  have h := convexOn_exp.map_centerMass_le
    (t := s) (w := fun _ => (1 : ℝ)) (p := z)
    (by intro i hi; positivity)
    (by simpa using hcard)
    (by intro i hi; trivial)
  simpa [Finset.centerMass, div_eq_mul_inv, smul_eq_mul,
    Finset.sum_mul, mul_comm, mul_left_comm, mul_assoc] using h
