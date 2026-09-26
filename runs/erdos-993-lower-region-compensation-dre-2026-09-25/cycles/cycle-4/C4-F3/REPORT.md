# C4-F3 search report: mixed weighted Hall route

## Result

I tested the exact (T_m) family named in the Cycle 4 claim inventory as a concrete two-orbit instance of the mixed tagged relation. For (m=5), the tree has the path (0-1-2), five claw centers adjacent to (0), and three private leaves at each center. At (p=10), graph-derived independence polynomials give

- (a=16), (x=8), (x+2=10), and (3p=30<33=2a+1);
- the path endpoint has (Delta_{10}(T-v)=-8147), and each claw leaf has (Delta_{10}(T-v)=-6751), so the fixed original selector contains all 16 leaves, in both original leaf orbits;
- (Q=255270), (U=171055), and (C=249285), hence (E=9U+C=1788780);
- direct support/neighborhood deletion gives an arm summand (-1430), 15 claw-leaf summands each (-5519), and (S=-84215).

The independently evaluated incidence identity (E= kU+C) gives (S=(E-C-kQ)/k=-84215), agreeing with the direct complete sum. The exact recurrence and every displayed value are replayable with [replay.py](replay.py); its output is [EVIDENCE.json](EVIDENCE.json). The polynomial factorization used for the count is checked against the graph recurrence, and both orbit (q)-polynomials are checked against direct deletion of (H_v) and (H_v-W_v).

This is a bounded validation row. It does not find a positive cut or establish feasibility of the enlarged mixed Hall relation.

## Orbit quotient condition and the bottleneck

For a finite capacitated bipartite network with a finite group (G) acting by network automorphisms (preserving source/sink, node capacities and every arc), feasibility can be checked by an invariant max flow: average any feasible flow over (G). Equivalently, if the network is infeasible, an invariant minimum cut exists: choose an invariant maximum flow and take the vertices reachable from the source in its residual network. Thus an orbit quotient can preserve Hall cuts, provided it records the full arc multiplicities and capacities and the action is on the *entire* mixed network.

For this (T_5) row, the natural permutations of the five identical claws and of the three leaves within each claw preserve the selected tags, supports, and the deletion/incidence data. The path endpoint is its own orbit. This validates lifting orbit membership back to the 16-leaf selector here. It does not itself construct the enlarged deletion-plus-two-for-one network or prove a flow in it.

The exact values (Q,U,C), or colored lower-shadow sizes alone, do not determine a Hall cut: they record total source/upper counts, while a cut needs the neighborhood capacity of each chosen source subset, including its two-for-one arcs and competing demand at shared targets. In an asymmetric perturbation, a quotient is valid only for the subgroup that preserves the exact graph, fixed selector, supports, and all mixed arcs; a polynomial or orbit resemblance is insufficient. I found no exact deficient cut, and no proved general mixed-boundary inequality. This is the remaining bottleneck for the assigned route.

## Claim boundary

The only proposed verified claim is the stated exact (T_5,p=10) replay. The all-tree lower-region aggregate and the all-parameter (T_m) aggregate remain unresolved by this work. No universal Hall conclusion is drawn from the single row.
