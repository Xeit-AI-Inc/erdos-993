# C3-CF-T3 critique (orientation F)

## Coverage and disposition

This review covers exactly the three case claims: `C3-T3-STAR-SYMMETRIC-CHAIN-SUBCASE`, `C3-T3-T67-EXACT-BOUNDED-ROW`, and `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`.

### `C3-T3-STAR-SYMMETRIC-CHAIN-SUBCASE` — retained

The star argument is valid in the exact stated range. Put `n=m-1`, the number of leaves other than a tagged leaf `v`. An upper tagged object is `(v,A)` with `|A|=p`, and its corresponding set is `{v} union A`; a lower tagged object is `(v,C)` with `|C|=p-1`. The witness set is all `n` leaves other than `v`, so both source and target satisfy the witness condition because `p-1>=1`.

In a symmetric-chain decomposition of the Boolean lattice on those `n` leaves, a rank-`p` member lies on a chain starting at rank `i<=n-p`. Since `p>n/2`, `n-p<=p-1`; that chain therefore contains a rank-`p-1` member `C` immediately below the source `A`, with `C` a subset of `A`. Send `(v,A)` to `(v,C)`, equivalently delete the unique element of `A\\C` from `{v} union A`. At a fixed tag, distinct rank-`p` sets have distinct chain predecessors because a chain has one member at each rank. Across tags the tag coordinate distinguishes outputs. Thus this is an injection into the weighted lower layer. The recursive construction given in the route is the standard symmetric-chain recursion and supplies a decomposition for every finite Boolean lattice.

This proves only the star weighted-graph subcase, for an arbitrary fixed tag subset and the displayed ranks. It uses neither favorable-leaf eligibility nor any property that extends the Boolean-fiber argument to branched trees.

### `C3-T3-T67-EXACT-BOUNDED-ROW` — retained

I replayed the listed evaluator from a scratch copy using its `t_family(67)`, tree dynamic program, first-descent scan, and `aggregate_row(T,x+2)`. The recipe gives 271 vertices and 270 edges. The coefficient vector and all delta values through alpha agree with the supplied evidence. The replay gives alpha 203, x 97, p 99, and `3p=297<407=2alpha+1`; hence `p>=x+2` and the strict lower guard both hold. The selector test on deleted trees gives all 202 original leaves, so it is the complete fixed favorable set. The row has one support-1 term `9796517609248850465985369472611545317259503273458850354500` and 201 terms each `-13234166380529838122666159928849625141442673759254128694948346`; their exact sum is `-2660057645968888213805432160329302041884660166106806408834263046`.

This is a single exact, eligible ordinary-tree row. The negative full sum does not refute the lower-region aggregate. A positive local summand does not refute a global sum, and the computation does not produce or test a set-level Hall flow. No generation boundary or census is claimed.

### `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — retained_narrowed (open)

The route correctly treats the universal mechanism as unresolved. The star injection does not establish the ordinary-tree mechanism. The T67 calculation neither constructs a flow nor gives a Hall obstruction; its negative aggregate is not a test of whether the proposed moves saturate every upper supply. The missing general step remains an explicit compatible routing or a Hall proof controlling neighborhoods and target capacities across tags. The mechanism is only sufficient for the primary aggregate, not equivalent to it, so even a future mechanism result or counterexample would need that scope kept separate from the primary inequality. I find no basis here to promote or refute the universal claim.

## Limitations

This critique independently checked the star map and replayed the single T67 aggregate row. It did not independently solve a max-flow instance, enumerate arbitrary ordinary trees, or prove the universal Hall condition. The route's references to other finite flow controls were not upgraded or rerun as part of these three claims. No outside theorem was used. All proposed dispositions remain worker-only.
