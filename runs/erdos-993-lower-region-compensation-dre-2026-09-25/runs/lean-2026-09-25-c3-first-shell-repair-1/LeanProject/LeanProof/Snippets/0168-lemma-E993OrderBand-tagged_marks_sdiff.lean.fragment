namespace E993OrderBand

open Classical

lemma tagged_marks_sdiff {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (D E : Finset V) (k : ℕ) :
    E993Interior.taggedFamily G (Finset.univ \ D) E k =
      E993Interior.taggedFamily G (Finset.univ \ D) (E \ D) k := by
  classical
  ext A
  simp only [E993Interior.taggedFamily, Finset.mem_filter, Finset.mem_powersetCard]
  constructor
  · rintro ⟨⟨hAU, hcard⟩, hI, hmark⟩
    obtain ⟨x, hxA, hxE⟩ := Finset.not_disjoint_iff.mp hmark
    have hxD : x ∉ D := (Finset.mem_sdiff.mp (hAU hxA)).2
    exact ⟨⟨hAU, hcard⟩, hI,
      Finset.not_disjoint_iff.mpr
        ⟨x, hxA, Finset.mem_sdiff.mpr ⟨hxE, hxD⟩⟩⟩
  · rintro ⟨⟨hAU, hcard⟩, hI, hmark⟩
    obtain ⟨x, hxA, hxED⟩ := Finset.not_disjoint_iff.mp hmark
    exact ⟨⟨hAU, hcard⟩, hI,
      Finset.not_disjoint_iff.mpr ⟨x, hxA, (Finset.mem_sdiff.mp hxED).1⟩⟩

end E993OrderBand
