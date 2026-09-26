# C6-T2 search: heterogeneous arity-2–4 cutoff

## Result

I audited the proposed path-with-private-stars theorem for every branch profile (r_i\in\{2,3,4\}), (m\ge 2000), with the original strict selector and lower-region guard. The coefficient proof closes at this restricted scope and gives the stronger conclusion (S(T,p)<0). I found no mathematical defect in the cutoff replacement. This does not cover (m<2000), other arities, arbitrary trees, or the primary universal claim.

The exact cutoff calculation is independently replayed by `cutoff2000_audit.py`; `cutoff2000_audit.json` records the rational output. The common packet's 237 listed source pins matched. I read the required contract, protocol, policy, handoff, reconciliation, source map, and allocation, then the source-map-pinned heterogeneous candidates and preparation audits relevant to this route. I independently checked the graph identities and the cutoff derivation below; the preparation audits are corroboration, not the basis of this disposition.

## Graph and tag formulas

Let the graph consist of path (0-1-2) and (m) branches at 0, branch (i) having a center and (r_i\in\{2,3,4\}) private leaves. Put (N=\sum_i r_i), (L=1+z), (B_r=L^r+z), (Q=\prod_i B_{r_i}), and (H_i=\prod_{h\ne i}B_{r_h}). The original leaves are endpoint 2 and all (N) private tips, each with its own tag. Root exclusion/inclusion gives

\[
P=(1+2z)Q+zL^{N+1},\quad
A_0=LQ+zL^N,\quad
A_i=(1+2z)B_{r_i-1}H_i+zL^N.
\]

Here (A_0) is the endpoint deletion polynomial and (A_i) is the deletion polynomial for each tip on branch (i). The maximum independent set has size (N+2): without 0 the path contributes at most one vertex and branches at most (N); with 0, the endpoint and all private tips attain (N+2). Thus (\alpha=N+2).

For endpoint 2, the marked difference polynomial is (q_2=zL^N). For a private tip (v) on branch (i), direct deletion of its support center gives

\[
q_v(z)=z\big((1+2z)F_{r_i}H_i+L^N\big),\qquad
F_r=(L^{r-1}-1)/z.
\]

The closed-neighborhood deletion leaves path (1-2) and all other branches, with polynomial ((1+2z)H_i); subtracting this from the support deletion proves the display. Summing the distinct tip tags and the endpoint tag gives

\[
\sum_{v\text{ original leaf}}q_v=zR,\quad
R=(N+1)L^N+(1+2z)\sum_i r_iF_{r_i}H_i=\sum_i r_i Z_i,
\]
\[
Z_i=(1+2z)F_{r_i}H_i+\frac{N+1}{N}L^N.
\]
The fractional coefficient distributes the single endpoint tag in the total polynomial; it does not merge or alter any leaf tag. If every (A_0,A_i) is strictly descending at rank (p), every original leaf is in the fixed selector. If each (Z_i) is strictly descending at rank (p-1), the complete selected sum is

\[
S(T,p)=R_{p-1}-R_{p-2}
=\sum_i r_i\big((Z_i)_{p-1}-(Z_i)_{p-2}\big)<0.
\]

## Central coefficient estimates

I use the primary convolution theorem in Gurvits, *A short, based on the mixed volume, proof of Liggett's theorem on the convolution of ultra-logconcave sequences*, Theorem 1.1 ([arXiv:0804.1181](https://arxiv.org/abs/0804.1181)). It states that convolution of ULC(ℓ) and ULC(δ) sequences is ULC(ℓ+δ). The paper defines ULC order (d) for sequence degree at most (d), so the higher orders used for (B_3,B_4) are within its stated hypotheses. The individual normalized sequences are

- (B_2=(1,3,1)), ULC order 2;
- (B_3=(1,4,3,1)), ULC order 4;
- (B_4=(1,5,6,4,1)), ULC order 7, with normalized sequence ((1,5/7,2/7,4/35,1/35));
- (F_2=(1)), (F_3=(2,1)), (F_4=(3,3,1)), of ULC orders 0, 1, 3 respectively;
- (L) and (1+2z), ULC order 1.

These finite checks establish the factors' ULC hypotheses; convolution establishes them for each factored main term and common factor. At an interior coefficient (j), ULC order (d\ge j) implies
\[
a_{j-1}a_{j+1}\le\frac{j(d-j)}{(j+1)(d-j+1)}a_j^2\le\frac{j}{j+1}a_j^2,
\]
so the ordinary log-concavity margin is at least (a_j^2/(j+1)).

For each factor (B_r,L,1+2z,F_r) above, coefficient comparison gives
\[
\tfrac13(d f-zf')\le f'\le2(d f-zf'),\qquad d=\deg f.
\]
For example (F_3=2+z) satisfies the weaker (1/3) lower constant; no (2/3) bound is used. Products inherit the inequalities. Thus for a product coefficient sequence (a) of degree (D),
\[
\frac{1}{3}\frac{D-j}{j+1}\le\frac{a_{j+1}}{a_j}
\le2\frac{D-j}{j+1}.
\]
All main/common factors used in the minors have degree (D\in[N-3,N+1]). On the integer interval (N/4\le j\le2N/3+3), with (N\ge2m\ge4000), these inequalities bound both adjacent main/common coefficient ratios, including up to four left shifts, by 8. The adjacent ratios of (L^N,zL^N) on this interval are at most 4.

For every (H_i), choose the (z) term from 29 of the other (m-1) factors. Since each omitted branch has arity at most 4,
\[
H_i\ge_{\rm coeff}\binom{m-1}{29}z^{29}L^{N-120}.
\]
For (s=0,1), the ratio of the rank-(j) coefficient on the right (without the binomial prefactor) to \(\binom Nj\) for (s=0), or \(\binom N{j-1}\) for (s=1), is
\[
f_s(j)=\frac{(j-s)_{29-s}(N-j+s)_{91+s}}{(N)_{120}}.
\]
Its consecutive ratio is
\[
\frac{f_s(j+1)}{f_s(j)}=
\frac{j-s+1}{j-28}\,\frac{N-j-91}{N-j+s}.
\]
After cross multiplication, this is at most 1 when
\[
120j-(29-s)N+(91+s)(1-s)-(29-s)s\ge0.
\]
At (j\ge N/4), the left side is at least (N+91) for (s=0), and (2N-28) for (s=1). So the minimum in the central interval is attained at (J=\lfloor2N/3+3\rfloor). At (J), each first falling-factor entry is at least (AN), each second entry at least (BN), where
\[
A(m)=\frac23-\frac{29}{2m},\qquad
B(m)=\frac13-\frac{95}{2m}.
\]
The (s=0) product has one extra (A) in place of a (B); since (A>B>0), both shifts are bounded below by (A^{28}B^{92}). With \(\binom{m-1}{29}\ge(m-29)^{29}/29!\), both perturbations satisfy
\[
\frac{(L^N)_j}{(H_i)_j},\quad
\frac{(zL^N)_j}{(H_i)_j}
\le\epsilon(m):=\frac{29!}{(m-29)^{29}A(m)^{28}B(m)^{92}}.
\]
The main term of each deletion and marked polynomial coefficientwise dominates the relevant (H_i) (or (Q\ge H_i)); the perturbation is at most twice the corresponding binomial coefficient. The LC cross terms are therefore at most (64a_jb_j\le128\epsilon a_j^2). It suffices for strict central LC that (128(j+1)\epsilon<1).

For the mixed minors with (P), write each main part as (cH) against (gH). The common (H) is (Q) for (A_0), and ((1+2z)H_i) for (A_i,Z_i). The coefficient ratios (c_k/g_k) are nonincreasing for the finite possibilities (L/(1+2z)), (B_{r-1}/B_r), and (F_r/B_r), for (r=2,3,4). Their (0,1) minors (c_0g_1-c_1g_0) are respectively 1 (deletions) and 3, 7, 12 (marked factors). The convolution-minor expansion has nonnegative summands, with its (0,1) summand at least (H_j^2/(j+1)), or three times that for marked factors. The pure perturbation minor is nonnegative: for deletion terms its coefficient ratio is increasing as (d/b=(zL^{N+1})/(zL^N)); for marked terms it is increasing as (d/b=(zL^{N+1})/(tL^N)), (t=(N+1)/N>0).

The only adverse mixed products are bounded from the ratio caps and the finite small-factor coefficients. Explicitly, the coefficient envelope for (g=B_r) gives (V_j\le(1+5\cdot8+6\cdot8^2+4\cdot8^3+8^4)H_j=6569H_j); for endpoint (g=1+2z) this same envelope is valid. For deletion (c=B_{r-1}), the coefficient envelope ((1,4,3,1)) and at most two left shifts give (a_{j+1}\le(8+4+24+64)H_j=100H_j). For marked (c=F_r), the envelope ((3,3,1)) gives (a_{j+1}\le(24+3+8)H_j=35H_j). The binomial coefficient ratios on the stated central interval give (d_j\le5b_j) for deletion and (d_j\le20b_j) for marked terms, while (b_{j+1}\le4b_j) and (b_{j+1}\le8b_j), respectively. For deletions the envelopes are (a_{j+1}\le100H_j), (V_j\le6569H_j), (d_j\le5b_j), (b_{j+1}\le4b_j), giving constant (100\cdot5+6569\cdot4=26776). For marked factors the corresponding constants are (35,6569,20,8), giving (53252/3<26776) after division by the main-minor factor of at least 3. Hence both the LC and mixed-minor conditions follow from
\[
26776(j+1)\epsilon(m)<1.
\]
As (j+1\le2N/3+4\le3m), it suffices that (80328m\epsilon(m)<1). Exact arithmetic gives (A(2000)=7913/12000), (B(2000)=743/2400), and the exact rational value of (80328\cdot2000\cdot\epsilon(2000)) recorded in `cutoff2000_audit.json` is strictly below 1 (approximately (0.0000329996464)). For real (m\ge2000), (m/(m-29)^{29}) decreases and (A(m),B(m)) increase positively, so the sufficient ratio decreases. The exact replay is in the evidence JSON.

## Selector bridge and scope

The first-descent bound can be proved directly for this family, avoiding any unreviewed tree-order import. Each (B_r) and (1+2z) satisfies the stronger derivative inequality (f'\ge\tfrac12(df-zf')); it follows by comparing coefficients of (B_r=(1+z)^r+z). Products preserve it, so for (M=(1+2z)Q), degree (N+1),
\[
\frac{M_{j+1}}{M_j}\ge\frac{N+1-j}{2(j+1)}>1\quad(0\le j\le N/4,\ N>4).
\]
Also (zL^{N+1}) is strictly increasing at those ranks. Hence (P_{j+1}>P_j) there and (x(T)>N/4).

The strict guard (3p<2\alpha+1=2N+5) implies (p\le\lfloor(2N+4)/3\rfloor). Eligibility gives (x\le p-2). Thus (x) and every rank from (x) through (p) (and (p-1) for (Z_i)) lie in the central interval above. At (x), (P_{x+1}<P_x) by definition of first descent. Positive mixed minors imply (A_{x+1}/A_x\le P_{x+1}/P_x<1), separately for (A_0,A_i,Z_i). Their strict central log-concavity makes successive coefficient ratios decrease, so (A_0,A_i) descend at (p) and (Z_i) at (p-1). The selector is exactly the original selector (\Delta_p(T-v)<0); every original leaf is included with its own tag. The global sum formula above then yields (S<0).

The graph and algebra prove only the stated path-with-private-stars family for (m\ge2000), all profiles in {2,3,4}, and eligible lower-region ranks. They do not fill the finite prefix, imply a result for unrestricted trees, or resolve the registered primary claim. The exact (m\ge2000) theorem remains suitable for controller review as a restricted family result; this worker proposes no authoritative registration or award.
