# C6-CU-T3 — independent critique of the conditional bridge

## Dispositions and scope

The registered all-profile tip-surplus remains open at its stated scope. The shared m>=100 tail survives my independent algebra review, conditional on the accepted formal full Jensen coefficient theorem. The m<100 universal base is absent at dispatch; I did not replace it with finite samples. Hence this review establishes no all-profile surplus and no unconditional shifted comparison.

The three conditional claims are retained as informal implications. The endpoint conclusion needs both coefficient dominance and a separate endpoint main-product likelihood-ratio bound. The weighted conclusion uses the same C and the original positive multiplicities r_i.

## Conditional bridge audit

Write
\[
M_k(X)=X[k]C[k]-X[k+1]C[k-1],\quad
\lambda_k=\frac{h+1}{(k+1)(h-k+1)}.
\]
On 1<=k, 2k<=N+2, h>=N+1 and N>=2, so k>0, h-k>0, C[k-1], C[k], C[k+1]>0, and every denominator below is positive.

The fixed factors are G=(1,2) at ULC order 1, B2=(1,3,1) at order 2, B3=(1,4,3,1) at order 4, and B4=(1,5,6,4,1) at order 7. These are monomial coefficients in z. Convolution gives order h=1+2a2+4a3+7a4>=N+1 for C. Its ULC inequality, multiplied by positive k(h-k), gives
\[
C[k]-\frac{C[k+1]C[k-1]}{C[k]}\ge\lambda_k C[k].
\]
For U_i, the local ordered minors of (F_(r_i),B_(r_i)) are nonnegative; for U0, those of (L,G) are nonnegative. Their common factors are positive-interval log-concave products. The common-convolution minor identity gives U[k+1]C[k]<=U[k]C[k+1] in each case. Dividing by positive C[k] and multiplying by positive C[k-1] preserves direction. Therefore
\[
M_k(U)\ge U[k]\left(C[k]-\frac{C[k+1]C[k-1]}{C[k]}\right)
\ge\lambda_kU[k]C[k].
\]
The tip premise M_k(E)+lambda_k U_i[k]C[k]>=0 implies M_k(A_i)>=0.

For the endpoint,
\[
LB_r-GB_{r-1}=z^2(L^{r-1}-1),\qquad
U_0-U_i=z^2(L^{r_i-1}-1)H_i\ge0
\]
coefficientwise. Thus U0[k]>=Ui[k], so one represented branch's tip-surplus premise pays the endpoint E minor. The separately checked (L,G) minors give endpoint main-product LR, hence M_k(U0)>=lambda_kU0[k]C[k] and M_k(A0)>=0. Positive lambda_k C[k] is essential when transporting the premise. A fresh scalar control with coefficientwise U<=V has shifted minors 1 and -9, so dominance alone is not LR.

M_k is linear and every original tip has positive weight r_i. Thus summing gives the same-C weighted result without changing multiplicities.

A sharper conditional dependency holds rank by rank: for a fixed guarded k, one represented branch's surplus suffices for the endpoint comparison. Each tip comparison needs that branch's surplus; all branch premises then give the original-r_i weighted deck.

## Tail review for the open surplus

I reviewed the shared m>=100 candidate as an informal all-parameter proof, not a formal award. For 4k<=N+1, each center-subset term z^s L^(N-R) has normalized coefficient a_k/c_k, where a_k=binom(N-R,k-s) and c_k=binom(N,k). On positive adjacent support, the difference a_k/c_k-a_(k-1)/c_(k-1) has sign equal, after cancelling positive factorial factors, to k(N-R-k+s+1)-(k-s)(N-k+1)=s(N+1)-kR. R<=4s makes it nonnegative. A positive term disappearing at the next rank forces N+4<=4k, contradicting 4k<=N+1. Hence Q[k]/c_k>=Q[k-1]/c_(k-1), including zero-extension boundaries. Applying this at k and k-1 and using binomial log-concavity yields M_k(E)>=0. The empty-subset term is constant.

For m>=100, N>=200. In the complementary band k>N/4, g3/g2<=1 and g4/g3<=1 reduce, with positive denominators, to N+13<=15k and N+25<=28k; both follow from 4k>N and N>=200. Also
\[
g_4(k+1)/g_4(k)=\frac{(k+1)(N-k-3)}{k(N-k)}\le1
\]
because 4k>=N-3. Thus the minimum occurs at K=floor((N+2)/2). At N=2s, g4(N,K)>=1/20 reduces to 4s^3-88s^2+13s+240>=0; at N=2s+1, it reduces to 4s^2-40s-71>=0. Both hold for s>=100. All binomial factors and denominators are positive in this band.

The formal Jensen theorem applies directly to U_i's positive-size factors B1, B_(r_i-1), and B_(r_l), whose sizes sum to N; this includes r_i=2, where the marked block is B1=G. Every unmarked factor contributes at least 1/20 to the exponent; root and marked contributions are nonnegative. Thus U_i[k]>=binom(N,k) exp((m-1)/20). Exact Taylor arithmetic gives E8(99/20)=2162945642595007/16384000000000>102 and E7(99/20)=88220922596671/716800000000>20. For t=(m-100)/20>=0, E8(99/20+t)>=E8(99/20)+t E7(99/20)>m+2. Nonnegative omitted Taylor terms justify these inequalities.

For the deficit bound I expanded in the z-monomial basis:
\[
(3+2z)F'-2dF=(4),\ (5),\ (6,2,3),\ (7,6,12,4)
\]
for G,B2,B3,B4. Each listed coefficient is nonnegative. By the product rule, (3+2z)C'-2(N+1)C>=0 coefficientwise; at z^(k-1) this is 3kC[k]-2(N+2-k)C[k-1]>=0. Division by positive 3kC[k-1] gives C[k]/C[k-1]>=2(N+2-k)/(3k), with no sign reversal. Therefore
\[
M_k(E)/(E[k]C[k])\ge1-\frac32\frac{N+1-k}{N+2-k}>-\frac12.
\]
Also lambda_k>1/(k+1)>=2/(N+4), and binom(N,k)/binom(N,k-1)>=N/(N+2). Combining these with Jensen gives lambda_k U_i[k]/E[k]>1/2, since N<=4m, N>=200, and 4N(m+2)-(N+4)(N+2)>=2N-8>0. This pays the entire deficit, proving strict surplus for m>=100 if the cited full Jensen theorem is instantiated as stated. The shared arithmetic checker reports 47,528 low-band term checks and exact Taylor fractions; these are finite corroboration, not the universal proof.

This tail leaves m=1,...,99 uncovered, and no full prefix result is in my authorized inputs. The all-m surplus remains open. I found no counterexample to the registered surplus or conditional bridge.

## Actual descent, guards, and evidence grade

No first-descent premise is inserted into the all-guard surplus or shifted-minor claims. For an eligible p, x+2<=p and 2p<=N+2 give x<=p-2<=(N-2)/2. The binomial summand zL^(N+1) is strictly rising at x, so Delta_x P<0 forces Delta_x C<0. Positive-interval log-concavity makes C[p]/C[p-1]<1. If M_p(A_v)>=0, then
\[
A_v[p+1]C[p-1]\le A_v[p]C[p]<A_v[p]C[p-1],
\]
where A_v[p]>0. Thus deletion descent is strict at this same p, and the current-p selectors are respected. This implication is conditional; it does not establish the comparison premise or license sampled ranks.

My exact spot checks cover profiles [2], [4], [2,3,4], [4,4,4], [2,2,2,2], at k=1, an interior rank, and the upper guard where available. LR, ULC, endpoint-dominance, curvature, and factor-identity signs passed. independent_checks.py emits exact sampled surplus integers. These profiles are bounded evidence only. No unconditional comparison, selected MASS/payment, arbitrary-tree993, or headline Erdős993 conclusion follows.

## Integrity and replay

All 275 actual members of manifests/C6-COMMON-DISPATCH.json and all three packet sources matched their SHA-256 entries. The manifest is under manifests/, not control/. A location-only file search surfaced predecessor filenames in scratchpad; I did not open their contents or inspect any sibling worker case. Producer scripts were copied into this scratch before execution.

Replay:
    PYTHONDONTWRITEBYTECODE=1 python3 bridge_checks_copy.py
    PYTHONDONTWRITEBYTECODE=1 python3 tail_check_copy.py
    PYTHONDONTWRITEBYTECODE=1 python3 independent_checks.py

The first two commands replay copied producer arithmetic; independent_checks.py is my added exact spot-check. No background process remains. No Lean build, source edit, installation, census expansion, or external operation was performed.

