lemma e993_card_joint_fiber {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (t : ι → ℕ) :
    Fintype.card {S : Finset (Σ i, Fin (r i)) //
      ∀ i, e993BlockCount r S i = t i} =
      ∏ i, (r i).choose (t i) := by
  classical
  calc
    Fintype.card {S : Finset (Σ i, Fin (r i)) //
      ∀ i, e993BlockCount r S i = t i} =
        Fintype.card (∀ i, {T : Finset (Fin (r i)) // T.card = t i}) :=
          Fintype.card_congr (e993CountFiberEquiv r t)
    _ = ∏ i, Fintype.card {T : Finset (Fin (r i)) // T.card = t i} :=
      Fintype.card_pi
    _ = ∏ i, (r i).choose (t i) := by
      apply Finset.prod_congr rfl
      intro i hi
      exact e993_card_block_fiber (r i) (t i)
