lemma e993_card_rank_fiber {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (k : ℕ) (t : ι → ℕ) :
    (((Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k).filter
      (fun S => ∀ i, e993BlockCount r S i = t i)).card =
      if (∑ i, t i) = k then ∏ i, (r i).choose (t i) else 0 := by
  classical
  have hfull :
      ((Finset.univ : Finset (Finset (Σ i, Fin (r i)))).filter
        (fun S => ∀ i, e993BlockCount r S i = t i)).card =
        ∏ i, (r i).choose (t i) := by
    rw [← e993_card_joint_fiber r t, Fintype.card_subtype]
  by_cases hsum : (∑ i, t i) = k
  · rw [if_pos hsum, ← hfull]
    congr 1
    ext S
    simp only [Finset.mem_filter, Finset.mem_powersetCard, Finset.mem_univ,
      true_and]
    constructor
    · exact fun h => h.2
    · intro h
      refine ⟨⟨Finset.subset_univ _, ?_⟩, h⟩
      calc
        S.card = ∑ i, e993BlockCount r S i := (e993_sum_counts r S).symm
        _ = ∑ i, t i := Finset.sum_congr rfl (fun i _ => h i)
        _ = k := hsum
  · rw [if_neg hsum]
    apply Finset.card_eq_zero.mpr
    ext S
    have hnot : ¬ ((S ⊆ (Finset.univ : Finset (Σ i, Fin (r i))) ∧ S.card = k) ∧
        ∀ i, e993BlockCount r S i = t i) := by
      intro hS
      apply hsum
      calc
        ∑ i, t i = ∑ i, e993BlockCount r S i :=
          Finset.sum_congr rfl (fun i _ => (hS.2 i).symm)
        _ = S.card := e993_sum_counts r S
        _ = k := hS.1.2
    simpa [Finset.mem_filter, Finset.mem_powersetCard] using hnot
