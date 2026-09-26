namespace E993OrderBand

open Classical

lemma marked_bound_of_nonisolate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 2 ≤ k)
    (hm : U.card ≤ 2 * k + 1)
    (hcover : IsolateCoveredOn G U W)
    (y : V) (hyU : y ∈ U) (hy : ∃ z ∈ U, G.Adj y z) :
    (E993Interior.taggedFamily G U W (k + 1)).card ≤
      (E993Interior.taggedFamily G U W k).card := by
  have hi := marked_incidence_bound G U W k
  have hpart := bad_good_partition G U W k
  have hbad := bad_into_multi G U W k hk y hyU hy hcover
  have hmul := Nat.mul_le_mul_right
    (E993Interior.taggedFamily G U W k).card hm
  have hkpos : 0 < k := by omega
  nlinarith

end E993OrderBand
