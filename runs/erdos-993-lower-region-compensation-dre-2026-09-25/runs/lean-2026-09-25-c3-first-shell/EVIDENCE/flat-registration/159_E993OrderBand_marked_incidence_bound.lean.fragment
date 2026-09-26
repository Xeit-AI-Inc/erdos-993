namespace E993OrderBand

open Classical

lemma marked_incidence_bound {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) :
    k * (E993Interior.taggedFamily G U W (k + 1)).card +
      (multiFamily G U W k).card +
      k * (E993Interior.taggedFamily G U W k).card +
      (goodFamily G U W k).card ≤
      U.card * (E993Interior.taggedFamily G U W k).card := by
  classical
  apply incidence_bound
    (E993Interior.taggedFamily G U W (k + 1))
    (E993Interior.taggedFamily G U W k)
    (fun B A => A ⊆ B)
    (multiFamily G U W k) (goodFamily G U W k) k U.card
  · exact Finset.filter_subset _ _
  · exact Finset.filter_subset _ _
  · intro B hB
    by_cases hmulti : B ∈ multiFamily G U W k
    · simpa [hmulti] using multi_lower_degree G U W k B hmulti
    · simpa [hmulti] using lower_degree G U W k B hB
  · intro A hA
    obtain ⟨⟨hAU, hAcard⟩, hI, _⟩ :
        (A ⊆ U ∧ A.card = k) ∧ G.IsIndepSet (A : Set V) ∧ ¬ Disjoint A W := by
      simpa only [E993Interior.taggedFamily, Finset.mem_filter,
        Finset.mem_powersetCard] using hA
    have hdegree := upper_degree_le_extensions G U W k A hA
    by_cases hgood : A ∈ goodFamily G U W k
    · have hneighbor : ∃ x ∈ U, ∃ a ∈ A, G.Adj x a :=
        (Finset.mem_filter.mp hgood).2
      have hstrict := extensionSet_card_lt_of_neighbor G U A hAU hI hneighbor
      simp only [if_pos hgood]
      omega
    · have hweak := extensionSet_card_le G U A hAU
      simp only [if_neg hgood]
      omega

end E993OrderBand
