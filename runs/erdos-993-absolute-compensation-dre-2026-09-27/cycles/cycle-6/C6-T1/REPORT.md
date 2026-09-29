# C6-T1 independent search: $m\ge100$ tip-surplus tail

## Result and exact scope

I find the proposed C6 $m\ge100$ exact-ratio tip-surplus argument valid after making one omitted binomial-log-concavity comparison explicit in its low-rank curvature step. The result is a census-free informal proof of the **tip surplus only**, at every represented branch (i) and every integer $1\le k\le\lfloor(N+2)/2\rfloor$:

\[
(h+1)U_i[k]C[k]+(k+1)(h-k+1)M_k(E)>0,
\]
where $N=\sum_i r_i$, $h=1+2a_2+4a_3+7a_4$, $C=G\prod_i B_{r_i}$, $E=zL^N$, $U_i=G B_{r_i-1}\prod_{\ell\ne i}B_{r_\ell}$, and $M_k(E)=E[k]C[k]-E[k+1]C[k-1]$. All coefficients are integer coefficients with zero extension. The proof has no actual-first-descent or selector premise. It gives no result outside this family or at the endpoint tag without the separate endpoint bridge.

The main selected payment and selected MASS keep their existing VERIFIED computer-assisted/nonformal grades. This tail proof does not promote either claim, certify the missing $m<100$ surplus base, or provide a Lean award. Its use for actual selected deletions still requires the stated main-product LR and enlarged-order ULC implications. In the registered payment, $x$ remains the least natural rank with $\Delta_xP<0$ under zero extension (including the terminal degree), and $p$ retains $x+2\le p$, $3p<2\alpha+1$, and $2p\le\alpha$. Every selector is the strict current-rank flag $e_0=1[\Delta_pA_0<0]$, $e_i=1[\Delta_pA_i<0]$; the endpoint multiplicity is one and branch $i$ retains all $r_i$ original tips. The positive-ratio guards $C[j]>0$, $0<C[j+1]/C[j]<1$, $\delta=q-j>0$, and $D_j>0$ remain required in divided forms. None is weakened or replaced here.

## Proof

Write $c_t=\binom Nt$, zero outside $0\le t\le N$. Expanding each factor $B_{r_i}=L^{r_i}+z$ by its chosen $z$-term gives
\[
Q=\prod_iB_{r_i}=\sum_{S\subseteq[m]}z^{s}L^{N-R},\qquad s=|S|,\quad R=\sum_{i\in S}r_i\le4s.
\]
For an individual term with positive adjacent support, the sign of its normalized forward cross-product is the sign of
\[
\binom{N-R}{k-s}c_{k-1}-\binom{N-R}{k-1-s}c_k
\quad\text{and, after positive denominator cancellation,}\quad s(N+1)-kR.
\]
Thus it is nonnegative if $4k\le N+1$. The zero-extension cases do not create a negative term: a term newly supported at $k$ contributes nonnegatively, while a positive term disappearing from $k-1$ to $k$ would require $N-R=k-1-s$, hence $N\le3s+k-1\le4k-4$, contradicting $4k\le N+1$. Summing the termwise comparisons gives $Q[k]/c_k\ge Q[k-1]/c_{k-1}$ on this band.

Since $G=1+2z$,
\[
M_k(E)=c_{k-1}Q[k]-c_kQ[k-1]
 +2\big$c_{k-1}Q[k-1]-c_kQ[k-2]\big$.
\]
The first bracket is nonnegative by the normalized rise at $k$. For the second, use the normalized rise at $k-1$, together with binomial log-concavity $c_{k-1}^2\ge c_kc_{k-2}$. Explicitly, writing $Q[t]=c_tR_t$, it is $c_{k-1}^2R_{k-1}-c_kc_{k-2}R_{k-2}\ge0$. At $k=1$, $Q[-1]=0$ handles the boundary directly. Therefore $M_k(E)\ge0$ whenever $4k\le N+1$. Also $U_i[k]C[k]>0$ throughout the guarded band, so the surplus is strictly positive there. This is the omitted comparison in the draft: $R_{k-1}\ge R_{k-2}$ alone does not match the displayed second bracket until binomial log-concavity is applied.

It remains to treat $4k>N+1$. Here $N\ge2m\ge200$, and $k\le\lfloor(N+2)/2\rfloor$. The finite-block Jensen theorem gives the direct coefficient bound needed below. Its exact instance is: the factors $G=B_1$, $B_{r_i-1}$, and the $m-1$ remaining $B_{r_\ell}$ are truncated at their respective degrees $1,r_i-1,r_\ell$; each coefficient is at least the corresponding binomial coefficient, and the positive block sizes sum to $N$. Thus the theorem applies at the same coefficient rank $k$, with no convolution shift. In its exponent, the $t=1$ surplus from a block of size $a$ is
\[
\frac{2a}{2a+1}\frac{\binom{N-a}{k-1}}{\binom Nk}.
\]
All exponent terms are nonnegative, including the root and marked blocks. For an unmarked size-$r$ block denote this term by
\[
g_r(N,k)=\frac{2r}{2r+1}\frac{\binom{N-r}{k-1}}{\binom Nk}.
\]

For $r=2,3,4$,
\[
\frac{g_3}{g_2}=\frac{15}{14}\frac{N-k-1}{N-2},\qquad
\frac{g_4}{g_3}=\frac{28}{27}\frac{N-k-2}{N-3}.
\]
The inequalities $g_2\ge g_3\ge g_4$ reduce respectively to $N+13\le15k$ and $N+25\le28k$, both following from $k>N/4$ and $N\ge200$. Also
\[
\frac{g_4(N,k+1)}{g_4(N,k)}=\frac{(k+1)(N-k-3)}{k(N-k)}\le1
\]
when $4k\ge N-3$, which holds throughout this band. Hence the minimum is at (K=\lfloor(N+2)/2\rfloor\). If $N=2s$, then
\[
g_4(N,K)=\frac29\frac{(s+1)(s-2)(s-3)}{s(2s-1)(2s-3)}\ge\frac1{20},
\]
because the cleared numerator is $4s^2(s-22)+13s+240>0$ for $s\ge100$. If $N=2s+1$, then
\[
g_4(N,K)=\frac29\frac{(s+1)(s-2)}{(2s+1)(2s-1)}\ge\frac1{20},
\]
because the cleared numerator is $4s^2-40s-71>0$ for $s\ge100$. Therefore each of the $m-1$ unmarked blocks contributes at least $1/20$, and the full Jensen theorem gives
\[
U_i[k]\ge\binom Nk\exp((m-1)/20).
\]

For $m\ge100$, put $a=99/20$ and $t=(m-100)/20\ge0$. The nonnegative Taylor polynomial $E_d(x)=\sum_{q=0}^d x^q/q!$ satisfies
\[
\exp((m-1)/20)>E_8(a+t)\ge E_8(a)+tE_7(a)>102+20t=m+2.
\]
The strict rational checks are $E_8(99/20)=2162945642595007/16384000000000>102$ and $E_7(99/20)=88220922596671/716800000000>20$.

For the deficit term, direct coefficient calculation gives nonnegative coefficients for $(3+2z)F'-2dF$ on each $F=B_a$ of degree $d=a$, $a=1,2,3,4$: respectively $(4),(5),(6,2,3),(7,6,12,4)$, omitting trailing zeros. The product rule therefore gives $(3+2z)C'-2(N+1)C\ge0$ coefficientwise. Its coefficient at rank $k-1$ implies
\[
\frac{C[k]}{C[k-1]}\ge\frac{2(N+2-k)}{3k}.
\]
Set $e=E[k]=\binom N{k-1}$, $b=\binom Nk/e=(N+1-k)/k$, and
\[
\lambda=\frac{h+1}{(k+1)(h-k+1)}.
\]
Then
\[
\frac{M_k(E)}{eC[k]}=1-b\frac{C[k-1]}{C[k]}
\ge1-\frac32\frac{N+1-k}{N+2-k}>-\frac12.
\]
Here all denominators are positive. Since $h\ge N+1$ and $k\ge1$, $\lambda>1/(k+1)\ge2/(N+4)$. Since $k\le(N+2)/2$, $b\ge N/(N+2)$. Consequently,
\[
\lambda\frac{U_i[k]}e>
\frac{2N(m+2)}{(N+4)(N+2)}\ge\frac12.
\]
For the last inequality, $N\le4m$ gives $4Nm\ge N^2$; adding $8N$ exceeds the required $6N+8$ since $N\ge200$. Combining the two strict bounds yields
\[
\lambda U_i[k]C[k]+M_k(E)>0.
\]
Multiplication by the positive $(k+1)(h-k+1)$ is exactly the claimed strict integer surplus. This pays the adverse curvature deficit in the entire complementary band.

## Endpoint note, evidence, and limits

The algebraic endpoint identity in the draft checks directly:
\[
U_0-U_i=H_i\big$LB_{r_i}-GB_{r_i-1}\big$
=z^2(L^{r_i-1}-1)H_i\ge0.
\]
It transfers the quantitative surplus to $U_0$ because the coefficient multiplying $U_0[k]$ is positive and $C$ is common. The endpoint full shifted comparison still needs the separate main-product LR argument; coefficientwise dominance alone does not supply it. I did not use this endpoint fact in the tip-tail proof above.

I checked the exact parity boundary formulas, Jensen exponent floor, operator coefficients, Taylor rationals, and the center-subset cross-product on a targeted finite set with [independent_tail_audit.py](cycles/cycle-6/C6-T1/independent_tail_audit.py). It checks 602 boundary rows for $200\le N\le500$, finds the minimum $g_4=480053/8820675$ at $(N,k)=(200,101)$, and checks 4,710 low-rank cross-products. These checks are diagnostics; the universal argument is the algebra above. I also copied and ran the shared arithmetic check from the authorized source: [producer_check_copy.py](cycles/cycle-6/C6-T1/producer_check_copy.py). It reproduces the exact Taylor values and boundary minimum. Replay with `PYTHONDONTWRITEBYTECODE=1 python3 <path>`.

Dispatch integrity: [verify_dispatch.py](cycles/cycle-6/C6-T1/verify_dispatch.py) hashes all 275 members of `manifests/C6-COMMON-DISPATCH.json` and this packet. It reports zero mismatches; packet SHA-256 is `923f786735e31ab013fc2b23faf24965b980d716d049e6fd7000ed951b0eb4cd`, and `allowed_source_files` is empty. The authoritative mathematical inputs used above were the shared exact contract, `sources/predecessor/hybrid-family-proof.md`, `sources/predecessor/main-mark-margin-proof.md`, `sources/cycle6/C6-ULC-SURPLUS-TAIL-DRAFT.md`, and the exact full Jensen statement/proof recorded in the common C4 formal review. No sibling scratch, private transcript, or control proposal was read. No Lean build or source modification was performed.

The remaining limitations are the $m<100$ all-parameter surplus base, formalization of this new tail composition, and the independent endpoint LR bridge if an all-original-leaf comparison is desired. The exact-ratio payment and stronger MASS remain logically distinct from this stronger all-guard surplus condition; the family aggregate, arbitrary trees, and Erdős993 are outside this result.
