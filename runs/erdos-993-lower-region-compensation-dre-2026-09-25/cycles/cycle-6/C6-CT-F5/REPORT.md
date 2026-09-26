# C6-CT-F5 critique of C6-F5

## Disposition

**C6-F5-HETEROGENEOUS-DIRECT-FLOW — retained.** The claim is correct as a bounded computation on its two explicitly encoded trees and their stated weighted relation networks. Its statement and scope already exclude a universal conclusion.

## Independent audit

All four case pins and all 237 common pins listed in the packets matched their SHA-256 values. I replayed a scratch copy of `direct_audit.py` with the specified Python 3.11 executable; the generated evidence was equal to the sealed `EVIDENCE.json` as parsed JSON. I then separately enumerated vertex masks from the edge lists and checked the tree independence vectors, first descents, original-leaf selector, every selected summand, rank guards, and the positive-flow certificates. The per-profile exact checks are in `INDEPENDENT-CHECK.json`.

The graph recipe is realizable as an ordinary tree: it consists of path `0-1-2`, branch centers joined to `0`, and the specified number of private leaves at each center. The edge counts are `n-1`, and the replay confirms the independent-set data. In profile `(2,3,4)`, `n=15`, `alpha=11`, `x=5`, and `p=7`; hence `x+2=7` and `3p=21<23=2alpha+1`. All 10 original leaves are favorable and contribute separately; their terms sum to `S=-1218`. In profile `(2,2,4,3)`, `n=18`, `alpha=13`, `x=6`, and `p=8`; hence `x+2=8` and `3p=24<27`. All 12 original leaves are favorable and separately tagged; their terms sum to `S=-5434`. These are the only eligible ranks in the two encoded instances.

For each network, upper supply is the favorable-leaf weight on independent `(p+1)`-sets and lower capacity is the favorable-leaf weight on independent `p`-sets. The listed positive integer arc flows use only legal one-vertex deletions or replacements of exactly two neighbors by an absent vertex. Direct checks verify each listed arc, node conservation, and both capacity bounds. They deliver flow/supply `1563/1563` on 431 positive arcs and `8751/8751` on 2,127 positive arcs, respectively. The replay also enumerates the full finite relations (2,025 and 11,691 arcs).

## Scope and limitations

This verifies full supply saturation in these two literal finite networks and the negative aggregate values for those same trees. It is useful evidence that this particular relation has no deficient cut in these examples. It supplies no general weighted Hall statement, orbit quotient, symmetry-lifting theorem, or argument that saturation holds for other trees. Nor does either negative scalar aggregate prove the arbitrary-tree lower-region claim. No proof gap is present in the finite claim as stated; the universal compensation and any transport/lifting bridge remain outside its scope and were not claimed by this route. No external theorem was needed.
