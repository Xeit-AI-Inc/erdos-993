# C4-CF-U1 critique report

## Dispositions

- **C4-U1-DESCENT-BINOMIAL-OCCUPANCY-DRIFT — proposed_retained.** The informal universal coefficient argument is valid on the stated ordinary path-star domain. It does not prove selected mass, either payment, or any predicate in the registered primary chain.
- **C4-U1-CONDITIONED-DRIFT-BOUNDED-HORIZON — proposed_retained.** The exact enumeration claim is reproduced independently for all 4,308 eligible count profiles through m=40. This remains bounded evidence.

The registered exact-ratio payment remains a distinct computer-assisted/nonformal claim; this review neither reopens nor upgrades it.

## Universal drift inequality

Write q=N+1 and let
\[
D=1[X_0=0]+\sum_i\left(1[X_i=0]-\frac{r_i-1}{r_i+1}1[X_i=1]\right).
\]
The root-zero state contributes Q to the degree generating polynomial for the numerator of the conditional expectation. For branch i, the zero state contributes GH_i. The state-one coefficient of B_{r_i} is r_i+1, so its weighted negative contribution is \(-((r_i-1)/(r_i+1))(r_i+1)zGH_i=-(r_i-1)zGH_i\). Thus the numerator polynomial is
\[
Q+G\sum_iH_i-zG\sum_i(r_i-1)H_i.
\]
This is exactly \((1+z)C'-qC\): the weighted Leibniz terms are \((1+z)G'-G=1\) and \((1+z)B_r'-rB_r=1-(r-1)z\). Taking coefficient k gives
\[
\mathbb E_kD=\frac{(k+1)C[k+1]-(q-k)C[k]}{C[k]}
=(k+1)\frac{C[k+1]}{C[k]}-(q-k).
\]
All denominators C[k] used here are positive on the support.

For an actual eligible p, j=p-2 satisfies x≤j and 2j≤N-2. Hence x<(q+1)/2 and
\[
\beta_x=\binom qx-\binom q{x-1}>0,
\]
including x=0 with the usual zero convention. This is the coefficient \(\Delta_x(zL^q)\), not an approximation. Since x is an actual strict descent of P=C+zL^q,
\[
\Delta_x C+\beta_x=\Delta_xP<0,
\quad\text{so}\quad
\frac{C[x+1]}{C[x]}<1-\frac{\beta_x}{C[x]}.
\]
The inequality direction is preserved on division because C[x]>0.

G has coefficient vector (1,2); B_2,B_3,B_4 have vectors (1,3,1), (1,4,3,1), (1,5,6,4,1). Each is positive on an integer interval and log-concave (the adjacent checks are immediate from these vectors). Convolution preserves positive interval support and log-concavity, so C has decreasing adjacent ratios wherever defined. Since j≥x and C[j], C[x] are positive,
\[
\frac{C[j+1]}{C[j]}\le\frac{C[x+1]}{C[x]}.
\]
Substitution into the exact drift identity therefore gives
\[
\mathbb E_jD
< (j+1)\left(1-\frac{\beta_x}{C[x]}\right)-(q-j)
=2j-N-\frac{(j+1)\beta_x}{C[x]}
<2j-N.
\]
The strict direction is preserved because j+1, beta_x, and C[x] are positive. No negative factor is multiplied or divided in this proof; the only divisions are by positive coefficients. This establishes the report's stronger binomial-corrected drift bound. The selectors and original tag multiplicities are retained as context, but do not enter this occupancy inequality.

Exact checks at the boundary profile (a2,a3,a4)=(0,12,10), N=76, x=37, p=39, j=x give
\[
\mathbb E_jD=-60593070467780913468600/26246340325222555216909
< -181442291628849600954214/78739020975667665650727
< -2=2j-N.
\]
The three guards hold, with p=x+2 and 2p=alpha. An interior-rank check at (a2,a3,a4)=(0,10,28), N=142, x=69, p=72, j=70 gives
\[
\mathbb E_jD=-27579070404441379676582001548770296043630297/
6616236267173779690465931937604614750815979
< -173311228240206999333345407952945829467717/
78981754926820835649478628767571139552886
< -2=2j-N.
\]
Here p>x+2 and 2p=alpha. These are checks of the substitution, not the proof's universal basis.

## Bounded probe audit

I copied the packet's producer script before execution and replayed it with
`PYTHONDONTWRITEBYTECODE=1 python3 occupancy_drift_probe_producer_copy.py`.
It returned 4,308 eligible profiles and no upward discrepancy. Separately, `independent_drift_check.py` reconstructs the B_r powers, C, P, and first strict zero-extended descent directly with integer polynomial convolution; it checks the literal p guards and compares the rational derivative-identity value of E_xD to the exact fugacity-one expression for each eligible profile with m≤40. It independently returns the same 4,308 count and no violation. This check verifies finite scope only; it cannot establish a conditional-versus-unconditioned theorem beyond m=40.

The mechanism is useful as a universal descent-to-occupancy correction, but the factor beta_x/C[x] has no uniform lower estimate here. The result supplies no selected-mass bound, endpoint-only exclusion, payment, or universal primary proof.

## Replay and evidence

From the eventual admitted directory:

- `PYTHONDONTWRITEBYTECODE=1 python3 independent_drift_check.py`
- `PYTHONDONTWRITEBYTECODE=1 python3 occupancy_drift_probe_producer_copy.py`

Artifacts: `cycles/cycle-4/C4-CF-U1/independent_drift_check.py` and `cycles/cycle-4/C4-CF-U1/occupancy_drift_probe_producer_copy.py`.
