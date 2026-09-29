# C6-CU-F3 independent review

## Scope and integrity

I reviewed the C6-F3 tail and endpoint proposal for the ordinary path-star family: path \(0-1-2\), \(m\ge1\) distinct centers at 0, branch arities \(r_i\in\{2,3,4\}\), and the original tags consisting of vertex 2 and each branch's \(r_i\) private tips. Let \(N=\sum_i r_i\), \(L=1+z\), \(G=1+2z\), \(B_r=L^r+z\), \(Q=\prod_iB_{r_i}\), \(C=GQ\), \(E=zL^N\), \(H_i=\prod_{\ell\ne i}B_{r_\ell}\), \(U_i=GB_{r_i-1}H_i\), and \(U_0=LQ\). Coefficients are in the monomial \(z\) basis and zero-extended.

The parent is \(P=C+zL^{N+1}\); its actual first descent is the least \(x\ge0\) with \(\Delta_xP<0\), including the terminal difference, with zero differences skipped. The primary's actual eligible \(p\) still requires \(x+2\le p\), \(3p<2(N+2)+1\), \(2p\le N+2\), \(j=p-2\), and current-\(p\) strict flags \(e_v=1[\Delta_pA_v<0]\). Original tip multiplicities remain \(r_i\). The surplus and guarded LR claims reviewed here instead use their own \(1\le k,\ 2k\le N+2\) guard and do not assert an actual-descent premise.

All 275 common-dispatch members and all 6 packet-listed source members matched their declared SHA-256 hashes (281 checks total). The packet bytes hash to 52b27f6ca228462aed25da1b03d66b95383d782b141e464c760cb5d6874b9895; the dispatch manifest does not list a self-hash for this packet, so this is an identification digest, not a comparison. I copied both admitted producer scripts into this scratch before running them. Replays used PYTHONDONTWRITEBYTECODE=1; the only outputs are in this scratch.

## Tail proof audit

I found no invalid inequality or hidden sign reversal in the proposed \(m\ge100\) proof. The support checks and constants below make its main transitions explicit.

1. **Low band \(4k\le N+1\).** Expand \(Q=\sum_S z^sL^{N-R}\), where \(s=|S|\), \(R=\sum_{i\in S}r_i\le4s\). On positive adjacent support, comparison of \([z^k](z^sL^{N-R})/\binom Nk\) with its preceding normalized coefficient has sign
   \[
   s(N+1)-kR\ge s(N+1-4k)\ge0.
   \]
   A newly appearing term under zero extension is nonnegative. A disappearing positive term at rank \(k-1\) would force \(N-R=k-1-s\) and \(s\le k-1\), hence \(N\le k-1+3s\le4k-4\), contradicting \(N\ge4k-1\). Thus \(Q[k]/\binom Nk\ge Q[k-1]/\binom N{k-1}\), and the same holds one rank earlier when needed. Since \(C=Q+2zQ\) and \(E[k]=\binom N{k-1}\), binomial log-concavity makes both terms in
   \[
   E[k]C[k]-E[k+1]C[k-1]
   =\binom N{k-1}Q[k]-\binom NkQ[k-1]
    +2\left(\binom N{k-1}Q[k-1]-\binom NkQ[k-2]\right)
   \]
   nonnegative. At \(k=1\), the final term is positive directly from \(Q[-1]=0\). All factors of \(U_i[k]C[k]\) are positive on this band, so the surplus is strictly positive.

2. **Complementary band exponent.** For \(m\ge100\), \(N\ge200\). If \(4k>N+1\), every unmarked \(B_r\) contributes
   \[
   g_r(N,k)=\frac{2r}{2r+1}\frac{\binom{N-r}{k-1}}{\binom Nk}
   \]
   to the Jensen exponent. The exact ratios are \(g_3/g_2=(15/14)(N-k-1)/(N-2)\le1\), equivalent with positive denominators to \(N+13\le15k\), and \(g_4/g_3=(28/27)(N-k-2)/(N-3)\le1\), equivalent to \(N+25\le28k\). Both follow from \(4k>N+1\) and \(N\ge200\). Also \(g_4(k+1)/g_4(k)=(k+1)(N-k-3)/(k(N-k))\le1\) iff \(4k\ge N-3\), which holds here. Therefore the minimum over the band is at \(K=\lfloor(N+2)/2\rfloor\).

   For \(N=2s\), \(K=s+1\), and \(g_4(K)\ge1/20\) is equivalent (all cleared factors are positive) to \(4s^2(s-22)+13s+240\ge0\), valid for \(s\ge100\). For \(N=2s+1\), \(K=s+1\), it is equivalent to \(4s^2-40s-71\ge0\), valid for \(s\ge100\). Exact boundary spot checks give the positive polynomial values 3,121,540 at even \(s=100\), and 35,929 at odd \(s=100\); the factored expressions prove all larger \(s\), not those samples.

3. **Jensen and strict exponential margin.** \(U_i\) is literally a product of positive-size blocks \(B_1,B_{r_i-1},(B_{r_\ell})_{\ell\ne i}\) whose sizes sum to \(N\); this includes \(B_1=G\) when \(r_i=2\). The admitted full finite-block Jensen theorem applies at the same \(k\) and total size \(N\); each block meets the coefficient floor, its Jensen contribution is nonnegative, and each unmarked block contributes at least \(1/20\). Thus \(U_i[k]\ge\binom Nk\exp((m-1)/20)\). For \(a=99/20\), \(t=(m-100)/20\ge0\), Taylor positivity gives
   \[
   e^{a+t}\ge E_8(a+t)\ge E_8(a)+tE_7(a)>102+20t=m+2.
   \]
   The exact rationals are \(E_8(a)=2162945642595007/16384000000000>102\) and \(E_7(a)=88220922596671/716800000000>20\). Hence \(U_i[k]>\binom Nk(m+2)\).

4. **Deficit payment and signs.** The product-rule coefficient operator \((3+2z)F'-2\deg(F)F\) has monomial-\(z\) lists \((4)\) for \(G\), \((5)\) for \(B_2\), \((6,2,3)\) for \(B_3\), and \((7,6,12,4)\) for \(B_4\); I expanded these directly in independent_sign_checks.py. These nonnegative lists imply
   \[
   C[k]/C[k-1]\ge 2(N+2-k)/(3k)>0.
   \]
   With \(e=E[k]=\binom N{k-1}>0\), \(b=E[k+1]/E[k]=(N+1-k)/k>0\), the ratio floor gives
   \[
   M_k(E)/(eC[k])=1-bC[k-1]/C[k]
   \ge1-\frac{3(N+1-k)}{2(N+2-k)}> -1/2.
   \]
   The last strict inequality is equivalent to \(2k<N+3\), which follows from \(2k\le N+2\). For \(\lambda=(h+1)/((k+1)(h-k+1))\), \(h\ge N+1\) makes both denominator factors positive, and \(k>0\) gives \(\lambda>1/(k+1)\ge2/(N+4)>0\). Also \(b\ge N/(N+2)>0\). Since \(N\le4m\),
   \[
   4N(m+2)-(N+4)(N+2)\ge2N-8>0,
   \]
   so \(\lambda U_i[k]/e>2N(m+2)/((N+4)(N+2))\ge1/2\). Therefore \(\lambda U_i[k]C[k]+M_k(E)>0\); multiplying by the positive \((k+1)(h-k+1)\) proves the exact strict surplus. No multiplication by a negative factor occurs. If this argument were divided by a negative quantity, its direction would reverse; it divides only by the positive factors identified above.

5. **Endpoint and deletion implications.** The polynomial identity
   \[
   U_0-U_i=H_i(LB_{r_i}-GB_{r_i-1})
          =z^2(L^{r_i-1}-1)H_i\ge0
   \]
   is coefficientwise, so the positive \(U[k]C[k]\) part of the surplus only increases on replacing \(U_i\) by \(U_0\). This alone is not an LR proof. The separate endpoint main-product ratio \(L/G=(1,1/2,0,\ldots)\) is nonincreasing; for tips the local ratios \(B_{r-1}/B_r\) are respectively \((1,2/3,0,\ldots)\), \((1,3/4,1/3,0,\ldots)\), and \((1,4/5,1/2,1/4,0,\ldots)\). The coefficient ratios are nonincreasing on zero-extended positive supports. Cross multiplication by positive coefficients yields the adjacent LR order, and common convolution by the positive-interval log-concave cofactor preserves it. Combining that LR order with the separate order-\(h\) ULC curvature of \(C\) gives the tip and endpoint shifted comparisons from the surplus. Summing the tip minors against the same \(C\) with weights \(r_i>0\) preserves direction and original multiplicities; no endpoint claim follows from this sum.

These implications remain conditional on the admitted ULC, coefficient-ratio and main-product LR lemmas plus the Jensen theorem. They are informal here. The restricted tail gives no result for \(m<100\), and the endpoint bridge is needed for the all-leaf comparison but not for weighted-tip summation.

For the curvature step explicitly, if \(U[k+1]/C[k+1]\le U[k]/C[k]\), then
\[
U[k]C[k]-U[k+1]C[k-1]\ge {U[k]\over C[k]}\big(C[k]^2-C[k+1]C[k-1]\big)
\ge {h+1\over(k+1)(h-k+1)}U[k]C[k].
\]
The second inequality is the order-\(h\) ULC minor after cross multiplication by positive binomial coefficients; its guard has \(k>0\) and \(h-k+1>0\). Adding \(M_k(E)\) gives exactly the surplus expression divided by the positive curvature factor. This spells out why coefficientwise \(U_0\ge U_i\) alone is not enough: the LR ratio is used to obtain the first inequality.

## Replays and limits

Replay from this scratch:

- PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-CU-F3/tail_constants_replay.py
- PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-CU-F3/f3_boundary_audit.py
- PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-CU-F3/independent_sign_checks.py

The two copied producer scripts reproduce 2,291 bounded exponent rows, 47,528 low-band center-term checks, the exact Taylor constants, and all six stated \(m=100\) profile audits. The independent spot-check script verifies operator coefficients, rational constants, even/odd boundary and interior \(g_r\) values, and denominator inequalities. These calculations corroborate the algebra; none supplies universal coverage. No census of \(m=1,\ldots,99\), Lean build, new primary payment proof, MASS proof, arbitrary-tree conclusion, or Erdős 993 result is claimed. The all-\(m\) registry claims therefore remain unresolved at their registered scope, although the reviewed argument narrows a proposed proof route to the missing finite prefix.
