-- Intended definitions/signature only, not a proof or verified source.
import Mathlib
open scoped BigOperators

noncomputable
def e993BlockProduct {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) : Polynomial ℝ :=
  ∏ i, ∑ t ∈ Finset.range (r i + 1), Polynomial.monomial t (f i t)

noncomputable
def e993BlockMass {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (k : ℕ) : ℝ :=
  ((∑ i, r i).choose k : ℝ)

noncomputable
def e993BlockCount {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) : ℕ :=
  ((Finset.univ : Finset (Fin (r i))).filter fun v => Sigma.mk i v ∈ S).card

noncomputable
def e993SubsetAverage {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) : ℝ :=
  (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
    ∏ i, f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ)) /
    (((Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k).card : ℝ)

noncomputable
def e993BlockExponent {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) : ℝ :=
  ∑ i, ∑ t ∈ Finset.range (r i + 1),
    (if t ≤ k then
      ((r i).choose t : ℝ) * (((∑ j, r j) - r i).choose (k - t) : ℝ) /
        e993BlockMass r k
    else 0) *
    (2 * (f i t - ((r i).choose t : ℝ)) /
      (f i t + ((r i).choose t : ℝ)))

noncomputable
def e993ExpTaylor (d : ℕ) (y : ℝ) : ℝ :=
  ∑ a ∈ Finset.range (d + 1), y ^ a / (Nat.factorial a : ℝ)

-- The contracted terminal statement is stored separately without a proof placeholder.
