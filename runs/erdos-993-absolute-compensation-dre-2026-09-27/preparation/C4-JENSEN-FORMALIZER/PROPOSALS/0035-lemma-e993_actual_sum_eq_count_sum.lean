lemma e993_actual_sum_eq_count_sum {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
      ∏ i, f i (e993BlockCount r S i) /
        ((r i).choose (e993BlockCount r S i) : ℝ)) =
    ∑ t : (∀ i, Fin (r i + 1)),
      if (∑ i, (t i).val) = k then ∏ i, f i (t i).val else 0 := by
  classical
  let Ω := (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k
  let w := fun S : Finset (Σ i, Fin (r i)) =>
    ∏ i, f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ)
  have hsum := Finset.sum_fiberwise_eq_sum_filter Ω
    (Finset.univ : Finset (∀ i, Fin (r i + 1)))
    (e993CountVec r) w
  have hgroup : ∀ t : (∀ i, Fin (r i + 1)),
      (∑ S ∈ Ω.filter (fun S => e993CountVec r S = t), w S) =
      if (∑ i, (t i).val) = k then ∏ i, f i (t i).val else 0 := by
    intro t
    have hc : (Ω.filter (fun S => e993CountVec r S = t)).card =
        if (∑ i, (t i).val) = k then ∏ i, (r i).choose (t i).val else 0 := by
      simpa only [Ω, ← e993_countvec_eq_iff] using
        e993_card_rank_fiber r k (fun i => (t i).val)
    calc
      (∑ S ∈ Ω.filter (fun S => e993CountVec r S = t), w S) =
          ((Ω.filter (fun S => e993CountVec r S = t)).card : ℝ) *
            (∏ i, f i (t i).val / ((r i).choose (t i).val : ℝ)) := by
        calc
          (∑ S ∈ Ω.filter (fun S => e993CountVec r S = t), w S) =
              ∑ S ∈ Ω.filter (fun S => e993CountVec r S = t),
                (∏ i, f i (t i).val / ((r i).choose (t i).val : ℝ)) := by
            apply Finset.sum_congr rfl
            intro S hS
            have hvec := (Finset.mem_filter.mp hS).2
            simp only [w]
            apply Finset.prod_congr rfl
            intro i hi
            rw [(e993_countvec_eq_iff r S t).mp hvec i]
          _ = _ := by simp
      _ = _ := by
        rw [hc]
        split_ifs with h
        · simpa only [Nat.cast_prod] using e993_prod_choose_mul_weight r f t
        · simp
  calc
    (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
      ∏ i, f i (e993BlockCount r S i) /
        ((r i).choose (e993BlockCount r S i) : ℝ)) =
        ∑ S ∈ Ω, w S := rfl
    _ = ∑ t : (∀ i, Fin (r i + 1)),
          (∑ S ∈ Ω.filter (fun S => e993CountVec r S = t), w S) := by
      simpa using hsum.symm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro t ht
      exact hgroup t
