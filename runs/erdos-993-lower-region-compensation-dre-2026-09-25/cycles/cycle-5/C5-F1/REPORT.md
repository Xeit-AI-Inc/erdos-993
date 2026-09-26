# C5-F1 search report — uniform T_m candidate

## Result

I found no failed inequality in the uniform (T_m) candidate. The central log-concavity and mixed-minor package survives an independent coefficient audit on its finite base, and its stated large-(m) bounds close algebraically. Together with the pinned forest descent bound, this supports the computer-assisted conclusion that the full lower-region aggregate is strictly negative on the specified (T_m) family. It gives no conclusion for arbitrary ordinary trees.

## Family and graph-to-polynomial bridge

Let (T_m) consist of a path (a-b-r) and (m) arms from (r), each arm consisting of a center adjacent to three private leaves. Then (|T_m|=4m+3) and (alpha(T_m)=3m+2). Put (L=1+z), (B=L^3+z=1+4z+3z^2+z^3). Root/arm splitting gives

\[
P=I(T_m)=(1+2z)B^m+zL^{3m+1},
\]
\[
A_0=I(T_m-a)=LB^m+zL^{3m},\qquad
A_*=I(T_m-c)=(1+2z)(1+3z+z^2)B^{m-1}+zL^{3m},
\]
where (c) is any private leaf. Thus the original-leaf selector has only these two orbits, with the private-leaf orbit retained (3m) times. For (q_v(z)=I(T_m-\{v,s_v\})-I(T_m-N[s_v])), direct splitting at the arm and path gives

\[
\sum_{v\text{ leaf}}q_v(z)=zR(z),\qquad
R=3m(2+5z+2z^2)B^{m-1}+(3m+1)L^{3m}.
\]

Consequently the complete selected sum, when both orbit selectors are favorable, is (S(T_m,p)=R_{p-1}-R_{p-2}); the orbit multiplicity is already included in (R).

## Analytical part audited

1. The finite-order ULC inputs are checked directly: (B) is ULC(4), (L) and (1+2z) are ULC(1), and (1+3z+z^2) and (2+5z+2z^2) are ULC(2). The normalized coefficients are nonnegative with interval support. Gurvits, *A short, based on the mixed volume, proof of Liggett's theorem on the convolution of ultra-logconcave sequences*, Theorem 1.1, states that convolution of ULC(ℓ) and ULC(d) sequences is ULC(ℓ+d); its definition is (a_i/\binom{d}{i}) log-concave for (d\ge\deg(a)). This applies factor by factor here. Finite-order ULC implies the Poisson-ULC inequality (a_{j-1}a_{j+1}\le j a_j^2/(j+1)), so each factored main term has ordinary LC margin at least (a_j^2/(j+1)).

2. For each factor (F) of a main term, coefficient comparison gives \((2/3)(dF-zF')\le F'\le2(dF-zF')\), where (d=\deg F). Applying the product rule and comparing coefficients gives
\[
\frac23\frac{D-r}{r+1}\le\frac{a_{r+1}}{a_r}\le2\frac{D-r}{r+1}.
\]
For (m\ge1000) and (m\le j\le2m+2), these bounds give the stated neighbor ratio caps. In the perturbation expansion of (Z_j^2-Z_{j-1}Z_{j+1}), the two adverse cross terms are at most (24a_jb_j), leaving (a_j^2/(j+1)-24a_jb_j).

3. In (B^{m-1}=(L^3+z)^{m-1}), the (h=8) term yields the claimed lower bound on every main coefficient. The resulting ratio (b_j/a_j\le K/m^8), with (K=8!(125/124)^8(150/49)^{27}), makes all three central LC bounds strict; the worst exact rational cutoff is (24(2003)K/1000^8<1).

4. For mixed minors, the convolution Cauchy–Binet expansion is
\[
(cH)_j(gH)_{j+1}-(cH)_{j+1}(gH)_j
=\sum_{r<s}(c_rg_s-c_sg_r)
[H_{j-r}H_{j+1-s}-H_{j-s}H_{j+1-r}].
\]
The displayed factor pairs in the candidate have nonnegative coefficient minors and LC (H), and their (r=0,s=1) terms give positive lower bounds (H_j^2/(j+1)), (H_j^2/(j+1)), and (21mH_j^2/(j+1)). Adding the perturbations costs at most (47\epsilon H_j^2), (431\epsilon H_j^2), and (14688m\epsilon H_j^2), respectively. The exact rational cutoff checks, including the (R) normalization by (21m), are recorded in `EVIDENCE.json`. All bounds decrease beyond (m=1000).

5. For the selector transfer, the registered forest descent bound (n\le4x) gives (x\ge m+1). Eligibility and (\alpha=3m+2) give (p\le2m+1) and (x\le2m-1). Thus the first descent lies within the checked central interval. The mixed minor at (j=x), together with (P_{x+1}<P_x), starts strict descent in each of (A_0,A_*,R). The central LC inequalities propagate it to both deletion ranks (p) and the total rank (p-2). For (m=1,2), direct coefficient checks give (x=2,4), so there are no eligible ranks.

The finite-order convolution source is Gurvits, Theorem 1.1, [arXiv:0804.1181](https://arxiv.org/abs/0804.1181); the original theorem is Liggett, “Ultra Logconcave Sequences and Negative Dependence,” *J. Combin. Theory Ser. A* 79 (1997), 315–325, [doi:10.1006/jcta.1997.2790](https://doi.org/10.1006/jcta.1997.2790). The exact finite-order hypothesis and factor checks above are the application bridge; no infinite-order or unsupported ULC(3) assertion is used.

## Exact finite audit and limits

`CHECK.py` independently reconstructs coefficients using the triangular recurrence from (B(B^m)'=mB'B^m), rather than importing a producer. It checks every (m=3,\ldots,999) and (j=m,\ldots,2m+2) for all three LC margins and all three mixed minors using exact integers. It reproduces 1,507,464 strict checks of each kind and their digests/minima in `EVIDENCE.json`. It also checks 276,938 eligible (T_m) rows for (1\le m\le999), including both original leaf-orbit selectors and the full tagged sum, with zero failures. This is a bounded computation for the finite base, not an exhaustive census of trees.

The large-(m) argument is algebraic subject to the cited ULC convolution theorem and the registered forest descent bound. The finite base and selector replay are not kernel checked. No primary theorem for arbitrary trees follows, and the result does not settle the lower-region aggregate beyond this one tree family.
