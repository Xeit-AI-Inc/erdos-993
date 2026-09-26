# C6-F2 opposing-orientation critique

## Covered claim

`C6-F2-HETEROGENEOUS-CUTOFF2000-SCALAR-AUDIT`

**Disposition: retained_narrowed.** The exact h=29 scalar estimate and the conditional rank-interval statement survive independent checking. This disposition covers that scalar lemma and rank arithmetic only. It does not establish the heterogeneous family theorem or the primary aggregate.

## Checks performed

The two packet manifests were verified before reading their sources: all 237 common source pins matched and all four case pins matched. The case pins are `cycles/cycle-6/C6-F2/REPORT.md`, `RETURN.json`, `f2_scalar_audit.json`, and `f2_scalar_audit.py`. The protocol, solution contract, execution policy, common read-first files, C6 source map, search allocation, and critic brief were read. I inspected the exact source-map route for the heterogeneous graph, scalar supplement, and forest descent theorem, including the candidate family formulas and the pinned `forest_descent_linear_bound` statement.

I copied the sealed scalar replay into this worker's scratch and ran that copy with the specified Python 3.11 executable. The replay reproduced the exact rational cutoff value `80328*m*epsilon(m)` at `m=2000` as approximately `0.00003299964639786117 < 1`, with 70,314 exact successive-quotient identity checks and 42 endpoint cross-product checks. The finite checks are corroborative; the infinite-range argument comes from the displayed affine cross-product and monotonicity proof.

For `h=29`, `N=sum r_i`, and `r_i in {2,3,4}`, the coefficientwise term `binom(m-1,29) z^29 (1+z)^(N-120)` is valid: after choosing 29 branch factors, the omitted branch and chosen branches remove at most `4+29*4=120` powers from the total exponent. The displayed quotient is

`(j-s)_(29-s) (N-j+s)_(91+s) / (N)_120`, for `s=0,1`.

Its consecutive ratio is the one in the F2 report. Cross multiplication leaves an affine expression in `j` with positive slope 120; at `j>=N/4` its lower bounds are `N+91` for `s=0` and `2N-28` for `s=1`, so the quotient decreases. At `J=floor(2N/3+3)`, the smallest numerator factors are at least `2N/3-26` and `N/3-93`. Since `N>=2m`, these imply the weaker positive bounds `N A(m)` and `N B(m)` used in the candidate. `A>B>0` for `m>=2000`, and the two shifts both yield the common `A^28 B^92` product. Finally, `80328*m*epsilon(m)` decreases: `m/(m-29)^29` decreases on this domain while `A` and `B` increase. Thus the cutoff conclusion is not limited to the sampled identity checks.

The conditional rank placement is also consistent. The graph contract/candidate has `n=N+m+3` and `alpha=N+2`. From `3p<2alpha+1=2N+5`, integrality gives `p<=floor((2N+4)/3)`. Eligibility gives `x<=p-2`. The pinned forest descent theorem gives `n<=4x`, hence `x> N/4`. Therefore `x`, `p`, and `p-2` lie in the proposed interval `[N/4,2N/3+3]` whenever the candidate's structural hypotheses apply.

## Scope and limitations

The route does not claim to prove the whole family theorem, and I do not promote it. Its remaining obligations are real: the complete polynomial/deletion/tag identities, finite-order ULC applications and curvature margins, all mixed-minor signs and perturbation envelopes, and the transfer from those inequalities to each original leaf under the fixed selector. I did not independently rederive those structural estimates or enumerate literal graphs. No mathematical defect was found in the scalar lemma or in the stated conditional rank placement. This review leaves the family theorem and primary claim OPEN; it does not cover `m<2000`, other arities, or arbitrary trees.
