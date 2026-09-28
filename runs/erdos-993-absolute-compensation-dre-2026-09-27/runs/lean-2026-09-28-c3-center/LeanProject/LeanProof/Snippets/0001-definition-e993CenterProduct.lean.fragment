noncomputable
def e993CenterProduct {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (r : ι → ℕ) : Polynomial ℕ :=
  ∏ i ∈ s, ((1 + Polynomial.X) ^ (r i) + Polynomial.X)
