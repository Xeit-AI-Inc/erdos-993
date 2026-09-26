namespace E993OrderBand

open Classical

lemma multi_deletion_marked {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (B : Finset V)
    (hB : B ∈ multiFamily G U W k) (v : V) (hv : v ∈ B) :
    B.erase v ∈ E993Interior.taggedFamily G U W k := by
  classical
  obtain ⟨hBtag, hmulti⟩ := Finset.mem_filter.mp hB
  obtain ⟨⟨hBU, hcard⟩, hI, _⟩ :
      (B ⊆ U ∧ B.card = k + 1) ∧ G.IsIndepSet (B : Set V) ∧ ¬ Disjoint B W := by
    simpa only [multiFamily, E993Interior.taggedFamily, Finset.mem_filter,
      Finset.mem_powersetCard] using hBtag
  obtain ⟨a, ha, b, hb, hab⟩ := Finset.one_lt_card.mp (show 1 < (B ∩ W).card by omega)
  have hmark : ¬ Disjoint (B.erase v) W := by
    apply Finset.not_disjoint_iff.mpr
    rcases eq_or_ne a v with haeq | hav
    · have hb' : b ≠ v := by
        intro h
        exact hab (haeq.trans h.symm)
      exact ⟨b, Finset.mem_erase.mpr ⟨hb', (Finset.mem_inter.mp hb).1⟩,
        (Finset.mem_inter.mp hb).2⟩
    · exact ⟨a, Finset.mem_erase.mpr ⟨hav, (Finset.mem_inter.mp ha).1⟩,
        (Finset.mem_inter.mp ha).2⟩
  simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
  refine ⟨⟨(Finset.erase_subset v B).trans hBU, ?_⟩,
    hI.mono (by exact_mod_cast Finset.erase_subset v B), hmark⟩
  rw [Finset.card_erase_of_mem hv]
  omega

end E993OrderBand
