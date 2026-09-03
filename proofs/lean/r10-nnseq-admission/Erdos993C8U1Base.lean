import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN theorem Erdos993C8U1.trs2_iff_adjacentLogConcave 614eade5ec634d850f42716b8876e3d546b3f070315696e0082ee886981011b1
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

end Erdos993C8U1
-- VERITYOS ENTRY 1 END
