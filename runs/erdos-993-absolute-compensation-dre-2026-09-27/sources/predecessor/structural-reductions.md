# Exact structural reductions and their remaining obligations

This is a controller-curated mathematical account of the final cycle. The identities and implications below are established informally. Only the separately cited coefficient margin has a governed formal award. None supplies the missing universal absolute payment.

Use the ordinary path-star conventions from `hybrid-family-proof.md`: L=1+z, G=1+2z, B_r=L^r+z, F_r=sum_(h=0)^(r-2)L^h, Q=product_i B_(r_i), H_i=Q/B_(r_i), C=GQ, T_i=G F_(r_i) H_i, N=sum_i r_i, q=N+1, alpha=N+2. Differences are forward, Delta_k f=f[k+1]-f[k], with integer zero extension. Let x be the first strict descent of P=C+zL^q. Endpoint and private-tip deletion polynomials are A0=LQ+zL^N and Ai=G B_(r_i-1)H_i+zL^N. The current-p strict flags are e0=1[Delta_p A0<0], ei=1[Delta_p Ai<0], and b=e0+sum_i r_i ei. Branches remain distinct and each has r_i original tip tags.

## Absolute mass is the remaining quantitative input

At an actual eligible lower-half rank, x+2<=p, 3p<2alpha+1 and 2p<=alpha. Put j=p-2, delta=q-j, D_j=Delta_j L^N, A=sum_i r_i ei T_i[j], and t=C[j+1]/C[j]. Here D_j>0. Each G and B_r has positive interval support and is log-concave; convolution preserves these properties. The binomial parent summand is rising at x, so Delta_x P<0 implies Delta_x C<0. The adjacent coefficient ratios of C decrease, giving 0<t<1 at j>=x.

The formal margin gives T_i[j+1]<=((delta-1)/delta)t T_i[j]. Summing with the nonnegative fixed weights r_i ei yields

    S = b D_j + sum_i r_i ei Delta_j T_i
      <= b D_j - (1-t+t/delta) A
      <= b D_j - A/delta.

Thus either of the following suffices:

    selected MASS:                  A >= b delta D_j;
    weaker exact-ratio payment:     (1-t+t/delta) A >= b D_j.

Both remain unproved universally as independent structural mechanisms. The accepted computer-assisted sign of S does not imply either sufficient inequality. A finite minimum of the payment ratio is not a universal extremum.

## Center-choice layers

Expand each unmarked factor by choosing z or L^r. For each branch i,

    T_i[j] = sum_(epsilon=0,1) g_epsilon
             sum_(J subset branches other than i)
             sum_(h=0)^(r_i-2)
             choose(N-r_i-sum_(k in J) r_k+h, j-|J|-epsilon),

where g_0=1, g_1=2 and out-of-range binomial coefficients vanish. Every term is nonnegative. Retaining J empty and singleton gives the exact lower bound

    U_i[j] = [z^j](G F_(r_i) L^(N-r_i))
             + sum_(k!=i) [z^(j-1)](G F_(r_i) L^(N-r_i-r_k)) <= T_i[j].

Its universal payment of MASS is false: at homogeneous arity 4, m=150, x=292, p=294, all 601 tags are selected and the weighted U/debt ratio is 54265033341372268/58874874038028945<1. Full MASS and S<=0 still hold. See `boundary-controls/README.md`. The lower bound and the source's bounded m<=40 successes remain valid. Additional layers need an actual quantitative proof.

For selected branches I, put k=|I| and B=sum_(i in I)r_i. The exact slack identity is

    A-(B+e0) delta D_j
      = sum_(i in I) [r_i T_i[j]-(r_i+1)delta D_j]
        +(k-e0)delta D_j.

This counts available marked slots but constructs no injection or flow into them.

## Selector threshold

Since L B_r-G B_(r-1)=z^3 F_r,

    A0-Ai=z^3 F_(r_i) H_i,
    d_i:=Delta_(p-3)(F_(r_i)H_i)=Delta_p A0-Delta_p Ai.

In particular ei=1 exactly when d_i>Delta_p A0. When the endpoint is selected, the stronger d_i>=0 condition is sufficient but unnecessary. At counts (a2,a3,a4)=(0,12,10), x=37, p=39, both represented d_i are negative while all 76 tips and the endpoint are selected. The exact cofactor slopes are -895239471360525542716 and -1240837532571249046896. Thus the proposed universal existence of a nonnegative d_i fails.

Endpoint-only selection itself is already excluded at computer-assisted grade: in the lower half it would give S=D_j>0, contradicting the accepted aggregate. An independent census-free exclusion remains missing if one wishes to use it in a replacement proof.

## Spread criterion

For a fixed-(m,N) replacement (3,3)->(2,4), retain the full unchanged product K. Exact algebra gives

    B2 B4-B3^2=z^3 L^2,
    E=P_new-P_old=G z^3 L^2 K,
    Delta_k E=K[k-2]+3K[k-3]+K[k-4]-3K[k-5]-2K[k-6].

The first descent does not decrease exactly when Delta_k P_old+Delta_k E>=0 for every 0<=k<x_old. This is a criterion, not a proof that the condition always holds. In the alternative expanded stencil, the parent-binomial forward difference is choose(q,k)-choose(q,k-1); its reverse sign in the source display is incorrect.

A spread-based proof needs three separate ingredients: universal first-descent nondecrease, universal selected-S nonincrease at common eligible ranks, and an independent census-free balanced-family base. If descent is nondecreasing, eligibility at the final descendant transfers backwards to its ancestors. Eligibility at an ancestor need not transfer forward.

## Occupation payment adds no automatic compensation

In the rank-conditioned product measure, the root has weights (1,2), a branch has weights a_r(k)=choose(r,k)+1[k=1], and the normalizer is C[j]. Let D=1[X0=0]+sum_i(1[Xi=0]-(r_i-1)/(r_i+1)1[Xi=1]). Exact birth reindexing gives E_j D=(j+1)t-delta. Consequently E_j D<2j-N<=-2 throughout the actual lower-half target; the complementary easy case E_j D>=-1 is empty there.

Let B=q 1[X0=0] product_i choose(r_i,Xi)/a_(r_i)(Xi), M_e=sum_i ei r_i choose(r_i-1,Xi+1)/a_(r_i)(Xi), and W_e=M_e+(b/q)B. Then E_j W_e=(A+b choose(N,j))/C[j] and E_j B=q choose(N,j)/C[j]. The proposed sufficient occupation payment

    (j+1)(C[j]-C[j+1]) E_j W_e
      >= C[j](b/q)(-1-E_j D) E_j B

reduces, by substitution and cancellation, exactly to

    (1-t) A >= b D_j.

This is stronger than the exact-ratio sufficient test above and remains unproved universally. A nonpositive main-mark covariance remainder alone does not pay this absolute debt. Likewise, a negative mean full generator drift alone leaves the full covariance term uncontrolled. The finite observations of negative conditional means retain their bounded scope.
