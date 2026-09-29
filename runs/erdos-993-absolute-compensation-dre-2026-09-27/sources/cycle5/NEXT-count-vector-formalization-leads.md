# Private finite count-vector formalization leads

Not a current C4 input or theorem award. This is an implementation direction to compare with the independently produced C4-T3 result after synthesis.

For a finite family of polynomials f_i of degree at most r_i, use local types Fin(r_i+1). Expanding each factor into monomials and applying Fintype.prod_sum should give a finite sum over dependent functions a: forall i,Fin(r_i+1). Each summand is (product_i coeff(f_i,a_i))*X^(sum_i a_i); extracting coefficient k introduces the exact guard sum_i a_i=k. Empty index types produce the empty function and constant-one polynomial. This avoids saturated subtraction and explicit ambient-vertex subset bijections at the first formal step.

Specializing f_i=(1+X)^r_i proves count-vector Vandermonde normalization. When all r_i>=1, the local binomial factors choose(r_i,a_i) are positive for every local type value. Thus the normalized count-vector weights at total k, divided by choose(sum r_i,k), can support the general coefficient-domination/Jensen proof for0<=k<=sum r_i. The weighted expectation identity then needs a separate proof using the polynomial expansion; no independence of coordinates under conditioning is asserted. The final Jensen/analytic inequalities and graph application remain separate obligations.

Inspected in the pinned Mathlib revision905b95818eb32af7874a58b427f50c1711a5e96c:
- Mathlib/Algebra/BigOperators/Ring/Finset.lean:301, Fintype.prod_sum handles dependent local Fintype domains.
- Same file:157, Finset.prod_univ_sum handles finite local sets via piFinset.
- Same file:124, Finset.prod_sum handles a finite outer index set via its dependent pi set.
- Mathlib/Algebra/Polynomial/Coeff.lean:112, Polynomial.coeff_mul uses a finite antidiagonal.

These API statements were read from the installed source, but this proposed use has not been compiled or independently audited. Do not mistake the existing coeff_prod_of_natDegree_le lemma for the general count-vector expansion: it concerns a specific degree-bound coefficient situation. Any new formal candidate must preserve its exact independently reviewed scope and run through the normal Sol-high stages.

The same pinned source has Real.le_log_one_add_of_nonneg in Mathlib/Analysis/SpecialFunctions/Log/Basic.lean:339, giving2*x/(x+2)<=log(1+x) forx>=0. Settingx=w-1 supplies the exact rational logarithm bound used by the Jensen proof. This removes the need to reprove that scalar inequality by calculus. The instantiation and denominator algebra still require checked Lean code.

Two additional inspected API leads are ConvexOn.map_sum_le (Mathlib/Analysis/Convex/Jensen.lean:67) for nonnegative finite weights summing to one, and Real.convexOn_exp (Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean:63). These may handle the finite Jensen step. They remain source-level leads, not checked applications.

The pinned source also supplies Real.sum_le_exp_of_nonneg in Mathlib/Analysis/Complex/Exponential.lean:246: for x>=0, sum over range n of x^i/i! <= exp x. Using n=d+1 gives the exact finite Taylor floor, so the formalizer need not prove a new remainder theorem. Real.exp_sum in the same file:224 turns the exponential of a finite log sum into a product. These are inspected source leads, still not compiled uses.

For the bounded expansion itself, Polynomial.as_sum_range' in Mathlib/Algebra/Polynomial/Degree/Support.lean:86 states p=sum over range n of monomial i (coeff p i) when natDegree p<n. Take n=r_i+1 under the intended degree bound, translate the range sum to Fin(r_i+1), then apply Fintype.prod_sum. This is a direct source-level starting point, not a proof of the intended terminal declaration.
