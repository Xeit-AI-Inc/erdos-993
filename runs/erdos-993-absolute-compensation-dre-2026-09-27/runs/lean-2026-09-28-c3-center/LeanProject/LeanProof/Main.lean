import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition e993CenterProduct 9ab62b58e6ca970dcec0ea606eb29a41f898d64f00adf133909123aa696c8385
noncomputable
def e993CenterProduct {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (r : ι → ℕ) : Polynomial ℕ :=
  ∏ i ∈ s, ((1 + Polynomial.X) ^ (r i) + Polynomial.X)
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN lemma e993_center_product_expansion 1a8c59a4a505f32948ebcbf27f9e76d92a03b70a83ba5180d9c127229b5a5787
lemma e993_center_product_expansion {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (r : ι → ℕ) :
    e993CenterProduct s r =
      ∑ t ∈ s.powerset,
        Polynomial.X ^ t.card *
          (1 + Polynomial.X) ^ (∑ i ∈ s \ t, r i) := by
  classical
  unfold e993CenterProduct
  rw [show (∏ i ∈ s, ((1 + Polynomial.X : Polynomial ℕ) ^ (r i) + Polynomial.X)) =
      ∏ i ∈ s, (Polynomial.X + (1 + Polynomial.X) ^ (r i)) from
        Finset.prod_congr rfl (by intro i hi; exact add_comm _ _)]
  rw [Finset.prod_add
    (fun _ : ι => (Polynomial.X : Polynomial ℕ))
    (fun i => (1 + Polynomial.X) ^ (r i)) s]
  apply Finset.sum_congr rfl
  intro t ht
  rw [Finset.prod_const, Finset.prod_pow_eq_pow_sum]
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN theorem e993_center_subset_coeff b2b6d822e06cede1a69ab54fd73571546f1f1be2dbf0cdd3b8440a1ba9e1d452
theorem e993_center_subset_coeff {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (r : ι → ℕ) (k : ℕ) :
    (e993CenterProduct s r).coeff k =
      ∑ t ∈ s.powerset,
        if t.card ≤ k then (∑ i ∈ s \ t, r i).choose (k - t.card) else 0 := by
  rw [e993_center_product_expansion]
  simp only [Polynomial.finsetSum_coeff, Polynomial.coeff_X_pow_mul', Polynomial.coeff_one_add_X_pow,
    Nat.cast_id]
-- VERITYOS ENTRY 3 END

