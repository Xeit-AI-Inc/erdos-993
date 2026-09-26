# C5-CT-U2 critique of C5-U2

## Disposition

**C5-U2.STAR-PRODUCT-COEFFICIENT-BOUND — retained.** The claim is an exact coefficientwise inequality with a valid rank-window consequence. The subset expansion and the five-factor binomial ratio check out, including the strict positivity and denominator bounds. The exact audited argument is in [EVIDENCE.json](EVIDENCE.json).

For each factor, write `B_(r_i)=L^(r_i)+z`, with `L=1+z`. The product expansion includes, for each h-element subset S of factors, the nonnegative term `z^h L^(N-sum_(i in S) r_i)`. Because `r_i<=4`, this term dominates coefficientwise `z^h L^(N-4h)`. Summing these `binom(m,h)` terms proves the claim; all other expansion terms are nonnegative. The condition `4h<=N` also implies `h<=m`, as required for the subset count.

Taking h=1 yields `Q_j >= m binom(N-4,j-1)`. This coefficient is positive throughout the stated window: `j<=floor(2N/3)<=N-3` for N>=12. For k=j-1, the perturbation ratio is bounded by

`binom(N+1,k)/(m binom(N-4,k)) = (1/m) product_(s=1..5) (N-4+s)/(N-4-k+s)`.

Each numerator is at most 2N. The smallest denominator is `N-j-2`, at least `N/3-2`, which is at least `N/12` for N>=12. Thus 24^5/m is valid. No endpoint exception appears within the claimed range.

## Exact scope and usefulness

The coefficient bound is retained as stated, not expanded into a curvature or tree theorem. Each `B_r` is the independence polynomial of a star, so Q itself is realizable by a disjoint union of these stars. That does not verify the separate glued-tree polynomial formula, any deletion polynomial, its independence number or first descent, or the strict favorable-leaf selector. Those require their own graph-level checks.

The estimate gives a uniform lower bound on coefficients of Q and a coarse relative bound on the added path term. Small relative coefficient size alone says nothing about the sign or size of a second coefficient difference or mixed minor. Also, for a separate degree-(N+2) candidate, the strict lower-region guard can reach `floor((2N+4)/3)`, while this coefficient estimate stops at `floor(2N/3)`. Consequently this is useful as a bounded coefficient lemma for the assigned heterogeneous direction, but it does not close the candidate's curvature/rank gaps, prove either selector, or imply the primary aggregate.

The case pins and all common-source pins listed in the packets were verified against SHA-256; no mismatch was found. No source code replay was needed: the claim follows from the displayed finite product expansion and exact binomial identities.

## Limitations

- The claim establishes coefficient bounds only on its displayed profile and rank domains.
- It proves no coefficient-difference, log-concavity, Poisson-ULC, or mixed-minor assertion.
- It does not supply the glued-tree graph/deletion bridge, exact alpha and first descent, or favorable-leaf selector verification.
- It does not prove or refute the complete selected aggregate or the broader heterogeneous extension.
