# C3-F3: literal asymmetric-tree flow search

## Result

I searched the proposed fixed-selector weighted Hall mechanism on five asymmetric ordinary trees, using literal independent-set states and no orbit quotient. All five networks saturated their complete upper supply. The search found no deficient cut. This is a bounded diagnostic only: it does not prove the universal weighted Hall assertion and does not prove the primary aggregate.

## Exact construction and guards

Each tree has hub 0 and marked arm `0-1-2`. For each listed long-limb length `L`, add a new center adjacent to 0 and three disjoint paths from that center of lengths `1, 1, L`. Vertices are numbered consecutively in branch order and path order. The five branch lists are `[1,1,2]`, `[1,1,3]`, `[1,2,3]`, `[1,1,2,3]`, and `[1,1,2,4]`; their orders are 16, 17, 18, 22, and 23.

For every case, the tree independence polynomial was computed by tree dynamic programming, and `x` was checked through the terminal zero-extended rank. The tested rank was `p=x+2`; the strict lower-region guard `3p<2alpha+1` holds in every row. Full coefficient vectors, selector leaf IDs, individual selected summands, exact graph edges, and flow totals are in `evidence.json`.

| Long limbs | n | alpha | x | p | F count | S | upper supply / lower capacity | max flow |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 1,1,2 | 16 | 11 | 5 | 7 | 10 | -1,577 | 2,241 / 3,818 | 2,241 |
| 1,1,3 | 17 | 12 | 6 | 8 | 10 | -2,566 | 2,276 / 4,842 | 2,276 |
| 1,2,3 | 18 | 12 | 6 | 8 | 10 | -3,641 | 3,597 / 7,238 | 3,597 |
| 1,1,2,3 | 22 | 15 | 7 | 9 | 13 | -30,552 | 61,967 / 92,519 | 61,967 |
| 1,1,2,4 | 23 | 15 | 8 | 10 | 13 | -52,336 | 59,277 / 111,613 | 59,277 |

The complete selected sums are negative in these examples, with `S = upper total weight - lower total weight`. Every original leaf happened to be favorable in these five trees; the selector-loss case was not reached.

## Flow graph and replay

For each rank, `search.py` enumerates all independent sets literally. A state has weight `w_F(B)`. It includes an arc for every one-vertex deletion and for every absent vertex `s` having exactly two neighbors in the upper set, replacing those two neighbors by `s`. The network uses the full set-pair compatibility stipulated by the candidate mechanism; source and sink capacities are the exact weights. Integer Dinic flow is run on each graph. The positive-weight state and set-pair arc counts are recorded in `evidence.json`; the complete edge lists and replay code are `flow-results.json` and `search.py`.

`audit_evidence.py` independently rebuilds each listed tree with the pinned `ordinary_tree_checked.py` evaluator, checks its full independence vector, first strict descent, selector, every selected summand and full `S`, and confirms the flow totals agree with `upper-lower=S`. The five recorded max flows equal their upper supplies, so these instances have no deficient cut in this network.

I verified all 115 source hashes listed in `packets/C3-COMMON.json` before reading the authorized common sources. No extra source premise is used in the computation.

## Limits

This is five hand-selected trees, not a census or a generation-complete family. The tested ranks are only `x+2`. All tested leaves were favorable, so selector losses and interrupted-path patterns that remove favorable tags remain open. A saturated flow in these five graphs establishes neither a universal flow theorem nor the ordinary-tree aggregate; conversely, no flow failure here can serve as a target counterexample.
