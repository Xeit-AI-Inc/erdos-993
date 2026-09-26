namespace E993OrderBand

open Classical

lemma ordinaryLeafOrderBand {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (v : V) (p : ℕ)
    (hT : T.IsTree) (hv : C4LA1.IsGraphLeaf T v)
    (hp : 3 ≤ p) (hn : Fintype.card V ≤ 2 * p + 1) :
    C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
      C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0 := by
  let U := Finset.univ \ C5LA1.H T v
  let W := C5LA1.R T v \ C5LA1.H T v
  let k := p - 1
  have hk : 2 ≤ k := by omega
  have hpk : k + 1 = p := by omega
  have hcard := retained_card T v hv
  have hm : U.card ≤ 2 * k + 1 := by
    dsimp [U, k]
    omega
  have hcover : IsolateCoveredOn T U W := leaf_isolate_covered T v hT hv
  have hq := relativeOrderBand T U W k hk hm hcover
  rw [hpk] at hq
  have hsplit0 := leaf_count_split T v hv (p - 1)
  have hsplit1 := leaf_count_split T v hv p
  have hpk' : p - 1 + 1 = p := by omega
  unfold C5LA1.forwardDifferenceDel
  rw [hpk', hsplit0, hsplit1]
  dsimp [U, W, k] at hq
  omega

end E993OrderBand
