namespace E993OrderBand

open Classical

lemma multi_lower_degree {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (B : Finset V)
    (hB : B ∈ multiFamily G U W k) :
    k + 1 ≤ ((E993Interior.taggedFamily G U W k).bipartiteAbove
      (fun B A => A ⊆ B) B).card := by
  classical
  have hcard : B.card = k + 1 := by
    have h := (Finset.mem_filter.mp hB).1
    simp only [E993Interior.taggedFamily, Finset.mem_filter,
      Finset.mem_powersetCard] at h
    exact h.1.2
  have hsub : (B.image B.erase) ⊆
      (E993Interior.taggedFamily G U W k).bipartiteAbove (fun B A => A ⊆ B) B := by
    intro A hA
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hA
    simp only [Finset.mem_bipartiteAbove]
    exact ⟨multi_deletion_marked G U W k B hB v hv, Finset.erase_subset v B⟩
  calc
    k + 1 = (B.image B.erase).card := by
      rw [Finset.card_image_of_injOn (Finset.erase_injOn B)]
      exact hcard.symm
    _ ≤ _ := Finset.card_le_card hsub

end E993OrderBand
