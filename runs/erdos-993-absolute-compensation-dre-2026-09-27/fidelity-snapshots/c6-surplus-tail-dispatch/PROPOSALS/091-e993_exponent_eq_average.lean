lemma e993_exponent_eq_average {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    e993BlockExponent r f k =
      (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
        ∑ i, 2 * (f i (e993BlockCount r S i) -
          ((r i).choose (e993BlockCount r S i) : ℝ)) /
          (f i (e993BlockCount r S i) +
          ((r i).choose (e993BlockCount r S i) : ℝ))) /
        e993BlockMass r k := by
  classical
  let Ω := (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k
  let g := fun i t => 2 * (f i t - ((r i).choose t : ℝ)) /
    (f i t + ((r i).choose t : ℝ))
  have hsingle : ∀ i,
      (∑ t ∈ Finset.range (r i + 1),
        (if t ≤ k then ((r i).choose t : ℝ) *
          (((∑ j, r j) - r i).choose (k - t) : ℝ) /
          e993BlockMass r k else 0) * g i t) =
      (∑ S ∈ Ω, g i (e993BlockCount r S i)) / e993BlockMass r k := by
    intro i
    rw [e993_marginal_sum r i k (g i), Finset.sum_div]
    apply Finset.sum_congr rfl
    intro t ht
    split_ifs with h
    · ring
    · simp
  calc
    e993BlockExponent r f k =
      ∑ i, ∑ t ∈ Finset.range (r i + 1),
        (if t ≤ k then ((r i).choose t : ℝ) *
          (((∑ j, r j) - r i).choose (k - t) : ℝ) /
          e993BlockMass r k else 0) * g i t := rfl
    _ = ∑ i, (∑ S ∈ Ω, g i (e993BlockCount r S i)) /
          e993BlockMass r k := by
      apply Finset.sum_congr rfl
      intro i hi
      exact hsingle i
    _ = (∑ i, ∑ S ∈ Ω, g i (e993BlockCount r S i)) /
          e993BlockMass r k := by rw [Finset.sum_div]
    _ = (∑ S ∈ Ω, ∑ i, g i (e993BlockCount r S i)) /
          e993BlockMass r k := by rw [Finset.sum_comm]
    _ = _ := rfl
