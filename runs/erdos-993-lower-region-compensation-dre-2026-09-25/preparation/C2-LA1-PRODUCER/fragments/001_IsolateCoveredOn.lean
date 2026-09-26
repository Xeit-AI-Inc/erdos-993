import LeanProof.FirstInteriorMain

universe u

namespace E993OrderBand

open Classical

def IsolateCoveredOn {V : Type*} (G : SimpleGraph V)
    (U W : Finset V) : Prop :=
  ∀ x, x ∈ U → (∀ y, y ∈ U → ¬ G.Adj x y) → x ∈ W

end E993OrderBand
