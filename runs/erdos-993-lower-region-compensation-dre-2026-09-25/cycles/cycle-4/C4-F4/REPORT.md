# C4-F4 search report: selector and recurrence boundary probe

## Result

This route found no proof or refutation of the lower-region aggregate. The computation is a bounded diagnostic of selector behavior, complete original-leaf accounting, and the tree-polynomial recurrence boundary.

I verified every source hash in the 179-entry common packet; there were no mismatches. The case packet lists no additional source files. I read the five common read-first documents, the F4 allocation, and only the listed checked-tree evaluator and directly relevant C4 selector/occupancy controls. The computation below is independently implemented in `REPLAY.py`; it does not import or invoke the supplied evaluator.

## Exact finite work

`REPLAY.py` enumerates all 18,248 labeled trees of orders 2 through 7 by Prüfer codes and counts independent sets by literal vertex-subset masks. None has a parameter satisfying both target rank guards. It then examines 40 seeded Prüfer samples at each order 16 through 60, seed 20260926, using a separate include/exclude tree dynamic program for every induced forest. For each sampled tree it derives the complete set of degree-one vertices and original supports directly from the encoded edges, computes the polynomial through its last nonzero coefficient, and checks every integer `p` with `x+2 <= p` and `3p < 2 alpha+1`.

There are 2,535 eligible sampled tree/parameter rows. The full inventory in `EVIDENCE.json` records the Prüfer code, guards' parameters, all original leaves, selector `F`, whether `F` is proper, every selected leaf's support and three relevant rank differences, and the resulting full sum `S`. Across these rows, the proper-selector count is zero, the positive-`S` count is zero, and every computed full sum is nonpositive. These are sample outcomes only.

The first eligible row has order 17, `alpha=11`, `x=5`, `p=7`, and `3p=21<23=2 alpha+1`. Its polynomial is

`[1,17,120,462,1075,1586,1516,945,383,99,15,1]`.

All eight vertices of degree one are favorable. The full selected summands, in leaf order `0,1,2,3,5,8,9,16`, are `-205,-219,-219,-172,-111,-200,-172,-145`, hence `S=-1443`. Leaves 1 and 2 are distinct tags with common original support 7, and both were retained as separate summands. Their values agree in this example, but this is not a rule assumed by the computation.

To audit recurrence rooting, the independently coded include/exclude recurrence was evaluated with each of the 17 vertices of that same tree as root. All 17 resulting polynomials agree with the displayed polynomial; eight of those roots are original leaves. This checks the recurrence boundary implementation on this fixture, not a general selector recurrence invariant.

## Search gap and scope

No sampled eligible row changes selector membership either across eligible `p` values or relative to the original leaf set. Thus the requested changed-membership stress case was not found. The bounded data do not show that proper selectors are impossible, that all leaves are always favorable in the guarded region, or that a recurrence invariant holds universally. The literature/control reading supplied no imported theorem used here. No aggregate proof, global compensation mechanism, or complete target counterexample results from this route.

Replay from this worker directory with `python3 REPLAY.py`; it regenerates `EVIDENCE.json` deterministically. The finite generation boundary is exactly the exhaustive labeled orders 2–7 plus 40 seeded Prüfer samples at each order 16–60. No conclusion is made about trees outside those bounds or unsampled trees within the sampled orders.
