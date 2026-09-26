namespace E993OrderBand

open Classical

lemma wholeGraphOrderBand {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (W : Finset V) (k : ℕ)
    (hcover : IsolateCovered G W) (hk : 2 ≤ k)
    (hm : Fintype.card V ≤ 2 * k + 1) :
    markedCount G W (k + 1) ≤ markedCount G W k := by
  have hcard : (Finset.univ : Finset V).card ≤ 2 * k + 1 := by
    simpa using hm
  exact relativeOrderBand G Finset.univ W k hk hcard hcover

end E993OrderBand
