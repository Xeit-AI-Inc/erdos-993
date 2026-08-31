import Mathlib.Data.Int.Lemmas

set_option autoImplicit false

namespace C5T103

/-- The exact conditional arithmetic bridge frozen as candidate C5-T1-03. -/
theorem C5_T1_03
    (p ell : Nat) (Gamma Delta D : Int)
    (hp : 1 <= p) (hell : 1 <= ell)
    (hD : D = (p : Int) * ((p : Int) + 1) *
      (Gamma - (ell : Int) * Delta))
    (hGamma : 0 <= Gamma) (hDelta : Delta < 0) :
    0 < D := by
  have hpInt : (0 : Int) < (p : Int) := Nat.cast_pos.mpr hp
  have hpSucc : (0 : Int) < (p : Int) + 1 := Int.succ_natCast_pos p
  have hellInt : (0 : Int) < (ell : Int) := Nat.cast_pos.mpr hell
  have hellDelta : (ell : Int) * Delta < 0 :=
    mul_neg_of_pos_of_neg hellInt hDelta
  have hGap : 0 < Gamma - (ell : Int) * Delta :=
    sub_pos.mpr (lt_of_lt_of_le hellDelta hGamma)
  rw [hD]
  exact mul_pos (mul_pos hpInt hpSucc) hGap

end C5T103
