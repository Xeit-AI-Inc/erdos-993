namespace E993OrderBand

open Classical

lemma leaf_isolate_covered {V : Type*} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (v : V) (hT : T.IsTree) (hv : C4LA1.IsGraphLeaf T v) :
    IsolateCoveredOn T (Finset.univ \ C5LA1.H T v)
      (C5LA1.R T v \ C5LA1.H T v) := by
  intro x hx hnon
  let s := C5LA1.support T v
  have hvs : T.Adj v s := support_adj T v hv
  letI : Nontrivial V := nontrivial_of_ne v s hvs.ne
  obtain ⟨z, hxz⟩ := hT.connected.preconnected.exists_adj_of_nontrivial x
  have hxH : x ∉ C5LA1.H T v := (Finset.mem_sdiff.mp hx).2
  have hzH : z ∈ C5LA1.H T v := by
    by_contra hzH
    exact hnon z (Finset.mem_sdiff.mpr ⟨Finset.mem_univ z, hzH⟩) hxz
  have hz : z = v ∨ z = s := by
    simpa only [C5LA1.H, Finset.mem_insert, Finset.mem_singleton] using hzH
  have hzs : z = s := by
    rcases hz with hzv | hzs
    · have hxs : x = s := support_unique T v hv (by simpa only [hzv] using hxz.symm)
      have hsH : s ∈ C5LA1.H T v := by simp [C5LA1.H, s]
      exact False.elim (hxH (by simpa only [hxs] using hsH))
    · exact hzs
  have hxsadj : T.Adj s x := by simpa only [hzs] using hxz.symm
  apply Finset.mem_sdiff.mpr
  constructor
  · exact Finset.mem_insert_of_mem ((T.mem_neighborFinset s x).mpr hxsadj)
  · exact hxH

end E993OrderBand
