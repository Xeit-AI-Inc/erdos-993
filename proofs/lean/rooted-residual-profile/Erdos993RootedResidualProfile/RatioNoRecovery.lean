import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition LeanProof.Positive 2e153201a261826f7fb1c1bf94bba9306efe4ca91e0bf576974519b8da01823b
namespace LeanProof

def Positive (d : Nat) (x : Fin (d + 1) -> Nat) : Prop :=
  forall i : Fin (d + 1), 0 < x i

end LeanProof
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition LeanProof.AdjacentLogConcave 281e0e9d6e2099c019e274ac8598a1f39f7b101dd6ea71fd3916baec1f9b4e10
namespace LeanProof

def AdjacentLogConcave (d : Nat) (x : Fin (d + 1) -> Nat) : Prop :=
  forall (i : Nat) (_hi : 1 <= i) (hid : i < d),
    x ⟨i, Nat.lt_trans hid (Nat.lt_succ_self d)⟩ *
        x ⟨i, Nat.lt_trans hid (Nat.lt_succ_self d)⟩ >=
      x ⟨i - 1,
          Nat.lt_of_le_of_lt (Nat.sub_le i 1)
            (Nat.lt_trans hid (Nat.lt_succ_self d))⟩ *
        x ⟨i + 1, Nat.succ_lt_succ hid⟩

end LeanProof
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN theorem LeanProof.positiveLogConcave_descent_persists c8b05c29c385197b75cba076b8539d06bc2300da53d3d6ca309bf96ce99db03e
namespace LeanProof

theorem positiveLogConcave_descent_persists
    (d : Nat) (x : Fin (d + 1) → Nat)
    (hpos : Positive d x) (hlc : AdjacentLogConcave d x)
    (p q : Nat) (hpq : p ≤ q) (hqd : q < d)
    (hdescent : x ⟨p + 1, by omega⟩ ≤ x ⟨p, by omega⟩) :
    x ⟨q + 1, by omega⟩ ≤ x ⟨q, by omega⟩
    := by
  have hstep :
      forall (i : Nat) (hi : 1 <= i) (hid : i < d),
        x ⟨i, by omega⟩ <= x ⟨i - 1, by omega⟩ ->
          x ⟨i + 1, by omega⟩ <= x ⟨i, by omega⟩ := by
    intro i hi hid hdes
    have hlc_i := hlc i hi hid
    have hmul :
        x ⟨i, by omega⟩ * x ⟨i + 1, by omega⟩ <=
          x ⟨i - 1, by omega⟩ * x ⟨i + 1, by omega⟩ :=
      Nat.mul_le_mul_right (x ⟨i + 1, by omega⟩) hdes
    have hproduct :
        x ⟨i, by omega⟩ * x ⟨i + 1, by omega⟩ <=
          x ⟨i, by omega⟩ * x ⟨i, by omega⟩ :=
      le_trans hmul hlc_i
    by_contra hnot
    have hlt : x ⟨i, by omega⟩ < x ⟨i + 1, by omega⟩ :=
      Nat.lt_of_not_ge hnot
    have hpositive : 0 < x ⟨i, by omega⟩ := hpos ⟨i, by omega⟩
    have hstrict :
        x ⟨i, by omega⟩ * x ⟨i, by omega⟩ <
          x ⟨i, by omega⟩ * x ⟨i + 1, by omega⟩ :=
      Nat.mul_lt_mul_of_pos_left hlt hpositive
    exact (not_lt_of_ge hproduct) hstrict
  have hprop :
      forall (r : Nat) (hpr : p <= r) (hrq : r <= q),
        x ⟨r + 1, by omega⟩ <= x ⟨r, by omega⟩ := by
    intro r
    induction r using Nat.strong_induction_on with
    | h r ihr =>
        intro hpr hrq
        by_cases hrp : r = p
        · subst r
          exact hdescent
        · apply hstep r (by omega) (by omega)
          simpa [Nat.sub_add_cancel (by omega : 1 <= r)] using
            (ihr (r - 1) (by omega) (by omega) (by omega))
  exact hprop q hpq le_rfl

end LeanProof
-- VERITYOS ENTRY 3 END

