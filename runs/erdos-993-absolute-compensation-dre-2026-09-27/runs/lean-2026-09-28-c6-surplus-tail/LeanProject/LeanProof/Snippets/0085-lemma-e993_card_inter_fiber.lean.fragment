lemma e993_card_inter_fiber {α : Type*} [DecidableEq α]
    (U A : Finset α) (hAU : A ⊆ U) (k t : ℕ) :
    ((U.powersetCard k).filter (fun S => (S ∩ A).card = t)).card =
      if t ≤ k then A.card.choose t * (U.card - A.card).choose (k - t) else 0 := by
  classical
  by_cases htk : t ≤ k
  · rw [if_pos htk]
    let P := A.powersetCard t ×ˢ (U \ A).powersetCard (k - t)
    have hb : ((U.powersetCard k).filter (fun S => (S ∩ A).card = t)).card = P.card := by
      apply Finset.card_bij'
        (fun S _ => (S ∩ A, S \ A))
        (fun T _ => T.1 ∪ T.2)
      · intro S hS
        rcases Finset.mem_filter.mp hS with ⟨hSk, hSt⟩
        rcases Finset.mem_powersetCard.mp hSk with ⟨hSU, hScard⟩
        apply Finset.mem_product.mpr
        constructor
        · exact Finset.mem_powersetCard.mpr ⟨Finset.inter_subset_right, hSt⟩
        · refine Finset.mem_powersetCard.mpr ⟨?_, ?_⟩
          · grind
          · change (S \ A).card = k - t
            have hcard := Finset.card_sdiff_add_card_inter S A
            omega
      · intro T hT
        rcases Finset.mem_product.mp hT with ⟨hT1, hT2⟩
        rcases Finset.mem_powersetCard.mp hT1 with ⟨hTA, hTcard⟩
        rcases Finset.mem_powersetCard.mp hT2 with ⟨hTU, hRcard⟩
        apply Finset.mem_filter.mpr
        constructor
        · apply Finset.mem_powersetCard.mpr
          constructor
          · grind
          · have hd : Disjoint T.1 T.2 := by
              apply Finset.disjoint_left.mpr
              intro x hx1 hx2
              exact (Finset.mem_sdiff.mp (hTU hx2)).2 (hTA hx1)
            rw [Finset.card_union_of_disjoint hd, hTcard, hRcard]
            omega
        · have heq : (T.1 ∪ T.2) ∩ A = T.1 := by grind
          rw [heq, hTcard]
      · intro S hS
        grind
      · intro T hT
        rcases Finset.mem_product.mp hT with ⟨hT1, hT2⟩
        rcases Finset.mem_powersetCard.mp hT1 with ⟨hTA, _⟩
        rcases Finset.mem_powersetCard.mp hT2 with ⟨hTU, _⟩
        apply Prod.ext
        · grind
        · grind
    rw [hb, Finset.card_product, Finset.card_powersetCard,
      Finset.card_powersetCard, Finset.card_sdiff_of_subset hAU]
  · rw [if_neg htk]
    apply Finset.card_eq_zero.mpr
    ext S
    have hnot : ¬ (S ∈ U.powersetCard k ∧ (S ∩ A).card = t) := by
      intro h
      have hk := (Finset.mem_powersetCard.mp h.1).2
      have hle := Finset.card_le_card (Finset.inter_subset_left : S ∩ A ⊆ S)
      omega
    simpa [Finset.mem_filter] using hnot
