# An arbitrary-profile main-mark margin

Evidence grade: formally verified coefficient theorem, with an independently audited informal structural proof. The exact Lean source, pinned package and receipt summary accompany this note. The selected aggregate inequality is outside this certificate.

Let $m\ge1$, $r_i\in\{2,3,4\}$, $N=\sum_i r_i$, and $q=N+1$. Define
\[
L=1+z,\quad G=1+2z,\quad B_r=L^r+z,\quad
F_r=\sum_{h=0}^{r-2}L^h,\quad C=G\prod_i B_{r_i},\quad
T_i=GF_{r_i}\prod_{h\ne i}B_{r_h}.
\]
All coefficients are zero outside their supports. For every $0\le j<q$,
\[
(q-j-1)T_i[j]C[j+1]\ge(q-j)T_i[j+1]C[j].
\]

Put $H=qC-zC'$, so $H[j]=(q-j)C[j]$. The product rule gives
\[
H=\prod_i B_{r_i}+G\sum_l D_{r_l}\prod_{h\ne l}B_{r_h},\qquad
D_r=rL^{r-1}+(r-1)z.
\]
The target is the adjacent likelihood-ratio inequality for $T_i,H$. Comparing $T_i$ with each displayed summand reduces to fifteen local pairs:
\[
(GF_r,B_r),\qquad(F_r,D_r),\qquad(F_rB_s,B_rD_s),
\quad r,s\in\{2,3,4\}.
\]
Each local sequence is positive on its integer interval of support, with denominator degree one greater than numerator degree. Direct finite coefficient arithmetic gives positive adjacent cross minors in every case. Decreasing successive coefficient ratios then give all cross minors $a_u b_v-a_v b_u\ge0$ for $u<v$, including zero-extended endpoints.

For a positive-interval log-concave sequence $h$, the finite convolution identity is
\[
(a*h)_k(b*h)_{k+1}-(a*h)_{k+1}(b*h)_k
=\sum_{u<v}(a_u b_v-a_v b_u)
\bigl(h_{k-u}h_{k+1-v}-h_{k-v}h_{k+1-u}\bigr).
\]
The second factor is nonnegative by decreasing successive ratios of $h$, with boundary zeros treated separately. Thus common convolution preserves the required adjacent minors. Log-concavity and positive interval support are themselves preserved under convolution: apply this identity to a sequence and its right shift, then check positivity on the sum of the support intervals. The factors $G,B_2,B_3,B_4$ and the empty product have these properties.

The three common factors are respectively $\prod_{h\ne i}B_{r_h}$, $G\prod_{h\ne i}B_{r_h}$, and $G\prod_{h\ne i,l}B_{r_h}$. Consequently $T_i$ has the required minor against every summand of $H$. The minor is linear in the second input, so summing proves the theorem for arbitrary $m$. At $j=q-2$ it is strictly positive; at $j=q-1$ it vanishes.

The finite arithmetic concerns only fifteen fixed arity pairs; no bound on the number of branches is used. The parent independence polynomial also contains $zL^{N+1}$, and the selected aggregate contains an additional binomial term with rank-dependent deletion selectors. Those terms are outside this theorem. A quantitative selected-mass bound remains necessary for the proposed structural aggregate route.
