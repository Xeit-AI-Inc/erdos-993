lemma e993_blockset_card {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) : (e993BlockSet r i).card = r i := by
  unfold e993BlockSet
  rw [Finset.card_image_of_injective]
  · simp
  · intro a b h
    exact HEq.eq (Sigma.mk.inj_iff.mp h).2
