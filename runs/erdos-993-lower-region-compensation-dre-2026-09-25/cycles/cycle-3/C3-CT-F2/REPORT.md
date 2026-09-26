# C3-CT-F2 critique (orientation T)

## Source and replay audit

All four case-file hashes and all 115 common-source hashes in the packets matched. I read the required common read-first files, the explicitly allowed critic brief, and the four exact C3-F2 case files. The replay was run from scratch copies of the route replay, CB evaluator, and ordinary-tree evaluator; the sealed files were not modified. The generated `EVIDENCE.json` matches the route's sealed evidence JSON exactly. Copy hashes and the replay comparison are recorded in `AUDIT-EVIDENCE.json`.

## Claim dispositions

### C3-F2-CB-ELIGIBLE-REPLAY — retained

The two recipes give trees of order `3+17m`; their reported independence numbers are `9m+1`. The replay gives `(a,x,p)=(829,490,492)` and `(838,496,498)`, with `x+2=p` and strict guards `1476<1659` and `1494<1677`. The arm leaf and the `8m` branch leaves form two automorphism orbits. Both orbit representatives have negative `Delta_p` after leaf deletion in each row, so all original leaves are selected. The orbit multiplicities sum to 737 and 745, and their multiplicity-weighted summands reproduce the full sums. Both complete sums are negative. This establishes the claim only for the two stated ordinary trees and ranks.

### C3-F2-HUB-ARM-ARC-CLASSIFICATION — retained

For an independent upper set containing `h,v`, the arm support `s` has exactly the two occupied neighbors `h,v`. A choke `c_i` has exactly two occupied neighbors precisely when its branch has one occupied support: `h` and that support. The other absent vertex types cannot qualify: `h,v` are already present; supports and leaves have at most one occupied neighbor because `h` excludes all `c_i`; and no other vertex types occur in the recipe. The listed arm and one-support choke arc counts agree with the replayed branch polynomials. This is an exact classification on the specified source family, not a statement about other upper sets.

### C3-F2-QUALIFYING-CHOKE-ROUTING — retained

For each source in the stated subfamily, select the first qualifying branch. Its choke is absent, and its only occupied neighbors are `h` and the unique occupied support, so replacing those two vertices with the choke is a legal two-for-one move. In an output with `ell` branch leaves, any preimage must restore the removed support at one of the `8-ell` pairs whose leaf is absent. The inserted choke identifies the branch; other branch states are unchanged. Thus the incoming unit count is at most `8-ell`, while the output has at least `ell` active selected leaf tags. Since `ell>=4`, this fits capacity. The polynomial coefficient counts the qualifying-source union, including overlaps through subtraction of strings with no qualifying branch. The replay quantifies unrouted supply and remaining capacity, but does not claim a full flow.

## Limitations

The computation covers only two specified CB rows. The routed subfamily leaves other weighted upper sources uncovered, and the old cut envelopes have negative deficit lower bounds, so they are not deficient-cut certificates. Neither the bounded negative sums nor the partial routing resolve the universal lower-region aggregate. No larger-tree region, universal flow, or target theorem was established here.
