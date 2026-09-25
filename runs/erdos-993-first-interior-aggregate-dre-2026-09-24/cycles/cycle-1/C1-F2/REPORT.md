# C1-F2 search report

**Seat:** C1-F2, Cycle 1, F orientation. **novelty_claimed: false.**

## Result

I found no eligible positive aggregate. The primary statement remains unresolved. I did establish a concrete scope gap in any attempt to answer the primary question solely by citing the admitted r26 theorem: an eligible tree can fail `Residual(T)`. On that exact tree the aggregate is still negative, so this is a coverage obstruction only, not a refutation of the target.

The non-residual witness has vertices `0..9` and edges

`{0-8, 1-2, 2-5, 3-7, 3-8, 4-8, 5-8, 6-8, 7-9}`.

Independent subset enumeration gives

`(i_0,...,i_7)=(1,10,36,62,61,37,13,2)`, hence `alpha=7`, `p=5`, and `x=3`; thus `x+2=5<=p`. Its original leaves are `[0,2,4,5,8,9]`, all are favorable at rank 5, and their complete summands in that order are `[-15,-13,-13,-15,-15,-1]`, so `S=-72`. Its maximum independent sets are `{0,1,2,4,5,7,8}` and `{0,2,4,5,7,8,9}`; leaf 9 is absent from the first, proving this tree is outside the r26 residual face.

## Larger exact target check

I tested the root-plus-`m`-three-leaf-star family at the exact target rank, including `m=60` (order 243). Number vertices as `r=0`, the marked path `s=1,v=2`, and for `j=0,...,m-1` a center `c_j=3+4j` with leaves `a_j=4+4j,b_j=5+4j,d_j=6+4j`. Edges are `(0,1),(1,2)` and `(0,c_j),(c_j,a_j),(c_j,b_j),(c_j,d_j)` for each `j`. Its polynomial is

`(1+2z)(1+4z+3z^2+z^3)^m + z(1+z)^(3m+1)`.

For `m=60`, exact arithmetic yields `alpha=182`, `p=180`, `x=87`, so `x+2<=p`. The marked leaf and all 180 star leaves are favorable. Their summands are `-15,930` for the marked leaf and `-16,287` for each star leaf, giving the complete sum `-2,947,590`. The rank is `alpha-2=180`; the inherited T60 control's historical rank 90 is not this target rank. A second exact factorized evaluator agreed with the copied ordinary-tree DP on every reported coefficient, selector result, summand, and sum for `m=22` and `m=60`. The same family was swept for all `m=1..60`; every eligible row had negative complete sum. This is only a family computation.

At the related `m=22` order-91 tree, the target rank is `p=66` (not the historical control's rank 34): `alpha=68`, `x=32`, all 67 leaves are favorable, the marked summand is `-2,079`, each of the 66 star-leaf summands is `-2,208`, and the complete sum is `-147,807`.

## Search and inherited obstruction checks

A seeded Prüfer sample checked 4,560 labeled trees at orders 8 through 45. Of these, 3,840 met the target eligibility condition; none had positive `S`, and none had a positive selected summand. All relevant coefficients and sums were computed with integer tree-DP arithmetic. A complete enumeration of labeled Prüfer trees through order 7 found no eligible instances, so it contributes no target coverage. Replay commands from the run root:

- `python3 scratchpad/C1-F2/random_search.py`
- `python3 scratchpad/C1-F2/exhaustive_small.py`
- `python3 scratchpad/C1-F2/verify_nonresidual.py`
- `python3 scratchpad/C1-F2/verify_large_family.py`

Inherited-source findings, read from the frozen packet: the universal tree log-concavity/real-rootedness fence is relevant as a warning against assuming a global coefficient shape; it supplies no counterexample to this rank-restricted aggregate. The old positive pointwise and positive support-fibre beta witnesses are at historical ranks 34 (order 91) and 90 (order 243), whereas those trees have `alpha=68,182`; the primary ranks here are 66 and 180. They do refute rank-blind pointwise/support-fibre proof shortcuts, but they are not counterexamples at `p=alpha-2`. The registered all-cut and tag-closed Hall failures are mechanism fences for Hall-based proofs; no Hall mechanism was used in this search. The r26 result is restricted to `p=alpha-1` and residual trees, so it cannot settle this interior all-tree claim; the explicit order-10 witness above demonstrates the residual-class gap. The rejected `N2<=M` count shortcut and arbitrary unimodal convolution are likewise not used here. Relevant inherited source files: `sources/public/experiments/r24-direct-favorable-leaf-aggregate.md`, `sources/public/experiments/r25-uniform-residual-no-recovery.md`, `sources/public/experiments/r26-top-rank-residual-sign.md`, `control/REJECTED-MECHANISMS.json`, and `sources/standing-controls/{ordinary_tree.py,t22-order91.json,t60-order243.json}`.

## Limits

No universal claim follows from the family sweep, random sample, or finite enumeration. I did not find or prove a positive complete sum. The larger test belongs to a highly symmetric family and does not cover arbitrary ordinary trees. The scope witness only shows that the residual theorem leaves eligible instances untreated; it has negative `S`. No Lean build was assigned or run. All search/replay jobs have exited; I have no background process running.
