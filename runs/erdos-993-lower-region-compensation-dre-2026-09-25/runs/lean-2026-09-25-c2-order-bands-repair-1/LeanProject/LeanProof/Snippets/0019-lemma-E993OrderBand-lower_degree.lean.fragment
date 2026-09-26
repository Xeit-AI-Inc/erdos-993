namespace E993OrderBand

open Classical

lemma lower_degree {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (B : Finset V)
    (hB : B ∈ E993Interior.taggedFamily G U W (k + 1)) :
    k ≤ ((E993Interior.taggedFamily G U W k).bipartiteAbove
      (fun B A => A ⊆ B) B).card := by
  classical
  simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard] at hB
  obtain ⟨⟨hBU, hBcard⟩, hBind, hBtag⟩ := hB
  obtain ⟨w, hwB, hwW⟩ := Finset.not_disjoint_iff.mp hBtag
  have hsub : (B.erase w).image B.erase ⊆
      (E993Interior.taggedFamily G U W k).bipartiteAbove (fun B A => A ⊆ B) B := by
    intro A hA
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hA
    have hvB : v ∈ B := (Finset.mem_erase.mp hv).2
    have hvw : v ≠ w := (Finset.mem_erase.mp hv).1
    have hcard : (B.erase v).card = k := by
      rw [Finset.card_erase_of_mem hvB]
      omega
    have htag : ¬ Disjoint (B.erase v) W :=
      Finset.not_disjoint_iff.mpr ⟨w, Finset.mem_erase.mpr ⟨Ne.symm hvw, hwB⟩, hwW⟩
    have hmem : B.erase v ∈ E993Interior.taggedFamily G U W k := by
      simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
      exact ⟨⟨(Finset.erase_subset v B).trans hBU, hcard⟩,
        hBind.mono (by exact_mod_cast Finset.erase_subset v B), htag⟩
    simp only [Finset.mem_bipartiteAbove]
    exact ⟨hmem, Finset.erase_subset v B⟩
  have hi : ((B.erase w).image B.erase).card = k := by
    rw [Finset.card_image_of_injOn ((Finset.erase_injOn B).mono (Finset.erase_subset w B))]
    rw [Finset.card_erase_of_mem hwB]
    omega
  calc
    k = ((B.erase w).image B.erase).card := hi.symm
    _ ≤ _ := Finset.card_le_card hsub

end E993OrderBand
