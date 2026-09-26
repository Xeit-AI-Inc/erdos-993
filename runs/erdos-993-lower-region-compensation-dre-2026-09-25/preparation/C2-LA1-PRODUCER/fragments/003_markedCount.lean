namespace E993OrderBand

open Classical

noncomputable def markedCount {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (W : Finset V) (k : ℕ) : ℕ :=
  (E993Interior.taggedFamily G Finset.univ W k).card

end E993OrderBand
