# C3-F1 search report: literal weighted-flow sample at rank 7

## Result

I tested the literal-set weighted Hall graph on the first five stored eligible rows at each of orders 16, 17, and 18 in the supplied rank-7 census outputs. All 15 source supplies saturate. This is a bounded feasibility result for that deterministic prefix sample; it does not establish the two-for-one weighted Hall assertion for the remaining cases or in general, and it gives no independent verdict on the primary lower-region aggregate.

For every case, I independently decoded the supplied centroid code, recomputed the full independence polynomial by vertex-deletion recurrence, checked `x`, `alpha`, the rank and strict lower-region guards, recomputed every original-leaf selector value, and evaluated every selected summand using the original support and closed neighborhood. The resulting complete `S` agrees with the stored result. I then enumerated all independent sets at ranks 7 and 8. An upper set `B` has supply

`w_F(B) = #{v in F intersect B : (B - {v}) intersect W_v is nonempty}`,

where `W_v=N(s_v)\\{v}`. Each rank-8 set has a unit-neighborhood arc to every rank-7 set obtained by deleting one vertex, plus an arc to `(B - (N(s) intersect B)) union {s}` for each absent `s` with exactly two neighbors in `B`. The latter target is checked to be independent and of size 7. The rank-7 node capacity is its same `w_F` value. Zero-capacity rank-7 nodes are retained in the network.

For all cases, direct summation gives `supply - capacity = S`; Dinic's integer flow saturates every positive source capacity. The script also checks that each positive flow arc is legal, each rank-8 outflow is at most its supply, each rank-7 inflow is at most its capacity, and total inflow equals total outflow equals the reported flow. The exact positive arc lists, tree encodings, local terms, layer counts, totals, and cut deficits are in `EVIDENCE.json`; `run_flow.py` is the replay program. The recorded residual source cut has deficit zero in all 15 cases.

All 115 listed common-source SHA-256 pins verified before the work began. The full supplied census remains 1,696 eligible rows at order 16, 2,955 at order 17, and 340 at order 18, totaling 4,991. Those counts are reported as source context only. No census generator was run, and the flow computation covered only 15 rows. Order 16 data come from `cycles/cycle-2/C2-F1/RESULT.json` (SHA-256 `3ca4842362f1945434c7e8e3be2280a5b16a187f6fa1f101c50826088d64faac`); orders 17–18 use the corrected-scope result `instruments/p7-order17-18/RESULTS.corrected-scope.json` (SHA-256 `76dc83ff8b460cae3fa5082c1afe98855c6f61263353dcb71ce0d03b7f42a923`).

## Limitations

- The selected cases are the first five rows in the stored eligible-row order at each order. This is a reproducible prefix, not a random or representative sample.
- Feasible certificates on these 15 trees do not prove a universal weighted Hall theorem. The remaining 4,976 rank-7 eligible cases were not flow-tested.
- The supplied complete-sum census results are distinct from this flow sample and remain bounded computations at their own exact scopes.
- Saturated transport is evidence for this mechanism on the tested graphs only. It does not prove the primary assertion beyond the listed trees or provide an infinite structural argument.
