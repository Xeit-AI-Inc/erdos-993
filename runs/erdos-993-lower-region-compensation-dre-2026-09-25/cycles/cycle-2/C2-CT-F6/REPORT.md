# C2-CT-F6 critique — root pendant leaf on the order-91 control

## Disposition

**C2-F6.ROOT-PENDANT-T22-OBSTRUCTION: retained.** The route's finite claim is reproduced exactly for the stated T_22 and its one new leaf at root 0. This disposition applies only to that graph operation and those eligible ranks; it is not evidence for a uniform padding result or a resolution of the primary universal aggregate.

## Graph and coefficient audit

The recipe has root 0, path 0-1-2, and 22 claws with centers 3+4j and three leaves 4+4j, 5+4j, 6+4j for j=0,...,21. It has 91 vertices. Adding vertex 91 with edge 0-91 gives 92 vertices and 91 edges, remains connected, and is an ordinary tree. The original marked leaf 2 remains a leaf with original support 1; each old claw leaf retains its support, and the new leaf has support 0.

Writing B(z)=1+4z+3z^2+z^3 for one claw, the base independence polynomial is

    (1+2z) B(z)^22 + z(1+z)^67.

When the new root pendant leaf is added, the root-excluded term gains its factor (1+z), and the root-included term is unchanged. Thus the padded polynomial is

    (1+z)(1+2z) B(z)^22 + z(1+z)^67.

These formulas follow by conditioning on root 0: with it excluded, each claw and the path 1-2 are independent choices; with it included, its neighbors are forbidden and the remaining 67 old vertices (the marked leaf and 66 claw leaves) are free. The padded leaf is also free only in the root-excluded case. The exact coefficient vectors in the route evidence agree with the replayed forest-DP vectors.

The base tree has alpha=68 and x=32; the padded tree has alpha=68 and x=33. In each case the terminal zero-extended difference is -i_alpha=-1. Hence the eligible rank sets are respectively 34..45 and 35..45: these are exactly the integer p satisfying x+2<=p and 3p<137. This checks the strict upper guard, not a weak-bound substitute.

## Exact replay

I copied the pinned evaluator and the route evidence into this scratch directory before replay. `replay_audit.py` rebuilds the two trees from the stated recipe and runs the copied evaluator. It checks the full coefficient vectors, alpha, terminal difference, x, complete rank intervals, every original-leaf selector Delta_p(T-v), every favorable tag, every selected summand using that leaf's original support and original-tree neighborhood, and each complete sum against the copied route evidence. Full row data and selector values are in `replay_check.json`; the input evidence and evaluator copies are included so the replay can be inspected without changing sealed sources.

For the padded tree all 67 old leaves and the new leaf 91 are selected at each of the 11 eligible ranks. The marked leaf 2's summand is negative at every such rank, as are the full sums. In increasing p=35,...,45 order, the complete sums are:

    -1385054486733687214684
    -1900020604270788101575
    -2115717975797519395049
    -2053526405105798701837
    -1789338575833081467601
    -1420918152592968682631
    -1037249829990671310013
    -699754627589654663246
    -437750405299345896868
    -254483218709044259680
    -137658965005642503754

The unpadded p=34 row is also reproduced: it is eligible, has 67 favorable leaves, and has a positive marked term 212336130412243110 but a negative full sum -498754180547001418536. That local positive term is not an aggregate counterexample. Recomputing the selector separately after padding is correct: the new tree has its own fixed F(T,p), which includes the additional leaf.

## Limits

The calculation covers T_22 and L=1 root attachment only. It does not settle longer pendant paths, other attachment vertices, any general construction, or the primary assertion for all ordinary trees and eligible p. The route's finite claim has no proof gap within this scope; its evidence grade remains bounded exact computation. No imported theorem or generation-boundary claim is used.
