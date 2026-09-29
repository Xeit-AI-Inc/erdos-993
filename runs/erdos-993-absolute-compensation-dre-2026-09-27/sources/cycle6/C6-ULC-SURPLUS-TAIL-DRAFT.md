# Unreviewed C6 candidate: exact-ratio ULC surplus on the full guarded band for m>=100

Controller preparation only. Not an input to active C5 seats and not a registry promotion. This is a proposed proof subcase of the existing OPEN E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS, not a new claim identity. It reuses known enlarged-order ULC, the known coefficient-ratio floor and the now-formal full Jensen theorem. No novelty claim. Every step needs independent review.

Use exact ordinary path-star notation: m>=1, r_i in{2,3,4}, N=sum r_i, L=1+z, G=1+2z, B_r=L^r+z, Q=prod B_r, C=GQ, H_i=prod_(ell!=i)B_r, U_i=G B_(r_i-1)H_i, E=zL^N. For 1<=k and2k<=N+2, put h=1+2a2+4a3+7a4 and lambda=(h+1)/((k+1)(h-k+1)). The proposed tail conclusion is STRICT positivity of

    (h+1)U_i[k]C[k]+(k+1)(h-k+1)(E[k]C[k]-E[k+1]C[k-1])

for every represented tip when m>=100. No actual first-descent premise. This does not cover the endpoint. Its positive weighted sum is a consequence, not a separate target. Full all-m surplus remains OPEN unless the remaining m<100 scope is separately proved.

## 1. Low-rank binomial component, for every m

Expand Q=sum_(S subset centers) z^s L^(N-R), where s=|S| and R=sum_(i in S)r_i<=4s. For each term normalize its kth coefficient by c_k=choose(N,k). On positive adjacent support the consecutive-ratio cross-product has sign

    s(N+1)-kR.

This follows by cancelling the binomial ratios: k(N-R-k+s+1)-(k-s)(N-k+1)=s(N+1)-kR. Therefore for4k<=N+1 every normalized term is nondecreasing from k-1 to k, since R<=4s. Outside positive adjacent support check the zero-extension boundaries explicitly: newly appearing terms are nonnegative; a disappearing positive term cannot occur in this low band: it would force N-R=k-1-s and s<=k-1, whence R<=4s implies N+4<=4k, contradicting4k<=N+1. The empty S term is identically1. Summing gives Q[k]/c_k>=Q[k-1]/c_(k-1). The same holds at k-1 when k>=2. Binomial log-concavity then gives

    c_(k-1) C[k]-c_k C[k-1]
      =c_(k-1)Q[k]-c_k Q[k-1]
       +2(c_(k-1)Q[k-1]-c_k Q[k-2]) >=0.

For k=1 the second bracket is positive because Q[-1]=0. Since E[k]=c_(k-1) and E[k+1]=c_k, this is M_k(E)>=0. Thus low-band surplus is positive from U_i[k]C[k]>0, without a lower bound on m. The proof needs explicit binomial support and positive denominator treatment; the cross-product statement can avoid division entirely.

## 2. Uniform singleton exponent in the complementary band

Now m>=100 gives N>=200, and4k>N+1 implies k>N/4. For r in{2,3,4} define

    g_r(N,k) = (2r/(2r+1))*choose(N-r,k-1)/choose(N,k).

The consecutive arity ratios are

    g3/g2=(15/14)*(N-k-1)/(N-2),
    g4/g3=(28/27)*(N-k-2)/(N-3).

Thus g2>=g3>=g4 for N>=200,k>N/4 (check N+13<=15k and N+25<=28k). All quantities are positive in this band. For fixed N,

    g4(k+1)/g4(k)=(k+1)(N-k-3)/(k(N-k))<=1

when4k>=N-3. Hence the minimum in our band is at K=floor((N+2)/2).

For N=2s, K=s+1,

    g4(N,K)=(2/9)*(s+1)(s-2)(s-3)/(s(2s-1)(2s-3)).

The inequality g4>=1/20 is equivalent to

    4s^3-88s^2+13s+240=4s^2(s-22)+13s+240>=0,

which holds for s>=100. For N=2s+1,K=s+1,

    g4(N,K)=(2/9)*(s+1)(s-2)/((2s+1)(2s-1)),

and the corresponding numerator is4s^2-40s-71>0 for s>=100 (e.g. expand in s-100 with positive coefficients). Therefore every unmarked branch supplies at least1/20 to the Jensen exponent.

## 3. Apply the FULL coefficient theorem directly to U_i

The polynomial U_i factors into G=B1, the marked factor B_(r_i-1), and m-1 unmarked factors B_(r_ell). Their block sizes sum to1+(r_i-1)+(N-r_i)=N. All sizes are positive, including the size-one case. Each factor is L^a+z and satisfies the binomial coefficient floors. Thus the formal full Jensen theorem applies at the SAME coefficient rank k and total size N, with no convolution shift or transfer assumption. The extra root and marked-block exponent terms are nonnegative. By Step2,

    U_i[k] >= choose(N,k)*exp((m-1)/20).

This is a literal polynomial factorization application; it supplies no new arbitrary-tree factorization or selector statement.

For every real/integer m>=100, exp((m-1)/20)>m+2 follows from a fixed Taylor polynomial. Let a=99/20,t=(m-100)/20>=0. Nonnegative binomial expansion gives E8(a+t)>=E8(a)+t E7(a). Exact rational inequalities E8(a)>102 and E7(a)>20 give E8(a+t)>102+20t=m+2. Exp dominates E8 for nonnegative arguments. Check the two rational values independently.

## 4. Pay the exact deficit

The already established C coefficient ratio lower bound follows directly from the coefficientwise operator (3+2z)F'-2dF: its nonzero monomial coefficient lists are (4) for G of degree1, (5) for B2, (6,2,3) for B3, and (7,6,12,4) for B4. All are nonnegative. The product rule gives (3+2z)C'-2(N+1)C>=0 coefficientwise. Extracting rank k-1 gives the lower bound

    C[k]/C[k-1] >= 2(N+2-k)/(3k).

Let e=E[k]>0 and b=choose(N,k)/choose(N,k-1)=(N+1-k)/k. Then

    M_k(E)/(e*C[k])
       =1-b*C[k-1]/C[k]
       >=1-(3/2)*(N+1-k)/(N+2-k)>-1/2.

Also h>=N+1 implies every curvature denominator is positive, and

    lambda>1/(k+1)>=2/(N+4),
    b>=N/(N+2).

Consequently

    lambda*U_i[k]/e
       > 2N(m+2)/((N+4)(N+2)) >=1/2.

For the last inequality, N<=4m and N>=200 imply
4N(m+2)>=(N+4)(N+2): the difference is at least2N-8>0. Therefore lambda U_i[k]C[k]+M_k(E)>0. Multiplication by the positive (k+1)(h-k+1) gives the proposed exact-ratio surplus.

## Research consequence and limits

If independently validated, this proves the NEW sharper sufficient condition for m>=100 across the ENTIRE guarded band, using a simple low-rank identity and a Jensen tail. It is different from merely reusing the predecessor's217(j+1)epsilon<1 certificate at m>=266 on its actual-descent propagation band. It leaves m<100 and the endpoint open. It may motivate a smaller structural base argument or a sharper constant, but the current finite census only through m20 plus selected larger profiles cannot fill that gap. Do not claim that finite coverage or the accepted all-m primary implies this stronger surplus predicate. No C5 worker receives this private candidate before its standard stages close.

## Additional endpoint bridge to review

The following elementary identity may close the endpoint gap once tip surplus is available. Put U0=LQ, so A0=U0+E. For EVERY represented branch i,

    U0-U_i = H_i*(L B_(r_i)-G B_(r_i-1))
            = z^2*(L^(r_i-1)-1)*H_i.

All coefficients are nonnegative. Hence U0[k]>=U_i[k]. Since the curvature-surplus expression has the same M_k(E) and positive C[k], endpoint surplus is at least any represented tip surplus. Nonempty m supplies such an i.

To convert endpoint surplus into the actual endpoint shifted comparison still use the explicit main-product LR argument: local coefficient ratios L/G are(1,1/2), decreasing; convolution by log-concave Q preserves this order. Thus U0[k+1]/C[k+1]<=U0[k]/C[k]. Combining with the SAME enlarged-order ULC curvature for C yields M_k(U0)>=lambda U0[k]C[k]. Therefore proved tip surplus implies M_k(A0)>=0 as well as the actual tip minors. This is a conditional algebraic bridge, not an assertion that the OPEN all-m premise is established. Coefficientwise U0>=Ui alone would not imply an arbitrary LR comparison; the common quantitative deficit and endpoint main-product LR are both needed.

If independently validated, the proposed m>=100 tail therefore yields all original-leaf guarded shifted comparisons on that tail, not only tips. A future verified full finite base m<100 would give the entire registered individual comparison, and its common-C positive sum would give the weighted deck comparison. No such base has been certified here. The formerly refuted unrestricted coarse-ratio certificate is NOT reinstated: the use of that bound here is restricted to the analytically paid m>=100 tail, while its m4/m24/m40 failures remain valid.
