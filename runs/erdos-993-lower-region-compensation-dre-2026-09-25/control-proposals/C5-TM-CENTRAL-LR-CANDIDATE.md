# Root candidate: effective mixed-minor bounds and all-parameter T_m sign

Unawarded Astra proof candidate, independent audit REQUIRED. This supplements the central-LC candidate. No status changes yet. The fixed polynomial definitions P,A0,Astar,R and cutoff m=1000 are exactly those in the two root candidates and their replay scripts.

## Common input

For m>=1000 and m<=j<=2m+2, put b0=(1+z)^(3m), and let K=8! (125/124)^8 (150/49)^27. The preceding falling-factorial proof shows that for any H coefficientwise >=B^(m-1), either (b0)_j/H_j or (z b0)_j/H_j is <=epsilon=K/m^8. No probabilistic limit is used. The factored main H below is Poisson-ULC and has derivative comparison constants 2/3 and2. Each has degree between3m-3 and3m; consequently H_(j+1)/H_j<=4 and H_(j-r)/H_j<=4^r for 1<=r<=4. For the latter, apply the one-step bound successively at ranks <=j; the worst upper rank is j=2m+2, and (3/2)(2m+2)/(m-4)<=4 for m>=1000. All indicated indices are positive.

## Nonnegative convolution minors with a quantitative term

Let c,g be finite coefficient sequences with c_r g_s-c_s g_r>=0 for r<s. If H is LC without internal zeros, Cauchy-Binet on the two convolution columns gives
 [z^j](cH)[z^(j+1)](gH)-[z^(j+1)](cH)[z^j](gH)
 =sum_(r<s)(c_r g_s-c_s g_r)(H_(j-r)H_(j+1-s)-H_(j-s)H_(j+1-r)).
Every summand is nonnegative (zero extension understood). Keeping r=0,s=1 and using Poisson ULC gives a lower bound
 (c_0g_1-c_1g_0) H_j^2/(j+1).
For the three comparisons Z=a+b against P=V+d, choose:

A0: H=B^m, c=1+z, g=1+2z, a=cH, V=gH, b=z b0, d=z(1+z)b0. The 0,1 coefficient is1.
Astar: H=(1+2z)B^(m-1), c=1+3z+z^2, g=B, a=cH, V=gH, b=z b0, d=z(1+z)b0. The coefficient is1.
R: H=B^(m-1), c=3m(2+5z+2z^2), g=(1+2z)B=1+6z+11z^2+7z^3+2z^4, a=cH, V=gH, b=(3m+1)b0, d=z(1+z)b0. The coefficient is21m.
In each case the list c_r/g_r is nonincreasing, directly checked from the displayed small polynomials, so the Cauchy-Binet hypotheses hold.

## Perturbation control

The pure perturbation minor b_j d_(j+1)-b_(j+1)d_j is nonnegative. In the two deletion cases d=(1+z)b, so this is ordinary LC of b. In the R case it is (3m+1) times the sum
 (b0)_j^2-(b0)_(j-1)(b0)_(j+1)
 +(b0)_j(b0)_(j-1)-(b0)_(j+1)(b0)_(j-2),
both nonnegative by binomial LC. For the two mixed cross products discard the positive terms, leaving the lower bound minus a_(j+1)d_j-b_(j+1)V_j. The following explicit coarse bounds follow from the neighbor ratios above (binomial neighbor ratios are <=3 in this central interval):

A0: a_(j+1)<=5H_j; V_j<=9H_j; d_j<=4b_j; b_(j+1)<=3b_j. Negative cross products <=47 epsilon H_j^2.
Astar: a_(j+1)<=11H_j; V_j<=129H_j; d_j<=4b_j; b_(j+1)<=3b_j. Negative cross products <=431 epsilon H_j^2.
R: a_(j+1)<=63m H_j; V_j<=1161H_j; d_j<=12(b0)_j; b_(j+1)<=(12m)(b0)_j. Negative cross products <=14688m epsilon H_j^2.
Here 129=1+4*4+3*4^2+4^3, and1161=1+6*4+11*4^2+7*4^3+2*4^4. No total-mass ratio substitutes for a coefficient ratio.

Thus strict positive mixed minors follow respectively from
 47(j+1)epsilon<1, 431(j+1)epsilon<1, (14688/21)(j+1)epsilon<1.
All hold at m=1000 by exact rational checks with j+1<=2003; the largest cutoff ratio is below1. Monotonic decrease of (2m+3)/m^8 proves all m>=1000. The exact finite script separately checks all three mixed minors for every m3..999 and every central rank. Its output must pass and be independently audited before combining the two pieces.

## Proposed all-parameter family consequence

For T_m (m>=1), degree/independence number a=3m+2. The existing r27 forest order theorem at the first strict descent gives4m+3<=4x, hence x>=m+1. Eligibility gives x<=p-2 and p<=2m+1, so x<=2m-1. m1,2 have no eligible p, checked directly (x=2,4). At any eligible m>=3, the established central mixed minors at j=x give Z_(x+1)/Z_x<P_(x+1)/P_x<1 for each Z=A0,Astar,R. Central LC then propagates strict decrease through every needed rank: j=p for both deletion polynomials and j=p-2 for R. Both original leaf orbits are favorable, and their full tagged marked sum is S=R_(p-1)-R_(p-2)<0.

This candidate resolves only the exact T_m family if every step and finite base is independently validated. It proves neither general ordinary-tree aggregate nor the Erdős conjecture, and no Lean kernel verification has occurred. The finite base is a computer-assisted component unless replaced by a fully algebraic argument or kernel-checked enumeration. The earlier r19 four-ratio package need not be proved: this uses an explicitly different, central-only sufficient package without P log-concavity or P no-recovery.
