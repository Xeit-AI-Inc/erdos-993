# Controller candidate for Cycle6: reduce the T_m finite base to m<400

Unawarded, requires fresh independent challenge. This changes only the coefficient lower bound in the pinned all-m candidate, retaining its graph bridge, finite-order ULC theorem, three main/perturbation splits and mixed-minor constants. It is not input to the already frozen Cycle5 seats.

Let N=3m, L=1+z, B=L^3+z, h=17, m>=400, and m<=j<=2m+2. For s=0 or1, the h term in B^(m-1) gives

[B^(m-1)]_j / binom(N,j-s) >= binom(m-1,h) (j-s)_(h-s) (N-j+s)_(2h+3+s)/(N)_(3h+3).

All factors are positive throughout this range. For fixed m,h,s, call the falling-factorial quotient f(j). Its consecutive ratio is

f(j+1)/f(j) = (j-s+1)/(j-h+1) * (N-j-2h-3)/(N-j+s).

This is <=1 when (h-s)(N-j+s)<=(2h+3+s)(j-s+1). That inequality holds for j>=m (substitute N=3m, first at j=m; its right-minus-left increases with j). Hence f(j) is minimized at j=2m+2 on the central interval. At that endpoint, each of the h-s factors in the first product is at least2m+3-h, and each of the2h+3+s factors in the second product is at leastm-2h-4. Using the smaller common bound m-2h-5 is conservative. Since2m+3-h>=m-2h-5, both choices s are bounded below by the s=1 product with those common minima. Also binom(m-1,h)>=(m-h)^h/h! and every denominator factor is <=3m. Thus for either s,

binom(3m,j-s)/[B^(m-1)]_j <= E(m),
E(m)=17! (3m)^54 / [(m-17)^17 (2m-14)^16 (m-39)^38].

The existing main-term lower bounds and perturbation scalars show b_j/a_j<=E(m) for all three LC comparisons, and the needed binomial-to-H ratios are <=E(m) for the mixed minors. No binomial-ratio monotonicity outside the central range is asserted.

The existing neighbor caps do not intrinsically require m1000: using the factor derivative inequalities, the worst left-neighbor ratio for any H of degree at least3m-3 is <=(3/2)(2m+2)/(m-4)<=4 for m>=19. Right ratios are <=4 since the main degree is at most3m+1 and j>=m. Binomial neighbors are <=3 for m>=5. Thus all the existing adverse constants24,47,431,14688/21 remain valid when m>=400.

At m400, exact rational evaluation gives max_C C*(2m+3)*E(m)<0.142<1 for C in{24,47,431,14688/21}. For every larger m, write E(m)=K(m)/m^17. Each normalized denominator factor1-17/m,2-14/m,1-39/m increases, so K(m)<=K(400). Meanwhile (2m+3)/m^17=2/m^16+3/m^17 decreases. All four strict inequalities therefore hold uniformly for m>=400.

Only m3..399 now needs direct central margin checks:242,964 LC and242,964 mixed-minor checks (485,928 total), compared with3,014,928 in the original m3..999 base. The m1,2 ineligibility and exact graph/selector propagation are unchanged. A new replay/cutoff record accompanies this proposal. It remains an informal computer-assisted candidate, not a Lean certificate. Formal ULC closure and the finite-base kernel feasibility remain distinct obligations.
