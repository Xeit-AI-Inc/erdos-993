# C2-U5 report: pendant extension and selector stability

## Route and result

I studied the named operation `T -> T^+(u)`: extend an existing original leaf `u` by one edge, adding a new leaf `w` adjacent to `u`. The operation does not preserve the complete selected sum, even on a pair where the same rank satisfies the primary lower-region guards before and after. The recurrences below give exact conditional checks for the first descent, each surviving leaf's strict selector, the new leaf, and all affected summands. The checked example is an obstruction to treating the old aggregate or old leaf tags as unchanged under this extension; it is not a counterexample to the target inequality.

## Exact recurrence

Write `P_G(z)=I(G;z)` and `P=P_T`. For any forest `G` containing `u`, adding the pendant vertex at `u` changes its polynomial to `P_G+zP_{G-u}`. If the new vertex survives an induced deletion but `u` does not, it is isolated and the polynomial is `(1+z)P_G`; if the new vertex itself is deleted, the polynomial remains `P_G`. Therefore

`P_{T^+}=P+zP_{T-u}`, and `alpha(T^+)=max(alpha(T),1+alpha(T-u))`.

The old leaf `u` ceases to be a leaf; every other old leaf remains a leaf with its original support. The new leaf `w` has support `u`. The new leaf is favorable exactly when `Delta_p(T)<0`, since `T^+-w=T`. For each other old leaf `v`, `u` remains in `T-v`, so `v` is favorable after extension exactly when

`Delta_p(P_{T-v}+zP_{(T-v)-u})<0`.

Consequently, exactly,

`F(T^+,p) = {v in L(T) minus {u}: Delta_p(P_{T-v}+zP_{(T-v)-u})<0} union ({w} if Delta_p(P_T)<0, else empty)`.

This tests every surviving original leaf individually; equal supports do not merge tags. For a surviving old leaf `v` with support `s`, put `H=T-{v,s}` and `R=T-N_T[s]`. In `H^+=T^+-{v,s}`, the graft vertex survives: its polynomial is `P_H+zP_{H-u}` if `u in H`, and `(1+z)P_H` otherwise. In `R^+=T^+-N_{T^+}[s]`, the polynomial is `P_R+zP_{R-u}` if `u in R`; it is `(1+z)P_R` if `u` survives outside `R` (then the new vertex is isolated after deletion); and it is `P_R` if `u=s`, so the new leaf is deleted with the expanded closed neighborhood. These formulas give the exact changed old summand `Delta_{p-1}(H^+)-Delta_{p-1}(R^+)`.

For the new leaf, its `H` graph is `T-u`, and its `R` graph is `T-N_T[u]`. Its summand is `Delta_{p-1}(T-u)-Delta_{p-1}(T-N_T[u])`. The extended first descent is the first `j>=0` for which `Delta_j(P+zP_{T-u})<0`, with zero extension through the terminal rank. Thus a valid minimal-counterexample argument using this extension must separately verify the new `x`, both rank guards, the strict signs for all surviving old leaves, the new leaf's strict sign, and the full sum of transformed summands with all support tags retained. No one of these checks follows just from the operation.

## Exact obstruction example

Evidence gives a fully encoded 18-vertex tree `T` and its extension at old leaf `u=10`, producing `T^+` on 19 vertices, at rank `p=8`. Both have `x=6`; their independence numbers are 12. Both satisfy `x+2<=p` and `3p<2alpha+1` (`8<=8`, `24<25`). In `T`, all 12 leaves are favorable. In `T^+`, old leaf 10 has become internal, all 11 other old leaves remain favorable, and the new leaf 18 is favorable. The support fiber at old support 2 consequently loses tag 10, while a new support fiber at 10 gains tag 18. The complete selected sum changes from `-4256` to `-6267`.

The example demonstrates that even with eligibility preserved, extension changes the selected tagged family and its aggregate. It does not show a positive sum or a sign reversal; both sums remain negative.

## Conclusion and limitations

The recurrence provides a conditional stability test for pendant extension, and the example rules out carrying the aggregate or exact original-leaf tags through this operation without recomputation. I did not prove a class-wide sign theorem, a guard-preserving inverse reduction, or the primary universal assertion, and I found no positive full-sum witness. The computation is one exact tree pair, not a census.
