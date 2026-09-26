namespace E993OrderBand

open Classical

lemma marked_bound_below_even {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 1 ≤ k)
    (hm : U.card ≤ 2 * k) :
    (E993Interior.taggedFamily G U W (k + 1)).card ≤
      (E993Interior.taggedFamily G U W k).card := by
  have hi := marked_incidence_bound G U W k
  have hmul := Nat.mul_le_mul_right
    (E993Interior.taggedFamily G U W k).card hm
  have hkpos : 0 < k := by omega
  nlinarith

end E993OrderBand
