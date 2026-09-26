namespace E993OrderBand

open Classical

noncomputable
def extensionSet {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U A : Finset V) : Finset V :=
  U.filter fun y => y ∉ A ∧ G.IsIndepSet ((insert y A : Finset V) : Set V)

end E993OrderBand
