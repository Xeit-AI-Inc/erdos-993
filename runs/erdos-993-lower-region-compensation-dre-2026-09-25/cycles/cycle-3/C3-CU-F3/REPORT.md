# C3-CU-F3 critique of C3-F3

## Disposition

**retained_narrowed** for the single source claim `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`.

The route's universal statement is not established. The evidence supports only the following bounded statement: for the five explicitly listed trees, at their tested ranks `p=x+2`, the literal weighted network described in the route has an integral flow saturating all upper supply. In those same five instances the complete selected aggregate is negative. The finite rows do not prove or refute the universal flow assertion or the primary lower-region aggregate.

## Independent replay

I copied the route's case files and the authorized `ordinary_tree_checked.py` into this worker directory. I adapted copies of the route search/audit scripts only to use these local copies and write replay outputs here. No sealed source was edited. The exact replay outputs are `flow_replay.json` and `replay_evidence.json`; the copied inputs and scripts are retained alongside them.

A foreground rerun of the route's literal enumeration and Dinic flow construction reproduced all five rows. A separate run of its aggregate audit using the pinned tree evaluator matched, row for row, the route's independence vectors, first descents, fixed favorable leaf sets, every selected summand, aggregate sums, and flow summaries. In each example `max_flow = upper_supply` and `S = upper_supply - lower_capacity < 0`:

| arms | n | alpha | x | p | |F| | S | supply / capacity | max flow |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 1,1,2 | 16 | 11 | 5 | 7 | 10 | -1,577 | 2,241 / 3,818 | 2,241 |
| 1,1,3 | 17 | 12 | 6 | 8 | 10 | -2,566 | 2,276 / 4,842 | 2,276 |
| 1,2,3 | 18 | 12 | 6 | 8 | 10 | -3,641 | 3,597 / 7,238 | 3,597 |
| 1,1,2,3 | 22 | 15 | 7 | 9 | 13 | -30,552 | 61,967 / 92,519 | 61,967 |
| 1,1,2,4 | 23 | 15 | 8 | 10 | 13 | -52,336 | 59,277 / 111,613 | 59,277 |

The vectors include their terminal coefficient, so `x` is checked through the zero-extended terminal descent. The audit verifies `x+2<=p` and `3p<2alpha+1`, recomputes strict selector membership using `Delta_p(T-v)<0`, and recomputes each term using original leaf supports. Repeated leaves on a shared support occur as separate summands. All five happen to have every leaf selected, so the proposed route does not exercise selector loss.

The network implementation gives a distinct upper/lower state for each independent set with positive weight/capacity, with capacities equal to `w_F` and arcs for each deletion and each legal switch replacing exactly two neighbors by the absent vertex. Dinic is run on each resulting finite network, rather than inferring saturation from `S<=0`. The finite replay confirms these particular networks saturate. It supplies no general cut argument.

## Scope and mathematical bridge

If the proposed network were shown to saturate upper supply for every eligible tree and rank, then total upper supply would not exceed total lower capacity. By the weight double count, their difference is the complete selected sum `S(T,p)`, so this would imply the target inequality. This implication does not reverse in general: a nonpositive total difference alone does not establish the stated network's Hall inequalities.

The five runs are hand-selected arm-length recipes, not an exhaustive tree census or a generation-complete family. They test only `p=x+2`, and no tree with a strict selector subset was found. There is no proof covering larger orders, other eligible ranks, interrupted paths, or all favorable-selector patterns. The result is therefore useful as a reproducible bounded diagnostic for this specific two-for-one network, not as evidence for a universal theorem beyond these instances.

## Limitations

- No universal weighted Hall proof, cut characterization, or counterexample is supplied.
- The five trees and five ranks are not exhaustive; selector-loss patterns are untested.
- Saturating a network on these inputs establishes only those finite cases. Flow failure, if found elsewhere, would need separate analysis and would not by itself refute the target aggregate.
- The primary lower-region ordinary-tree claim remains unresolved by this route and this critique.
