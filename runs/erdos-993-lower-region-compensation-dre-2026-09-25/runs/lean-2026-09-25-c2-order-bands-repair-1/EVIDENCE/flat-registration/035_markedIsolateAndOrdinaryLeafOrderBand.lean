namespace E993OrderBand

open Classical

theorem markedIsolateAndOrdinaryLeafOrderBand :
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (G : SimpleGraph V) [DecidableRel G.Adj]
      (W : Finset V) (k : ℕ),
      E993OrderBand.IsolateCovered G W →
      2 ≤ k →
      Fintype.card V ≤ 2 * k + 1 →
      E993OrderBand.markedCount G W (k + 1) ≤
        E993OrderBand.markedCount G W k) ∧
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj]
      (v : V) (p : ℕ),
      T.IsTree →
      C4LA1.IsGraphLeaf T v →
      3 ≤ p →
      Fintype.card V ≤ 2 * p + 1 →
      C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
        C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0) := by
  constructor
  · intro V _ _ G _ W k hcover hk hm
    exact wholeGraphOrderBand G W k hcover hk hm
  · intro V _ _ T _ v p hT hv hp hn
    exact ordinaryLeafOrderBand T v p hT hv hp hn

end E993OrderBand
