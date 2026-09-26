namespace E993OrderBand

open Classical

lemma upper_degree_le_extensions {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (A : Finset V)
    (hA : A ∈ E993Interior.taggedFamily G U W k) :
    ((E993Interior.taggedFamily G U W (k + 1)).bipartiteBelow
      (fun B A => A ⊆ B) A).card ≤ (extensionSet G U A).card := by
  classical
  obtain ⟨⟨hAU, hAcard⟩, hAind, _⟩ :
      (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
    simpa only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] using hA
  have hmap : ((E993Interior.taggedFamily G U W (k + 1)).bipartiteBelow
      (fun B A => A ⊆ B) A).card ≤ ((extensionSet G U A).powersetCard 1).card := by
    apply Finset.card_le_card_of_injOn (fun B : Finset V => B \ A)
    · intro B hB
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hB
      obtain ⟨hB, hAB⟩ := hB
      obtain ⟨⟨hBU, hBcard⟩, hBind, _⟩ :
          (B ⊆ U ∧ B.card = k + 1) ∧ G.IsIndepSet (B : Set V) ∧ ¬ Disjoint B W := by
        simpa only [E993Interior.taggedFamily, Finset.mem_filter,
          Finset.mem_powersetCard] using hB
      apply Finset.mem_powersetCard.mpr
      constructor
      · intro y hy
        have hyB : y ∈ B := (Finset.mem_sdiff.mp hy).1
        have hyA : y ∉ A := (Finset.mem_sdiff.mp hy).2
        apply Finset.mem_filter.mpr
        refine ⟨hBU hyB, hyA, ?_⟩
        apply hBind.mono
        exact_mod_cast (show insert y A ⊆ B from Finset.insert_subset hyB hAB)
      · rw [Finset.card_sdiff_of_subset hAB]
        omega
    · intro B hB C hC hBC
      simp only [Finset.mem_coe, Finset.mem_bipartiteBelow] at hB hC
      exact (Finset.superset_injOn_sdiff A) hB.2 hC.2 hBC
  simpa [Finset.card_powersetCard] using hmap

end E993OrderBand
