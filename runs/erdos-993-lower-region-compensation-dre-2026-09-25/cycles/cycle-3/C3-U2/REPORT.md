# C3-U2 — rank-at-most-seven composition audit

## Claim and verdict grade

I audited the proposed composition for `E993-LOWER-REGION-AGGREGATE-RANK-LE-SEVEN`: for every nonempty finite ordinary tree and eligible `p<=7`, the full original-leaf favorable-selector sum is nonpositive. The composition is mathematically consistent **conditional on its named order-band proof, descent-maxima census, and five sealed residual census slices**. The evidence grade remains census-dependent bounded computation, not a universal proof independent of computation and not an authoritative verdict. My proposed status is `proposed_open`.

## Rank/order reduction

For every nonempty tree, `Delta_0=n-1>=0`, while zero extension gives `Delta_alpha=-1`; hence the first strict descent exists and `x>=1`. Eligibility gives `x+2<=p`, so `x<=p-2` and `p>=3`. Since the lower-region guard is strict, `3p<2alpha+1` implies `alpha>=ceil(3p/2)>p`; in particular the ranks used in the sum are in the ordinary range. For the empty forest, if admitted by a broader convention, the leaf sum is empty and the primary guards cannot both hold; for `K1`, `x=1` and no `p>=3` satisfies the alpha guard. Neither creates an omitted eligible case.

The registered maxima are `M(1..5)=(4,8,11,15,18)`, with each entry stated as bounded-computation grade. Because `x<=p-2`, and these five displayed entries are nondecreasing, the resulting order ceilings for `p=3,4,5,6,7` are respectively `4,8,11,15,18`. This uses only monotonicity of those five exact entries, not a general monotonicity theorem for `M`. The global-to-finite step depends on the registered universal `4k` descent-order bound: without that bound, a census horizon alone would not establish any global `M(k)`. The registered identity records that bound as formally verified and the `M(1..5)` entries as bounded computation. `M(0)=0` concerns the empty forest, not a nonempty tree's first descent.

For a leaf `v` with original support `s`, put `H=T-{v,s}` and `W=N_T(s)-{v}`. Any isolate of `H` must be adjacent in the original connected tree to `s` (it cannot be adjacent to `v`), hence is in `W`. Thus the marked-isolate order-band lemma applies. With `k=p-1`, its `q_p<=q_(p-1)` is exactly the leaf summand `Delta_(p-1)(H)-Delta_(p-1)(T-N_T[s])<=0`, because `q_j=i_j(H)-i_j(H-W)`. For `n<=2p+1`, `|H|<=2p-1=2k+1`. The complete selected sum is then nonpositive termwise, retaining every original leaf as its own summand, including leaves sharing a support.

For `p=3,4,5`, the maxima ceiling is at most `4,8,11`, each no larger than `2p+1`; these ranks are closed by the order-band proof. For `p=6`, the ceiling is 15 and the band covers through 13, leaving only 14 and 15. For `p=7`, the ceiling is 18 and the band covers through 15, leaving only 16, 17, and 18. This accounts for every rank and order; there is no omitted eligible rank 1 or 2.

## Residual census audit

I checked the pinned protocols, source pins, generation checks, eligibility code, saved results, and (for order 16) the worker's exact result and return. Counts below are free-tree isomorphism classes generated with the pinned centroid construction. The scripts reject duplicate centroid codes, check generation counts, and compare tree-DP coefficients with the packed generator. The p6 and p7 root scripts compute the complete independence polynomial and first strict descent with zero extension through `alpha`; filter exactly `x+2<=p` and `3p<2alpha+1`; enumerate all vertex subsets for every eligible tree; and assert agreement of polynomial, strict selector, all original leaf terms, and full sum. The C2-F1 p7 script performs the same per-eligible-tree subset replay at order 16. These are checks of the recorded computation pipeline and outputs; I did not independently rerun the full large tree generators in this seat.

| Rank | Order | Free trees | Eligible trees | Subset replays | Nonnegative full sums | Maximum full sum |
|---:|---:|---:|---:|---:|---:|---:|
| 6 | 14 | 3,159 | 240 | 240 | 0 | -222 |
| 6 | 15 | 7,741 | 1 | 1 | 0 | -192 |
| 7 | 16 | 19,320 | 1,696 | 1,696 | 0 | -906 |
| 7 | 17 | 48,629 | 2,955 | 2,955 | 0 | -966 |
| 7 | 18 | 123,867 | 340 | 340 | 0 | -864 |

The residual totals are 241 eligible p6 cases and 4,991 eligible p7 cases, all with strictly negative sums in the sealed outputs. These cover only the residual orders just listed; they do not make a finite census universal by themselves. The combination with the global descent-order ceiling and the order-band proof is what restricts all eligible trees at these ranks to those orders or the band.

The order-17/18 p7 raw `RESULTS.json` has an erroneous top-level scope string saying orders 14 and 15. The pinned correction receipt changes only that field; its corrected file says 17 and 18, and the receipt records 3,295 eligible rows and unchanged mathematical rows. I use only `RESULTS.corrected-scope.json` for the scope claim. The corrected per-order figures are consistent with its protocols, program, and counts. The p16 slice is disjoint and supplied by C2-F1; the rank-seven composition itself cautions that this route result alone is not an award.

## Limitation

This audit finds no arithmetic or rank/order coverage gap in the proposed composition as presented. The result still depends on the informal marked-isolate/order-band argument and on the completeness and correctness of the cited bounded census evidence, including the registered forest maxima census and each residual generator run. I have checked the pinned code paths and saved assertions/results but have not replayed the full enumerations. No claim is made for `p>=8`, for an all-rank theorem, or for any governed-tree transport.
