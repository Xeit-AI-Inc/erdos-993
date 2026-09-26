# C6-U3 — bounded equal-type marked-factor absorption

## Result

I tested the predeclared family

\[
G_{r,s,q}(z)=F_r(z)B_s(z)^q,\qquad
F_r(z)=\frac{(1+z)^{r-1}-1}{z},\quad B_s(z)=(1+z)^s+z,
\]

for every \(2\le r,s\le20\) and \(1\le q\le4\). Here the absorbed factors all have the same arity \(s\). The test uses exact integer coefficient convolution, not floating-point arithmetic. The replay is [absorption_census.py](absorption_census.py); [ABSORPTION-CENSUS.json](ABSORPTION-CENSUS.json) records every coefficient vector, degree, least finite ULC order, or first blocking interior index for all 1,444 polynomials.

For positive coefficients \(a_0,\ldots,a_n\), finite-order ULC of order \(d\ge n\) means \(a_j/\binom dj\) is log-concave. Clearing denominators at interior index \(j\) gives

\[
(d-j)A_j\ge R_j,\qquad
A_j=j a_j^2-(j+1)a_{j-1}a_{j+1},\quad
R_j=(j+1)a_{j-1}a_{j+1}>0.
\]

Thus a finite order exists exactly when all \(A_j>0\), and the least such order is

\[
\max\!\left(n,\max_{1\le j<n}\left[j+\left\lceil R_j/A_j\right\rceil\right]\right).
\]

This is also the analytic criterion used to turn the finite coefficient data into certificates: the condition is necessary and sufficient for each tested polynomial, and the computed order is checked against every cleared-denominator inequality.

## Exact census

- Scope: 361 pairs \((r,s)\), four values of \(q\) per pair, 1,444 polynomials total.
- No finite order at \(q=1,2,3,4\): respectively 88, 8, 1, 0 tests. The failures have \(A_j\le0\); the evidence records the first such index and exact integers \((j a_j^2, (j+1)a_{j-1}a_{j+1})\).
- The least successful absorption count among \(q\le4\): \(q=1\) for 273 pairs, \(q=2\) for 80, \(q=3\) for 7, and \(q=4\) for 1. Every tested pair succeeds by four equal-type factors; \((r,s)=(20,2)\) is the unique pair requiring four, with least order 117.
- The largest least order at each fixed absorption count among successful tests is 19,664 at \((18,19,1)\), 2,842 at \((16,2,2)\), 3,935 at \((19,2,3)\), and 136 at \((20,20,4)\). Orders can be large and are not monotone in \(q\) across the whole grid.
- As a cross-check, the independently recomputed coefficients and least orders for \(q=1\), \(2\le r,s\le12\), exactly match all 121 rows in the pinned `C6-MARKED-FACTOR-ABSORPTION.json`.

Run the replay with:

```sh
/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 absorption_census.py
```

The replay asserts the 121-row comparison and regenerates the evidence JSON. The finite boundary is exactly \(r,s\le20\), \(q\le4\); this is not an exhaustive statement beyond that grid.

## Mathematical interpretation and gaps

The exact criterion explains what additional absorption must accomplish: for each interior coefficient index, it must make the strict Poisson-normalized minor \(A_j\) positive; the minimum finite order is then controlled by the largest ratio \(R_j/A_j\). The census supports the bounded conclusion that equal-type absorption repairs every tested \(F_rB_s^q\) by four factors. It also shows the one-factor repair is not uniform even on this small extension: 88 pairs fail at \(q=1\), including failures at interior index 1 or 2.

The evidence is factor arithmetic only. I did not prove a uniform-in-\(r,s\) absorption bound, test arbitrary mixed absorbed arities, or prove an asymptotic criterion forcing \(A_j>0\) after a bounded number of factors. I did not reprove the general finite-ULC convolution theorem or the all-arity finite-ULC bounds for the unmarked \(B_s\). I did not establish any graph/polynomial correspondence, perturbation margin, selector propagation, or tree-level theorem. In particular, this census neither proves nor refutes the lower-region ordinary-tree aggregate or an arbitrary-arity extension of the candidate family argument.

## Source and authority notes

The assigned case packet `C6-U3.json` contains no required claim IDs and no case-specific worker files. I therefore return one bounded new computation and no source-claim dispositions. The common allocation assigns this factor-absorption lens. The 237 common-source SHA-256 pins all matched. The factor leads and the pinned 121-pair arithmetic were read at their listed paths; the 121-pair check is reproduced in the evidence replay. All results here are worker evidence with `proposed_worker_only` authority; no claim status or registry entry is awarded.
