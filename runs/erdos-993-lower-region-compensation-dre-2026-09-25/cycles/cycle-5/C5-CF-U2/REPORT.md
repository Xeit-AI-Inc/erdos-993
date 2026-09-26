# C5-CF-U2 — independent critique of C5-U2

## Disposition

**C5-U2.STAR-PRODUCT-COEFFICIENT-BOUND: retained.** The exact coefficientwise inequality and the stated ratio bound are correct on the stated profile and rank domains. The worker correctly limits the conclusion: it gives no curvature sign, mixed-minor inequality, graph/selector bridge, or proof of the primary aggregate.

## Independent audit

Write `L=1+z`, `B_(r_i)=L^(r_i)+z`, and `Q=product_i B_(r_i)`, with `m>=1` and `2<=r_i<=4`. In the product expansion, choosing the extra `z` term in precisely a subset `S` of `h` factors contributes `z^h L^(N-sum_(i in S)r_i)`. For `4h<=N`, `sum_(i in S)r_i<=4h`, so the exponent is at least `N-4h`. For nonnegative integer exponents, `L^u-L^v` has nonnegative coefficients when `u>=v` (factor `L^v(L^(u-v)-1)`, or use the binomial expansion); thus each such contribution coefficientwise dominates `z^h L^(N-4h)`. There are `binom(m,h)` such subsets. The subset count is defined: since `N<=4m`, `4h<=N` implies `h<=m`. This proves the first assertion, including `h=0`.

Taking `h=1` gives `Q >= m z L^(N-4)` coefficientwise. For `1<=j<=floor(2N/3)` and `N>=12`, `0<=j-1<=N-4`, so `Q_j >= m binom(N-4,j-1)>0`. Put `k=j-1`. The ratio in the claim is exactly

`binom(N+1,k)/binom(N-4,k) = product_(s=1..5) (N-4+s)/(N-j-3+s)`.

For every factor the numerator is at most `N+1<=2N`; the denominator is at least its `s=1` value `N-j-2 >= N/3-2 >= N/12` (the last inequality uses `N>=12`). Therefore the ratio is at most `24^5`, and division by `Q_j >= m binom(N-4,k)` proves the claimed `24^5/m` bound.

These arguments are exact and require no graph realization. The strict lower-region guard for a candidate polynomial of degree `N+2` can allow ranks through `floor((2N+4)/3)`, so the coefficient estimate does not cover that entire possible range. More fundamentally, a positive coefficient lower bound and a small relative perturbation coefficient do not determine coefficient differences, log-concavity, Poisson-ULC, or mixed-minor signs. Nothing here establishes that a graph has this polynomial, that its independence number equals the degree, or that any original leaf satisfies the fixed strict favorable-leaf selector. It does not prove or refute the full selected sum.

## Hash and scope record

All three C5-CF-U2 case pins and all 237 C5-COMMON source pins matched their listed SHA-256 values. The case contains exactly one source claim; this review covers exactly that claim. Source status and this disposition remain proposals under `proposed_worker_only` authority.

## Limitations

- No graph-to-polynomial realization or deletion-polynomial domain is checked or supplied by this coefficient argument.
- No estimate for coefficient differences, curvature, Poisson-ULC, or a mixed minor follows from the proved lower bound.
- The bound covers only `j<=floor(2N/3)`, not all ranks allowed by the degree-based strict lower-region guard.
- The full original-leaf selector and selected aggregate remain unresolved; this evidence has no primary-target verdict.
