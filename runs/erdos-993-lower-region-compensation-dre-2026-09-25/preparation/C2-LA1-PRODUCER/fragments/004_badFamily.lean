namespace E993OrderBand

open Classical

noncomputable def badFamily {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) : Finset (Finset V) :=
  (E993Interior.taggedFamily G U W k).filter fun A =>
    ∀ x ∈ U, ∀ a ∈ A, ¬ G.Adj x a

end E993OrderBand
