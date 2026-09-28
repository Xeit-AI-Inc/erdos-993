noncomputable
def e993BlockSet {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) : Finset (Σ j, Fin (r j)) :=
  (Finset.univ : Finset (Fin (r i))).image (Sigma.mk i)
