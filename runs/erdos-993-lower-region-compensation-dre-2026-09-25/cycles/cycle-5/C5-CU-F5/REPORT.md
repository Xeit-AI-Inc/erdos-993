# C5-CU-F5 critique

## Disposition: C5-F5.T22-tagwise-obstruction — retained_narrowed

The arithmetic consequence of the pinned order-91 row is correct. The copied, hash-matched `inputs/standing-controls/t22-order91.json` lists 67 selected summands: one with `g=212336130412243110` and 66 with `g=-7560098737536570631`. Replaying each `g=c_rank-c_previous`, the row total, and the eligibility inequalities gives

`212336130412243110 + 66(-7560098737536570631) = -498754180547001418536`,

with `k=p-1=33` and positive-tag `k*g=7007092303604022630`. Every row's recorded `pointwise_delta` is negative, and the distinct listed leaves match the row's stated favorable list. Thus a proposed rule that requires each selected tag to have nonpositive local `g` fails for the row as recorded.

The control file does not provide a graph edge list or independence-count vectors. Its `polynomial_formula_matches_dp` boolean is only a recorded assertion. This critique therefore does not independently establish that the row is realized by the claimed ordinary tree, that `x=32` is its first strict descent, or that the 67 leaves exhaust its favorable selector. The eligibility arithmetic is consistent with the recorded `a=68,x=32,p=34`, but those inputs are not independently derived here. The claim is retained only as an exact arithmetic obstruction conditional on the pinned row being accurate.

The example does not refute the primary aggregate: its full selected sum is negative. Nor does one positive local tag yield a deficient cut or kernel for a global unsigned relation that permits transfer between tags. The assigned sources specify no source/target bases, incidences, edge rules, or capacities for that relation, so no incidence-level global audit is possible from this case. No new graph computation was performed.

## Evidence and limitations

`ARITHMETIC-REPLAY.json` records the independent arithmetic checks; `replay.py` is the replay over the copied source; `t22-order91.json` is the copied, hash-verified control input. All are in this worker's directory. The control's graph-level derivation and any global cross-tag map remain unverified.
