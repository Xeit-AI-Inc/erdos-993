open scoped BigOperators

noncomputable
def e993BlockProduct {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) : Polynomial ℝ :=
  ∏ i, ∑ t ∈ Finset.range (r i + 1), Polynomial.monomial t (f i t)
