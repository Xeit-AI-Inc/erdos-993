# C5-CU-T3 independent critique (orientation U)

## Disposition

**C5-T3-MATCHING-ONLY-SLACK-OBSTRUCTION — retained_narrowed.** The exact per-set counterexample and the general matching-partition identity are correct after correcting the producer's matching-category arithmetic. The claim is retained only as an obstruction to the proposed matching-size-only sufficient bound. It is not evidence for or against the registered selected aggregate.

## Independent check

For the stated tree, the original leaves are `v,w,y1,y2`, and the support of `v` is `s`. Deleting `{v,s}` leaves `H` with isolated vertex `w` and edges `zy1,zy2`; hence `W=N_T(s)\\{v}={w,z}` and `alpha(H)=3`. At `k=1`, `A={w}` is marked and independent. The three vertices `z,y1,y2` are all addable to `A`, so `e(A)=3`. With `r=h-k=2` and `nu(H)=1`, the actual slack is `2r-e=1`, while the proposed bound `2(r-nu(H))` is `2`. Thus the stated matching-only lower bound is false for a realizable original-leaf deletion configuration.

The producer's exact example categories are erroneous. For either maximum matching `{z,y1}` or `{z,y2}`, both matching endpoints are in the addable set `J_A={z,y1,y2}`. Taking `M={z,y1}` gives `(m2,m1,m0,u)=(1,0,0,1)`, not `(0,0,1,3)`. The identity then gives `2(2-1)+2(0)+0-1=1`, agreeing with the direct slack. The general identity itself is correct: partition the matching edges by how many endpoints lie in `J_A`, and let `u` count unmatched vertices in `J_A`; then `e=2m2+m1+u` and `nu=m2+m1+m0`, which algebraically yields the displayed decomposition.

The tree independence counts independently check as `(1,6,10,6,1)`: there are six singletons, ten nonedges for pairs, six independent triples, and one independent 4-set. Therefore `a=4`, `Delta_0=5`, `Delta_1=4`, and `Delta_2=-4`, so `x=2`. At `p=2`, `x+2<=p` fails, but the strict guard holds: `3p=6<9=2a+1`. The producer incorrectly says both guards fail. Since the conjunction of primary eligibility fails at the early-descent condition, this example is outside the primary domain and says nothing about its `S(T,p)`.

## Scope, usefulness, and limitations

The corrected witness defeats a particular pointwise sufficient bound based only on ambient maximum matching size. The `-u(A)` term is adverse and cannot be discarded; the exact decomposition does not control its aggregate over selected tags or compensate it with multiply marked-set counts `C`. No global budget, selected-sum sign, or primary refutation follows. No literature or exhaustive search was used. Full recalculation is recorded in `EVIDENCE.json`.
