namespace E993OrderBand

open Classical

lemma bad_into_multi_edgeless {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 2 ≤ k)
    (hm : U.card = 2 * k + 1)
    (hcover : IsolateCoveredOn G U W)
    (hno : ∀ y ∈ U, ∀ z ∈ U, ¬ G.Adj y z) :
    (badFamily G U W k).card ≤ (multiFamily G U W k).card := by
  classical
  have hUW : U ⊆ W := by
    intro y hy
    exact hcover y hy (hno y hy)
  apply Finset.card_le_card_of_injOn (fun A : Finset V => U \ A)
  · intro A hA
    have htag := (Finset.mem_filter.mp hA).1
    obtain ⟨⟨hAU, hcard⟩, _, _⟩ :
        (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
      simpa only [E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] using htag
    have hcard' : (U \ A).card = k + 1 := by
      rw [Finset.card_sdiff_of_subset hAU, hm, hcard]
      omega
    have hsub : U \ A ⊆ U := Finset.sdiff_subset
    have hI : G.IsIndepSet ((U \ A : Finset V) : Set V) := by
      rw [SimpleGraph.isIndepSet_iff]
      intro x hx y hy _ hxy
      exact hno x (hsub hx) y (hsub hy) hxy
    have hmarks : U \ A ⊆ W := hsub.trans hUW
    have hmark : ¬ Disjoint (U \ A) W := by
      have hpos : 0 < (U \ A).card := by omega
      obtain ⟨x, hx⟩ := Finset.card_pos.mp hpos
      exact Finset.not_disjoint_iff.mpr ⟨x, hx, hmarks hx⟩
    have hmulti : 2 ≤ ((U \ A) ∩ W).card := by
      have heq : (U \ A) ∩ W = U \ A :=
        Finset.inter_eq_left.mpr hmarks
      rw [heq, hcard']
      omega
    apply Finset.mem_filter.mpr
    constructor
    · simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
      exact ⟨⟨hsub, hcard'⟩, hI, hmark⟩
    · exact hmulti
  · intro A hA B hB heq
    have hAU : A ⊆ U := by
      have h := (Finset.mem_filter.mp hA).1
      simp only [E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] at h
      exact h.1.1
    have hBU : B ⊆ U := by
      have h := (Finset.mem_filter.mp hB).1
      simp only [E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] at h
      exact h.1.1
    have heq' := congrArg (fun S : Finset V => U \ S) heq
    simpa [Finset.sdiff_sdiff_eq_self hAU,
      Finset.sdiff_sdiff_eq_self hBU] using heq'

end E993OrderBand
