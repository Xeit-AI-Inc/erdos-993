# C6-CU-T1 independent critique: exact-ratio ULC surplus tail

## Disposition and scope

**Proposed retained, narrowed:** the claimed tail for every (m\ge100) is supported by a valid census-free informal proof after the low-rank curvature step is repaired explicitly. The registered all-(m) identity `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS` remains open below (m=100); this review supplies no governed Lean award for the new composition.

For the ordinary path-star with (m\ge100), (r_i\in\{2,3,4\}), (N=\sum r_i), (a_r=\#\{i:r_i=r\}), (h=1+2a_2+4a_3+7a_4), (L=1+z), (G=1+2z), (B_r=L^r+z), (C=G\prod_i B_{r_i}), (E=zL^N), and (U_i=GB_{r_i-1}\prod_{\ell\ne i}B_{r_\ell}), the result is the strict inequality

\[
(h+1)U_i[k]C[k]+(k+1)(h-k+1)\{E[k]C[k]-E[k+1]C[k-1]\}>0
\]

for each represented tip branch (i) and (1\le k\le\lfloor(N+2)/2\rfloor). Coefficients are in powers of (z), zero-extended. There is no first-descent, eligibility, or selector premise in this surplus statement. The existing payment and MASS identities, with their established grades, are not consequences of this tail alone.

## Proof audit

Write (c_t=\binom Nt), zero outside (0\le t\le N), and expand
\[
Q=\prod_iB_{r_i}=\sum_{S\subseteq[m]}z^sL^{N-R},\qquad s=|S|,\quad R=\sum_{i\in S}r_i\le4s.
\]
For a term with both adjacent coefficients positive, its normalized forward cross product has the sign of
\[
\binom{N-R}{k-s}c_{k-1}-\binom{N-R}{k-1-s}c_k,
\]
which, after cancellation by positive binomial factors, is the sign of (s(N+1)-kR). Thus it is nonnegative when (4k\le N+1), since (R\le4s). These cancellations preserve direction because all cancelled factors are positive on this interior support. With zero extension, a newly appearing term is nonnegative. A positive term disappearing at (k) would have (N-R=k-1-s), (s\le k-1), and hence (N=R+k-1-s\le3s+k-1\le4k-4), contradicting (4k\le N+1). Summing gives (Q[k]/c_k\ge Q[k-1]/c_{k-1}).

The low-rank curvature repair is necessary. Since (E[k]=c_{k-1}),
\[
M_k(E)=c_{k-1}Q[k]-c_kQ[k-1]
+2\{c_{k-1}Q[k-1]-c_kQ[k-2]\}.
\]
The first bracket is nonnegative by the preceding normalized rise at (k). For (k\ge2), write (Q[t]=c_tR_t). The second bracket is (c_{k-1}^2R_{k-1}-c_kc_{k-2}R_{k-2}\ge0), using both (R_{k-1}\ge R_{k-2}\ge0) and binomial log-concavity (c_{k-1}^2\ge c_kc_{k-2}\ge0). At (k=1), (Q[-1]=0) gives that bracket directly. The draft’s monotonicity statement alone does not establish this second bracket; this extra binomial-log-concavity comparison repairs it. Also (U_i[k]C[k]>0) on the full guarded band, so the surplus is strictly positive whenever (4k\le N+1).

Now suppose (4k>N+1). Here (N\ge2m\ge200) and (k>N/4). The exact finite-block Jensen theorem applies directly to the truncated factors of (U_i): (G=B_1), the marked (B_{r_i-1}), and the other (m-1) factors (B_{r_\ell}). Their positive block sizes sum to (N); each monomial coefficient in the (z)-basis is at least the corresponding binomial coefficient. The rank remains (k), with no convolution shift. The formal theorem’s actual-subset normalization and all block-size-one cases are covered by its contract; its kernel verification is a separate shared formal result, not formal verification of the current tail composition.

The extra exponent contribution of an unmarked size-(r) factor is
\[
g_r(N,k)=\frac{2r}{2r+1}\frac{\binom{N-r}{k-1}}{\binom Nk}.
\]
The two exact ratios are (g_3/g_2=(15/14)(N-k-1)/(N-2)) and (g_4/g_3=(28/27)(N-k-2)/(N-3)). Their denominators and numerators are positive here; (g_2\ge g_3\ge g_4) reduces to (N+13\le15k) and (N+25\le28k), respectively. Both follow from (k>N/4) and (N\ge200) with positive multipliers. Further,
\[
\frac{g_4(N,k+1)}{g_4(N,k)}=\frac{(k+1)(N-k-3)}{k(N-k)}\le1
\]
because the positive-denominator cross-product difference (right minus left) is (4k+3-N\ge0) on this band. Thus its minimum is at (K=\lfloor(N+2)/2\rfloor). For (N=2s), (K=s+1) and (g_4\ge1/20) is equivalent, after multiplying positive denominators, to (4s^2(s-22)+13s+240\ge0). For (N=2s+1), it is equivalent to (4s^2-40s-71\ge0). Both hold for (s\ge100). The exponent is therefore at least ((m-1)/20), giving
\[
U_i[k]\ge\binom Nk\exp((m-1)/20).
\]
All binomial divisions above use positive denominators in the stated band.

For the strict growth estimate, set (a=99/20) and (t=(m-100)/20\ge0). Exact rational arithmetic gives
\[
E_8(a)=2162945642595007/16384000000000>102,\quad
E_7(a)=88220922596671/716800000000>20.
\]
The nonnegative Taylor coefficients imply (E_8(a+t)\ge E_8(a)+tE_7(a)>102+20t=m+2); since (a+t>0), the omitted exponential terms are strictly positive. Thus \(\exp((m-1)/20)>m+2\).

For the adverse-curvature allowance, direct expansion in **monomial powers of (z)** gives the coefficient arrays of ((3+2z)B_r'-2rB_r): for (r=1,2,3,4), ((4,0),(5,0,0),(6,2,3,0),(7,6,12,4,0)). Trailing zeros may be omitted. This is not a list in powers of (L). The product rule yields ((3+2z)C'-2(N+1)C\ge0) coefficientwise. Its coefficient at (k-1) is (3kC[k]-2(N+2-k)C[k-1]\ge0); both coefficients are positive on this support, so
\[
C[k]/C[k-1]\ge2(N+2-k)/(3k).
\]
Set (e=E[k]=\binom N{k-1}>0), (b=\binom Nk/e=(N+1-k)/k>0), and \(\lambda=(h+1)/((k+1)(h-k+1))>0\). Substitution gives
\[
\frac{M_k(E)}{eC[k]}=1-b\frac{C[k-1]}{C[k]}
\ge1-\frac32\frac{N+1-k}{N+2-k}>-\frac12.
\]
The strict last inequality uses (N+2-k>N+1-k>0). Also (h\ge N+1) and the rank guard makes every denominator positive, so \(\lambda>1/(k+1)\ge2/(N+4)\); the guard also gives (b\ge N/(N+2)). Combining these with the Jensen bound, all factors multiplied are positive, and
\[
\lambda\frac{U_i[k]}e>\frac{2N(m+2)}{(N+4)(N+2)}\ge\frac12.
\]
The last inequality is equivalent after positive-denominator clearing to (4N(m+2)\ge(N+4)(N+2)); (N\le4m) reduces the difference to at least (2N-8>0). Adding the two strict bounds proves \(\lambda U_i[k]/e+M_k(E)/(eC[k])>0\). Multiplying by the positive (eC[k](k+1)(h-k+1)) gives exactly the displayed strict surplus. No negative factor is used to multiply an inequality; whenever a quotient is cleared, its denominator is positive, so direction is preserved.

The formal Jensen theorem’s own contract covers (k\le N), positive block sizes, floors, empty and size-one edge cases, but its separate verification establishes only that abstract theorem. The entire arithmetic and factorization composition above remains an informal universal proof pending any separate governed award.

## Independent replay and limits

I copied the authorized producer arithmetic script into this scratch before running it. The independent script [independent_tail_audit.py](cycles/cycle-6/C6-CU-T1/independent_tail_audit.py) reproduces the exact Taylor values, monomial operator arrays, and 4,710 low-rank cross-product checks; it also tests both parity boundaries over (200\le N\le500), with minimum (g_4=480053/8820675) at ((N,k)=(200,101)). My separate [independent_exact_replay.py](cycles/cycle-6/C6-CU-T1/independent_exact_replay.py) uses explicit monomial arrays and exact integer/rational operations. It checks the exponent inequalities and monotone-ratio direction for (200\le N\le800), then evaluates exact surplus values at boundary/interior ranks for homogeneous arity-2, -3, -4 and two mixed (m=100) profiles; each tested surplus is positive. These are finite diagnostics, not substitutes for the general proof.

Replay commands from the admitted directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_tail_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_exact_replay.py
```

The exact low-rank argument plus the Jensen tail prove the proposed (m\ge100) tip surplus at every guarded rank. The proof does not settle (m<100), endpoint surplus, or any all-original-leaf conclusion. By the already stated main-product LR and enlarged-order ULC implications, the tail can conditionally yield the full shifted comparison for each tip in this range; that is not itself an endpoint or payment proof. At actual eligible payment ranks, the actual first descent remains the least strict Δ-rank of (P), including terminal zero extension; strict selectors remain evaluated at the current (p), and original tip multiplicities remain (r_i). None of those guards is part of or weakened by the selector-free surplus claim. The accepted primary aggregate and the stronger MASS are distinct claims, not evidence for this all-guard surplus.

Dispatch audit: all 275 common-manifest member hashes and all 6 packet-listed hashes matched their actual bytes. Only the neutral shared inputs and packet-authorized C6-T1 case files were read; producer scripts were copied before execution. No Lean build, source edit, installation, messaging, or controller operation was performed.
