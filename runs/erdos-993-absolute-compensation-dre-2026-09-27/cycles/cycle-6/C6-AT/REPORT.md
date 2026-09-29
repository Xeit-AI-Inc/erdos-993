# C6-AT neutral adjudication

## Scope and evidence

I inspected exactly the assigned C6-T1/T2/T3 routes and their six C6-CF/CU critics. All 275 actual shared-member bytes and all 166 packet-listed case bytes match their SHA-256 manifests; see `cycles/cycle-6/C6-AT/C6-AT-integrity.json`. The registered all-guard surplus is OPEN at dispatch. The C4 finite-block Jensen theorem has a governed Lean verification and fidelity receipt for **that abstract theorem**. No C6 tail, finite prefix, bridge, or global surplus Lean award is supplied here. The selected exact-ratio payment and MASS have separate existing computer-assisted grades; neither is proof of the stronger surplus.

Put (L=1+z, G=1+2z, B_r=L^r+z, Q=\prod_iB_{r_i}, C=GQ, E=zL^N, U_i=GB_{r_i-1}H_i, U_0=LQ, A_v=U_v+E), where (m\ge1, r_i\in\{2,3,4\}, N=\sum_i r_i), (H_i=\prod_{u\ne i}B_{r_u}), (a_r=\#\{i:r_i=r\}), and (h=1+2a_2+4a_3+7a_4\ge N+1). All coefficients are monomial coefficients in (z), integer and zero-extended. For (1\le k, 2k\le N+2), write (M_k(X)=X[k]C[k]-X[k+1]C[k-1]) and

\[
 S_i(k)=(h+1)U_i[k]C[k]+(k+1)(h-k+1)M_k(E).
\]

The required five identities receive these proposed dispositions:

| Claim ID | Disposition | Exact grade and dependency |
|---|---|---|
| `C6-T1-M100-ULC-EXACT-RATIO-TIP-SURPLUS` | retained | Strict (S_i(k)>0) for every (m\ge100), represented tip and guarded rank; informal universal proof using the already formal finite-block Jensen theorem. |
| `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS` | retained narrowed | Same strict (m\ge100) subcase plus one complete exact bounded (m=1..99) instrument. The registered all-(m) predicate is not certified by this case: the prefix protocol requires two independently authored complete implementations. |
| `C6-T3-CONDITIONAL-ALL-LEAF-SHIFTED-C-COMPARISON` | retained with proof repair | Valid conditional implication at every guarded rank after replacing an invalid displayed tip LR local pair. Needs (S_i(k)\ge0) for all represented tips at that rank, enlarged-order ULC, and **the correct** tip and endpoint main-product LR facts. |
| `C6-T3-CONDITIONAL-SAME-C-WEIGHTED-TIP-DECK` | retained with proof repair | Valid conditional implication by the repaired individual tip comparison and a positive sum against the same (C), with original (r_i) multiplicities. |
| `C6-CU-T3-LOCALIZED-CONDITIONAL-BRIDGE` | retained with proof repair | At one guarded rank, a single represented tip's surplus suffices for the endpoint comparison once the separate endpoint LR is supplied. The critic's displayed (F_r) tip LR step is rejected and repaired below. Each other tip still needs its own surplus to obtain all-tip or weighted conclusions. |

## Tail proof audit

Write (c_t=\binom Nt). In (Q=\sum_{S\subseteq[m]}z^sL^{N-R}), (s=|S|), (R=\sum_{i\in S}r_i\le4s). For adjacent positive support, the sign of the normalized coefficient increase from (k-1) to (k) is the sign of (s(N+1)-kR). The cancellation uses only positive binomial denominators. Thus it is nonnegative when (4k\le N+1). A newly appearing term is nonnegative. A term disappearing at (k) would force (N-R=k-1-s) and (s\le k-1), hence (N\le4k-4), contradicting (N\ge4k-1). Consequently (R_k=Q[k]/c_k\ge R_{k-1}). At (k\ge2) the same holds one rank earlier. Crucially, the second bracket in

\[
 M_k(E)=c_{k-1}Q[k]-c_kQ[k-1]+2\{c_{k-1}Q[k-1]-c_kQ[k-2]\}
\]

needs **both** (R_{k-1}\ge R_{k-2}\ge0) and (c_{k-1}^2\ge c_kc_{k-2}). For (k=1), (Q[-1]=0). Therefore (M_k(E)\ge0) throughout (4k\le N+1); positive (U_i[k]C[k]) makes (S_i(k)>0). The C6-CF-T2 and C6-CU-T2 displayed transitions from normalized rise directly to this second bracket omit binomial log-concavity. Those arguments **as displayed** do not prove the bracket; this explicit comparison repairs their conclusions. C6-T1, C6-CF-T1 and C6-CU-T1 state the needed step.

For (m\ge100) and (4k>N+1), (N\ge200) and (k>N/4). The formal Jensen theorem applies at the **same** rank (k\le N) to the literal factors (G=B_1, B_{r_i-1}), and the (m-1) unmarked (B_{r_u}); their positive sizes sum to (N), including marked size one. Each monomial coefficient satisfies the binomial floor. An unmarked size-(r) block contributes

\[
g_r={2r\over2r+1}{\binom{N-r}{k-1}\over\binom Nk}.
\]

The positive ratios (g_3/g_2=(15/14)(N-k-1)/(N-2)\le1) and (g_4/g_3=(28/27)(N-k-2)/(N-3)\le1) reduce to (N+13\le15k) and (N+25\le28k). Both follow from this band and (N\ge200). Also (g_4(k+1)/g_4(k)=(k+1)(N-k-3)/(k(N-k))\le1), since the right-minus-left cross product is (4k+3-N\ge0). Hence the minimum is at (K=\lfloor(N+2)/2\rfloor). For (N=2s), (g_4(N,K)\ge1/20) clears through positive denominators to (4s^2(s-22)+13s+240\ge0); for (N=2s+1), to (4s^2-40s-71\ge0). Both hold for (s\ge100). Root and marked contributions are nonnegative, so (U_i[k]\ge\binom Nk\exp((m-1)/20)). With (a=99/20, t=(m-100)/20\ge0), exact rationals give (E_8(a)>102, E_7(a)>20), whence (\exp(a+t)>E_8(a+t)\ge E_8(a)+tE_7(a)>m+2).

In the (z) basis, the coefficients of ((3+2z)B_r'-2rB_r), including (G=B_1), are respectively ((4),(5),(6,2,3),(7,6,12,4)), with zero trailing terms. These are **not** coefficient lists in powers of (L). The product rule yields (3kC[k]-2(N+2-k)C[k-1]\ge0). Dividing by (3kC[k-1]>0) gives (C[k]/C[k-1]\ge2(N+2-k)/(3k)>0). Thus inversion reverses the ratio ordering and multiplication by (-b<0), (b=\binom Nk/\binom N{k-1}), reverses it again:

\[
{M_k(E)\over E[k]C[k]}=1-b{C[k-1]\over C[k]}
\ge1-{3\over2}{N+1-k\over N+2-k}>-\tfrac12.
\]

Every denominator is positive on the guard. For (\lambda=(h+1)/((k+1)(h-k+1))), (\lambda>1/(k+1)\ge2/(N+4)) and (b\ge N/(N+2)). Multiplying these **positive** lower bounds and the Jensen bound preserves order. Since (N\le4m),

\[
{\lambda U_i[k]\over E[k]}>{2N(m+2)\over(N+4)(N+2)}\ge\tfrac12,
\qquad 4N(m+2)-(N+4)(N+2)\ge2N-8>0.
\]

Adding the two half-bounds gives (\lambda U_i[k]C[k]+M_k(E)>0). Multiplying by ((k+1)(h-k+1)>0) preserves order and proves the strict integer surplus. `cycles/cycle-6/C6-AT/C6-AT-audit.py` independently checks parity boundary and interior values, exact Taylor fractions and expanded operator coefficients; the algebra above, not those samples, is the universal argument.

## Finite base and bridge

C6-T2's frozen monomial-array instrument computes all 171,699 count profiles and 56,245,000 represented-tip/guarded-rank rows for (1\le m\le99), with no first-descent or eligibility filter, no negative surplus and reported global minimum (98) at ((a_2,a_3,a_4)=(1,0,0),r=2,k=1). I checked its literal (B_1=(1,2)), exact constant-one cofactor reconstruction, all 99 stored per-(m) checkpoint rows against its aggregate, and independently enumerated the profile/rank counts. I recomputed selected direct products, including the minimum: (U[1]=4,C[1]=5,C[0]=1,E[1]=1,E[2]=2,S=98), full tip minor (19). This validates bounded evidence and transport consistency, **not** all 56,245,000 signs independently. A second full, independently authored implementation is absent from this assigned case. The registered all-(m) surplus therefore remains unresolved by this adjudication. The (n=91,(0,22,0),k=27) isolated-(E) minor is negative while the full tip minor is positive; the (n=122,(38,0,1),k=77) negative full minor is outside (k\le41). These controls are not guarded counterexamples. The homogeneous (r=4,m=3,k=7) negative activity coefficient is likewise not a negative full minor.

For the conditional bridge, the source route's purported tip local pair ((F_r,B_r)) is **wrong for its own (U_i)**. Its script checks that irrelevant pair. C6-CU-T3 repeats the same invalid displayed step. I reject those displayed tip-LR arguments. The correct pair is ((B_{r-1},B_r)), whose complete ordered minors, in increasing ((u,v)), are (r=2:(1,1,2)), (r=3:(1,2,1,5,3,1)), (r=4:(1,3,3,1,9,11,4,6,3,1)), all positive. The endpoint pair ((L,G)) has minor (1). Convolution by the common positive-interval log-concave factor (GH_i) or (Q) preserves this LR order via the Toeplitz TP2/Cauchy–Binet identity. The fixed factors have ULC orders (1,2,4,7), giving (C) order (h), and hence

\[
C[k]-{C[k+1]C[k-1]\over C[k]}\ge\lambda C[k].
\]

Here (C[k-1],C[k],C[k+1]>0, h-k>0). Correct LR gives (M_k(U_v)\ge\lambda U_v[k]C[k]) for each tip and the endpoint. A branch surplus (S_i(k)\ge0) is exactly (M_k(E)+\lambda U_i[k]C[k]\ge0), so (M_k(A_i)\ge0). Also

\[
U_0-U_i=z^2(L^{r_i-1}-1)H_i\ge0
\]

coefficientwise, including (r_i=2) where the factor is (z^3). Because (\lambda C[k]>0), one tip premise transfers the **quantitative** endpoint surplus; the separate endpoint LR then gives (M_k(A_0)\ge0). Coefficient dominance alone would not establish LR. Finally (M_k(\sum_i r_iA_i)=\sum_i r_iM_k(A_i)\ge0) when all tips have their premises, with every original (r_i) retained. This repairs the conditional all-leaf and weighted claims at exactly the common-(C) guarded scope.

For any later actual-rank use, (x) remains the least strict zero-extended forward descent of (P=C+zL^{N+1}), including terminal degree. A current (p) must satisfy **all** (x+2\le p, 3p<2(N+2)+1, 2p\le N+2). Since (x\le p-2\le(N-2)/2), the binomial parent summand rises at (x); hence (\Delta_xC<0). Positive-interval log-concavity gives (C[p]/C[p-1]<1). A repaired shifted comparison at (k=p) then gives strict (\Delta_pA_v<0) using positive (A_v[p]). The selectors remain (e_0=1[\Delta_pA_0<0]), (e_i=1[\Delta_pA_i<0]) at this very (p), with (b=e_0+\sum_i r_ie_i), (A=\sum_i r_ie_iT_i[p-2]), (T_i=GF_{r_i}H_i), (F_r=\sum_{s=0}^{r-2}L^s). Put (j=p-2), (\delta=N+1-j), and (D_j=\binom N{j+1}-\binom Nj). The separate exact primary payment is ((\delta C[j]-(\delta-1)C[j+1])A\ge b\delta D_jC[j]); its divided form still requires (C[j]>0, 0<C[j+1]/C[j]<1, \delta>0, D_j>0). No aggregate sign is used to infer a branchwise comparison.

## Route and critic accounting; replay

T1 and CF-T1/CU-T1 retain the strict informal tail. CF-T2/CU-T2 retain its conclusion after the stated low-band bracket repair; their review of T2 supplies spot checks, not a second full implementation. T2 is retained at exact bounded grade. T3's conditional result is retained with the local-pair repair identified by CF-T3. CU-T3's localized rankwise consequence is retained with that same repair, while its (F_r) proof step is rejected. None of the nine cases proves the registered all-(m) surplus formally or gives an in-guard counterexample.

From the run root, replay only my independent arithmetic and coverage audit with `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-AT/C6-AT-audit.py`; it writes `cycles/cycle-6/C6-AT/C6-AT-audit.json`. This is a small targeted replay, not the 56-million-row producer computation. No producer script was executed, no source changed, no Lean build or controller operation was performed, and no background process remains.
