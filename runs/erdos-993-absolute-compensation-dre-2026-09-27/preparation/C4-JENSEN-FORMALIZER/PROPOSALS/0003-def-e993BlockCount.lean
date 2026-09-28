noncomputable
def e993BlockCount {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) : ℕ :=
  ((Finset.univ : Finset (Fin (r i))).filter fun v => Sigma.mk i v ∈ S).card
