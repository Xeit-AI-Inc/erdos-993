# C1-F3: grafting and selector instability

## Result

A bounded, exact graft pair shows why termwise monotonicity under grafting is unsafe, while supplying neither a proof nor a counterexample to the registered lower-region aggregate.

Start with the common evaluator's `t_family(22)`: root 0 has the marked path `0-1-2` and 22 root-adjacent 3-leaf stars, the first with center 3 and leaves 4, 5, 6. Set `p=35`. The grafted tree adds the path `4-91-92-93` to original leaf 4. Both are finite ordinary trees and both pass the strict target guards:

| Tree | order | alpha | x | p | x+2<=p | 3p<2alpha+1 | favorable count | S |
|---|---:|---:|---:|---:|:---:|:---:|---:|---:|
| `t_family(22)` | 91 | 68 | 32 | 35 | yes | 105<137 | 67 | -838171658290934690688 |
| graft at leaf 4 | 94 | 69 | 33 | 35 | yes | 105<139 | 67 | -2341400510849661617965 |

The exact graph encodings, complete independence vectors through alpha, every `Delta_j(T)` through the terminal zero-extended rank, and `Delta_35(T-v)` for every original leaf of each graph are in `evidence/graft_pair.json`. The base favorable set is all 67 of its leaves. After grafting, old leaf 4 is no longer a leaf; all other 66 old leaves remain leaves and favorable, and new leaf 93 is favorable. Thus `F` is recomputed on the grafted original tree rather than transported from the base.

The selected leaf 2 remains favorable, but its summand changes from `-212336130412243110` in the base tree to `+424672260824486220` after grafting. The base sum is the sum of 67 negative summands. In the grafted tree, leaf 2 supplies the only positive selected summand; the 66 negative summands, including the new leaf 93, outweigh it, giving the displayed negative full sum. The evidence JSON records every individual summand, so these totals are directly checkable.

This is an exact example of the requested instability mechanism: a graft changes the graph-wide polynomial and selector data while preserving eligibility, removes one old favorable leaf contribution from the sum because that vertex ceases to be a leaf, introduces a new favorable leaf tag, and retains a favorable tag whose summand becomes positive. It does not realize a positive full aggregate.

## Computation and limitations

The computation uses the pinned `inputs/ordinary_tree_checked.py` forest-polynomial dynamic program and recomputes each deleted-tree polynomial at the fixed rank. The first strict descent was independently checked through rank `alpha`, including the zero-extended terminal difference. `evidence/graft_pair.py` reconstructs both graphs and emits the complete data in `evidence/graft_pair.json`.

The searched path-spider family (nondecreasing arm lengths, 2 through 6 arms, total order at most 30) and the two-hub path-arm family (1 through 3 arms at each hub, each arm length at most 13) yielded no eligible positive full sum in the executed finite run. These searches were exploratory bounded samples, not exhaustive over ordinary trees; their full enumerated state/output was not retained and they support no general sign claim. The graft pair is also just one example. No global deficit budget, closure lemma, or positive full witness follows. The primary target and the separately registered incidence identity remain unresolved by this route.
