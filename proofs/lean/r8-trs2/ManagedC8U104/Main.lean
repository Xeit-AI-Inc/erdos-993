import Mathlib
set_option maxHeartbeats 800000

namespace Erdos993C8U1

abbrev NNSeq := AddMonoidAlgebra NNRat Int

def PositiveIntervalSupport (a : NNSeq) : Prop :=
  ∃ l u : Int, l ≤ u ∧ ∀ k : Int, 0 < a.coeff k ↔ l ≤ k ∧ k ≤ u

def AdjacentLogConcave (a : NNSeq) : Prop :=
  ∀ k : Int,
    a.coeff (k - 1) * a.coeff (k + 1) ≤ a.coeff k * a.coeff k

def Toeplitz2 (a : NNSeq) : Prop :=
  ∀ r1 r2 c1 c2 : Int, r1 < r2 → c1 < c2 →
    a.coeff (c2 - r1) * a.coeff (c1 - r2) ≤
      a.coeff (c1 - r1) * a.coeff (c2 - r2)

def TRS2 (a : NNSeq) : Prop :=
  a = 0 ∨ PositiveIntervalSupport a ∧ Toeplitz2 a

private lemma coeffCrossGap {A : Nat → NNRat} {p : Nat}
    (hpos : ∀ i, i ≤ p → 0 < A i)
    (hlc : ∀ i, 1 ≤ i → i < p → A (i - 1) * A (i + 1) ≤ A i * A i)
    (i d : Nat) (hbound : i + d < p) :
    A i * A (i + d + 1) ≤ A (i + 1) * A (i + d) := by
  induction d with
  | zero => simp [mul_comm]
  | succ d ih =>
      have hbound' : i + d < p := by omega
      have hprev := ih hbound'
      have hadj := hlc (i + d + 1) (by omega) (by omega)
      have hpositive : 0 < A (i + d) := hpos _ (by omega)
      have hmul :
          A (i + d) * (A i * A (i + d + 2)) ≤
            A (i + d) * (A (i + 1) * A (i + d + 1)) := by
        calc
          A (i + d) * (A i * A (i + d + 2)) =
              A i * (A (i + d) * A (i + d + 2)) := by ac_rfl
          _ ≤ A i * (A (i + d + 1) * A (i + d + 1)) :=
            mul_le_mul_left' hadj _
          _ = (A i * A (i + d + 1)) * A (i + d + 1) := by ac_rfl
          _ ≤ (A (i + 1) * A (i + d)) * A (i + d + 1) :=
            mul_le_mul_right' hprev _
          _ = A (i + d) * (A (i + 1) * A (i + d + 1)) := by ac_rfl
      have hcancel := le_of_mul_le_mul_left hmul hpositive
      simpa [Nat.add_assoc] using hcancel

private lemma coeffCrossStep {A : Nat → NNRat} {p : Nat}
    (hpos : ∀ i, i ≤ p → 0 < A i)
    (hlc : ∀ i, 1 ≤ i → i < p → A (i - 1) * A (i + 1) ≤ A i * A i)
    {i j : Nat} (hij : i ≤ j) (hjp : j < p) :
    A i * A (j + 1) ≤ A (i + 1) * A j := by
  have h := coeffCrossGap hpos hlc i (j - i) (by omega)
  simpa [Nat.add_sub_of_le hij] using h

private lemma coeffSpreadOfLE {A : Nat → NNRat} {p : Nat}
    (hpos : ∀ i, i ≤ p → 0 < A i)
    (hlc : ∀ i, 1 ≤ i → i < p → A (i - 1) * A (i + 1) ≤ A i * A i)
    (i d e : Nat) (hde : d ≤ e) (hbound : i + d + e ≤ p) :
    A i * A (i + d + e) ≤ A (i + d) * A (i + e) := by
  induction d generalizing e with
  | zero => simp
  | succ d ih =>
      have hcross := coeffCrossStep hpos hlc
        (i := i + d) (j := i + e) (by omega) (by omega)
      have hind := ih (e := e + 1) (by omega) (by omega)
      calc
        A i * A (i + (d + 1) + e) = A i * A (i + d + (e + 1)) := by
          congr 2 <;> omega
        _ ≤ A (i + d) * A (i + (e + 1)) := hind
        _ ≤ A (i + d + 1) * A (i + e) := by
          simpa [Nat.add_assoc] using hcross

private lemma coeffSpread {A : Nat → NNRat} {p : Nat}
    (hpos : ∀ i, i ≤ p → 0 < A i)
    (hlc : ∀ i, 1 ≤ i → i < p → A (i - 1) * A (i + 1) ≤ A i * A i)
    (i d e : Nat) (hbound : i + d + e ≤ p) :
    A i * A (i + d + e) ≤ A (i + d) * A (i + e) := by
  by_cases hde : d ≤ e
  · exact coeffSpreadOfLE hpos hlc i d e hde hbound
  · have h := coeffSpreadOfLE hpos hlc i e d (by omega) (by omega)
    simpa [Nat.add_comm, Nat.add_left_comm, Nat.add_assoc, mul_comm] using h

private theorem adjacentLogConcave_to_toeplitz2
    (a : NNSeq) (hInterval : PositiveIntervalSupport a)
    (hlc : AdjacentLogConcave a) : Toeplitz2 a := by
  rcases hInterval with ⟨l, u, hlu, hsupport⟩
  intro r1 r2 c1 c2 hr hc
  by_cases hcross : a.coeff (c2 - r1) * a.coeff (c1 - r2) = 0
  · simp [hcross]
  · have hleftNe : a.coeff (c2 - r1) ≠ 0 := by
      intro hz
      apply hcross
      simp [hz]
    have hrightNe : a.coeff (c1 - r2) ≠ 0 := by
      intro hz
      apply hcross
      simp [hz]
    have hleftPos : 0 < a.coeff (c2 - r1) := pos_iff_ne_zero.mpr hleftNe
    have hrightPos : 0 < a.coeff (c1 - r2) := pos_iff_ne_zero.mpr hrightNe
    have hleftBounds := (hsupport (c2 - r1)).mp hleftPos
    have hrightBounds := (hsupport (c1 - r2)).mp hrightPos
    let p : Nat := (u - l).toNat
    let A : Nat → NNRat := fun n => a.coeff (l + (n : Int))
    have hpCast : (p : Int) = u - l := by
      dsimp [p]
      exact Int.toNat_of_nonneg (sub_nonneg.mpr hlu)
    have hposA : ∀ n, n ≤ p → 0 < A n := by
      intro n hn
      have hnInt : (n : Int) ≤ u - l := by
        rw [← hpCast]
        exact_mod_cast hn
      apply (hsupport (l + (n : Int))).mpr
      constructor
      · omega
      · omega
    have hlcA : ∀ n, 1 ≤ n → n < p →
        A (n - 1) * A (n + 1) ≤ A n * A n := by
      intro n hn hnp
      have h := hlc (l + (n : Int))
      have hsub : ((n - 1 : Nat) : Int) = (n : Int) - 1 := by omega
      dsimp [A]
      rw [hsub]
      simpa only [sub_eq_add_neg, add_assoc] using h
    let i : Nat := (c1 - r2 - l).toNat
    let d : Nat := (r2 - r1).toNat
    let e : Nat := (c2 - c1).toNat
    have hiCast : (i : Int) = c1 - r2 - l := by
      dsimp [i]
      exact Int.toNat_of_nonneg (by omega)
    have hdCast : (d : Int) = r2 - r1 := by
      dsimp [d]
      exact Int.toNat_of_nonneg (by omega)
    have heCast : (e : Int) = c2 - c1 := by
      dsimp [e]
      exact Int.toNat_of_nonneg (by omega)
    have hbound : i + d + e ≤ p := by
      exact_mod_cast (show (i : Int) + (d : Int) + (e : Int) ≤ (p : Int) by omega)
    have hspread := coeffSpread hposA hlcA i d e hbound
    dsimp [A] at hspread
    have hidx0 : l + (i : Int) = c1 - r2 := by omega
    have hidxD : l + ((i : Int) + (d : Int)) = c1 - r1 := by omega
    have hidxE : l + ((i : Int) + (e : Int)) = c2 - r2 := by omega
    have hidxDE : l + ((i : Int) + (d : Int) + (e : Int)) = c2 - r1 := by omega
    rw [hidx0, hidxD, hidxE, hidxDE] at hspread
    simpa [mul_comm] using hspread

theorem trs2_iff_adjacentLogConcave
    (a : NNSeq) (ha : a ≠ 0)
    (hInterval : PositiveIntervalSupport a) :
    TRS2 a ↔ AdjacentLogConcave a := by
  constructor
  · intro htrs
    rcases htrs with hzero | hnonzero
    · exact (ha hzero).elim
    · intro k
      simpa [mul_comm] using hnonzero.2 0 1 k (k + 1) (by omega) (by omega)
  · intro hlc
    exact Or.inr ⟨hInterval, adjacentLogConcave_to_toeplitz2 a hInterval hlc⟩

noncomputable def delta0 : NNSeq := AddMonoidAlgebra.single 0 1

private def rowSupport (a : NNSeq) (r : Int) : Finset Int :=
  a.coeff.support.image fun h => h + r

private lemma rowSum_eq_coeff (a b : NNSeq) (r c : Int) :
    (∑ s ∈ rowSupport a r, a.coeff (s - r) * b.coeff (c - s)) =
      (a * b).coeff (c - r) := by
  rw [AddMonoidAlgebra.coeff_mul_apply_left]
  simp only [Finsupp.sum]
  rw [rowSupport, Finset.sum_image]
  · apply Finset.sum_congr rfl
    intro h hh
    congr 2 <;> ring
  · intro x hx y hy hxy
    exact add_right_cancel hxy

private lemma rowSum_union_eq_coeff (a b : NNSeq) (r r' c : Int) :
    (∑ s ∈ rowSupport a r ∪ rowSupport a r',
      a.coeff (s - r) * b.coeff (c - s)) = (a * b).coeff (c - r) := by
  calc
    (∑ s ∈ rowSupport a r ∪ rowSupport a r',
      a.coeff (s - r) * b.coeff (c - s)) =
        ∑ s ∈ rowSupport a r, a.coeff (s - r) * b.coeff (c - s) := by
      symm
      apply Finset.sum_subset (Finset.subset_union_left)
      intro s hsUnion hsNot
      have hsCoeff : a.coeff (s - r) = 0 := by
        by_contra hsNe
        have hsMem : s - r ∈ a.coeff.support :=
          Finsupp.mem_support_iff.mpr hsNe
        apply hsNot
        simp only [rowSupport, Finset.mem_image]
        exact ⟨s - r, hsMem, by omega⟩
      simp [hsCoeff]
    _ = (a * b).coeff (c - r) := rowSum_eq_coeff a b r c

private def ltPairs (s : Finset Int) : Finset (Int × Int) :=
  s.offDiag.filter fun uv => uv.1 < uv.2

private def swapPairEmb : Int × Int ↪ Int × Int :=
  ⟨fun uv => (uv.2, uv.1), by
    intro u v h
    rcases u with ⟨u0, u1⟩
    rcases v with ⟨v0, v1⟩
    simp only at h
    injection h with h0 h1
    simp [h0, h1]⟩

private lemma sumSquarePairDecomp (s : Finset Int) (F : Int × Int → NNRat) :
    (∑ u ∈ s, ∑ v ∈ s, F (u, v)) =
      (∑ u ∈ s, F (u, u)) +
        ∑ uv ∈ ltPairs s, (F uv + F (uv.2, uv.1)) := by
  have hunion : ltPairs s ∪ (ltPairs s).map swapPairEmb = s.offDiag := by
    ext uv
    constructor
    · intro huv
      rcases Finset.mem_union.mp huv with hlt | hswap
      · exact (Finset.mem_filter.mp hlt).1
      · rcases Finset.mem_map.mp hswap with ⟨vw, hvw, heq⟩
        rcases Finset.mem_filter.mp hvw with ⟨hmem, _⟩
        rw [← heq]
        simp [swapPairEmb, Finset.mem_offDiag] at hmem ⊢
        exact ⟨hmem.2.1, hmem.1, Ne.symm hmem.2.2⟩
    · intro huv
      rcases Finset.mem_offDiag.mp huv with ⟨hu, hv, hne⟩
      rcases lt_or_gt_of_ne hne with hlt | hgt
      · exact Finset.mem_union_left _ (Finset.mem_filter.mpr
          ⟨Finset.mem_offDiag.mpr ⟨hu, hv, hne⟩, hlt⟩)
      · apply Finset.mem_union_right
        apply Finset.mem_map.mpr
        refine ⟨(uv.2, uv.1), ?_, ?_⟩
        · exact Finset.mem_filter.mpr
            ⟨Finset.mem_offDiag.mpr ⟨hv, hu, Ne.symm hne⟩, hgt⟩
        · rfl
  have hdisjoint : Disjoint (ltPairs s) ((ltPairs s).map swapPairEmb) := by
    rw [Finset.disjoint_left]
    intro uv huv hswap
    rcases Finset.mem_filter.mp huv with ⟨_, huvlt⟩
    rcases Finset.mem_map.mp hswap with ⟨vw, hvw, heq⟩
    rcases Finset.mem_filter.mp hvw with ⟨_, hvwlt⟩
    rcases uv with ⟨u, v⟩
    rcases vw with ⟨v', u'⟩
    simp [swapPairEmb] at heq
    rcases heq with ⟨hu, hv⟩
    omega
  calc
    (∑ u ∈ s, ∑ v ∈ s, F (u, v)) = ∑ uv ∈ s ×ˢ s, F uv :=
      (Finset.sum_product' s s fun u v => F (u, v)).symm
    _ = (∑ uv ∈ s.diag, F uv) + ∑ uv ∈ s.offDiag, F uv := by
      rw [← Finset.diag_union_offDiag s,
        Finset.sum_union (Finset.disjoint_diag_offDiag s)]
    _ = (∑ u ∈ s, F (u, u)) +
        ∑ uv ∈ ltPairs s ∪ (ltPairs s).map swapPairEmb, F uv := by
      rw [Finset.sum_diag, hunion]
    _ = (∑ u ∈ s, F (u, u)) +
        ((∑ uv ∈ ltPairs s, F uv) +
          ∑ uv ∈ (ltPairs s).map swapPairEmb, F uv) := by
      rw [Finset.sum_union hdisjoint]
    _ = (∑ u ∈ s, F (u, u)) +
        ((∑ uv ∈ ltPairs s, F uv) +
          ∑ uv ∈ ltPairs s, F (uv.2, uv.1)) := by
      rw [Finset.sum_map]
      simp [swapPairEmb]
    _ = (∑ u ∈ s, F (u, u)) +
        ∑ uv ∈ ltPairs s, (F uv + F (uv.2, uv.1)) := by
      rw [Finset.sum_add_distrib]

private lemma crossAddLeDiagAdd (ac ad bc bd : NNRat)
    (hac : ac ≤ ad) (hbc : bc ≤ bd) :
    ad * bc + ac * bd ≤ ad * bd + ac * bc := by
  obtain ⟨m, rfl⟩ := exists_add_of_le hac
  obtain ⟨n, rfl⟩ := exists_add_of_le hbc
  calc
    (ac + m) * bc + ac * (bc + n) ≤
        ((ac + m) * bc + ac * (bc + n)) + m * n :=
      le_add_of_nonneg_right (by positivity)
    _ = (ac + m) * (bc + n) + ac * bc := by ring

private lemma finiteTP2Product (s : Finset Int)
    (x0 x1 y0 y1 : Int → NNRat)
    (hx : ∀ u ∈ s, ∀ v ∈ s, u < v → x0 v * x1 u ≤ x0 u * x1 v)
    (hy : ∀ u ∈ s, ∀ v ∈ s, u < v → y1 u * y0 v ≤ y0 u * y1 v) :
    (∑ i ∈ s, x0 i * y0 i) * (∑ i ∈ s, x1 i * y1 i) ≥
      (∑ i ∈ s, x0 i * y1 i) * (∑ i ∈ s, x1 i * y0 i) := by
  let P : Int × Int → NNRat := fun uv =>
    (x0 uv.1 * x1 uv.2) * (y0 uv.1 * y1 uv.2) +
      (x0 uv.2 * x1 uv.1) * (y1 uv.1 * y0 uv.2)
  let Q : Int × Int → NNRat := fun uv =>
    (x0 uv.1 * x1 uv.2) * (y1 uv.1 * y0 uv.2) +
      (x0 uv.2 * x1 uv.1) * (y0 uv.1 * y1 uv.2)
  have hpq : ∀ uv ∈ ltPairs s, Q uv ≤ P uv := by
    intro uv huv
    rcases Finset.mem_filter.mp huv with ⟨huvMem, huvl⟩
    rcases Finset.mem_offDiag.mp huvMem with ⟨hu, hv, _⟩
    exact crossAddLeDiagAdd _ _ _ _
      (hx uv.1 hu uv.2 hv huvl) (hy uv.1 hu uv.2 hv huvl)
  have hsum : (∑ uv ∈ ltPairs s, Q uv) ≤ ∑ uv ∈ ltPairs s, P uv :=
    Finset.sum_le_sum fun uv huv => hpq uv huv
  have hdiag :
      (∑ i ∈ s, (x0 i * y0 i) * (x1 i * y1 i)) =
        ∑ i ∈ s, (x0 i * y1 i) * (x1 i * y0 i) := by
    apply Finset.sum_congr rfl
    intro i hi
    ac_rfl
  have hleft :
      (∑ i ∈ s, x0 i * y0 i) * (∑ i ∈ s, x1 i * y1 i) =
        (∑ i ∈ s, (x0 i * y0 i) * (x1 i * y1 i)) +
          ∑ uv ∈ ltPairs s, P uv := by
    rw [Finset.sum_mul_sum]
    simpa only [P, mul_assoc, mul_left_comm, mul_comm] using
      (sumSquarePairDecomp s
        (fun uv => (x0 uv.1 * y0 uv.1) * (x1 uv.2 * y1 uv.2)))
  have hright :
      (∑ i ∈ s, x0 i * y1 i) * (∑ i ∈ s, x1 i * y0 i) =
        (∑ i ∈ s, (x0 i * y1 i) * (x1 i * y0 i)) +
          ∑ uv ∈ ltPairs s, Q uv := by
    rw [Finset.sum_mul_sum]
    simpa only [Q, mul_assoc, mul_left_comm, mul_comm] using
      (sumSquarePairDecomp s
        (fun uv => (x0 uv.1 * y1 uv.1) * (x1 uv.2 * y0 uv.2)))
  rw [hleft, hright, ← hdiag]
  simpa [add_comm] using
    (add_le_add_left hsum (∑ i ∈ s, (x0 i * y0 i) * (x1 i * y1 i)))

private theorem toeplitz2_convolution (a b : NNSeq)
    (ha : Toeplitz2 a) (hb : Toeplitz2 b) : Toeplitz2 (a * b) := by
  intro r1 r2 c1 c2 hr hc
  let s := rowSupport a r1 ∪ rowSupport a r2
  let x0 : Int → NNRat := fun i => a.coeff (i - r1)
  let x1 : Int → NNRat := fun i => a.coeff (i - r2)
  let y0 : Int → NNRat := fun i => b.coeff (c1 - i)
  let y1 : Int → NNRat := fun i => b.coeff (c2 - i)
  have hx : ∀ u ∈ s, ∀ v ∈ s, u < v → x0 v * x1 u ≤ x0 u * x1 v := by
    intro u hu v hv huv
    exact ha r1 r2 u v hr huv
  have hy : ∀ u ∈ s, ∀ v ∈ s, u < v → y1 u * y0 v ≤ y0 u * y1 v := by
    intro u hu v hv huv
    exact hb u v c1 c2 huv hc
  have htp2 := finiteTP2Product s x0 x1 y0 y1 hx hy
  have h00 : (∑ i ∈ s, x0 i * y0 i) = (a * b).coeff (c1 - r1) := by
    exact rowSum_union_eq_coeff a b r1 r2 c1
  have h01 : (∑ i ∈ s, x0 i * y1 i) = (a * b).coeff (c2 - r1) := by
    exact rowSum_union_eq_coeff a b r1 r2 c2
  have h10 : (∑ i ∈ s, x1 i * y0 i) = (a * b).coeff (c1 - r2) := by
    simpa only [s, x1, y0, Finset.union_comm] using
      (rowSum_union_eq_coeff a b r2 r1 c1)
  have h11 : (∑ i ∈ s, x1 i * y1 i) = (a * b).coeff (c2 - r2) := by
    simpa only [s, x1, y1, Finset.union_comm] using
      (rowSum_union_eq_coeff a b r2 r1 c2)
  rw [h00, h01, h10, h11] at htp2
  simpa [mul_comm] using htp2

private theorem positiveIntervalSupport_convolution (a b : NNSeq)
    (ha : PositiveIntervalSupport a) (hb : PositiveIntervalSupport b) :
    PositiveIntervalSupport (a * b) := by
  rcases ha with ⟨la, ua, hlaua, ha⟩
  rcases hb with ⟨lb, ub, hlbub, hb⟩
  refine ⟨la + lb, ua + ub, by omega, ?_⟩
  intro k
  constructor
  · intro hk
    rw [AddMonoidAlgebra.coeff_mul_apply_left] at hk
    simp only [Finsupp.sum] at hk
    rcases Finset.sum_pos_iff.mp hk with ⟨i, hiSupport, hiPos⟩
    have hai : 0 < a.coeff i :=
      pos_iff_ne_zero.mpr (Finsupp.mem_support_iff.mp hiSupport)
    have hbi : 0 < b.coeff (-i + k) := by
      rcases (mul_pos_iff.mp hiPos) with hboth | hneg
      · exact hboth.2
      · exact (not_lt_of_ge (by positivity)) hneg.1 |>.elim
    have haiBounds := (ha i).mp hai
    have hbiBounds := (hb (-i + k)).mp hbi
    omega
  · intro hkBounds
    let i : Int := max la (k - ub)
    have hiLower : la ≤ i := le_max_left _ _
    have hiUpper : i ≤ ua := by
      apply max_le
      · exact hlaua
      · omega
    have hkiLower : lb ≤ -i + k := by
      have : i ≤ k - lb := by
        apply max_le
        · omega
        · omega
      omega
    have hkiUpper : -i + k ≤ ub := by
      have : k - ub ≤ i := le_max_right _ _
      omega
    have hai : 0 < a.coeff i := (ha i).mpr ⟨hiLower, hiUpper⟩
    have hbi : 0 < b.coeff (-i + k) := (hb (-i + k)).mpr ⟨hkiLower, hkiUpper⟩
    have hiSupport : i ∈ a.coeff.support :=
      Finsupp.mem_support_iff.mpr (pos_iff_ne_zero.mp hai)
    rw [AddMonoidAlgebra.coeff_mul_apply_left]
    simp only [Finsupp.sum]
    exact lt_of_lt_of_le (mul_pos hai hbi)
      (Finset.single_le_sum
        (f := fun j => a.coeff j * b.coeff (-j + k))
        (fun j hj => zero_le) hiSupport)

private lemma delta0_ne_zero : delta0 ≠ 0 := by
  intro h
  have hcoeff := congrArg (fun a : NNSeq => a.coeff 0) h
  simpa [delta0] using hcoeff

private lemma delta0_coeff (k : Int) :
    delta0.coeff k = if k = 0 then 1 else 0 := by
  rw [delta0, AddMonoidAlgebra.coeff_single]
  by_cases hk : k = 0 <;> simp [Finsupp.single_apply, hk]

private lemma delta0_positiveIntervalSupport : PositiveIntervalSupport delta0 := by
  refine ⟨0, 0, le_rfl, ?_⟩
  intro k
  constructor
  · intro hkPos
    have hk : k = 0 := by
      by_contra hk
      rw [delta0_coeff] at hkPos
      simp [hk] at hkPos
    omega
  · intro hkBounds
    have hk : k = 0 := by omega
    subst k
    simp [delta0_coeff]

private lemma delta0_adjacentLogConcave : AdjacentLogConcave delta0 := by
  intro k
  have hzero : delta0.coeff (k - 1) * delta0.coeff (k + 1) = 0 := by
    by_cases hm : k - 1 = 0
    · have hp : k + 1 ≠ 0 := by omega
      simp [delta0_coeff, hm, hp]
    · simp [delta0_coeff, hm]
  rw [hzero]
  exact zero_le

theorem trs2_convolutionClosure :
    TRS2 (0 : NNSeq) ∧ TRS2 delta0 ∧
      ∀ a b : NNSeq, TRS2 a → TRS2 b → TRS2 (a * b) := by
  refine ⟨Or.inl rfl, ?_, ?_⟩
  · exact (trs2_iff_adjacentLogConcave delta0 delta0_ne_zero
      delta0_positiveIntervalSupport).mpr delta0_adjacentLogConcave
  · intro a b ha hb
    rcases ha with hzeroA | hnonzeroA
    · subst a
      simp [TRS2]
    rcases hb with hzeroB | hnonzeroB
    · subst b
      simp [TRS2]
    exact Or.inr ⟨
      positiveIntervalSupport_convolution a b hnonzeroA.1 hnonzeroB.1,
      toeplitz2_convolution a b hnonzeroA.2 hnonzeroB.2⟩

end Erdos993C8U1
