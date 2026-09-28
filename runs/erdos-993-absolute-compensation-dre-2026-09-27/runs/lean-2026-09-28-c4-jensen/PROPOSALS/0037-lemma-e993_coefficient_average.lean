lemma e993_coefficient_average {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (e993BlockProduct r f).coeff k / e993BlockMass r k =
      e993SubsetAverage r f k := by
  unfold e993SubsetAverage e993BlockMass
  rw [e993_coeff_actual, e993_card_subsets]
