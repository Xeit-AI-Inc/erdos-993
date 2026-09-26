# C3-CU-T3 — independent U-orientation critique of C3-T3

## Scope and source handling

I checked all three source claim IDs required by the case packet against the exact C3-T3 return, report, and evidence. The packet and common-manifest hash checks passed (3/3 case files and 115/115 common files). The four required read-first files and the separately allowed C3 critic brief were read. For the T67 replay, I copied the listed `inputs/ordinary_tree_checked.py` and the route's `EVIDENCE.json` into this scratch root before loading either; the replay output is `T67-replay.json`.

## Dispositions

### `C3-T3-STAR-SYMMETRIC-CHAIN-SUBCASE` — retained

The stated star-only injection is correct on its stated range. Put `n=m-1`, the number of leaves other than the tagged leaf. For each fixed tag `v`, an upper object is `(v,A)` with `A` an `p`-subset of those `n` leaves; its lower target is `(v,C)` with `C` a `(p-1)`-subset. If the symmetric-chain containing `A` starts at rank `i`, then `i<=n-p` because it reaches rank `p`. The condition `p>n/2` gives `n-p<=p-1`, so that chain contains rank `p-1`. Its two consecutive members are nested and differ by one leaf, hence the map is an allowed deletion. A target is nonempty in the witness coordinate since `p-1>=1`; the source witness condition is also automatic since `p>=1`. Disjoint chains and uniqueness of a member at each rank give injectivity within each tag. Keeping `v` as part of the tagged target gives disjoint images for different tags. Thus the clone matching saturates the weighted upper layer for any fixed `F` in this star range.

The result does not address branched trees, and it does not use or prove favorable-selector eligibility. This limitation is consistent with the route's stated scope.

### `C3-T3-T67-EXACT-BOUNDED-ROW` — retained

The scratch-copy replay confirms the recipe has 271 vertices and 270 edges; the full independence vector and all deltas from rank 0 through `alpha` agree with the route evidence. It gives `alpha=203`, `x=97`, `p=99`, and checks `p>=x+2` and `297<407`. The evaluator finds all 202 original leaves favorable. The representative deleted-tree deltas for the distinguished arm leaf and claw leaf match the source evidence. It also reproduces the one arm summand, all 201 claw summands, and the complete sum

`-2660057645968888213805432160329302041884660166106806408834263046`.

This is an eligible single-tree bounded computation. The replay imports the same listed evaluator implementation used by the source route, so it checks the source artifact and exact arithmetic but is not an independent implementation of the tree dynamic program. The tree recipe and symmetry classes are explicit enough to make the computation replayable. The negative scalar sum is not a flow or Hall certificate.

### `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — retained_narrowed

Revised statement and scope: **C3-T3 proves the registered weighted-Hall saturation statement for stars in the stated range `2<=p<=m-1` and `p>(m-1)/2`, for any fixed set of leaf tags, using deletion edges. It supplies no proof or refutation of saturation for general ordinary trees under the fixed favorable selector and lower-region guards.**

The star proof really does yield a matching between weighted clones, since it is injective tag by tag and distinct tags remain distinct target clones. The T67 row has no set-level flow, matching, cut, or routing data; aggregate capacity/sign cannot establish clone-level Hall inequalities. Nor does failure of another graph relation transfer to this registered graph: its exact allowed moves include non-subset two-for-one moves and its capacities are the fixed weights. Consequently, the route's universal mechanism remains open beyond the star subcase. No underlying universal assertion is refuted here.

## Limitations

- The T67 replay uses the same hash-pinned evaluator code as the route, not a separately implemented dynamic program or literal subset enumeration at order 271.
- No T67 weighted-flow certificate or deficient cut was computed; the exact aggregate is not a Hall test.
- The star injection has no extension here to general ordinary trees, and no claim is made about the lower-region aggregate beyond the bounded T67 row.
- No outside theorem, Lean result, other worker output, or unlisted source was used.
