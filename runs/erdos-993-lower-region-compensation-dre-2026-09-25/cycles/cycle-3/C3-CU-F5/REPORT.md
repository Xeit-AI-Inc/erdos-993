# C3-F5 opposing-orientation critique

## Claim and disposition

Claim reviewed: `C3-F5-FINITE-WEIGHTED-HALL`.

**Disposition: retained.** The claim is explicitly bounded and reports an exact finite diagnostic rather than asserting the universal lower-region aggregate. I independently replayed the supplied generator from a copy in this scratch directory, redirecting its evidence output here. The replayed `EVIDENCE.json` is structurally identical to the assigned route's evidence file.

## Audit

The generation loop considers sorted multisets of 2–5 branch types from `P1`–`P4` and `C2`–`C4`, skips trees above order 18, and computes all ranks satisfying `x+2 <= p` and `3p < 2 alpha+1`. A `P_l` branch is a path of `l` off-hub vertices; a `C_t` branch is a hub-adjacent center with `t` terminal leaves. The sorted multiset construction gives one recipe for each branch-type multiset in the stated family. The replay confirms 633 recipes, 138 eligible rows, and no empty favorable selector among those rows.

The tree independence polynomial is computed by the standard exclude/include recursion on each component. The first strict descent is searched through the polynomial's last nonzero rank, where zero extension gives the terminal negative difference. The selector tests each original terminal leaf using `Delta_p(T-v) < 0`; its support is the leaf's unique original neighbor. The script retains this original leaf list and support in all later calculations, so equal supports do not merge leaf tags.

For each selected leaf, the script directly computes `Delta_(p-1)(T-{v,s_v}) - Delta_(p-1)(T-N[s_v])`. Its weight rule counts that leaf tag in an independent set exactly when deleting the tagged leaf leaves a vertex in `W_v=N(s_v)\{v}`. The replay asserts equality between the sum of those original summands and upper weighted supply minus lower weighted capacity in every row.

The network has one source arc per positive-weight rank-`p+1` independent set, one sink arc per positive-weight rank-`p` independent set, and a compatibility arc for every generated neighbor. The neighbor routine includes every one-vertex deletion and, for every absent vertex `s`, the move replacing exactly its two neighbors in the upper set by `s`. Such an output is independent: all its possible conflicts with the new `s` are the two removed vertices, and the other retained vertices were already independent. The max-flow routine uses integer capacities, checks the residual-cut deficit against supply minus flow, and the per-row analysis records a deficient cut only when the exact deficit is positive. In the replay all 138 flows saturate their upper supply, with no deficient cut. Direct selected sums are all nonpositive and range from `-9828` through `-224`.

The representative `P2,C3,C4` row also replays: `alpha=9`, `x=4`, `p=6`, and `F={2,4,5,6,8,9,10,11}`. Its full polynomial is `[1,12,55,130,184,172,107,43,10,1]`; selector deltas and all eight summands are recorded in `EVIDENCE.json`. The direct sum and supply-minus-capacity are both `-275`, and the network routes all 259 units of upper supply.

## Scope and limitations

This validates the finite computation and the route's stated bounded claim. It provides no proof that these branch recipes exhaust ordinary trees, no general weighted Hall theorem or injection, and no resolution of `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. The replay is deterministic and uses exact integer arithmetic; it is not an independent implementation of the polynomial recursion, weight construction, or max-flow algorithm. No imported theorem or literature bridge is used.
