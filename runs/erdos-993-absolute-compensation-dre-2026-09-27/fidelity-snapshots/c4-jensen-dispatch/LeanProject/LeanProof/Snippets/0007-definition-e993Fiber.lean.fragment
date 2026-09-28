noncomputable
def e993Fiber {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) : Finset (Fin (r i)) :=
  Finset.univ.filter fun v => Sigma.mk i v ∈ S
