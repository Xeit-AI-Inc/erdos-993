import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN theorem StableTrial.weighted_adjacent_identity 0a6540c5d5ffa2755bfdb1448dea0a218dc18ede4c37475d2135b6679b2cc3f2
namespace StableTrial

theorem weighted_adjacent_identity
    (a : Nat -> Real) (lam Z : Real)
    (hLam : lam ≠ 0) (hZ : Z ≠ 0) (n : Nat) :
    (lam + lam⁻¹) * (a (n + 1) * lam ^ (n + 1) / Z)
      - (a n * lam ^ n / Z)
      - (a (n + 2) * lam ^ (n + 2) / Z) =
    (lam ^ n / Z) *
      ((a (n + 1) - a n) + lam ^ 2 * (a (n + 1) - a (n + 2))) := by
  have hPow1 : lam ^ (n + 1) = lam ^ n * lam := pow_succ lam n
  have hPow2 : lam ^ (n + 2) = lam ^ n * lam ^ 2 := by
    calc
      lam ^ (n + 2) = lam ^ (n + 1) * lam := pow_succ lam (n + 1)
      _ = lam ^ n * lam ^ 2 := by
        rw [hPow1, pow_two]
        ring
  rw [hPow1, hPow2]
  field_simp [hLam, hZ] <;> ring

end StableTrial
-- VERITYOS ENTRY 1 END

