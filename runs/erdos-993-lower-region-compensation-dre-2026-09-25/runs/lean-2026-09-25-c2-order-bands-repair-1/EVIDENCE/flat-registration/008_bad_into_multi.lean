namespace E993OrderBand

open Classical

lemma bad_into_multi {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 2 ≤ k)
    (y : V) (hyU : y ∈ U) (hy : ∃ z ∈ U, G.Adj y z)
    (hcover : IsolateCoveredOn G U W) :
    (badFamily G U W k).card ≤ (multiFamily G U W k).card := by
  classical
  apply Finset.card_le_card_of_injOn (fun A : Finset V => insert y A)
  · intro A hA
    obtain ⟨hAtag, hbad⟩ := Finset.mem_filter.mp hA
    obtain ⟨⟨hAU, hcard⟩, hI, _⟩ :
        (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
      simpa only [badFamily, E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] using hAtag
    have hyA : y ∉ A := by
      obtain ⟨z, hzU, hyz⟩ := hy
      intro hya
      exact hbad z hzU y hya hyz.symm
    have hAI : G.IsIndepSet ((insert y A : Finset V) : Set V) := by
      rw [SimpleGraph.isIndepSet_iff] at hI ⊢
      intro a ha b hb hab hadj
      simp only [Finset.coe_insert, Set.mem_insert_iff, Finset.mem_coe] at ha hb
      rcases ha with ha | ha
      · rcases hb with hb | hb
        · subst a; subst b; exact hab rfl
        · subst a; exact hbad y hyU b hb hadj
      · rcases hb with hb | hb
        · subst b; exact hbad y hyU a ha hadj.symm
        · exact hI ha hb hab hadj
    have hmarks : A ⊆ W := by
      intro a ha
      apply hcover a (hAU ha)
      intro z hz hadj
      exact hbad z hz a ha hadj.symm
    have hmulti : 2 ≤ ((insert y A) ∩ W).card := by
      have hsub : A ⊆ (insert y A) ∩ W := by
        intro a ha
        simp only [Finset.mem_inter, Finset.mem_insert]
        exact ⟨Or.inr ha, hmarks ha⟩
      have hle := Finset.card_le_card hsub
      omega
    apply Finset.mem_filter.mpr
    constructor
    · simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
      refine ⟨⟨?_, ?_⟩, hAI, ?_⟩
      · exact Finset.insert_subset hyU hAU
      · rw [Finset.card_insert_of_notMem hyA, hcard]
      · exact Finset.not_disjoint_iff.mpr
          (by obtain ⟨a, ha, haw⟩ := Finset.not_disjoint_iff.mp ‹¬ Disjoint A W›
              exact ⟨a, Finset.mem_insert_of_mem ha, haw⟩)
    · exact hmulti
  · intro A hA B hB heq
    have hyA : y ∉ A := by
      obtain ⟨z, hzU, hyz⟩ := hy
      intro hya
      exact (Finset.mem_filter.mp hA).2 z hzU y hya hyz.symm
    have hyB : y ∉ B := by
      obtain ⟨z, hzU, hyz⟩ := hy
      intro hyb
      exact (Finset.mem_filter.mp hB).2 z hzU y hyb hyz.symm
    have herase := congrArg (fun S : Finset V => S.erase y) heq
    simpa [hyA, hyB] using herase

end E993OrderBand
