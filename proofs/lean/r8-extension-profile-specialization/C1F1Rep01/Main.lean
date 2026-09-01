import Mathlib
namespace C1F1Rep01

universe u

variable {alpha : Type u}

noncomputable section

/-- A finite-set presentation of graph independence. -/
def IsIndependent (H : SimpleGraph alpha) (S : Finset alpha) : Prop :=
  ∀ {v w : alpha}, v ∈ S -> w ∈ S -> ¬ H.Adj v w

/-- The frozen extension count, used only on independent sets by `extensionProfile`. -/
def extensionCount [Fintype alpha] (H : SimpleGraph alpha)
    (S : Finset alpha) : Nat := by
  classical
  exact ((Finset.univ \ S).filter fun v => IsIndependent H (insert v S)).card

/-- All independent vertex sets of a finite labelled simple graph. -/
def independentSets [Fintype alpha] (H : SimpleGraph alpha) :
    Finset (Finset alpha) := by
  classical
  exact Finset.univ.powerset.filter (IsIndependent H)

/-- `i_j(H)`: the number of independent sets of cardinality `j`. -/
def independentSetCount [Fintype alpha] (H : SimpleGraph alpha)
    (j : Nat) : Nat := by
  classical
  exact (independentSets H).filter (fun S => S.card = j) |>.card

/-- The extension-profile polynomial, with outer variable `x` and inner variable `y`. -/
def extensionProfile [Fintype alpha] (H : SimpleGraph alpha) :
    Polynomial (Polynomial Int) :=
  Finset.sum (independentSets H) fun S =>
    Polynomial.C (Polynomial.X ^ extensionCount H S) * Polynomial.X ^ S.card

end

end C1F1Rep01
namespace C1F1Rep01

universe u

variable {alpha : Type u}

theorem extensionProfile_specialize_one [Fintype alpha] (H : SimpleGraph alpha)
    (j : Nat) :
    ((extensionProfile H).map (Polynomial.evalRingHom (1 : Int))).coeff j =
      (independentSetCount H j : Int) := by
  classical
  simp only [Polynomial.coeff_map, Polynomial.coe_evalRingHom]
  unfold extensionProfile independentSetCount independentSets
  rw [Polynomial.finsetSum_coeff]
  rw [Polynomial.eval_finsetSum]
  simp_rw [Polynomial.coeff_C_mul_X_pow]
  simp_rw [apply_ite, Polynomial.eval_X_pow, one_pow, Polynomial.eval_zero]
  rw [Finset.sum_boole]
  congr
  ext S
  simp [eq_comm]

end C1F1Rep01
