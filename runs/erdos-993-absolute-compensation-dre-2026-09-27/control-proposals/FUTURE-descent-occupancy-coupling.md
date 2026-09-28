# Controller-private future question: first descent and block occupancy

Unreviewed algebraic route question, not an accepted bound, new target or input to current workers. Consider D_d(f)=(1+z)f'-d f. Its weighted Leibniz rule gives D_r(B_r)=1-(r-1)z and D_1(G)=1. For q=N+1 and P=GQ+zL^q, the exact candidate identity is

    (1+z)P'-qP = Q + G sum_i H_i - zG sum_i (r_i-1)H_i + L^(q+1).

At a strict descent x, if the right side coefficient can be bounded below by -h P[x], then 2x>N-h. A crude global bound via B_r >= (r+1)z makes h too large. Conditional singleton/block occupancy at the actual coefficient may give a sharper bound; the positive L^(q+1) term is especially relevant in the small range. Any estimate must be proved, not inferred from tilted-binomial means or independent occupancy.

For orientation only, the private complete prefix instrument reports no eligible lower-half row for m<=21; first eligible profiles occur at m22, and the worst local ratio occurs at m32, while worst MASS ratio occurs at m39. These are pending finite evidence, not universal cutoff theorems. The coarse 2N/5 and profile-sensitive approximately4N/9 rank barriers leave too much relaxed debt in this range. Coupling the exact descent identity with occupancy rather than replacing it by a fixed global rank fraction might reduce dependence on a prefix census. No candidate proof is asserted here; all signs, indices and coefficient normalizations need independent review if this becomes a future route.


## Conditional local-state interpretation for possible C4 search
Write C=G product B_r and condition the nonnegative product coefficient model on total degree k. The exact identity
((k+1)C[k+1]-(N+1-k)C[k])/C[k]
=Pr(G-state0)+sum_i Pr(Y_i=0)-sum_i((r_i-1)/(r_i+1))Pr(Y_i=1)
follows from (1+z)C'-(N+1)C=Q+G sum_i H_i-zG sum_i(r_i-1)H_i. Here local branch state1 has weight r_i+1. This is an algebraic identity, not an asserted useful probability bound. At a strict C descent its left side is <2k-N.
At the unconditioned fugacity1 model, the branch contribution is (2-r)/(2^r+1), so a valid conditioned comparison would suggest a much sharper rank estimate than the current2N/5 bound. That unconditioned substitution is NOT justified. In particular do not assume G H_i[k-1]<=G H_i[k] near the parent mode; deletion shifts the cofactor mode and can reverse it. The positive shifted-binomial term of P may supply the missing small-m compensation. This is a focused question about conditioned coefficient distributions, not a new theorem/award. Compare Efron-type monotonicity, coefficient-ratio bounds, and a self-consistent tilt only after their hypotheses are checked.

A precise unconditioned mixture representation, still not a mode theorem: each normalized B_r at fugacity1 chooses Binomial(r,1/2) with probability2^r/(2^r+1), or deterministic1 with probability1/(2^r+1). Its mean is (r*2^(r-1)+1)/(2^r+1): 1,13/9,33/17 for r2,3,4. The G factor is Bernoulli(2/3). Conditional on the setJ of deterministic-center choices, the branch sum is |J|+Binomial(N-sum_(i in J)r_i,1/2). This is exact algebra for C/C(1). It suggests studying the difference between mode and mean or posterior center counts, but generic log-concavity alone does not put mode within1ofmean, nor do Br have an available real-rootedness assumption. No such estimate or rank conclusion is asserted. P additionally mixes the shifted-binomial summand; that weight cannot be discarded when proving actual parent descent.
