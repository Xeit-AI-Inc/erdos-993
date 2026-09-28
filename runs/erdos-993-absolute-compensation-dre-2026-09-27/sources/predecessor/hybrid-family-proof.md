# All-parameter arity-2,3,4 path-star aggregate

This is a curated account of the Cycle 3 proof accepted after two complete exact finite implementations and the 9/18/3/1 review. Its grade is **computer-assisted, nonformal**. It proves the complete strict-selected original-leaf aggregate on this family. It is not a census-free proof, a formal graph theorem, or a proof of Erdős 993.

## Model and statement

Start with the path 0–1–2. Attach m distinct centers to 0, and attach r_i private tips to center i, with m>=1 and r_i in {2,3,4}. Set N=sum r_i, alpha=N+2, L=1+z, G=1+2z, B_r=L^r+z, Q=product B_r, H_i=Q/B_(r_i), F_r=sum_(h=0)^(r-2)L^h. Conditioning on vertex0 gives

P=I(T)=GQ+zL^(N+1), A0=I(T-2)=LQ+zL^N,
Ai=I(T-v_i)=G B_(r_i-1)H_i+zL^N.

The original-support marked polynomials are zL^N for the endpoint and z(L^N+G F_(r_i)H_i) for every individual private tip. There are N+1 original leaf tags, not m+1. Coefficients are zero outside their support and Delta_j a=a_(j+1)-a_j. Let x be the first strict parent descent. At p, define e0=1[Delta_p A0<0], ei=1[Delta_p Ai<0], j=p-2 and b=e0+sum r_i ei. The exact selected sum is

S=b Delta_j L^N+sum_i r_i ei Delta_j(GF_(r_i)H_i).

For every p with x+2<=p and 3p<2alpha+1, S<=0.

## Exhaustive partition

| Branch counts | Evidence |
|---|---|
| m1..40 | Every 12,340 arity-count profile and 191,016 eligible rows, complete strict-selected sum. |
| m41 | All903 profiles and19,359 eligible rows. |
| m42..265 | Two distinct exact GMP programs: 3,159,072 profiles and21,300,150 eligible lower-half rows. Other ranks use the uniform high-half lemma. |
| m>=266 | Uniform analytic proof below; its high-half component is pointwise. |

The finite union is3,172,315 profiles and21,510,525 explicitly checked rows. The last figure mixes all-eligible rows for m<=41 with lower-half rows for42..265; it excludes analytically covered high-half rows. It is not an estimate or a finite sample of the infinite tail.

The producer constructs Q by the exact differential recurrence DQ'=AQ, with D=B2B3B4. The independent replay uses multiplication and constant-one polynomial division. Both evaluate actual first descent, strict deletion flags, alpha, full original-tag multiplicities and complete S. All224 layer summaries agree. The replay's initial version omitted B1=(1,2) and failed selector comparisons; it is excluded. Only the corrected v2 with a complete rerun is evidence. Literal forest-DP controls separately check the polynomial interpretation. No source-to-binary formal certificate is claimed.

## Pointwise high half

For a block z^t G L^u, the forward difference is nonpositive at every j>=t+floor(u/2)+1, including parity boundaries and trailing zeros. Expand GF_r H_i into these blocks. Each has 2t+u<=N-2, so each main mark is nonincreasing at j>=floor(N/2); L^N is also nonincreasing there. The condition2p>N+2 implies j>=floor(N/2). Thus every original-leaf term is nonpositive, regardless of which strict selectors are active.

## Uniform lower-half tail

The following inequalities hold on x<=j<=J=floor(N/2)+3, for m>=266 and N>=2m. If an eligible lower-half p exists, x<=p-2<=floor(N/2)-1, so the needed propagation interval is within this band.

For any local B_r with r>=2, the normalized derivative ratios are (r+1)/r at rank0, r/(r+1) at rank1, and1 afterwards; G has ratio2. The coefficient product rule therefore gives lower derivative bound2/3 and upper bound2. Applied to C=GQ of degree N+1, it implies Delta_j C>=0 when5j<=2N-1. The added zL^(N+1) is strictly increasing there, hence **5x>2N-1** without assuming parent log-concavity or no recovery.

For common h=Q or GH_i, whose degree is between N-3 and N, these derivative bounds give h_(j+1)/h_j<3 and h_(j-1)/h_j<=2 throughout the needed band, including the lower shifts. The factors L,G,B2,B3,B4,F2,F3,F4 are ultra-log-concave of orders1,1,2,4,7,0,1,3 respectively. Convolution adds these orders: the source is Gurvits, *A short, based on the mixed volume, proof of Liggett's theorem on the convolution of ultra-logconcave sequences*, [arXiv:0804.1181](https://arxiv.org/abs/0804.1181), Theorem1.1, whose order may exceed sequence degree. Positive interval support gives ordinary log-concavity and

h_j^2-h_(j-1)h_(j+1)>=h_j^2/(j+1).

All ordered local minors of the pairs (L,G), (B_(r-1),B_r), (F_r,B_r) are nonnegative, with leading minors1,1,3/7/12. Cauchy–Binet transfers these bounds through the common factor. Its (0,1) term is the local leading minor times the displayed central minor; every other term is nonnegative by Toeplitz TP2. This yields mixed margins at least h_j^2/(j+1) for deletions and3h_j^2/(j+1) for marks. The main ordinary-LC margin is also at least h_j^2/(j+1).

Small-factor convolution with the ratio bounds gives parent coefficient at most83h_j; tip-deletion forward and backward coefficients at most17h_j and58h_j; mark coefficients at most14h_j and26h_j. Binomial perturbation ratios are bounded by3,2,2. If epsilon bounds both binomial coefficients choose(N,j) and choose(N,j-1) divided by h_j, the adverse mixed products are at most217epsilon h_j^2 for deletions and208epsilon h_j^2 for marks. The LC errors are at most150epsilon h_j^2 and80epsilon h_j^2. Endpoint errors are smaller; pure perturbation mixed minors are nonnegative. Thus **217(j+1)epsilon<1** suffices for all required perturbed inequalities.

Here is a uniform exact certificate for that scalar. Expand H_i by the subsets of centers choosing their z terms. Retaining the86 disjoint cardinality layers gives

H_i >= sum_(k=1)^86 choose(m-1,k) z^k L^(N-4k-4)

coefficientwise. It also bounds Q and GH_i, since the omitted factors have constant1 and nonnegative coefficients. For s=0,1 the ratio choose(N-4k-4,j-k)/choose(N,j-s) decreases with j on the band; cancellation gives positive consecutive-ratio denominator-minus-numerator

(4k+4)j-(k-s)N+(3k+4+s)(1-s)-(k-s)s.

Put f_N(k)=choose(N-4k-4,J-k)/choose(N,J-1), using the larger central denominator. All supports are positive for N>=532 and k<=86. For n>=3k+7,

f_(2n+1)/f_(2n)=((2n-4k-3)(n-1))/((n-3k-6)(2n+1))>1,

and the ratio f_(2n+2)/f_(2n) is

((2n-4k-2)(2n-4k-3)(n+3)(n-1))/((n+4-k)(n-3k-6)(2n+2)(2n+1)).

Its numerator-minus-denominator, on writing n=t+3, is

(4k^2+36k+80)t^2+(38k^2+348k+670)t+24k^2+672k+1320>0.

Thus f_N(k)>=f_(2m)(k)>=f_532(k). Also choose(m-1,k)/(2m+4) increases with m, since the consecutive-ratio inequality reduces to k(m+3)>=m. At m266,N532, exact integer arithmetic verifies

217*536*choose(532,268) < sum_(k=1)^86 choose(265,k) choose(528-4k,269-k).

The left/right ratio is approximately0.9631870072; sign verification uses integers. Since j+1<=J+1<=2m+4, the strict scalar inequality holds for every m>=266 and2m<=N<=4m. No sampled large-m inference is used.

At the actual parent descent x, each positive deletion/parent mixed minor forces a strict deletion descent. Its perturbed ordinary-LC inequalities propagate it through p, proving every original leaf is selected. Only then distribute the endpoint binomial contribution across private tips, with t=(N+1)/N and M_i=GF_(r_i)H_i+tL^N. The same mixed-minor and LC argument yields Delta_(p-2)M_i<0; sum r_i t=N+1 gives S=sum r_i Delta_(p-2)M_i<0. The parent itself need not be LC. Combining this lower-half tail, the pointwise high half and the complete finite prefix proves the stated weak aggregate theorem.

## Remaining boundary

The exact coefficient main-mark relative margin has a separate Lean certificate. The complete graph aggregate above does not. A census-free all-m replacement, arbitrary arities, deeper rooted trees and the unrestricted conjecture require further arguments. Strict negativity and full selection asserted in lower-half components are not automatically claims about every eligible high-half row.
