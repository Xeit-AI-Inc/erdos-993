# Transfer targets to separate in Cycle4

Controller proposal, no proof award. With k=p-1, Q=sum q_v(k), U=sum q_v(k+1), C=count of multiply marked upper objects, E=kU+C, the exact target is E-C<=kQ. The following strictly stronger sufficient bridges should be kept distinct:
1. CT_x: E<=mu_x Q, with mu_x=(x+1)i_(x+1)/i_x<x+1.
2. Flat descent budget: E<=(x+1)Q. Since x+1<=k this is sufficient, without needing the exact first-descent coefficient ratio.
3. Current-rank extension budget: E<=kQ. This is also sufficient but stronger than the target when C>0.
A counterexample to a stronger bridge must report E,Q,C,U, both guards, the exact fixed selector and S; it is not a counterexample to the weaker bridge or aggregate. CT_x and the flat budget are new conditions requiring independent evidence; their conditional implications are elementary. For Q=0, marked-shadow incidence with k>=2 gives U=C=E=0.

The same-rank shortcut E/Q<=mu_p is already false; see SAME-TREE-COVARIANCE-REFORMULATION.md. Do not silently impose unweighted ratio monotonicity. Broad coupling, capacity-flow, martingale or generating-function approaches are welcome, but supply an exact lemma with hypotheses rather than a qualitative analogy.
