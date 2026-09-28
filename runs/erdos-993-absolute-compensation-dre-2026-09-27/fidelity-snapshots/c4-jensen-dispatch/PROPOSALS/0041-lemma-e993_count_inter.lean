lemma e993_count_inter {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ j, Fin (r j))) (i : ι) :
    e993BlockCount r S i = (S ∩ e993BlockSet r i).card := by
  rw [e993_count_eq_fiber_card, ← e993_fiber_image r S i]
  rw [Finset.card_image_of_injective]
  intro a b h
  exact HEq.eq (Sigma.mk.inj_iff.mp h).2
