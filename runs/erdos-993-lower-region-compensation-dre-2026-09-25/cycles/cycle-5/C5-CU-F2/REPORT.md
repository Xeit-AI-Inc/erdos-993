# C5-CU-F2 critique of the heterogeneous bounded audit

## Disposition

**C5-F2-HETEROGENEOUS-BOUNDED-AUDIT — retained.** The claim is a finite computational statement, and the evidence supports that statement on its declared boundary. It does not prove or refute the universal lower-region aggregate or a heterogeneous extension beyond these profiles.

## Audit

The producer's graph recipe gives a tree for each multiset profile: the path leaf at vertex 2 and every pendant tip are original leaves; each has the unique adjacent center/support stated by the recipe. The number of profiles is `sum_{m=1}^5 binomial(m+2,2)=55`. The exact deletion recurrence used in `COMPUTE.py` is the standard partition of independent sets according to whether a selected vertex is absent or present. Its zero-extension delta routine, scan through `alpha` (including `Delta_alpha=-i_alpha`), strict selector comparison, original-support deletions, and complete summation implement the contract's finite checks. The `x+2<=p` and strict `3p<2alpha+1` guards are explicit.

I copied and ran the pinned computation in this scratch directory. It reproduced all 55 profiles and 62 eligible profile/rank rows. Across those rows, full sums range from `-2564670` to `-275`; all selected summands are negative, ranging from `-126134` to `-14`. Every original leaf is selected in every row, so no proper-selector behavior is tested. The reported factor audit has no whole-tree coefficient log-concavity failure on the same finite boundary.

As a separate whole-polynomial check, I recomputed all 55 independence vectors by binomial convolution from the stated branch decomposition

`I(T;z)=z(1+z) product_i (1+z)^{r_i} + (1+2z) product_i ((1+z)^{r_i}+z)`.

Every vector matched the replay. I also directly enumerated independent subsets for the 15-vertex profile `(2,3,4)` and verified its full vector, `alpha=11`, first descent `x=5`, all ten strict selector values at `p=7`, the original-support terms, and `S=-1218`. The full finite table's selector and term values otherwise rely on the replayed exact recurrence; the independent formula cross-check directly verifies whole-tree vectors, not all deletion polynomials.

## Scope and remaining gap

The census is exhaustive only for nondecreasing multisets of 1–5 arities from `{2,3,4}` with this path-and-stars attachment. It finds no mixed selector: all leaves are favorable throughout the eligible lower region in this family. Whole-tree log-concavity does not imply curvature or common-minor inequalities for the distributed marked polynomials, and neither this census nor its negative sums establish the global `D+C` budget. The route's finite claim is retained at exactly its stated bounded scope; the primary assertion remains unresolved.
