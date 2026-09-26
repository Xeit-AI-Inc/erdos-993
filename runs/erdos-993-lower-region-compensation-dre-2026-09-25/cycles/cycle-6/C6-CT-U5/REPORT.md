# C6-CT-U5 critique (orientation T)

## Claim reviewed

`C6-U5-CB-sector-deficit`

**Disposition: retained_narrowed.** The exact sector cardinality and selected-tag weight ratios are correct. The stated deficit interpretation applies only when the available deletion capacities are restricted to the fixed hub-plus-arm sector. It does not establish a necessary switch-target surplus for the full deletion neighborhood, because deleting the fixed arm tag sends that demand outside the sector.

## Independent checks

I inspected the pinned C6 source map and the exact CB protocol, constructor/replay, results, and CB direction sources it names. The CB graph recipe has a hub and arm, with each of the 92 branch chokes incident to 8 disjoint support-leaf edges. Fixing the hub and arm leaf leaves 736 support-leaf pairs. Choosing an independent set of residual rank `s` gives `|R_s|=2^s binom(736,s)`. The count of selected tags in a sector member is one for the fixed arm leaf plus one for each selected branch leaf, so its total tag weight is `W_s=|R_s|(1+s/2)`.

For `s=491,490`, exact integer cross-multiplication verifies

- `|R_491|/|R_490| = 492/491`;
- `W_491/W_490 = 493/491`;
- `W_491-W_490 = 2W_490/491`.

These are valid within-sector mass comparisons. But the fixed arm tag contributes one unit to every source and target weight. Deleting that tag takes a source out of the hub-plus-arm sector. Thus the comparison of `W_491` against `W_490` is not a Hall deficit for all deletion neighbors; it omits the outside-sector deletion capacity. The correct narrower statement is that the rank-preserving-fixed-vertices deletion boundary has a weight shortfall of `2W_490/491` if its only capacities are the rank-490 members of that same sector. No conclusion about the full deletion-only relation or mixed relation follows from that restricted comparison.

I copied the pinned replay and its declared evaluator into this scratch directory and ran the deterministic CB(8,92) calculation with the assigned Python 3.11 interpreter. The replay gives order 1567, alpha 829, first descent x=490, p=492, eligibility true, 737 favorable original leaves, and the same exact negative full aggregate recorded by the source. The prospective switch-cut envelope remains inconclusive: its lower deficit bound is negative, and it is not an exact neighborhood or flow. The graph is realizable and eligible, but it is not a counterexample to the primary aggregate.

The replay, graph arithmetic, and exact sector identities are documented in `EVIDENCE.json`; the copied replay artifacts are in the `instruments/cb-switch-cut` and `inputs` subdirectories. I checked the source-map references for the CB graph and mixed-cut argument, so this critique does not rely on an unavailable-source claim.

## Scope and limitations

The retained result is an exact bounded sector count. It does not establish the full weighted Hall inequality for arbitrary source subfamilies, account for all deletion targets outside the fixed sector, prove a mixed-boundary flow, or prove/refute the ordinary-tree aggregate. The source's complete CB(8,92) aggregate is negative. No mathematical counterexample was found in this review; the narrowing is a boundary-scope correction, not a refutation of the underlying primary assertion.
