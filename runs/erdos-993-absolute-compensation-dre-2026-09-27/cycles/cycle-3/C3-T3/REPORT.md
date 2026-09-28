# C3-T3 report — Jensen exponent balancing

## Scope and conclusion

I audited `E993-PATH-STAR-COFACTOR-JENSEN-EXPONENT-ADJACENT-ARITY-BALANCING` and the proposed relaxed scalar check for (70\le m\le119). The exponent-balancing identity and endpoint-minimization argument have an exact proof at the registered scope. An independent exact-arithmetic implementation reproduces every row of the finite scalar certificate. I found no failure in either.

These results concern a lower bound for cofactor coefficients. The finite scan is bounded evidence, not a tree/profile census or universal payment proof. It does not establish the occupancy-to-coefficient composition for all profiles, prove selector clauses, or settle selected MASS or exact-ratio payment. The primary and MASS remain OPEN at their registered scopes. No Lean/formal verification was performed.

## Exact balancing proof

For (M\ge10), (M/3\le k\le M), and (r=2,3,4), set
\[
g_r(M,k)=\frac{2r}{2r+1}\frac{\binom{M-r}{k-1}}{\binom Mk},
\]
with out-of-range binomials zero. At (k=M), all three values are zero. For (k<M), put (u=M-k-1\ge0), (v=3k-M\ge0). Factorial cancellation gives
\[
g_2-2g_3+g_4=
\frac{4k(M-k)}{315M(M-1)(M-2)(M-3)}f,
\quad f=63(M-2)(M-3)-135u(M-3)+70u(u-1).
\]
Direct expansion, using (v=3k-M), gives
\[
9f=37(M-10)^2+290(M-10)+217+v(125M-585)+70v^2>0.
\]
Every term on the right is nonnegative and the constant block is positive for (M\ge10,v\ge0); the prefactor is positive for (k<M). Hence (g_2-2g_3+g_4\ge0).

For nonnegative integer counts (a_2+a_3+a_4=m') and (2a_2+3a_3+4a_4=M), if (a_2,a_4>0), replacing one block of size 2 and one of size 4 by two size-3 blocks changes (E=\sum a_rg_r) by (2g_3-g_2-g_4\le0), preserving (m',M). Repetition reaches (a_4=0) when (2m'\le M\le3m'), or (a_2=0) when (3m'\le M\le4m'). Those endpoint profiles give exactly the two registered formulas. Thus balancing minimizes this Jensen exponent lower bound at fixed ((m',M,k)). It says nothing about ordering the actual cofactor coefficients, profile modes, flags, or normalized payment.

## Independent finite scalar audit

I copied the producer evaluator into this scratch before replaying it. Separately, `independent_balanced_check.py` recomputes each state using `math.comb` and `Fraction`, forms the adjacent-arity exponent as an exact rational, floors it to thousandths, and evaluates the positive degree-12 Taylor polynomial with an exact common denominator. It explicitly asserts (M\ge10), (3(j-s)\ge M) for every (GF_r) shift, nonnegative exponents, and the strict scalar target in every state. The result agrees row by row with both the copied producer replay and the common certificate:

- (m=70,\ldots,119): 799,895 tested states, 0 exclusions.
- Every per-(m) state count, exact minimum ratio and minimizing ((N,r,j)) agrees.
- The minimum is attained at (m=70,(N,r,j)=(278,2,112)); its exact lower-bound ratio is in `independent_balanced_check.json`.

This verifies the listed relaxed domain and arithmetic. It does not by itself verify that occupancy/Jensen bounds imply every intended true coefficient or that these relaxed states cover the actual eligible family; those are proof obligations in the composition. The binomial/Taylor arithmetic uses only positive terms: flooring (E\) downward preserves a lower bound, and (\sum_{h=0}^{12}t^h/h!\le e^t) for (t\ge0).

The rank-to-shift guard needed by this scan follows from the accepted source rank implication (5x>2N-1), together with (j\ge x). For (GF_r), shifts satisfy (0\le s\le r-1), and (2j\le N-2). The desired (3(j-s)\ge N-r) follows whenever (N\ge10r-12): indeed (3j>3(2N-1)/5\ge N+2r-3\ge N-r+3(r-1)). In this finite scan (N\ge2m\ge140), so the condition holds separately for (r=2,3,4); also (M=N-r\ge10). This preserves both rank guards and all shifts.

## Analytic continuation attempt and limits

The profile-sensitive strict-descent rank candidate was not needed to validate this band: the already accepted (5x>2N-1) rank bound and the stated eligible-rank guards establish every shifted Jensen hypothesis throughout it. The extra count-sensitive rank term could tighten a future relaxed tail estimate, but I did not derive an all-(m) analytic inequality that removes the (70\)–(119) scalar check. Nor does the (m\ge120) local-coefficient candidate, even if independently proved, exclude endpoint-only selection. Accordingly I make no universal local MASS, selected MASS, selector, or primary-payment claim.

## Reproduction and evidence

From the admitted directory `cycles/cycle-3/C3-T3/`, run:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_balanced_check.py
PYTHONDONTWRITEBYTECODE=1 python3 producer_balanced_finite_check_copy.py
```

`independent_balanced_check.json` retains per-(m) counts, exact ratios and minimizers. `producer_replay.log` retains the copied evaluator's replay output; `producer_balanced_finite_check_copy.json` is its generated data. `manifest_audit.json` records successful SHA-256 validation of all 86 common-dispatch members and all 3 transport-clarification members, including the shared-source clarification and both transport runner files. I read the clarification and runner files but did not execute or invoke controller operations.
