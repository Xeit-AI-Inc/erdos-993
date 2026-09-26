# C3-CF-U1 critique (orientation F)

## Coverage and decision

This review covers exactly `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` and `E993-U1-CLONE-PROJECTION` from C3-U1. All 118 packet-listed case and common source hashes match. The exact bounded replay and the algebraic checks are in `EVIDENCE.json`.

### E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL — retained, proposed open

The source states a universal matching mechanism, not a proof of the selected-sum inequality. The graph definition is coherent: a deletion gives an independent set one rank lower, and for an absent vertex with exactly two occupied neighbors, removing those neighbors and inserting that vertex also gives an independent set one rank lower. Clone multiplicities use the original fixed selector and preserve separate leaf tags, including shared-support leaves.

I replayed the copied orbit-flow source for all three listed T_m rows. Each rerun reproduced the exact upper/lower orbit counts, arc counts, supplies, capacities, full matching flow, and zero cut deficit. The positive primals contain actual switch-only orbit transitions: 379, 7,231, and 10,987 arcs for m=22,60,66. The listed small-set smoke replay also agrees with literal graph moves and orbit multiplicities for m=1,2,3. The source run recomputes the selector from the original T_m and asserts both lower-region guards for each production row.

This establishes bounded feasibility of the stronger matching mechanism on those three rows only. It supplies no universal Hall argument. A Hall failure would refute this mechanism only; it would not refute the scalar aggregate. The old T22 deletion-only deficit is inherited evidence against that old relation, not against the expanded graph: the replayed expanded flow saturates T22, and the supplied complete aggregate there is negative. The CB(8,92) expanded case remains inconclusive in the allowed sources. No scope transfer from old tagged Hall refutations or from governed RTree claims is justified.

### E993-U1-CLONE-PROJECTION — retained_narrowed, proposed verified

For each original selected leaf v, let H_v=T-{v,s_v}, W_v=N(s_v)\{v}, and R_v=T-N[s_v]=H_v-W_v. An independent set A of H_v meeting W_v can be augmented by v: s_v is absent by definition of H_v, and the only neighbor of v is s_v. Conversely, any active upper clone tagged v uniquely gives A=B\{v}. Thus tagged occurrences at ranks p and p-1 biject with the weighted upper and lower clone layers at sizes p+1 and p. The selector stays fixed at the original T,p. Since |C_r(v)|=i_r(H_v)-i_r(R_v), taking the difference of the two ranks gives exactly the v-summand of S(T,p), and summing over tags gives the stated layer-size difference.

Under the old literal relation, Delete removes one vertex; Retag from v to w outputs A\\{w}, also a deletion from the untagged source set A. Thus every old edge projects to a deletion pair. The expanded relation contains all clone pairs over each deletion pair and adds legal two-for-one moves. The copied replay has positive flow on non-deletion transitions in each of the three T_m rows, confirming strict enlargement there. I retain the general bijection, identity, and projection, and narrow the example-specific strictness statement to these independently replayed rows; I did not reconstruct the route's separate order-14 tagged-fiber example from a complete graph encoding.

The matching implication is one-way: saturation gives upper-layer size at most lower-layer size, hence S(T,p)<=0. The reverse implication is not established. Therefore neither this auxiliary identity nor the bounded flows resolve the primary lower-region aggregate.

## Limitations

- The universal two-for-one Hall assertion is neither proved nor refuted here.
- Replay covers only the three stated T_m rows; the smoke replay covers all sets only for m=1,2,3.
- The bounded flow computation does not establish matching for arbitrary trees or ranks, and all-cut Hall remains stronger than aggregate nonpositivity.
- The expanded CB(8,92) graph has no exact flow or cut in the allowed evidence.
- The route's exact order-14 clone-fiber example was not independently reconstructed; strict enlargement is independently verified on the replayed T_m rows.
- Old-relation refutations and governed RTree statements do not transfer to this changed ordinary-tree relation.
