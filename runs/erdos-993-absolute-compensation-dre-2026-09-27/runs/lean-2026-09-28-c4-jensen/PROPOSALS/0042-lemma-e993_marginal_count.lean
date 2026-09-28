lemma e993_marginal_count {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) (k t : ℕ) :
    (((Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k).filter
      (fun S => e993BlockCount r S i = t)).card =
      if t ≤ k then (r i).choose t *
        ((∑ j, r j) - r i).choose (k - t) else 0 := by
  classical
  calc
    (((Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k).filter
      (fun S => e993BlockCount r S i = t)).card =
        (((Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k).filter
          (fun S => (S ∩ e993BlockSet r i).card = t)).card := by
      congr 1
      ext S
      simp only [Finset.mem_filter]
      rw [e993_count_inter]
    _ = if t ≤ k then Nat.choose (e993BlockSet r i).card t *
          Nat.choose ((Finset.univ : Finset (Σ j, Fin (r j))).card -
            (e993BlockSet r i).card) (k - t) else 0 :=
      e993_card_inter_fiber _ _ (Finset.subset_univ _) k t
    _ = _ := by
      simp [e993_blockset_card]
