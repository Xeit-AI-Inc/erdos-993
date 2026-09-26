# C3-T3 — tagged exchange and symmetric chains

## Scope and outcome

The assigned target is the registered ordinary-tree `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` mechanism: for the fixed original favorable selector and each eligible rank, saturate the weighted upper layer using ordinary deletions and the specified two-for-one moves. The mechanism is sufficient for the lower-region aggregate, not equivalent to it.

I establish an exact star-tree subcase by a tag-preserving symmetric-chain injection. This uses only deletions. It does not extend to general trees: in general the marked independent-set layers do not have the Boolean-lattice form used by the map, and deleting the unique witness can erase a tag. I do not have a collision bound or recovery rule that combines ordinary deletion with the allowed switches for arbitrary ordinary trees. Thus this route neither proves nor refutes the registered mechanism.

## A symmetric-chain map for stars

Let `T=K_{1,m}` with center `c`, and let `F` be any fixed subset of its original leaves. Fix `p` with `2<=p<=m-1` and `p>(m-1)/2`. For each tag `v` in `F`, a weighted upper object is exactly a pair `(v,A)`, where `A` is a `p`-subset of the other `m-1` leaves: the corresponding independent `(p+1)`-set is `B={v} union A`. The witness set `W_v=N(c)\{v}` comprises all other leaves, so `A` meets `W_v`. A weighted lower object is likewise `(v,C)` with `C` a `(p-1)`-subset of the other leaves; it meets `W_v` since `p-1>=1`.

Fix a symmetric-chain decomposition of the Boolean lattice on those `m-1` leaves. Send `(v,A)` to `(v,C)`, where `C` is the rank-`p-1` member in the same chain as `A`. It exists because `p>(m-1)/2`: the chain containing a rank-`p` set begins at rank at most `(m-1)-p`, which is at most `p-1`. This map is injective for each `v`, as different chains have disjoint members and each chain has at most one member at each rank. It is injective across tags because the target retains `v`. The set move is the legal one-vertex deletion `B -> B minus {q}`, where `q` is the unique element of `A\C`; the target still carries tag `v`. The standard recursive symmetric-chain construction makes the map explicit: from a chain `(A_i,...,A_{n-i})` in `B_n`, form `(A_i,...,A_{n-i}, A_{n-i} union {n+1})` and `(A_i union {n+1},...,A_{n-i-1} union {n+1})` in `B_{n+1}` (omit the second chain if empty), starting at `B_0`.

This proves saturation for the weighted graph on stars in the stated rank range, for any fixed tag set `F`; it does not use favorable-leaf eligibility. It is a star-only auxiliary result. In the supplied common bounded diagnostic, deletion-only flow fails on the specified `T_22`, `T_60`, and `T_66` instances, while the extra two-for-one arcs saturate the three orbit quotients. Those finite comparisons show why the star map is not a candidate general proof; I have not independently rerun or upgraded those flow certificates.

## Fresh exact eligible tree

I constructed `T_67` using the listed evaluator recipe: root `0`, distinguished path `0-1-2`, and 67 root-adjacent 3-leaf claws with centers `3+4j` and leaves `4+4j,5+4j,6+4j` for `j=0,...,66`. This is an ordinary tree of order 271. The listed exact forest evaluator gives `alpha=203`, first strict descent `x=97`, and I selected `p=x+2=99`. Thus `3p=297 < 407=2 alpha+1`. The evaluator scanned all ranks through `alpha` with zero extension at `alpha+1`; the complete coefficient and delta vectors are in `EVIDENCE.json`. By the two leaf orbits, `Delta_99(T-v)` is negative for both a distinguished-arm leaf and a claw leaf, so all 202 original leaves belong to the fixed selector.

The full selected sum is

`S(T_67,99) = -2660057645968888213805432160329302041884660166106806408834263046`.

There is one positive summand, `9796517609248850465985369472611545317259503273458850354500`, at support 1; the other 201 leaves each contribute `-13234166380529838122666159928849625141442673759254128694948346`. This exact eligible instance is not a mechanism certificate: aggregate capacity exceeds aggregate supply, but no set-level flow or routing map was computed. It is bounded arithmetic for one new tree, not universal evidence.

## Remaining gap

The star proof works tag-by-tag because every tagged fiber is a Boolean lattice with a common witness condition. On a branched tree, a source can have a unique witness; deleting it can lose the tag, while the allowed two-for-one switch changes the set and may offer several competing tags. A successful extension needs an explicit rule for choosing deletion versus switch, a proof that outputs respect target capacities across all source tags, and a recovery argument controlling collisions. Neither the aggregate inequality `S<=0` nor the exact `T_67` sum supplies this Hall argument. No primary-literature theorem was imported.

## Evidence grade

The star statement is an informal combinatorial proof of a restricted auxiliary case. `T_67` is a single exact evaluator computation with an explicit graph recipe and full vectors; it is not a census. Both are proposed worker evidence only. The universal weighted-Hall mechanism remains OPEN.
