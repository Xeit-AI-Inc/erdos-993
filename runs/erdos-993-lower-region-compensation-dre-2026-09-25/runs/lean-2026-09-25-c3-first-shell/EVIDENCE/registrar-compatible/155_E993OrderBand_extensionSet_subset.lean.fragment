namespace E993OrderBand

open Classical

lemma extensionSet_subset {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U A : Finset V) :
    extensionSet G U A ⊆ U \ A := by
  intro y hy
  obtain ⟨hyU, hyA, _⟩ := Finset.mem_filter.mp hy
  exact Finset.mem_sdiff.mpr ⟨hyU, hyA⟩

end E993OrderBand
