# C6-F3 adversarial review

## Scope and integrity

This review targeted the proposed (m\ge100) exact-ratio tip-surplus tail, its implication for the guarded deletion comparisons, and the endpoint transfer. The packet has no additional allowed source files. The common dispatch manifest names 275 shared members; all 275 actual byte hashes match. Packet SHA-256: `61d1a79c9ffacde84ee1f3086ec34ca8758799ab2719faac6d28b9c8eb3807f7`. Manifest SHA-256: `6d3864e5e843044d38bb9b30ea4927fb135a3076b9744abdb638ce0d201d7a76`. No expected packet hash is embedded in the packet, so its hash is recorded for identification rather than compared with a supplied expected value.

I found no guarded counterexample or failed inequality in the tail argument. Re-deriving the steps supports the candidate as a **restricted informal proof** for (m\ge100), conditional only on the admitted full finite-block coefficient Jensen theorem and the already established ULC, ratio-floor, and main-product LR facts. This is not a formal award. The complete (m=1,\ldots,99) base is missing, so this does not close either all-(m) shifted comparison or the all-(m) surplus claim. It does not prove the selected payment or MASS anew.

The underlying graph is the ordinary tree from path (0-1-2), with (m) distinct centers attached to 0 and (r_i\in\{2,3,4\}) private tips at center (i). Original tags are vertex 2 and every private tip, retaining multiplicity (r_i) on branch (i); supports are not recomputed after deletion. With (q=N+1), (\alpha=N+2), the parent is (P=C+zL^q), and (x=\min\{k\in\mathbb N:\Delta_kP<0\}) uses zero-extended coefficients, includes the terminal difference, and ignores zero/plateau differences. At an actual eligible lower-half rank (p), the exact guards are (x+2\le p), (3p<2\alpha+1), and (2p\le\alpha); (j=p-2), (\delta=q-j). Strict flags are evaluated at this same (p): (e_0=1[\Delta_pA_0<0]), (e_i=1[\Delta_pA_i<0]), with original multiplicity (b=e_0+\sum_i r_ie_i). The surplus theorem reviewed below instead has its own full guard (1\le k), (2k\le N+2) and makes no first-descent assertion.

## Tail proof audit

Use (L=1+z), (G=1+2z=B_1), (B_r=L^r+z), (Q=\prod_iB_{r_i}), (C=GQ), (E=zL^N), and

\[
 U_i=G B_{r_i-1}\prod_{\ell\ne i}B_{r_\ell},\qquad
 h=1+2a_2+4a_3+7a_4.
\]

For the entire guarded band (1\le k\), (2k\le N+2), the target is

\[
 (h+1)U_i[k]C[k]+(k+1)(h-k+1)M_k(E)>0,
 \quad M_k(E)=E[k]C[k]-E[k+1]C[k-1].
\]

The following details address the candidate's exposed failure points.

1. **Low rank and disappearing support.** Expand (Q=\sum_S z^sL^{N-R}), where (s=|S|) and (R=\sum_{i\in S}r_i\le4s). On positive adjacent support, the sign of the cross product comparing ([z^k](z^sL^{N-R})/\binom Nk) with its preceding normalized coefficient is exactly (s(N+1)-kR). Thus it is nonnegative when (4k\le N+1). A newly appearing term at rank (k) contributes nonnegatively. A disappearing positive term at (k-1) would give (N-R=k-1-s) and (s\le k-1); with (R\le4s) this forces (N\le4k-4), contradicting (N\ge4k-1). The empty subset term is constant after normalization. Summing yields (Q[k]/\binom Nk\ge Q[k-1]/\binom N{k-1}), and the same inequality one rank earlier when needed. In (M_k(E)=\binom N{k-1}C[k]-\binom Nk C[k-1]), expansion of (C=Q+2zQ) gives two brackets. The first is nonnegative by that normalized increase; the second is nonnegative by the same increase one rank earlier together with binomial log-concavity (\binom N{k-1}^2\ge\binom Nk\binom N{k-2}). At (k=1), the second bracket uses (Q[-1]=0) and is nonnegative directly. Since (U_i[k]C[k]>0) on this band, the target is strictly positive here.

2. **Complementary-band exponent and arity ordering.** For (m\ge100), (N\ge200). In (4k>N+1), the unmarked size-(r) block contributes

   \[
   g_r(N,k)=\frac{2r}{2r+1}\frac{\binom{N-r}{k-1}}{\binom Nk}
   \]

   to the Jensen exponent. Direct cancellation gives (g_3/g_2=(15/14)(N-k-1)/(N-2)\le1) from (N+13\le15k), and (g_4/g_3=(28/27)(N-k-2)/(N-3)\le1) from (N+25\le28k). Both bounds follow from (4k>N+1) and (N\ge200). Also (g_4(N,k+1)/g_4(N,k)=(k+1)(N-k-3)/(k(N-k))\le1), since (4k\ge N-3). The minimum over the guarded complementary band is therefore at (K=\lfloor(N+2)/2\rfloor).

   For (N=2s), (g_4(N,K)=\frac29\frac{(s+1)(s-2)(s-3)}{s(2s-1)(2s-3)}\ge1/20); after clearing positive denominators this is (4s^2(s-22)+13s+240\ge0) for (s\ge100). For (N=2s+1), it is \(\frac29\frac{(s+1)(s-2)}{(2s+1)(2s-1)}\ge1/20\), equivalent to (4s^2-40s-71\ge0), again for (s\ge100). The root block and marked block contribute nonnegative exponent, including when (r_i-1=1).

3. **Full Jensen application and the size-one block.** The factorization of (U_i) has positive block sizes (1,r_i-1,(r_\ell)_{\ell\ne i}), summing to (N). The coefficient of (B_a=L^a+z) dominates (inom at) at every (t\le a); its only strict excess is (a) at (t=1). The finite-block theorem's actual subset marginal therefore gives precisely (g_a) for that block's exponent contribution. Its hypotheses explicitly allow positive size-one blocks and arbitrary repeated sizes. No independence of block counts or shift in coefficient rank is needed. Since there are (m-1) unmarked blocks, the exponent (y\ge(m-1)/20), so

   \[
   U_i[k]\ge\binom Nk e^y>\binom Nk(m+2).
   \]

   For the strict last inequality, put (a=99/20), (t=(m-100)/20\ge0), and (E_d(x)=\sum_{j=0}^d x^j/j!\). Nonnegative Taylor coefficients give (e^{a+t}\ge E_8(a+t)\ge E_8(a)+tE_7(a)>102+20t=m+2). Exact arithmetic gives (E_8(a)=2162945642595007/16384000000000>102) and (E_7(a)=88220922596671/716800000000>20).

4. **Negative curvature is paid with positive denominators.** The coefficient lists of ((3+2z)F'-2dF) for (G,B_2,B_3,B_4), with (d=\deg F), are respectively ((4)), ((5)), ((6,2,3)), and ((7,6,12,4)), all nonnegative. The product rule gives (C[k]/C[k-1]\ge2(N+2-k)/(3k)>0). Let (e=E[k]=\binom N{k-1}>0), (b=E[k+1]/E[k]=(N+1-k)/k>0). Then

   \[
   \frac{M_k(E)}{eC[k]}=1-b\frac{C[k-1]}{C[k]}
   \ge1-\frac{3(N+1-k)}{2(N+2-k)}>-\frac12,
   \]

   where the final strict bound uses (2k\le N+2). Set (\lambda=(h+1)/((k+1)(h-k+1))\). Since (h\ge N+1), (h-k+1>0), and

   \[
   \lambda>\frac2{N+4},\quad
   \frac{\binom Nk}{e}=\frac{N+1-k}{k}\ge\frac N{N+2},\quad
   \frac{2N(m+2)}{(N+4)(N+2)}\ge\frac12.
   \]

   The last inequality follows from (N\le4m): (4N(m+2)-(N+4)(N+2)\ge2N-8>0). Hence (\lambda U_i[k]/e>1/2), so (\lambda U_i[k]C[k]+M_k(E)>0). Multiplying by the positive ((k+1)(h-k+1)) proves the exact target, not MASS or the stronger occupation payment.

These arguments retain the zero-extended coefficients and the full registered guard. No first-descent hypothesis is used or needed for this surplus statement; it must not be silently inserted as a premise or inferred as a consequence.

## Endpoint and actual-comparison transfer

Put (U_0=LQ). For every represented branch,

\[
 U_0-U_i=H_i(LB_{r_i}-GB_{r_i-1})
 =z^2(L^{r_i-1}-1)H_i\ge0
\]

coefficientwise. Therefore the same exact-ratio surplus holds with (U_0) in place of (U_i): its positive (U[k]C[k]) term only increases.

This coefficient dominance alone does not establish the shifted endpoint comparison. The separate main-product LR is needed and is valid: (L/G) has coefficient ratios ((1,1/2,0)); (B_{r-1}/B_r), zero-extended to the common support, has ratios ((1,2/3,0)), ((1,3/4,1/3,0)), or ((1,4/5,1/2,1/4,0)). Each is nonincreasing. Convolution with the common positive interval-supported log-concave cofactor (Q) or (GH_i) preserves this adjacent LR comparison, including boundaries by cross multiplication. Combining (U[k+1]/C[k+1]\le U[k]/C[k]) with log-concavity of (C) gives the ordinary main-product shifted minor. The known order-(h) ULC curvature of (C) sharpens it to (M_k(U)\ge\lambda U[k]C[k]). Adding the (E)-minor and the audited surplus proves (A_i[k+1]C[k-1]\le A_i[k]C[k]) for every tip, and the analogous (A_0) inequality, throughout this guarded band when (m\ge100).

Thus the tail condition also implies the multiplicity-preserving weighted tip comparison, by summing the tip minors against the same (C[k],C[k-1]) with original weights (r_i>0). It does not establish the registered all-(m) individual or weighted claims because (m<100) remains. At an actual eligible (p), the contract's least strict first descent (x), guards (x+2\le p\), (3p<2\alpha+1\), (2p\le\alpha), and current-(p) strict deletion flags remain separate data; none is replaced by a selector at another rank. This tail comparison is sufficient to force the same strict selectors where the tail covers that (p), but gives no all-(m) primary-payment verdict.

## Adversarial controls and exact replays

I retained the C5 controls at their precise scopes. The (n=91,k=27) E-only negative has positive full tip (777419068009671422357461955841645743808), so it is not a full-comparison witness. The ((a_2,a_3,a_4)=(38,0,1), N=80,k=77) negative lies outside (2k\le N+2). The homogeneous (r=4,m=3,k=7) activity coefficient (-66) accompanies full tip (2076267) and weighted tip (24915204); an activity layer is not the target minor. None contradicts the tail proof or gives a guarded counterexample to the registered all-(m) comparison.

I copied the shared constants-check producer before running it. Replay from the eventual admitted directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-F3/tail_constants_replay.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-F3/f3_boundary_audit.py
```

The first exact check reproduces (E_8(99/20)>102), (E_7(99/20)>20), the minimum sampled (g_4=480053/8820675>1/20) at ((N,k)=(200,101)), 2,291 finite exponent rows, and 47,528 finite low-band center-term checks. Those checks are bounded evidence only. The independent direct-array replay in `f3_boundary_audit.py` checks all guarded ranks for six representative (m=100) profiles (homogeneous arities, two rare-arity mixtures, and a 50/50 arity-2/4 mix); every exact surplus margin is positive. It also records exact singleton-exponent values at selected even/odd lower-boundary and midpoint rows. This is adversarial coverage, not universal evidence; the preceding proof supplies the universal tail argument.

## Dispositions and limits

The registered all-(m) exact-ratio surplus, guarded individual deletion comparison, and guarded weighted tip-deck comparison remain **open at their registered scopes** in this worker return. The restricted tail and endpoint bridge are proposed informal proofs only. There is no universal proof for (m<100), no governed Lean work in this seat, no new primary payment/MASS derivation, and no arbitrary-tree or Erdős 993 implication. All status language here is worker-proposed and nonauthoritative.
