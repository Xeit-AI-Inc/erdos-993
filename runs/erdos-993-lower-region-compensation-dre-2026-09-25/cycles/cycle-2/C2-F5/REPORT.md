# C2-F5 search report — first-order shell relaxation

## Result

I formulated the fixed slice `p=6`, `|T|=14=2p+2` as a finite convex-hull LP over the eligible realizable tree classes. The variables are `lambda_T >= 0`, with `sum_T lambda_T=1`, and objective `maximize sum_T lambda_T S(T,6)`. The full recorded column set has 240 classes. Its exact optimum is `-222`; the minimum column value is `-404`. Every column has negative full aggregate. The LP dual multiplier `y=-222` for the normalization equality is feasible because every listed `S(T,6)<=-222`; the tree attaining `-222` certifies equality.

This certifies a bounded fixed-rank slice of the first shell only. The columns encode actual rooted-component products, the terminally checked first descent, strict favorable selector, independence number, original supports and leaf tags through the pinned instrument. No scalar relaxation that drops their joint realizability was used as a proof. This is not a dual certificate for variable `p`, and it does not settle `E993-LOWER-REGION-FIRST-ORDER-SHELL`.

## Exact evidence and replay boundary

`EVIDENCE.json` contains all 240 eligible tree codes and their exact order, rank, `alpha`, `x`, favorable-leaf count, and complete integer `S`. Source `instruments/p6-order14-15/RESULTS.json` is pinned by SHA-256 `eba40e10d2045112753bcad82a7f3e3ef753db3ee38e06c0870bd3891243974b`; its protocol `instruments/p6-order14-15/PROTOCOL.md` specifies enumeration of every free tree at orders 14 and 15 (expected class counts 3,159 and 7,741), rank-8 polynomial cross-checks, exact guard evaluation, and an independent subset replay for every eligible tree. For order 14, the record reports 3,159 classes, 240 eligible, and 240 subset-replayed rows. The independently replayed set therefore matches the full eligible set at this order.

The reported maximizer is `U:(((((()))()))((((()))()))())`, with `x=4`, `alpha=9`, five favorable leaves, and `S=-222`. Eligibility checks: `x+2=6=p`; `3p=18<19=2alpha+1`; and `n=14=2p+2`. The minimum is `-404` at `B:(((()())())())|((()())(()()))`, with eight favorable leaves. The report preserves strict leaf selection as a property of the source instrument, which evaluates each leaf after deletion.

## Formulation limit and open bridge

The LP is over the exact finite class list, rather than a compact structural description of all shell trees. Its constraints do not yield a uniform structural inequality for all `p`; the dual value is only for this finite `p=6` slice. A useful next relaxation would need explicit rooted-factor variables and constraints coupling factor products to `alpha`, all coefficients through terminal `x`, the strict `Delta_p(T-v)<0` indicators, and the complete fixed-tag objective. I have not established a valid compact encoding or a dual valid for all realizable shell trees. Relaxing these couplings would admit nonrealizable scalar profiles, so an optimum of such a relaxation would be diagnostic only.

No positive realizable instance or universal shell proof was found here. The primary remains open on this evidence.
