# C6-T1 search report: exact cutoff-400 check for the (T_m) family

## Result and scope

I independently checked the cutoff-400 coefficient argument for the specific ordinary-tree family (T_m). The conclusion is an exact, computer-assisted family theorem: for every (m\ge1) and every integer (p\ge0) satisfying

\[
x(T_m)+2\le p,\qquad 3p<2\alpha(T_m)+1,
\]

the complete ordinary favorable-leaf sum is strictly negative, (S(T_m,p)<0). This says nothing about arbitrary ordinary trees or heterogeneous branch families. The finite coefficient base is exact integer computation; it has no Lean/kernel certificate.

## Graph, independence polynomials, and all original tags

Use the pinned graph recipe: a root (r), one arm (r-b-a), and (m) further arms, each consisting of (r) joined to a center with three private leaves. The original leaves are (a) and the (3m) private leaves; their original supports are respectively (b) and the corresponding centers. Put (L=1+z) and (B=1+4z+3z^2+z^3), the independence polynomial of one (K_{1,3}) arm when the root is excluded. Splitting on whether (r) is in the independent set gives

\[
P=I(T_m)=(1+2z)B^m+zL^{3m+1},\qquad \alpha(T_m)=3m+2.
\]

For a leaf (v), let (Z_v=I(T_m-v)), (H_v=T_m-\{v,s_v\}), and (R_v^{\rm graph}=T_m-N[s_v]). Direct root/center splitting gives the two deletion polynomials

\[
Z_a=A_0=L B^m+zL^{3m},
\]
\[
Z_v=A_*=(1+2z)(1+3z+z^2)B^{m-1}+zL^{3m}\quad(v\text{ a private star leaf}).
\]

The tagged difference (q_v=I(H_v)-I(R_v^{\rm graph})) is

\[
q_a=zL^{3m},\qquad q_v=z(2+5z+2z^2)B^{m-1}+zL^{3m}\quad(v\text{ a private star leaf}).
\]

Thus, counting every original leaf separately (there are (3m) private leaves),

\[
\sum_{v\in V_{\rm leaf}(T_m)}q_v=zR,
\quad R=3m(2+5z+2z^2)B^{m-1}+(3m+1)L^{3m}.
\]

These identities use the original supports and closed neighborhoods. In particular, no leaves sharing a support are merged.

## First-descent range without R27

Set (G=1+2z) and (M=GB^m), so (P=M+zL^{3m+1}). Coefficientwise,

\[
B'\ge\tfrac23(3B-zB'),\qquad G'\ge\tfrac23(G-zG').
\]

For (B), the two coefficient vectors are ((4,6,3,0)) and ((2,16/3,2,0)); for (G), they are ((2,0)) and ((2/3,2/3)). The product rule yields

\[
M'\ge\tfrac23((3m+1)M-zM'),
\]
so ((j+1)M_{j+1}\ge\tfrac23(3m+1-j)M_j). For (m\ge2) and (0\le j\le m), the multiplier after division by (j+1) is at least ((4m+2)/(3m+3)>1). The other summand (zL^{3m+1}) is also strictly increasing through these coefficient indices: its successive coefficients are the binomial coefficients — with the (j=0) comparison (0<1). Hence (\Delta_j(T_m)>0) for (0\le j\le m) and (x(T_m)\ge m+1) for (m\ge2). This removes the R27 forest-order import from the crossing-rank bridge for this family.

For the two smaller cases, exact coefficients from the displayed formula are (P_1=(1,7,15,13,6,1)), (x=2), α=5; and (P_2=(1,11,45,91,104,75,34,9,1)), (x=4), α=8. The strict guard gives (p\le3) and (p\le5), respectively, so neither case has an eligible rank.

For (m\ge3), any eligible rank has (p\le2m+1), since (3p<6m+5). Together with (x\ge m+1) and (x+2\le p), this puts (x) and every needed rank between (m) and (2m+2).

## Imported curvature step and exact source bridge

The analytic proof needs Poisson ultra-log-concavity: (jF_j^2\ge(j+1)F_{j-1}F_{j+1}). Each small factor (L,B,G,1+3z+z^2,2+5z+2z^2) has positive interval support and satisfies the strict interior inequalities by direct arithmetic. For (B), the two checks are (16>6) and (18>12); for the two quadratic factors they are (9>2) and (25>8). Linear factors have no interior inequalities.

I used Gurvits, [*A short, based on the mixed volume, proof of Liggett's theorem on the convolution of ultra-logconcave sequences*](https://arxiv.org/abs/0804.1181), Definition (2) and Theorem 1.1: ULC(ℓ) and ULC(δ) sequences convolve to ULC(ℓ+δ), with normalization orders at least their degrees. The application from this finite-order statement to the Poisson normalization is as follows. For each strictly Poisson-ULC finite factor (F), the finite collection of strict inequalities implies (F_j/\binom{d}{j}) is log-concave for every sufficiently large integer (d), because

\[
\frac{\binom d j^2}{\binom d{j-1}\binom d{j+1}}=\frac{(j+1)(d-j+1)}{j(d-j)}\longrightarrow\frac{j+1}{j}.
\]

Choose such orders for all factors, apply Gurvits's theorem repeatedly, then let all chosen orders tend to infinity. The normalized coefficient inequalities are closed under this finite limit; after multiplying by the geometric factors (D^j), the limit is log-concavity of (j!F_j) for the product sequence. This proves the needed Poisson-ULC closure for the products here and checks the theorem's order/degree hypotheses. It is an informal mathematical import, not a Lean axiom or kernel result.

Consequently each main product (a) below is Poisson-ULC and has

\[
a_j^2-a_{j-1}a_{j+1}\ge a_j^2/(j+1).
\]

The same inequality applies to each convolution kernel (H) in the mixed-minor argument. Poisson-ULC also implies ordinary log-concavity.

## Large-(m) central log-concavity at cutoff 400

For each deletion polynomial (Z=a+b), use these main and perturbation parts:

| (Z) | (a) | (b) |
|---|---|---|
| (A_0) | (LB^m) | (zL^{3m}) |
| (A_*) | ((1+2z)(1+3z+z^2)B^{m-1}) | (zL^{3m}) |
| (R) | (3m(2+5z+2z^2)B^{m-1}) | ((3m+1)L^{3m}) |

The factorwise derivative bounds (\frac23(dF-zF')\le F'\le2(dF-zF')) hold coefficientwise for every listed factor (F) of degree (d), by checking the displayed small coefficient vectors. The product rule transfers them to each product. On (m\le j\le2m+2), the resulting adjacent coefficient ratios for (a) are at most 4 in either direction for (m\ge400); the shifted binomial perturbations have adjacent ratios at most 3. Expanding the LC minor of (a+b), bounding its two adverse mixed terms by (24a_jb_j), and discarding the nonnegative pure-(b) term gives

\[
Z_j^2-Z_{j-1}Z_{j+1}\ge a_j^2/(j+1)-24a_jb_j.
\]

For (h=17), the (h)-term of (B^{m-1}=(L^3+z)^{m-1}), compared with either binomial perturbation coefficient, yields uniformly for (m\ge400) and (m\le j\le2m+2)

\[
 b_j/a_j\le E(m)=\frac{17!(3m)^{54}}{(m-17)^{17}(2m-14)^{16}(m-39)^{38}}.
\]

All terms used are positive in this range. To see the worst rank is the endpoint, the successive ratio of the falling-factorial lower bound is

\[
\frac{f(j+1)}{f(j)}=\frac{j-s+1}{j-17+1}\frac{3m-j-37}{3m-j+s}\le1\quad(s=0,1),
\]

because ((17-s)(3m-j+s)\le(37+s)(j-s+1)), first at (j=m) and with right-minus-left increasing in (j). At (j=2m+2), the first-factor minima are (2m-14); the remaining minima are bounded below by (m-39). Also \(\binom{m-1}{17}\ge(m-17)^{17}/17!\), and the denominator falling-factorial factors are at most (3m). These give the displayed (E(m)).

Writing (E(m)=K(m)/m^{17}), the three normalized denominator factors in (K(m)), namely (1-17/m), (2-14/m), and (1-39/m), increase with (m). Thus (K) decreases, and ((2m+3)/m^{17}) decreases. At (m=400), the exact ratios (24(803)E), (47(803)E), (431(803)E), and ((14688/21)(803)E) are all below one; the largest is (0.1412216\ldots<0.142). Therefore all three central LC minors are strictly positive for all (m\ge400).

## Large-(m) central mixed minors

Write (P=V+d). For coefficient sequences (c,g) with (c_rg_s-c_sg_r\ge0) for (r<s), Cauchy–Binet gives a nonnegative convolution minor for (cH,gH); retaining (r=0,s=1) gives at least ((c_0g_1-c_1g_0)H_j^2/(j+1)). The three cases are:

| (Z=a+b) | (H) | (c) | (g), where (V=gH) | (c_0g_1-c_1g_0) |
|---|---|---|---|---:|
| (A_0) | (B^m) | (1+z) | (1+2z) | 1 |
| (A_*) | ((1+2z)B^{m-1}) | (1+3z+z^2) | (B) | 1 |
| (R) | (B^{m-1}) | (3m(2+5z+2z^2)) | ((1+2z)B) | (21m) |

The determinant conditions hold directly from the small coefficient vectors; all pairwise determinants are nonnegative. The pure perturbation minor is nonnegative: for (A_0,A_*) it is the LC minor of (zL^{3m}); for (R) it is the sum of two adjacent ordinary binomial LC minors. Dropping the positive cross terms and using the already checked adjacent-ratio bounds leaves adverse terms at most (47E H_j^2), (431E H_j^2), and (14688mE H_j^2), respectively. The main retained terms are (H_j^2/(j+1)), (H_j^2/(j+1)), and (21mH_j^2/(j+1)). Since the same exact cutoff inequalities just checked imply

\[
47(j+1)E<1,\quad431(j+1)E<1,\quad(14688/21)(j+1)E<1,
\]

all three mixed minors (Z_jP_{j+1}-Z_{j+1}P_j) are strictly positive throughout the central interval.

## Exact finite base and replay

I wrote [cutoff400_audit.py](cutoff400_audit.py), which computes (B^m) from the logarithmic-derivative recurrence (B(B^m)'=mB'B^m), constructs the explicit polynomial formulas above, and checks every central LC and mixed minor for (3\le m\le399) and (m\le j\le2m+2). The script imports no producer arrays. The 242,964 LC checks and 242,964 mixed-minor checks are all strictly positive. The independent hashes and minima are in [EVIDENCE.json](EVIDENCE.json): minimum LC minor (1210) and minimum mixed minor (1243), both at ((m,Z,j)=(3,A_*,8)). Exact cutoff fractions, early (m=1,2,3) coefficient rows, and replay instructions are recorded there and in the script.

Combining the finite base with the analytic (m\ge400) part proves both central facts needed here for every (m\ge3).

## Selector transfer and full aggregate

Fix any eligible (p). The strict guard gives (p\le2m+1); the direct first-descent bound and (x+2\le p) put (x) in the central interval. By definition (P_{x+1}<P_x). The strict mixed minor at (j=x) then gives, for (Z=A_0,A_*), and (R),

\[
Z_{x+1}/Z_x<P_{x+1}/P_x<1.
\]

The central log-concavity of (A_0,A_*) makes their successive coefficient ratios nonincreasing from (x) through (p), so (Z_{p+1}<Z_p). Thus every original leaf is favorable under the original selector (F(T_m,p)), including all (3m) distinct star leaves. The central log-concavity of (R) likewise propagates strict decrease to (R_{p-1}<R_{p-2}), since (p-2\ge x).

For each tag, (q_v(j)=[z^j]I(H_v)-[z^j]I(R_v^{\rm graph})), so the summand in the contract is (q_v(p-1)-q_v(p-2)). Summing the exact original-tag identities above gives

\[
S(T_m,p)=R_{p-1}-R_{p-2}<0.
\]

No pointwise sign is assumed for the tag terms; only the selector is shown to include every original leaf, and the complete tagged sum is evaluated.

## Limitations

- The conclusion is limited to the exact (T_m) family and the displayed strict lower-region eligibility conditions; no arbitrary-tree claim is established.
- The finite base is a reproducible exact-integer computation, not a Lean/kernel certificate.
- Poisson-ULC convolution closure is imported through the finite-order primary theorem with the limiting bridge spelled out above; this informal import has not been formalized.
- This proposed family result does not decide the OPEN arbitrary-tree lower-region aggregate.
