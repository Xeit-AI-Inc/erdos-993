# C5-U2 — heterogeneous star-factor coefficient certificate

## Result

Let (m\ge1), (2\le r_i\le4), (N=\sum_{i=1}^m r_i), (L=1+z), and

\[
 B_r=L^r+z,\qquad Q=\prod_{i=1}^m B_{r_i}.
\]

For every integer (h\ge0) with (4h\le N),

\[
 Q\;\ge_{\rm coeff}\; {m\choose h}z^hL^{N-4h}.
\]

Here coefficientwise order means that every coefficient of the left side is at least the corresponding coefficient of the right side. In particular, for (1\le j\le\lfloor2N/3\rfloor) and (N\ge12),

\[
 [z^j]Q\ge m{N-4\choose j-1}>0,
\]

and the path perturbation appearing in the heterogeneous candidate obeys the explicit uniform estimate

\[
 \frac{[z^j](zL^{N+1})}{[z^j]Q}
 \le \frac1m\frac{{N+1\choose j-1}}{{N-4\choose j-1}}
 =\frac1m\prod_{s=1}^{5}\frac{N-4+s}{N-j-3+s}
 \le \frac{24^5}{m}.
\]

This is uniform over all arity profiles in the stated range; it avoids enumerating profiles. The estimate is intentionally coarse and only says the perturbation coefficient is small relative to (Q_j) once (m>24^5). It does not control coefficient differences or curvature.

## Proof

Expand each factor by choosing either (L^{r_i}) or its additional (z). For each subset (S\subseteq[m]) of size (h), the corresponding nonnegative summand is

\[
 z^h L^{N-\sum_{i\in S}r_i}.
\]

Since (r_i\le4), its exponent is at least (N-4h). For nonnegative integers (a\ge b), (L^a\ge_{\rm coeff}L^b), by multiplying (L^b) by (L^{a-b}). Summing over all ({m\choose h}) subsets proves the first inequality. Taking (h=1) gives (Q_j\ge m{N-4\choose j-1}) whenever (1\le j\le N-3), which contains the requested window.

Put (k=j-1). The ratio of binomial coefficients is exactly

\[
\frac{{N+1\choose k}}{{N-4\choose k}}
=\prod_{s=1}^{5}\frac{N-4+s}{N-4-k+s}
=\prod_{s=1}^{5}\frac{N-4+s}{N-j-3+s}.
\]

When (N\ge12) and (j\le2N/3), every numerator is at most (N+1\le2N), and every denominator is at least (N-j-2\ge N/3-2\ge N/12). (The smallest denominator in the product is (N-j-2).) Thus each factor is at most 24, giving the valid bound (24^5/m).

## Exact window and graph bridge

For the candidate tree (P=(1+2z)Q+zL^{N+1}), the primary contract's strict lower-region condition is (3p<2a+1). The polynomial degree is (N+2), so if that candidate has independence polynomial (P), then (a=N+2), and the guard implies (p\le\lfloor(2N+4)/3\rfloor). The coefficient estimate above applies directly to ranks (j\le\lfloor2N/3\rfloor); it does **not** cover the possible last two ranks between these bounds. No claim is made that the polynomial degree alone verifies α of the graph or either leaf-deletion polynomial. Those selector and source-domain checks are separate obligations.

## What remains open

This coefficient lower bound does not prove Poisson-ULC or ordinary log-concavity of (Q), any mixed minor comparing (Q), (P), or a deletion polynomial, or the sign of the marked polynomial's central difference. Small relative coefficient size alone cannot establish a curvature inequality, whose margin may be smaller or have the opposite orientation. The exact alpha/order window for each deleted graph, the favorable-leaf selector, and the complete selected aggregate are not resolved. Consequently this is a bounded analytic component for the allocated T2/U2 direction, not a proof or refutation of the primary target or of the heterogeneous extension.
