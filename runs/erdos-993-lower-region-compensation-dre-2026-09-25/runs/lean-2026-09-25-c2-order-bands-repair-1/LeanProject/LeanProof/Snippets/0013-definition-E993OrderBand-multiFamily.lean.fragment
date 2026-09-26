namespace E993OrderBand

open Classical

noncomputable
def multiFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) : Finset (Finset V) :=
  (E993Interior.taggedFamily G U W (k + 1)).filter fun B =>
    2 ≤ (B ∩ W).card

end E993OrderBand
