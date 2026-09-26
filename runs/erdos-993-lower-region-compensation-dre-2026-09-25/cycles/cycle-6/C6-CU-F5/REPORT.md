# C6-CU-F5 critique of C6-F5

## Disposition

**C6-F5-HETEROGENEOUS-DIRECT-FLOW — retained.** The source claim is correctly limited to two labeled heterogeneous trees and their specified finite networks. I independently replayed the source program from a scratch copy and separately checked the saved positive-flow certificates against literal independent-set and graph-neighborhood definitions. Both cases pass. This establishes those finite calculations only; it does not resolve the arbitrary-tree aggregate.

## Audit

The constructor gives a path `0-1-2`, with branch centers adjacent to `0` and the listed number of private leaves at each center. The edge lists in `EVIDENCE.json` have 14 and 17 edges on 15 and 18 vertices, respectively; the listed edges form the stated connected acyclic graphs. Each private leaf is separately tagged, as is path leaf `2`, and the evidence retains separate terms for leaves sharing a support.

The independence polynomials replay as

- `(2,3,4)`: `[1,15,91,299,601,798,737,480,218,66,12,1]`, hence `alpha=11`, first strict descent `x=5`, and the only eligible `p` is 7 (`x+2=7`, `21<23`).
- `(2,2,4,3)`: `[1,18,136,577,1544,2780,3522,3237,2185,1080,383,93,14,1]`, hence `alpha=13`, first strict descent `x=6`, and the only eligible `p` is 8 (`x+2=8`, `24<27`).

For each tree, the route computes `Delta_p(T-v)` for every original leaf and selects exactly the negative entries. The complete favorable sets are respectively `{2,4,5,7,8,9,11,12,13,14}` and `{2,4,5,7,8,10,11,12,13,15,16,17}`. The per-leaf deletion terms in the evidence sum to `-1218` and `-5434`; no tag is collapsed across a shared support.

The network has one node for each positive-weight independent set at ranks `p+1` and `p`, with fixed-tag weights as source supplies and sink capacities. Edges are precisely single-vertex deletion or insertion of an absent vertex with exactly two neighbors in the upper set, removing those two neighbors. The independent certificate check enumerated the labeled independent sets and validated every emitted positive arc against that rule, its endpoint ranks, source and sink capacities, and total flow. It confirmed `1563/1563` and `8751/8751` upper supply transported, with lower capacities `2969` and `15468`; the recorded positive-flow arcs therefore certify saturation in each finite network.

## Limits

This is a bounded result for these two instances and this relation. It gives no general compensation or lifting theorem and no inference for arbitrary ordinary trees. The route does not rely on a symmetry quotient. I did not review the separate homogeneous `T_m` quotient-lifting argument; that unperformed review is not a defect in this finite claim. No mathematical counterexample to the primary target is supplied.
