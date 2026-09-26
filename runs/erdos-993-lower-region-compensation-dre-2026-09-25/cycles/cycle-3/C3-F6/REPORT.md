# C3-F6 search report — grafts and selector changes

## Target and result

The target is the lower-region primary aggregate for finite ordinary trees. For a tree `T`, rank `p`, first strict descent `x`, and `a=alpha(T)`, the guards are `x+2<=p` and `3p<2a+1`; the selected set is the fixed set of original leaves `v` with `Delta_p(T-v)<0`. I computed each selected leaf's original-support summand and the complete sum.

No positive full-sum witness was found. The bounded computation covers 985 eligible parameter/rank rows in the three families below: 254 root-graft rows, 254 support/claw-center-graft rows, and 477 two-core-gluing rows. Every row satisfies both guards and has `S<=0`. Rows are not quotiented by isomorphism, so these are parameter rows, not a count of distinct trees. The computations do not prove a sign for any unbounded family, much less for all trees.

## Graft families and exact scope

Let `T_m` have root `0`, one arm `0-1-2`, and `m` branches `0-c_i` where each `c_i` has three pendant leaves. The generator uses consecutive labels: `c_i=3+4i`, with leaves `c_i+1,c_i+2,c_i+3`.

1. **Root path grafts:** attach a pendant path of length `l=1..8` at root `0`; for each `m=0..8`, test both without and with one extra root-adjacent three-leaf branch. All integer ranks are checked, and a row is retained exactly when both primary guards hold.
2. **Marked-support / claw-center path grafts:** attach a pendant path of length `l=1..8` at vertex `1`, or at the first claw center `3` (the latter only when `m>=1`), for `m=0..8`. Again all ranks are checked against both guards.
3. **Two-core gluing:** take disjoint `T_m,T_k`, `m,k=0..6`, and join their roots by a path of length `l=1..4`; check all ranks and retain exactly the eligible rows.

The code computes independence polynomials by the exact rooted-tree recurrence: at a vertex, the polynomial when excluded is the product of each child's total polynomial, and when included is `z` times the product of each child's excluded polynomial. It recomputes the polynomials on `T-v`, `T-{v,s_v}`, and `T-N[s_v]`. For each retained row it records `i_j(T)` through the terminal zero-extension rank, `x` (including the terminal `Delta_alpha=-i_alpha`), `alpha`, every selected original leaf and support, its `Delta_p(T-v)`, its summand, and the full sum. All arithmetic is integer arithmetic.

Run `python3 F6_COMPUTE.py` from this worker directory to regenerate `F6_RESULTS.json`. The script and result file are the complete replay materials for this bounded computation.

## Fully displayed eligible row

Take `T_2` and graft a length-two path at the root. The edges are

`(0,1),(1,2),(0,3),(3,4),(3,5),(3,6),(0,7),(7,8),(7,9),(7,10),(0,11),(11,12)`.

The independence vector is `(1,13,66,174,265,248,149,56,12,1)`, so `a=9`. The first strict descent is `x=4`; in particular `Delta_4=248-265=-17`, while all earlier deltas are nonnegative. At `p=6`, `x+2=6<=p` and `3p=18<19=2a+1`.

The complete favorable set is `{2,4,5,6,8,9,10,12}`. The original support map is `2->1`, `{4,5,6}->3`, `{8,9,10}->7`, and `12->11`. The `Delta_6(T-v)` values in that order are `-52,-38,-38,-38,-38,-38,-38,-52`, so no selected leaf is omitted. The summands `Delta_5(T-{v,s_v})-Delta_5(T-N[s_v])` are `-14,-51,-51,-51,-51,-51,-51,-14`; hence the full sum is `-334`.

This row exhibits a guard-preserving graft that makes the lower-region question eligible and changes the tree's leaf/support structure. It does not provide a counterexample. The wider parameter sweep also found no positive aggregate, but I have not derived a closed formula or a proof for any unbounded graft family.

## Conclusion and gap

The assigned graft/gluing search found no eligible full-sum witness within the stated finite parameter bounds. It also did not prove a family obstruction: the current evidence is exact finite computation over the listed parameter ranges only. The primary universal lower-region assertion remains unresolved by this route. No external theorem was imported, and no conclusion is drawn from the bounded sweep about trees outside these families or beyond the stated parameter bounds.
