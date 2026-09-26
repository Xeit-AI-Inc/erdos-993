# C2-U5 exact pendant-extension evidence

## Reproducible tree recipe

Use vertices `0,...,17`. Take the center path edges `(0,1),(1,2),(2,3),(3,4),(4,5)`, and attach two leaves to each center: edges `(0,6),(0,7),(1,8),(1,9),(2,10),(2,11),(3,12),(3,13),(4,14),(4,15),(5,16),(5,17)`. Extend the old leaf `u=10` by adding vertex `18` and edge `(10,18)`. Both are ordinary trees. Reproduce their independence polynomials by exact forest dynamic programming (`Graph.forest_independence_polynomial` in the packet-listed `inputs/ordinary_tree_checked.py`); for each leaf, compute `P_{T-v}`, and each summand from `T-{v,s_v}` and `T-N_T[s_v]`. Coefficients outside a listed vector are zero.

## Base tree values at p=8

`P_T=[1,18,136,574,1519,2672,3216,2672,1519,574,136,18,1]`.

The consecutive differences from rank 0 through the terminal zero-extended rank 12 are `[17,118,438,945,1153,544,-544,-1153,-945,-438,-118,-17,-1]`; hence `x=6`, `alpha=12`. The original leaves are `6,...,17`, with support multiplicities two at each support `0,...,5`. Their respective `Delta_8(T-v)` values are `-452,-452,-430,-430,-434,-434,-434,-434,-430,-430,-452,-452`, so all 12 are favorable. Their summands are `-323,-323`, four copies of `-375` (leaves 8,9,14,15), four copies of `-366` (leaves 10,11,12,13), and `-323,-323`; the full sum is `-4256`.

## Extended tree values at p=8

`P_{T^+}=[1,19,153,694,1986,3795,4981,4531,2834,1186,314,47,3]`.

Differences from rank 0 through the terminal zero-extended rank 12 are `[18,134,541,1292,1809,1186,-450,-1697,-1648,-872,-267,-44,-3]`; hence `x=6`, `alpha=12`. Original leaf 10 is no longer a leaf. The remaining original leaves are `6,7,8,9,11,12,13,14,15,16,17`; leaf 18 is new with support 10. Their `Delta_8(T^+-v)` values are `-844,-844,-798,-798,-838,-805,-805,-805,-805,-842,-842,-945`, respectively. Thus all 12 current leaves are favorable. In leaf order `6,7,8,9,11,12,13,14,15,16,17,18`, the summands are `[-494,-494,-616,-616,-473,-600,-600,-590,-590,-501,-501,-192]`; they sum to `-6267`.

Both rows pass `x+2<=p` and `3p<2alpha+1`, namely `8<=8` and `24<25`. The six original support fibers each initially have two selected tags. After extension, fibers at supports `0,1,3,4,5` each retain two tags, the fiber at support 2 has only leaf 11, and the new support 10 has leaf 18. This verifies a selector/tag and aggregate change under a guard-preserving operation; it does not refute nonpositivity.
