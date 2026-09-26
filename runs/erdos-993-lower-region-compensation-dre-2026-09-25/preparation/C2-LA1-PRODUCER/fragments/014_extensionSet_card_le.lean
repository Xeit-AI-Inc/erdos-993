namespace E993OrderBand

open Classical

lemma extensionSet_card_le {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U A : Finset V) (hAU : A ⊆ U) :
    (extensionSet G U A).card + A.card ≤ U.card := by
  have h := Finset.card_le_card (extensionSet_subset G U A)
  rw [Finset.card_sdiff_of_subset hAU] at h
  have hcard := Finset.card_le_card hAU
  omega

end E993OrderBand
