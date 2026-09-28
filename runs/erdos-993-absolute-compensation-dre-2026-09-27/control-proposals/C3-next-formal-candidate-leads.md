# Private formalization options pending C3 synthesis

Priority is a reusable cofactor bridge, not repeated numerical cutoff sharpening. The accepted general positive-block identity includes size1 blocks and the empty index set; do not propagate U2s incorrect k=M singleton-vanishing aside beyond arities>=2.

A minimal closed formal component is the exact center-subset coefficient expansion: for finite index set I and r:I->Nat,
coeff_k product_i((1+X)^(r_i)+X)
=sum_(S subset I) if |S|<=k then choose(sum_(i in I\S) r_i,k-|S|) else0.
The identity is purely polynomial and even permits r_i=0; a positive-size restriction would match the occupancy application. Preserve explicit zero extension (ifcard<=k) rather than Nat subtraction without a guard. This is one component of the occupancy bridge, not the full uniform-subset identity, Jensen lower bound, selectors, or MASS. Verify against registry before registering a distinct formal fragment.

Pinned Mathlib read-only lookup, toolchain4.32.2/revision905b95818eb32af7874a58b427f50c1711a5e96c:
- Algebra/BigOperators/Ring/Finset.lean:171 Finset.prod_add expands product(f_i+g_i) over s.powerset, products over t and s\t.
- Algebra/Polynomial/Coeff.lean:248 Polynomial.coeff_X_pow_mul' gives coeff(X^n*p,d)=if n<=d then coeff(p,d-n) else0.
- Samefile:304 Polynomial.coeff_one_add_X_pow gives choose(n,k) cast to the coefficient semiring.
These API signatures were read from the pinned package, no build or copied Lean code. A full finite-block occupancy identity via weighted subset generating functions would be more valuable if a fresh formalizer can close its counting bridge. Center expansion is an honest smaller prerequisite if needed, never a substitute semantic award.

The separate profile-weighted differential rank proof is now supported by the C3 U1 critics; it is another closed candidate but does not itself resolve the small-prefix or selector method gaps. Select central formal work after neutral synthesis and Astra review.

Boundary obligations for a full occupancy theorem: k=0 requires binom(M-r,k-1)=0 by INTEGER zero extension. Lean Nat subtraction would saturate k-1 to0 and give the wrong exponent; use an explicit k=0 case or signed zero-extended binomial definition. At k=M, singleton probabilities vanish only for blocks of size>=2; size1 contributes probability1. The empty family has M=k=0,H=1,y=0. These are semantic contract tests, not optional narrowing assumptions.

Additional pinned API readback on28September: Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:648 Finset.prod_pow_eq_pow_sum (s : Finset ι) (f : ι -> Nat) (a : M) states product_(i in s) a^(f i) = a^(sum_(i in s) f i); :629 Finset.prod_const gives product a = a^card. These support the exact center-subset expansion with X factors over the chosen subset and L^r over the complement. No Lean invocation or formal award from this lookup.

For a possible full occupancy formalization, a bounded count-vector convolution proof could avoid probability objects, but the targeted pinned Polynomial source lookup found only coeff_prod_of_natDegree_le (a leading-degree statement), not a ready general coefficient-of-finite-product API. Do not assume an unverified theorem name; the center-subset expansion uses APIs actually read above. A larger count-vector bridge may need its own induction over factors.
