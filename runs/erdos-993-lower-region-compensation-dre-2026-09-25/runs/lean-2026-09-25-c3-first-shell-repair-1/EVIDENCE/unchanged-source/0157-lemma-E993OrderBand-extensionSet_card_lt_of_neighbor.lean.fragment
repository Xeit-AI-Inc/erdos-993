namespace E993OrderBand

open Classical

lemma extensionSet_card_lt_of_neighbor {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U A : Finset V) (hAU : A ⊆ U)
    (hI : G.IsIndepSet (A : Set V))
    (hx : ∃ x ∈ U, ∃ a ∈ A, G.Adj x a) :
    (extensionSet G U A).card + A.card < U.card := by
  obtain ⟨x, hxU, a, haA, hxa⟩ := hx
  have hxA : x ∉ A := by
    intro hxA
    exact (G.isIndepSet_iff.mp hI) hxA haA hxa.ne hxa
  have hxE : x ∉ extensionSet G U A := by
    intro hxE
    have hi : G.IsIndepSet ((insert x A : Finset V) : Set V) :=
      (Finset.mem_filter.mp hxE).2.2
    have hp := G.isIndepSet_iff.mp hi
    exact hp (by simp) (by simp [haA]) hxa.ne hxa
  have hsub := extensionSet_subset G U A
  have hssub : extensionSet G U A ⊂ U \ A :=
    (Finset.ssubset_iff_of_subset hsub).mpr
      ⟨x, Finset.mem_sdiff.mpr ⟨hxU, hxA⟩, hxE⟩
  have hlt := Finset.card_lt_card hssub
  rw [Finset.card_sdiff_of_subset hAU] at hlt
  have hcard := Finset.card_le_card hAU
  omega

end E993OrderBand
