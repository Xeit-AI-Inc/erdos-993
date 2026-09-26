# C4-CT-F5 critique of C4-F5 (orientation T)

## Scope and disposition

I reviewed both claims in the assigned C4-F5 return. `C4-F5-TM-EXACT-BOUNDED-CHECKS` is **retained** at its stated finite scope. The exact polynomial replay reproduces the source evidence byte for byte, the separate edge based evaluator replay reproduces its cross-check evidence byte for byte, and a literal subset audit independently agrees for the first three family members. `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE` is **retained** as a proposed open claim restricted to the path plus m three leaf branches family. Its scope and the route's open status are accurate; its evidence does not prove or refute the assertion for all m.

No positive complete aggregate or imported theorem is supplied. The conclusion is family specific and cannot establish the registered ordinary tree aggregate.

## Formula and domain audit

For the stated graph, write `L=1+z` and `B=L^3+z=1+4z+3z^2+z^3`. The path core has independent polynomial `1+2z` when vertex 0 is absent. When 0 is chosen, endpoint 2 remains available and all 3m branch tips are free, giving `z L^(3m+1)`. Thus

`P_m=(1+2z)B^m+zL^(3m+1)` and `alpha=3m+2`.

The endpoint-deleted polynomial is `P_e=L B^m+zL^(3m)`. Deleting a branch tip leaves branch factor `L^2+z=1+3z+z^2`, so

`P_c=(1+2z)(1+3z+z^2)B^(m-1)+zL^(3m)`.

For an endpoint tag, `I(H)-I(R)=q_e=zL^(3m)`. For any one of the 3m distinct branch-tip tags, deleting its support leaves the other two same-branch tips isolated in H; deleting the support's closed neighborhood also deletes 0 and all three tips. Therefore

`q_c=(1+2z)(L^2-1)B^(m-1)+zL^(3m) = z(2+z)(1+2z)B^(m-1)+zL^(3m)`.

This preserves each tip as its own summand even though all 3m tips share a support. At rank p, each orbit is included only when its own deletion polynomial has strict negative `Delta_p`; the full sum then is the endpoint term plus 3m times the common tip term if selected. That is the correct fixed original-tree selector and support convention.

The first descent search scans `j=0..alpha`, evaluating `Delta_alpha` with zero extension at `alpha+1`. Eligible p are filtered by both `p>=x+2` and strict `3p<2alpha+1`; the arithmetic checks do not replace either guard. The route's expression for both selected orbits also checks algebraically: `q_e+3m q_c=P'_m-2B^m-4m(1+2z)B^(m-1)-L^(3m+1)`. This identity is a reduction, not a sign proof. No orbit-selection proof for all m or uniform adjacent-coefficient estimate is furnished.

## Independent replay and checks

All 185 source files listed across the case and common packets matched their listed SHA-256 values. I replayed copies of the assigned computation and graph cross-check in this scratch directory; the generated `EVIDENCE.json` and `GRAPH-CROSSCHECK.json` match the sealed source evidence byte for byte. The bounded replay gives 2,743 eligible T_m rows for m=1..100, 347 equal-arm rows, and 400 lopsided rows, with zero positive complete sums in each stated range. The edge based graph-DP cross-check reports 100 eligible T_m rows for m=1..20 and 52 lopsided rows in its narrower parameter range, again with zero positive sums.

Separately, `INDEPENDENT-ENUM.py` builds the original edge list and enumerates literal vertex subsets for T_m, m=1,2,3 (orders 7, 11, 15). It reconstructs all original degree-one vertices, their unique supports, each deletion polynomial, the first descent including terminal zero extension, selector membership, and each complete sum. It finds 0, 0, and 1 eligible rows respectively; the m=3 row has p=7, ten distinct favorable leaves, and S=-1167. It is an independent tractable check, not a proof for larger m.

## Limitations

The coefficient identity does not control the adjacent coefficient difference throughout the eligible interval. Finite computation through m=100 and the stated finite variants does not imply the all-parameter family assertion. The family result does not cover arbitrary ordinary trees. No formal verification or authoritative status is claimed.
