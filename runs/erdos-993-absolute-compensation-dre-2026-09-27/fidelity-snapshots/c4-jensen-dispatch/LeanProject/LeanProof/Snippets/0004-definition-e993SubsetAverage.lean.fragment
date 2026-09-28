noncomputable
def e993SubsetAverage {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) : ℝ :=
  (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
    ∏ i, f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ)) /
    (((Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k).card : ℝ)
