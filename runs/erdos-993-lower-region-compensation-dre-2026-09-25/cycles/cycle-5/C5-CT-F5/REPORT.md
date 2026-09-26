# C5-CT-F5 critique (orientation T)

## Covered route claim

`C5-F5.T22-tagwise-obstruction`

**Disposition: retained_narrowed.** The pinned row’s arithmetic establishes a positive distinguished tag alongside a negative sum of its 67 recorded summands. Thus it obstructs a proposed *pointwise* rule that requires every selected tag to contribute nonpositively (or pay its own nonnegative local demand). It does not obstruct a rule that permits cross-tag transfer. The qualification is material: the allowed control record has no tree encoding or independence-count vectors, so this review cannot independently certify that it is a realizable ordinary-tree row or validate its alpha, first-descent, and selector data.

## Checks

All packet-listed source hashes matched (240/240). The common listed T22 control was copied into this worker’s scratch before replay. On that copy, I checked that the row has 67 distinct listed favorable leaves and 67 summands, that every recorded selector witness has negative `pointwise_delta`, and that each recorded `g` equals `c_rank - c_previous`. The sum reproduces exactly:

`212336130412243110 + 66(-7560098737536570631) = -498754180547001418536`.

For `k=p-1=33`, the distinguished tag has `k*g=7007092303604022630>0`; each of the 66 other tags has `k*g=-249483258338706830823`. The row records `x=32`, `p=34`, `a=68`, so its stated guards pass arithmetically: `x+2=p` and `3p=102<137=2a+1`.

The arithmetic and guard checks are exact and independently replayed from the copied row. The copy only tabulates the T22 row: it does not give a graph recipe, edges, or the independence-count vectors needed to recompute `alpha`, `x`, `Delta_p(T-v)`, or the selected summands. The control’s `polynomial_formula_matches_dp` flag is not an independent certificate. Consequently this review does not elevate the row to a verified graph witness.

## Scope and conclusion

The bounded row, if its input graph/selector record is correct, defeats tagwise nonpositive charging on this example. It gives no deficient cut or kernel for the actual unsigned cross-tag relation: the assignment supplies no complete source/target bases, incidence, capacities, weights, or mixed-boundary transition rules with which to instantiate such a network. The positive tag can be offset by the other tags, as the displayed full sum itself illustrates. The primary global aggregate claim is not refuted; indeed the recorded complete sum is negative.

No literature theorem or new graph computation was used. No pointwise arithmetic issue was found. The retained_narrowed disposition applies only to the exact row arithmetic and its conditional tagwise consequence; the claimed ordinary-tree realizability and selector provenance remain unaudited.
