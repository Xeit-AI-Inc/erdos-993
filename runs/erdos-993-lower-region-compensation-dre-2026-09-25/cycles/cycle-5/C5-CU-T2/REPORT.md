# C5-CU-T2 critique (orientation U)

## Reviewed claim

`C5-T2.HETEROGENEOUS-STAR-BOUNDED-CENSUS` claims that for every nondecreasing profile of 1 through 10 branch arities in `{2,3,4}`, and every eligible rank in its specified tree, every original leaf is selected and the exact aggregate is negative. Its stated scope is a finite computation, not the registered infinite lower-region aggregate.

## Disposition: retained

I find the bounded computational claim supported at its stated scope. I do not read it as evidence that the primary aggregate holds outside this finite family or boundary.

The pinned replay script was copied to this scratch root and run there. Its generated census JSON equals the pinned route JSON as parsed JSON. It reports 285 profiles and 913 eligible profile-rank rows, with all 913 rows selecting every original leaf and having no positive aggregate. Independent consistency checks over the regenerated rows confirmed the descent index from the zero-extended vector, both eligibility inequalities, the strict selector equivalence with the listed negative leaf deltas, equality of the selected leaf and term tags, full selector cardinality, and each listed term sum. All 6,676 individual checks passed. The minimum and maximum row sums are respectively `-3351112008120` at profile `(4,4,4,4,4,4,4,4,4,4)`, `a=42,x=20,p=24`, and `-275` at profile `(3,4)`, `a=9,x=4,p=6`. The profile count also agrees with `sum_{m=1}^{10} binom(m+2,2)=285`.

The recurrence implementation is appropriate for the encoded trees: its bottom-up include/exclude states give `z * product(child-exclude)` and `product(child-include + child-exclude)` at each vertex, and multiply the component polynomials after deletion. The graph recipe is a finite simple tree: the path `0-1-2` with each new center attached to `0` and its own 2, 3, or 4 pendant tips. The leaf list retains endpoint `2` and each tip separately, including tags sharing a support. The two deletions used for a selected term are `{v,s}` and the original closed neighborhood of `s`; the coefficient difference is evaluated at `p-1` with zero extension. The first-descent scan reaches `a`, where `Delta_a=-i_a<0`, so it finds the first negative difference within the stated scan.

## Scope and limitations

The profile enumeration is complete up to branch permutation: nondecreasing profiles enumerate the multisets of arities, and permuting branches yields isomorphic trees without identifying the separate tip tags in each row. The rank loop is equivalent to `x+2<=p` and `3p<2a+1` for integer `p`. These checks support the reported finite boundary.

This is a replay of the submitted exact-integer algorithm plus a structural code audit, not a separately implemented graph-polynomial engine. No proof extends the census to more than ten branches, and the star-factor identity or bounded observations do not prove the heterogeneous curvature/mixed-minor bound needed for an infinite result. The result is useful as exact finite-family evidence and a regression target, but it does not resolve the primary claim or provide a proved selector rule beyond this census.
