# C2-CU-F6 critique of C2-F6.ROOT-PENDANT-T22-OBSTRUCTION

## Disposition

**retained** as a bounded exact computation for the single tree specified in the claim. The claim says nothing universal about padding, other attachment vertices, other source trees, or the registered aggregate.

## Audit

The graph recipe is realizable as an ordinary tree. Start with root 0, path 0-1-2, and for j=0,...,21 attach the claw with center 3+4j adjacent to 0 and leaves 4+4j, 5+4j, 6+4j. Adding vertex 91 by edge {0,91} preserves connectedness and acyclicity. The original marked leaf 2 remains a leaf with original support 1; vertex 91 is a new leaf with support 0. This gives 67 old leaves plus the new leaf.

For B(z)=1+4z+3z^2+z^3, the root-excluded choices in the base tree contribute (1+2z)B(z)^22. Root inclusion contributes z(1+z)^67. With the new root-adjacent leaf, the root-excluded contribution gains its factor 1+z, while root inclusion still forbids it:

    I(T^+;z)=(1+z)(1+2z)B(z)^22+z(1+z)^67.

This also confirms the stated tree order 92. The packet-pinned forest DP replay gives alpha=68, x=33, and terminal Delta_68=-1. Thus x+2<=p and 3p<2alpha+1=137 hold exactly for the integer ranks 35<=p<=45.

I copied the listed inputs/ordinary_tree_checked.py into this seat's scratch directory and replayed it there; the source copy's SHA-256 matched the packet pin. For both the unpadded and padded trees, its forest-DP coefficient vector agrees coefficient-by-coefficient with the case evidence. At all 11 padded eligible ranks, the replay independently recalculates the selector outcomes for all 67 original leaves and new leaf 91, recomputes the exact favorable set, and recalculates each selected summand using the original support and closed neighborhood. Every selector outcome, leaf/support pair, summand, and aggregate agrees with EVIDENCE.json; no same-support leaf multiplicity is dropped. The exact padded-tree aggregates are listed in REPLAY-CHECK.json and are all strictly negative. The marked leaf 2 is selected throughout and has a negative summand throughout.

The listed case evidence also records the unpadded order-91 comparison, including its positive marked summand at p=34 and negative full sum. That comparison is consistent with the stated padding observation. This is useful only as a check on this one proposed padding of the T_22 positive-fibre control; it gives no conclusion about the separate order-243 control. Neither local positivity in the base tree nor negativity for this one padded tree proves or refutes the universal assertion.

## Scope and limitations

The retained statement is only that, for this exact T_22 and the single new leaf attached to root 0, the marked leaf term and complete selected sum are negative at every eligible rank. The evidence is bounded to this one attachment and length. It gives no monotonicity or general sign law for longer paths, alternate attachment vertices, or other trees. No proof gap affects the finite claim after replay; the universal lower-region aggregate remains unresolved.
