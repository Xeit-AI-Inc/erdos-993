# C2-F6 — root pendant-path padding of the order-91 positive fibre

## Result

I tested the specified pendant-path idea on the supplied order-91 positive local-fibre control. The operation is: start with `T_22` from the pinned `t_family(22)` recipe and attach one new leaf to its root 0, keeping the original marked leaf (vertex 2) and all original tags. For this padded tree, the marked local summand is negative at every eligible rank, and the complete selected sum is strictly negative at every eligible rank. Thus this particular guard-preserving padding removes the positive marked fibre; it does not turn it into a positive full-sum witness.

This is an exact, finite obstruction for this input and this one-vertex root attachment, not a theorem about all pendant-path lengths, attachment vertices, or source trees. The primary aggregate assertion remains unresolved.

## Exact graph and polynomial recurrence

The base tree has root 0, the marked arm `0-1-2`, and 22 root-adjacent claws: for `j=0,...,21`, add center `3+4j` adjacent to 0 and leaves `4+4j`, `5+4j`, `6+4j` adjacent to that center. This is the order-91 `T_22` control. The padded tree adds vertex 91 and edge `{0,91}`; it is an ordinary connected tree of order 92.

Write `B(z)=1+4z+3z^2+z^3` for a claw's independence polynomial and `P_m(z)=(1+2z)B(z)^m` for the root-excluded part of `T_m`. Root inclusion contributes `z(1+z)^(3m+1)`. Hence

`I(T_m;z) = (1+2z)B(z)^m + z(1+z)^(3m+1)`.

When one new leaf is attached at the root, root exclusion additionally allows that leaf and root inclusion forbids it, so

`I(T_m^+;z) = (1+z)(1+2z)B(z)^m + z(1+z)^(3m+1)`.

This recurrence checks the coefficient vector independently of the graph description. Exact forest-DP coefficients for both polynomials, including terminal differences, are in `EVIDENCE.json`.

## Guards and selectors

For the base tree, exact DP gives order `n=91`, independence number `a=68`, and first strict descent `x=32`. Its eligible integer ranks are exactly `p=34,...,45`: the lower bound is `x+2=34`, and strict `3p<2a+1=137` gives `p<=45`.

For the padded tree, exact DP gives `n=92`, `a=68`, and `x=33`. Its eligible ranks are exactly `p=35,...,45`. The strict upper guard remains `3p<137`. The terminal zero-extended difference was checked as `Delta_a=-i_a<0` in both trees.

At every base eligible rank, all 67 original leaves are favorable. At every padded eligible rank, all 67 original leaves and the new leaf 91 are favorable. The attached edge changes no old leaf or support; it adds exactly the new leaf with support 0. `EVIDENCE.json` records, for every eligible rank, `Delta_p(T-v)` for every original leaf (and the new leaf when padded), the full favorable tag set, each selected summand with its original support, and the exact full sum. Therefore no selector or repeated-tag omission is hidden in the comparison.

## Exact aggregate results

The original positive local summand is the marked leaf's term `+212336130412243110` at `p=34`, with full sum `-498754180547001418536`. This is the supplied control reproduced by the pinned evaluator.

For the padded tree at every eligible rank `p=35,...,45`, the marked leaf remains selected but its local term is negative. The sequence of marked terms is

`(-212336130412243110, -600607911737487654, -889789498870352080, -1043699033810088656, -1059393756123022320, -962810849581892080, -796507157381383448, -605225888816998680, -424618798185894312, -275915087740492200, -166341153374650800)`.

The corresponding full sums are

`(-1385054486733687214684, -1900020604270788101575, -2115717975797519395049, -2053526405105798701837, -1789338575833081467601, -1420918152592968682631, -1037249829990671310013, -699754627589654663246, -437750405299345896868, -254483218709044259680, -137658965005642503754)`.

Every full sum is strictly negative. Since these are all integer ranks satisfying both guards for the padded tree, this exhausts the primary target's rank choices for this fixed padded tree. It does not establish an aggregate inequality outside this one tree.

## Reproduction and evidence grade

`EVIDENCE.json` is replayable using the exact recurrence above and `inputs/ordinary_tree_checked.py` (the evidence records its SHA-256). It stores coefficient vectors, terminal differences, the full rank interval, every leaf selector value, each summand, and each sum for base and padded trees. All arithmetic is integer arithmetic. No external theorem or literature is used.

This is a bounded exact computation for two fixed trees. It supports a proposed finite obstruction to using this specific root-leaf padding on this specific positive-fibre control. It does not prove a uniform obstruction for the padding operation as a family, a structural sign theorem, or the registered universal aggregate.

## Limitations

- Only `T_22` and the one-leaf attachment at its root were checked; no conclusion is made for longer pendant paths, other attachment vertices, or other trees.
- The favorable set was recalculated after attachment; the fixed-selector requirement is respected separately at each tree and rank.
- The marked positive term at the unpadded rank is not itself a counterexample because the complete sum is negative.
- No proof or refutation of `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` is obtained.
