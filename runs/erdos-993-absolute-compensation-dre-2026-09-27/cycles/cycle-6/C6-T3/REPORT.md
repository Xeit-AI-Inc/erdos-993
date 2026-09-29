# C6-T3 — conditional tip-surplus to endpoint bridge

## Result and scope

Let a nonempty ordinary path-star profile have m\ge1, r_i\in\{2,3,4\}, N=\sum_i r_i, a_r=\#\{i:r_i=r\}, (h=1+2a_2+4a_3+7a_4), (L=1+z), (G=1+2z), (B_r=L^r+z), Q=\prod_i B_{r_i}, H_i=\prod_{u\ne i}B_{r_u}, F_r=\sum_{s=0}^{r-2}L^s, (C=GQ), and (E=zL^N). Write

\[
 U_0=LQ,\qquad U_i=G B_{r_i-1}H_i,\qquad A_0=U_0+E,\qquad A_i=U_i+E.
\]

For any integer-zero-extended sequence (X), set
\[
 M_k(X)=X[k]C[k]-X[k+1]C[k-1],\quad
 \lambda_k=\frac{h+1}{(k+1)(h-k+1)}.
\]

**Conditional theorem proved here.** Assume the exact tip-surplus inequalities
\[
 (h+1)U_i[k]C[k]+(k+1)(h-k+1)M_k(E)\ge0
 \tag{TS}
\]
hold for every represented branch (i) and every integer 1\le k with 2k\le N+2. Then throughout that same guarded band:

1. (M_k(A_i)\ge0) for every represented tip branch (i), hence A_i[k+1]C[k-1]\le A_i[k]C[k].
2. (M_k(A_0)\ge0), hence A_0[k+1]C[k-1]\le A_0[k]C[k].
3. For the original-multiplicity tip deck W=\sum_i r_i A_i, (M_k(W)\ge0), hence W[k+1]C[k-1]\le W[k]C[k].

This proves a conditional bridge only. The all-profile premise (TS), registered as `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`, remains OPEN. Thus the registered individual and weighted comparisons remain OPEN unconditionally. Nothing here upgrades selected MASS/payment or proves a statement about arbitrary trees.

## Proof

The fixed-factor orders are (G:1), (B_2:2), (B_3:4), (B_4:7). Gurvits defines ULC(d) for a nonnegative sequence of degree m with d\ge m by log-concavity after dividing coefficient k by binom(d,k); Theorem 1.1 ([arXiv:0804.1181](https://arxiv.org/abs/0804.1181)) states that convolution of ULC(l) and ULC(d) sequences is ULC(l+d). The fixed factors have strictly positive interval support, so repeated application gives C=G\prod_iB_{r_i} order h, including when h exceeds degree. In particular h\ge N+1. Its order-h inequality at the guarded k is
\[
 C[k]^2\ge \frac{(k+1)(h-k+1)}{k(h-k)}C[k-1]C[k+1].
\]
Equivalently,
\[
 C[k]-\frac{C[k+1]C[k-1]}{C[k]}\ge\lambda_k C[k].
 \tag{1}
\]
All denominators are positive: k\ge1, h\ge N+1\ge k+1, and the coefficients (C[k-1],C[k],C[k+1]) are positive.

The main-product likelihood-ratio comparisons are
\[
 U_i[k+1]C[k]\le U_i[k]C[k+1],\qquad
 U_0[k+1]C[k]\le U_0[k]C[k+1].
 \tag{2}
\]
For the tip, the local pair is `(F_{r_i},B_{r_i})` with common factor `GH_i`; for the endpoint it is `(L,G)` with common factor `Q`. In each pair every ordered `2×2` coefficient minor `a_u b_v-a_v b_u` for `u<v` is nonnegative. The common factors are positive-interval log-concave. The finite convolution identity for ordered minors (equivalently, Cauchy–Binet for the coefficient Toeplitz matrices) preserves these inequalities. This gives (2), including its zero-extended boundary form.

For either (U=U_i) or (U=U_0), the relevant inequality in (2), after division by the positive (C[k]), and (1) give
\[
 M_k(U)\ge U[k]\left(C[k]-\frac{C[k+1]C[k-1]}{C[k]}\right)
 \ge \lambda_k U[k]C[k].
 \tag{3}
\]
For (U_i), (TS) is exactly (\lambda_k U_i[k]C[k]+M_k(E)\ge0). Since (M_k(A_i)=M_k(U_i)+M_k(E)), (3) proves the tip assertion.

For the endpoint, direct multiplication gives
\[
 L B_r-G B_{r-1}=z^2(L^{r-1}-1),\qquad
 U_0-U_i=z^2(L^{r_i-1}-1)H_i\ge0
 \tag{4}
\]
coefficientwise. Since m\ge1, choose any represented (i). Thus U_0[k]\ge U_i[k]. Positivity of \lambda_k C[k] and (TS) imply (\lambda_kU_0[k]C[k]+M_k(E)\ge0). Apply (3) for (U_0) and use (A_0=U_0+E) to get (M_k(A_0)\ge0). This step uses (4) only to compare the (U[k]) terms; coefficientwise dominance alone is not used as an LR or shifted-minor argument.

Finally, M_k is linear in its first argument and every original tip in branch (i) occurs with multiplicity (r_i>0). Hence
\[
 M_k(W)=\sum_i r_iM_k(A_i)\ge0,
\]
which proves the weighted-deck assertion with the original multiplicities.

## Guards and support boundaries

Here N\ge2 and (1\le k\le\lfloor(N+2)/2\rfloor\le N). (C) is positive on ([0,N+1]), each (U_i) is positive on ([0,N]), (U_0) is positive on ([0,N+1]), and E[k]=\binom N{k-1} is positive on ([1,N+1]); all are zero-extended elsewhere. Thus every coefficient used in (1)–(3) is inside its stated positive support. Formula (4) also covers the smallest arity: for (r_i=2), (z^2(L^{r_i-1}-1)=z^3), still coefficientwise nonnegative. The guard is the full registered lower-half band 1\le k, 2k\le N+2; no actual-descent filter was used or added.

For the actual-eligibility application, keep P=C+zL^{N+1} and let x be the least natural k, including the terminal zero-extended difference, with \Delta_kP<0. At a current p, retain all guards x+2\le p, \(3p<2(N+2)+1\), and 2p\le N+2. Evaluate the strict flags there, not at another rank: e_0=\mathbf1[\Delta_pA_0<0], e_i=\mathbf1[\Delta_pA_i<0], and the original tag count is b=e_0+\sum_i r_i e_i. The binomial parent summand is rising at x, so \Delta_xP<0 gives \Delta_xC<0. Positive-interval log-concavity of C then gives C[p]/C[p-1]<1 since p\ge x+1. Therefore a shifted comparison at k=p implies the corresponding strict deletion descent and agrees with those current-p flags. This is only a conditional application; the proof above covers the larger all-guard band without an eligibility filter.

The handoff controls retain their stated scopes: the n=91 E-only negative at k=27 has positive full tip margin 777419068009671422357461955841645743808, so the deficit term cannot be discarded; the n=122, counts=(38,0,1), full-tip negative at k=77 is outside the guard and is not a counterexample here; and homogeneous arity-4 with m=3, k=7 has activity coefficient -66 but full tip margin 2076267 and weighted margin 24915204, so that activity layer is not the shifted-minor target. The proof uses the exact combined (TS) premise and the separately established LR/ULC bounds.

## Independent finite checks

`bridge_checks.py` checks exact integer coefficients for the three local pairs ((L,G)), ((F_r,B_r)) for (r=2,3,4), the identity in (4) for each represented arity, and the fixed-factor ULC orders. Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 bridge_checks.py
```

It checks only the finite local arithmetic; the all-profile convolution and conditional implications are established by the proof above. The output records 1, 3, 6, and 10 ordered-minor checks for `(L,G)`, `(F_2,B_2)`, `(F_3,B_3)`, and `(F_4,B_4)`, respectively. Its fresh scalar logical control has coefficientwise-dominating sequences with shifted minors 1 and -9, demonstrating why (4) alone cannot replace endpoint LR; it is explicitly not a path-star witness. No producer script, Lean build, or profile census was run.

## Input integrity

All 275 members of `manifests/C6-COMMON-DISPATCH.json` were SHA-256 checked against their manifest entries; none was missing or mismatched. The packet has no member hash list. The exact registered identities consulted were the OPEN tip-surplus, lower-half individual-deletion, and weighted-tip-deck claims. The shared handoff and solution contract keep the selected MASS and exact-ratio payment at their separate registered scopes and grades.
