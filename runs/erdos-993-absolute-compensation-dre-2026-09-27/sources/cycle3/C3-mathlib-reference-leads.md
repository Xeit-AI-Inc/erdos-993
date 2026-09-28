# Controller reference leads for a later formal candidate

Read-only inspection of the pinned Mathlib905b95818eb32af7874a58b427f50c1711a5e96c checkout found:

- Mathlib/Analysis/MeanInequalities.lean: Real.geom_mean_le_arith_mean_weighted (line130) and Real.geom_mean_le_arith_mean (line153).
- Mathlib/Analysis/SpecialFunctions/Log/Basic.lean: Real.le_log_one_add_of_nonneg (line339), statement 2*x/(x+2)<=log(1+x) for x>=0. At x=1/r this gives2/(2r+1).
- Mathlib/Analysis/Complex/Exponential.lean: Real.sum_le_exp_of_nonneg (line246), sum over range n of x^i/i! <=exp x for x>=0.

These are discovery pointers, not a formalization or semantic audit. The eventual formalizer must read exact namespaces/signatures/hypotheses in the pinned checkout and kernel-check the complete coefficient/finite-subset bridge. No code was copied or installed. They were not supplied as new inputs to isolated Cycle2 searchers.

For the differential rank candidate, pinned read-only source inspection also found:
- Mathlib/Algebra/Polynomial/Derivative.lean:58 `Polynomial.coeff_derivative (p : R[X]) (n : Nat) : coeff (derivative p) n = coeff p (n+1) * (n+1)`.
- Mathlib/Algebra/Polynomial/Coeff.lean:143 `coeff_X_mul_zero`; :257 `coeff_X_mul (p) (n) : coeff (X*p) (n+1) = coeff p n` (simp).
- Derivative.lean:604 `derivative_prod` for multisets and :620 `derivative_prod_finset`. A list-inductive differential-cone proof may avoid either product theorem.

These are current pinned-source API pointers only; no Lean source has been built or awarded in this run yet.
