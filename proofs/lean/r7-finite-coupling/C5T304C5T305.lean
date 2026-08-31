import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.Order.Ring.Finset
import Mathlib.Data.Fintype.Order
import Mathlib.Tactic

/-!
# C5-T3-04-C5-T3-05: finite transport with separated off-diagonal cost

The result is polymorphic over a linear ordered field, so the exact same
finite-sum statement applies to rational and real masses and costs.
-/

namespace C5T304C5T305

universe u v

variable {ι : Type u} {𝕜 : Type v}

/-- The mass carried by the diagonal of a finite coupling. -/
def diagonalMass [Fintype ι] [AddCommMonoid 𝕜] (π : ι → ι → 𝕜) : 𝕜 :=
  ∑ x, π x x

/-- The exact finite transport cost of a coupling and a cost matrix. -/
def transportCost [Fintype ι] [CommSemiring 𝕜]
    (π d : ι → ι → 𝕜) : 𝕜 :=
  ∑ x, ∑ y, π x y * d x y

section FiniteTransport

variable [Fintype ι] [Field 𝕜] [LinearOrder 𝕜] [IsStrictOrderedRing 𝕜]

/-- A normalized finite coupling with off-diagonal separation has cost at
least `delta` times its off-diagonal mass. -/
theorem cost_lower_bound
    [Nonempty ι]
    (π d : ι → ι → 𝕜) (delta : 𝕜)
    (hpi_nonneg : ∀ x y, 0 ≤ π x y)
    (hd_nonneg : ∀ x y, 0 ≤ d x y)
    (hd_diag : ∀ x, d x x = 0)
    (hdelta : 0 < delta)
    (hd_offdiag : ∀ x y, x ≠ y → delta ≤ d x y)
    (hpi_total : (∑ x, ∑ y, π x y) = 1) :
    delta * (1 - diagonalMass π) ≤ transportCost π d := by
  classical
  have _frozen_cost_nonnegativity := hd_nonneg
  have _frozen_positive_separation := hdelta
  have pointwise : ∀ x y,
      delta * (π x y - if y = x then π x x else 0) ≤ π x y * d x y := by
    intro x y
    by_cases hxy : x = y
    · subst y
      simp [hd_diag]
    · have hmul :=
        mul_le_mul_of_nonneg_left (hd_offdiag x y hxy) (hpi_nonneg x y)
      simpa [hxy, Ne.symm hxy, mul_comm] using hmul
  calc
    delta * (1 - diagonalMass π) =
        delta * ((∑ x, ∑ y, π x y) - ∑ x, π x x) := by
          simp only [diagonalMass]
          rw [hpi_total]
    _ = delta * (∑ x, ((∑ y, π x y) - π x x)) := by
          rw [Finset.sum_sub_distrib]
    _ = ∑ x, delta * ((∑ y, π x y) - π x x) := by
          rw [Finset.mul_sum]
    _ = ∑ x, ∑ y,
        delta * (π x y - if y = x then π x x else 0) := by
          apply Finset.sum_congr rfl
          intro x _
          rw [← Finset.mul_sum]
          congr 1
          rw [Finset.sum_sub_distrib]
          simp
    _ ≤ ∑ x, ∑ y, π x y * d x y := by
          exact Finset.sum_le_sum fun x _ =>
            Finset.sum_le_sum fun y _ => pointwise x y
    _ = transportCost π d := rfl

/-- Cost strictly below the separation forces strictly positive diagonal mass. -/
theorem strict_cost_implies_positive_diagonal_mass
    [Nonempty ι]
    (π d : ι → ι → 𝕜) (delta : 𝕜)
    (hpi_nonneg : ∀ x y, 0 ≤ π x y)
    (hd_nonneg : ∀ x y, 0 ≤ d x y)
    (hd_diag : ∀ x, d x x = 0)
    (hdelta : 0 < delta)
    (hd_offdiag : ∀ x y, x ≠ y → delta ≤ d x y)
    (hpi_total : (∑ x, ∑ y, π x y) = 1)
    (hcost : transportCost π d < delta) :
    0 < diagonalMass π := by
  have hbound := cost_lower_bound π d delta hpi_nonneg hd_nonneg hd_diag
    hdelta hd_offdiag hpi_total
  by_contra hnot
  have hdiag_nonpos : diagonalMass π ≤ 0 := le_of_not_gt hnot
  have hone : 1 ≤ 1 - diagonalMass π := by linarith
  have hdelta_le : delta ≤ delta * (1 - diagonalMass π) := by
    have hmul := mul_le_mul_of_nonneg_left hone (le_of_lt hdelta)
    simpa using hmul
  exact (not_lt_of_ge (hdelta_le.trans hbound)) hcost

/-- Positive diagonal mass in a nonnegative coupling with exact marginals gives
an index at which both marginals are strictly positive. -/
theorem positive_diagonal_mass_implies_common_positive_marginals
    [Nonempty ι]
    (π : ι → ι → 𝕜) (mu nu : ι → 𝕜)
    (hpi_nonneg : ∀ x y, 0 ≤ π x y)
    (hmu : ∀ x, mu x = ∑ y, π x y)
    (hnu : ∀ y, nu y = ∑ x, π x y)
    (hdiag : 0 < diagonalMass π) :
    ∃ x, 0 < mu x ∧ 0 < nu x := by
  classical
  have hex : ∃ x, 0 < π x x := by
    by_contra hnot
    push Not at hnot
    have hsum_nonpos : diagonalMass π ≤ 0 := by
      exact Finset.sum_nonpos fun x _ => hnot x
    exact (not_lt_of_ge hsum_nonpos) hdiag
  obtain ⟨x, hxx⟩ := hex
  have hrow : π x x ≤ mu x := by
    rw [hmu x]
    exact Finset.single_le_sum (fun y _ => hpi_nonneg x y) (Finset.mem_univ x)
  have hcol : π x x ≤ nu x := by
    rw [hnu x]
    exact Finset.single_le_sum (fun y _ => hpi_nonneg y x) (Finset.mem_univ x)
  exact ⟨x, hxx.trans_le hrow, hxx.trans_le hcol⟩

/-- The exact frozen candidate `C5-T3-04-C5-T3-05`: cost lower bound,
strict-cost positive diagonal mass, and a common positive-marginal index. -/
theorem C5_T3_04_C5_T3_05
    [Nonempty ι]
    (π d : ι → ι → 𝕜) (mu nu : ι → 𝕜) (delta : 𝕜)
    (hpi_nonneg : ∀ x y, 0 ≤ π x y)
    (hd_nonneg : ∀ x y, 0 ≤ d x y)
    (hd_diag : ∀ x, d x x = 0)
    (hdelta : 0 < delta)
    (hd_offdiag : ∀ x y, x ≠ y → delta ≤ d x y)
    (hpi_total : (∑ x, ∑ y, π x y) = 1)
    (hmu : ∀ x, mu x = ∑ y, π x y)
    (hnu : ∀ y, nu y = ∑ x, π x y) :
    delta * (1 - diagonalMass π) ≤ transportCost π d ∧
      (transportCost π d < delta →
        0 < diagonalMass π ∧ ∃ x, 0 < mu x ∧ 0 < nu x) := by
  have hbound := cost_lower_bound π d delta hpi_nonneg hd_nonneg hd_diag
    hdelta hd_offdiag hpi_total
  refine ⟨hbound, ?_⟩
  intro hcost
  have hdiag := strict_cost_implies_positive_diagonal_mass π d delta
    hpi_nonneg hd_nonneg hd_diag hdelta hd_offdiag hpi_total hcost
  exact ⟨hdiag,
    positive_diagonal_mass_implies_common_positive_marginals
      π mu nu hpi_nonneg hmu hnu hdiag⟩

end FiniteTransport

end C5T304C5T305
