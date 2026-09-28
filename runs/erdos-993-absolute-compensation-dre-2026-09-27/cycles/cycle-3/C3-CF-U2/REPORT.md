# C3-CF-U2 critique report

## Scope and disposition

I reviewed both required claims in the C3-U2 return and the registered adjacent-arity balancing dependency. The occupancy/Jensen coefficient theorem is valid at its stated scope. The balanced finite scalar table independently replays exactly: 799,895 states, zero excluded states, and the same exact minimum ratio as the producer. This is bounded scalar evidence conditional on the analytic coefficient and balancing arguments; it does not establish actual eligible rows, selectors, MASS, or exact-ratio payment.

For clarity, the path-star convention remains: coefficients are zero-extended, Delta_k f=f[k+1]-f[k], and x is the least natural k with Delta_k P<0, including the terminal difference. An actual eligible lower-half p must satisfy x+2<=p, 3p<2alpha+1, and 2p<=alpha. At this actual p the strict flags are e0=1[Delta_p A0<0] and ei=1[Delta_p Ai<0]; b=e0+sum_i r_i ei and A=sum_i r_i ei T_i[j], with each original tip's r_i multiplicity retained. No statement below computes these flags or quantities, or uses the primary factor 1-t+t/delta or an aggregate-sign conclusion.

## Occupancy/Jensen cofactor theorem

For a finite set V partitioned into disjoint blocks V_i of positive sizes s_i, let M=|V|, H(z)=product_i((1+z)^{s_i}+z), and Omega_k={S subseteq V:|S|=k}. Put X_i(S)=1 exactly when |S intersect V_i|=1. Expanding the product over marked block sets I, the sum of the I-term over Omega_k is
[
(product_{i in I}s_i)^{-1}(product_{i in I}s_i) binom(M-sum_{i in I}s_i,k-|I|)
=binom(M-sum_{i in I}s_i,k-|I|).
]
This is exactly the I-term in [z^k]H. The identity follows, including the empty family, with out-of-range binomials zero.

For each i, the singleton-event probability under uniform S in Omega_k is
[
p_i=s_i binom(M-s_i,k-1)/binom(M,k).
]
The positive rational weights w(S)=product_i(1+X_i(S)/s_i) have average H[k]/binom(M,k). Finite AM-GM gives
[
H[k]/binom(M,k) >= product_i(1+1/s_i)^{p_i}.
]
For u>=0, h(u)=log(1+u)-2u/(2+u) has h(0)=0 and h'(u)=u^2/((1+u)(2+u)^2)>=0. Therefore the log of the last product is at least
[
y_k=sum_i [2s_i/(2s_i+1)] binom(M-s_i,k-1)/binom(M,k).
]
Since y_k>=0, e^{y_k}>=E_d(y_k)=sum_{a=0}^d y_k^a/a!, proving the coefficient bound for each natural d. All divisions are in range 0<=k<=M, where binom(M,k)>0.

For the path-star cofactor with M=N-r_i, zero extension preserves the coefficient lower bound outside 0<=k<=M. Convolution with the nonnegative GF_{r_i} coefficients preserves it at every natural j: GF_2=(1,2), GF_3=(2,5,2), GF_4=(3,9,7,2). This proves only the coefficient source statement.

**Repair to a source sentence.** The producer report says that at k=M all singleton probabilities vanish. That is true for the path-star blocks of sizes 2, 3, 4, but false for the registered general theorem's positive-size blocks if some s_i=1. For example, a singleton block has X_i(V)=1. This does not invalidate the identity or Jensen bound: the bound remains valid at k=M, with those nonzero singleton probabilities included.

## Adjacent-arity balancing

For M>=10, M/3<=k<=M-1, let v=3k-M>=0. Direct factorial cancellation gives
[
g_2-2g_3+g_4=
[4k(M-k)/(315M(M-1)(M-2)(M-3))]f,
quad
9f=37(M-10)^2+290(M-10)+217+v(125M-585)+70v^2.
]
Every term in the expression for 9f is nonnegative, and the constant part is positive; hence this second difference is positive. At k=M, each g_r=0, so the inequality also holds. Replacing one size-2 and one size-4 block by two size-3 blocks changes E by -g_2+2g_3-g_4<=0. Repetition leaves a minimizing composition with a2=0 or a4=0. Substituting M=2a2+3a3+4a4 and m'=a2+a3+a4 gives precisely the two adjacent-arity lower bounds in the registered claim. This minimizes only the proposed Jensen exponent, not actual coefficients, a payment, a descent index, or selectors.

As a finite independent algebra check, exact rational arithmetic also checked all 7,614 pairs 10<=M<=150, ceil(M/3)<=k<=M; see the script/data below. That check supports but is not the proof of the all-parameter identity above.

## Independent finite scalar replay

I copied the producer evaluator into this scratch before running it. I also wrote an independent evaluator using direct binomial coefficients and rational comparisons. The independent evaluator uses the displayed adjacent-arity bound, floors each exponent exactly to a multiple of 1/1000, evaluates the positive degree-12 Taylor polynomial as an integer numerator over 1000^12 12!, and uses exact binomial convolution ratios.

The scanned domain is 70<=m<=119, 2m<=N<=4m, r in {2,3,4}, 2(m-1)<=M=N-r<=4(m-1), and integer j with 5j>2N-1 and 2j<=N-2. For these states N>=140 and the strict lower rank guard implies 5j>=2N. For every GF_r shift 0<=s<=r-1, this yields 3(j-s)>=N-r=M: the worst case is r=4,s=3, where it suffices that 3j>=N+5, following from j>=2N/5 and N>=25. Also M>=136>=10. Thus every shift is in the balancing band; no hidden exclusions are needed.

Both evaluators report 799,895 states and zero exclusions. Their minimum comparison ratio is
[
112684538106937462073347997540188623037695726373663717 /
81619490325542400000000000000000000000000000000000000 >1
]
at (m,N,r,j)=(70,278,2,112). The strict comparison is exactly the relaxed scalar comparison T_i[j]>(3/2)delta D_j represented by the protocol's normalized cofactor lower bound. It is not the selected payment: it neither identifies selected centers nor applies original tag multiplicities.

## Transport, integrity, and replay

The actual bytes matched all 86 entries in C3-COMMON-DISPATCH.json, all 3 entries in C3-TRANSPORT-CLARIFICATION.json, all 3 entries in C3-CRITIQUE-TRANSPORT.json, and all 8 packet allowed_source_files digests (100 checks, zero mismatches). The two v4 runner files match the critique transport manifest. Inspection confirms that the CLI runner appends the shared-source clarification to the prompt and verifies the worker dispatch manifest; the queue invokes that runner and the controller's admission checks. The clarification therefore grants access to shared neutral inputs as an addition to the packet's worker-case list, as stated. The packet's additional worker-case list is exactly the eight C3-U2 files checked above.

Replay from this scratch directory:

    PYTHONDONTWRITEBYTECODE=1 python3 manifest_audit.py
    PYTHONDONTWRITEBYTECODE=1 python3 balanced_finite_check.py
    PYTHONDONTWRITEBYTECODE=1 python3 independent_scalar_check.py

## Evidence grades and limitations

- The occupancy/Jensen and adjacent-arity statements above have universal informal arguments; they are not Lean-verified here.
- The finite scalar table is exact bounded computation, independently reproduced, and conditional on its analytic lower-bound composition.
- No computation here evaluates the actual graph deletions, least strict first descent, current-p flags, original multiplicity-weighted selected A,b, or the exact-ratio margin. No all-m MASS/payment conclusion follows.
