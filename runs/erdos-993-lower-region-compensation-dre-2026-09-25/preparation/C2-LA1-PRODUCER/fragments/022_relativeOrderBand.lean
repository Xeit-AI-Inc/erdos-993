namespace E993OrderBand

open Classical

lemma relativeOrderBand {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (U W : Finset V) (k : ℕ) (hk : 2 ≤ k)
    (hm : U.card ≤ 2 * k + 1)
    (hcover : IsolateCoveredOn G U W) :
    (E993Interior.taggedFamily G U W (k + 1)).card ≤
      (E993Interior.taggedFamily G U W k).card := by
  by_cases hsmall : U.card ≤ 2 * k
  · exact marked_bound_below_even G U W k (by omega) hsmall
  have heq : U.card = 2 * k + 1 := by omega
  by_cases hex : ∃ y ∈ U, ∃ z ∈ U, G.Adj y z
  · obtain ⟨y, hyU, z, hzU, hyz⟩ := hex
    exact marked_bound_of_nonisolate G U W k hk hm hcover y hyU ⟨z, hzU, hyz⟩
  · have hno : ∀ y ∈ U, ∀ z ∈ U, ¬ G.Adj y z := by
      intro y hy z hz hadj
      exact hex ⟨y, hy, z, hz, hadj⟩
    have hi := marked_incidence_bound G U W k
    have hpart := bad_good_partition G U W k
    have hbad := bad_into_multi_edgeless G U W k hk heq hcover hno
    have hmul := Nat.mul_le_mul_right
      (E993Interior.taggedFamily G U W k).card hm
    have hkpos : 0 < k := by omega
    nlinarith

end E993OrderBand
