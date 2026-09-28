lemma e993_marginal_sum {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) (k : ℕ) (g : ℕ → ℝ) :
    (∑ S ∈ (Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k,
      g (e993BlockCount r S i)) =
      ∑ t ∈ Finset.range (r i + 1),
        (if t ≤ k then ((r i).choose t : ℝ) *
          (((∑ j, r j) - r i).choose (k - t) : ℝ) else 0) * g t := by
  classical
  let Ω := (Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k
  have hsum := Finset.sum_fiberwise_eq_sum_filter Ω
    (Finset.range (r i + 1)) (fun S => e993BlockCount r S i)
    (fun S => g (e993BlockCount r S i))
  have hgroup : ∀ t ∈ Finset.range (r i + 1),
      (∑ S ∈ Ω.filter (fun S => e993BlockCount r S i = t),
        g (e993BlockCount r S i)) =
      (if t ≤ k then ((r i).choose t : ℝ) *
          (((∑ j, r j) - r i).choose (k - t) : ℝ) else 0) * g t := by
    intro t ht
    calc
      (∑ S ∈ Ω.filter (fun S => e993BlockCount r S i = t),
        g (e993BlockCount r S i)) =
        (∑ S ∈ Ω.filter (fun S => e993BlockCount r S i = t), g t) := by
          apply Finset.sum_congr rfl
          intro S hS
          rw [(Finset.mem_filter.mp hS).2]
      _ = ((Ω.filter (fun S => e993BlockCount r S i = t)).card : ℝ) * g t := by simp
      _ = _ := by
        rw [e993_marginal_count r i k t]
        split_ifs <;> norm_cast
  calc
    (∑ S ∈ (Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k,
      g (e993BlockCount r S i)) =
      ∑ S ∈ Ω, g (e993BlockCount r S i) := rfl
    _ = ∑ t ∈ Finset.range (r i + 1),
        ∑ S ∈ Ω.filter (fun S => e993BlockCount r S i = t),
          g (e993BlockCount r S i) := by
      rw [hsum, Finset.filter_true_of_mem (fun S hS =>
        Finset.mem_range.mpr (Nat.lt_succ_of_le (e993_count_le r S i)))]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro t ht
      exact hgroup t ht
