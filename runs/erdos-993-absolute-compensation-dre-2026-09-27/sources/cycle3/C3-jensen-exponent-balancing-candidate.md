# Unreviewed controller candidate: balance the Jensen exponent, not actual payment

This is a new candidate for independent review after C2; it is not a C2 worker input or a registry award.

For a cofactor H with m' blocks of sizes2,3,4, M tips and coefficient k, use the rational logarithm lower estimate g_r(M,k)=2r/(2r+1)*binom(M-r,k-1)/binom(M,k). The proposed Jensen/Taylor bound uses exponent E=sum_r a_r g_r. When M>=10 and M/3<=k<=M, the three values g2,g3,g4 appear discretely convex:

    g2-2g3+g4 >=0.

For k<=M-1 set u=M-k-1. Exact factorial cancellation gives

    g2-2g3+g4 = 4k(M-k)/(315 M(M-1)(M-2)(M-3)) * f,
    f=63(M-2)(M-3)-135u(M-3)+70u(u-1).

Writing v=3k-M>=0, the exact identity is

    9f=37(M-10)^2+290(M-10)+217+v(125M-585)+70v^2.

This is positive for M>=10; prefactor is nonnegative, with k=M handled directly by zero occupancy. Check all normalization factors independently. Thus replacing a2,a4 by a2-1,a4-1 and a3 by a3+2 can only LOWER this exponent at fixed m',M. Repetition gives the explicit minimum at a2=0 or a4=0:

- If 2m'<=M<=3m': E>=(3m'-M)g2+(M-2m')g3.
- If 3m'<=M<=4m': E>=(4m'-M)g3+(M-3m')g4.

These are valid count profiles with nonnegative integer counts. This minimizes only a proposed coefficient LOWER BOUND, not actual parent coefficients, first descent, selectors, aggregate, or normalized payment. It therefore need not contradict the known counterexample to quotient nondecrease. Apply separately to each H_i at M=N-r_i and each shift k=j-s in GF_ri; any k below M/3 or M<10 requires a separate treatment. Actual descent has 5j>2N-1, so shifted ranks may admit a uniform sufficiently-large-M band, but that bridge is not asserted here.

Potential use: reduce all arity mixtures to at most two adjacent-arity scalar exponents for a uniform cofactor estimate, then prove a threshold or small finite scalar certificate. Endpoint-only exclusion and selection weighting still require their own proof. No claim of novelty.
