# C2-CT-U5 replay evidence

## Scope and recipe

Replayed the exact 18-vertex tree and pendant extension encoded in the sealed route evidence, using a scratch copy of the packet-listed `inputs/ordinary_tree_checked.py`. The base edges are the path `(0,1),...,(4,5)` and `(0,6),(0,7),(1,8),(1,9),(2,10),(2,11),(3,12),(3,13),(4,14),(4,15),(5,16),(5,17)`; the extension adds `(10,18)`. I ran the forest independence-polynomial dynamic program and its aggregate-row selector/summand evaluator at `p=8`. The source copy was removed after replay; no sealed evidence was modified.

## Exact replay

For the base tree, the independence polynomial by rank is

`[1,18,136,574,1519,2672,3216,2672,1519,574,136,18,1]`.

Its zero-extended differences `Delta_j`, for `j=0,...,12` including the terminal difference, are

`[17,118,438,945,1153,544,-544,-1153,-945,-438,-118,-17,-1]`.

Thus `alpha=12`, the first strict descent is `x=6`, and `x+2<=p` and `3p<2alpha+1` are `8<=8` and `24<25`. All 12 leaves `6,...,17` have strict selector values, in order,

`[-452,-452,-430,-430,-434,-434,-434,-434,-430,-430,-452,-452]`.

Their original-support summands, in the same order, are

`[-323,-323,-375,-375,-366,-366,-366,-366,-375,-375,-323,-323]`,

with complete selected sum `-4256`.

For the extension, the polynomial is

`[1,19,153,694,1986,3795,4981,4531,2834,1186,314,47,3]`.

Its zero-extended differences through `j=12` are

`[18,134,541,1292,1809,1186,-450,-1697,-1648,-872,-267,-44,-3]`.

Again `alpha=12`, `x=6`, and both guards hold at `p=8`. Its leaves are `6,7,8,9,11,12,13,14,15,16,17,18`; their `Delta_8(T^+-v)` values are

`[-844,-844,-798,-798,-838,-805,-805,-805,-805,-842,-842,-945]`,

so every current leaf is selected. The corresponding summands are

`[-494,-494,-616,-616,-473,-600,-600,-590,-590,-501,-501,-192]`,

with complete sum `-6267`.

In particular, old leaf 10 ceases to be a tag and new leaf 18 is selected with support 10. The old support-2 fibre loses one of its two tags; the five other old support fibres keep two tags each. The complete aggregate changes while both rows remain eligible and negative.

## Recurrence checks and interpretation

For `P_G(z)=I(G;z)`, the pendant recurrence `P_{T^+}=P_T+zP_{T-u}` replays exactly. For each of the 11 surviving old leaves, I separately checked the claimed recurrence for `T^+-v` and both deletion graphs `H^+=T^+-{v,s_v}` and `R^+=T^+-N_{T^+}[s_v]`, using the stated cases according to whether `u` lies in the deleted graph, survives, or equals the support. All checks matched the independently computed forest polynomials. The new leaf's two deletion graphs also equal `T-u` and `T-N_T[u]`; its favorable test is `Delta_8(T)=-945<0`, and its summand is `-192`.

The recurrences correctly show how to recompute selectors and summands after the operation. The example establishes non-invariance of the favorable tagged family and full aggregate under this eligible pendant extension. It does not establish a positive sum, sign reversal, universal sign rule, or guard-preserving reduction for a minimal-counterexample proof. It is a single pair, not a census.
