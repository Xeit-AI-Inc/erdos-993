noncomputable
def e993BlockExponent {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) : ℝ :=
  ∑ i, ∑ t ∈ Finset.range (r i + 1),
    (if t ≤ k then
      ((r i).choose t : ℝ) * (((∑ j, r j) - r i).choose (k - t) : ℝ) /
        e993BlockMass r k
    else 0) *
    (2 * (f i t - ((r i).choose t : ℝ)) /
      (f i t + ((r i).choose t : ℝ)))
