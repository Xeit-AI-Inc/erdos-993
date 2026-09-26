# C5-CF-T5 independent critique (orientation F)

## Disposition: retained

**C5-T5-MATCHING-UP-RANK — retained.** The commutator identity, norm bound, and injectivity conclusion are correct for `J_h`, the disjoint union of `h` edges, in the real independent-set spaces specified by the source. For `1 <= r < h/2`, the source's diagonal/off-diagonal classification gives the identity directly. At `r=0`, the displayed `D_0` term is not defined in the source, but the claim itself holds: `U_0[empty]` is the nonzero sum of the vertices. Equivalently set `D_0=0`, and the identity/norm argument applies. This harmless boundary convention does not require narrowing the claim. The strict margin is `2h-4r>0` exactly when `r<h/2`.

For fixed `r` and a finite family of distinct tags whose blocks are each `J_(h_v)`, the direct sum is injective whenever `r<min_v h_v/2`; this follows block by block. An injective map remains injective on every subspace of its domain. In particular, the span of columns whose independent sets meet a fixed marked subset is a valid restricted domain, and every image term still contains the mark already present in that column.

## Scope, standing controls, and usefulness

The source does not claim that target graphs `H_v=T-{v,s_v}` are matchings, that target eligibility implies `p-1<h_v/2`, or that tag-preserving rank gives capacity after tags are merged. Those are indeed absent bridges, not defects in the stated lemma. The strict original-leaf selector and same-support multiplicities are not used in this operator result, so it supplies no information about which tags belong to `F(T,p)` or the value/sign of the complete target sum. It proves neither the registered primary aggregate nor a counterexample to it.

The result's usefulness is therefore limited to a potential local rank ingredient when the relevant tagged deletion graphs actually are matchings and the rank condition is separately checked. In that special case it establishes injectivity of the stated block map, but still does not supply the across-tag weighted bound needed by the primary budget. No tree witness, selector calculation, arithmetic census, or external theorem is involved in this claim.

## Limitations

- The proof applies only to finite matching graphs with no isolated vertices and ranks `0<=r<h/2` (with `D_0=0` if the commutator formula is used at `r=0`).
- Neither the matching hypothesis nor the rank hypothesis is derived from primary eligibility or the strict selector.
- Tags remain distinct under the direct sum; no capacity after merging blocks and no compensation between selected leaves is proved.
- The primary lower-region aggregate remains unresolved by this claim.
